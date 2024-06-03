#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
// EXTRA BEGIN
typedef struct DartCObject *WireSyncRust2DartDco;
typedef struct WireSyncRust2DartSse {
  uint8_t *ptr;
  int32_t len;
} WireSyncRust2DartSse;

typedef int64_t DartPort;
typedef bool (*DartPostCObjectFnType)(DartPort port_id, void *message);
void store_dart_post_cobject(DartPostCObjectFnType ptr);
// EXTRA END
typedef struct _Dart_Handle* Dart_Handle;

typedef struct wire_cst_list_prim_u_8_strict {
  uint8_t *ptr;
  int32_t len;
} wire_cst_list_prim_u_8_strict;

typedef struct wire_cst_SocketAddress_TcpIpV4 {
  struct wire_cst_list_prim_u_8_strict *addr;
  uint16_t port;
} wire_cst_SocketAddress_TcpIpV4;

typedef struct wire_cst_SocketAddress_TcpIpV6 {
  struct wire_cst_list_prim_u_8_strict *addr;
  uint16_t port;
} wire_cst_SocketAddress_TcpIpV6;

typedef struct wire_cst_SocketAddress_OnionV2 {
  struct wire_cst_list_prim_u_8_strict *field0;
} wire_cst_SocketAddress_OnionV2;

typedef struct wire_cst_SocketAddress_OnionV3 {
  struct wire_cst_list_prim_u_8_strict *ed25519_pubkey;
  uint16_t checksum;
  uint8_t version;
  uint16_t port;
} wire_cst_SocketAddress_OnionV3;

typedef struct wire_cst_SocketAddress_Hostname {
  struct wire_cst_list_prim_u_8_strict *addr;
  uint16_t port;
} wire_cst_SocketAddress_Hostname;

typedef union SocketAddressKind {
  struct wire_cst_SocketAddress_TcpIpV4 TcpIpV4;
  struct wire_cst_SocketAddress_TcpIpV6 TcpIpV6;
  struct wire_cst_SocketAddress_OnionV2 OnionV2;
  struct wire_cst_SocketAddress_OnionV3 OnionV3;
  struct wire_cst_SocketAddress_Hostname Hostname;
} SocketAddressKind;

typedef struct wire_cst_socket_address {
  int32_t tag;
  union SocketAddressKind kind;
} wire_cst_socket_address;

typedef struct wire_cst_list_socket_address {
  struct wire_cst_socket_address *ptr;
  int32_t len;
} wire_cst_list_socket_address;

typedef struct wire_cst_public_key {
  struct wire_cst_list_prim_u_8_strict *hex;
} wire_cst_public_key;

typedef struct wire_cst_list_public_key {
  struct wire_cst_public_key *ptr;
  int32_t len;
} wire_cst_list_public_key;

typedef struct wire_cst_config {
  struct wire_cst_list_prim_u_8_strict *storage_dir_path;
  struct wire_cst_list_prim_u_8_strict *log_dir_path;
  int32_t network;
  struct wire_cst_list_socket_address *listening_addresses;
  uint32_t default_cltv_expiry_delta;
  uint64_t onchain_wallet_sync_interval_secs;
  uint64_t wallet_sync_interval_secs;
  uint64_t fee_rate_cache_update_interval_secs;
  struct wire_cst_list_public_key *trusted_peers_0conf;
  uint64_t probing_liquidity_limit_multiplier;
  int32_t log_level;
} wire_cst_config;

typedef struct wire_cst_ChainDataSourceConfig_Esplora {
  struct wire_cst_list_prim_u_8_strict *field0;
} wire_cst_ChainDataSourceConfig_Esplora;

typedef union ChainDataSourceConfigKind {
  struct wire_cst_ChainDataSourceConfig_Esplora Esplora;
} ChainDataSourceConfigKind;

typedef struct wire_cst_chain_data_source_config {
  int32_t tag;
  union ChainDataSourceConfigKind kind;
} wire_cst_chain_data_source_config;

typedef struct wire_cst_EntropySourceConfig_SeedFile {
  struct wire_cst_list_prim_u_8_strict *field0;
} wire_cst_EntropySourceConfig_SeedFile;

typedef struct wire_cst_EntropySourceConfig_SeedBytes {
  struct wire_cst_list_prim_u_8_strict *field0;
} wire_cst_EntropySourceConfig_SeedBytes;

typedef struct wire_cst_ldk_mnemonic {
  struct wire_cst_list_prim_u_8_strict *seed_phrase;
} wire_cst_ldk_mnemonic;

typedef struct wire_cst_EntropySourceConfig_Bip39Mnemonic {
  struct wire_cst_ldk_mnemonic *mnemonic;
  struct wire_cst_list_prim_u_8_strict *passphrase;
} wire_cst_EntropySourceConfig_Bip39Mnemonic;

typedef union EntropySourceConfigKind {
  struct wire_cst_EntropySourceConfig_SeedFile SeedFile;
  struct wire_cst_EntropySourceConfig_SeedBytes SeedBytes;
  struct wire_cst_EntropySourceConfig_Bip39Mnemonic Bip39Mnemonic;
} EntropySourceConfigKind;

typedef struct wire_cst_entropy_source_config {
  int32_t tag;
  union EntropySourceConfigKind kind;
} wire_cst_entropy_source_config;

typedef struct wire_cst_GossipSourceConfig_RapidGossipSync {
  struct wire_cst_list_prim_u_8_strict *field0;
} wire_cst_GossipSourceConfig_RapidGossipSync;

typedef union GossipSourceConfigKind {
  struct wire_cst_GossipSourceConfig_RapidGossipSync RapidGossipSync;
} GossipSourceConfigKind;

typedef struct wire_cst_gossip_source_config {
  int32_t tag;
  union GossipSourceConfigKind kind;
} wire_cst_gossip_source_config;

typedef struct wire_cst_ldk_node {
  uintptr_t ptr;
} wire_cst_ldk_node;

typedef struct wire_cst_channel_id {
  struct wire_cst_list_prim_u_8_strict *data;
} wire_cst_channel_id;

typedef struct wire_cst_MaxDustHTLCExposure_FixedLimitMsat {
  uint64_t field0;
} wire_cst_MaxDustHTLCExposure_FixedLimitMsat;

typedef struct wire_cst_MaxDustHTLCExposure_FeeRateMultiplier {
  uint64_t field0;
} wire_cst_MaxDustHTLCExposure_FeeRateMultiplier;

typedef union MaxDustHTLCExposureKind {
  struct wire_cst_MaxDustHTLCExposure_FixedLimitMsat FixedLimitMsat;
  struct wire_cst_MaxDustHTLCExposure_FeeRateMultiplier FeeRateMultiplier;
} MaxDustHTLCExposureKind;

typedef struct wire_cst_max_dust_htlc_exposure {
  int32_t tag;
  union MaxDustHTLCExposureKind kind;
} wire_cst_max_dust_htlc_exposure;

typedef struct wire_cst_channel_config {
  uint32_t forwarding_fee_proportional_millionths;
  uint32_t forwarding_fee_base_msat;
  uint16_t cltv_expiry_delta;
  struct wire_cst_max_dust_htlc_exposure max_dust_htlc_exposure;
  uint64_t force_close_avoidance_max_fee_satoshis;
  bool accept_underpaying_htlcs;
} wire_cst_channel_config;

typedef struct wire_cst_payment_hash {
  struct wire_cst_list_prim_u_8_strict *data;
} wire_cst_payment_hash;

typedef struct wire_cst_address {
  struct wire_cst_list_prim_u_8_strict *s;
} wire_cst_address;

typedef struct wire_cst_bolt_11_invoice {
  struct wire_cst_list_prim_u_8_strict *signed_raw_invoice;
} wire_cst_bolt_11_invoice;

typedef struct wire_cst_list_prim_u_8_loose {
  uint8_t *ptr;
  int32_t len;
} wire_cst_list_prim_u_8_loose;

typedef struct wire_cst_Event_PaymentSuccessful {
  struct wire_cst_payment_hash *payment_hash;
} wire_cst_Event_PaymentSuccessful;

typedef struct wire_cst_Event_PaymentFailed {
  struct wire_cst_payment_hash *payment_hash;
} wire_cst_Event_PaymentFailed;

typedef struct wire_cst_Event_PaymentReceived {
  struct wire_cst_payment_hash *payment_hash;
  uint64_t amount_msat;
} wire_cst_Event_PaymentReceived;

typedef struct wire_cst_user_channel_id {
  uint64_t data;
} wire_cst_user_channel_id;

typedef struct wire_cst_Event_ChannelReady {
  struct wire_cst_channel_id *channel_id;
  struct wire_cst_user_channel_id *user_channel_id;
  struct wire_cst_public_key *counterparty_node_id;
} wire_cst_Event_ChannelReady;

typedef struct wire_cst_Event_ChannelClosed {
  struct wire_cst_channel_id *channel_id;
  struct wire_cst_user_channel_id *user_channel_id;
  struct wire_cst_public_key *counterparty_node_id;
} wire_cst_Event_ChannelClosed;

typedef struct wire_cst_txid {
  struct wire_cst_list_prim_u_8_strict *hash;
} wire_cst_txid;

typedef struct wire_cst_out_point {
  struct wire_cst_txid txid;
  uint32_t vout;
} wire_cst_out_point;

typedef struct wire_cst_Event_ChannelPending {
  struct wire_cst_channel_id *channel_id;
  struct wire_cst_user_channel_id *user_channel_id;
  struct wire_cst_channel_id *former_temporary_channel_id;
  struct wire_cst_public_key *counterparty_node_id;
  struct wire_cst_out_point *funding_txo;
} wire_cst_Event_ChannelPending;

typedef union EventKind {
  struct wire_cst_Event_PaymentSuccessful PaymentSuccessful;
  struct wire_cst_Event_PaymentFailed PaymentFailed;
  struct wire_cst_Event_PaymentReceived PaymentReceived;
  struct wire_cst_Event_ChannelReady ChannelReady;
  struct wire_cst_Event_ChannelClosed ChannelClosed;
  struct wire_cst_Event_ChannelPending ChannelPending;
} EventKind;

typedef struct wire_cst_event {
  int32_t tag;
  union EventKind kind;
} wire_cst_event;

typedef struct wire_cst_payment_preimage {
  struct wire_cst_list_prim_u_8_strict *data;
} wire_cst_payment_preimage;

typedef struct wire_cst_payment_secret {
  struct wire_cst_list_prim_u_8_strict *data;
} wire_cst_payment_secret;

typedef struct wire_cst_payment_details {
  struct wire_cst_payment_hash hash;
  struct wire_cst_payment_preimage *preimage;
  struct wire_cst_payment_secret *secret;
  uint64_t *amount_msat;
  int32_t direction;
  int32_t status;
} wire_cst_payment_details;

typedef struct wire_cst_channel_details {
  struct wire_cst_channel_id channel_id;
  struct wire_cst_public_key counterparty_node_id;
  struct wire_cst_list_prim_u_8_strict *funding_txo;
  uint64_t channel_value_sats;
  uint64_t *unspendable_punishment_reserve;
  struct wire_cst_user_channel_id user_channel_id;
  uint32_t feerate_sat_per_1000_weight;
  uint64_t balance_msat;
  uint64_t outbound_capacity_msat;
  uint64_t inbound_capacity_msat;
  uint32_t *confirmations_required;
  uint32_t *confirmations;
  bool is_outbound;
  bool is_channel_ready;
  bool is_usable;
  bool is_public;
} wire_cst_channel_details;

typedef struct wire_cst_list_channel_details {
  struct wire_cst_channel_details *ptr;
  int32_t len;
} wire_cst_list_channel_details;

typedef struct wire_cst_list_payment_details {
  struct wire_cst_payment_details *ptr;
  int32_t len;
} wire_cst_list_payment_details;

typedef struct wire_cst_peer_details {
  struct wire_cst_public_key node_id;
  struct wire_cst_socket_address address;
  bool is_connected;
} wire_cst_peer_details;

typedef struct wire_cst_list_peer_details {
  struct wire_cst_peer_details *ptr;
  int32_t len;
} wire_cst_list_peer_details;

void frbgen_ldk_node_wire_build_with_sqlite_store(int64_t port_,
                                                  struct wire_cst_config *config,
                                                  struct wire_cst_chain_data_source_config *chain_data_source_config,
                                                  struct wire_cst_entropy_source_config *entropy_source_config,
                                                  struct wire_cst_gossip_source_config *gossip_source_config);

void frbgen_ldk_node_wire_ldk_mnemonic_generate(int64_t port_);

void frbgen_ldk_node_wire_ldk_node_close_channel(int64_t port_,
                                                 struct wire_cst_ldk_node *that,
                                                 struct wire_cst_channel_id *channel_id,
                                                 struct wire_cst_public_key *counterparty_node_id);

void frbgen_ldk_node_wire_ldk_node_connect(int64_t port_,
                                           struct wire_cst_ldk_node *that,
                                           struct wire_cst_public_key *node_id,
                                           struct wire_cst_socket_address *address,
                                           bool persist);

void frbgen_ldk_node_wire_ldk_node_connect_open_channel(int64_t port_,
                                                        struct wire_cst_ldk_node *that,
                                                        struct wire_cst_socket_address *socket_address,
                                                        struct wire_cst_public_key *node_id,
                                                        uint64_t channel_amount_sats,
                                                        uint64_t *push_to_counterparty_msat,
                                                        bool announce_channel,
                                                        struct wire_cst_channel_config *channel_config);

void frbgen_ldk_node_wire_ldk_node_disconnect(int64_t port_,
                                              struct wire_cst_ldk_node *that,
                                              struct wire_cst_public_key *counterparty_node_id);

void frbgen_ldk_node_wire_ldk_node_event_handled(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_is_running(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_list_channels(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_list_payments(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_list_payments_with_filter(int64_t port_,
                                                             struct wire_cst_ldk_node *that,
                                                             int32_t payment_direction);

void frbgen_ldk_node_wire_ldk_node_list_peers(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_listening_addresses(int64_t port_,
                                                       struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_new_onchain_address(int64_t port_,
                                                       struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_next_event(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_node_id(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_payment(int64_t port_,
                                           struct wire_cst_ldk_node *that,
                                           struct wire_cst_payment_hash *payment_hash);

void frbgen_ldk_node_wire_ldk_node_receive_payment(int64_t port_,
                                                   struct wire_cst_ldk_node *that,
                                                   uint64_t amount_msat,
                                                   struct wire_cst_list_prim_u_8_strict *description,
                                                   uint32_t expiry_secs);

void frbgen_ldk_node_wire_ldk_node_receive_variable_amount_payment(int64_t port_,
                                                                   struct wire_cst_ldk_node *that,
                                                                   struct wire_cst_list_prim_u_8_strict *description,
                                                                   uint32_t expiry_secs);

void frbgen_ldk_node_wire_ldk_node_remove_payment(int64_t port_,
                                                  struct wire_cst_ldk_node *that,
                                                  struct wire_cst_payment_hash *payment_hash);

void frbgen_ldk_node_wire_ldk_node_send_all_to_onchain_address(int64_t port_,
                                                               struct wire_cst_ldk_node *that,
                                                               struct wire_cst_address *address);

void frbgen_ldk_node_wire_ldk_node_send_payment(int64_t port_,
                                                struct wire_cst_ldk_node *that,
                                                struct wire_cst_bolt_11_invoice *invoice);

void frbgen_ldk_node_wire_ldk_node_send_payment_probes(int64_t port_,
                                                       struct wire_cst_ldk_node *that,
                                                       struct wire_cst_bolt_11_invoice *invoice);

void frbgen_ldk_node_wire_ldk_node_send_payment_probes_using_amount(int64_t port_,
                                                                    struct wire_cst_ldk_node *that,
                                                                    struct wire_cst_bolt_11_invoice *invoice,
                                                                    uint64_t amount_msat);

void frbgen_ldk_node_wire_ldk_node_send_payment_using_amount(int64_t port_,
                                                             struct wire_cst_ldk_node *that,
                                                             struct wire_cst_bolt_11_invoice *invoice,
                                                             uint64_t amount_msat);

void frbgen_ldk_node_wire_ldk_node_send_spontaneous_payment(int64_t port_,
                                                            struct wire_cst_ldk_node *that,
                                                            uint64_t amount_msat,
                                                            struct wire_cst_public_key *node_id);

void frbgen_ldk_node_wire_ldk_node_send_spontaneous_payment_probes(int64_t port_,
                                                                   struct wire_cst_ldk_node *that,
                                                                   uint64_t amount_msat,
                                                                   struct wire_cst_public_key *node_id);

void frbgen_ldk_node_wire_ldk_node_send_to_onchain_address(int64_t port_,
                                                           struct wire_cst_ldk_node *that,
                                                           struct wire_cst_address *address,
                                                           uint64_t amount_sats);

void frbgen_ldk_node_wire_ldk_node_sign_message(int64_t port_,
                                                struct wire_cst_ldk_node *that,
                                                struct wire_cst_list_prim_u_8_loose *msg);

void frbgen_ldk_node_wire_ldk_node_spendable_onchain_balance_sats(int64_t port_,
                                                                  struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_start(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_stop(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_sync_wallets(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_total_onchain_balance_sats(int64_t port_,
                                                              struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_update_channel_config(int64_t port_,
                                                         struct wire_cst_ldk_node *that,
                                                         struct wire_cst_channel_id *channel_id,
                                                         struct wire_cst_public_key *counterparty_node_id,
                                                         struct wire_cst_channel_config *channel_config);

void frbgen_ldk_node_wire_ldk_node_verify_signature(int64_t port_,
                                                    struct wire_cst_ldk_node *that,
                                                    struct wire_cst_list_prim_u_8_loose *msg,
                                                    struct wire_cst_list_prim_u_8_strict *sig,
                                                    struct wire_cst_public_key *pkey);

void frbgen_ldk_node_wire_ldk_node_wait_next_event(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_socket_address_as_string(int64_t port_,
                                                   struct wire_cst_socket_address *that);

void frbgen_ldk_node_wire_socket_address_from_str(int64_t port_,
                                                  struct wire_cst_list_prim_u_8_strict *address);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_NodeSqliteStore(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_NodeSqliteStore(const void *ptr);

struct wire_cst_address *frbgen_ldk_node_cst_new_box_autoadd_address(void);

struct wire_cst_bolt_11_invoice *frbgen_ldk_node_cst_new_box_autoadd_bolt_11_invoice(void);

struct wire_cst_chain_data_source_config *frbgen_ldk_node_cst_new_box_autoadd_chain_data_source_config(void);

struct wire_cst_channel_config *frbgen_ldk_node_cst_new_box_autoadd_channel_config(void);

struct wire_cst_channel_id *frbgen_ldk_node_cst_new_box_autoadd_channel_id(void);

struct wire_cst_config *frbgen_ldk_node_cst_new_box_autoadd_config(void);

struct wire_cst_entropy_source_config *frbgen_ldk_node_cst_new_box_autoadd_entropy_source_config(void);

struct wire_cst_event *frbgen_ldk_node_cst_new_box_autoadd_event(void);

struct wire_cst_gossip_source_config *frbgen_ldk_node_cst_new_box_autoadd_gossip_source_config(void);

struct wire_cst_ldk_mnemonic *frbgen_ldk_node_cst_new_box_autoadd_ldk_mnemonic(void);

struct wire_cst_ldk_node *frbgen_ldk_node_cst_new_box_autoadd_ldk_node(void);

struct wire_cst_out_point *frbgen_ldk_node_cst_new_box_autoadd_out_point(void);

struct wire_cst_payment_details *frbgen_ldk_node_cst_new_box_autoadd_payment_details(void);

struct wire_cst_payment_hash *frbgen_ldk_node_cst_new_box_autoadd_payment_hash(void);

struct wire_cst_payment_preimage *frbgen_ldk_node_cst_new_box_autoadd_payment_preimage(void);

struct wire_cst_payment_secret *frbgen_ldk_node_cst_new_box_autoadd_payment_secret(void);

struct wire_cst_public_key *frbgen_ldk_node_cst_new_box_autoadd_public_key(void);

struct wire_cst_socket_address *frbgen_ldk_node_cst_new_box_autoadd_socket_address(void);

uint32_t *frbgen_ldk_node_cst_new_box_autoadd_u_32(uint32_t value);

uint64_t *frbgen_ldk_node_cst_new_box_autoadd_u_64(uint64_t value);

struct wire_cst_user_channel_id *frbgen_ldk_node_cst_new_box_autoadd_user_channel_id(void);

struct wire_cst_list_channel_details *frbgen_ldk_node_cst_new_list_channel_details(int32_t len);

struct wire_cst_list_payment_details *frbgen_ldk_node_cst_new_list_payment_details(int32_t len);

struct wire_cst_list_peer_details *frbgen_ldk_node_cst_new_list_peer_details(int32_t len);

struct wire_cst_list_prim_u_8_loose *frbgen_ldk_node_cst_new_list_prim_u_8_loose(int32_t len);

struct wire_cst_list_prim_u_8_strict *frbgen_ldk_node_cst_new_list_prim_u_8_strict(int32_t len);

struct wire_cst_list_public_key *frbgen_ldk_node_cst_new_list_public_key(int32_t len);

struct wire_cst_list_socket_address *frbgen_ldk_node_cst_new_list_socket_address(int32_t len);
static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_bolt_11_invoice);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_chain_data_source_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_channel_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_channel_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_entropy_source_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_event);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_gossip_source_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_ldk_mnemonic);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_ldk_node);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_out_point);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_payment_details);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_payment_hash);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_payment_preimage);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_payment_secret);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_public_key);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_socket_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_u_32);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_u_64);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_user_channel_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_channel_details);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_payment_details);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_peer_details);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_prim_u_8_loose);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_prim_u_8_strict);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_public_key);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_socket_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_NodeSqliteStore);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_NodeSqliteStore);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_build_with_sqlite_store);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_mnemonic_generate);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_close_channel);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_connect);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_connect_open_channel);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_disconnect);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_event_handled);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_is_running);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_list_channels);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_list_payments);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_list_payments_with_filter);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_list_peers);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_listening_addresses);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_new_onchain_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_next_event);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_node_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_receive_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_receive_variable_amount_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_remove_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_send_all_to_onchain_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_send_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_send_payment_probes);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_send_payment_probes_using_amount);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_send_payment_using_amount);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_send_spontaneous_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_send_spontaneous_payment_probes);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_send_to_onchain_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_sign_message);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_spendable_onchain_balance_sats);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_start);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_stop);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_sync_wallets);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_total_onchain_balance_sats);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_update_channel_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_verify_signature);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_wait_next_event);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_socket_address_as_string);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_socket_address_from_str);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    return dummy_var;
}
