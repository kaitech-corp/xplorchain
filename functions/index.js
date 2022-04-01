const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const xrpl = require("xrpl");
const {XummSdk} = require("xumm-sdk");

// Demonstrates connecting to xrpl and user wallet then disconnecting
exports.connectXRPL = functions.https.onCall((data, context) =>{
  // for testing purposes no authorization is necessary
  if (!context.auth) {
    // throw new functions.https.HttpsError(
    //   'unauthenticated',
    //   'Unable to perform action.'
    // );
  }

  const wallet = xrpl.Wallet.fromSeed(data.secret);
  // verify address
  console.log(wallet.classicAddress);
  const client = new xrpl.Client("wss://xls20-sandbox.rippletest.net:51233");
  client.connect();
  client.disconnect();
  return ("Connected to Sandbox");
});

// Obtains tokens associated with user wallet credentials provided.
exports.getTokens = functions.https.onCall(async (data, context) =>{
  if (!context.auth) {
    // throw new functions.https.HttpsError(
    //   'unauthenticated',
    //   'Unable to perform action.'
    // );
  }
  const wallet = xrpl.Wallet.fromSeed(data.secret);
  const client = new xrpl.Client("wss://xls20-sandbox.rippletest.net:51233");
  await client.connect();
  console.log("Connected to Sandbox");
  const nfts = await client.request({
    method: "account_nfts",
    account: wallet.classicAddress,
  });
  console.log(nfts);
  client.disconnect();
  return nfts;
});

exports.convertHexToString = functions.https.onCall(async (data, context) =>{
  return xrpl.convertHexToString(data.hex);
});

// Functions to mint burn, create buy and sell orders will follow here.

// Mint token
exports.mintToken = functions.https.onCall((data, context) =>{
  // for testing purposes no authorization is necessary
  if (!context.auth) {
    // throw new functions.https.HttpsError(
    //   'unauthenticated',
    //   'Unable to perform action.'
    // );
  }
  // Connect to wallet
  const wallet = xrpl.Wallet.fromSeed(data.secret);
  // verify address
  console.log(wallet.classicAddress);
  const client = new xrpl.Client("wss://xls20-sandbox.rippletest.net:51233");
  client.connect();
  console.log("Connected to Sandbox");

  // Handle transaction
  const transaction = {
    "TransactionType": "NFTokenMint",
    "Account": wallet.classicAddress,
    "URI": xrpl.convertStringToHex(data.tokenUrl),
    "Flags": parseInt(data.flags),
    "TokenTaxon": 0,
  };
  // Submit signed transaction
  const tx = client.submitAndWait(transaction, {wallet});

  // Request nfts
  const nfts = client.request({
    method: "accounts_nfts",
    account: wallet.classicAddress,
  });

  // Log results
  const result = "Transaction result:"+ tx.result.meta.TransactionResult;
  const balance = "Balance changes:" + JSON.stringify(
      xrpl.getBalanceChanges(tx.result.meta), null, 2);
  console.log(nfts);
  console.log(result);
  console.log(balance);
  const results = [nfts, result, balance];

  // Disconnect
  client.disconnect();

  return results;
});

// Burn NFT
exports.burnToken = functions.https.onCall((data, context) =>{
  // for testing purposes no authorization is necessary
  if (!context.auth) {
    // throw new functions.https.HttpsError(
    //   'unauthenticated',
    //   'Unable to perform action.'
    // );
  }
  // Connect to wallet
  const wallet = xrpl.Wallet.fromSeed(data.secret);
  // verify address
  console.log(wallet.classicAddress);
  const client = new xrpl.Client("wss://xls20-sandbox.rippletest.net:51233");
  client.connect();
  console.log("Connected to Sandbox");

  // Handle transaction
  const transaction = {
    "TransactionType": "NFTokenBurn",
    "Account": wallet.classicAddress,
    "TokenID": data.tokenID,
  };
  // Submit signed transaction
  const tx = client.submitAndWait(transaction, {wallet});

  // Request nfts
  const nfts = client.request({
    method: "accounts_nfts",
    account: wallet.classicAddress,
  });

  // Log results
  const result = "Transaction result:"+ tx.result.meta.TransactionResult;
  const balance = "Balance changes:" + JSON.stringify(
      xrpl.getBalanceChanges(tx.result.meta), null, 2);
  console.log(nfts);
  console.log(result);
  console.log(balance);
  const results = [nfts, result, balance];
  // Disconnect
  client.disconnect();

  return results;
});

// XUMM Functions
// Test function: ping
exports.pingXUMM = functions.https.onCall(async (data, context) =>{
  const xumm = new XummSdk(data.key, data.secret);
  const appInfo = await xumm.ping();
  console.log(appInfo.application.name);

  return appInfo;
});

// Payment Request
exports.paymentRequest = functions.https.onCall(async (data, context) =>{
  const xumm = new XummSdk(data.key, data.secret);
  const request = {
    "TransactionType": "Payment",
    "Destination": data.destination,
    "Amount": data.amount,
    "Memos": [
      {
        "Memo": {
          "MemoData": xrpl.convertStringToHex(data.memo),
        },
      },
    ],
  };
  const payload = await xumm.payload.create(request, true);
  console.log(payload);

  return payload;
});
