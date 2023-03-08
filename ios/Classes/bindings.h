#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
typedef struct _Dart_Handle* Dart_Handle;

typedef struct DartCObject DartCObject;

typedef int64_t DartPort;

typedef bool (*DartPostCObjectFnType)(DartPort port_id, void *message);

typedef struct wire_uint_8_list {
  uint8_t *ptr;
  int32_t len;
} wire_uint_8_list;

typedef struct wire_LdkConfig {
  struct wire_uint_8_list *storage_dir_path;
  struct wire_uint_8_list *esplora_server_url;
  int32_t network;
  struct wire_uint_8_list *listening_address;
  uint32_t default_cltv_expiry_delta;
} wire_LdkConfig;

typedef struct wire_LdkNodeInstance {
  const void *ptr;
} wire_LdkNodeInstance;

typedef struct wire_LdkInvoice {
  struct wire_uint_8_list *as_string;
} wire_LdkInvoice;

typedef struct wire_PublicKey {
  struct wire_uint_8_list *as_string;
} wire_PublicKey;

typedef struct DartCObject *WireSyncReturn;

void store_dart_post_cobject(DartPostCObjectFnType ptr);

Dart_Handle get_dart_object(uintptr_t ptr);

void drop_dart_object(uintptr_t ptr);

uintptr_t new_dart_opaque(Dart_Handle handle);

intptr_t init_frb_dart_api_dl(void *obj);

void wire_init_builder(int64_t port_, struct wire_LdkConfig *config);

void wire_start(int64_t port_, struct wire_LdkNodeInstance ldk_node);

void wire_node_id(int64_t port_, struct wire_LdkNodeInstance ldk_node);

void wire_get_balance(int64_t port_, struct wire_LdkNodeInstance ldk_node);

void wire_new_funding_address(int64_t port_, struct wire_LdkNodeInstance ldk_node);

void wire_sync(int64_t port_, struct wire_LdkNodeInstance ldk_node);

void wire_get_node_addr(int64_t port_, struct wire_LdkNodeInstance ldk_node);

void wire_next_event(int64_t port_, struct wire_LdkNodeInstance ldk_node);

void wire_stop(int64_t port_, struct wire_LdkNodeInstance ldk_node);

void wire_handle_event(int64_t port_, struct wire_LdkNodeInstance ldk_node);

void wire_node_info(int64_t port_, struct wire_LdkNodeInstance ldk_node);

void wire_receive_payment(int64_t port_,
                          struct wire_LdkNodeInstance ldk_node,
                          uint64_t *amount_msat,
                          struct wire_uint_8_list *description,
                          uint32_t expiry_secs);

void wire_send_payment(int64_t port_,
                       struct wire_LdkNodeInstance ldk_node,
                       struct wire_LdkInvoice *invoice);

void wire_send_spontaneous_payment(int64_t port_,
                                   struct wire_LdkNodeInstance ldk_node,
                                   uint64_t amount_msat,
                                   struct wire_uint_8_list *node_id);

void wire_payment_info(int64_t port_,
                       struct wire_LdkNodeInstance ldk_node,
                       struct wire_uint_8_list *payment_hash);

void wire_connect_open_channel(int64_t port_,
                               struct wire_LdkNodeInstance ldk_lite,
                               struct wire_uint_8_list *node_pubkey_and_address,
                               uint64_t channel_amount_sats,
                               bool announce_channel);

void wire_close_channel(int64_t port_,
                        struct wire_LdkNodeInstance ldk_lite,
                        struct wire_uint_8_list *channel_id,
                        struct wire_PublicKey *counterparty_node_id);

void wire_create_log_stream(int64_t port_);

void wire_rust_set_up(int64_t port_);

void wire_create__static_method__LdkInvoice(int64_t port_, struct wire_uint_8_list *invoice);

void wire_amount_milli_satoshis__static_method__LdkInvoice(int64_t port_,
                                                           struct wire_LdkInvoice *invoice);

void wire_is_expired__static_method__LdkInvoice(int64_t port_, struct wire_LdkInvoice *invoice);

void wire_expiry_time__static_method__LdkInvoice(int64_t port_, struct wire_LdkInvoice *invoice);

void wire_payment_hash__static_method__LdkInvoice(int64_t port_, struct wire_LdkInvoice *invoice);

void wire_payee_pub_key__static_method__LdkInvoice(int64_t port_, struct wire_LdkInvoice *invoice);

void wire_payment_secret__static_method__LdkInvoice(int64_t port_, struct wire_LdkInvoice *invoice);

struct wire_LdkNodeInstance new_LdkNodeInstance(void);

struct wire_LdkConfig *new_box_autoadd_ldk_config_0(void);

struct wire_LdkInvoice *new_box_autoadd_ldk_invoice_0(void);

struct wire_PublicKey *new_box_autoadd_public_key_0(void);

uint64_t *new_box_autoadd_u64_0(uint64_t value);

struct wire_uint_8_list *new_uint_8_list_0(int32_t len);

void drop_opaque_LdkNodeInstance(const void *ptr);

const void *share_opaque_LdkNodeInstance(const void *ptr);

void free_WireSyncReturn(WireSyncReturn ptr);

static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) wire_init_builder);
    dummy_var ^= ((int64_t) (void*) wire_start);
    dummy_var ^= ((int64_t) (void*) wire_node_id);
    dummy_var ^= ((int64_t) (void*) wire_get_balance);
    dummy_var ^= ((int64_t) (void*) wire_new_funding_address);
    dummy_var ^= ((int64_t) (void*) wire_sync);
    dummy_var ^= ((int64_t) (void*) wire_get_node_addr);
    dummy_var ^= ((int64_t) (void*) wire_next_event);
    dummy_var ^= ((int64_t) (void*) wire_stop);
    dummy_var ^= ((int64_t) (void*) wire_handle_event);
    dummy_var ^= ((int64_t) (void*) wire_node_info);
    dummy_var ^= ((int64_t) (void*) wire_receive_payment);
    dummy_var ^= ((int64_t) (void*) wire_send_payment);
    dummy_var ^= ((int64_t) (void*) wire_send_spontaneous_payment);
    dummy_var ^= ((int64_t) (void*) wire_payment_info);
    dummy_var ^= ((int64_t) (void*) wire_connect_open_channel);
    dummy_var ^= ((int64_t) (void*) wire_close_channel);
    dummy_var ^= ((int64_t) (void*) wire_create_log_stream);
    dummy_var ^= ((int64_t) (void*) wire_rust_set_up);
    dummy_var ^= ((int64_t) (void*) wire_create__static_method__LdkInvoice);
    dummy_var ^= ((int64_t) (void*) wire_amount_milli_satoshis__static_method__LdkInvoice);
    dummy_var ^= ((int64_t) (void*) wire_is_expired__static_method__LdkInvoice);
    dummy_var ^= ((int64_t) (void*) wire_expiry_time__static_method__LdkInvoice);
    dummy_var ^= ((int64_t) (void*) wire_payment_hash__static_method__LdkInvoice);
    dummy_var ^= ((int64_t) (void*) wire_payee_pub_key__static_method__LdkInvoice);
    dummy_var ^= ((int64_t) (void*) wire_payment_secret__static_method__LdkInvoice);
    dummy_var ^= ((int64_t) (void*) new_LdkNodeInstance);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_ldk_config_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_ldk_invoice_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_public_key_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_u64_0);
    dummy_var ^= ((int64_t) (void*) new_uint_8_list_0);
    dummy_var ^= ((int64_t) (void*) drop_opaque_LdkNodeInstance);
    dummy_var ^= ((int64_t) (void*) share_opaque_LdkNodeInstance);
    dummy_var ^= ((int64_t) (void*) free_WireSyncReturn);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    dummy_var ^= ((int64_t) (void*) get_dart_object);
    dummy_var ^= ((int64_t) (void*) drop_dart_object);
    dummy_var ^= ((int64_t) (void*) new_dart_opaque);
    return dummy_var;
}
