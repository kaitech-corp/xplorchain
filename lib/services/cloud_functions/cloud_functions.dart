import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../models/models.dart';

///Cloud functions are written in javascript and ran using Google Cloud Function
///These functions retrieve the data.
class CloudFunction {
  /// Demonstrates connecting to xrpl and user wallet then disconnecting
  Future<String> connectXRPL() async {
    final HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('connectXRPL');
    final HttpsCallableResult results = await callable(
        {'address': dotenv.env['address1'], 'secret': dotenv.env['secret1']});
    return results.data;
  }

  /// Obtains tokens associated with user wallet credentials stored on a env file.
  Future<dynamic> getTokens() async {
    final HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('getTokens');
    final HttpsCallableResult results = await callable(
        {'address': dotenv.env['address1'], 'secret': dotenv.env['secret1']});
    return results.data;
  }

  /// Obtains tokens associated with user wallet credentials stored on a env file.
  Future<dynamic> mintToken({required MintMetaData mintMetaData}) async {
    final HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('mintToken');
    final HttpsCallableResult results = await callable({
      'address': dotenv.env['address1'],
      'secret': dotenv.env['secret1'],
      'quantity': mintMetaData.quantity,
      'description': mintMetaData.description,
      'hash': mintMetaData.hash,
      'itemName': mintMetaData.itemName,
      'mintType': mintMetaData.mintType,
      'primaryLink': mintMetaData.primaryLink,
      'secondaryLink': mintMetaData.secondaryLink,
      'tokenUrl': 'https://firebasestorage.googleapis.com/v0/b/coherent-window-339921.appspot.com/o/keychains%2FIcon-512.png?alt=media&token=e1dd366c-6b23-4396-808b-ff4331cbf4e8',
      'flags': 1,
    });

    return results.data;
  }

  /// Convert URI hex back to a string to display NFT link/metadata.
  Future<String> convertHexToString(String hex) async {
    final HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('convertHexToString');
    final HttpsCallableResult results = await callable({
      'hex': hex,
    });
    return results.data;
  }

  /// ***XUMM functions***
  /// Test function: ping
  Future<dynamic> pingXUMM() async {
    final HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('pingXUMM');
    final HttpsCallableResult results = await callable({
      'key': dotenv.env['XummKey'],
      'secret': dotenv.env['XummSecret'],
    });
    return results.data;
  }
}
