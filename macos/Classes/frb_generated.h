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

typedef struct wire_cst_script_buf {
  struct wire_cst_list_prim_u_8_strict *inner;
} wire_cst_script_buf;

typedef struct wire_cst_sending_parameters {
  uint64_t *max_total_routing_fee_msat;
  uint32_t *max_total_cltv_expiry_delta;
  uint8_t *max_path_count;
  uint8_t *max_channel_saturation_power_of_half;
} wire_cst_sending_parameters;

typedef struct wire_cst_refund {
  struct wire_cst_list_prim_u_8_strict *s;
} wire_cst_refund;

typedef struct wire_cst_offer {
  struct wire_cst_list_prim_u_8_strict *s;
} wire_cst_offer;

typedef struct wire_cst_txid {
  struct wire_cst_list_prim_u_8_strict *hash;
} wire_cst_txid;

typedef struct wire_cst_out_point {
  struct wire_cst_txid txid;
  uint32_t vout;
} wire_cst_out_point;

typedef struct wire_cst_list_prim_u_8_loose {
  uint8_t *ptr;
  int32_t len;
} wire_cst_list_prim_u_8_loose;

typedef struct wire_cst_record_string_string {
  struct wire_cst_list_prim_u_8_strict *field0;
  struct wire_cst_list_prim_u_8_strict *field1;
} wire_cst_record_string_string;

typedef struct wire_cst_list_record_string_string {
  struct wire_cst_record_string_string *ptr;
  int32_t len;
} wire_cst_list_record_string_string;

typedef struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSocketAddress {
  uintptr_t *ptr;
  int32_t len;
} wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSocketAddress;

typedef struct wire_cst_node_alias {
  struct wire_cst_list_prim_u_8_strict *field0;
} wire_cst_node_alias;

typedef struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPublicKey {
  uintptr_t *ptr;
  int32_t len;
} wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPublicKey;

typedef struct wire_cst_anchor_channels_config {
  struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPublicKey *trusted_peers_no_reserve;
  uint64_t per_channel_reserve_sats;
} wire_cst_anchor_channels_config;

typedef struct wire_cst_config {
  struct wire_cst_list_prim_u_8_strict *storage_dir_path;
  int32_t network;
  struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSocketAddress *listening_addresses;
  struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSocketAddress *announcement_addresses;
  struct wire_cst_node_alias *node_alias;
  struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPublicKey *trusted_peers_0conf;
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

typedef struct wire_cst_list_String {
  struct wire_cst_list_prim_u_8_strict **ptr;
  int32_t len;
} wire_cst_list_String;

typedef struct wire_cst_mnemonic {
  struct wire_cst_list_String *words;
} wire_cst_mnemonic;

typedef struct wire_cst_EntropySourceConfig_Bip39Mnemonic {
  struct wire_cst_mnemonic *field0;
  struct wire_cst_list_prim_u_8_strict *field1;
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

typedef struct wire_cst_record_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_socket_address_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_public_key_opt_string {
  uintptr_t field0;
  uintptr_t field1;
  struct wire_cst_list_prim_u_8_strict *field2;
} wire_cst_record_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_socket_address_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_public_key_opt_string;

typedef struct wire_cst_liquidity_source_config {
  struct wire_cst_record_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_socket_address_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_public_key_opt_string lsps2_service;
} wire_cst_liquidity_source_config;

typedef struct wire_cst_node_id {
  struct wire_cst_list_prim_u_8_strict *compressed;
} wire_cst_node_id;

typedef struct wire_cst_custom_tlv_record {
  uint64_t type_num;
  struct wire_cst_list_prim_u_8_strict *value;
} wire_cst_custom_tlv_record;

typedef struct wire_cst_list_custom_tlv_record {
  struct wire_cst_custom_tlv_record *ptr;
  int32_t len;
} wire_cst_list_custom_tlv_record;

typedef struct wire_cst_address_hostname {
  struct wire_cst_list_prim_u_8_strict *addr;
  uint16_t port;
} wire_cst_address_hostname;

typedef struct wire_cst_address_onion_v_2 {
  struct wire_cst_list_prim_u_8_strict *field0;
} wire_cst_address_onion_v_2;

typedef struct wire_cst_address_onion_v_3 {
  struct wire_cst_list_prim_u_8_strict *ed25519_pubkey;
  uint16_t checksum;
  uint8_t version;
  uint16_t port;
} wire_cst_address_onion_v_3;

typedef struct wire_cst_address_tcp_ip_v_4 {
  struct wire_cst_list_prim_u_8_strict *addr;
  uint16_t port;
} wire_cst_address_tcp_ip_v_4;

typedef struct wire_cst_address_tcp_ip_v_6 {
  struct wire_cst_list_prim_u_8_strict *addr;
  uint16_t port;
} wire_cst_address_tcp_ip_v_6;

typedef struct wire_cst_ffi_log_record {
  int32_t level;
  struct wire_cst_list_prim_u_8_strict *args;
  struct wire_cst_list_prim_u_8_strict *module_path;
  uint32_t line;
} wire_cst_ffi_log_record;

typedef struct wire_cst_offer_id {
  struct wire_cst_list_prim_u_8_strict *field0;
} wire_cst_offer_id;

typedef struct wire_cst_payment_secret {
  struct wire_cst_list_prim_u_8_strict *data;
} wire_cst_payment_secret;

typedef struct wire_cst_psbt {
  struct wire_cst_list_prim_u_8_strict *inner;
} wire_cst_psbt;

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

typedef struct wire_cst_node_announcement_info {
  uint32_t last_update;
  struct wire_cst_list_prim_u_8_strict *alias;
  struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSocketAddress *addresses;
} wire_cst_node_announcement_info;

typedef struct wire_cst_list_prim_u_64_strict {
  uint64_t *ptr;
  int32_t len;
} wire_cst_list_prim_u_64_strict;

typedef struct wire_cst_node_info {
  struct wire_cst_list_prim_u_64_strict *channels;
  struct wire_cst_node_announcement_info *announcement_info;
} wire_cst_node_info;

typedef struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerChannelDetails {
  uintptr_t *ptr;
  int32_t len;
} wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerChannelDetails;

typedef struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLightningBalance {
  uintptr_t *ptr;
  int32_t len;
} wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLightningBalance;

typedef struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails {
  uintptr_t *ptr;
  int32_t len;
} wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails;

typedef struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPeerDetails {
  uintptr_t *ptr;
  int32_t len;
} wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPeerDetails;

typedef struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPendingSweepBalance {
  uintptr_t *ptr;
  int32_t len;
} wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPendingSweepBalance;

typedef struct wire_cst_list_list_prim_u_8_strict {
  struct wire_cst_list_prim_u_8_strict **ptr;
  int32_t len;
} wire_cst_list_list_prim_u_8_strict;

typedef struct wire_cst_list_node_id {
  struct wire_cst_node_id *ptr;
  int32_t len;
} wire_cst_list_node_id;

typedef struct wire_cst_tx_in {
  struct wire_cst_out_point previous_output;
  struct wire_cst_script_buf script_sig;
  uint32_t sequence;
  struct wire_cst_list_list_prim_u_8_strict *witness;
} wire_cst_tx_in;

typedef struct wire_cst_list_tx_in {
  struct wire_cst_tx_in *ptr;
  int32_t len;
} wire_cst_list_tx_in;

typedef struct wire_cst_tx_out {
  uint64_t value;
  struct wire_cst_script_buf script_pubkey;
} wire_cst_tx_out;

typedef struct wire_cst_list_tx_out {
  struct wire_cst_tx_out *ptr;
  int32_t len;
} wire_cst_list_tx_out;

typedef struct wire_cst_balance_details {
  uint64_t total_onchain_balance_sats;
  uint64_t spendable_onchain_balance_sats;
  uint64_t total_lightning_balance_sats;
  struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLightningBalance *lightning_balances;
  struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPendingSweepBalance *pending_balances_from_channel_closures;
} wire_cst_balance_details;

typedef struct wire_cst_best_block {
  struct wire_cst_list_prim_u_8_strict *block_hash;
  uint32_t height;
} wire_cst_best_block;

typedef struct wire_cst_bolt_12_invoice {
  struct wire_cst_list_prim_u_8_strict *data;
} wire_cst_bolt_12_invoice;

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

typedef struct wire_cst_w_txid {
  struct wire_cst_list_prim_u_8_strict *hash;
} wire_cst_w_txid;

void frbgen_ldk_node_wire__shared__BitcoinAddress_as_string(int64_t port_, uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__shared__BitcoinAddress_auto_accessor_get_inner(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__shared__BitcoinAddress_auto_accessor_set_inner(uintptr_t that,
                                                                                          uintptr_t inner);

void frbgen_ldk_node_wire__shared__BitcoinAddress_from_script(int64_t port_,
                                                              struct wire_cst_script_buf *script,
                                                              int32_t network);

void frbgen_ldk_node_wire__shared__BitcoinAddress_from_string(int64_t port_,
                                                              struct wire_cst_list_prim_u_8_strict *address);

void frbgen_ldk_node_wire__shared__BitcoinAddress_is_valid_for_network(int64_t port_,
                                                                       uintptr_t that,
                                                                       int32_t network);

void frbgen_ldk_node_wire__shared__BitcoinAddress_new(int64_t port_,
                                                      struct wire_cst_list_prim_u_8_strict *address,
                                                      int32_t network);

void frbgen_ldk_node_wire__shared__BitcoinAddress_script_pubkey(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__shared__BitcoinAddress_to_address_data(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__shared__BitcoinAddress_to_qr_uri(int64_t port_, uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__shared__Bolt11Invoice_new(struct wire_cst_list_prim_u_8_strict *signed_raw_invoice);

WireSyncRust2DartDco frbgen_ldk_node_wire__shared__Bolt11Invoice_to_string(uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_claim_for_hash(int64_t port_,
                                                                             uintptr_t that,
                                                                             uintptr_t payment_hash,
                                                                             uint64_t claimable_amount_msat,
                                                                             uintptr_t preimage);

void frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_fail_for_hash(int64_t port_,
                                                                            uintptr_t that,
                                                                            uintptr_t payment_hash);

void frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_receive(int64_t port_,
                                                                      uintptr_t that,
                                                                      uint64_t amount_msat,
                                                                      struct wire_cst_list_prim_u_8_strict *description,
                                                                      uint32_t expiry_secs);

void frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_receive_for_hash(int64_t port_,
                                                                               uintptr_t that,
                                                                               uintptr_t payment_hash,
                                                                               uint64_t amount_msat,
                                                                               struct wire_cst_list_prim_u_8_strict *description,
                                                                               uint32_t expiry_secs);

void frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_receive_variable_amount(int64_t port_,
                                                                                      uintptr_t that,
                                                                                      struct wire_cst_list_prim_u_8_strict *description,
                                                                                      uint32_t expiry_secs);

void frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_receive_variable_amount_for_hash(int64_t port_,
                                                                                               uintptr_t that,
                                                                                               struct wire_cst_list_prim_u_8_strict *description,
                                                                                               uint32_t expiry_secs,
                                                                                               uintptr_t payment_hash);

void frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_receive_variable_amount_via_jit_channel(int64_t port_,
                                                                                                      uintptr_t that,
                                                                                                      struct wire_cst_list_prim_u_8_strict *description,
                                                                                                      uint32_t expiry_secs,
                                                                                                      uint64_t *max_proportional_lsp_fee_limit_ppm_msat);

void frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_receive_via_jit_channel(int64_t port_,
                                                                                      uintptr_t that,
                                                                                      uint64_t amount_msat,
                                                                                      struct wire_cst_list_prim_u_8_strict *description,
                                                                                      uint32_t expiry_secs,
                                                                                      uint64_t *max_total_lsp_fee_limit_msat);

void frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_send(int64_t port_,
                                                                   uintptr_t that,
                                                                   uintptr_t invoice,
                                                                   struct wire_cst_sending_parameters *sending_parameters);

void frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_send_probes(int64_t port_,
                                                                          uintptr_t that,
                                                                          uintptr_t invoice);

void frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_send_probes_using_amount(int64_t port_,
                                                                                       uintptr_t that,
                                                                                       uintptr_t invoice,
                                                                                       uint64_t amount_msat);

void frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_send_using_amount(int64_t port_,
                                                                                uintptr_t that,
                                                                                uintptr_t invoice,
                                                                                uint64_t amount_msat,
                                                                                struct wire_cst_sending_parameters *sending_parameters);

void frbgen_ldk_node_wire__ldk_adapter__bolt12__Bolt12Payment_initiate_refund(int64_t port_,
                                                                              uintptr_t that,
                                                                              uint64_t amount_msat,
                                                                              uint32_t expiry_secs,
                                                                              uint64_t *quantity,
                                                                              struct wire_cst_list_prim_u_8_strict *payer_note);

void frbgen_ldk_node_wire__ldk_adapter__bolt12__Bolt12Payment_receive(int64_t port_,
                                                                      uintptr_t that,
                                                                      uint64_t amount_msat,
                                                                      struct wire_cst_list_prim_u_8_strict *description,
                                                                      uint32_t *expiry_secs,
                                                                      uint64_t *quantity);

void frbgen_ldk_node_wire__ldk_adapter__bolt12__Bolt12Payment_receive_variable_amount(int64_t port_,
                                                                                      uintptr_t that,
                                                                                      struct wire_cst_list_prim_u_8_strict *description,
                                                                                      uint32_t *expiry_secs);

void frbgen_ldk_node_wire__ldk_adapter__bolt12__Bolt12Payment_request_refund_payment(int64_t port_,
                                                                                     uintptr_t that,
                                                                                     struct wire_cst_refund *refund);

void frbgen_ldk_node_wire__ldk_adapter__bolt12__Bolt12Payment_send(int64_t port_,
                                                                   uintptr_t that,
                                                                   struct wire_cst_offer *offer,
                                                                   uint64_t *quantity,
                                                                   struct wire_cst_list_prim_u_8_strict *payer_note);

void frbgen_ldk_node_wire__ldk_adapter__bolt12__Bolt12Payment_send_using_amount(int64_t port_,
                                                                                uintptr_t that,
                                                                                struct wire_cst_offer *offer,
                                                                                uint64_t amount_msat,
                                                                                uint64_t *quantity,
                                                                                struct wire_cst_list_prim_u_8_strict *payer_note);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_get_accept_underpaying_htlcs(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_get_cltv_expiry_delta(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_get_force_close_avoidance_max_fee_satoshis(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_get_forwarding_fee_base_msat(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_get_forwarding_fee_proportional_millionths(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_get_max_dust_htlc_exposure(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_set_accept_underpaying_htlcs(uintptr_t that,
                                                                                                                        bool accept_underpaying_htlcs);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_set_cltv_expiry_delta(uintptr_t that,
                                                                                                                 uint16_t cltv_expiry_delta);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_set_force_close_avoidance_max_fee_satoshis(uintptr_t that,
                                                                                                                                      uint64_t force_close_avoidance_max_fee_satoshis);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_set_forwarding_fee_base_msat(uintptr_t that,
                                                                                                                        uint32_t forwarding_fee_base_msat);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_set_forwarding_fee_proportional_millionths(uintptr_t that,
                                                                                                                                      uint32_t forwarding_fee_proportional_millionths);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_set_max_dust_htlc_exposure(uintptr_t that,
                                                                                                                      uintptr_t max_dust_htlc_exposure);

void frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_calculate_forwarding_fee(int64_t port_,
                                                                                      uintptr_t that,
                                                                                      uint64_t amount_msat);

void frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_high_fee_routing(int64_t port_);

void frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_low_fee_routing(int64_t port_);

void frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_new(int64_t port_,
                                                                 uint32_t forwarding_fee_proportional_millionths,
                                                                 uint32_t forwarding_fee_base_msat,
                                                                 uint16_t cltv_expiry_delta,
                                                                 uintptr_t max_dust_htlc_exposure,
                                                                 uint64_t force_close_avoidance_max_fee_satoshis,
                                                                 bool accept_underpaying_htlcs);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_channel_id(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_channel_value_sats(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_cltv_expiry_delta(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_config(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_confirmations(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_confirmations_required(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_counterparty_forwarding_info_cltv_expiry_delta(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_counterparty_forwarding_info_fee_base_msat(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_counterparty_forwarding_info_fee_proportional_millionths(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_counterparty_node_id(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_counterparty_outbound_htlc_maximum_msat(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_counterparty_outbound_htlc_minimum_msat(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_counterparty_unspendable_punishment_reserve(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_feerate_sat_per_1000_weight(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_force_close_spend_delay(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_funding_txo(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_inbound_capacity_msat(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_inbound_htlc_maximum_msat(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_inbound_htlc_minimum_msat(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_is_channel_ready(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_is_outbound(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_is_usable(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_next_outbound_htlc_limit_msat(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_next_outbound_htlc_minimum_msat(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_outbound_capacity_msat(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_unspendable_punishment_reserve(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_user_channel_id(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_channel_id(uintptr_t that,
                                                                                                           uintptr_t channel_id);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_channel_value_sats(uintptr_t that,
                                                                                                                   uint64_t channel_value_sats);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_cltv_expiry_delta(uintptr_t that,
                                                                                                                  uint16_t *cltv_expiry_delta);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_config(uintptr_t that,
                                                                                                       uintptr_t config);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_confirmations(uintptr_t that,
                                                                                                              uint32_t *confirmations);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_confirmations_required(uintptr_t that,
                                                                                                                       uint32_t *confirmations_required);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_counterparty_forwarding_info_cltv_expiry_delta(uintptr_t that,
                                                                                                                                               uint16_t *counterparty_forwarding_info_cltv_expiry_delta);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_counterparty_forwarding_info_fee_base_msat(uintptr_t that,
                                                                                                                                           uint32_t *counterparty_forwarding_info_fee_base_msat);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_counterparty_forwarding_info_fee_proportional_millionths(uintptr_t that,
                                                                                                                                                         uint32_t *counterparty_forwarding_info_fee_proportional_millionths);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_counterparty_node_id(uintptr_t that,
                                                                                                                     uintptr_t counterparty_node_id);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_counterparty_outbound_htlc_maximum_msat(uintptr_t that,
                                                                                                                                        uint64_t *counterparty_outbound_htlc_maximum_msat);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_counterparty_outbound_htlc_minimum_msat(uintptr_t that,
                                                                                                                                        uint64_t *counterparty_outbound_htlc_minimum_msat);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_counterparty_unspendable_punishment_reserve(uintptr_t that,
                                                                                                                                            uint64_t counterparty_unspendable_punishment_reserve);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_feerate_sat_per_1000_weight(uintptr_t that,
                                                                                                                            uint32_t feerate_sat_per_1000_weight);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_force_close_spend_delay(uintptr_t that,
                                                                                                                        uint16_t *force_close_spend_delay);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_funding_txo(uintptr_t that,
                                                                                                            struct wire_cst_out_point *funding_txo);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_inbound_capacity_msat(uintptr_t that,
                                                                                                                      uint64_t inbound_capacity_msat);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_inbound_htlc_maximum_msat(uintptr_t that,
                                                                                                                          uint64_t *inbound_htlc_maximum_msat);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_inbound_htlc_minimum_msat(uintptr_t that,
                                                                                                                          uint64_t inbound_htlc_minimum_msat);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_is_channel_ready(uintptr_t that,
                                                                                                                 bool is_channel_ready);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_is_outbound(uintptr_t that,
                                                                                                            bool is_outbound);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_is_usable(uintptr_t that,
                                                                                                          bool is_usable);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_next_outbound_htlc_limit_msat(uintptr_t that,
                                                                                                                              uint64_t next_outbound_htlc_limit_msat);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_next_outbound_htlc_minimum_msat(uintptr_t that,
                                                                                                                                uint64_t next_outbound_htlc_minimum_msat);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_outbound_capacity_msat(uintptr_t that,
                                                                                                                       uint64_t outbound_capacity_msat);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_unspendable_punishment_reserve(uintptr_t that,
                                                                                                                               uint64_t *unspendable_punishment_reserve);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_user_channel_id(uintptr_t that,
                                                                                                                uintptr_t user_channel_id);

void frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_balance_ratio_percent(int64_t port_,
                                                                                    uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_can_receive(int64_t port_,
                                                                          uintptr_t that,
                                                                          uint64_t amount_msat);

void frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_can_send(int64_t port_,
                                                                       uintptr_t that,
                                                                       uint64_t amount_msat);

void frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_capacity_sats(int64_t port_,
                                                                            uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_new(int64_t port_,
                                                                  uintptr_t channel_id,
                                                                  uintptr_t counterparty_node_id,
                                                                  struct wire_cst_out_point *funding_txo,
                                                                  uint64_t channel_value_sats,
                                                                  uint64_t *unspendable_punishment_reserve,
                                                                  uintptr_t user_channel_id,
                                                                  uint32_t feerate_sat_per_1000_weight,
                                                                  uint64_t outbound_capacity_msat,
                                                                  uint64_t inbound_capacity_msat,
                                                                  bool is_outbound,
                                                                  bool is_channel_ready,
                                                                  bool is_usable,
                                                                  uintptr_t config);

void frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_total_liquidity_msat(int64_t port_,
                                                                                   uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__types__ChannelId_as_bytes(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__types__ChannelId_from_bytes(int64_t port_,
                                                                    struct wire_cst_list_prim_u_8_loose *bytes);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__ChannelId_new(struct wire_cst_list_prim_u_8_strict *data);

void frbgen_ldk_node_wire__ldk_adapter__builder__LdkBuilder_build(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__builder__LdkBuilder_build_with_fs_store(int64_t port_,
                                                                                uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__builder__LdkBuilder_build_with_vss_store(int64_t port_,
                                                                                 uintptr_t that,
                                                                                 struct wire_cst_list_prim_u_8_strict *vss_url,
                                                                                 struct wire_cst_list_prim_u_8_strict *store_id,
                                                                                 struct wire_cst_list_prim_u_8_strict *lnurl_auth_server_url,
                                                                                 struct wire_cst_list_record_string_string *fixed_headers);

void frbgen_ldk_node_wire__ldk_adapter__builder__LdkBuilder_build_with_vss_store_and_fixed_headers(int64_t port_,
                                                                                                   uintptr_t that,
                                                                                                   struct wire_cst_list_prim_u_8_strict *vss_url,
                                                                                                   struct wire_cst_list_prim_u_8_strict *store_id,
                                                                                                   struct wire_cst_list_record_string_string *fixed_headers);

void frbgen_ldk_node_wire__ldk_adapter__builder__LdkBuilder_create_builder(int64_t port_,
                                                                           struct wire_cst_config *config,
                                                                           struct wire_cst_chain_data_source_config *chain_data_source_config,
                                                                           struct wire_cst_entropy_source_config *entropy_source_config,
                                                                           struct wire_cst_gossip_source_config *gossip_source_config,
                                                                           struct wire_cst_liquidity_source_config *liquidity_source_config);

void frbgen_ldk_node_wire__ldk_adapter__builder__LdkBuilder_set_entropy_seed_bytes(int64_t port_,
                                                                                   uintptr_t that,
                                                                                   struct wire_cst_list_prim_u_8_loose *seed_bytes);

void frbgen_ldk_node_wire__ldk_adapter__builder__LdkBuilder_set_filesystem_logger(int64_t port_,
                                                                                  uintptr_t that,
                                                                                  struct wire_cst_list_prim_u_8_strict *log_file_path,
                                                                                  int32_t *max_log_level);

void frbgen_ldk_node_wire__ldk_adapter__builder__LdkBuilder_set_log_facade_logger(int64_t port_,
                                                                                  uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__types__MaxDustHtlcExposure_conservative(int64_t port_);

void frbgen_ldk_node_wire__ldk_adapter__types__MaxDustHtlcExposure_default_fee_rate(int64_t port_);

void frbgen_ldk_node_wire__ldk_adapter__types__MaxDustHtlcExposure_new_fee_rate_multiplier(int64_t port_,
                                                                                           uint64_t multiplier);

void frbgen_ldk_node_wire__ldk_adapter__types__MaxDustHtlcExposure_new_fixed_limit(int64_t port_,
                                                                                   uint64_t limit_msat);

void frbgen_ldk_node_wire__ldk_adapter__graph__NetworkGraph_channel(int64_t port_,
                                                                    uintptr_t that,
                                                                    uint64_t short_channel_id);

void frbgen_ldk_node_wire__ldk_adapter__graph__NetworkGraph_list_channels(int64_t port_,
                                                                          uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__graph__NetworkGraph_list_nodes(int64_t port_,
                                                                       uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__graph__NetworkGraph_node(int64_t port_,
                                                                 uintptr_t that,
                                                                 struct wire_cst_node_id *node_id);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_bolt11_payment(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_bolt12_payment(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_close_channel(int64_t port_,
                                                                 uintptr_t that,
                                                                 uintptr_t user_channel_id,
                                                                 uintptr_t counterparty_node_id);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_config(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_connect(int64_t port_,
                                                           uintptr_t that,
                                                           uintptr_t node_id,
                                                           uintptr_t address,
                                                           bool persist);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_disconnect(int64_t port_,
                                                              uintptr_t that,
                                                              uintptr_t counterparty_node_id);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_event_handled(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_export_pathfinding_scores(int64_t port_,
                                                                             uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_force_close_channel(int64_t port_,
                                                                       uintptr_t that,
                                                                       uintptr_t user_channel_id,
                                                                       uintptr_t counterparty_node_id);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_list_balances(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_list_channels(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_list_payments(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_list_payments_with_filter(int64_t port_,
                                                                             uintptr_t that,
                                                                             int32_t payment_direction);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_list_peers(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_listening_addresses(int64_t port_,
                                                                       uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_network_graph(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_next_event(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_next_event_async(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_node_id(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_on_chain_payment(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_open_announced_channel(int64_t port_,
                                                                          uintptr_t that,
                                                                          uintptr_t socket_address,
                                                                          uintptr_t node_id,
                                                                          uint64_t channel_amount_sats,
                                                                          uint64_t *push_to_counterparty_msat,
                                                                          uintptr_t *channel_config);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_open_channel(int64_t port_,
                                                                uintptr_t that,
                                                                uintptr_t socket_address,
                                                                uintptr_t node_id,
                                                                uint64_t channel_amount_sats,
                                                                uint64_t *push_to_counterparty_msat,
                                                                uintptr_t *channel_config);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_payment(int64_t port_,
                                                           uintptr_t that,
                                                           uintptr_t payment_id);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_remove_payment(int64_t port_,
                                                                  uintptr_t that,
                                                                  uintptr_t payment_id);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_sign_message(int64_t port_,
                                                                uintptr_t that,
                                                                struct wire_cst_list_prim_u_8_loose *msg);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_spontaneous_payment(int64_t port_,
                                                                       uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_start(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_status(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_stop(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_sync_wallets(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_unified_qr_payment(int64_t port_,
                                                                      uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_update_channel_config(int64_t port_,
                                                                         uintptr_t that,
                                                                         uintptr_t user_channel_id,
                                                                         uintptr_t counterparty_node_id,
                                                                         uintptr_t channel_config);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_verify_signature(int64_t port_,
                                                                    uintptr_t that,
                                                                    struct wire_cst_list_prim_u_8_loose *msg,
                                                                    struct wire_cst_list_prim_u_8_strict *sig,
                                                                    uintptr_t public_key);

void frbgen_ldk_node_wire__ldk_adapter__node__Node_wait_next_event(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__on_chain__OnChainPayment_new_address(int64_t port_,
                                                                             uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__on_chain__OnChainPayment_send_all_to_address(int64_t port_,
                                                                                     uintptr_t that,
                                                                                     uintptr_t address,
                                                                                     bool retain_reserves,
                                                                                     uint64_t *fee_rate_sat_per_kwu);

void frbgen_ldk_node_wire__ldk_adapter__on_chain__OnChainPayment_send_to_address(int64_t port_,
                                                                                 uintptr_t that,
                                                                                 uintptr_t address,
                                                                                 uint64_t amount_sats,
                                                                                 uint64_t *fee_rate_sat_per_kwu);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_get_amount_msat(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_get_direction(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_get_id(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_get_kind(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_get_latest_update_timestamp(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_get_status(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_set_amount_msat(uintptr_t that,
                                                                                                            uint64_t *amount_msat);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_set_direction(uintptr_t that,
                                                                                                          int32_t direction);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_set_id(uintptr_t that,
                                                                                                   uintptr_t id);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_set_kind(uintptr_t that,
                                                                                                     uintptr_t kind);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_set_latest_update_timestamp(uintptr_t that,
                                                                                                                        uint64_t latest_update_timestamp);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_set_status(uintptr_t that,
                                                                                                       int32_t status);

void frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_is_failed(int64_t port_,
                                                                        uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_is_pending(int64_t port_,
                                                                         uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_is_succeeded(int64_t port_,
                                                                           uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_new(int64_t port_,
                                                                  uintptr_t id,
                                                                  uintptr_t kind,
                                                                  uint64_t *amount_msat,
                                                                  int32_t direction,
                                                                  int32_t status,
                                                                  uint64_t latest_update_timestamp);

void frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_new_inbound_pending(int64_t port_,
                                                                                  uintptr_t id,
                                                                                  uintptr_t kind,
                                                                                  uint64_t *amount_msat);

void frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_new_outbound_pending(int64_t port_,
                                                                                   uintptr_t id,
                                                                                   uintptr_t kind,
                                                                                   uint64_t *amount_msat);

WireSyncRust2DartDco frbgen_ldk_node_wire__shared__PaymentHash_new(struct wire_cst_list_prim_u_8_strict *data);

WireSyncRust2DartDco frbgen_ldk_node_wire__shared__PaymentHash_to_vec(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__shared__PaymentId_new(struct wire_cst_list_prim_u_8_loose *data);

WireSyncRust2DartDco frbgen_ldk_node_wire__shared__PaymentId_to_vec(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__shared__PaymentPreimage_new(struct wire_cst_list_prim_u_8_strict *data);

WireSyncRust2DartDco frbgen_ldk_node_wire__shared__PaymentPreimage_to_vec(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_auto_accessor_get_address(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_auto_accessor_get_is_connected(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_auto_accessor_get_node_id(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_auto_accessor_set_address(uintptr_t that,
                                                                                                     uintptr_t address);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_auto_accessor_set_is_connected(uintptr_t that,
                                                                                                          bool is_connected);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_auto_accessor_set_node_id(uintptr_t that,
                                                                                                     uintptr_t node_id);

void frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_is_offline(int64_t port_,
                                                                      uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_is_online(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_new(int64_t port_,
                                                               uintptr_t node_id,
                                                               uintptr_t address,
                                                               bool is_connected);

void frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_new_connected(int64_t port_,
                                                                         uintptr_t node_id,
                                                                         uintptr_t address);

void frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_new_disconnected(int64_t port_,
                                                                            uintptr_t node_id,
                                                                            uintptr_t address);

WireSyncRust2DartDco frbgen_ldk_node_wire__shared__PublicKey_new(struct wire_cst_list_prim_u_8_strict *hex);

WireSyncRust2DartDco frbgen_ldk_node_wire__shared__PublicKey_to_string(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__extensions__SocketAddress_address_type(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__extensions__SocketAddress_to_hostname(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__extensions__SocketAddress_to_onion_v2(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__extensions__SocketAddress_to_onion_v3(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__extensions__SocketAddress_to_tcp_ip_v4(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__extensions__SocketAddress_to_tcp_ip_v6(uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__spontaneous__SpontaneousPayment_send_probes_unsafe(int64_t port_,
                                                                                           uintptr_t that,
                                                                                           uint64_t amount_msat,
                                                                                           uintptr_t node_id);

void frbgen_ldk_node_wire__ldk_adapter__spontaneous__SpontaneousPayment_send_unsafe(int64_t port_,
                                                                                    uintptr_t that,
                                                                                    uint64_t amount_msat,
                                                                                    uintptr_t node_id,
                                                                                    struct wire_cst_sending_parameters *sending_parameters);

void frbgen_ldk_node_wire__ldk_adapter__spontaneous__SpontaneousPayment_send_with_custom_tlvs_unsafe(int64_t port_,
                                                                                                     uintptr_t that,
                                                                                                     uint64_t amount_msat,
                                                                                                     uintptr_t node_id,
                                                                                                     struct wire_cst_sending_parameters *sending_parameters,
                                                                                                     struct wire_cst_list_custom_tlv_record *custom_tlvs);

WireSyncRust2DartDco frbgen_ldk_node_wire__shared__TaprootSpendInfo_auto_accessor_get_inner(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__shared__TaprootSpendInfo_auto_accessor_set_inner(uintptr_t that,
                                                                                            uintptr_t inner);

WireSyncRust2DartDco frbgen_ldk_node_wire__shared__Transaction_auto_accessor_get_inner(uintptr_t that);

WireSyncRust2DartDco frbgen_ldk_node_wire__shared__Transaction_auto_accessor_set_inner(uintptr_t that,
                                                                                       uintptr_t inner);

void frbgen_ldk_node_wire__shared__Transaction_compute_txid(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__shared__Transaction_compute_wtxid(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__shared__Transaction_input(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__shared__Transaction_is_coinbase(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__shared__Transaction_is_explicitly_rbf(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__shared__Transaction_is_lock_time_enabled(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__shared__Transaction_lock_time(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__shared__Transaction_new(int64_t port_,
                                                   struct wire_cst_list_prim_u_8_loose *transaction_bytes);

void frbgen_ldk_node_wire__shared__Transaction_output(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__shared__Transaction_total_size(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__shared__Transaction_version(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__shared__Transaction_vsize(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__shared__Transaction_weight(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__unified_qr__UnifiedQrPayment_receive(int64_t port_,
                                                                             uintptr_t that,
                                                                             uint64_t amount_sats,
                                                                             struct wire_cst_list_prim_u_8_strict *message,
                                                                             uint32_t expiry_sec);

void frbgen_ldk_node_wire__ldk_adapter__unified_qr__UnifiedQrPayment_send(int64_t port_,
                                                                          uintptr_t that,
                                                                          struct wire_cst_list_prim_u_8_strict *uri_str);

void frbgen_ldk_node_wire__ldk_adapter__types__UserChannelId_as_bytes(int64_t port_,
                                                                      uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__types__UserChannelId_as_vec(int64_t port_, uintptr_t that);

void frbgen_ldk_node_wire__ldk_adapter__types__UserChannelId_from_string(int64_t port_,
                                                                         struct wire_cst_list_prim_u_8_strict *s);

void frbgen_ldk_node_wire__ldk_adapter__types__UserChannelId_from_u64(int64_t port_, uint64_t id);

WireSyncRust2DartDco frbgen_ldk_node_wire__ldk_adapter__types__UserChannelId_new(struct wire_cst_list_prim_u_8_loose *data);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__extensions__address_hostname_as_socket(struct wire_cst_address_hostname *that);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__extensions__address_onion_v_2_as_socket(struct wire_cst_address_onion_v_2 *that);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__extensions__address_onion_v_3_as_socket(struct wire_cst_address_onion_v_3 *that);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__extensions__address_tcp_ip_v_4_as_socket(struct wire_cst_address_tcp_ip_v_4 *that);

WireSyncRust2DartDco frbgen_ldk_node_wire__crate__api__extensions__address_tcp_ip_v_6_as_socket(struct wire_cst_address_tcp_ip_v_6 *that);

void frbgen_ldk_node_wire__ldk_adapter__types__anchor_channels_config_conservative(int64_t port_);

void frbgen_ldk_node_wire__ldk_adapter__types__anchor_channels_config_default(int64_t port_);

void frbgen_ldk_node_wire__ldk_adapter__types__anchor_channels_config_is_peer_trusted(int64_t port_,
                                                                                      struct wire_cst_anchor_channels_config *that,
                                                                                      uintptr_t peer);

void frbgen_ldk_node_wire__ldk_adapter__types__anchor_channels_config_low_reserve(int64_t port_);

void frbgen_ldk_node_wire__ldk_adapter__types__anchor_channels_config_trusted_peers_count(int64_t port_,
                                                                                          struct wire_cst_anchor_channels_config *that);

void frbgen_ldk_node_wire__ldk_adapter__types__anchor_channels_config_with_trusted_peers(int64_t port_,
                                                                                         struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPublicKey *trusted_peers);

void frbgen_ldk_node_wire__crate__api__extensions__config_default(int64_t port_);

void frbgen_ldk_node_wire__ldk_adapter__types__custom_tlv_record_from_string(int64_t port_,
                                                                             uint64_t type_num,
                                                                             struct wire_cst_list_prim_u_8_strict *value);

void frbgen_ldk_node_wire__ldk_adapter__types__custom_tlv_record_from_u64(int64_t port_,
                                                                          uint64_t type_num,
                                                                          uint64_t value);

void frbgen_ldk_node_wire__ldk_adapter__types__custom_tlv_record_new(int64_t port_,
                                                                     uint64_t type_num,
                                                                     struct wire_cst_list_prim_u_8_loose *value);

void frbgen_ldk_node_wire__ldk_adapter__types__custom_tlv_record_value_as_string(int64_t port_,
                                                                                 struct wire_cst_custom_tlv_record *that);

void frbgen_ldk_node_wire__ldk_adapter__types__ffi_log_record_debug(int64_t port_,
                                                                    struct wire_cst_list_prim_u_8_strict *args,
                                                                    struct wire_cst_list_prim_u_8_strict *module_path,
                                                                    uint32_t line);

void frbgen_ldk_node_wire__ldk_adapter__types__ffi_log_record_error(int64_t port_,
                                                                    struct wire_cst_list_prim_u_8_strict *args,
                                                                    struct wire_cst_list_prim_u_8_strict *module_path,
                                                                    uint32_t line);

void frbgen_ldk_node_wire__ldk_adapter__types__ffi_log_record_formatted(int64_t port_,
                                                                        struct wire_cst_ffi_log_record *that);

void frbgen_ldk_node_wire__ldk_adapter__types__ffi_log_record_info(int64_t port_,
                                                                   struct wire_cst_list_prim_u_8_strict *args,
                                                                   struct wire_cst_list_prim_u_8_strict *module_path,
                                                                   uint32_t line);

void frbgen_ldk_node_wire__ldk_adapter__types__ffi_log_record_is_error(int64_t port_,
                                                                       struct wire_cst_ffi_log_record *that);

void frbgen_ldk_node_wire__ldk_adapter__types__ffi_log_record_is_warn(int64_t port_,
                                                                      struct wire_cst_ffi_log_record *that);

void frbgen_ldk_node_wire__ldk_adapter__types__ffi_log_record_new(int64_t port_,
                                                                  int32_t level,
                                                                  struct wire_cst_list_prim_u_8_strict *args,
                                                                  struct wire_cst_list_prim_u_8_strict *module_path,
                                                                  uint32_t line);

void frbgen_ldk_node_wire__ldk_adapter__types__ffi_log_record_trace(int64_t port_,
                                                                    struct wire_cst_list_prim_u_8_strict *args,
                                                                    struct wire_cst_list_prim_u_8_strict *module_path,
                                                                    uint32_t line);

void frbgen_ldk_node_wire__ldk_adapter__types__ffi_log_record_warn(int64_t port_,
                                                                   struct wire_cst_list_prim_u_8_strict *args,
                                                                   struct wire_cst_list_prim_u_8_strict *module_path,
                                                                   uint32_t line);

void frbgen_ldk_node_wire__ldk_adapter__types__lsp_fee_limits_conservative(int64_t port_);

void frbgen_ldk_node_wire__ldk_adapter__types__lsp_fee_limits_new(int64_t port_,
                                                                  uint64_t *max_total_opening_fee_msat,
                                                                  uint64_t *max_proportional_opening_fee_ppm_msat);

void frbgen_ldk_node_wire__ldk_adapter__types__lsp_fee_limits_permissive(int64_t port_);

void frbgen_ldk_node_wire__ldk_adapter__types__lsp_fee_limits_unlimited(int64_t port_);

void frbgen_ldk_node_wire__shared__mnemonic_as_string(int64_t port_,
                                                      struct wire_cst_mnemonic *that);

void frbgen_ldk_node_wire__shared__mnemonic_from_entropy(int64_t port_,
                                                         struct wire_cst_list_prim_u_8_loose *entropy);

void frbgen_ldk_node_wire__shared__mnemonic_from_seed_phrase(int64_t port_,
                                                             struct wire_cst_list_prim_u_8_strict *seed_phrase);

void frbgen_ldk_node_wire__shared__mnemonic_generate(int64_t port_);

void frbgen_ldk_node_wire__shared__mnemonic_to_seed(int64_t port_,
                                                    struct wire_cst_mnemonic *that,
                                                    struct wire_cst_list_prim_u_8_strict *passphrase);

void frbgen_ldk_node_wire__ldk_adapter__types__offer_id_as_bytes(int64_t port_,
                                                                 struct wire_cst_offer_id *that);

void frbgen_ldk_node_wire__ldk_adapter__types__offer_id_from_bytes(int64_t port_,
                                                                   struct wire_cst_list_prim_u_8_loose *bytes);

void frbgen_ldk_node_wire__ldk_adapter__types__offer_id_new(int64_t port_,
                                                            struct wire_cst_list_prim_u_8_strict *data);

void frbgen_ldk_node_wire__ldk_adapter__types__payment_secret_as_bytes(int64_t port_,
                                                                       struct wire_cst_payment_secret *that);

void frbgen_ldk_node_wire__ldk_adapter__types__payment_secret_from_bytes(int64_t port_,
                                                                         struct wire_cst_list_prim_u_8_loose *bytes);

void frbgen_ldk_node_wire__ldk_adapter__types__payment_secret_new(int64_t port_,
                                                                  struct wire_cst_list_prim_u_8_strict *data);

void frbgen_ldk_node_wire__shared__psbt_extract_tx(int64_t port_, struct wire_cst_psbt *that);

void frbgen_ldk_node_wire__shared__psbt_fee(int64_t port_, struct wire_cst_psbt *that);

void frbgen_ldk_node_wire__shared__psbt_from_base64(int64_t port_,
                                                    struct wire_cst_list_prim_u_8_strict *base64);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAddressData(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAddressData(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBitcoinAddress(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBitcoinAddress(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBitcoinAddressInner(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBitcoinAddressInner(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBitcoinTransactionInner(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBitcoinTransactionInner(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBolt11Invoice(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBolt11Invoice(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBolt11Payment(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBolt11Payment(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBolt12Payment(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBolt12Payment(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerChannelConfig(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerChannelConfig(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerChannelDetails(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerChannelDetails(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerChannelId(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerChannelId(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerEvent(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerEvent(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLdkBuilder(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLdkBuilder(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLightningBalance(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLightningBalance(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerMaxDustHTLCExposure(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerMaxDustHTLCExposure(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerNetworkGraph(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerNetworkGraph(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerNode(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerNode(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerOnChainPayment(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerOnChainPayment(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentHash(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentHash(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentId(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentId(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentKind(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentKind(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentPreimage(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentPreimage(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPeerDetails(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPeerDetails(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPendingSweepBalance(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPendingSweepBalance(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPublicKey(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPublicKey(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerQrPaymentResult(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerQrPaymentResult(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSocketAddress(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSocketAddress(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSpontaneousPayment(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSpontaneousPayment(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTaprootSpendInfo(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTaprootSpendInfo(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTaprootSpendInfoInner(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTaprootSpendInfoInner(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransaction(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransaction(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUnifiedQrPayment(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUnifiedQrPayment(const void *ptr);

void frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUserChannelId(const void *ptr);

void frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUserChannelId(const void *ptr);

uintptr_t *frbgen_ldk_node_cst_new_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerChannelConfig(uintptr_t value);

uintptr_t *frbgen_ldk_node_cst_new_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerChannelId(uintptr_t value);

uintptr_t *frbgen_ldk_node_cst_new_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerEvent(uintptr_t value);

uintptr_t *frbgen_ldk_node_cst_new_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails(uintptr_t value);

struct wire_cst_address_hostname *frbgen_ldk_node_cst_new_box_autoadd_address_hostname(void);

struct wire_cst_address_onion_v_2 *frbgen_ldk_node_cst_new_box_autoadd_address_onion_v_2(void);

struct wire_cst_address_onion_v_3 *frbgen_ldk_node_cst_new_box_autoadd_address_onion_v_3(void);

struct wire_cst_address_tcp_ip_v_4 *frbgen_ldk_node_cst_new_box_autoadd_address_tcp_ip_v_4(void);

struct wire_cst_address_tcp_ip_v_6 *frbgen_ldk_node_cst_new_box_autoadd_address_tcp_ip_v_6(void);

struct wire_cst_anchor_channels_config *frbgen_ldk_node_cst_new_box_autoadd_anchor_channels_config(void);

struct wire_cst_background_sync_config *frbgen_ldk_node_cst_new_box_autoadd_background_sync_config(void);

struct wire_cst_chain_data_source_config *frbgen_ldk_node_cst_new_box_autoadd_chain_data_source_config(void);

struct wire_cst_channel_info *frbgen_ldk_node_cst_new_box_autoadd_channel_info(void);

struct wire_cst_channel_update_info *frbgen_ldk_node_cst_new_box_autoadd_channel_update_info(void);

struct wire_cst_config *frbgen_ldk_node_cst_new_box_autoadd_config(void);

struct wire_cst_custom_tlv_record *frbgen_ldk_node_cst_new_box_autoadd_custom_tlv_record(void);

struct wire_cst_electrum_sync_config *frbgen_ldk_node_cst_new_box_autoadd_electrum_sync_config(void);

struct wire_cst_entropy_source_config *frbgen_ldk_node_cst_new_box_autoadd_entropy_source_config(void);

struct wire_cst_esplora_sync_config *frbgen_ldk_node_cst_new_box_autoadd_esplora_sync_config(void);

struct wire_cst_ffi_log_record *frbgen_ldk_node_cst_new_box_autoadd_ffi_log_record(void);

struct wire_cst_gossip_source_config *frbgen_ldk_node_cst_new_box_autoadd_gossip_source_config(void);

struct wire_cst_liquidity_source_config *frbgen_ldk_node_cst_new_box_autoadd_liquidity_source_config(void);

int32_t *frbgen_ldk_node_cst_new_box_autoadd_log_level(int32_t value);

struct wire_cst_mnemonic *frbgen_ldk_node_cst_new_box_autoadd_mnemonic(void);

struct wire_cst_node_alias *frbgen_ldk_node_cst_new_box_autoadd_node_alias(void);

struct wire_cst_node_announcement_info *frbgen_ldk_node_cst_new_box_autoadd_node_announcement_info(void);

struct wire_cst_node_id *frbgen_ldk_node_cst_new_box_autoadd_node_id(void);

struct wire_cst_node_info *frbgen_ldk_node_cst_new_box_autoadd_node_info(void);

struct wire_cst_offer *frbgen_ldk_node_cst_new_box_autoadd_offer(void);

struct wire_cst_offer_id *frbgen_ldk_node_cst_new_box_autoadd_offer_id(void);

struct wire_cst_out_point *frbgen_ldk_node_cst_new_box_autoadd_out_point(void);

struct wire_cst_payment_secret *frbgen_ldk_node_cst_new_box_autoadd_payment_secret(void);

struct wire_cst_psbt *frbgen_ldk_node_cst_new_box_autoadd_psbt(void);

struct wire_cst_refund *frbgen_ldk_node_cst_new_box_autoadd_refund(void);

struct wire_cst_script_buf *frbgen_ldk_node_cst_new_box_autoadd_script_buf(void);

struct wire_cst_sending_parameters *frbgen_ldk_node_cst_new_box_autoadd_sending_parameters(void);

uint16_t *frbgen_ldk_node_cst_new_box_autoadd_u_16(uint16_t value);

uint32_t *frbgen_ldk_node_cst_new_box_autoadd_u_32(uint32_t value);

uint64_t *frbgen_ldk_node_cst_new_box_autoadd_u_64(uint64_t value);

uint8_t *frbgen_ldk_node_cst_new_box_autoadd_u_8(uint8_t value);

struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerChannelDetails *frbgen_ldk_node_cst_new_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerChannelDetails(int32_t len);

struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLightningBalance *frbgen_ldk_node_cst_new_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLightningBalance(int32_t len);

struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails *frbgen_ldk_node_cst_new_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails(int32_t len);

struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPeerDetails *frbgen_ldk_node_cst_new_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPeerDetails(int32_t len);

struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPendingSweepBalance *frbgen_ldk_node_cst_new_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPendingSweepBalance(int32_t len);

struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPublicKey *frbgen_ldk_node_cst_new_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPublicKey(int32_t len);

struct wire_cst_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSocketAddress *frbgen_ldk_node_cst_new_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSocketAddress(int32_t len);

struct wire_cst_list_String *frbgen_ldk_node_cst_new_list_String(int32_t len);

struct wire_cst_list_custom_tlv_record *frbgen_ldk_node_cst_new_list_custom_tlv_record(int32_t len);

struct wire_cst_list_list_prim_u_8_strict *frbgen_ldk_node_cst_new_list_list_prim_u_8_strict(int32_t len);

struct wire_cst_list_node_id *frbgen_ldk_node_cst_new_list_node_id(int32_t len);

struct wire_cst_list_prim_u_64_strict *frbgen_ldk_node_cst_new_list_prim_u_64_strict(int32_t len);

struct wire_cst_list_prim_u_8_loose *frbgen_ldk_node_cst_new_list_prim_u_8_loose(int32_t len);

struct wire_cst_list_prim_u_8_strict *frbgen_ldk_node_cst_new_list_prim_u_8_strict(int32_t len);

struct wire_cst_list_record_string_string *frbgen_ldk_node_cst_new_list_record_string_string(int32_t len);

struct wire_cst_list_tx_in *frbgen_ldk_node_cst_new_list_tx_in(int32_t len);

struct wire_cst_list_tx_out *frbgen_ldk_node_cst_new_list_tx_out(int32_t len);
static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerChannelConfig);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerChannelId);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerEvent);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_address_hostname);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_address_onion_v_2);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_address_onion_v_3);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_address_tcp_ip_v_4);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_address_tcp_ip_v_6);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_anchor_channels_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_background_sync_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_chain_data_source_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_channel_info);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_channel_update_info);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_custom_tlv_record);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_electrum_sync_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_entropy_source_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_esplora_sync_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_ffi_log_record);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_gossip_source_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_liquidity_source_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_log_level);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_mnemonic);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_node_alias);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_node_announcement_info);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_node_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_node_info);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_offer);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_offer_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_out_point);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_payment_secret);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_psbt);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_refund);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_script_buf);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_sending_parameters);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_u_16);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_u_32);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_u_64);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_box_autoadd_u_8);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerChannelDetails);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLightningBalance);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPeerDetails);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPendingSweepBalance);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPublicKey);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSocketAddress);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_String);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_custom_tlv_record);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_list_prim_u_8_strict);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_node_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_prim_u_64_strict);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_prim_u_8_loose);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_prim_u_8_strict);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_record_string_string);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_tx_in);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_cst_new_list_tx_out);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAddressData);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBitcoinAddress);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBitcoinAddressInner);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBitcoinTransactionInner);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBolt11Invoice);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBolt11Payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBolt12Payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerChannelConfig);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerChannelDetails);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerChannelId);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerEvent);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLdkBuilder);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLightningBalance);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerMaxDustHTLCExposure);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerNetworkGraph);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerNode);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerOnChainPayment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentHash);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentId);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentKind);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentPreimage);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPeerDetails);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPendingSweepBalance);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPublicKey);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerQrPaymentResult);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSocketAddress);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSpontaneousPayment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTaprootSpendInfo);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTaprootSpendInfoInner);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransaction);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUnifiedQrPayment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUserChannelId);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAddressData);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBitcoinAddress);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBitcoinAddressInner);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBitcoinTransactionInner);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBolt11Invoice);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBolt11Payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerBolt12Payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerChannelConfig);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerChannelDetails);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerChannelId);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerEvent);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLdkBuilder);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLightningBalance);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerMaxDustHTLCExposure);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerNetworkGraph);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerNode);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerOnChainPayment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentDetails);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentHash);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentId);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentKind);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPaymentPreimage);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPeerDetails);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPendingSweepBalance);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPublicKey);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerQrPaymentResult);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSocketAddress);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSpontaneousPayment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTaprootSpendInfo);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTaprootSpendInfoInner);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransaction);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUnifiedQrPayment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUserChannelId);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__extensions__SocketAddress_address_type);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__extensions__SocketAddress_to_hostname);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__extensions__SocketAddress_to_onion_v2);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__extensions__SocketAddress_to_onion_v3);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__extensions__SocketAddress_to_tcp_ip_v4);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__extensions__SocketAddress_to_tcp_ip_v6);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__extensions__address_hostname_as_socket);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__extensions__address_onion_v_2_as_socket);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__extensions__address_onion_v_3_as_socket);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__extensions__address_tcp_ip_v_4_as_socket);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__extensions__address_tcp_ip_v_6_as_socket);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__crate__api__extensions__config_default);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_claim_for_hash);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_fail_for_hash);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_receive);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_receive_for_hash);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_receive_variable_amount);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_receive_variable_amount_for_hash);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_receive_variable_amount_via_jit_channel);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_receive_via_jit_channel);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_send);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_send_probes);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_send_probes_using_amount);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__bolt11__Bolt11Payment_send_using_amount);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__bolt12__Bolt12Payment_initiate_refund);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__bolt12__Bolt12Payment_receive);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__bolt12__Bolt12Payment_receive_variable_amount);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__bolt12__Bolt12Payment_request_refund_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__bolt12__Bolt12Payment_send);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__bolt12__Bolt12Payment_send_using_amount);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__builder__LdkBuilder_build);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__builder__LdkBuilder_build_with_fs_store);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__builder__LdkBuilder_build_with_vss_store);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__builder__LdkBuilder_build_with_vss_store_and_fixed_headers);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__builder__LdkBuilder_create_builder);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__builder__LdkBuilder_set_entropy_seed_bytes);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__builder__LdkBuilder_set_filesystem_logger);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__builder__LdkBuilder_set_log_facade_logger);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__graph__NetworkGraph_channel);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__graph__NetworkGraph_list_channels);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__graph__NetworkGraph_list_nodes);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__graph__NetworkGraph_node);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_bolt11_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_bolt12_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_close_channel);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_connect);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_disconnect);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_event_handled);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_export_pathfinding_scores);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_force_close_channel);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_list_balances);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_list_channels);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_list_payments);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_list_payments_with_filter);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_list_peers);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_listening_addresses);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_network_graph);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_next_event);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_next_event_async);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_node_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_on_chain_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_open_announced_channel);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_open_channel);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_remove_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_sign_message);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_spontaneous_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_start);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_status);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_stop);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_sync_wallets);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_unified_qr_payment);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_update_channel_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_verify_signature);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__node__Node_wait_next_event);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__on_chain__OnChainPayment_new_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__on_chain__OnChainPayment_send_all_to_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__on_chain__OnChainPayment_send_to_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__spontaneous__SpontaneousPayment_send_probes_unsafe);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__spontaneous__SpontaneousPayment_send_unsafe);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__spontaneous__SpontaneousPayment_send_with_custom_tlvs_unsafe);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_get_accept_underpaying_htlcs);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_get_cltv_expiry_delta);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_get_force_close_avoidance_max_fee_satoshis);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_get_forwarding_fee_base_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_get_forwarding_fee_proportional_millionths);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_get_max_dust_htlc_exposure);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_set_accept_underpaying_htlcs);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_set_cltv_expiry_delta);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_set_force_close_avoidance_max_fee_satoshis);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_set_forwarding_fee_base_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_set_forwarding_fee_proportional_millionths);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_auto_accessor_set_max_dust_htlc_exposure);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_calculate_forwarding_fee);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_high_fee_routing);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_low_fee_routing);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelConfig_new);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_channel_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_channel_value_sats);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_cltv_expiry_delta);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_confirmations);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_confirmations_required);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_counterparty_forwarding_info_cltv_expiry_delta);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_counterparty_forwarding_info_fee_base_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_counterparty_forwarding_info_fee_proportional_millionths);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_counterparty_node_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_counterparty_outbound_htlc_maximum_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_counterparty_outbound_htlc_minimum_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_counterparty_unspendable_punishment_reserve);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_feerate_sat_per_1000_weight);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_force_close_spend_delay);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_funding_txo);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_inbound_capacity_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_inbound_htlc_maximum_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_inbound_htlc_minimum_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_is_channel_ready);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_is_outbound);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_is_usable);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_next_outbound_htlc_limit_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_next_outbound_htlc_minimum_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_outbound_capacity_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_unspendable_punishment_reserve);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_get_user_channel_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_channel_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_channel_value_sats);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_cltv_expiry_delta);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_config);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_confirmations);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_confirmations_required);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_counterparty_forwarding_info_cltv_expiry_delta);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_counterparty_forwarding_info_fee_base_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_counterparty_forwarding_info_fee_proportional_millionths);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_counterparty_node_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_counterparty_outbound_htlc_maximum_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_counterparty_outbound_htlc_minimum_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_counterparty_unspendable_punishment_reserve);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_feerate_sat_per_1000_weight);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_force_close_spend_delay);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_funding_txo);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_inbound_capacity_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_inbound_htlc_maximum_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_inbound_htlc_minimum_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_is_channel_ready);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_is_outbound);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_is_usable);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_next_outbound_htlc_limit_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_next_outbound_htlc_minimum_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_outbound_capacity_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_unspendable_punishment_reserve);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_auto_accessor_set_user_channel_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_balance_ratio_percent);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_can_receive);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_can_send);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_capacity_sats);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_new);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelDetails_total_liquidity_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelId_as_bytes);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelId_from_bytes);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ChannelId_new);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__MaxDustHtlcExposure_conservative);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__MaxDustHtlcExposure_default_fee_rate);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__MaxDustHtlcExposure_new_fee_rate_multiplier);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__MaxDustHtlcExposure_new_fixed_limit);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_get_amount_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_get_direction);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_get_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_get_kind);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_get_latest_update_timestamp);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_get_status);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_set_amount_msat);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_set_direction);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_set_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_set_kind);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_set_latest_update_timestamp);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_auto_accessor_set_status);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_is_failed);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_is_pending);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_is_succeeded);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_new);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_new_inbound_pending);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PaymentDetails_new_outbound_pending);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_auto_accessor_get_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_auto_accessor_get_is_connected);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_auto_accessor_get_node_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_auto_accessor_set_address);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_auto_accessor_set_is_connected);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_auto_accessor_set_node_id);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_is_offline);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_is_online);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_new);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_new_connected);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__PeerDetails_new_disconnected);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__UserChannelId_as_bytes);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__UserChannelId_as_vec);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__UserChannelId_from_string);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__UserChannelId_from_u64);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__UserChannelId_new);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__anchor_channels_config_conservative);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__anchor_channels_config_default);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__anchor_channels_config_is_peer_trusted);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__anchor_channels_config_low_reserve);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__anchor_channels_config_trusted_peers_count);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__anchor_channels_config_with_trusted_peers);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__custom_tlv_record_from_string);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__custom_tlv_record_from_u64);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__custom_tlv_record_new);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__custom_tlv_record_value_as_string);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ffi_log_record_debug);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ffi_log_record_error);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ffi_log_record_formatted);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ffi_log_record_info);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ffi_log_record_is_error);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ffi_log_record_is_warn);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ffi_log_record_new);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ffi_log_record_trace);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__ffi_log_record_warn);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__lsp_fee_limits_conservative);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__lsp_fee_limits_new);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__lsp_fee_limits_permissive);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__lsp_fee_limits_unlimited);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__offer_id_as_bytes);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__offer_id_from_bytes);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__offer_id_new);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__payment_secret_as_bytes);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__payment_secret_from_bytes);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__types__payment_secret_new);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__unified_qr__UnifiedQrPayment_receive);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__ldk_adapter__unified_qr__UnifiedQrPayment_send);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__BitcoinAddress_as_string);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__BitcoinAddress_auto_accessor_get_inner);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__BitcoinAddress_auto_accessor_set_inner);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__BitcoinAddress_from_script);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__BitcoinAddress_from_string);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__BitcoinAddress_is_valid_for_network);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__BitcoinAddress_new);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__BitcoinAddress_script_pubkey);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__BitcoinAddress_to_address_data);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__BitcoinAddress_to_qr_uri);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__Bolt11Invoice_new);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__Bolt11Invoice_to_string);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__PaymentHash_new);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__PaymentHash_to_vec);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__PaymentId_new);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__PaymentId_to_vec);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__PaymentPreimage_new);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__PaymentPreimage_to_vec);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__PublicKey_new);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__PublicKey_to_string);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__TaprootSpendInfo_auto_accessor_get_inner);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__TaprootSpendInfo_auto_accessor_set_inner);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__Transaction_auto_accessor_get_inner);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__Transaction_auto_accessor_set_inner);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__Transaction_compute_txid);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__Transaction_compute_wtxid);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__Transaction_input);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__Transaction_is_coinbase);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__Transaction_is_explicitly_rbf);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__Transaction_is_lock_time_enabled);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__Transaction_lock_time);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__Transaction_new);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__Transaction_output);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__Transaction_total_size);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__Transaction_version);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__Transaction_vsize);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__Transaction_weight);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__mnemonic_as_string);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__mnemonic_from_entropy);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__mnemonic_from_seed_phrase);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__mnemonic_generate);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__mnemonic_to_seed);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__psbt_extract_tx);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__psbt_fee);
    dummy_var ^= ((int64_t) (void*) frbgen_ldk_node_wire__shared__psbt_from_base64);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    return dummy_var;
}
