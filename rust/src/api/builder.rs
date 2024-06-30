use crate::api::node::LdkNode;
use crate::api::types::{
    ChainDataSourceConfig, Config, EntropySourceConfig, GossipSourceConfig, LiquiditySourceConfig,
};
use crate::frb_generated::RustOpaque;
use crate::utils::error::LdkBuilderError;
use flutter_rust_bridge::frb;
use ldk_node::lightning::util::ser::Writeable;
use std::str::FromStr;

#[derive(Debug, Clone)]
pub struct LdkMnemonic {
    pub seed_phrase: String,
}

impl TryFrom<LdkMnemonic> for ldk_node::bip39::Mnemonic {
    type Error = LdkBuilderError;

    fn try_from(value: LdkMnemonic) -> Result<Self, Self::Error> {
        ldk_node::bip39::Mnemonic::from_str(&value.seed_phrase).map_err(|e| e.into())
    }
}
impl From<ldk_node::bip39::Mnemonic> for LdkMnemonic {
    fn from(value: ldk_node::bip39::Mnemonic) -> Self {
        LdkMnemonic {
            seed_phrase: value.to_string(),
        }
    }
}
impl LdkMnemonic {
    pub fn generate() -> LdkMnemonic {
        ldk_node::generate_entropy_mnemonic().into()
    }
}

#[frb(opaque)]
pub struct NodeBuilder {
    pub builder: RustOpaque<ldk_node::Builder>,
}

impl NodeBuilder {
    pub fn create_builder(
        config: Config,
        chain_data_source_config: Option<ChainDataSourceConfig>,
        entropy_source_config: Option<EntropySourceConfig>,
        gossip_source_config: Option<GossipSourceConfig>,
        liquidity_source_config: Option<LiquiditySourceConfig>,
    ) -> Result<NodeBuilder, LdkBuilderError> {
        let mut builder = ldk_node::Builder::from_config(config.try_into()?);
        if let Some(source) = entropy_source_config {
            match source {
                EntropySourceConfig::SeedFile(e) => builder.set_entropy_seed_path(e),
                EntropySourceConfig::SeedBytes(e) => builder.set_entropy_seed_bytes(e.encode())?,
                EntropySourceConfig::Bip39Mnemonic {
                    mnemonic,
                    passphrase,
                } => builder.set_entropy_bip39_mnemonic(
                    <LdkMnemonic as TryInto<ldk_node::bip39::Mnemonic>>::try_into(mnemonic)?,
                    passphrase,
                ),
            };
        }
        if let Some(source) = chain_data_source_config {
            match source {
                ChainDataSourceConfig::Esplora(e) => builder.set_esplora_server(e),
            };
        }
        if let Some(source) = gossip_source_config {
            match source {
                GossipSourceConfig::P2PNetwork => builder.set_gossip_source_p2p(),
                GossipSourceConfig::RapidGossipSync(e) => builder.set_gossip_source_rgs(e),
            };
        }
        if let Some(liquidity) = liquidity_source_config {
            builder.set_liquidity_source_lsps2(
                liquidity.lsps2_service.0.try_into()?,
                liquidity
                    .lsps2_service
                    .1
                    .try_into()
                    .map_err(|_| LdkBuilderError::InvalidPublicKey)?,
                liquidity.lsps2_service.2,
            );
        }
        Ok(NodeBuilder {
            builder: RustOpaque::new(builder),
        })
    }
    pub fn build(self) -> anyhow::Result<LdkNode, LdkBuilderError> {
        match self.builder.build() {
            Ok(e) => Ok(LdkNode {
                ptr: RustOpaque::new(e),
            }),
            Err(e) => Err(e.into()),
        }
    }
    pub fn build_with_fs_store(self) -> anyhow::Result<LdkNode, LdkBuilderError> {
        match self.builder.build_with_fs_store() {
            Ok(e) => Ok(LdkNode {
                ptr: RustOpaque::new(e),
            }),
            Err(e) => Err(e.into()),
        }
    }
    // fn build_with_store(
    //     self
    // ) -> anyhow::Result<LdkNode,BuilderException> {
    //     match self.builder.build_with_store(Arc::new(())) {
    //         Ok(e) => Ok(LdkNode {
    //             ptr: RustOpaque::new(e),
    //         }),
    //         Err(e) => Err(e.into()),
    //     }
    // }
}

// pub fn build_with_vss_store(
//     self, url: String, store_id: String
// ) -> anyhow::Result<LdkNode, LdkBuilderError> {
//     match self.builder.build_with_vss_store(url, store_id) {
//         Ok(e) => Ok(LdkNode {
//             ptr: RustOpaque::new(e),
//         }),
//         Err(e) => Err(e.into()),
//     }
// }
