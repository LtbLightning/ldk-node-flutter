use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_new__static_method__BuilderBase(port_: i64) {
    wire_new__static_method__BuilderBase_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_set_entropy_seed_path__method__BuilderBase(
    port_: i64,
    that: *mut wire_BuilderBase,
    seed_path: *mut wire_uint_8_list,
) {
    wire_set_entropy_seed_path__method__BuilderBase_impl(port_, that, seed_path)
}

#[no_mangle]
pub extern "C" fn wire_set_entropy_seed_bytes__method__BuilderBase(
    port_: i64,
    that: *mut wire_BuilderBase,
    seed_bytes: *mut wire_uint_8_list,
) {
    wire_set_entropy_seed_bytes__method__BuilderBase_impl(port_, that, seed_bytes)
}

#[no_mangle]
pub extern "C" fn wire_set_storage_dir_path__method__BuilderBase(
    port_: i64,
    that: *mut wire_BuilderBase,
    storage_dir_path: *mut wire_uint_8_list,
) {
    wire_set_storage_dir_path__method__BuilderBase_impl(port_, that, storage_dir_path)
}

#[no_mangle]
pub extern "C" fn wire_set_esplora_server_url__method__BuilderBase(
    port_: i64,
    that: *mut wire_BuilderBase,
    esplora_server_url: *mut wire_uint_8_list,
) {
    wire_set_esplora_server_url__method__BuilderBase_impl(port_, that, esplora_server_url)
}

#[no_mangle]
pub extern "C" fn wire_set_network__method__BuilderBase(
    port_: i64,
    that: *mut wire_BuilderBase,
    network: i32,
) {
    wire_set_network__method__BuilderBase_impl(port_, that, network)
}

#[no_mangle]
pub extern "C" fn wire_set_listening_address__method__BuilderBase(
    port_: i64,
    that: *mut wire_BuilderBase,
    listening_address: *mut wire_SocketAddr,
) {
    wire_set_listening_address__method__BuilderBase_impl(port_, that, listening_address)
}

#[no_mangle]
pub extern "C" fn wire_set_entropy_bip39_mnemonic__method__BuilderBase(
    port_: i64,
    that: *mut wire_BuilderBase,
    mnemonic: *mut wire_uint_8_list,
    passphrase: *mut wire_uint_8_list,
) {
    wire_set_entropy_bip39_mnemonic__method__BuilderBase_impl(port_, that, mnemonic, passphrase)
}

#[no_mangle]
pub extern "C" fn wire_build__static_method__BuilderBase(
    port_: i64,
    builder: *mut wire_BuilderBase,
) {
    wire_build__static_method__BuilderBase_impl(port_, builder)
}

#[no_mangle]
pub extern "C" fn wire_start__method__NodeBase(port_: i64, that: *mut wire_NodeBase) {
    wire_start__method__NodeBase_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_stop__method__NodeBase(port_: i64, that: *mut wire_NodeBase) {
    wire_stop__method__NodeBase_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_event_handled__method__NodeBase(port_: i64, that: *mut wire_NodeBase) {
    wire_event_handled__method__NodeBase_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_next_event__method__NodeBase(port_: i64, that: *mut wire_NodeBase) {
    wire_next_event__method__NodeBase_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_node_id__method__NodeBase(port_: i64, that: *mut wire_NodeBase) {
    wire_node_id__method__NodeBase_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_listening_address__method__NodeBase(port_: i64, that: *mut wire_NodeBase) {
    wire_listening_address__method__NodeBase_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_new_funding_address__method__NodeBase(port_: i64, that: *mut wire_NodeBase) {
    wire_new_funding_address__method__NodeBase_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_on_chain_balance__method__NodeBase(port_: i64, that: *mut wire_NodeBase) {
    wire_on_chain_balance__method__NodeBase_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_send_to_on_chain_address__method__NodeBase(
    port_: i64,
    that: *mut wire_NodeBase,
    address: *mut wire_Address,
    amount_sats: u64,
) {
    wire_send_to_on_chain_address__method__NodeBase_impl(port_, that, address, amount_sats)
}

#[no_mangle]
pub extern "C" fn wire_send_all_to_on_chain_address__method__NodeBase(
    port_: i64,
    that: *mut wire_NodeBase,
    address: *mut wire_Address,
) {
    wire_send_all_to_on_chain_address__method__NodeBase_impl(port_, that, address)
}

#[no_mangle]
pub extern "C" fn wire_connect__method__NodeBase(
    port_: i64,
    that: *mut wire_NodeBase,
    node_id: *mut wire_PublicKey,
    address: *mut wire_SocketAddr,
    permanently: bool,
) {
    wire_connect__method__NodeBase_impl(port_, that, node_id, address, permanently)
}

#[no_mangle]
pub extern "C" fn wire_disconnect__method__NodeBase(
    port_: i64,
    that: *mut wire_NodeBase,
    counterparty_node_id: *mut wire_PublicKey,
) {
    wire_disconnect__method__NodeBase_impl(port_, that, counterparty_node_id)
}

#[no_mangle]
pub extern "C" fn wire_connect_open_channel__method__NodeBase(
    port_: i64,
    that: *mut wire_NodeBase,
    address: *mut wire_SocketAddr,
    node_id: *mut wire_PublicKey,
    channel_amount_sats: u64,
    push_to_counterparty_msat: *mut u64,
    announce_channel: bool,
) {
    wire_connect_open_channel__method__NodeBase_impl(
        port_,
        that,
        address,
        node_id,
        channel_amount_sats,
        push_to_counterparty_msat,
        announce_channel,
    )
}

#[no_mangle]
pub extern "C" fn wire_list_channels__method__NodeBase(port_: i64, that: *mut wire_NodeBase) {
    wire_list_channels__method__NodeBase_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_sync_wallets__method__NodeBase(port_: i64, that: *mut wire_NodeBase) {
    wire_sync_wallets__method__NodeBase_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_close_channel__method__NodeBase(
    port_: i64,
    that: *mut wire_NodeBase,
    channel_id: *mut wire_uint_8_list,
    counterparty_node_id: *mut wire_PublicKey,
) {
    wire_close_channel__method__NodeBase_impl(port_, that, channel_id, counterparty_node_id)
}

#[no_mangle]
pub extern "C" fn wire_send_payment__method__NodeBase(
    port_: i64,
    that: *mut wire_NodeBase,
    invoice: *mut wire_Invoice,
) {
    wire_send_payment__method__NodeBase_impl(port_, that, invoice)
}

#[no_mangle]
pub extern "C" fn wire_send_payment_using_amount__method__NodeBase(
    port_: i64,
    that: *mut wire_NodeBase,
    invoice: *mut wire_Invoice,
    amount_msat: u64,
) {
    wire_send_payment_using_amount__method__NodeBase_impl(port_, that, invoice, amount_msat)
}

#[no_mangle]
pub extern "C" fn wire_send_spontaneous_payment__method__NodeBase(
    port_: i64,
    that: *mut wire_NodeBase,
    amount_msat: u64,
    node_id: *mut wire_PublicKey,
) {
    wire_send_spontaneous_payment__method__NodeBase_impl(port_, that, amount_msat, node_id)
}

#[no_mangle]
pub extern "C" fn wire_receive_payment__method__NodeBase(
    port_: i64,
    that: *mut wire_NodeBase,
    amount_msat: u64,
    description: *mut wire_uint_8_list,
    expiry_secs: u32,
) {
    wire_receive_payment__method__NodeBase_impl(port_, that, amount_msat, description, expiry_secs)
}

#[no_mangle]
pub extern "C" fn wire_receive_variable_amount_payment__method__NodeBase(
    port_: i64,
    that: *mut wire_NodeBase,
    description: *mut wire_uint_8_list,
    expiry_secs: u32,
) {
    wire_receive_variable_amount_payment__method__NodeBase_impl(
        port_,
        that,
        description,
        expiry_secs,
    )
}

#[no_mangle]
pub extern "C" fn wire_payment__method__NodeBase(
    port_: i64,
    that: *mut wire_NodeBase,
    payment_hash: *mut wire_PaymentHash,
) {
    wire_payment__method__NodeBase_impl(port_, that, payment_hash)
}

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_NodePointer() -> wire_NodePointer {
    wire_NodePointer::new_with_null_ptr()
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_address_0() -> *mut wire_Address {
    support::new_leak_box_ptr(wire_Address::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_builder_base_0() -> *mut wire_BuilderBase {
    support::new_leak_box_ptr(wire_BuilderBase::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_invoice_0() -> *mut wire_Invoice {
    support::new_leak_box_ptr(wire_Invoice::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_node_base_0() -> *mut wire_NodeBase {
    support::new_leak_box_ptr(wire_NodeBase::new_with_null_ptr())
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
pub extern "C" fn new_box_autoadd_socket_addr_0() -> *mut wire_SocketAddr {
    support::new_leak_box_ptr(wire_SocketAddr::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_u64_0(value: u64) -> *mut u64 {
    support::new_leak_box_ptr(value)
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_wallet_entropy_source_0() -> *mut wire_WalletEntropySource {
    support::new_leak_box_ptr(wire_WalletEntropySource::new_with_null_ptr())
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
pub extern "C" fn drop_opaque_NodePointer(ptr: *const c_void) {
    unsafe {
        Arc::<NodePointer>::decrement_strong_count(ptr as _);
    }
}

#[no_mangle]
pub extern "C" fn share_opaque_NodePointer(ptr: *const c_void) -> *const c_void {
    unsafe {
        Arc::<NodePointer>::increment_strong_count(ptr as _);
        ptr
    }
}

// Section: impl Wire2Api

impl Wire2Api<RustOpaque<NodePointer>> for wire_NodePointer {
    fn wire2api(self) -> RustOpaque<NodePointer> {
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
            address_hex: self.address_hex.wire2api(),
        }
    }
}

impl Wire2Api<Address> for *mut wire_Address {
    fn wire2api(self) -> Address {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<Address>::wire2api(*wrap).into()
    }
}
impl Wire2Api<BuilderBase> for *mut wire_BuilderBase {
    fn wire2api(self) -> BuilderBase {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<BuilderBase>::wire2api(*wrap).into()
    }
}
impl Wire2Api<Invoice> for *mut wire_Invoice {
    fn wire2api(self) -> Invoice {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<Invoice>::wire2api(*wrap).into()
    }
}
impl Wire2Api<NodeBase> for *mut wire_NodeBase {
    fn wire2api(self) -> NodeBase {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<NodeBase>::wire2api(*wrap).into()
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
impl Wire2Api<SocketAddr> for *mut wire_SocketAddr {
    fn wire2api(self) -> SocketAddr {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<SocketAddr>::wire2api(*wrap).into()
    }
}
impl Wire2Api<u64> for *mut u64 {
    fn wire2api(self) -> u64 {
        unsafe { *support::box_from_leak_ptr(self) }
    }
}
impl Wire2Api<WalletEntropySource> for *mut wire_WalletEntropySource {
    fn wire2api(self) -> WalletEntropySource {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<WalletEntropySource>::wire2api(*wrap).into()
    }
}
impl Wire2Api<BuilderBase> for wire_BuilderBase {
    fn wire2api(self) -> BuilderBase {
        BuilderBase {
            config: self.config.wire2api(),
            entropy_source: self.entropy_source.wire2api(),
        }
    }
}
impl Wire2Api<Config> for wire_Config {
    fn wire2api(self) -> Config {
        Config {
            storage_dir_path: self.storage_dir_path.wire2api(),
            esplora_server_url: self.esplora_server_url.wire2api(),
            network: self.network.wire2api(),
            listening_address: self.listening_address.wire2api(),
            default_cltv_expiry_delta: self.default_cltv_expiry_delta.wire2api(),
        }
    }
}

impl Wire2Api<Invoice> for wire_Invoice {
    fn wire2api(self) -> Invoice {
        Invoice {
            hex: self.hex.wire2api(),
        }
    }
}

impl Wire2Api<NodeBase> for wire_NodeBase {
    fn wire2api(self) -> NodeBase {
        NodeBase {
            node_pointer: self.node_pointer.wire2api(),
        }
    }
}

impl Wire2Api<PaymentHash> for wire_PaymentHash {
    fn wire2api(self) -> PaymentHash {
        PaymentHash(self.field0.wire2api())
    }
}
impl Wire2Api<PublicKey> for wire_PublicKey {
    fn wire2api(self) -> PublicKey {
        PublicKey {
            key_hex: self.key_hex.wire2api(),
        }
    }
}
impl Wire2Api<SocketAddr> for wire_SocketAddr {
    fn wire2api(self) -> SocketAddr {
        SocketAddr {
            ip: self.ip.wire2api(),
            port: self.port.wire2api(),
        }
    }
}

impl Wire2Api<[u8; 32]> for *mut wire_uint_8_list {
    fn wire2api(self) -> [u8; 32] {
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
impl Wire2Api<WalletEntropySource> for wire_WalletEntropySource {
    fn wire2api(self) -> WalletEntropySource {
        match self.tag {
            0 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.SeedFile);
                WalletEntropySource::SeedFile(ans.field0.wire2api())
            },
            1 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.SeedBytes);
                WalletEntropySource::SeedBytes(ans.field0.wire2api())
            },
            2 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.Bip39Mnemonic);
                WalletEntropySource::Bip39Mnemonic {
                    mnemonic: ans.mnemonic.wire2api(),
                    passphrase: ans.passphrase.wire2api(),
                }
            },
            _ => unreachable!(),
        }
    }
}
// Section: wire structs

#[repr(C)]
#[derive(Clone)]
pub struct wire_NodePointer {
    ptr: *const core::ffi::c_void,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_Address {
    address_hex: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_BuilderBase {
    config: wire_Config,
    entropy_source: *mut wire_WalletEntropySource,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_Config {
    storage_dir_path: *mut wire_uint_8_list,
    esplora_server_url: *mut wire_uint_8_list,
    network: i32,
    listening_address: *mut wire_SocketAddr,
    default_cltv_expiry_delta: u32,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_Invoice {
    hex: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_NodeBase {
    node_pointer: wire_NodePointer,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_PaymentHash {
    field0: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_PublicKey {
    key_hex: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_SocketAddr {
    ip: *mut wire_uint_8_list,
    port: u16,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_uint_8_list {
    ptr: *mut u8,
    len: i32,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_WalletEntropySource {
    tag: i32,
    kind: *mut WalletEntropySourceKind,
}

#[repr(C)]
pub union WalletEntropySourceKind {
    SeedFile: *mut wire_WalletEntropySource_SeedFile,
    SeedBytes: *mut wire_WalletEntropySource_SeedBytes,
    Bip39Mnemonic: *mut wire_WalletEntropySource_Bip39Mnemonic,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_WalletEntropySource_SeedFile {
    field0: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_WalletEntropySource_SeedBytes {
    field0: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_WalletEntropySource_Bip39Mnemonic {
    mnemonic: *mut wire_uint_8_list,
    passphrase: *mut wire_uint_8_list,
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

impl NewWithNullPtr for wire_NodePointer {
    fn new_with_null_ptr() -> Self {
        Self {
            ptr: core::ptr::null(),
        }
    }
}

impl NewWithNullPtr for wire_Address {
    fn new_with_null_ptr() -> Self {
        Self {
            address_hex: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_Address {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_BuilderBase {
    fn new_with_null_ptr() -> Self {
        Self {
            config: Default::default(),
            entropy_source: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_BuilderBase {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_Config {
    fn new_with_null_ptr() -> Self {
        Self {
            storage_dir_path: core::ptr::null_mut(),
            esplora_server_url: core::ptr::null_mut(),
            network: Default::default(),
            listening_address: core::ptr::null_mut(),
            default_cltv_expiry_delta: Default::default(),
        }
    }
}

impl Default for wire_Config {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_Invoice {
    fn new_with_null_ptr() -> Self {
        Self {
            hex: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_Invoice {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_NodeBase {
    fn new_with_null_ptr() -> Self {
        Self {
            node_pointer: wire_NodePointer::new_with_null_ptr(),
        }
    }
}

impl Default for wire_NodeBase {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_PaymentHash {
    fn new_with_null_ptr() -> Self {
        Self {
            field0: core::ptr::null_mut(),
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
            key_hex: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_PublicKey {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_SocketAddr {
    fn new_with_null_ptr() -> Self {
        Self {
            ip: core::ptr::null_mut(),
            port: Default::default(),
        }
    }
}

impl Default for wire_SocketAddr {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_WalletEntropySource {
    fn new_with_null_ptr() -> Self {
        Self {
            tag: -1,
            kind: core::ptr::null_mut(),
        }
    }
}

#[no_mangle]
pub extern "C" fn inflate_WalletEntropySource_SeedFile() -> *mut WalletEntropySourceKind {
    support::new_leak_box_ptr(WalletEntropySourceKind {
        SeedFile: support::new_leak_box_ptr(wire_WalletEntropySource_SeedFile {
            field0: core::ptr::null_mut(),
        }),
    })
}

#[no_mangle]
pub extern "C" fn inflate_WalletEntropySource_SeedBytes() -> *mut WalletEntropySourceKind {
    support::new_leak_box_ptr(WalletEntropySourceKind {
        SeedBytes: support::new_leak_box_ptr(wire_WalletEntropySource_SeedBytes {
            field0: core::ptr::null_mut(),
        }),
    })
}

#[no_mangle]
pub extern "C" fn inflate_WalletEntropySource_Bip39Mnemonic() -> *mut WalletEntropySourceKind {
    support::new_leak_box_ptr(WalletEntropySourceKind {
        Bip39Mnemonic: support::new_leak_box_ptr(wire_WalletEntropySource_Bip39Mnemonic {
            mnemonic: core::ptr::null_mut(),
            passphrase: core::ptr::null_mut(),
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
