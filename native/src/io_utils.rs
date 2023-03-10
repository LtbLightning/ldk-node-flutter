use lightning::routing::scoring::{ProbabilisticScorer, ProbabilisticScoringParameters};
use lightning::util::ser::ReadableArgs;

use rand::{thread_rng, RngCore};

use crate::error::Error;
use crate::ffi::{Config, NetworkGraph, Scorer};
use crate::logger::FilesystemLogger;
use std::fs;
use std::io::{BufReader, Write};
use std::path::Path;
use std::sync::Arc;

pub(crate) fn read_or_generate_seed_file(config: Arc<Config>) -> [u8; 32] {
    let keys_seed_path = format!("{}/keys_seed", config.storage_dir_path);
    let keys_seed = if Path::new(&keys_seed_path).exists() {
        let seed = fs::read(keys_seed_path.clone()).expect("Failed to read keys seed file");
        assert_eq!(seed.len(), 32);
        let mut key = [0; 32];
        key.copy_from_slice(&seed);
        key
    } else {
        let mut key = [0; 32];
        thread_rng().fill_bytes(&mut key);

        let mut f =
            fs::File::create(keys_seed_path.clone()).expect("Failed to create keys seed file");
        f.write_all(&key)
            .expect("Failed to write node keys seed to disk");
        f.sync_all().expect("Failed to sync node keys seed to disk");
        key
    };

    keys_seed
}

pub(crate) fn read_network_graph(
    config: Arc<Config>,
    logger: Arc<FilesystemLogger>,
) -> Result<NetworkGraph, Error> {
    let ldk_data_dir = format!("{}/ldk", &config.storage_dir_path.clone());
    let network_graph_path = format!("{}/network_graph", ldk_data_dir.clone());

    if let Ok(file) = fs::File::open(network_graph_path) {
        if let Ok(graph) = NetworkGraph::read(&mut BufReader::new(file), Arc::clone(&logger)) {
            return Ok(graph);
        }
    }

    let genesis_hash = bitcoin::blockdata::constants::genesis_block(config.network)
        .header
        .block_hash();
    Ok(NetworkGraph::new(genesis_hash, logger))
}

pub(crate) fn read_scorer(
    config: Arc<Config>,
    network_graph: Arc<NetworkGraph>,
    logger: Arc<FilesystemLogger>,
) -> Scorer {
    let ldk_data_dir = format!("{}/ldk", &config.storage_dir_path.clone());
    let scorer_path = format!("{}/scorer", ldk_data_dir.clone());

    let params = ProbabilisticScoringParameters::default();
    if let Ok(file) = fs::File::open(scorer_path) {
        let args = (
            params.clone(),
            Arc::clone(&network_graph),
            Arc::clone(&logger),
        );
        if let Ok(scorer) = ProbabilisticScorer::read(&mut BufReader::new(file), args) {
            return scorer;
        }
    }
    ProbabilisticScorer::new(params, network_graph, logger)
}
