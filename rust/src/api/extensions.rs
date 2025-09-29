use flutter_rust_bridge::frb;
pub use ldk_adapter::{
    AnchorChannelsConfig, ChainDataSourceConfig, Config, ElectrumSyncConfig, EntropySourceConfig,
    EsploraSyncConfig, GossipSourceConfig, NodeAlias, ChannelId,
};
pub use shared::{Mnemonic, Network, PublicKey, SendingParameters, SocketAddress};

#[derive(Debug, Clone)]
#[frb(mirror(GossipSourceConfig))]
pub enum _GossipSourceConfig {
    P2PNetwork,
    RapidGossipSync(String),
}

#[derive(Debug, Clone)]
#[frb(mirror(Config))]
pub struct _Config {
    #[frb(non_final)]
    pub storage_dir_path: String,
    // #[frb(non_final)]
    // pub log_dir_path: Option<String>,
    /// The used Bitcoin network.
    #[frb(non_final)]
    pub network: Network,
    /// The IP address and TCP port the node will listen on.
    ///
    #[frb(non_final)]
    pub listening_addresses: Option<Vec<SocketAddress>>,
    /// The addresses which the node will announce to the gossip network that it accepts connections on.
    #[frb(non_final)]
    pub announcement_addresses: Option<Vec<SocketAddress>>,
    /// The node alias that will be used when broadcasting announcements to the gossip network.
    ///
    /// The provided alias must be a valid UTF-8 string and no longer than 32 bytes in total.
    ///
    /// **Note**: We will only allow opening and accepting public channels if the `nodeAlias` and the
    /// `listeningAddresses` are set.
    #[frb(non_final)]
    pub node_alias: Option<NodeAlias>,
    ///A list of peers that we allow to establish zero confirmation channels to us.
    ///
    ///Note: Allowing payments via zero-confirmation channels is potentially insecure if the funding transaction ends up never being confirmed on-chain. Zero-confirmation channels should therefore only be accepted from trusted peers.
    #[frb(non_final)]
    pub trusted_peers_0conf: Vec<PublicKey>,

    #[frb(non_final)]
    pub probing_liquidity_limit_multiplier: u64,
    ///The level at which we log messages.
    /// Any messages below this level will be excluded from the logs.
    ///
    // #[frb(non_final)]
    // pub log_level: LogLevel,
    #[frb(non_final)]
    pub anchor_channels_config: Option<AnchorChannelsConfig>, // todo: Option<AnchorChannelsConfig>,
    /// Configuration options for payment routing and pathfinding.
    ///
    /// Setting the `SendingParameters` provides flexibility to customize how payments are routed,
    /// including setting limits on routing fees, CLTV expiry, and channel utilization.
    ///
    /// **Note:** If unset, default parameters will be used, and you will be able to override the
    /// parameters on a per-payment basis in the corresponding method calls.
    #[frb(non_final)]
    pub sending_parameters: Option<SendingParameters>,
}

#[derive(Debug, Clone)]
#[frb(mirror(ChainDataSourceConfig))]
pub enum _ChainDataSourceConfig {
    Esplora {
        server_url: String,
        sync_config: Option<EsploraSyncConfig>,
    },
    Electrum {
        server_url: String,
        sync_config: Option<ElectrumSyncConfig>,
    },
    BitcoindRpc {
        rpc_host: String,
        rpc_port: u16,
        rpc_user: String,
        rpc_password: String,
    },
}

#[derive(Debug, Clone)]
#[frb(mirror(EntropySourceConfig))]
pub enum _EntropySourceConfig {
    SeedFile(String),
    SeedBytes(Vec<u8>),
    Bip39Mnemonic(Mnemonic, Option<String>),
}

// #[easy_ext::ext(EChannelId)] 
// pub impl ChannelId {
//     fn frb_override_new(data: Vec<u8>) -> Option<ChannelId> { note: you can't add static methods with easy_ext
//         if data.len() != 32 {
//             return None;
//         }

//         let data: [u8; 32] = data.try_into().unwrap();

//         Some(ChannelId::new(data))
//     }
// }

#[derive(Debug, Clone, PartialEq, Eq)]
#[frb(mirror(SocketAddress))]
#[frb(opaque)]
pub enum _SocketAddress {
    TcpIpV4 {
        addr: [u8; 4],
        port: u16,
    },
    TcpIpV6 {
        addr: [u8; 16],
        port: u16,
    },
    OnionV2([u8; 12]),
    OnionV3 {
        ed25519_pubkey: [u8; 32],
        checksum: u16,
        version: u8,
        port: u16,
    },
    Hostname {
        addr: String,
        port: u16,
    },
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct AddressTcpIpV4 {
    pub addr: [u8; 4],
    pub port: u16,
}

impl AddressTcpIpV4 {
    #[frb(sync)]
    pub fn as_socket(self) -> SocketAddress {
        SocketAddress::TcpIpV4 { addr: self.addr, port: self.port }
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct AddressTcpIpV6 {
    pub addr: [u8; 16],
    pub port: u16,
}

impl AddressTcpIpV6 {
    #[frb(sync)]
    pub fn as_socket(self) -> SocketAddress {
        SocketAddress::TcpIpV6 { addr: self.addr, port: self.port }
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct AddressOnionV2(pub [u8; 12]);

impl AddressOnionV2 {
    #[frb(sync)]
    pub fn as_socket(self) -> SocketAddress {
        SocketAddress::OnionV2(self.0)
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct AddressOnionV3 {
    pub ed25519_pubkey: [u8; 32],
    pub checksum: u16,
    pub version: u8,
    pub port: u16,
}

impl AddressOnionV3 {
    #[frb(sync)]
    pub fn as_socket(self) -> SocketAddress {
        SocketAddress::OnionV3 {
            ed25519_pubkey: self.ed25519_pubkey,
            checksum: self.checksum,
            version: self.version,
            port: self.port,
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct AddressHostname {
    pub addr: String,
    pub port: u16,
}

impl AddressHostname {
    #[frb(sync)]
    pub fn as_socket(self) -> SocketAddress {
        SocketAddress::Hostname { addr: self.addr, port: self.port }
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum SocketAddressType {
    TcpIpV4,
    TcpIpV6,
    OnionV2,
    OnionV3,
    Hostname,
}

#[easy_ext::ext(ESocketAddress)]
pub impl SocketAddress {
    #[frb(sync)]
    fn address_type(&self) -> SocketAddressType {
        match self {
            SocketAddress::TcpIpV4 { .. } => SocketAddressType::TcpIpV4,
            SocketAddress::TcpIpV6 { .. } => SocketAddressType::TcpIpV6,
            SocketAddress::OnionV2(_) => SocketAddressType::OnionV2,
            SocketAddress::OnionV3 { .. } => SocketAddressType::OnionV3,
            SocketAddress::Hostname { .. } => SocketAddressType::Hostname,
        }
    }

    #[frb(sync)]
    fn to_tcp_ip_v4(&self) -> Option<AddressTcpIpV4> {
        if let SocketAddress::TcpIpV4 { addr, port } = self {
            Some(AddressTcpIpV4 { addr: *addr, port: *port })
        } else {
            None
        }
    }

    #[frb(sync)]
    fn to_tcp_ip_v6(&self) -> Option<AddressTcpIpV6> {
        if let SocketAddress::TcpIpV6 { addr, port } = self {
            Some(AddressTcpIpV6 { addr: *addr, port: *port })
        } else {
            None
        }
    }

    #[frb(sync)]
    fn to_onion_v2(&self) -> Option<AddressOnionV2> {
        if let SocketAddress::OnionV2(addr) = self {
            Some(AddressOnionV2(*addr))
        } else {
            None
        }
    }

    #[frb(sync)]
    fn to_onion_v3(&self) -> Option<AddressOnionV3> {
        if let SocketAddress::OnionV3 { ed25519_pubkey, checksum, version, port } = self {
            Some(AddressOnionV3 {
                ed25519_pubkey: *ed25519_pubkey,
                checksum: *checksum,
                version: *version,
                port: *port,
            })
        } else {
            None
        }
    }

    #[frb(sync)]
    fn to_hostname(&self) -> Option<AddressHostname> {
        if let SocketAddress::Hostname { addr, port } = self {
            Some(AddressHostname { addr: addr.clone(), port: *port })
        } else {
            None
        }
    }
}