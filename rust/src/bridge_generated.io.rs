use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_generate_entropy_mnemonic(port_: i64) {
    wire_generate_entropy_mnemonic_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_build_sqlite_node(
    port_: i64,
    config: *mut wire_Config,
    chain_data_source_config: *mut wire_ChainDataSourceConfig,
    entropy_source_config: *mut wire_EntropySourceConfig,
    gossip_source_config: *mut wire_GossipSourceConfig,
) {
    wire_build_sqlite_node_impl(
        port_,
        config,
        chain_data_source_config,
        entropy_source_config,
        gossip_source_config,
    )
}

#[no_mangle]
pub extern "C" fn wire_start__method__NodePointer(port_: i64, that: *mut wire_NodePointer) {
    wire_start__method__NodePointer_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_stop__method__NodePointer(port_: i64, that: *mut wire_NodePointer) {
    wire_stop__method__NodePointer_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_event_handled__method__NodePointer(port_: i64, that: *mut wire_NodePointer) {
    wire_event_handled__method__NodePointer_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_next_event__method__NodePointer(port_: i64, that: *mut wire_NodePointer) {
    wire_next_event__method__NodePointer_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_wait_until_next_event__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
) {
    wire_wait_until_next_event__method__NodePointer_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_node_id__method__NodePointer(port_: i64, that: *mut wire_NodePointer) {
    wire_node_id__method__NodePointer_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_listening_addresses__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
) {
    wire_listening_addresses__method__NodePointer_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_new_onchain_address__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
) {
    wire_new_onchain_address__method__NodePointer_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_spendable_onchain_balance_sats__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
) {
    wire_spendable_onchain_balance_sats__method__NodePointer_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_total_onchain_balance_sats__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
) {
    wire_total_onchain_balance_sats__method__NodePointer_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_send_to_onchain_address__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
    address: *mut wire_Address,
    amount_sats: u64,
) {
    wire_send_to_onchain_address__method__NodePointer_impl(port_, that, address, amount_sats)
}

#[no_mangle]
pub extern "C" fn wire_send_all_to_onchain_address__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
    address: *mut wire_Address,
) {
    wire_send_all_to_onchain_address__method__NodePointer_impl(port_, that, address)
}

#[no_mangle]
pub extern "C" fn wire_list_channels__method__NodePointer(port_: i64, that: *mut wire_NodePointer) {
    wire_list_channels__method__NodePointer_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_connect__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
    node_id: *mut wire_PublicKey,
    address: *mut wire_SocketAddress,
    persist: bool,
) {
    wire_connect__method__NodePointer_impl(port_, that, node_id, address, persist)
}

#[no_mangle]
pub extern "C" fn wire_disconnect__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
    counterparty_node_id: *mut wire_PublicKey,
) {
    wire_disconnect__method__NodePointer_impl(port_, that, counterparty_node_id)
}

#[no_mangle]
pub extern "C" fn wire_connect_open_channel__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
    address: *mut wire_SocketAddress,
    node_id: *mut wire_PublicKey,
    channel_amount_sats: u64,
    push_to_counterparty_msat: *mut u64,
    announce_channel: bool,
    channel_config: *mut wire_ChannelConfig,
) {
    wire_connect_open_channel__method__NodePointer_impl(
        port_,
        that,
        address,
        node_id,
        channel_amount_sats,
        push_to_counterparty_msat,
        announce_channel,
        channel_config,
    )
}

#[no_mangle]
pub extern "C" fn wire_sync_wallets__method__NodePointer(port_: i64, that: *mut wire_NodePointer) {
    wire_sync_wallets__method__NodePointer_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_close_channel__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
    channel_id: *mut wire_ChannelId,
    counterparty_node_id: *mut wire_PublicKey,
) {
    wire_close_channel__method__NodePointer_impl(port_, that, channel_id, counterparty_node_id)
}

#[no_mangle]
pub extern "C" fn wire_update_channel_config__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
    channel_id: *mut wire_ChannelId,
    counterparty_node_id: *mut wire_PublicKey,
    channel_config: *mut wire_ChannelConfig,
) {
    wire_update_channel_config__method__NodePointer_impl(
        port_,
        that,
        channel_id,
        counterparty_node_id,
        channel_config,
    )
}

#[no_mangle]
pub extern "C" fn wire_send_payment__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
    invoice: *mut wire_Bolt11Invoice,
) {
    wire_send_payment__method__NodePointer_impl(port_, that, invoice)
}

#[no_mangle]
pub extern "C" fn wire_send_payment_using_amount__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
    invoice: *mut wire_Bolt11Invoice,
    amount_msat: u64,
) {
    wire_send_payment_using_amount__method__NodePointer_impl(port_, that, invoice, amount_msat)
}

#[no_mangle]
pub extern "C" fn wire_send_spontaneous_payment__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
    amount_msat: u64,
    node_id: *mut wire_PublicKey,
) {
    wire_send_spontaneous_payment__method__NodePointer_impl(port_, that, amount_msat, node_id)
}

#[no_mangle]
pub extern "C" fn wire_send_payment_probes__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
    invoice: *mut wire_Bolt11Invoice,
) {
    wire_send_payment_probes__method__NodePointer_impl(port_, that, invoice)
}

#[no_mangle]
pub extern "C" fn wire_send_spontaneous_payment_probes__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
    amount_msat: u64,
    node_id: *mut wire_PublicKey,
) {
    wire_send_spontaneous_payment_probes__method__NodePointer_impl(
        port_,
        that,
        amount_msat,
        node_id,
    )
}

#[no_mangle]
pub extern "C" fn wire_receive_payment__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
    amount_msat: u64,
    description: *mut wire_uint_8_list,
    expiry_secs: u32,
) {
    wire_receive_payment__method__NodePointer_impl(
        port_,
        that,
        amount_msat,
        description,
        expiry_secs,
    )
}

#[no_mangle]
pub extern "C" fn wire_receive_variable_amount_payment__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
    description: *mut wire_uint_8_list,
    expiry_secs: u32,
) {
    wire_receive_variable_amount_payment__method__NodePointer_impl(
        port_,
        that,
        description,
        expiry_secs,
    )
}

#[no_mangle]
pub extern "C" fn wire_payment__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
    payment_hash: *mut wire_PaymentHash,
) {
    wire_payment__method__NodePointer_impl(port_, that, payment_hash)
}

#[no_mangle]
pub extern "C" fn wire_remove_payment__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
    payment_hash: *mut wire_PaymentHash,
) {
    wire_remove_payment__method__NodePointer_impl(port_, that, payment_hash)
}

#[no_mangle]
pub extern "C" fn wire_list_payments_with_filter__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
    payment_direction: i32,
) {
    wire_list_payments_with_filter__method__NodePointer_impl(port_, that, payment_direction)
}

#[no_mangle]
pub extern "C" fn wire_list_payments__method__NodePointer(port_: i64, that: *mut wire_NodePointer) {
    wire_list_payments__method__NodePointer_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_list_peers__method__NodePointer(port_: i64, that: *mut wire_NodePointer) {
    wire_list_peers__method__NodePointer_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_sign_message__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
    msg: *mut wire_uint_8_list,
) {
    wire_sign_message__method__NodePointer_impl(port_, that, msg)
}

#[no_mangle]
pub extern "C" fn wire_verify_signature__method__NodePointer(
    port_: i64,
    that: *mut wire_NodePointer,
    msg: *mut wire_uint_8_list,
    sig: *mut wire_uint_8_list,
    pkey: *mut wire_PublicKey,
) {
    wire_verify_signature__method__NodePointer_impl(port_, that, msg, sig, pkey)
}

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_MutexNodeSqliteStore() -> wire_MutexNodeSqliteStore {
    wire_MutexNodeSqliteStore::new_with_null_ptr()
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_address_0() -> *mut wire_Address {
    support::new_leak_box_ptr(wire_Address::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_bolt_11_invoice_0() -> *mut wire_Bolt11Invoice {
    support::new_leak_box_ptr(wire_Bolt11Invoice::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_chain_data_source_config_0() -> *mut wire_ChainDataSourceConfig {
    support::new_leak_box_ptr(wire_ChainDataSourceConfig::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_channel_config_0() -> *mut wire_ChannelConfig {
    support::new_leak_box_ptr(wire_ChannelConfig::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_channel_id_0() -> *mut wire_ChannelId {
    support::new_leak_box_ptr(wire_ChannelId::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_config_0() -> *mut wire_Config {
    support::new_leak_box_ptr(wire_Config::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_entropy_source_config_0() -> *mut wire_EntropySourceConfig {
    support::new_leak_box_ptr(wire_EntropySourceConfig::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_gossip_source_config_0() -> *mut wire_GossipSourceConfig {
    support::new_leak_box_ptr(wire_GossipSourceConfig::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_hostname_0() -> *mut wire_Hostname {
    support::new_leak_box_ptr(wire_Hostname::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_mnemonic_0() -> *mut wire_Mnemonic {
    support::new_leak_box_ptr(wire_Mnemonic::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_node_pointer_0() -> *mut wire_NodePointer {
    support::new_leak_box_ptr(wire_NodePointer::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_payment_hash_0() -> *mut wire_PaymentHash {
    support::new_leak_box_ptr(wire_PaymentHash::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_public_key_0() -> *mut wire_PublicKey {
    support::new_leak_box_ptr(wire_PublicKey::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_socket_address_0() -> *mut wire_SocketAddress {
    support::new_leak_box_ptr(wire_SocketAddress::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_u64_0(value: u64) -> *mut u64 {
    support::new_leak_box_ptr(value)
}

#[no_mangle]
pub extern "C" fn new_list_public_key_0(len: i32) -> *mut wire_list_public_key {
    let wrap = wire_list_public_key {
        ptr: support::new_leak_vec_ptr(<wire_PublicKey>::new_with_null_ptr(), len),
        len,
    };
    support::new_leak_box_ptr(wrap)
}

#[no_mangle]
pub extern "C" fn new_list_socket_address_0(len: i32) -> *mut wire_list_socket_address {
    let wrap = wire_list_socket_address {
        ptr: support::new_leak_vec_ptr(<wire_SocketAddress>::new_with_null_ptr(), len),
        len,
    };
    support::new_leak_box_ptr(wrap)
}

#[no_mangle]
pub extern "C" fn new_uint_8_list_0(len: i32) -> *mut wire_uint_8_list {
    let ans = wire_uint_8_list {
        ptr: support::new_leak_vec_ptr(Default::default(), len),
        len,
    };
    support::new_leak_box_ptr(ans)
}

// Section: related functions

#[no_mangle]
pub extern "C" fn drop_opaque_MutexNodeSqliteStore(ptr: *const c_void) {
    unsafe {
        Arc::<Mutex<Node<SqliteStore>>>::decrement_strong_count(ptr as _);
    }
}

#[no_mangle]
pub extern "C" fn share_opaque_MutexNodeSqliteStore(ptr: *const c_void) -> *const c_void {
    unsafe {
        Arc::<Mutex<Node<SqliteStore>>>::increment_strong_count(ptr as _);
        ptr
    }
}

// Section: impl Wire2Api

impl Wire2Api<RustOpaque<Mutex<Node<SqliteStore>>>> for wire_MutexNodeSqliteStore {
    fn wire2api(self) -> RustOpaque<Mutex<Node<SqliteStore>>> {
        unsafe { support::opaque_from_dart(self.ptr as _) }
    }
}
impl Wire2Api<String> for *mut wire_uint_8_list {
    fn wire2api(self) -> String {
        let vec: Vec<u8> = self.wire2api();
        String::from_utf8_lossy(&vec).into_owned()
    }
}
impl Wire2Api<Address> for wire_Address {
    fn wire2api(self) -> Address {
        Address {
            internal: self.internal.wire2api(),
        }
    }
}
impl Wire2Api<Bolt11Invoice> for wire_Bolt11Invoice {
    fn wire2api(self) -> Bolt11Invoice {
        Bolt11Invoice {
            internal: self.internal.wire2api(),
        }
    }
}

impl Wire2Api<Address> for *mut wire_Address {
    fn wire2api(self) -> Address {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<Address>::wire2api(*wrap).into()
    }
}
impl Wire2Api<Bolt11Invoice> for *mut wire_Bolt11Invoice {
    fn wire2api(self) -> Bolt11Invoice {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<Bolt11Invoice>::wire2api(*wrap).into()
    }
}
impl Wire2Api<ChainDataSourceConfig> for *mut wire_ChainDataSourceConfig {
    fn wire2api(self) -> ChainDataSourceConfig {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<ChainDataSourceConfig>::wire2api(*wrap).into()
    }
}
impl Wire2Api<ChannelConfig> for *mut wire_ChannelConfig {
    fn wire2api(self) -> ChannelConfig {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<ChannelConfig>::wire2api(*wrap).into()
    }
}
impl Wire2Api<ChannelId> for *mut wire_ChannelId {
    fn wire2api(self) -> ChannelId {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<ChannelId>::wire2api(*wrap).into()
    }
}
impl Wire2Api<Config> for *mut wire_Config {
    fn wire2api(self) -> Config {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<Config>::wire2api(*wrap).into()
    }
}
impl Wire2Api<EntropySourceConfig> for *mut wire_EntropySourceConfig {
    fn wire2api(self) -> EntropySourceConfig {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<EntropySourceConfig>::wire2api(*wrap).into()
    }
}
impl Wire2Api<GossipSourceConfig> for *mut wire_GossipSourceConfig {
    fn wire2api(self) -> GossipSourceConfig {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<GossipSourceConfig>::wire2api(*wrap).into()
    }
}
impl Wire2Api<Hostname> for *mut wire_Hostname {
    fn wire2api(self) -> Hostname {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<Hostname>::wire2api(*wrap).into()
    }
}
impl Wire2Api<Mnemonic> for *mut wire_Mnemonic {
    fn wire2api(self) -> Mnemonic {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<Mnemonic>::wire2api(*wrap).into()
    }
}
impl Wire2Api<NodePointer> for *mut wire_NodePointer {
    fn wire2api(self) -> NodePointer {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<NodePointer>::wire2api(*wrap).into()
    }
}
impl Wire2Api<PaymentHash> for *mut wire_PaymentHash {
    fn wire2api(self) -> PaymentHash {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<PaymentHash>::wire2api(*wrap).into()
    }
}
impl Wire2Api<PublicKey> for *mut wire_PublicKey {
    fn wire2api(self) -> PublicKey {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<PublicKey>::wire2api(*wrap).into()
    }
}
impl Wire2Api<SocketAddress> for *mut wire_SocketAddress {
    fn wire2api(self) -> SocketAddress {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<SocketAddress>::wire2api(*wrap).into()
    }
}
impl Wire2Api<u64> for *mut u64 {
    fn wire2api(self) -> u64 {
        unsafe { *support::box_from_leak_ptr(self) }
    }
}
impl Wire2Api<ChainDataSourceConfig> for wire_ChainDataSourceConfig {
    fn wire2api(self) -> ChainDataSourceConfig {
        match self.tag {
            0 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.Esplora);
                ChainDataSourceConfig::Esplora(ans.field0.wire2api())
            },
            _ => unreachable!(),
        }
    }
}
impl Wire2Api<ChannelConfig> for wire_ChannelConfig {
    fn wire2api(self) -> ChannelConfig {
        ChannelConfig {
            forwarding_fee_proportional_millionths: self
                .forwarding_fee_proportional_millionths
                .wire2api(),
            forwarding_fee_base_msat: self.forwarding_fee_base_msat.wire2api(),
            cltv_expiry_delta: self.cltv_expiry_delta.wire2api(),
            max_dust_htlc_exposure: self.max_dust_htlc_exposure.wire2api(),
            force_close_avoidance_max_fee_satoshis: self
                .force_close_avoidance_max_fee_satoshis
                .wire2api(),
            accept_underpaying_htlcs: self.accept_underpaying_htlcs.wire2api(),
        }
    }
}
impl Wire2Api<ChannelId> for wire_ChannelId {
    fn wire2api(self) -> ChannelId {
        ChannelId {
            internal: self.internal.wire2api(),
        }
    }
}
impl Wire2Api<Config> for wire_Config {
    fn wire2api(self) -> Config {
        Config {
            storage_dir_path: self.storage_dir_path.wire2api(),
            log_dir_path: self.log_dir_path.wire2api(),
            network: self.network.wire2api(),
            listening_addresses: self.listening_addresses.wire2api(),
            default_cltv_expiry_delta: self.default_cltv_expiry_delta.wire2api(),
            onchain_wallet_sync_interval_secs: self.onchain_wallet_sync_interval_secs.wire2api(),
            wallet_sync_interval_secs: self.wallet_sync_interval_secs.wire2api(),
            fee_rate_cache_update_interval_secs: self
                .fee_rate_cache_update_interval_secs
                .wire2api(),
            trusted_peers_0conf: self.trusted_peers_0conf.wire2api(),
            probing_liquidity_limit_multiplier: self.probing_liquidity_limit_multiplier.wire2api(),
            log_level: self.log_level.wire2api(),
        }
    }
}
impl Wire2Api<EntropySourceConfig> for wire_EntropySourceConfig {
    fn wire2api(self) -> EntropySourceConfig {
        match self.tag {
            0 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.SeedFile);
                EntropySourceConfig::SeedFile(ans.field0.wire2api())
            },
            1 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.SeedBytes);
                EntropySourceConfig::SeedBytes(ans.field0.wire2api())
            },
            2 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.Bip39Mnemonic);
                EntropySourceConfig::Bip39Mnemonic {
                    mnemonic: ans.mnemonic.wire2api(),
                    passphrase: ans.passphrase.wire2api(),
                }
            },
            _ => unreachable!(),
        }
    }
}
impl Wire2Api<GossipSourceConfig> for wire_GossipSourceConfig {
    fn wire2api(self) -> GossipSourceConfig {
        match self.tag {
            0 => GossipSourceConfig::P2PNetwork,
            1 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.RapidGossipSync);
                GossipSourceConfig::RapidGossipSync(ans.field0.wire2api())
            },
            _ => unreachable!(),
        }
    }
}
impl Wire2Api<Hostname> for wire_Hostname {
    fn wire2api(self) -> Hostname {
        Hostname {
            internal: self.internal.wire2api(),
        }
    }
}

impl Wire2Api<Vec<PublicKey>> for *mut wire_list_public_key {
    fn wire2api(self) -> Vec<PublicKey> {
        let vec = unsafe {
            let wrap = support::box_from_leak_ptr(self);
            support::vec_from_leak_ptr(wrap.ptr, wrap.len)
        };
        vec.into_iter().map(Wire2Api::wire2api).collect()
    }
}
impl Wire2Api<Vec<SocketAddress>> for *mut wire_list_socket_address {
    fn wire2api(self) -> Vec<SocketAddress> {
        let vec = unsafe {
            let wrap = support::box_from_leak_ptr(self);
            support::vec_from_leak_ptr(wrap.ptr, wrap.len)
        };
        vec.into_iter().map(Wire2Api::wire2api).collect()
    }
}

impl Wire2Api<MaxDustHTLCExposure> for wire_MaxDustHTLCExposure {
    fn wire2api(self) -> MaxDustHTLCExposure {
        match self.tag {
            0 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.FixedLimitMsat);
                MaxDustHTLCExposure::FixedLimitMsat(ans.field0.wire2api())
            },
            1 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.FeeRateMultiplier);
                MaxDustHTLCExposure::FeeRateMultiplier(ans.field0.wire2api())
            },
            _ => unreachable!(),
        }
    }
}
impl Wire2Api<Mnemonic> for wire_Mnemonic {
    fn wire2api(self) -> Mnemonic {
        Mnemonic {
            internal: self.internal.wire2api(),
        }
    }
}

impl Wire2Api<NodePointer> for wire_NodePointer {
    fn wire2api(self) -> NodePointer {
        NodePointer(self.field0.wire2api())
    }
}

impl Wire2Api<PaymentHash> for wire_PaymentHash {
    fn wire2api(self) -> PaymentHash {
        PaymentHash {
            internal: self.internal.wire2api(),
        }
    }
}
impl Wire2Api<PublicKey> for wire_PublicKey {
    fn wire2api(self) -> PublicKey {
        PublicKey {
            internal: self.internal.wire2api(),
        }
    }
}
impl Wire2Api<SocketAddress> for wire_SocketAddress {
    fn wire2api(self) -> SocketAddress {
        match self.tag {
            0 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.TcpIpV4);
                SocketAddress::TcpIpV4 {
                    addr: ans.addr.wire2api(),
                    port: ans.port.wire2api(),
                }
            },
            1 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.TcpIpV6);
                SocketAddress::TcpIpV6 {
                    addr: ans.addr.wire2api(),
                    port: ans.port.wire2api(),
                }
            },
            2 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.OnionV2);
                SocketAddress::OnionV2(ans.field0.wire2api())
            },
            3 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.OnionV3);
                SocketAddress::OnionV3 {
                    ed25519_pubkey: ans.ed25519_pubkey.wire2api(),
                    checksum: ans.checksum.wire2api(),
                    version: ans.version.wire2api(),
                    port: ans.port.wire2api(),
                }
            },
            4 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.Hostname);
                SocketAddress::Hostname {
                    hostname: ans.hostname.wire2api(),
                    port: ans.port.wire2api(),
                }
            },
            _ => unreachable!(),
        }
    }
}

impl Wire2Api<[u8; 12]> for *mut wire_uint_8_list {
    fn wire2api(self) -> [u8; 12] {
        let vec: Vec<u8> = self.wire2api();
        support::from_vec_to_array(vec)
    }
}
impl Wire2Api<[u8; 16]> for *mut wire_uint_8_list {
    fn wire2api(self) -> [u8; 16] {
        let vec: Vec<u8> = self.wire2api();
        support::from_vec_to_array(vec)
    }
}
impl Wire2Api<[u8; 32]> for *mut wire_uint_8_list {
    fn wire2api(self) -> [u8; 32] {
        let vec: Vec<u8> = self.wire2api();
        support::from_vec_to_array(vec)
    }
}
impl Wire2Api<[u8; 4]> for *mut wire_uint_8_list {
    fn wire2api(self) -> [u8; 4] {
        let vec: Vec<u8> = self.wire2api();
        support::from_vec_to_array(vec)
    }
}
impl Wire2Api<[u8; 64]> for *mut wire_uint_8_list {
    fn wire2api(self) -> [u8; 64] {
        let vec: Vec<u8> = self.wire2api();
        support::from_vec_to_array(vec)
    }
}
impl Wire2Api<Vec<u8>> for *mut wire_uint_8_list {
    fn wire2api(self) -> Vec<u8> {
        unsafe {
            let wrap = support::box_from_leak_ptr(self);
            support::vec_from_leak_ptr(wrap.ptr, wrap.len)
        }
    }
}
// Section: wire structs

#[repr(C)]
#[derive(Clone)]
pub struct wire_MutexNodeSqliteStore {
    ptr: *const core::ffi::c_void,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_Address {
    internal: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_Bolt11Invoice {
    internal: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_ChannelConfig {
    forwarding_fee_proportional_millionths: u32,
    forwarding_fee_base_msat: u32,
    cltv_expiry_delta: u16,
    max_dust_htlc_exposure: wire_MaxDustHTLCExposure,
    force_close_avoidance_max_fee_satoshis: u64,
    accept_underpaying_htlcs: bool,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_ChannelId {
    internal: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_Config {
    storage_dir_path: *mut wire_uint_8_list,
    log_dir_path: *mut wire_uint_8_list,
    network: i32,
    listening_addresses: *mut wire_list_socket_address,
    default_cltv_expiry_delta: u32,
    onchain_wallet_sync_interval_secs: u64,
    wallet_sync_interval_secs: u64,
    fee_rate_cache_update_interval_secs: u64,
    trusted_peers_0conf: *mut wire_list_public_key,
    probing_liquidity_limit_multiplier: u64,
    log_level: i32,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_Hostname {
    internal: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_list_public_key {
    ptr: *mut wire_PublicKey,
    len: i32,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_list_socket_address {
    ptr: *mut wire_SocketAddress,
    len: i32,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_Mnemonic {
    internal: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_NodePointer {
    field0: wire_MutexNodeSqliteStore,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_PaymentHash {
    internal: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_PublicKey {
    internal: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_uint_8_list {
    ptr: *mut u8,
    len: i32,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_ChainDataSourceConfig {
    tag: i32,
    kind: *mut ChainDataSourceConfigKind,
}

#[repr(C)]
pub union ChainDataSourceConfigKind {
    Esplora: *mut wire_ChainDataSourceConfig_Esplora,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_ChainDataSourceConfig_Esplora {
    field0: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_EntropySourceConfig {
    tag: i32,
    kind: *mut EntropySourceConfigKind,
}

#[repr(C)]
pub union EntropySourceConfigKind {
    SeedFile: *mut wire_EntropySourceConfig_SeedFile,
    SeedBytes: *mut wire_EntropySourceConfig_SeedBytes,
    Bip39Mnemonic: *mut wire_EntropySourceConfig_Bip39Mnemonic,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_EntropySourceConfig_SeedFile {
    field0: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_EntropySourceConfig_SeedBytes {
    field0: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_EntropySourceConfig_Bip39Mnemonic {
    mnemonic: *mut wire_Mnemonic,
    passphrase: *mut wire_uint_8_list,
}
#[repr(C)]
#[derive(Clone)]
pub struct wire_GossipSourceConfig {
    tag: i32,
    kind: *mut GossipSourceConfigKind,
}

#[repr(C)]
pub union GossipSourceConfigKind {
    P2PNetwork: *mut wire_GossipSourceConfig_P2PNetwork,
    RapidGossipSync: *mut wire_GossipSourceConfig_RapidGossipSync,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_GossipSourceConfig_P2PNetwork {}

#[repr(C)]
#[derive(Clone)]
pub struct wire_GossipSourceConfig_RapidGossipSync {
    field0: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_MaxDustHTLCExposure {
    tag: i32,
    kind: *mut MaxDustHTLCExposureKind,
}

#[repr(C)]
pub union MaxDustHTLCExposureKind {
    FixedLimitMsat: *mut wire_MaxDustHTLCExposure_FixedLimitMsat,
    FeeRateMultiplier: *mut wire_MaxDustHTLCExposure_FeeRateMultiplier,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_MaxDustHTLCExposure_FixedLimitMsat {
    field0: u64,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_MaxDustHTLCExposure_FeeRateMultiplier {
    field0: u64,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_SocketAddress {
    tag: i32,
    kind: *mut SocketAddressKind,
}

#[repr(C)]
pub union SocketAddressKind {
    TcpIpV4: *mut wire_SocketAddress_TcpIpV4,
    TcpIpV6: *mut wire_SocketAddress_TcpIpV6,
    OnionV2: *mut wire_SocketAddress_OnionV2,
    OnionV3: *mut wire_SocketAddress_OnionV3,
    Hostname: *mut wire_SocketAddress_Hostname,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_SocketAddress_TcpIpV4 {
    addr: *mut wire_uint_8_list,
    port: u16,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_SocketAddress_TcpIpV6 {
    addr: *mut wire_uint_8_list,
    port: u16,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_SocketAddress_OnionV2 {
    field0: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_SocketAddress_OnionV3 {
    ed25519_pubkey: *mut wire_uint_8_list,
    checksum: u16,
    version: u8,
    port: u16,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_SocketAddress_Hostname {
    hostname: *mut wire_Hostname,
    port: u16,
}

// Section: impl NewWithNullPtr

pub trait NewWithNullPtr {
    fn new_with_null_ptr() -> Self;
}

impl<T> NewWithNullPtr for *mut T {
    fn new_with_null_ptr() -> Self {
        std::ptr::null_mut()
    }
}

impl NewWithNullPtr for wire_MutexNodeSqliteStore {
    fn new_with_null_ptr() -> Self {
        Self {
            ptr: core::ptr::null(),
        }
    }
}

impl NewWithNullPtr for wire_Address {
    fn new_with_null_ptr() -> Self {
        Self {
            internal: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_Address {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_Bolt11Invoice {
    fn new_with_null_ptr() -> Self {
        Self {
            internal: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_Bolt11Invoice {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl Default for wire_ChainDataSourceConfig {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_ChainDataSourceConfig {
    fn new_with_null_ptr() -> Self {
        Self {
            tag: -1,
            kind: core::ptr::null_mut(),
        }
    }
}

#[no_mangle]
pub extern "C" fn inflate_ChainDataSourceConfig_Esplora() -> *mut ChainDataSourceConfigKind {
    support::new_leak_box_ptr(ChainDataSourceConfigKind {
        Esplora: support::new_leak_box_ptr(wire_ChainDataSourceConfig_Esplora {
            field0: core::ptr::null_mut(),
        }),
    })
}

impl NewWithNullPtr for wire_ChannelConfig {
    fn new_with_null_ptr() -> Self {
        Self {
            forwarding_fee_proportional_millionths: Default::default(),
            forwarding_fee_base_msat: Default::default(),
            cltv_expiry_delta: Default::default(),
            max_dust_htlc_exposure: Default::default(),
            force_close_avoidance_max_fee_satoshis: Default::default(),
            accept_underpaying_htlcs: Default::default(),
        }
    }
}

impl Default for wire_ChannelConfig {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_ChannelId {
    fn new_with_null_ptr() -> Self {
        Self {
            internal: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_ChannelId {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_Config {
    fn new_with_null_ptr() -> Self {
        Self {
            storage_dir_path: core::ptr::null_mut(),
            log_dir_path: core::ptr::null_mut(),
            network: Default::default(),
            listening_addresses: core::ptr::null_mut(),
            default_cltv_expiry_delta: Default::default(),
            onchain_wallet_sync_interval_secs: Default::default(),
            wallet_sync_interval_secs: Default::default(),
            fee_rate_cache_update_interval_secs: Default::default(),
            trusted_peers_0conf: core::ptr::null_mut(),
            probing_liquidity_limit_multiplier: Default::default(),
            log_level: Default::default(),
        }
    }
}

impl Default for wire_Config {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl Default for wire_EntropySourceConfig {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_EntropySourceConfig {
    fn new_with_null_ptr() -> Self {
        Self {
            tag: -1,
            kind: core::ptr::null_mut(),
        }
    }
}

#[no_mangle]
pub extern "C" fn inflate_EntropySourceConfig_SeedFile() -> *mut EntropySourceConfigKind {
    support::new_leak_box_ptr(EntropySourceConfigKind {
        SeedFile: support::new_leak_box_ptr(wire_EntropySourceConfig_SeedFile {
            field0: core::ptr::null_mut(),
        }),
    })
}

#[no_mangle]
pub extern "C" fn inflate_EntropySourceConfig_SeedBytes() -> *mut EntropySourceConfigKind {
    support::new_leak_box_ptr(EntropySourceConfigKind {
        SeedBytes: support::new_leak_box_ptr(wire_EntropySourceConfig_SeedBytes {
            field0: core::ptr::null_mut(),
        }),
    })
}

#[no_mangle]
pub extern "C" fn inflate_EntropySourceConfig_Bip39Mnemonic() -> *mut EntropySourceConfigKind {
    support::new_leak_box_ptr(EntropySourceConfigKind {
        Bip39Mnemonic: support::new_leak_box_ptr(wire_EntropySourceConfig_Bip39Mnemonic {
            mnemonic: core::ptr::null_mut(),
            passphrase: core::ptr::null_mut(),
        }),
    })
}

impl Default for wire_GossipSourceConfig {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_GossipSourceConfig {
    fn new_with_null_ptr() -> Self {
        Self {
            tag: -1,
            kind: core::ptr::null_mut(),
        }
    }
}

#[no_mangle]
pub extern "C" fn inflate_GossipSourceConfig_RapidGossipSync() -> *mut GossipSourceConfigKind {
    support::new_leak_box_ptr(GossipSourceConfigKind {
        RapidGossipSync: support::new_leak_box_ptr(wire_GossipSourceConfig_RapidGossipSync {
            field0: core::ptr::null_mut(),
        }),
    })
}

impl NewWithNullPtr for wire_Hostname {
    fn new_with_null_ptr() -> Self {
        Self {
            internal: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_Hostname {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl Default for wire_MaxDustHTLCExposure {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_MaxDustHTLCExposure {
    fn new_with_null_ptr() -> Self {
        Self {
            tag: -1,
            kind: core::ptr::null_mut(),
        }
    }
}

#[no_mangle]
pub extern "C" fn inflate_MaxDustHTLCExposure_FixedLimitMsat() -> *mut MaxDustHTLCExposureKind {
    support::new_leak_box_ptr(MaxDustHTLCExposureKind {
        FixedLimitMsat: support::new_leak_box_ptr(wire_MaxDustHTLCExposure_FixedLimitMsat {
            field0: Default::default(),
        }),
    })
}

#[no_mangle]
pub extern "C" fn inflate_MaxDustHTLCExposure_FeeRateMultiplier() -> *mut MaxDustHTLCExposureKind {
    support::new_leak_box_ptr(MaxDustHTLCExposureKind {
        FeeRateMultiplier: support::new_leak_box_ptr(wire_MaxDustHTLCExposure_FeeRateMultiplier {
            field0: Default::default(),
        }),
    })
}

impl NewWithNullPtr for wire_Mnemonic {
    fn new_with_null_ptr() -> Self {
        Self {
            internal: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_Mnemonic {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_NodePointer {
    fn new_with_null_ptr() -> Self {
        Self {
            field0: wire_MutexNodeSqliteStore::new_with_null_ptr(),
        }
    }
}

impl Default for wire_NodePointer {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_PaymentHash {
    fn new_with_null_ptr() -> Self {
        Self {
            internal: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_PaymentHash {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_PublicKey {
    fn new_with_null_ptr() -> Self {
        Self {
            internal: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_PublicKey {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl Default for wire_SocketAddress {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_SocketAddress {
    fn new_with_null_ptr() -> Self {
        Self {
            tag: -1,
            kind: core::ptr::null_mut(),
        }
    }
}

#[no_mangle]
pub extern "C" fn inflate_SocketAddress_TcpIpV4() -> *mut SocketAddressKind {
    support::new_leak_box_ptr(SocketAddressKind {
        TcpIpV4: support::new_leak_box_ptr(wire_SocketAddress_TcpIpV4 {
            addr: core::ptr::null_mut(),
            port: Default::default(),
        }),
    })
}

#[no_mangle]
pub extern "C" fn inflate_SocketAddress_TcpIpV6() -> *mut SocketAddressKind {
    support::new_leak_box_ptr(SocketAddressKind {
        TcpIpV6: support::new_leak_box_ptr(wire_SocketAddress_TcpIpV6 {
            addr: core::ptr::null_mut(),
            port: Default::default(),
        }),
    })
}

#[no_mangle]
pub extern "C" fn inflate_SocketAddress_OnionV2() -> *mut SocketAddressKind {
    support::new_leak_box_ptr(SocketAddressKind {
        OnionV2: support::new_leak_box_ptr(wire_SocketAddress_OnionV2 {
            field0: core::ptr::null_mut(),
        }),
    })
}

#[no_mangle]
pub extern "C" fn inflate_SocketAddress_OnionV3() -> *mut SocketAddressKind {
    support::new_leak_box_ptr(SocketAddressKind {
        OnionV3: support::new_leak_box_ptr(wire_SocketAddress_OnionV3 {
            ed25519_pubkey: core::ptr::null_mut(),
            checksum: Default::default(),
            version: Default::default(),
            port: Default::default(),
        }),
    })
}

#[no_mangle]
pub extern "C" fn inflate_SocketAddress_Hostname() -> *mut SocketAddressKind {
    support::new_leak_box_ptr(SocketAddressKind {
        Hostname: support::new_leak_box_ptr(wire_SocketAddress_Hostname {
            hostname: core::ptr::null_mut(),
            port: Default::default(),
        }),
    })
}

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturn(ptr: support::WireSyncReturn) {
    unsafe {
        let _ = support::box_from_leak_ptr(ptr);
    };
}
