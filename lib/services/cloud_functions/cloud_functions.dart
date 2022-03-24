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
}