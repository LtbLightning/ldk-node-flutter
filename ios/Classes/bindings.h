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

typedef struct wire_PublicKey {
  struct wire_uint_8_list *internal;
} wire_PublicKey;

typedef struct wire_list_public_key {
  struct wire_PublicKey *ptr;
  int32_t len;
} wire_list_public_key;

typedef struct wire_NetAddress_IPv4 {
  struct wire_uint_8_list *addr;
  uint16_t port;
} wire_NetAddress_IPv4;

typedef struct wire_NetAddress_IPv6 {
  struct wire_uint_8_list *addr;
  uint16_t port;
} wire_NetAddress_IPv6;

typedef union NetAddressKind {
  struct wire_NetAddress_IPv4 *IPv4;
  struct wire_NetAddress_IPv6 *IPv6;
} NetAddressKind;

typedef struct wire_NetAddress {
  int32_t tag;
  union NetAddressKind *kind;
} wire_NetAddress;

typedef struct wire_Config {
  struct wire_uint_8_list *storage_dir_path;
  int32_t network;
  uint64_t onchain_wallet_sync_interval_secs;
  uint64_t wallet_sync_interval_secs;
  uint64_t fee_rate_cache_update_interval_secs;
  struct wire_list_public_key *trusted_peers_0conf;
  int32_t log_level;
  struct wire_NetAddress *listening_address;
  uint32_t default_cltv_expiry_delta;
} wire_Config;

typedef struct wire_ChainDataSourceConfig_Esplora {
  struct wire_uint_8_list *field0;
} wire_ChainDataSourceConfig_Esplora;

typedef union ChainDataSourceConfigKind {
  struct wire_ChainDataSourceConfig_Esplora *Esplora;
} ChainDataSourceConfigKind;

typedef struct wire_ChainDataSourceConfig {
  int32_t tag;
  union ChainDataSourceConfigKind *kind;
} wire_ChainDataSourceConfig;

typedef struct wire_EntropySourceConfig_SeedFile {
  struct wire_uint_8_list *field0;
} wire_EntropySourceConfig_SeedFile;

typedef struct wire_EntropySourceConfig_SeedBytes {
  struct wire_uint_8_list *field0;
} wire_EntropySourceConfig_SeedBytes;

typedef struct wire_Mnemonic {
  struct wire_uint_8_list *internal;
} wire_Mnemonic;

typedef struct wire_EntropySourceConfig_Bip39Mnemonic {
  struct wire_Mnemonic *mnemonic;
  struct wire_uint_8_list *passphrase;
} wire_EntropySourceConfig_Bip39Mnemonic;

typedef union EntropySourceConfigKind {
  struct wire_EntropySourceConfig_SeedFile *SeedFile;
  struct wire_EntropySourceConfig_SeedBytes *SeedBytes;
  struct wire_EntropySourceConfig_Bip39Mnemonic *Bip39Mnemonic;
} EntropySourceConfigKind;

typedef struct wire_EntropySourceConfig {
  int32_t tag;
  union EntropySourceConfigKind *kind;
} wire_EntropySourceConfig;

typedef struct wire_GossipSourceConfig_P2PNetwork {

} wire_GossipSourceConfig_P2PNetwork;

typedef struct wire_GossipSourceConfig_RapidGossipSync {
  struct wire_uint_8_list *field0;
} wire_GossipSourceConfig_RapidGossipSync;

typedef union GossipSourceConfigKind {
  struct wire_GossipSourceConfig_P2PNetwork *P2PNetwork;
  struct wire_GossipSourceConfig_RapidGossipSync *RapidGossipSync;
} GossipSourceConfigKind;

typedef struct wire_GossipSourceConfig {
  int32_t tag;
  union GossipSourceConfigKind *kind;
} wire_GossipSourceConfig;

typedef struct wire_MutexNodeSqliteStore {
  const void *ptr;
} wire_MutexNodeSqliteStore;

typedef struct wire_NodePointer {
  struct wire_MutexNodeSqliteStore field0;
} wire_NodePointer;

typedef struct wire_Address {
  struct wire_uint_8_list *internal;
} wire_Address;

typedef struct wire_ChannelConfig {
  uint32_t forwarding_fee_proportional_millionths;
  uint32_t forwarding_fee_base_msat;
  uint16_t cltv_expiry_delta;
  uint64_t max_dust_htlc_exposure_msat;
  uint64_t force_close_avoidance_max_fee_satoshis;
} wire_ChannelConfig;

typedef struct wire_ChannelId {
  struct wire_uint_8_list *internal;
} wire_ChannelId;

typedef struct wire_Invoice {
  struct wire_uint_8_list *internal;
} wire_Invoice;

typedef struct wire_PaymentHash {
  struct wire_uint_8_list *internal;
} wire_PaymentHash;

typedef struct DartCObject *WireSyncReturn;

void store_dart_post_cobject(DartPostCObjectFnType ptr);

Dart_Handle get_dart_object(uintptr_t ptr);

void drop_dart_object(uintptr_t ptr);

uintptr_t new_dart_opaque(Dart_Handle handle);

intptr_t init_frb_dart_api_dl(void *obj);

void wire_build_node(int64_t port_,
                     struct wire_Config *config,
                     struct wire_ChainDataSourceConfig *chain_data_source_config,
                     struct wire_EntropySourceConfig *entropy_source_config,
                     struct wire_GossipSourceConfig *gossip_source_config);

void wire_start__method__NodePointer(int64_t port_, struct wire_NodePointer *that);

void wire_stop__method__NodePointer(int64_t port_, struct wire_NodePointer *that);

void wire_event_handled__method__NodePointer(int64_t port_, struct wire_NodePointer *that);

void wire_next_event__method__NodePointer(int64_t port_, struct wire_NodePointer *that);

void wire_wait_until_next_event__method__NodePointer(int64_t port_, struct wire_NodePointer *that);

void wire_node_id__method__NodePointer(int64_t port_, struct wire_NodePointer *that);

void wire_listening_address__method__NodePointer(int64_t port_, struct wire_NodePointer *that);

void wire_new_onchain_address__method__NodePointer(int64_t port_, struct wire_NodePointer *that);

void wire_spendable_onchain_balance_sats__method__NodePointer(int64_t port_,
                                                              struct wire_NodePointer *that);

void wire_total_onchain_balance_sats__method__NodePointer(int64_t port_,
                                                          struct wire_NodePointer *that);

void wire_send_to_onchain_address__method__NodePointer(int64_t port_,
                                                       struct wire_NodePointer *that,
                                                       struct wire_Address *address,
                                                       uint64_t amount_sats);

void wire_send_all_to_onchain_address__method__NodePointer(int64_t port_,
                                                           struct wire_NodePointer *that,
                                                           struct wire_Address *address);

void wire_list_channels__method__NodePointer(int64_t port_, struct wire_NodePointer *that);

void wire_connect__method__NodePointer(int64_t port_,
                                       struct wire_NodePointer *that,
                                       struct wire_PublicKey *node_id,
                                       struct wire_NetAddress *address,
                                       bool persist);

void wire_disconnect__method__NodePointer(int64_t port_,
                                          struct wire_NodePointer *that,
                                          struct wire_PublicKey *counterparty_node_id);

void wire_connect_open_channel__method__NodePointer(int64_t port_,
                                                    struct wire_NodePointer *that,
                                                    struct wire_NetAddress *address,
                                                    struct wire_PublicKey *node_id,
                                                    uint64_t channel_amount_sats,
                                                    uint64_t *push_to_counterparty_msat,
                                                    bool announce_channel,
                                                    struct wire_ChannelConfig *channel_config);

void wire_sync_wallets__method__NodePointer(int64_t port_, struct wire_NodePointer *that);

void wire_close_channel__method__NodePointer(int64_t port_,
                                             struct wire_NodePointer *that,
                                             struct wire_ChannelId *channel_id,
                                             struct wire_PublicKey *counterparty_node_id);

void wire_update_channel_config__method__NodePointer(int64_t port_,
                                                     struct wire_NodePointer *that,
                                                     struct wire_ChannelId *channel_id,
                                                     struct wire_PublicKey *counterparty_node_id,
                                                     struct wire_ChannelConfig *channel_config);

void wire_send_payment__method__NodePointer(int64_t port_,
                                            struct wire_NodePointer *that,
                                            struct wire_Invoice *invoice);

void wire_send_payment_using_amount__method__NodePointer(int64_t port_,
                                                         struct wire_NodePointer *that,
                                                         struct wire_Invoice *invoice,
                                                         uint64_t amount_msat);

void wire_send_spontaneous_payment__method__NodePointer(int64_t port_,
                                                        struct wire_NodePointer *that,
                                                        uint64_t amount_msat,
                                                        struct wire_PublicKey *node_id);

void wire_receive_payment__method__NodePointer(int64_t port_,
                                               struct wire_NodePointer *that,
                                               uint64_t amount_msat,
                                               struct wire_uint_8_list *description,
                                               uint32_t expiry_secs);

void wire_receive_variable_amount_payment__method__NodePointer(int64_t port_,
                                                               struct wire_NodePointer *that,
                                                               struct wire_uint_8_list *description,
                                                               uint32_t expiry_secs);

void wire_payment__method__NodePointer(int64_t port_,
                                       struct wire_NodePointer *that,
                                       struct wire_PaymentHash *payment_hash);

void wire_remove_payment__method__NodePointer(int64_t port_,
                                              struct wire_NodePointer *that,
                                              struct wire_PaymentHash *payment_hash);

void wire_list_payments_with_filter__method__NodePointer(int64_t port_,
                                                         struct wire_NodePointer *that,
                                                         int32_t payment_direction);

void wire_list_payments__method__NodePointer(int64_t port_, struct wire_NodePointer *that);

void wire_list_peers__method__NodePointer(int64_t port_, struct wire_NodePointer *that);

void wire_sign_message__method__NodePointer(int64_t port_,
                                            struct wire_NodePointer *that,
                                            struct wire_uint_8_list *msg);

void wire_verify_signature__method__NodePointer(int64_t port_,
                                                struct wire_NodePointer *that,
                                                struct wire_uint_8_list *msg,
                                                struct wire_uint_8_list *sig,
                                                struct wire_PublicKey *pkey);

struct wire_MutexNodeSqliteStore new_MutexNodeSqliteStore(void);

struct wire_Address *new_box_autoadd_address_0(void);

struct wire_ChainDataSourceConfig *new_box_autoadd_chain_data_source_config_0(void);

struct wire_ChannelConfig *new_box_autoadd_channel_config_0(void);

struct wire_ChannelId *new_box_autoadd_channel_id_0(void);

struct wire_Config *new_box_autoadd_config_0(void);

struct wire_EntropySourceConfig *new_box_autoadd_entropy_source_config_0(void);

struct wire_GossipSourceConfig *new_box_autoadd_gossip_source_config_0(void);

struct wire_Invoice *new_box_autoadd_invoice_0(void);

struct wire_Mnemonic *new_box_autoadd_mnemonic_0(void);

struct wire_NetAddress *new_box_autoadd_net_address_0(void);

struct wire_NodePointer *new_box_autoadd_node_pointer_0(void);

struct wire_PaymentHash *new_box_autoadd_payment_hash_0(void);

struct wire_PublicKey *new_box_autoadd_public_key_0(void);

uint64_t *new_box_autoadd_u64_0(uint64_t value);

struct wire_list_public_key *new_list_public_key_0(int32_t len);

struct wire_uint_8_list *new_uint_8_list_0(int32_t len);

void drop_opaque_MutexNodeSqliteStore(const void *ptr);

const void *share_opaque_MutexNodeSqliteStore(const void *ptr);

union ChainDataSourceConfigKind *inflate_ChainDataSourceConfig_Esplora(void);

union EntropySourceConfigKind *inflate_EntropySourceConfig_SeedFile(void);

union EntropySourceConfigKind *inflate_EntropySourceConfig_SeedBytes(void);

union EntropySourceConfigKind *inflate_EntropySourceConfig_Bip39Mnemonic(void);

union GossipSourceConfigKind *inflate_GossipSourceConfig_RapidGossipSync(void);

union NetAddressKind *inflate_NetAddress_IPv4(void);

union NetAddressKind *inflate_NetAddress_IPv6(void);

void free_WireSyncReturn(WireSyncReturn ptr);

static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) wire_build_node);
    dummy_var ^= ((int64_t) (void*) wire_start__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_stop__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_event_handled__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_next_event__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_wait_until_next_event__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_node_id__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_listening_address__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_new_onchain_address__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_spendable_onchain_balance_sats__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_total_onchain_balance_sats__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_send_to_onchain_address__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_send_all_to_onchain_address__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_list_channels__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_connect__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_disconnect__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_connect_open_channel__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_sync_wallets__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_close_channel__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_update_channel_config__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_send_payment__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_send_payment_using_amount__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_send_spontaneous_payment__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_receive_payment__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_receive_variable_amount_payment__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_payment__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_remove_payment__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_list_payments_with_filter__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_list_payments__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_list_peers__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_sign_message__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_verify_signature__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) new_MutexNodeSqliteStore);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_address_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_chain_data_source_config_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_channel_config_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_channel_id_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_config_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_entropy_source_config_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_gossip_source_config_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_invoice_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_mnemonic_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_net_address_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_node_pointer_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_payment_hash_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_public_key_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_u64_0);
    dummy_var ^= ((int64_t) (void*) new_list_public_key_0);
    dummy_var ^= ((int64_t) (void*) new_uint_8_list_0);
    dummy_var ^= ((int64_t) (void*) drop_opaque_MutexNodeSqliteStore);
    dummy_var ^= ((int64_t) (void*) share_opaque_MutexNodeSqliteStore);
    dummy_var ^= ((int64_t) (void*) inflate_ChainDataSourceConfig_Esplora);
    dummy_var ^= ((int64_t) (void*) inflate_EntropySourceConfig_SeedFile);
    dummy_var ^= ((int64_t) (void*) inflate_EntropySourceConfig_SeedBytes);
    dummy_var ^= ((int64_t) (void*) inflate_EntropySourceConfig_Bip39Mnemonic);
    dummy_var ^= ((int64_t) (void*) inflate_GossipSourceConfig_RapidGossipSync);
    dummy_var ^= ((int64_t) (void*) inflate_NetAddress_IPv4);
    dummy_var ^= ((int64_t) (void*) inflate_NetAddress_IPv6);
    dummy_var ^= ((int64_t) (void*) free_WireSyncReturn);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    dummy_var ^= ((int64_t) (void*) get_dart_object);
    dummy_var ^= ((int64_t) (void*) drop_dart_object);
    dummy_var ^= ((int64_t) (void*) new_dart_opaque);
    return dummy_var;
}
