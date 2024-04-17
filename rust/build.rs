use std::env;

use lib_flutter_rust_bridge_codegen::{
    config_parse, frb_codegen, get_symbols_if_no_duplicates, RawOpts,
};

fn main() {
    env::set_var("RUST_BACKTRACE", "1");
    // Options for frb_codegen are read from the config file
    let raw_opts = RawOpts::try_parse_args_or_yaml().unwrap();

    // get opts from raw opts
    let all_configs = config_parse(raw_opts);

    // generation of rust api for ffi (single block)
    let all_symbols = get_symbols_if_no_duplicates(&all_configs).unwrap();
    // assert_eq!(all_configs.len(), 1);
    frb_codegen(&all_configs[0], &all_symbols).unwrap();
}
