import 'package:ldk_mobile/src/utils/loader.dart';
import 'generated/bindings.dart';




/// Represents the configuration of an [`LdkLite`] instance.
class LiteConfig {
  Config ?_config ;
  LiteConfig(
      {required this.storageDirPath,
        this.esploraServerUrl,
        required this.network,
        this.listeningAddress,
        this.defaultCltvExpiryDelta}){
    _config = Config(storageDirPath: storageDirPath, esploraServerUrl: esploraServerUrl??'https://blockstream.info/api' , listeningAddress: listeningAddress, network: network, defaultCltvExpiryDelta: defaultCltvExpiryDelta??144);
  }
  /// The path where the underlying LDK and BDK persist their data.
  final String storageDirPath;
  /// The URL of the utilized Esplora server. default 'https://blockstream.info/api'
  String?  esploraServerUrl ;
  /// The used Bitcoin network.
  Network network = Network.Regtest;
  /// The IP address and TCP port the node will listen on.
  String ? listeningAddress ='0.0.0.0:9735';
  /// The default CLTV expiry delta to be used for payments.
  int? defaultCltvExpiryDelta;
}
/// A builder for an [`LdkLite`] instance, allowing to set some configuration and module choices from
/// the get go.
class LiteBuilder{
  LiteConfig ?_liteConfig;
  LiteBuilder.fromConfig({required  LiteConfig config}){
    _liteConfig = config;
  }

  Future<LdkNode> toLdkNode()async{
    final res = await  loaderApi.initBuilder(config:_liteConfig!._config!);
    return LdkNode._setLdkLiteInstance(res);
  }
}

class LdkNode{
  LdkLiteInstance? _ldkLiteInstance;
  String? nodeId;
  LdkNode._setLdkLiteInstance(LdkLiteInstance liteInstance){
    _ldkLiteInstance =liteInstance;
  }
  Future<LdkNode> start() async{
    nodeId =  await loaderApi.startLdkNode(ldkLiteInstance: _ldkLiteInstance!);
    return this;
  }
  Future<LdkNode> sync() async{
    await loaderApi.sync(ldkLiteInstance: _ldkLiteInstance!);
    print("Sync complete");
    return this;
  }
  Future<String> getNewAddress() async{
    final id =  await loaderApi.newFundingAddress(ldkLiteInstance: _ldkLiteInstance!);
    return id;
  }
  Future<String> connectOpenChannel({required String nodePubkeyAndAddress,   required int channelAmountSats,   required bool announceChannel,}) async{
    final id =  await loaderApi.connectOpenChannel(ldkLiteInstance: _ldkLiteInstance!, nodePubkeyAndAddress: nodePubkeyAndAddress, channelAmountSats: channelAmountSats, announceChannel: announceChannel);
    print("Channel $id created");
    return id;
  }
}