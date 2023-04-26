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

typedef struct wire_SocketAddr {
  struct wire_uint_8_list *ip;
  uint16_t port;
} wire_SocketAddr;

typedef struct wire_Config {
  struct wire_uint_8_list *storage_dir_path;
  struct wire_uint_8_list *esplora_server_url;
  int32_t network;
  struct wire_SocketAddr *listening_address;
  uint32_t default_cltv_expiry_delta;
} wire_Config;

typedef struct wire_WalletEntropySource_SeedFile {
  struct wire_uint_8_list *field0;
} wire_WalletEntropySource_SeedFile;

typedef struct wire_WalletEntropySource_SeedBytes {
  struct wire_uint_8_list *field0;
} wire_WalletEntropySource_SeedBytes;

typedef struct wire_WalletEntropySource_Bip39Mnemonic {
  struct wire_uint_8_list *mnemonic;
  struct wire_uint_8_list *passphrase;
} wire_WalletEntropySource_Bip39Mnemonic;

typedef union WalletEntropySourceKind {
  struct wire_WalletEntropySource_SeedFile *SeedFile;
  struct wire_WalletEntropySource_SeedBytes *SeedBytes;
  struct wire_WalletEntropySource_Bip39Mnemonic *Bip39Mnemonic;
} WalletEntropySourceKind;

typedef struct wire_WalletEntropySource {
  int32_t tag;
  union WalletEntropySourceKind *kind;
} wire_WalletEntropySource;

typedef struct wire_BuilderBase {
  struct wire_Config config;
  struct wire_WalletEntropySource *entropy_source;
} wire_BuilderBase;

typedef struct wire_NodePointer {
  const void *ptr;
} wire_NodePointer;

typedef struct wire_NodeBase {
  struct wire_NodePointer node_pointer;
} wire_NodeBase;

typedef struct wire_Address {
  struct wire_uint_8_list *address_hex;
} wire_Address;

typedef struct wire_PublicKey {
  struct wire_uint_8_list *key_hex;
} wire_PublicKey;

typedef struct wire_Invoice {
  struct wire_uint_8_list *hex;
} wire_Invoice;

typedef struct wire_PaymentHash {
  struct wire_uint_8_list *field0;
} wire_PaymentHash;

typedef struct DartCObject *WireSyncReturn;

void store_dart_post_cobject(DartPostCObjectFnType ptr);

Dart_Handle get_dart_object(uintptr_t ptr);

void drop_dart_object(uintptr_t ptr);

uintptr_t new_dart_opaque(Dart_Handle handle);

intptr_t init_frb_dart_api_dl(void *obj);

void wire_new__static_method__BuilderBase(int64_t port_);

void wire_set_entropy_seed_path__method__BuilderBase(int64_t port_,
                                                     struct wire_BuilderBase *that,
                                                     struct wire_uint_8_list *seed_path);

void wire_set_entropy_seed_bytes__method__BuilderBase(int64_t port_,
                                                      struct wire_BuilderBase *that,
                                                      struct wire_uint_8_list *seed_bytes);

void wire_set_storage_dir_path__method__BuilderBase(int64_t port_,
                                                    struct wire_BuilderBase *that,
                                                    struct wire_uint_8_list *storage_dir_path);

void wire_set_esplora_server_url__method__BuilderBase(int64_t port_,
                                                      struct wire_BuilderBase *that,
                                                      struct wire_uint_8_list *esplora_server_url);

void wire_set_network__method__BuilderBase(int64_t port_,
                                           struct wire_BuilderBase *that,
                                           int32_t network);

void wire_set_listening_address__method__BuilderBase(int64_t port_,
                                                     struct wire_BuilderBase *that,
                                                     struct wire_SocketAddr *listening_address);

void wire_set_entropy_bip39_mnemonic__method__BuilderBase(int64_t port_,
                                                          struct wire_BuilderBase *that,
                                                          struct wire_uint_8_list *mnemonic,
                                                          struct wire_uint_8_list *passphrase);

void wire_build__static_method__BuilderBase(int64_t port_, struct wire_BuilderBase *builder);

void wire_start__method__NodeBase(int64_t port_, struct wire_NodeBase *that);

void wire_stop__method__NodeBase(int64_t port_, struct wire_NodeBase *that);

void wire_event_handled__method__NodeBase(int64_t port_, struct wire_NodeBase *that);

void wire_next_event__method__NodeBase(int64_t port_, struct wire_NodeBase *that);

void wire_node_id__method__NodeBase(int64_t port_, struct wire_NodeBase *that);

void wire_listening_address__method__NodeBase(int64_t port_, struct wire_NodeBase *that);

void wire_new_funding_address__method__NodeBase(int64_t port_, struct wire_NodeBase *that);

void wire_on_chain_balance__method__NodeBase(int64_t port_, struct wire_NodeBase *that);

void wire_send_to_on_chain_address__method__NodeBase(int64_t port_,
                                                     struct wire_NodeBase *that,
                                                     struct wire_Address *address,
                                                     uint64_t amount_sats);

void wire_send_all_to_on_chain_address__method__NodeBase(int64_t port_,
                                                         struct wire_NodeBase *that,
                                                         struct wire_Address *address);

void wire_connect_open_channel__method__NodeBase(int64_t port_,
                                                 struct wire_NodeBase *that,
                                                 struct wire_SocketAddr *address,
                                                 struct wire_PublicKey *node_id,
                                                 uint64_t channel_amount_sats,
                                                 uint64_t *push_to_counterparty_msat,
                                                 bool announce_channel);

void wire_list_channels__method__NodeBase(int64_t port_, struct wire_NodeBase *that);

void wire_sync_wallets__method__NodeBase(int64_t port_, struct wire_NodeBase *that);

void wire_close_channel__method__NodeBase(int64_t port_,
                                          struct wire_NodeBase *that,
                                          struct wire_uint_8_list *channel_id,
                                          struct wire_PublicKey *counterparty_node_id);

void wire_send_payment__method__NodeBase(int64_t port_,
                                         struct wire_NodeBase *that,
                                         struct wire_Invoice *invoice);

void wire_send_payment_using_amount__method__NodeBase(int64_t port_,
                                                      struct wire_NodeBase *that,
                                                      struct wire_Invoice *invoice,
                                                      uint64_t amount_msat);

void wire_send_spontaneous_payment__method__NodeBase(int64_t port_,
                                                     struct wire_NodeBase *that,
                                                     uint64_t amount_msat,
                                                     struct wire_PublicKey *node_id);

void wire_receive_payment__method__NodeBase(int64_t port_,
                                            struct wire_NodeBase *that,
                                            uint64_t amount_msat,
                                            struct wire_uint_8_list *description,
                                            uint32_t expiry_secs);

void wire_receive_variable_amount_payment__method__NodeBase(int64_t port_,
                                                            struct wire_NodeBase *that,
                                                            struct wire_uint_8_list *description,
                                                            uint32_t expiry_secs);

void wire_payment__method__NodeBase(int64_t port_,
                                    struct wire_NodeBase *that,
                                    struct wire_PaymentHash *payment_hash);

struct wire_NodePointer new_NodePointer(void);

struct wire_Address *new_box_autoadd_address_0(void);

struct wire_BuilderBase *new_box_autoadd_builder_base_0(void);

struct wire_Invoice *new_box_autoadd_invoice_0(void);

struct wire_NodeBase *new_box_autoadd_node_base_0(void);

struct wire_PaymentHash *new_box_autoadd_payment_hash_0(void);

struct wire_PublicKey *new_box_autoadd_public_key_0(void);

struct wire_SocketAddr *new_box_autoadd_socket_addr_0(void);

uint64_t *new_box_autoadd_u64_0(uint64_t value);

struct wire_WalletEntropySource *new_box_autoadd_wallet_entropy_source_0(void);

struct wire_uint_8_list *new_uint_8_list_0(int32_t len);

void drop_opaque_NodePointer(const void *ptr);

const void *share_opaque_NodePointer(const void *ptr);

union WalletEntropySourceKind *inflate_WalletEntropySource_SeedFile(void);

union WalletEntropySourceKind *inflate_WalletEntropySource_SeedBytes(void);

union WalletEntropySourceKind *inflate_WalletEntropySource_Bip39Mnemonic(void);

void free_WireSyncReturn(WireSyncReturn ptr);

static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) wire_new__static_method__BuilderBase);
    dummy_var ^= ((int64_t) (void*) wire_set_entropy_seed_path__method__BuilderBase);
    dummy_var ^= ((int64_t) (void*) wire_set_entropy_seed_bytes__method__BuilderBase);
    dummy_var ^= ((int64_t) (void*) wire_set_storage_dir_path__method__BuilderBase);
    dummy_var ^= ((int64_t) (void*) wire_set_esplora_server_url__method__BuilderBase);
    dummy_var ^= ((int64_t) (void*) wire_set_network__method__BuilderBase);
    dummy_var ^= ((int64_t) (void*) wire_set_listening_address__method__BuilderBase);
    dummy_var ^= ((int64_t) (void*) wire_set_entropy_bip39_mnemonic__method__BuilderBase);
    dummy_var ^= ((int64_t) (void*) wire_build__static_method__BuilderBase);
    dummy_var ^= ((int64_t) (void*) wire_start__method__NodeBase);
    dummy_var ^= ((int64_t) (void*) wire_stop__method__NodeBase);
    dummy_var ^= ((int64_t) (void*) wire_event_handled__method__NodeBase);
    dummy_var ^= ((int64_t) (void*) wire_next_event__method__NodeBase);
    dummy_var ^= ((int64_t) (void*) wire_node_id__method__NodeBase);
    dummy_var ^= ((int64_t) (void*) wire_listening_address__method__NodeBase);
    dummy_var ^= ((int64_t) (void*) wire_new_funding_address__method__NodeBase);
    dummy_var ^= ((int64_t) (void*) wire_on_chain_balance__method__NodeBase);
    dummy_var ^= ((int64_t) (void*) wire_send_to_on_chain_address__method__NodeBase);
    dummy_var ^= ((int64_t) (void*) wire_send_all_to_on_chain_address__method__NodeBase);
    dummy_var ^= ((int64_t) (void*) wire_connect_open_channel__method__NodeBase);
    dummy_var ^= ((int64_t) (void*) wire_list_channels__method__NodeBase);
    dummy_var ^= ((int64_t) (void*) wire_sync_wallets__method__NodeBase);
    dummy_var ^= ((int64_t) (void*) wire_close_channel__method__NodeBase);
    dummy_var ^= ((int64_t) (void*) wire_send_payment__method__NodeBase);
    dummy_var ^= ((int64_t) (void*) wire_send_payment_using_amount__method__NodeBase);
    dummy_var ^= ((int64_t) (void*) wire_send_spontaneous_payment__method__NodeBase);
    dummy_var ^= ((int64_t) (void*) wire_receive_payment__method__NodeBase);
    dummy_var ^= ((int64_t) (void*) wire_receive_variable_amount_payment__method__NodeBase);
    dummy_var ^= ((int64_t) (void*) wire_payment__method__NodeBase);
    dummy_var ^= ((int64_t) (void*) new_NodePointer);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_address_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_builder_base_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_invoice_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_node_base_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_payment_hash_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_public_key_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_socket_addr_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_u64_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_wallet_entropy_source_0);
    dummy_var ^= ((int64_t) (void*) new_uint_8_list_0);
    dummy_var ^= ((int64_t) (void*) drop_opaque_NodePointer);
    dummy_var ^= ((int64_t) (void*) share_opaque_NodePointer);
    dummy_var ^= ((int64_t) (void*) inflate_WalletEntropySource_SeedFile);
    dummy_var ^= ((int64_t) (void*) inflate_WalletEntropySource_SeedBytes);
    dummy_var ^= ((int64_t) (void*) inflate_WalletEntropySource_Bip39Mnemonic);
    dummy_var ^= ((int64_t) (void*) free_WireSyncReturn);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    dummy_var ^= ((int64_t) (void*) get_dart_object);
    dummy_var ^= ((int64_t) (void*) drop_dart_object);
    dummy_var ^= ((int64_t) (void*) new_dart_opaque);
    return dummy_var;
}
