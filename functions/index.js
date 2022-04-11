const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const xrpl = require("xrpl");
const {XummSdk} = require("xumm-sdk");


/* Current xrpl functions
* Connect to XRPL
* Get tokens
* Mint token
* Burn token


*/

//********************************
//** Connect to XRPL ***********
//********************************

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

//********************************
//** Mint NFT ***********
//********************************

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

//********************************
//** Burn NFT ***********
//********************************

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

//********************************
//** Create Sell Offer ***********
//********************************

exports.createSellOffer = functions.https.onCall(async (data, context) =>{

 const wallet = xrpl.Wallet.fromSeed(secret.value);
 const client = new xrpl.Client("wss://xls20-sandbox.rippletest.net:51233");
 await client.connect();
 console.log("Connected to Sandbox");

 // Prepare transaction -------------------------------------------------------
 const transactionBlob = {
    "TransactionType": "NFTokenCreateOffer",
    "Account": wallet.classicAddress,
    "TokenID": data.tokenId,
    "Amount": data.amount,
    "Flags": parseInt(data.flags)
    };

  // Submit signed blob --------------------------------------------------------
  const tx = await client.submitAndWait(transactionBlob,{wallet})

  console.log("***Sell Offers***")
  let nftSellOffers
    try {
	    nftSellOffers = await client.request({
		method: "nft_sell_offers",
		tokenid: data.tokenId
	  })
	  } catch (err) {
	    console.log("No sell offers.")
	}
  console.log(JSON.stringify(nftSellOffers,null,2))
  console.log("***Buy Offers***")
  let nftBuyOffers
  try {
    nftBuyOffers = await client.request({
	method: "nft_buy_offers",
	tokenid: data.tokenId })
  } catch (err) {
    console.log("No buy offers.")
  }
  console.log(JSON.stringify(nftBuyOffers,null,2))

  // Check transaction results -------------------------------------------------
  console.log("Transaction result:",
    JSON.stringify(tx.result.meta.TransactionResult, null, 2))
  console.log("Balance changes:",
    JSON.stringify(xrpl.getBalanceChanges(tx.result.meta), null, 2))
  client.disconnect()
  // End of createSellOffer()
});

//********************************
//** Create Buy Offer ***********
//********************************

exports.createBuyOffer = functions.https.onCall(async (data, context) =>{

 const wallet = xrpl.Wallet.fromSeed(data.secret)
 const client = new xrpl.Client("wss://xls20-sandbox.rippletest.net:51233")
 await client.connect()
 console.log("Connected to Sandbox")

 // Prepare transaction -------------------------------------------------------
  const transactionBlob = {
      	"TransactionType": "NFTokenCreateOffer",
      	"Account": wallet.classicAddress,
      	"Owner": data.owner,
      	"TokenID": data.tokenId,
      	"Amount": data.amount,
      	"Flags": parseInt(data.flags)
  }

  // Submit signed blob --------------------------------------------------------
  const tx = await client.submitAndWait(transactionBlob,{wallet})

  console.log("***Sell Offers***")
  let nftSellOffers
    try {
	    nftSellOffers = await client.request({
		method: "nft_sell_offers",
		tokenid: data.tokenId
	  })
	  } catch (err) {
	    console.log("No sell offers.")
	}
  console.log(JSON.stringify(nftSellOffers,null,2))
  console.log("***Buy Offers***")
  let nftBuyOffers
  try {
    nftBuyOffers = await client.request({
	method: "nft_buy_offers",
	tokenid: data.tokenId})
  } catch (err) {
    console.log("No buy offers.")
  }
  console.log(JSON.stringify(nftBuyOffers,null,2))


  // Check transaction results -------------------------------------------------
  console.log("Transaction result:",
    JSON.stringify(tx.result.meta.TransactionResult, null, 2))
  console.log("Balance changes:",
    JSON.stringify(xrpl.getBalanceChanges(tx.result.meta), null, 2))
  client.disconnect()
  // End of createBuyOffer()
});

//***************************
//** Cancel Offer ***********
//***************************

exports.cancelOffer = functions.https.onCall(async (data, context) =>{

 const wallet = xrpl.Wallet.fromSeed(data.secret)
 const client = new xrpl.Client("wss://xls20-sandbox.rippletest.net:51233")
 await client.connect()
 console.log("Connected to Sandbox")

 const tokenOfferID = data.tokenOfferIndex
 const tokenOffers = [tokenOfferID]

 // Prepare transaction -------------------------------------------------------
  const transactionBlob = {
      	"TransactionType": "NFTokenCancelOffer",
      	"Account": wallet.classicAddress,
      	"TokenOffers": tokenOffers
  }

  // Submit signed blob --------------------------------------------------------
  const tx = await client.submitAndWait(transactionBlob,{wallet})


  console.log("***Sell Offers***")
  let nftSellOffers
    try {
	    nftSellOffers = await client.request({
		method: "nft_sell_offers",
		tokenid: data.tokenId
	  })
	  } catch (err) {
	    console.log("No sell offers.")
	}
  console.log(JSON.stringify(nftSellOffers,null,2))
  console.log("***Buy Offers***")
  let nftBuyOffers
  try {
    nftBuyOffers = await client.request({
	method: "nft_buy_offers",
	tokenid: data.tokenId})
  } catch (err) {
    console.log("No buy offers.")
  }
  console.log(JSON.stringify(nftBuyOffers,null,2))

  // Check transaction results -------------------------------------------------

  console.log("Transaction result:",
    JSON.stringify(tx.result.meta.TransactionResult, null, 2))
  console.log("Balance changes:",
    JSON.stringify(xrpl.getBalanceChanges(tx.result.meta), null, 2))

  client.disconnect()
  // End of cancelOffer()

})

//***************************
//** Get Offers *************
//***************************

exports.getOffers = functions.https.onCall(async (data, context) =>{

 const wallet = xrpl.Wallet.fromSeed(secret.value)
 const client = new xrpl.Client("wss://xls20-sandbox.rippletest.net:51233")
 await client.connect()
 console.log("Connected to Sandbox")
 console.log("***Sell Offers***")
 let nftSellOffers
   try {
    nftSellOffers = await client.request({
    method: "nft_sell_offers",
    tokenid: data.tokenId
  })
  } catch (err) {
    console.log("No sell offers.")
}
 console.log(JSON.stringify(nftSellOffers,null,2))
 console.log("***Buy Offers***")
 let nftBuyOffers
  try {
   nftBuyOffers = await client.request({
   method: "nft_buy_offers",
   tokenid: data.tokenId })
  } catch (err) {
    console.log("No buy offers.")
}
  console.log(JSON.stringify(nftBuyOffers,null,2))
  client.disconnect()
  // End of getOffers()

});

//***************************
//** Accept Sell Offer ******
//***************************

exports.acceptSellOffer = functions.https.onCall(async (data, context) =>{

 const wallet = xrpl.Wallet.fromSeed(secret.value)
 const client = new xrpl.Client("wss://xls20-sandbox.rippletest.net:51233")
 await client.connect()
 console.log("Connected to Sandbox")

 // Prepare transaction -------------------------------------------------------
  const transactionBlob = {
      	"TransactionType": "NFTokenAcceptOffer",
      	"Account": wallet.classicAddress,
      	"SellOffer": data.tokenOfferIndex,
  }
  // Submit signed blob --------------------------------------------------------
  const tx = await client.submitAndWait(transactionBlob,{wallet})
  const nfts = await client.request({
	method: "account_nfts",
	account: wallet.classicAddress
  })
  console.log(JSON.stringify(nfts,null,2))

  // Check transaction results -------------------------------------------------
  console.log("Transaction result:",
    JSON.stringify(tx.result.meta.TransactionResult, null, 2))
  console.log("Balance changes:",
    JSON.stringify(xrpl.getBalanceChanges(tx.result.meta), null, 2))
  client.disconnect()
  // End of acceptSellOffer()

})

//***************************
//** Accept Buy Offer *******
//***************************

exports.acceptBuyOffer = functions.https.onCall(async (data, context) =>{

 const wallet = xrpl.Wallet.fromSeed(secret.value)
 const client = new xrpl.Client("wss://xls20-sandbox.rippletest.net:51233")
 await client.connect()
 console.log("Connected to Sandbox")

 // Prepare transaction -------------------------------------------------------
  const transactionBlob = {
      	"TransactionType": "NFTokenAcceptOffer",
      	"Account": wallet.classicAddress,
      	"BuyOffer": data.tokenOfferIndex
  }
  // Submit signed blob --------------------------------------------------------
  const tx = await client.submitAndWait(transactionBlob,{wallet})
  const nfts = await client.request({
	method: "account_nfts",
	account: wallet.classicAddress
  })
  console.log(JSON.stringify(nfts,null,2))

  // Check transaction results -------------------------------------------------
  console.log("Transaction result:",
      JSON.stringify(tx.result.meta.TransactionResult, null, 2))
  console.log("Balance changes:",
      JSON.stringify(xrpl.getBalanceChanges(tx.result.meta), null, 2))
  client.disconnect()
  // End of submitTransaction()

});

//***************************
//** Cancel Offer ***********
//***************************

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

//***************************
//** XUMM sign in ***********
//***************************

exports signInXUMM = functions.https.onCall(async (data, context) =>{
 const xumm = new XummSdk(data.key, data.secret);
 const request = {
    "options": {
    "submit": false,
    "expire": 240,
    "return_url": {
      "app": "https://xrptipbot.com/signin?payload={id}",
      "web": "https://xrptipbot.com/signin?payload={id}"
    }
    },
    "user_token": "c5bc4ccc-28fa-4080-b702-0d3aac97b993",
    "txjson": {
    "TransactionType" : "SignIn"
    }
 }

});