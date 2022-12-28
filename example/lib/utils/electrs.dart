import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getResponse(String method, List params) async {
  var authorization = 'Basic ${base64Encode(utf8.encode('bitcoin:bitcoin'))}';
  var headers = {
    'content-type': 'text/plain',
    'Authorization': authorization,
  };
  final data =
      '{"jsonrpc": "1.0", "id": "curl", "method":"$method" , "params": $params}';
  var url = Uri.parse('http://127.0.0.1:8332/');
  var res = await http.post(url, headers: headers, body: data);
  if (res.statusCode == 200) {
    final transactionJson = json.decode(res.body) as Map<String, dynamic>;
    return transactionJson;
  } else {
    throw Exception(
        'http.post error: statusCode = ${res.statusCode} & statusMessage = ${res.body}');
  }
}

Future<int> getBlockchainHeight() async {
  final res = await getResponse('getblockchaininfo', []);
  return res["result"]['blocks'];
}

Future<String> getBlockHash(int height) async {
  final res = await getResponse('getblockhash', [height]);
  return res["result"];
}

Future<String> getBlockHeader(String hash) async {
  final res = await getResponse('getblockheader', ['"$hash"', false]);
  return res["result"];
}

Future<String> getNewAddress() async {
  final res = await getResponse('getnewaddress', []);
  return res["result"];
}

Future<List<dynamic>> generateToAddress(String address, int blocks) async {
  final res = await getResponse('generatetoaddress', [blocks, '"$address"']);
  return res["result"];
}
