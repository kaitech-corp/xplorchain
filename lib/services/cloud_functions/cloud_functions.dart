import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

///Cloud functions are written in javascript and ran using Google Cloud Function
///These functions retrieve the data.
class CloudFunction {

///Demonstrates connecting to xrpl and user wallet then disconnecting
  Future<String> connectXRPL() async {
    final HttpsCallable callable = FirebaseFunctions.instance
        .httpsCallable('connectXRPL');
    final results = await callable({
      'address': dotenv.env['address1'],
      'secret': dotenv.env['secret1']
    });
    return results.data;
  }

  ///Obtains tokens associated with user wallet credentials stored on a env file.
  Future<dynamic> getTokens() async {
    final HttpsCallable callable = FirebaseFunctions.instance
        .httpsCallable('getTokens');
    final results = await callable({
      'address': dotenv.env['address1'],
      'secret': dotenv.env['secret1']
    });
    return results.data;
  }

  ///Obtains tokens associated with user wallet credentials stored on a env file.
  Future<dynamic> mintTokens() async {
    final HttpsCallable callable = FirebaseFunctions.instance
        .httpsCallable('mintTokens');
    final results = await callable({
      'address': dotenv.env['address1'],
      'secret': dotenv.env['secret1']
    });
    return results.data;
  }

  ///Convert URI hex back to a string to display NFT link/metadata.
  Future<String> convertHexToString(String hex) async {
    final HttpsCallable callable = FirebaseFunctions.instance
        .httpsCallable('convertHexToString');
    final results = await callable({
      'hex': hex,
    });
    return results.data;
  }
}

