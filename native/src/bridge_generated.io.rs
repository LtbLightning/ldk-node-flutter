use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_init_builder(port_: i64, config: *mut wire_Config) {
    wire_init_builder_impl(port_, config)
}

#[no_mangle]
pub extern "C" fn wire_start(port_: i64, ldk_lite_instance: wire_LdkLiteInstance) {
    wire_start_impl(port_, ldk_lite_instance)
}

#[no_mangle]
pub extern "C" fn wire_new_funding_address(port_: i64, ldk_lite_instance: wire_LdkLiteInstance) {
    wire_new_funding_address_impl(port_, ldk_lite_instance)
}

#[no_mangle]
pub extern "C" fn wire_get_node_addr(port_: i64, ldk_lite_instance: wire_LdkLiteInstance) {
    wire_get_node_addr_impl(port_, ldk_lite_instance)
}

#[no_mangle]
pub extern "C" fn wire_next_event(port_: i64, ldk_lite_instance: wire_LdkLiteInstance) {
    wire_next_event_impl(port_, ldk_lite_instance)
}

#[no_mangle]
pub extern "C" fn wire_handle_event(port_: i64, ldk_lite_instance: wire_LdkLiteInstance) {
    wire_handle_event_impl(port_, ldk_lite_instance)
}

#[no_mangle]
pub extern "C" fn wire_receive_payment(
    port_: i64,
    ldk_lite_instance: wire_LdkLiteInstance,
    amount_msat: *mut u64,
    description: *mut wire_uint_8_list,
    expiry_secs: u32,
) {
    wire_receive_payment_impl(
        port_,
        ldk_lite_instance,
        amount_msat,
        description,
        expiry_secs,
    )
}

#[no_mangle]
pub extern "C" fn wire_send_payment(
    port_: i64,
    ldk_lite_instance: wire_LdkLiteInstance,
    invoice: *mut wire_uint_8_list,
) {
    wire_send_payment_impl(port_, ldk_lite_instance, invoice)
}

#[no_mangle]
pub extern "C" fn wire_get_channel_id(port_: i64, ldk_lite_instance: wire_LdkLiteInstance) {
    wire_get_channel_id_impl(port_, ldk_lite_instance)
}

#[no_mangle]
pub extern "C" fn wire_connect_open_channel(
    port_: i64,
    ldk_lite: wire_LdkLiteInstance,
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
    ldk_lite: wire_LdkLiteInstance,
    channel_id: *mut wire_uint_8_list,
    counterparty_node_id: *mut wire_uint_8_list,
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

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_LdkLiteInstance() -> wire_LdkLiteInstance {
    wire_LdkLiteInstance::new_with_null_ptr()
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_config_0() -> *mut wire_Config {
    support::new_leak_box_ptr(wire_Config::new_with_null_ptr())
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
pub extern "C" fn drop_opaque_LdkLiteInstance(ptr: *const c_void) {
    unsafe {
        Arc::<LdkLiteInstance>::decrement_strong_count(ptr as _);
    }
}

#[no_mangle]
pub extern "C" fn share_opaque_LdkLiteInstance(ptr: *const c_void) -> *const c_void {
    unsafe {
        Arc::<LdkLiteInstance>::increment_strong_count(ptr as _);
        ptr
    }
}

// Section: impl Wire2Api

impl Wire2Api<RustOpaque<LdkLiteInstance>> for wire_LdkLiteInstance {
    fn wire2api(self) -> RustOpaque<LdkLiteInstance> {
        unsafe { support::opaque_from_dart(self.ptr as _) }
    }
}
impl Wire2Api<String> for *mut wire_uint_8_list {
    fn wire2api(self) -> String {
        let vec: Vec<u8> = self.wire2api();
        String::from_utf8_lossy(&vec).into_owned()
    }
}

impl Wire2Api<Config> for *mut wire_Config {
    fn wire2api(self) -> Config {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<Config>::wire2api(*wrap).into()
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

impl Wire2Api<[u8; 32]> for *mut wire_uint_8_list {
    fn wire2api(self) -> [u8; 32] {
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
pub struct wire_LdkLiteInstance {
    ptr: *const core::ffi::c_void,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_Config {
    storage_dir_path: *mut wire_uint_8_list,
    esplora_server_url: *mut wire_uint_8_list,
    network: i32,
    listening_address: *mut wire_uint_8_list,
    default_cltv_expiry_delta: u32,
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

impl NewWithNullPtr for wire_LdkLiteInstance {
    fn new_with_null_ptr() -> Self {
        Self {
            ptr: core::ptr::null(),
        }
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

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturnStruct(val: support::WireSyncReturnStruct) {
    unsafe {
        let _ = support::vec_from_leak_ptr(val.ptr, val.len);
    }
}
