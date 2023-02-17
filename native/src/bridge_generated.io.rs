use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_init_builder(port_: i64, config: *mut wire_LdkConfig) {
    wire_init_builder_impl(port_, config)
}

#[no_mangle]
pub extern "C" fn wire_start(port_: i64, ldk_node: wire_LdkNodeInstance) {
    wire_start_impl(port_, ldk_node)
}

#[no_mangle]
pub extern "C" fn wire_node_id(port_: i64, ldk_node: wire_LdkNodeInstance) {
    wire_node_id_impl(port_, ldk_node)
}

#[no_mangle]
pub extern "C" fn wire_get_balance(port_: i64, ldk_node: wire_LdkNodeInstance) {
    wire_get_balance_impl(port_, ldk_node)
}

#[no_mangle]
pub extern "C" fn wire_new_funding_address(port_: i64, ldk_node: wire_LdkNodeInstance) {
    wire_new_funding_address_impl(port_, ldk_node)
}

#[no_mangle]
pub extern "C" fn wire_sync(port_: i64, ldk_node: wire_LdkNodeInstance) {
    wire_sync_impl(port_, ldk_node)
}

#[no_mangle]
pub extern "C" fn wire_get_node_addr(port_: i64, ldk_node: wire_LdkNodeInstance) {
    wire_get_node_addr_impl(port_, ldk_node)
}

#[no_mangle]
pub extern "C" fn wire_next_event(port_: i64, ldk_node: wire_LdkNodeInstance) {
    wire_next_event_impl(port_, ldk_node)
}

#[no_mangle]
pub extern "C" fn wire_stop(port_: i64, ldk_node: wire_LdkNodeInstance) {
    wire_stop_impl(port_, ldk_node)
}

#[no_mangle]
pub extern "C" fn wire_handle_event(port_: i64, ldk_node: wire_LdkNodeInstance) {
    wire_handle_event_impl(port_, ldk_node)
}

#[no_mangle]
pub extern "C" fn wire_node_info(port_: i64, ldk_node: wire_LdkNodeInstance) {
    wire_node_info_impl(port_, ldk_node)
}

#[no_mangle]
pub extern "C" fn wire_receive_payment(
    port_: i64,
    ldk_node: wire_LdkNodeInstance,
    amount_msat: *mut u64,
    description: *mut wire_uint_8_list,
    expiry_secs: u32,
) {
    wire_receive_payment_impl(port_, ldk_node, amount_msat, description, expiry_secs)
}

#[no_mangle]
pub extern "C" fn wire_send_payment(
    port_: i64,
    ldk_node: wire_LdkNodeInstance,
    invoice: *mut wire_LdkInvoice,
) {
    wire_send_payment_impl(port_, ldk_node, invoice)
}

#[no_mangle]
pub extern "C" fn wire_send_spontaneous_payment(
    port_: i64,
    ldk_node: wire_LdkNodeInstance,
    amount_msat: u64,
    node_id: *mut wire_uint_8_list,
) {
    wire_send_spontaneous_payment_impl(port_, ldk_node, amount_msat, node_id)
}

#[no_mangle]
pub extern "C" fn wire_payment_info(
    port_: i64,
    ldk_node: wire_LdkNodeInstance,
    payment_hash: *mut wire_uint_8_list,
) {
    wire_payment_info_impl(port_, ldk_node, payment_hash)
}

#[no_mangle]
pub extern "C" fn wire_connect_open_channel(
    port_: i64,
    ldk_lite: wire_LdkNodeInstance,
    node_pubkey_and_address: *mut wire_uint_8_list,
    channel_amount_sats: u64,
    announce_channel: bool,
) {
    wire_connect_open_channel_impl(
        port_,
        ldk_lite,
        node_pubkey_and_address,
        channel_amount_sats,
        announce_channel,
    )
}

#[no_mangle]
pub extern "C" fn wire_close_channel(
    port_: i64,
    ldk_lite: wire_LdkNodeInstance,
    channel_id: *mut wire_uint_8_list,
    counterparty_node_id: *mut wire_PublicKey,
) {
    wire_close_channel_impl(port_, ldk_lite, channel_id, counterparty_node_id)
}

#[no_mangle]
pub extern "C" fn wire_create_log_stream(port_: i64) {
    wire_create_log_stream_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_rust_set_up(port_: i64) {
    wire_rust_set_up_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_create__static_method__LdkInvoice(
    port_: i64,
    invoice: *mut wire_uint_8_list,
) {
    wire_create__static_method__LdkInvoice_impl(port_, invoice)
}

#[no_mangle]
pub extern "C" fn wire_amount_milli_satoshis__static_method__LdkInvoice(
    port_: i64,
    invoice: *mut wire_LdkInvoice,
) {
    wire_amount_milli_satoshis__static_method__LdkInvoice_impl(port_, invoice)
}

#[no_mangle]
pub extern "C" fn wire_is_expired__static_method__LdkInvoice(
    port_: i64,
    invoice: *mut wire_LdkInvoice,
) {
    wire_is_expired__static_method__LdkInvoice_impl(port_, invoice)
}

#[no_mangle]
pub extern "C" fn wire_expiry_time__static_method__LdkInvoice(
    port_: i64,
    invoice: *mut wire_LdkInvoice,
) {
    wire_expiry_time__static_method__LdkInvoice_impl(port_, invoice)
}

#[no_mangle]
pub extern "C" fn wire_payment_hash__static_method__LdkInvoice(
    port_: i64,
    invoice: *mut wire_LdkInvoice,
) {
    wire_payment_hash__static_method__LdkInvoice_impl(port_, invoice)
}

#[no_mangle]
pub extern "C" fn wire_payee_pub_key__static_method__LdkInvoice(
    port_: i64,
    invoice: *mut wire_LdkInvoice,
) {
    wire_payee_pub_key__static_method__LdkInvoice_impl(port_, invoice)
}

#[no_mangle]
pub extern "C" fn wire_payment_secret__static_method__LdkInvoice(
    port_: i64,
    invoice: *mut wire_LdkInvoice,
) {
    wire_payment_secret__static_method__LdkInvoice_impl(port_, invoice)
}

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_LdkNodeInstance() -> wire_LdkNodeInstance {
    wire_LdkNodeInstance::new_with_null_ptr()
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_ldk_config_0() -> *mut wire_LdkConfig {
    support::new_leak_box_ptr(wire_LdkConfig::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_ldk_invoice_0() -> *mut wire_LdkInvoice {
    support::new_leak_box_ptr(wire_LdkInvoice::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_public_key_0() -> *mut wire_PublicKey {
    support::new_leak_box_ptr(wire_PublicKey::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_u64_0(value: u64) -> *mut u64 {
    support::new_leak_box_ptr(value)
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
pub extern "C" fn drop_opaque_LdkNodeInstance(ptr: *const c_void) {
    unsafe {
        Arc::<LdkNodeInstance>::decrement_strong_count(ptr as _);
    }
}

#[no_mangle]
pub extern "C" fn share_opaque_LdkNodeInstance(ptr: *const c_void) -> *const c_void {
    unsafe {
        Arc::<LdkNodeInstance>::increment_strong_count(ptr as _);
        ptr
    }
}

// Section: impl Wire2Api

impl Wire2Api<RustOpaque<LdkNodeInstance>> for wire_LdkNodeInstance {
    fn wire2api(self) -> RustOpaque<LdkNodeInstance> {
        unsafe { support::opaque_from_dart(self.ptr as _) }
    }
}
impl Wire2Api<String> for *mut wire_uint_8_list {
    fn wire2api(self) -> String {
        let vec: Vec<u8> = self.wire2api();
        String::from_utf8_lossy(&vec).into_owned()
    }
}

impl Wire2Api<LdkConfig> for *mut wire_LdkConfig {
    fn wire2api(self) -> LdkConfig {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<LdkConfig>::wire2api(*wrap).into()
    }
}
impl Wire2Api<LdkInvoice> for *mut wire_LdkInvoice {
    fn wire2api(self) -> LdkInvoice {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<LdkInvoice>::wire2api(*wrap).into()
    }
}
impl Wire2Api<PublicKey> for *mut wire_PublicKey {
    fn wire2api(self) -> PublicKey {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<PublicKey>::wire2api(*wrap).into()
    }
}
impl Wire2Api<u64> for *mut u64 {
    fn wire2api(self) -> u64 {
        unsafe { *support::box_from_leak_ptr(self) }
    }
}

impl Wire2Api<LdkConfig> for wire_LdkConfig {
    fn wire2api(self) -> LdkConfig {
        LdkConfig {
            storage_dir_path: self.storage_dir_path.wire2api(),
            esplora_server_url: self.esplora_server_url.wire2api(),
            network: self.network.wire2api(),
            listening_address: self.listening_address.wire2api(),
            default_cltv_expiry_delta: self.default_cltv_expiry_delta.wire2api(),
        }
    }
}
impl Wire2Api<LdkInvoice> for wire_LdkInvoice {
    fn wire2api(self) -> LdkInvoice {
        LdkInvoice {
            as_string: self.as_string.wire2api(),
        }
    }
}

impl Wire2Api<PublicKey> for wire_PublicKey {
    fn wire2api(self) -> PublicKey {
        PublicKey {
            as_string: self.as_string.wire2api(),
        }
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
pub struct wire_LdkNodeInstance {
    ptr: *const core::ffi::c_void,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_LdkConfig {
    storage_dir_path: *mut wire_uint_8_list,
    esplora_server_url: *mut wire_uint_8_list,
    network: i32,
    listening_address: *mut wire_uint_8_list,
    default_cltv_expiry_delta: u32,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_LdkInvoice {
    as_string: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_PublicKey {
    as_string: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_uint_8_list {
    ptr: *mut u8,
    len: i32,
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

impl NewWithNullPtr for wire_LdkNodeInstance {
    fn new_with_null_ptr() -> Self {
        Self {
            ptr: core::ptr::null(),
        }
    }
}

impl NewWithNullPtr for wire_LdkConfig {
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

impl NewWithNullPtr for wire_LdkInvoice {
    fn new_with_null_ptr() -> Self {
        Self {
            as_string: core::ptr::null_mut(),
        }
    }
}

impl NewWithNullPtr for wire_PublicKey {
    fn new_with_null_ptr() -> Self {
        Self {
            as_string: core::ptr::null_mut(),
        }
    }
}

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturn(ptr: support::WireSyncReturn) {
    unsafe {
        let _ = support::box_from_leak_ptr(ptr);
    };
}
