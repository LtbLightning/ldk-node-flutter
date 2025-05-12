import '../generated/api/types.dart';

class DefaultServicesTestnet {
  static const String esploraServerUrl = 'https://testnet.ltbl.io/api';
  static const String rgsServerUrl = 'https://testnet.ltbl.io/snapshot';
}

class DefaultServicesMutinynet {
  static var esploraServerConfig = EsploraSyncConfig(
      onchainWalletSyncIntervalSecs: BigInt.from(60),
      lightningWalletSyncIntervalSecs: BigInt.from(60),
      feeRateCacheUpdateIntervalSecs: BigInt.from(600));
  static const String esploraServerUrl = 'https://mutinynet.ltbl.io/api';
  static const String rgsServerUrl = 'https://mutinynet.ltbl.io/snapshot';
  static const String lsps2SourceAddress = '44.219.111.31';
  static const int lsps2SourcePort = 39735;
  static const String lsps2SourcePublicKey =
      '0371d6fd7d75de2d0372d03ea00e8bacdacb50c27d0eaea0a76a0622eff1f5ef2b';
  static const String lsps2SourceToken = 'JZWN9YLW';
}
