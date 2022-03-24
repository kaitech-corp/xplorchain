const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const xrpl = require("xrpl");

//Demonstrates connecting to xrpl and user wallet then disconnecting
exports.connectXRPL = functions.https.onCall((data, context) =>{
  if (!context.auth) {
    // throw new functions.https.HttpsError(
    //   'unauthenticated',
    //   'Unable to perform action.'
    // );
  }

  const wallet = xrpl.Wallet.fromSeed(data.secret);
  console.log(wallet.classicAddress);
  const client = new xrpl.Client("wss://xls20-sandbox.rippletest.net:51233");
  client.connect();
  client.disconnect();
  return ("Connected to Sandbox");
});

//Obtains tokens associated with user wallet credentials provided.
exports.getTokens = functions.https.onCall((data, context) =>{
  if (!context.auth) {
    // throw new functions.https.HttpsError(
    //   'unauthenticated',
    //   'Unable to perform action.'
    // );
  }
  const wallet = xrpl.Wallet.fromSeed(data.secret);
  const client = new xrpl.Client("wss://xls20-sandbox.rippletest.net:51233");
  client.connect();
  console.log("Connected to Sandbox");
  const nfts = client.request({
    method: "account_nfts",
    account: wallet.classicAddress,
  });
  console.log(nfts);
  client.disconnect();
  return nfts;
});


//