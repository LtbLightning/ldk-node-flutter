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

typedef struct wire_cst_record_socket_address_public_key_opt_string {
  struct wire_cst_socket_address field0;
  struct wire_cst_public_key field1;
  struct wire_cst_list_prim_u_8_strict *field2;
} wire_cst_record_socket_address_public_key_opt_string;

typedef struct wire_cst_liquidity_source_config {
  struct wire_cst_record_socket_address_public_key_opt_string lsps2_service;
} wire_cst_liquidity_source_config;

typedef struct wire_cst_ldk_bolt_11_payment {
  uintptr_t ptr;
} wire_cst_ldk_bolt_11_payment;

typedef struct wire_cst_bolt_11_invoice {
  struct wire_cst_list_prim_u_8_strict *signed_raw_invoice;
} wire_cst_bolt_11_invoice;

typedef struct wire_cst_ldk_node {
  uintptr_t ptr;
} wire_cst_ldk_node;

typedef struct wire_cst_user_channel_id {
  struct wire_cst_list_prim_u_8_strict *data;
} wire_cst_user_channel_id;

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
  struct wire_cst_max_dust_htlc_exposure *max_dust_htlc_exposure;
  uint64_t force_close_avoidance_max_fee_satoshis;
  bool accept_underpaying_htlcs;
} wire_cst_channel_config;

typedef struct wire_cst_payment_id {
  struct wire_cst_list_prim_u_8_strict *field0;
} wire_cst_payment_id;

typedef struct wire_cst_list_prim_u_8_loose {
  uint8_t *ptr;
  int32_t len;
} wire_cst_list_prim_u_8_loose;

typedef struct wire_cst_ldk_on_chain_payment {
  uintptr_t ptr;
} wire_cst_ldk_on_chain_payment;

typedef struct wire_cst_address {
  struct wire_cst_list_prim_u_8_strict *s;
} wire_cst_address;

typedef struct wire_cst_ldk_spontaneous_payment {
  uintptr_t ptr;
} wire_cst_ldk_spontaneous_payment;

typedef struct wire_cst_channel_id {
  struct wire_cst_list_prim_u_8_strict *data;
} wire_cst_channel_id;

typedef struct wire_cst_ClosureReason_CounterpartyForceClosed {
  struct wire_cst_list_prim_u_8_strict *peer_msg;
} wire_cst_ClosureReason_CounterpartyForceClosed;

typedef struct wire_cst_ClosureReason_ProcessingError {
  struct wire_cst_list_prim_u_8_strict *err;
} wire_cst_ClosureReason_ProcessingError;

typedef union ClosureReasonKind {
  struct wire_cst_ClosureReason_CounterpartyForceClosed CounterpartyForceClosed;
  struct wire_cst_ClosureReason_ProcessingError ProcessingError;
} ClosureReasonKind;

typedef struct wire_cst_closure_reason {
  int32_t tag;
  union ClosureReasonKind kind;
} wire_cst_closure_reason;

typedef struct wire_cst_payment_hash {
  struct wire_cst_list_prim_u_8_strict *data;
} wire_cst_payment_hash;

typedef struct wire_cst_Event_PaymentSuccessful {
  struct wire_cst_payment_id *payment_id;
  struct wire_cst_payment_hash *payment_hash;
  uint64_t *fee_paid_msat;
} wire_cst_Event_PaymentSuccessful;

typedef struct wire_cst_Event_PaymentFailed {
  struct wire_cst_payment_id *payment_id;
  struct wire_cst_payment_hash *payment_hash;
  int32_t *reason;
} wire_cst_Event_PaymentFailed;

typedef struct wire_cst_Event_PaymentReceived {
  struct wire_cst_payment_id *payment_id;
  struct wire_cst_payment_hash *payment_hash;
  uint64_t amount_msat;
} wire_cst_Event_PaymentReceived;

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

typedef struct wire_cst_Event_ChannelReady {
  struct wire_cst_channel_id *channel_id;
  struct wire_cst_user_channel_id *user_channel_id;
  struct wire_cst_public_key *counterparty_node_id;
} wire_cst_Event_ChannelReady;

typedef struct wire_cst_Event_ChannelClosed {
  struct wire_cst_channel_id *channel_id;
  struct wire_cst_user_channel_id *user_channel_id;
  struct wire_cst_public_key *counterparty_node_id;
  struct wire_cst_closure_reason *reason;
} wire_cst_Event_ChannelClosed;

typedef union EventKind {
  struct wire_cst_Event_PaymentSuccessful PaymentSuccessful;
  struct wire_cst_Event_PaymentFailed PaymentFailed;
  struct wire_cst_Event_PaymentReceived PaymentReceived;
  struct wire_cst_Event_ChannelPending ChannelPending;
  struct wire_cst_Event_ChannelReady ChannelReady;
  struct wire_cst_Event_ChannelClosed ChannelClosed;
} EventKind;

typedef struct wire_cst_event {
  int32_t tag;
  union EventKind kind;
} wire_cst_event;

typedef struct wire_cst_lsp_fee_limits {
  uint64_t *max_total_opening_fee_msat;
  uint64_t *max_proportional_opening_fee_ppm_msat;
} wire_cst_lsp_fee_limits;

typedef struct wire_cst_payment_preimage {
  struct wire_cst_list_prim_u_8_strict *data;
} wire_cst_payment_preimage;

typedef struct wire_cst_payment_secret {
  struct wire_cst_list_prim_u_8_strict *data;
} wire_cst_payment_secret;

typedef struct wire_cst_PaymentKind_Bolt11 {
  struct wire_cst_payment_hash *hash;
  struct wire_cst_payment_preimage *preimage;
  struct wire_cst_payment_secret *secret;
} wire_cst_PaymentKind_Bolt11;

typedef struct wire_cst_PaymentKind_Bolt11Jit {
  struct wire_cst_payment_hash *hash;
  struct wire_cst_payment_preimage *preimage;
  struct wire_cst_payment_secret *secret;
  struct wire_cst_lsp_fee_limits *lsp_fee_limits;
} wire_cst_PaymentKind_Bolt11Jit;

typedef struct wire_cst_PaymentKind_Spontaneous {
  struct wire_cst_payment_hash *hash;
  struct wire_cst_payment_preimage *preimage;
} wire_cst_PaymentKind_Spontaneous;

typedef union PaymentKindKind {
  struct wire_cst_PaymentKind_Bolt11 Bolt11;
  struct wire_cst_PaymentKind_Bolt11Jit Bolt11Jit;
  struct wire_cst_PaymentKind_Spontaneous Spontaneous;
} PaymentKindKind;

typedef struct wire_cst_payment_kind {
  int32_t tag;
  union PaymentKindKind kind;
} wire_cst_payment_kind;

typedef struct wire_cst_payment_details {
  struct wire_cst_payment_id id;
  struct wire_cst_payment_kind kind;
  uint64_t *amount_msat;
  int32_t direction;
  int32_t status;
} wire_cst_payment_details;

typedef struct wire_cst_channel_details {
  struct wire_cst_channel_id channel_id;
  struct wire_cst_public_key counterparty_node_id;
  struct wire_cst_out_point *funding_txo;
  uint64_t channel_value_sats;
  uint64_t *unspendable_punishment_reserve;
  struct wire_cst_user_channel_id user_channel_id;
  uint32_t feerate_sat_per_1000_weight;
  uint64_t outbound_capacity_msat;
  uint64_t inbound_capacity_msat;
  uint32_t *confirmations_required;
  uint32_t *confirmations;
  bool is_outbound;
  bool is_channel_ready;
  bool is_usable;
  bool is_public;
  uint16_t *cltv_expiry_delta;
  uint64_t counterparty_unspendable_punishment_reserve;
  uint64_t *counterparty_outbound_htlc_minimum_msat;
  uint64_t *counterparty_outbound_htlc_maximum_msat;
  uint32_t *counterparty_forwarding_info_fee_base_msat;
  uint32_t *counterparty_forwarding_info_fee_proportional_millionths;
  uint16_t *counterparty_forwarding_info_cltv_expiry_delta;
  uint64_t next_outbound_htlc_limit_msat;
  uint64_t next_outbound_htlc_minimum_msat;
  uint16_t *force_close_spend_delay;
  uint64_t inbound_htlc_minimum_msat;
  uint64_t *inbound_htlc_maximum_msat;
  struct wire_cst_channel_config config;
} wire_cst_channel_details;

typedef struct wire_cst_list_channel_details {
  struct wire_cst_channel_details *ptr;
  int32_t len;
} wire_cst_list_channel_details;

typedef struct wire_cst_LightningBalance_ClaimableOnChannelClose {
  struct wire_cst_channel_id *channel_id;
  struct wire_cst_public_key *counterparty_node_id;
  uint64_t amount_satoshis;
} wire_cst_LightningBalance_ClaimableOnChannelClose;

typedef struct wire_cst_LightningBalance_ClaimableAwaitingConfirmations {
  struct wire_cst_channel_id *channel_id;
  struct wire_cst_public_key *counterparty_node_id;
  uint64_t amount_satoshis;
  uint32_t confirmation_height;
} wire_cst_LightningBalance_ClaimableAwaitingConfirmations;

typedef struct wire_cst_LightningBalance_ContentiousClaimable {
  struct wire_cst_channel_id *channel_id;
  struct wire_cst_public_key *counterparty_node_id;
  uint64_t amount_satoshis;
  uint32_t timeout_height;
  struct wire_cst_payment_hash *payment_hash;
  struct wire_cst_payment_preimage *payment_preimage;
} wire_cst_LightningBalance_ContentiousClaimable;

typedef struct wire_cst_LightningBalance_MaybeTimeoutClaimableHTLC {
  struct wire_cst_channel_id *channel_id;
  struct wire_cst_public_key *counterparty_node_id;
  uint64_t amount_satoshis;
  uint32_t claimable_height;
  struct wire_cst_payment_hash *payment_hash;
} wire_cst_LightningBalance_MaybeTimeoutClaimableHTLC;

typedef struct wire_cst_LightningBalance_MaybePreimageClaimableHTLC {
  struct wire_cst_channel_id *channel_id;
  struct wire_cst_public_key *counterparty_node_id;
  uint64_t amount_satoshis;
  uint32_t expiry_height;
  struct wire_cst_payment_hash *payment_hash;
} wire_cst_LightningBalance_MaybePreimageClaimableHTLC;

typedef struct wire_cst_LightningBalance_CounterpartyRevokedOutputClaimable {
  struct wire_cst_channel_id *channel_id;
  struct wire_cst_public_key *counterparty_node_id;
  uint64_t amount_satoshis;
} wire_cst_LightningBalance_CounterpartyRevokedOutputClaimable;

typedef union LightningBalanceKind {
  struct wire_cst_LightningBalance_ClaimableOnChannelClose ClaimableOnChannelClose;
  struct wire_cst_LightningBalance_ClaimableAwaitingConfirmations ClaimableAwaitingConfirmations;
  struct wire_cst_LightningBalance_ContentiousClaimable ContentiousClaimable;
  struct wire_cst_LightningBalance_MaybeTimeoutClaimableHTLC MaybeTimeoutClaimableHTLC;
  struct wire_cst_LightningBalance_MaybePreimageClaimableHTLC MaybePreimageClaimableHTLC;
  struct wire_cst_LightningBalance_CounterpartyRevokedOutputClaimable CounterpartyRevokedOutputClaimable;
} LightningBalanceKind;

typedef struct wire_cst_lightning_balance {
  int32_t tag;
  union LightningBalanceKind kind;
} wire_cst_lightning_balance;

typedef struct wire_cst_list_lightning_balance {
  struct wire_cst_lightning_balance *ptr;
  int32_t len;
} wire_cst_list_lightning_balance;

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

typedef struct wire_cst_PendingSweepBalance_PendingBroadcast {
  struct wire_cst_channel_id *channel_id;
  uint64_t amount_satoshis;
} wire_cst_PendingSweepBalance_PendingBroadcast;

typedef struct wire_cst_PendingSweepBalance_BroadcastAwaitingConfirmation {
  struct wire_cst_channel_id *channel_id;
  uint32_t latest_broadcast_height;
  struct wire_cst_txid *latest_spending_txid;
  uint64_t amount_satoshis;
} wire_cst_PendingSweepBalance_BroadcastAwaitingConfirmation;

typedef struct wire_cst_PendingSweepBalance_AwaitingThresholdConfirmations {
  struct wire_cst_channel_id *channel_id;
  struct wire_cst_txid *latest_spending_txid;
  struct wire_cst_list_prim_u_8_strict *confirmation_hash;
  uint32_t confirmation_height;
  uint64_t amount_satoshis;
} wire_cst_PendingSweepBalance_AwaitingThresholdConfirmations;

typedef union PendingSweepBalanceKind {
  struct wire_cst_PendingSweepBalance_PendingBroadcast PendingBroadcast;
  struct wire_cst_PendingSweepBalance_BroadcastAwaitingConfirmation BroadcastAwaitingConfirmation;
  struct wire_cst_PendingSweepBalance_AwaitingThresholdConfirmations AwaitingThresholdConfirmations;
} PendingSweepBalanceKind;

typedef struct wire_cst_pending_sweep_balance {
  int32_t tag;
  union PendingSweepBalanceKind kind;
} wire_cst_pending_sweep_balance;

typedef struct wire_cst_list_pending_sweep_balance {
  struct wire_cst_pending_sweep_balance *ptr;
  int32_t len;
} wire_cst_list_pending_sweep_balance;

typedef struct wire_cst_balance_details {
  uint64_t total_onchain_balance_sats;
  uint64_t spendable_onchain_balance_sats;
  uint64_t total_lightning_balance_sats;
  struct wire_cst_list_lightning_balance *lightning_balances;
  struct wire_cst_list_pending_sweep_balance *pending_balances_from_channel_closures;
} wire_cst_balance_details;

typedef struct wire_cst_best_block {
  struct wire_cst_list_prim_u_8_strict *block_hash;
  uint32_t height;
} wire_cst_best_block;

typedef struct wire_cst_node_status {
  bool is_running;
  bool is_listening;
  struct wire_cst_best_block current_best_block;
  uint64_t *latest_wallet_sync_timestamp;
  uint64_t *latest_onchain_wallet_sync_timestamp;
  uint64_t *latest_fee_rate_cache_update_timestamp;
  uint64_t *latest_rgs_snapshot_timestamp;
  uint64_t *latest_node_announcement_broadcast_timestamp;
} wire_cst_node_status;

void frbgen_ldk_node_wire_NodeBuilder_build(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire_NodeBuilder_build_with_fs_store(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire_NodeBuilder_create_builder(int64_t port_,
                                                     struct wire_cst_config *config,
                                                     struct wire_cst_chain_data_source_config *chain_data_source_config,
                                                     struct wire_cst_entropy_source_config *entropy_source_config,
                                                     struct wire_cst_gossip_source_config *gossip_source_config,
                                                     struct wire_cst_liquidity_source_config *liquidity_source_config);

void frbgen_ldk_node_wire_ldk_bolt_11_payment_receive(int64_t port_,
                                                      struct wire_cst_ldk_bolt_11_payment *that,
                                                      uint64_t amount_msat,
                                                      struct wire_cst_list_prim_u_8_strict *description,
                                                      uint32_t expiry_secs);

void frbgen_ldk_node_wire_ldk_bolt_11_payment_receive_variable_amount(int64_t port_,
                                                                      struct wire_cst_ldk_bolt_11_payment *that,
                                                                      struct wire_cst_list_prim_u_8_strict *description,
                                                                      uint32_t expiry_secs);

void frbgen_ldk_node_wire_ldk_bolt_11_payment_receive_variable_amount_via_jit_channel(int64_t port_,
                                                                                      struct wire_cst_ldk_bolt_11_payment *that,
                                                                                      struct wire_cst_list_prim_u_8_strict *description,
                                                                                      uint32_t expiry_secs,
                                                                                      uint64_t *max_proportional_lsp_fee_limit_ppm_msat);

void frbgen_ldk_node_wire_ldk_bolt_11_payment_receive_via_jit_channel(int64_t port_,
                                                                      struct wire_cst_ldk_bolt_11_payment *that,
                                                                      uint64_t amount_msat,
                                                                      struct wire_cst_list_prim_u_8_strict *description,
                                                                      uint32_t expiry_secs,
                                                                      uint64_t *max_total_lsp_fee_limit_msat);

void frbgen_ldk_node_wire_ldk_bolt_11_payment_send(int64_t port_,
                                                   struct wire_cst_ldk_bolt_11_payment *that,
                                                   struct wire_cst_bolt_11_invoice *invoice);

void frbgen_ldk_node_wire_ldk_bolt_11_payment_send_probes(int64_t port_,
                                                          struct wire_cst_ldk_bolt_11_payment *that,
                                                          struct wire_cst_bolt_11_invoice *invoice);

void frbgen_ldk_node_wire_ldk_bolt_11_payment_send_probes_using_amount(int64_t port_,
                                                                       struct wire_cst_ldk_bolt_11_payment *that,
                                                                       struct wire_cst_bolt_11_invoice *invoice,
                                                                       uint64_t amount_msat);

void frbgen_ldk_node_wire_ldk_bolt_11_payment_send_using_amount(int64_t port_,
                                                                struct wire_cst_ldk_bolt_11_payment *that,
                                                                struct wire_cst_bolt_11_invoice *invoice,
                                                                uint64_t amount_msat);

void frbgen_ldk_node_wire_ldk_mnemonic_generate(int64_t port_);

void frbgen_ldk_node_wire_ldk_node_bolt11_payment(int64_t port_, struct wire_cst_ldk_node *ptr);

void frbgen_ldk_node_wire_ldk_node_close_channel(int64_t port_,
                                                 struct wire_cst_ldk_node *that,
                                                 struct wire_cst_user_channel_id *user_channel_id,
                                                 struct wire_cst_public_key *counterparty_node_id);

void frbgen_ldk_node_wire_ldk_node_config(int64_t port_, struct wire_cst_ldk_node *that);

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

void frbgen_ldk_node_wire_ldk_node_list_balances(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_list_channels(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_list_payments(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_list_payments_with_filter(int64_t port_,
                                                             struct wire_cst_ldk_node *that,
                                                             int32_t payment_direction);

void frbgen_ldk_node_wire_ldk_node_list_peers(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_listening_addresses(int64_t port_,
                                                       struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_next_event(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_next_event_async(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_node_id(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_on_chain_payment(int64_t port_, struct wire_cst_ldk_node *ptr);

void frbgen_ldk_node_wire_ldk_node_payment(int64_t port_,
                                           struct wire_cst_ldk_node *that,
                                           struct wire_cst_payment_id *payment_id);

void frbgen_ldk_node_wire_ldk_node_remove_payment(int64_t port_,
                                                  struct wire_cst_ldk_node *that,
                                                  struct wire_cst_payment_id *payment_id);

void frbgen_ldk_node_wire_ldk_node_sign_message(int64_t port_,
                                                struct wire_cst_ldk_node *that,
                                                struct wire_cst_list_prim_u_8_loose *msg);

void frbgen_ldk_node_wire_ldk_node_spontaneous_payment(int64_t port_,
                                                       struct wire_cst_ldk_node *ptr);

void frbgen_ldk_node_wire_ldk_node_start(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_status(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_stop(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_sync_wallets(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_node_update_channel_config(int64_t port_,
                                                         struct wire_cst_ldk_node *that,
                                                         struct wire_cst_user_channel_id *user_channel_id,
                                                         struct wire_cst_public_key *counterparty_node_id,
                                                         struct wire_cst_channel_config *channel_config);

void frbgen_ldk_node_wire_ldk_node_verify_signature(int64_t port_,
                                                    struct wire_cst_ldk_node *that,
                                                    struct wire_cst_list_prim_u_8_loose *msg,
                                                    struct wire_cst_list_prim_u_8_strict *sig,
                                                    struct wire_cst_public_key *public_key);

void frbgen_ldk_node_wire_ldk_node_wait_next_event(int64_t port_, struct wire_cst_ldk_node *that);

void frbgen_ldk_node_wire_ldk_on_chain_payment_new_address(int64_t port_,
                                                           struct wire_cst_ldk_on_chain_payment *that);

void frbgen_ldk_node_wire_ldk_on_chain_payment_send_all_to_address(int64_t port_,
                                                                   struct wire_cst_ldk_on_chain_payment *that,
                                                                   struct wire_cst_address *address);

void frbgen_ldk_node_wire_ldk_on_chain_payment_send_to_address(int64_t port_,
                                                               struct wire_cst_ldk_on_chain_payment *that,
                                                               struct wire_cst_address *address,
                                                               uint64_t amount_sats);

void frbgen_ldk_node_wire_ldk_spontaneous_payment_send(int64_t port_,
                                                       struct wire_cst_ldk_spontaneous_payment *that,
                                                       uint64_t amount_msat,
                                                       struct wire_cst_public_key *node_id);

void frbgen_ldk_node_wire_ldk_spontaneous_payment_send_probes(int64_t port_,
                                                              struct wire_cst_ldk_spontaneous_payment *that,
                                                              uint64_t amount_msat,
                                                              struct wire_cst_public_key *node_id);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_Node(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_Node(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockNodeBuilder(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockNodeBuilder(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodepaymentBolt11Payment(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodepaymentBolt11Payment(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodepaymentOnchainPayment(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodepaymentOnchainPayment(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodepaymentSpontaneousPayment(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodepaymentSpontaneousPayment(const void *ptr);

struct wire_cst_address *frbgen_ldk_node_cst_new_box_autoadd_address(void);

struct wire_cst_bolt_11_invoice *frbgen_ldk_node_cst_new_box_autoadd_bolt_11_invoice(void);

struct wire_cst_chain_data_source_config *frbgen_ldk_node_cst_new_box_autoadd_chain_data_source_config(void);

struct wire_cst_channel_config *frbgen_ldk_node_cst_new_box_autoadd_channel_config(void);

struct wire_cst_channel_id *frbgen_ldk_node_cst_new_box_autoadd_channel_id(void);

struct wire_cst_closure_reason *frbgen_ldk_node_cst_new_box_autoadd_closure_reason(void);

struct wire_cst_config *frbgen_ldk_node_cst_new_box_autoadd_config(void);

struct wire_cst_entropy_source_config *frbgen_ldk_node_cst_new_box_autoadd_entropy_source_config(void);

struct wire_cst_event *frbgen_ldk_node_cst_new_box_autoadd_event(void);

struct wire_cst_gossip_source_config *frbgen_ldk_node_cst_new_box_autoadd_gossip_source_config(void);

struct wire_cst_ldk_bolt_11_payment *frbgen_ldk_node_cst_new_box_autoadd_ldk_bolt_11_payment(void);

struct wire_cst_ldk_mnemonic *frbgen_ldk_node_cst_new_box_autoadd_ldk_mnemonic(void);

struct wire_cst_ldk_node *frbgen_ldk_node_cst_new_box_autoadd_ldk_node(void);

struct wire_cst_ldk_on_chain_payment *frbgen_ldk_node_cst_new_box_autoadd_ldk_on_chain_payment(void);

struct wire_cst_ldk_spontaneous_payment *frbgen_ldk_node_cst_new_box_autoadd_ldk_spontaneous_payment(void);

struct wire_cst_liquidity_source_config *frbgen_ldk_node_cst_new_box_autoadd_liquidity_source_config(void);

struct wire_cst_lsp_fee_limits *frbgen_ldk_node_cst_new_box_autoadd_lsp_fee_limits(void);

struct wire_cst_max_dust_htlc_exposure *frbgen_ldk_node_cst_new_box_autoadd_max_dust_htlc_exposure(void);

struct wire_cst_out_point *frbgen_ldk_node_cst_new_box_autoadd_out_point(void);

struct wire_cst_payment_details *frbgen_ldk_node_cst_new_box_autoadd_payment_details(void);

int32_t *frbgen_ldk_node_cst_new_box_autoadd_payment_failure_reason(int32_t value);

struct wire_cst_payment_hash *frbgen_ldk_node_cst_new_box_autoadd_payment_hash(void);

struct wire_cst_payment_id *frbgen_ldk_node_cst_new_box_autoadd_payment_id(void);

struct wire_cst_payment_preimage *frbgen_ldk_node_cst_new_box_autoadd_payment_preimage(void);

struct wire_cst_payment_secret *frbgen_ldk_node_cst_new_box_autoadd_payment_secret(void);

struct wire_cst_public_key *frbgen_ldk_node_cst_new_box_autoadd_public_key(void);

struct wire_cst_socket_address *frbgen_ldk_node_cst_new_box_autoadd_socket_address(void);

struct wire_cst_txid *frbgen_ldk_node_cst_new_box_autoadd_txid(void);

uint16_t *frbgen_ldk_node_cst_new_box_autoadd_u_16(uint16_t value);

uint32_t *frbgen_ldk_node_cst_new_box_autoadd_u_32(uint32_t value);

uint64_t *frbgen_ldk_node_cst_new_box_autoadd_u_64(uint64_t value);

struct wire_cst_user_channel_id *frbgen_ldk_node_cst_new_box_autoadd_user_channel_id(void);

struct wire_cst_list_channel_details *frbgen_ldk_node_cst_new_list_channel_details(int32_t len);

struct wire_cst_list_lightning_balance *frbgen_ldk_node_cst_new_list_lightning_balance(int32_t len);

struct wire_cst_list_payment_details *frbgen_ldk_node_cst_new_list_payment_details(int32_t len);

struct wire_cst_list_peer_details *frbgen_ldk_node_cst_new_list_peer_details(int32_t len);

struct wire_cst_list_pending_sweep_balance *frbgen_ldk_node_cst_new_list_pending_sweep_balance(int32_t len);

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
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_closure_reason);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_entropy_source_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_event);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_gossip_source_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_ldk_bolt_11_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_ldk_mnemonic);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_ldk_node);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_ldk_on_chain_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_ldk_spontaneous_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_liquidity_source_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_lsp_fee_limits);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_max_dust_htlc_exposure);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_out_point);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_payment_details);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_payment_failure_reason);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_payment_hash);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_payment_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_payment_preimage);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_payment_secret);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_public_key);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_socket_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_txid);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_u_16);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_u_32);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_u_64);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_user_channel_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_channel_details);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_lightning_balance);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_payment_details);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_peer_details);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_pending_sweep_balance);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_prim_u_8_loose);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_prim_u_8_strict);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_public_key);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_socket_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_Node);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockNodeBuilder);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodepaymentBolt11Payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodepaymentOnchainPayment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodepaymentSpontaneousPayment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_Node);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockNodeBuilder);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodepaymentBolt11Payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodepaymentOnchainPayment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodepaymentSpontaneousPayment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_NodeBuilder_build);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_NodeBuilder_build_with_fs_store);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_NodeBuilder_create_builder);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_bolt_11_payment_receive);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_bolt_11_payment_receive_variable_amount);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_bolt_11_payment_receive_variable_amount_via_jit_channel);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_bolt_11_payment_receive_via_jit_channel);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_bolt_11_payment_send);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_bolt_11_payment_send_probes);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_bolt_11_payment_send_probes_using_amount);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_bolt_11_payment_send_using_amount);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_mnemonic_generate);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_bolt11_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_close_channel);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_connect);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_connect_open_channel);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_disconnect);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_event_handled);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_list_balances);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_list_channels);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_list_payments);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_list_payments_with_filter);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_list_peers);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_listening_addresses);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_next_event);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_next_event_async);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_node_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_on_chain_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_remove_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_sign_message);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_spontaneous_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_start);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_status);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_stop);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_sync_wallets);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_update_channel_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_verify_signature);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_node_wait_next_event);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_on_chain_payment_new_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_on_chain_payment_send_all_to_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_on_chain_payment_send_to_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_spontaneous_payment_send);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire_ldk_spontaneous_payment_send_probes);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    return dummy_var;
}
