use crate::api::types::SocketAddress;
use crate::frb_generated::RustOpaque;
use crate::utils::error::LdkNodeError;
use ldk_node::lightning::util::ser::Writeable;

///Represents the compressed public key of a node
pub struct NodeId {
    pub compressed: Vec<u8>,
}

impl From<ldk_node::lightning::routing::gossip::NodeId> for NodeId {
    fn from(value: ldk_node::lightning::routing::gossip::NodeId) -> Self {
        Self {
            compressed: value.encode(),
        }
    }
}
impl TryFrom<NodeId> for ldk_node::lightning::routing::gossip::NodeId {
    type Error = LdkNodeError;

    fn try_from(value: NodeId) -> Result<Self, Self::Error> {
        ldk_node::lightning::routing::gossip::NodeId::from_slice(value.compressed.as_slice())
            .map_err(|e| e.into())
    }
}
///Fees for routing via a given channel or a node
pub struct RoutingFees {
    ///Flat routing fee in millisatoshis.
    pub base_msat: u32,
    ///Liquidity-based routing fee in millionths of a routed amount. In other words, 10000 is 1%.
    pub proportional_millionths: u32,
}
impl From<ldk_node::lightning::routing::gossip::RoutingFees> for RoutingFees {
    fn from(value: ldk_node::lightning_invoice::RoutingFees) -> Self {
        Self {
            base_msat: value.base_msat,
            proportional_millionths: value.proportional_millionths,
        }
    }
}
pub struct ChannelUpdateInfo {
    ///When the last update to the channel direction was issued. Value is opaque, as set in the announcement.
    pub last_update: u32,
    ///Whether the channel can be currently used for payments (in this one direction).
    pub enabled: bool,
    ///The difference in CLTV values that you must have when routing through this channel.
    pub cltv_expiry_delta: u16,
    ///The minimum value, which must be relayed to the next hop via the channel
    pub htlc_minimum_msat: u64,
    ///The maximum value which may be relayed to the next hop via the channel.
    pub htlc_maximum_msat: u64,
    ////Fees charged when the channel is used for routing
    pub fees: RoutingFees,
}

///Details about a channel (both directions). Received within a channel announcement.
pub struct ChannelInfo {
    ///Source node of the first direction of a channel
    pub node_one: NodeId,
    ///Details about the first direction of a channel
    pub one_to_two: Option<ChannelUpdateInfo>,
    ///Source node of the second direction of a channel
    pub node_two: NodeId,
    ///Details about the second direction of a channel
    pub two_to_one: Option<ChannelUpdateInfo>,
    ///The channel capacity as seen on-chain, if chain lookup is available.
    pub capacity_sats: Option<u64>,
}
impl From<ldk_node::lightning::routing::gossip::ChannelInfo> for ChannelInfo {
    fn from(value: ldk_node::lightning::routing::gossip::ChannelInfo) -> Self {
        Self {
            node_one: value.node_one.into(),
            one_to_two: value.one_to_two.map(|e| e.into()),
            node_two: value.node_two.into(),
            two_to_one: value.two_to_one.map(|e| e.into()),
            capacity_sats: value.capacity_sats,
        }
    }
}

impl From<ldk_node::lightning::routing::gossip::ChannelUpdateInfo> for ChannelUpdateInfo {
    fn from(value: ldk_node::lightning::routing::gossip::ChannelUpdateInfo) -> Self {
        ChannelUpdateInfo {
            last_update: value.last_update,
            enabled: value.enabled,
            cltv_expiry_delta: value.cltv_expiry_delta,
            htlc_minimum_msat: value.htlc_minimum_msat,
            htlc_maximum_msat: value.htlc_maximum_msat,
            fees: value.fees.into(),
        }
    }
}
///Details about a node in the network, known from the network announcement.
pub struct NodeInfo {
    pub channels: Vec<u64>,
    ///More information about a node from node_announcement. Optional because we store a Node entry after learning about it from a channel announcement, but before receiving a node announcement.
    pub announcement_info: Option<NodeAnnouncementInfo>,
}

impl From<ldk_node::lightning::routing::gossip::NodeInfo> for NodeInfo {
    fn from(value: ldk_node::lightning::routing::gossip::NodeInfo) -> Self {
        NodeInfo {
            channels: value.channels,
            announcement_info: value.announcement_info.map(|e| e.into()),
        }
    }
}
pub struct NodeAnnouncementInfo {
    /// When the last known update to the node state was issued.
    /// Value is opaque, as set in the announcement.
    pub last_update: u32,
    /// Moniker assigned to the node.
    /// May be invalid or malicious (eg control chars),
    /// should not be exposed to the user.
    pub alias: String,
    /// List of addresses on which this node is reachable
    pub addresses: Vec<SocketAddress>,
}

impl From<ldk_node::lightning::routing::gossip::NodeAnnouncementInfo> for NodeAnnouncementInfo {
    fn from(value: ldk_node::lightning::routing::gossip::NodeAnnouncementInfo) -> Self {
        Self {
            last_update: value.last_update,
            alias: value.alias.to_string(),
            addresses: value
                .addresses()
                .iter()
                .map(|e| e.to_owned().into())
                .collect(),
        }
    }
}
pub struct LdkNetworkGraph {
    pub ptr: RustOpaque<ldk_node::graph::NetworkGraph>,
}
impl From<ldk_node::graph::NetworkGraph> for LdkNetworkGraph {
    fn from(value: ldk_node::graph::NetworkGraph) -> Self {
        LdkNetworkGraph {
            ptr: RustOpaque::new(value),
        }
    }
}

impl LdkNetworkGraph {
    /// Returns the list of channels in the graph
    pub fn list_channels(&self) -> Vec<u64> {
        self.ptr.list_channels()
    }

    /// Returns information on a channel with the given id.
    pub fn channel(&self, short_channel_id: u64) -> Option<ChannelInfo> {
        self.ptr.channel(short_channel_id).map(|e| e.into())
    }

    /// Returns the list of nodes in the graph
    pub fn list_nodes(&self) -> Vec<NodeId> {
        self.ptr
            .list_nodes()
            .iter()
            .map(|e| e.to_owned().into())
            .collect()
    }

    pub fn node(&self, node_id: NodeId) -> Result<Option<NodeInfo>, LdkNodeError> {
        Ok(self.ptr.node(&(node_id.try_into()?)).map(|e| e.into()))
    }
}
