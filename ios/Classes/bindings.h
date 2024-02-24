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

typedef struct wire_SocketAddress_TcpIpV4 {
  struct wire_uint_8_list *addr;
  uint16_t port;
} wire_SocketAddress_TcpIpV4;

typedef struct wire_SocketAddress_TcpIpV6 {
  struct wire_uint_8_list *addr;
  uint16_t port;
} wire_SocketAddress_TcpIpV6;

typedef struct wire_SocketAddress_OnionV2 {
  struct wire_uint_8_list *field0;
} wire_SocketAddress_OnionV2;

typedef struct wire_SocketAddress_OnionV3 {
  struct wire_uint_8_list *ed25519_pubkey;
  uint16_t checksum;
  uint8_t version;
  uint16_t port;
} wire_SocketAddress_OnionV3;

typedef struct wire_SocketAddress_Hostname {
  struct wire_uint_8_list *addr;
  uint16_t port;
} wire_SocketAddress_Hostname;

typedef union SocketAddressKind {
  struct wire_SocketAddress_TcpIpV4 *TcpIpV4;
  struct wire_SocketAddress_TcpIpV6 *TcpIpV6;
  struct wire_SocketAddress_OnionV2 *OnionV2;
  struct wire_SocketAddress_OnionV3 *OnionV3;
  struct wire_SocketAddress_Hostname *Hostname;
} SocketAddressKind;

typedef struct wire_SocketAddress {
  int32_t tag;
  union SocketAddressKind *kind;
} wire_SocketAddress;

typedef struct wire_list_socket_address {
  struct wire_SocketAddress *ptr;
  int32_t len;
} wire_list_socket_address;

typedef struct wire_PublicKey {
  struct wire_uint_8_list *hex_code;
} wire_PublicKey;

typedef struct wire_list_public_key {
  struct wire_PublicKey *ptr;
  int32_t len;
} wire_list_public_key;

typedef struct wire_Config {
  struct wire_uint_8_list *storage_dir_path;
  struct wire_uint_8_list *log_dir_path;
  int32_t network;
  struct wire_list_socket_address *listening_addresses;
  uint32_t default_cltv_expiry_delta;
  uint64_t onchain_wallet_sync_interval_secs;
  uint64_t wallet_sync_interval_secs;
  uint64_t fee_rate_cache_update_interval_secs;
  struct wire_list_public_key *trusted_peers_0conf;
  uint64_t probing_liquidity_limit_multiplier;
  int32_t log_level;
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
  struct wire_uint_8_list *seed_phrase;
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
  struct wire_uint_8_list *s;
} wire_Address;

typedef struct wire_MaxDustHTLCExposure_FixedLimitMsat {
  uint64_t field0;
} wire_MaxDustHTLCExposure_FixedLimitMsat;

typedef struct wire_MaxDustHTLCExposure_FeeRateMultiplier {
  uint64_t field0;
} wire_MaxDustHTLCExposure_FeeRateMultiplier;

typedef union MaxDustHTLCExposureKind {
  struct wire_MaxDustHTLCExposure_FixedLimitMsat *FixedLimitMsat;
  struct wire_MaxDustHTLCExposure_FeeRateMultiplier *FeeRateMultiplier;
} MaxDustHTLCExposureKind;

typedef struct wire_MaxDustHTLCExposure {
  int32_t tag;
  union MaxDustHTLCExposureKind *kind;
} wire_MaxDustHTLCExposure;

typedef struct wire_ChannelConfig {
  uint32_t forwarding_fee_proportional_millionths;
  uint32_t forwarding_fee_base_msat;
  uint16_t cltv_expiry_delta;
  struct wire_MaxDustHTLCExposure max_dust_htlc_exposure;
  uint64_t force_close_avoidance_max_fee_satoshis;
  bool accept_underpaying_htlcs;
} wire_ChannelConfig;

typedef struct wire_ChannelId {
  struct wire_uint_8_list *data;
} wire_ChannelId;

typedef struct wire_Bolt11Invoice {
  struct wire_uint_8_list *signed_raw_invoice;
} wire_Bolt11Invoice;

typedef struct wire_PaymentHash {
  struct wire_uint_8_list *data;
} wire_PaymentHash;

typedef struct DartCObject *WireSyncReturn;

void store_dart_post_cobject(DartPostCObjectFnType ptr);

Dart_Handle get_dart_object(uintptr_t ptr);

void drop_dart_object(uintptr_t ptr);

uintptr_t new_dart_opaque(Dart_Handle handle);

intptr_t init_frb_dart_api_dl(void *obj);

void wire_finalize_builder(int64_t port_,
                           struct wire_Config *config,
                           struct wire_ChainDataSourceConfig *chain_data_source_config,
                           struct wire_EntropySourceConfig *entropy_source_config,
                           struct wire_GossipSourceConfig *gossip_source_config);

void wire_from_str__static_method__SocketAddress(int64_t port_, struct wire_uint_8_list *address);

void wire_to_string__method__SocketAddress(int64_t port_, struct wire_SocketAddress *that);

void wire_generate__static_method__Mnemonic(int64_t port_);

void wire_start__method__NodePointer(int64_t port_, struct wire_NodePointer *that);

void wire_stop__method__NodePointer(int64_t port_, struct wire_NodePointer *that);

void wire_event_handled__method__NodePointer(int64_t port_, struct wire_NodePointer *that);

void wire_next_event__method__NodePointer(int64_t port_, struct wire_NodePointer *that);

void wire_wait_next_event__method__NodePointer(int64_t port_, struct wire_NodePointer *that);

void wire_node_id__method__NodePointer(int64_t port_, struct wire_NodePointer *that);

void wire_listening_addresses__method__NodePointer(int64_t port_, struct wire_NodePointer *that);

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
                                       struct wire_SocketAddress *address,
                                       bool persist);

void wire_disconnect__method__NodePointer(int64_t port_,
                                          struct wire_NodePointer *that,
                                          struct wire_PublicKey *counterparty_node_id);

void wire_connect_open_channel__method__NodePointer(int64_t port_,
                                                    struct wire_NodePointer *that,
                                                    struct wire_SocketAddress *address,
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
                                            struct wire_Bolt11Invoice *invoice);

void wire_send_payment_using_amount__method__NodePointer(int64_t port_,
                                                         struct wire_NodePointer *that,
                                                         struct wire_Bolt11Invoice *invoice,
                                                         uint64_t amount_msat);

void wire_send_spontaneous_payment__method__NodePointer(int64_t port_,
                                                        struct wire_NodePointer *that,
                                                        uint64_t amount_msat,
                                                        struct wire_PublicKey *node_id);

void wire_send_payment_probes__method__NodePointer(int64_t port_,
                                                   struct wire_NodePointer *that,
                                                   struct wire_Bolt11Invoice *invoice);

void wire_send_spontaneous_payment_probes__method__NodePointer(int64_t port_,
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

struct wire_Bolt11Invoice *new_box_autoadd_bolt_11_invoice_0(void);

struct wire_ChainDataSourceConfig *new_box_autoadd_chain_data_source_config_0(void);

struct wire_ChannelConfig *new_box_autoadd_channel_config_0(void);

struct wire_ChannelId *new_box_autoadd_channel_id_0(void);

struct wire_Config *new_box_autoadd_config_0(void);

struct wire_EntropySourceConfig *new_box_autoadd_entropy_source_config_0(void);

struct wire_GossipSourceConfig *new_box_autoadd_gossip_source_config_0(void);

struct wire_Mnemonic *new_box_autoadd_mnemonic_0(void);

struct wire_NodePointer *new_box_autoadd_node_pointer_0(void);

struct wire_PaymentHash *new_box_autoadd_payment_hash_0(void);

struct wire_PublicKey *new_box_autoadd_public_key_0(void);

struct wire_SocketAddress *new_box_autoadd_socket_address_0(void);

uint64_t *new_box_autoadd_u64_0(uint64_t value);

struct wire_list_public_key *new_list_public_key_0(int32_t len);

struct wire_list_socket_address *new_list_socket_address_0(int32_t len);

struct wire_uint_8_list *new_uint_8_list_0(int32_t len);

void drop_opaque_MutexNodeSqliteStore(const void *ptr);

const void *share_opaque_MutexNodeSqliteStore(const void *ptr);

union ChainDataSourceConfigKind *inflate_ChainDataSourceConfig_Esplora(void);

union EntropySourceConfigKind *inflate_EntropySourceConfig_SeedFile(void);

union EntropySourceConfigKind *inflate_EntropySourceConfig_SeedBytes(void);

union EntropySourceConfigKind *inflate_EntropySourceConfig_Bip39Mnemonic(void);

union GossipSourceConfigKind *inflate_GossipSourceConfig_RapidGossipSync(void);

union MaxDustHTLCExposureKind *inflate_MaxDustHTLCExposure_FixedLimitMsat(void);

union MaxDustHTLCExposureKind *inflate_MaxDustHTLCExposure_FeeRateMultiplier(void);

union SocketAddressKind *inflate_SocketAddress_TcpIpV4(void);

union SocketAddressKind *inflate_SocketAddress_TcpIpV6(void);

union SocketAddressKind *inflate_SocketAddress_OnionV2(void);

union SocketAddressKind *inflate_SocketAddress_OnionV3(void);

union SocketAddressKind *inflate_SocketAddress_Hostname(void);

void free_WireSyncReturn(WireSyncReturn ptr);

static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) wire_finalize_builder);
    dummy_var ^= ((int64_t) (void*) wire_from_str__static_method__SocketAddress);
    dummy_var ^= ((int64_t) (void*) wire_to_string__method__SocketAddress);
    dummy_var ^= ((int64_t) (void*) wire_generate__static_method__Mnemonic);
    dummy_var ^= ((int64_t) (void*) wire_start__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_stop__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_event_handled__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_next_event__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_wait_next_event__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_node_id__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_listening_addresses__method__NodePointer);
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
    dummy_var ^= ((int64_t) (void*) wire_send_payment_probes__method__NodePointer);
    dummy_var ^= ((int64_t) (void*) wire_send_spontaneous_payment_probes__method__NodePointer);
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
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_bolt_11_invoice_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_chain_data_source_config_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_channel_config_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_channel_id_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_config_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_entropy_source_config_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_gossip_source_config_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_mnemonic_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_node_pointer_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_payment_hash_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_public_key_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_socket_address_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_u64_0);
    dummy_var ^= ((int64_t) (void*) new_list_public_key_0);
    dummy_var ^= ((int64_t) (void*) new_list_socket_address_0);
    dummy_var ^= ((int64_t) (void*) new_uint_8_list_0);
    dummy_var ^= ((int64_t) (void*) drop_opaque_MutexNodeSqliteStore);
    dummy_var ^= ((int64_t) (void*) share_opaque_MutexNodeSqliteStore);
    dummy_var ^= ((int64_t) (void*) inflate_ChainDataSourceConfig_Esplora);
    dummy_var ^= ((int64_t) (void*) inflate_EntropySourceConfig_SeedFile);
    dummy_var ^= ((int64_t) (void*) inflate_EntropySourceConfig_SeedBytes);
    dummy_var ^= ((int64_t) (void*) inflate_EntropySourceConfig_Bip39Mnemonic);
    dummy_var ^= ((int64_t) (void*) inflate_GossipSourceConfig_RapidGossipSync);
    dummy_var ^= ((int64_t) (void*) inflate_MaxDustHTLCExposure_FixedLimitMsat);
    dummy_var ^= ((int64_t) (void*) inflate_MaxDustHTLCExposure_FeeRateMultiplier);
    dummy_var ^= ((int64_t) (void*) inflate_SocketAddress_TcpIpV4);
    dummy_var ^= ((int64_t) (void*) inflate_SocketAddress_TcpIpV6);
    dummy_var ^= ((int64_t) (void*) inflate_SocketAddress_OnionV2);
    dummy_var ^= ((int64_t) (void*) inflate_SocketAddress_OnionV3);
    dummy_var ^= ((int64_t) (void*) inflate_SocketAddress_Hostname);
    dummy_var ^= ((int64_t) (void*) free_WireSyncReturn);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    dummy_var ^= ((int64_t) (void*) get_dart_object);
    dummy_var ^= ((int64_t) (void*) drop_dart_object);
    dummy_var ^= ((int64_t) (void*) new_dart_opaque);
    return dummy_var;
}