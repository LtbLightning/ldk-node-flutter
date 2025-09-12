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

typedef struct wire_cst_record_string_string {
  struct wire_cst_list_prim_u_8_strict *field0;
  struct wire_cst_list_prim_u_8_strict *field1;
} wire_cst_record_string_string;

typedef struct wire_cst_list_record_string_string {
  struct wire_cst_record_string_string *ptr;
  int32_t len;
} wire_cst_list_record_string_string;

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

typedef struct wire_cst_node_alias {
  struct wire_cst_list_prim_u_8_strict *field0;
} wire_cst_node_alias;

typedef struct wire_cst_public_key {
  struct wire_cst_list_prim_u_8_strict *hex;
} wire_cst_public_key;

typedef struct wire_cst_list_public_key {
  struct wire_cst_public_key *ptr;
  int32_t len;
} wire_cst_list_public_key;

typedef struct wire_cst_anchor_channels_config {
  struct wire_cst_list_public_key *trusted_peers_no_reserve;
  uint64_t per_channel_reserve_sats;
} wire_cst_anchor_channels_config;

typedef struct wire_cst_MaxTotalRoutingFeeLimit_FeeCap {
  uint64_t amount_msat;
} wire_cst_MaxTotalRoutingFeeLimit_FeeCap;

typedef union MaxTotalRoutingFeeLimitKind {
  struct wire_cst_MaxTotalRoutingFeeLimit_FeeCap FeeCap;
} MaxTotalRoutingFeeLimitKind;

typedef struct wire_cst_max_total_routing_fee_limit {
  int32_t tag;
  union MaxTotalRoutingFeeLimitKind kind;
} wire_cst_max_total_routing_fee_limit;

typedef struct wire_cst_sending_parameters {
  struct wire_cst_max_total_routing_fee_limit *max_total_routing_fee_msat;
  uint32_t *max_total_cltv_expiry_delta;
  uint8_t *max_path_count;
  uint8_t *max_channel_saturation_power_of_half;
} wire_cst_sending_parameters;

typedef struct wire_cst_config {
  struct wire_cst_list_prim_u_8_strict *storage_dir_path;
  int32_t network;
  struct wire_cst_list_socket_address *listening_addresses;
  struct wire_cst_list_socket_address *announcement_addresses;
  struct wire_cst_node_alias *node_alias;
  struct wire_cst_list_public_key *trusted_peers_0conf;
  uint64_t probing_liquidity_limit_multiplier;
  struct wire_cst_anchor_channels_config *anchor_channels_config;
  struct wire_cst_sending_parameters *sending_parameters;
} wire_cst_config;

typedef struct wire_cst_background_sync_config {
  uint64_t onchain_wallet_sync_interval_secs;
  uint64_t lightning_wallet_sync_interval_secs;
  uint64_t fee_rate_cache_update_interval_secs;
} wire_cst_background_sync_config;

typedef struct wire_cst_esplora_sync_config {
  struct wire_cst_background_sync_config *background_sync_config;
} wire_cst_esplora_sync_config;

typedef struct wire_cst_ChainDataSourceConfig_Esplora {
  struct wire_cst_list_prim_u_8_strict *server_url;
  struct wire_cst_esplora_sync_config *sync_config;
} wire_cst_ChainDataSourceConfig_Esplora;

typedef struct wire_cst_electrum_sync_config {
  struct wire_cst_background_sync_config *background_sync_config;
} wire_cst_electrum_sync_config;

typedef struct wire_cst_ChainDataSourceConfig_Electrum {
  struct wire_cst_list_prim_u_8_strict *server_url;
  struct wire_cst_electrum_sync_config *sync_config;
} wire_cst_ChainDataSourceConfig_Electrum;

typedef struct wire_cst_ChainDataSourceConfig_BitcoindRpc {
  struct wire_cst_list_prim_u_8_strict *rpc_host;
  uint16_t rpc_port;
  struct wire_cst_list_prim_u_8_strict *rpc_user;
  struct wire_cst_list_prim_u_8_strict *rpc_password;
} wire_cst_ChainDataSourceConfig_BitcoindRpc;

typedef union ChainDataSourceConfigKind {
  struct wire_cst_ChainDataSourceConfig_Esplora Esplora;
  struct wire_cst_ChainDataSourceConfig_Electrum Electrum;
  struct wire_cst_ChainDataSourceConfig_BitcoindRpc BitcoindRpc;
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

typedef struct wire_cst_ffi_mnemonic {
  struct wire_cst_list_prim_u_8_strict *seed_phrase;
} wire_cst_ffi_mnemonic;

typedef struct wire_cst_EntropySourceConfig_Bip39Mnemonic {
  struct wire_cst_ffi_mnemonic *mnemonic;
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

typedef struct wire_cst_list_prim_u_8_loose {
  uint8_t *ptr;
  int32_t len;
} wire_cst_list_prim_u_8_loose;

typedef struct wire_cst_payment_id {
  struct wire_cst_list_prim_u_8_strict *data;
} wire_cst_payment_id;

typedef struct wire_cst_ffi_bolt_11_payment {
  uintptr_t opaque;
} wire_cst_ffi_bolt_11_payment;

typedef struct wire_cst_payment_hash {
  struct wire_cst_list_prim_u_8_strict *data;
} wire_cst_payment_hash;

typedef struct wire_cst_payment_preimage {
  struct wire_cst_list_prim_u_8_strict *data;
} wire_cst_payment_preimage;

typedef struct wire_cst_bolt_11_invoice {
  struct wire_cst_list_prim_u_8_strict *signed_raw_invoice;
} wire_cst_bolt_11_invoice;

typedef struct wire_cst_ffi_bolt_12_payment {
  uintptr_t opaque;
} wire_cst_ffi_bolt_12_payment;

typedef struct wire_cst_refund {
  struct wire_cst_list_prim_u_8_strict *s;
} wire_cst_refund;

typedef struct wire_cst_offer {
  struct wire_cst_list_prim_u_8_strict *s;
} wire_cst_offer;

typedef struct wire_cst_ffi_network_graph {
  uintptr_t opaque;
} wire_cst_ffi_network_graph;

typedef struct wire_cst_node_id {
  struct wire_cst_list_prim_u_8_strict *compressed;
} wire_cst_node_id;

typedef struct wire_cst_ffi_node {
  uintptr_t opaque;
} wire_cst_ffi_node;

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
  struct wire_cst_max_dust_htlc_exposure max_dust_htlc_exposure;
  uint64_t force_close_avoidance_max_fee_satoshis;
  bool accept_underpaying_htlcs;
} wire_cst_channel_config;

typedef struct wire_cst_ffi_on_chain_payment {
  uintptr_t opaque;
} wire_cst_ffi_on_chain_payment;

typedef struct wire_cst_address {
  struct wire_cst_list_prim_u_8_strict *s;
} wire_cst_address;

typedef struct wire_cst_ffi_spontaneous_payment {
  uintptr_t opaque;
} wire_cst_ffi_spontaneous_payment;

typedef struct wire_cst_custom_tlv_record {
  uint64_t type_num;
  struct wire_cst_list_prim_u_8_strict *value;
} wire_cst_custom_tlv_record;

typedef struct wire_cst_list_custom_tlv_record {
  struct wire_cst_custom_tlv_record *ptr;
  int32_t len;
} wire_cst_list_custom_tlv_record;

typedef struct wire_cst_ffi_unified_qr_payment {
  uintptr_t opaque;
} wire_cst_ffi_unified_qr_payment;

typedef struct wire_cst_Bolt12ParseError_Bech32 {
  struct wire_cst_list_prim_u_8_strict *field0;
} wire_cst_Bolt12ParseError_Bech32;

typedef struct wire_cst_DecodeError_Io {
  struct wire_cst_list_prim_u_8_strict *field0;
} wire_cst_DecodeError_Io;

typedef union DecodeErrorKind {
  struct wire_cst_DecodeError_Io Io;
} DecodeErrorKind;

typedef struct wire_cst_decode_error {
  int32_t tag;
  union DecodeErrorKind kind;
} wire_cst_decode_error;

typedef struct wire_cst_Bolt12ParseError_Decode {
  struct wire_cst_decode_error *field0;
} wire_cst_Bolt12ParseError_Decode;

typedef struct wire_cst_Bolt12ParseError_InvalidSemantics {
  struct wire_cst_list_prim_u_8_strict *field0;
} wire_cst_Bolt12ParseError_InvalidSemantics;

typedef struct wire_cst_Bolt12ParseError_InvalidSignature {
  struct wire_cst_list_prim_u_8_strict *field0;
} wire_cst_Bolt12ParseError_InvalidSignature;

typedef union Bolt12ParseErrorKind {
  struct wire_cst_Bolt12ParseError_Bech32 Bech32;
  struct wire_cst_Bolt12ParseError_Decode Decode;
  struct wire_cst_Bolt12ParseError_InvalidSemantics InvalidSemantics;
  struct wire_cst_Bolt12ParseError_InvalidSignature InvalidSignature;
} Bolt12ParseErrorKind;

typedef struct wire_cst_bolt_12_parse_error {
  int32_t tag;
  union Bolt12ParseErrorKind kind;
} wire_cst_bolt_12_parse_error;

typedef struct wire_cst_channel_id {
  struct wire_cst_list_prim_u_8_strict *data;
} wire_cst_channel_id;

typedef struct wire_cst_routing_fees {
  uint32_t base_msat;
  uint32_t proportional_millionths;
} wire_cst_routing_fees;

typedef struct wire_cst_channel_update_info {
  uint32_t last_update;
  bool enabled;
  uint16_t cltv_expiry_delta;
  uint64_t htlc_minimum_msat;
  uint64_t htlc_maximum_msat;
  struct wire_cst_routing_fees fees;
} wire_cst_channel_update_info;

typedef struct wire_cst_channel_info {
  struct wire_cst_node_id node_one;
  struct wire_cst_channel_update_info *one_to_two;
  struct wire_cst_node_id node_two;
  struct wire_cst_channel_update_info *two_to_one;
  uint64_t *capacity_sats;
} wire_cst_channel_info;

typedef struct wire_cst_ClosureReason_PeerFeerateTooLow {
  uint32_t peer_feerate_sat_per_kw;
  uint32_t required_feerate_sat_per_kw;
} wire_cst_ClosureReason_PeerFeerateTooLow;

typedef struct wire_cst_ClosureReason_CounterpartyForceClosed {
  struct wire_cst_list_prim_u_8_strict *peer_msg;
} wire_cst_ClosureReason_CounterpartyForceClosed;

typedef struct wire_cst_ClosureReason_HolderForceClosed {
  bool *broadcasted_latest_txn;
} wire_cst_ClosureReason_HolderForceClosed;

typedef struct wire_cst_ClosureReason_ProcessingError {
  struct wire_cst_list_prim_u_8_strict *err;
} wire_cst_ClosureReason_ProcessingError;

typedef union ClosureReasonKind {
  struct wire_cst_ClosureReason_PeerFeerateTooLow PeerFeerateTooLow;
  struct wire_cst_ClosureReason_CounterpartyForceClosed CounterpartyForceClosed;
  struct wire_cst_ClosureReason_HolderForceClosed HolderForceClosed;
  struct wire_cst_ClosureReason_ProcessingError ProcessingError;
} ClosureReasonKind;

typedef struct wire_cst_closure_reason {
  int32_t tag;
  union ClosureReasonKind kind;
} wire_cst_closure_reason;

typedef struct wire_cst_Event_PaymentClaimable {
  struct wire_cst_payment_id *payment_id;
  struct wire_cst_payment_hash *payment_hash;
  uint64_t claimable_amount_msat;
  uint32_t *claim_deadline;
  struct wire_cst_list_custom_tlv_record *custom_records;
} wire_cst_Event_PaymentClaimable;

typedef struct wire_cst_Event_PaymentSuccessful {
  struct wire_cst_payment_id *payment_id;
  struct wire_cst_payment_hash *payment_hash;
  uint64_t *fee_paid_msat;
  struct wire_cst_payment_preimage *preimage;
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
  struct wire_cst_list_custom_tlv_record *custom_records;
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

typedef struct wire_cst_Event_PaymentForwarded {
  struct wire_cst_channel_id *prev_channel_id;
  struct wire_cst_channel_id *next_channel_id;
  struct wire_cst_user_channel_id *prev_user_channel_id;
  struct wire_cst_user_channel_id *next_user_channel_id;
  struct wire_cst_public_key *prev_node_id;
  struct wire_cst_public_key *next_node_id;
  uint64_t *total_fee_earned_msat;
  uint64_t *skimmed_fee_msat;
  bool claim_from_onchain_tx;
  uint64_t *outbound_amount_forwarded_msat;
} wire_cst_Event_PaymentForwarded;

typedef union EventKind {
  struct wire_cst_Event_PaymentClaimable PaymentClaimable;
  struct wire_cst_Event_PaymentSuccessful PaymentSuccessful;
  struct wire_cst_Event_PaymentFailed PaymentFailed;
  struct wire_cst_Event_PaymentReceived PaymentReceived;
  struct wire_cst_Event_ChannelPending ChannelPending;
  struct wire_cst_Event_ChannelReady ChannelReady;
  struct wire_cst_Event_ChannelClosed ChannelClosed;
  struct wire_cst_Event_PaymentForwarded PaymentForwarded;
} EventKind;

typedef struct wire_cst_event {
  int32_t tag;
  union EventKind kind;
} wire_cst_event;

typedef struct wire_cst_ffi_log_record {
  int32_t level;
  struct wire_cst_list_prim_u_8_strict *args;
  struct wire_cst_list_prim_u_8_strict *module_path;
  uint32_t line;
} wire_cst_ffi_log_record;

typedef struct wire_cst_node_announcement_info {
  uint32_t last_update;
  struct wire_cst_list_prim_u_8_strict *alias;
  struct wire_cst_list_socket_address *addresses;
} wire_cst_node_announcement_info;

typedef struct wire_cst_list_prim_u_64_strict {
  uint64_t *ptr;
  int32_t len;
} wire_cst_list_prim_u_64_strict;

typedef struct wire_cst_node_info {
  struct wire_cst_list_prim_u_64_strict *channels;
  struct wire_cst_node_announcement_info *announcement_info;
} wire_cst_node_info;

typedef struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails {
  uintptr_t *ptr;
  int32_t len;
} wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails;

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
  uint64_t transaction_fee_satoshis;
  uint64_t outbound_payment_htlc_rounded_msat;
  uint64_t outbound_forwarded_htlc_rounded_msat;
  uint64_t inbound_claiming_htlc_rounded_msat;
  uint64_t inbound_htlc_rounded_msat;
} wire_cst_LightningBalance_ClaimableOnChannelClose;

typedef struct wire_cst_LightningBalance_ClaimableAwaitingConfirmations {
  struct wire_cst_channel_id *channel_id;
  struct wire_cst_public_key *counterparty_node_id;
  uint64_t amount_satoshis;
  uint32_t confirmation_height;
  int32_t source;
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
  bool outbound_payment;
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

typedef struct wire_cst_list_node_id {
  struct wire_cst_node_id *ptr;
  int32_t len;
} wire_cst_list_node_id;

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

typedef struct wire_cst_bolt_12_invoice {
  struct wire_cst_list_prim_u_8_strict *data;
} wire_cst_bolt_12_invoice;

typedef struct wire_cst_FfiNodeError_Decode {
  struct wire_cst_decode_error *field0;
} wire_cst_FfiNodeError_Decode;

typedef struct wire_cst_FfiNodeError_Bolt12Parse {
  struct wire_cst_bolt_12_parse_error *field0;
} wire_cst_FfiNodeError_Bolt12Parse;

typedef struct wire_cst_FfiNodeError_CreationError {
  int32_t field0;
} wire_cst_FfiNodeError_CreationError;

typedef union FfiNodeErrorKind {
  struct wire_cst_FfiNodeError_Decode Decode;
  struct wire_cst_FfiNodeError_Bolt12Parse Bolt12Parse;
  struct wire_cst_FfiNodeError_CreationError CreationError;
} FfiNodeErrorKind;

typedef struct wire_cst_ffi_node_error {
  int32_t tag;
  union FfiNodeErrorKind kind;
} wire_cst_ffi_node_error;

typedef struct wire_cst_lsp_fee_limits {
  uint64_t *max_total_opening_fee_msat;
  uint64_t *max_proportional_opening_fee_ppm_msat;
} wire_cst_lsp_fee_limits;

typedef struct wire_cst_node_status {
  bool is_running;
  bool is_listening;
  struct wire_cst_best_block current_best_block;
  uint64_t *latest_lightning_wallet_sync_timestamp;
  uint64_t *latest_onchain_wallet_sync_timestamp;
  uint64_t *latest_fee_rate_cache_update_timestamp;
  uint64_t *latest_rgs_snapshot_timestamp;
  uint64_t *latest_node_announcement_broadcast_timestamp;
  uint32_t *latest_channel_monitor_archival_height;
} wire_cst_node_status;

typedef struct wire_cst_offer_id {
  struct wire_cst_list_prim_u_8_strict *field0;
} wire_cst_offer_id;

typedef struct wire_cst_payment_secret {
  struct wire_cst_list_prim_u_8_strict *data;
} wire_cst_payment_secret;

typedef struct wire_cst_QrPaymentResult_Onchain {
  struct wire_cst_txid *txid;
} wire_cst_QrPaymentResult_Onchain;

typedef struct wire_cst_QrPaymentResult_Bolt11 {
  struct wire_cst_payment_id *payment_id;
} wire_cst_QrPaymentResult_Bolt11;

typedef struct wire_cst_QrPaymentResult_Bolt12 {
  struct wire_cst_payment_id *payment_id;
} wire_cst_QrPaymentResult_Bolt12;

typedef union QrPaymentResultKind {
  struct wire_cst_QrPaymentResult_Onchain Onchain;
  struct wire_cst_QrPaymentResult_Bolt11 Bolt11;
  struct wire_cst_QrPaymentResult_Bolt12 Bolt12;
} QrPaymentResultKind;

typedef struct wire_cst_qr_payment_result {
  int32_t tag;
  union QrPaymentResultKind kind;
} wire_cst_qr_payment_result;

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__builder__FfiBuilder_auto_accessor_get_opaque(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__builder__FfiBuilder_auto_accessor_set_opaque(uintptr_t that,
                                                                                                    uintptr_t opaque);

void frbgen_ldk_node_wire__crate__api__builder__FfiBuilder_build(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__crate__api__builder__FfiBuilder_build_with_fs_store(int64_t port_,
                                                                               uintptr_t that);

void frbgen_ldk_node_wire__crate__api__builder__FfiBuilder_build_with_vss_store(int64_t port_,
                                                                                uintptr_t that,
                                                                                struct wire_cst_list_prim_u_8_strict *vss_url,
                                                                                struct wire_cst_list_prim_u_8_strict *store_id,
                                                                                struct wire_cst_list_prim_u_8_strict *lnurl_auth_server_url,
                                                                                struct wire_cst_list_record_string_string *fixed_headers);

void frbgen_ldk_node_wire__crate__api__builder__FfiBuilder_build_with_vss_store_and_fixed_headers(int64_t port_,
                                                                                                  uintptr_t that,
                                                                                                  struct wire_cst_list_prim_u_8_strict *vss_url,
                                                                                                  struct wire_cst_list_prim_u_8_strict *store_id,
                                                                                                  struct wire_cst_list_record_string_string *fixed_headers);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__builder__FfiBuilder_create_builder(struct wire_cst_config *config,
                                                                                          struct wire_cst_chain_data_source_config *chain_data_source_config,
                                                                                          struct wire_cst_entropy_source_config *entropy_source_config,
                                                                                          struct wire_cst_gossip_source_config *gossip_source_config,
                                                                                          struct wire_cst_liquidity_source_config *liquidity_source_config);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__builder__FfiBuilder_set_entropy_seed_bytes(uintptr_t that,
                                                                                                  struct wire_cst_list_prim_u_8_loose *seed_bytes);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__builder__FfiBuilder_set_filesystem_logger(uintptr_t that,
                                                                                                 struct wire_cst_list_prim_u_8_strict *log_file_path,
                                                                                                 int32_t *max_log_level);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__builder__FfiBuilder_set_log_facade_logger(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_get_amount_msat(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_get_direction(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_get_id(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_get_kind(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_get_latest_update_timestamp(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_get_status(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_set_amount_msat(uintptr_t that,
                                                                                                           uint64_t *amount_msat);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_set_direction(uintptr_t that,
                                                                                                         int32_t direction);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_set_id(uintptr_t that,
                                                                                                  struct wire_cst_payment_id id);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_set_kind(uintptr_t that,
                                                                                                    uintptr_t kind);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_set_latest_update_timestamp(uintptr_t that,
                                                                                                                       uint64_t latest_update_timestamp);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_set_status(uintptr_t that,
                                                                                                      int32_t status);

void frbgen_ldk_node_wire__crate__api__types__anchor_channels_config_default(int64_t port_);

void frbgen_ldk_node_wire__crate__api__types__config_default(int64_t port_);

void frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_claim_for_hash(int64_t port_,
                                                                                  struct wire_cst_ffi_bolt_11_payment *that,
                                                                                  struct wire_cst_payment_hash *payment_hash,
                                                                                  uint64_t claimable_amount_msat,
                                                                                  struct wire_cst_payment_preimage *preimage);

void frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_fail_for_hash(int64_t port_,
                                                                                 struct wire_cst_ffi_bolt_11_payment *that,
                                                                                 struct wire_cst_payment_hash *payment_hash);

void frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_receive(int64_t port_,
                                                                           struct wire_cst_ffi_bolt_11_payment *that,
                                                                           uint64_t amount_msat,
                                                                           struct wire_cst_list_prim_u_8_strict *description,
                                                                           uint32_t expiry_secs);

void frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_receive_for_hash(int64_t port_,
                                                                                    struct wire_cst_ffi_bolt_11_payment *that,
                                                                                    struct wire_cst_payment_hash *payment_hash,
                                                                                    uint64_t amount_msat,
                                                                                    struct wire_cst_list_prim_u_8_strict *description,
                                                                                    uint32_t expiry_secs);

void frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_receive_variable_amount(int64_t port_,
                                                                                           struct wire_cst_ffi_bolt_11_payment *that,
                                                                                           struct wire_cst_list_prim_u_8_strict *description,
                                                                                           uint32_t expiry_secs);

void frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_receive_variable_amount_for_hash(int64_t port_,
                                                                                                    struct wire_cst_ffi_bolt_11_payment *that,
                                                                                                    struct wire_cst_list_prim_u_8_strict *description,
                                                                                                    uint32_t expiry_secs,
                                                                                                    struct wire_cst_payment_hash *payment_hash);

void frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_receive_variable_amount_via_jit_channel(int64_t port_,
                                                                                                           struct wire_cst_ffi_bolt_11_payment *that,
                                                                                                           struct wire_cst_list_prim_u_8_strict *description,
                                                                                                           uint32_t expiry_secs,
                                                                                                           uint64_t *max_proportional_lsp_fee_limit_ppm_msat);

void frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_receive_via_jit_channel(int64_t port_,
                                                                                           struct wire_cst_ffi_bolt_11_payment *that,
                                                                                           uint64_t amount_msat,
                                                                                           struct wire_cst_list_prim_u_8_strict *description,
                                                                                           uint32_t expiry_secs,
                                                                                           uint64_t *max_total_lsp_fee_limit_msat);

void frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_send(int64_t port_,
                                                                        struct wire_cst_ffi_bolt_11_payment *that,
                                                                        struct wire_cst_bolt_11_invoice *invoice,
                                                                        struct wire_cst_sending_parameters *sending_parameters);

void frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_send_probes(int64_t port_,
                                                                               struct wire_cst_ffi_bolt_11_payment *that,
                                                                               struct wire_cst_bolt_11_invoice *invoice);

void frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_send_probes_using_amount(int64_t port_,
                                                                                            struct wire_cst_ffi_bolt_11_payment *that,
                                                                                            struct wire_cst_bolt_11_invoice *invoice,
                                                                                            uint64_t amount_msat);

void frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_send_using_amount(int64_t port_,
                                                                                     struct wire_cst_ffi_bolt_11_payment *that,
                                                                                     struct wire_cst_bolt_11_invoice *invoice,
                                                                                     uint64_t amount_msat,
                                                                                     struct wire_cst_sending_parameters *sending_parameters);

void frbgen_ldk_node_wire__crate__api__bolt12__ffi_bolt_12_payment_initiate_refund(int64_t port_,
                                                                                   struct wire_cst_ffi_bolt_12_payment *that,
                                                                                   uint64_t amount_msat,
                                                                                   uint32_t expiry_secs,
                                                                                   uint64_t *quantity,
                                                                                   struct wire_cst_list_prim_u_8_strict *payer_note);

void frbgen_ldk_node_wire__crate__api__bolt12__ffi_bolt_12_payment_receive(int64_t port_,
                                                                           struct wire_cst_ffi_bolt_12_payment *that,
                                                                           uint64_t amount_msat,
                                                                           struct wire_cst_list_prim_u_8_strict *description,
                                                                           uint32_t *expiry_secs,
                                                                           uint64_t *quantity);

void frbgen_ldk_node_wire__crate__api__bolt12__ffi_bolt_12_payment_receive_variable_amount(int64_t port_,
                                                                                           struct wire_cst_ffi_bolt_12_payment *that,
                                                                                           struct wire_cst_list_prim_u_8_strict *description,
                                                                                           uint32_t *expiry_secs);

void frbgen_ldk_node_wire__crate__api__bolt12__ffi_bolt_12_payment_request_refund_payment(int64_t port_,
                                                                                          struct wire_cst_ffi_bolt_12_payment *that,
                                                                                          struct wire_cst_refund *refund);

void frbgen_ldk_node_wire__crate__api__bolt12__ffi_bolt_12_payment_send(int64_t port_,
                                                                        struct wire_cst_ffi_bolt_12_payment *that,
                                                                        struct wire_cst_offer *offer,
                                                                        uint64_t *quantity,
                                                                        struct wire_cst_list_prim_u_8_strict *payer_note);

void frbgen_ldk_node_wire__crate__api__bolt12__ffi_bolt_12_payment_send_using_amount(int64_t port_,
                                                                                     struct wire_cst_ffi_bolt_12_payment *that,
                                                                                     struct wire_cst_offer *offer,
                                                                                     uint64_t amount_msat,
                                                                                     uint64_t *quantity,
                                                                                     struct wire_cst_list_prim_u_8_strict *payer_note);

void frbgen_ldk_node_wire__crate__api__builder__ffi_mnemonic_generate(int64_t port_);

void frbgen_ldk_node_wire__crate__api__graph__ffi_network_graph_channel(int64_t port_,
                                                                        struct wire_cst_ffi_network_graph *that,
                                                                        uint64_t short_channel_id);

void frbgen_ldk_node_wire__crate__api__graph__ffi_network_graph_list_channels(int64_t port_,
                                                                              struct wire_cst_ffi_network_graph *that);

void frbgen_ldk_node_wire__crate__api__graph__ffi_network_graph_list_nodes(int64_t port_,
                                                                           struct wire_cst_ffi_network_graph *that);

void frbgen_ldk_node_wire__crate__api__graph__ffi_network_graph_node(int64_t port_,
                                                                     struct wire_cst_ffi_network_graph *that,
                                                                     struct wire_cst_node_id *node_id);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_bolt11_payment(int64_t port_,
                                                                     struct wire_cst_ffi_node *ptr);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_bolt12_payment(int64_t port_,
                                                                     struct wire_cst_ffi_node *ptr);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_close_channel(int64_t port_,
                                                                    struct wire_cst_ffi_node *that,
                                                                    struct wire_cst_user_channel_id *user_channel_id,
                                                                    struct wire_cst_public_key *counterparty_node_id);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_config(int64_t port_,
                                                             struct wire_cst_ffi_node *that);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_connect(int64_t port_,
                                                              struct wire_cst_ffi_node *that,
                                                              struct wire_cst_public_key *node_id,
                                                              struct wire_cst_socket_address *address,
                                                              bool persist);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_disconnect(int64_t port_,
                                                                 struct wire_cst_ffi_node *that,
                                                                 struct wire_cst_public_key *counterparty_node_id);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_event_handled(int64_t port_,
                                                                    struct wire_cst_ffi_node *that);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_export_pathfinding_scores(int64_t port_,
                                                                                struct wire_cst_ffi_node *that);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_force_close_channel(int64_t port_,
                                                                          struct wire_cst_ffi_node *that,
                                                                          struct wire_cst_user_channel_id *user_channel_id,
                                                                          struct wire_cst_public_key *counterparty_node_id);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_list_balances(int64_t port_,
                                                                    struct wire_cst_ffi_node *that);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_list_channels(int64_t port_,
                                                                    struct wire_cst_ffi_node *that);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_list_payments(int64_t port_,
                                                                    struct wire_cst_ffi_node *that);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_list_payments_with_filter(int64_t port_,
                                                                                struct wire_cst_ffi_node *that,
                                                                                int32_t payment_direction);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_list_peers(int64_t port_,
                                                                 struct wire_cst_ffi_node *that);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_listening_addresses(int64_t port_,
                                                                          struct wire_cst_ffi_node *that);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_network_graph(int64_t port_,
                                                                    struct wire_cst_ffi_node *ptr);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_next_event(int64_t port_,
                                                                 struct wire_cst_ffi_node *that);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_next_event_async(int64_t port_,
                                                                       struct wire_cst_ffi_node *that);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_node_id(int64_t port_,
                                                              struct wire_cst_ffi_node *that);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_on_chain_payment(int64_t port_,
                                                                       struct wire_cst_ffi_node *ptr);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_open_announced_channel(int64_t port_,
                                                                             struct wire_cst_ffi_node *that,
                                                                             struct wire_cst_socket_address *socket_address,
                                                                             struct wire_cst_public_key *node_id,
                                                                             uint64_t channel_amount_sats,
                                                                             uint64_t *push_to_counterparty_msat,
                                                                             struct wire_cst_channel_config *channel_config);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_open_channel(int64_t port_,
                                                                   struct wire_cst_ffi_node *that,
                                                                   struct wire_cst_socket_address *socket_address,
                                                                   struct wire_cst_public_key *node_id,
                                                                   uint64_t channel_amount_sats,
                                                                   uint64_t *push_to_counterparty_msat,
                                                                   struct wire_cst_channel_config *channel_config);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_payment(int64_t port_,
                                                              struct wire_cst_ffi_node *that,
                                                              struct wire_cst_payment_id *payment_id);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_remove_payment(int64_t port_,
                                                                     struct wire_cst_ffi_node *that,
                                                                     struct wire_cst_payment_id *payment_id);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_sign_message(int64_t port_,
                                                                   struct wire_cst_ffi_node *that,
                                                                   struct wire_cst_list_prim_u_8_loose *msg);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_spontaneous_payment(int64_t port_,
                                                                          struct wire_cst_ffi_node *ptr);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_start(int64_t port_,
                                                            struct wire_cst_ffi_node *that);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_status(int64_t port_,
                                                             struct wire_cst_ffi_node *that);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_stop(int64_t port_,
                                                           struct wire_cst_ffi_node *that);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_sync_wallets(int64_t port_,
                                                                   struct wire_cst_ffi_node *that);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_unified_qr_payment(int64_t port_,
                                                                         struct wire_cst_ffi_node *ptr);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_update_channel_config(int64_t port_,
                                                                            struct wire_cst_ffi_node *that,
                                                                            struct wire_cst_user_channel_id *user_channel_id,
                                                                            struct wire_cst_public_key *counterparty_node_id,
                                                                            struct wire_cst_channel_config *channel_config);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_verify_signature(int64_t port_,
                                                                       struct wire_cst_ffi_node *that,
                                                                       struct wire_cst_list_prim_u_8_loose *msg,
                                                                       struct wire_cst_list_prim_u_8_strict *sig,
                                                                       struct wire_cst_public_key *public_key);

void frbgen_ldk_node_wire__crate__api__node__ffi_node_wait_next_event(int64_t port_,
                                                                      struct wire_cst_ffi_node *that);

void frbgen_ldk_node_wire__crate__api__on_chain__ffi_on_chain_payment_new_address(int64_t port_,
                                                                                  struct wire_cst_ffi_on_chain_payment *that);

void frbgen_ldk_node_wire__crate__api__on_chain__ffi_on_chain_payment_send_all_to_address(int64_t port_,
                                                                                          struct wire_cst_ffi_on_chain_payment *that,
                                                                                          struct wire_cst_address *address,
                                                                                          bool retain_reserves,
                                                                                          uint64_t *fee_rate_sat_per_kwu);

void frbgen_ldk_node_wire__crate__api__on_chain__ffi_on_chain_payment_send_to_address(int64_t port_,
                                                                                      struct wire_cst_ffi_on_chain_payment *that,
                                                                                      struct wire_cst_address *address,
                                                                                      uint64_t amount_sats,
                                                                                      uint64_t *fee_rate_sat_per_kwu);

void frbgen_ldk_node_wire__crate__api__spontaneous__ffi_spontaneous_payment_send(int64_t port_,
                                                                                 struct wire_cst_ffi_spontaneous_payment *that,
                                                                                 uint64_t amount_msat,
                                                                                 struct wire_cst_public_key *node_id,
                                                                                 struct wire_cst_sending_parameters *sending_parameters);

void frbgen_ldk_node_wire__crate__api__spontaneous__ffi_spontaneous_payment_send_probes(int64_t port_,
                                                                                        struct wire_cst_ffi_spontaneous_payment *that,
                                                                                        uint64_t amount_msat,
                                                                                        struct wire_cst_public_key *node_id);

void frbgen_ldk_node_wire__crate__api__spontaneous__ffi_spontaneous_payment_send_with_custom_tlvs(int64_t port_,
                                                                                                  struct wire_cst_ffi_spontaneous_payment *that,
                                                                                                  uint64_t amount_msat,
                                                                                                  struct wire_cst_public_key *node_id,
                                                                                                  struct wire_cst_sending_parameters *sending_parameters,
                                                                                                  struct wire_cst_list_custom_tlv_record *custom_tlvs);

void frbgen_ldk_node_wire__crate__api__unified_qr__ffi_unified_qr_payment_receive(int64_t port_,
                                                                                  struct wire_cst_ffi_unified_qr_payment *that,
                                                                                  uint64_t amount_sats,
                                                                                  struct wire_cst_list_prim_u_8_strict *message,
                                                                                  uint32_t expiry_sec);

void frbgen_ldk_node_wire__crate__api__unified_qr__ffi_unified_qr_payment_send(int64_t port_,
                                                                               struct wire_cst_ffi_unified_qr_payment *that,
                                                                               struct wire_cst_list_prim_u_8_strict *uri_str);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerConfirmationStatus(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerConfirmationStatus(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerFfiBuilder(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerFfiBuilder(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentKind(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentKind(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodeBuilder(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodeBuilder(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodeNode(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodeNode(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodegraphNetworkGraph(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodegraphNetworkGraph(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodepaymentBolt11Payment(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodepaymentBolt11Payment(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodepaymentBolt12Payment(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodepaymentBolt12Payment(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodepaymentOnchainPayment(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodepaymentOnchainPayment(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodepaymentSpontaneousPayment(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodepaymentSpontaneousPayment(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodepaymentUnifiedQrPayment(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodepaymentUnifiedQrPayment(const void *ptr);

uintptr_t *frbgen_ldk_node_cst_new_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails(uintptr_t value);

struct wire_cst_address *frbgen_ldk_node_cst_new_box_autoadd_address(void);

struct wire_cst_anchor_channels_config *frbgen_ldk_node_cst_new_box_autoadd_anchor_channels_config(void);

struct wire_cst_background_sync_config *frbgen_ldk_node_cst_new_box_autoadd_background_sync_config(void);

struct wire_cst_bolt_11_invoice *frbgen_ldk_node_cst_new_box_autoadd_bolt_11_invoice(void);

struct wire_cst_bolt_12_parse_error *frbgen_ldk_node_cst_new_box_autoadd_bolt_12_parse_error(void);

bool *frbgen_ldk_node_cst_new_box_autoadd_bool(bool value);

struct wire_cst_chain_data_source_config *frbgen_ldk_node_cst_new_box_autoadd_chain_data_source_config(void);

struct wire_cst_channel_config *frbgen_ldk_node_cst_new_box_autoadd_channel_config(void);

struct wire_cst_channel_id *frbgen_ldk_node_cst_new_box_autoadd_channel_id(void);

struct wire_cst_channel_info *frbgen_ldk_node_cst_new_box_autoadd_channel_info(void);

struct wire_cst_channel_update_info *frbgen_ldk_node_cst_new_box_autoadd_channel_update_info(void);

struct wire_cst_closure_reason *frbgen_ldk_node_cst_new_box_autoadd_closure_reason(void);

struct wire_cst_config *frbgen_ldk_node_cst_new_box_autoadd_config(void);

struct wire_cst_decode_error *frbgen_ldk_node_cst_new_box_autoadd_decode_error(void);

struct wire_cst_electrum_sync_config *frbgen_ldk_node_cst_new_box_autoadd_electrum_sync_config(void);

struct wire_cst_entropy_source_config *frbgen_ldk_node_cst_new_box_autoadd_entropy_source_config(void);

struct wire_cst_esplora_sync_config *frbgen_ldk_node_cst_new_box_autoadd_esplora_sync_config(void);

struct wire_cst_event *frbgen_ldk_node_cst_new_box_autoadd_event(void);

struct wire_cst_ffi_bolt_11_payment *frbgen_ldk_node_cst_new_box_autoadd_ffi_bolt_11_payment(void);

struct wire_cst_ffi_bolt_12_payment *frbgen_ldk_node_cst_new_box_autoadd_ffi_bolt_12_payment(void);

struct wire_cst_ffi_log_record *frbgen_ldk_node_cst_new_box_autoadd_ffi_log_record(void);

struct wire_cst_ffi_mnemonic *frbgen_ldk_node_cst_new_box_autoadd_ffi_mnemonic(void);

struct wire_cst_ffi_network_graph *frbgen_ldk_node_cst_new_box_autoadd_ffi_network_graph(void);

struct wire_cst_ffi_node *frbgen_ldk_node_cst_new_box_autoadd_ffi_node(void);

struct wire_cst_ffi_on_chain_payment *frbgen_ldk_node_cst_new_box_autoadd_ffi_on_chain_payment(void);

struct wire_cst_ffi_spontaneous_payment *frbgen_ldk_node_cst_new_box_autoadd_ffi_spontaneous_payment(void);

struct wire_cst_ffi_unified_qr_payment *frbgen_ldk_node_cst_new_box_autoadd_ffi_unified_qr_payment(void);

struct wire_cst_gossip_source_config *frbgen_ldk_node_cst_new_box_autoadd_gossip_source_config(void);

struct wire_cst_liquidity_source_config *frbgen_ldk_node_cst_new_box_autoadd_liquidity_source_config(void);

int32_t *frbgen_ldk_node_cst_new_box_autoadd_log_level(int32_t value);

struct wire_cst_max_total_routing_fee_limit *frbgen_ldk_node_cst_new_box_autoadd_max_total_routing_fee_limit(void);

struct wire_cst_node_alias *frbgen_ldk_node_cst_new_box_autoadd_node_alias(void);

struct wire_cst_node_announcement_info *frbgen_ldk_node_cst_new_box_autoadd_node_announcement_info(void);

struct wire_cst_node_id *frbgen_ldk_node_cst_new_box_autoadd_node_id(void);

struct wire_cst_node_info *frbgen_ldk_node_cst_new_box_autoadd_node_info(void);

struct wire_cst_offer *frbgen_ldk_node_cst_new_box_autoadd_offer(void);

struct wire_cst_out_point *frbgen_ldk_node_cst_new_box_autoadd_out_point(void);

int32_t *frbgen_ldk_node_cst_new_box_autoadd_payment_failure_reason(int32_t value);

struct wire_cst_payment_hash *frbgen_ldk_node_cst_new_box_autoadd_payment_hash(void);

struct wire_cst_payment_id *frbgen_ldk_node_cst_new_box_autoadd_payment_id(void);

struct wire_cst_payment_preimage *frbgen_ldk_node_cst_new_box_autoadd_payment_preimage(void);

struct wire_cst_public_key *frbgen_ldk_node_cst_new_box_autoadd_public_key(void);

struct wire_cst_refund *frbgen_ldk_node_cst_new_box_autoadd_refund(void);

struct wire_cst_sending_parameters *frbgen_ldk_node_cst_new_box_autoadd_sending_parameters(void);

struct wire_cst_socket_address *frbgen_ldk_node_cst_new_box_autoadd_socket_address(void);

struct wire_cst_txid *frbgen_ldk_node_cst_new_box_autoadd_txid(void);

uint16_t *frbgen_ldk_node_cst_new_box_autoadd_u_16(uint16_t value);

uint32_t *frbgen_ldk_node_cst_new_box_autoadd_u_32(uint32_t value);

uint64_t *frbgen_ldk_node_cst_new_box_autoadd_u_64(uint64_t value);

uint8_t *frbgen_ldk_node_cst_new_box_autoadd_u_8(uint8_t value);

struct wire_cst_user_channel_id *frbgen_ldk_node_cst_new_box_autoadd_user_channel_id(void);

struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails *frbgen_ldk_node_cst_new_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails(int32_t len);

struct wire_cst_list_channel_details *frbgen_ldk_node_cst_new_list_channel_details(int32_t len);

struct wire_cst_list_custom_tlv_record *frbgen_ldk_node_cst_new_list_custom_tlv_record(int32_t len);

struct wire_cst_list_lightning_balance *frbgen_ldk_node_cst_new_list_lightning_balance(int32_t len);

struct wire_cst_list_node_id *frbgen_ldk_node_cst_new_list_node_id(int32_t len);

struct wire_cst_list_peer_details *frbgen_ldk_node_cst_new_list_peer_details(int32_t len);

struct wire_cst_list_pending_sweep_balance *frbgen_ldk_node_cst_new_list_pending_sweep_balance(int32_t len);

struct wire_cst_list_prim_u_64_strict *frbgen_ldk_node_cst_new_list_prim_u_64_strict(int32_t len);

struct wire_cst_list_prim_u_8_loose *frbgen_ldk_node_cst_new_list_prim_u_8_loose(int32_t len);

struct wire_cst_list_prim_u_8_strict *frbgen_ldk_node_cst_new_list_prim_u_8_strict(int32_t len);

struct wire_cst_list_public_key *frbgen_ldk_node_cst_new_list_public_key(int32_t len);

struct wire_cst_list_record_string_string *frbgen_ldk_node_cst_new_list_record_string_string(int32_t len);

struct wire_cst_list_socket_address *frbgen_ldk_node_cst_new_list_socket_address(int32_t len);
static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_anchor_channels_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_background_sync_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_bolt_11_invoice);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_bolt_12_parse_error);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_bool);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_chain_data_source_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_channel_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_channel_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_channel_info);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_channel_update_info);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_closure_reason);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_decode_error);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_electrum_sync_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_entropy_source_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_esplora_sync_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_event);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_ffi_bolt_11_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_ffi_bolt_12_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_ffi_log_record);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_ffi_mnemonic);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_ffi_network_graph);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_ffi_node);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_ffi_on_chain_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_ffi_spontaneous_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_ffi_unified_qr_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_gossip_source_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_liquidity_source_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_log_level);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_max_total_routing_fee_limit);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_node_alias);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_node_announcement_info);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_node_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_node_info);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_offer);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_out_point);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_payment_failure_reason);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_payment_hash);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_payment_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_payment_preimage);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_public_key);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_refund);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_sending_parameters);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_socket_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_txid);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_u_16);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_u_32);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_u_64);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_u_8);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_user_channel_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_channel_details);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_custom_tlv_record);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_lightning_balance);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_node_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_peer_details);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_pending_sweep_balance);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_prim_u_64_strict);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_prim_u_8_loose);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_prim_u_8_strict);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_public_key);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_record_string_string);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_socket_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerConfirmationStatus);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerFfiBuilder);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentKind);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodeBuilder);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodeNode);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodegraphNetworkGraph);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodepaymentBolt11Payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodepaymentBolt12Payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodepaymentOnchainPayment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodepaymentSpontaneousPayment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_ldk_nodepaymentUnifiedQrPayment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerConfirmationStatus);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerFfiBuilder);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentKind);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodeBuilder);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodeNode);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodegraphNetworkGraph);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodepaymentBolt11Payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodepaymentBolt12Payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodepaymentOnchainPayment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodepaymentSpontaneousPayment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_ldk_nodepaymentUnifiedQrPayment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_claim_for_hash);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_fail_for_hash);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_receive);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_receive_for_hash);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_receive_variable_amount);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_receive_variable_amount_for_hash);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_receive_variable_amount_via_jit_channel);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_receive_via_jit_channel);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_send);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_send_probes);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_send_probes_using_amount);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__bolt11__ffi_bolt_11_payment_send_using_amount);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__bolt12__ffi_bolt_12_payment_initiate_refund);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__bolt12__ffi_bolt_12_payment_receive);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__bolt12__ffi_bolt_12_payment_receive_variable_amount);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__bolt12__ffi_bolt_12_payment_request_refund_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__bolt12__ffi_bolt_12_payment_send);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__bolt12__ffi_bolt_12_payment_send_using_amount);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__builder__FfiBuilder_auto_accessor_get_opaque);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__builder__FfiBuilder_auto_accessor_set_opaque);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__builder__FfiBuilder_build);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__builder__FfiBuilder_build_with_fs_store);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__builder__FfiBuilder_build_with_vss_store);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__builder__FfiBuilder_build_with_vss_store_and_fixed_headers);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__builder__FfiBuilder_create_builder);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__builder__FfiBuilder_set_entropy_seed_bytes);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__builder__FfiBuilder_set_filesystem_logger);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__builder__FfiBuilder_set_log_facade_logger);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__builder__ffi_mnemonic_generate);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__graph__ffi_network_graph_channel);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__graph__ffi_network_graph_list_channels);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__graph__ffi_network_graph_list_nodes);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__graph__ffi_network_graph_node);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_bolt11_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_bolt12_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_close_channel);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_connect);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_disconnect);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_event_handled);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_export_pathfinding_scores);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_force_close_channel);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_list_balances);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_list_channels);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_list_payments);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_list_payments_with_filter);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_list_peers);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_listening_addresses);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_network_graph);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_next_event);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_next_event_async);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_node_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_on_chain_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_open_announced_channel);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_open_channel);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_remove_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_sign_message);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_spontaneous_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_start);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_status);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_stop);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_sync_wallets);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_unified_qr_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_update_channel_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_verify_signature);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__node__ffi_node_wait_next_event);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__on_chain__ffi_on_chain_payment_new_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__on_chain__ffi_on_chain_payment_send_all_to_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__on_chain__ffi_on_chain_payment_send_to_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__spontaneous__ffi_spontaneous_payment_send);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__spontaneous__ffi_spontaneous_payment_send_probes);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__spontaneous__ffi_spontaneous_payment_send_with_custom_tlvs);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_get_amount_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_get_direction);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_get_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_get_kind);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_get_latest_update_timestamp);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_get_status);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_set_amount_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_set_direction);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_set_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_set_kind);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_set_latest_update_timestamp);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__types__PaymentDetails_auto_accessor_set_status);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__types__anchor_channels_config_default);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__types__config_default);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__unified_qr__ffi_unified_qr_payment_receive);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__unified_qr__ffi_unified_qr_payment_send);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    return dummy_var;
}
