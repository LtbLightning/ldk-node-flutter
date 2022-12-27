#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

typedef int64_t DartPort;

typedef bool (*DartPostCObjectFnType)(DartPort port_id, void *message);

typedef struct wire_uint_8_list {
  uint8_t *ptr;
  int32_t len;
} wire_uint_8_list;

typedef struct wire_Config {
  struct wire_uint_8_list *storage_dir_path;
  struct wire_uint_8_list *esplora_server_url;
  int32_t network;
  struct wire_uint_8_list *listening_address;
  uint32_t default_cltv_expiry_delta;
} wire_Config;

typedef struct wire_LdkLiteInstance {
  const void *ptr;
} wire_LdkLiteInstance;

typedef struct WireSyncReturnStruct {
  uint8_t *ptr;
  int32_t len;
  bool success;
} WireSyncReturnStruct;

void store_dart_post_cobject(DartPostCObjectFnType ptr);

void wire_init_builder(int64_t port_, struct wire_Config *config);

void wire_start(int64_t port_, struct wire_LdkLiteInstance ldk_lite_instance);

void wire_get_balance(int64_t port_, struct wire_LdkLiteInstance ldk_lite_instance);

void wire_new_funding_address(int64_t port_, struct wire_LdkLiteInstance ldk_lite_instance);

void wire_sync(int64_t port_, struct wire_LdkLiteInstance ldk_lite_instance);

void wire_get_node_addr(int64_t port_, struct wire_LdkLiteInstance ldk_lite_instance);

void wire_connect_open_channel(int64_t port_,
                               struct wire_LdkLiteInstance ldk_lite_instance,
                               struct wire_uint_8_list *node_pubkey_and_address,
                               uint64_t channel_amount_sats,
                               bool announce_channel);

void wire_create_log_stream(int64_t port_);

void wire_rust_set_up(int64_t port_);

struct wire_LdkLiteInstance new_LdkLiteInstance(void);

struct wire_Config *new_box_autoadd_config_0(void);

struct wire_uint_8_list *new_uint_8_list_0(int32_t len);

void drop_opaque_LdkLiteInstance(const void *ptr);

const void *share_opaque_LdkLiteInstance(const void *ptr);

void free_WireSyncReturnStruct(struct WireSyncReturnStruct val);

static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) wire_init_builder);
    dummy_var ^= ((int64_t) (void*) wire_start);
    dummy_var ^= ((int64_t) (void*) wire_get_balance);
    dummy_var ^= ((int64_t) (void*) wire_new_funding_address);
    dummy_var ^= ((int64_t) (void*) wire_sync);
    dummy_var ^= ((int64_t) (void*) wire_get_node_addr);
    dummy_var ^= ((int64_t) (void*) wire_connect_open_channel);
    dummy_var ^= ((int64_t) (void*) wire_create_log_stream);
    dummy_var ^= ((int64_t) (void*) wire_rust_set_up);
    dummy_var ^= ((int64_t) (void*) new_LdkLiteInstance);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_config_0);
    dummy_var ^= ((int64_t) (void*) new_uint_8_list_0);
    dummy_var ^= ((int64_t) (void*) drop_opaque_LdkLiteInstance);
    dummy_var ^= ((int64_t) (void*) share_opaque_LdkLiteInstance);
    dummy_var ^= ((int64_t) (void*) free_WireSyncReturnStruct);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    return dummy_var;
}