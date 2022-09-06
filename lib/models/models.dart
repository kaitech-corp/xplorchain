///  Model NFT details
class NFTDetailsModel {
  NFTDetailsModel({required this.index});
  final String index;
}

class XRPLResponseData {

  XRPLResponseData({this.id,this.result,this.type});

  XRPLResponseData.fromJson(Map<String, dynamic> jsonMap):
    id = jsonMap['id'],
    result = jsonMap['result'],
    type = jsonMap['type'];
  String? id;
  XRPLTransaction? result;
  String? type;
}

/// Model for xrpl transaction data
class XRPLTransaction {

  XRPLTransaction({this.account,this.accountNFTs,this.ledgerCurrentIndex,this.validated});

  XRPLTransaction.fromJson(Map<String, dynamic> jsonMap):
    accountNFTs = jsonMap['account_nfts'],
    ledgerCurrentIndex = jsonMap['ledger_current_index'],
    validated = jsonMap['validated'];
  String? account;
  List<AccountNFTs>? accountNFTs;
  int? ledgerCurrentIndex;
  bool? validated;

}

/// Model for accountNFTs data from transaction
class AccountNFTs {

  AccountNFTs({this.flags,this.issuer,this.nftSerial,this.tokenID,this.tokenTaxon,this.uri});

  AccountNFTs.fromJSON(Map<String, dynamic> jsonMap):
    flags = jsonMap['Flags'],
    issuer = jsonMap['Issuer'],
    tokenID = jsonMap['TokenID'],
    tokenTaxon = jsonMap['TokenTaxon'],
    uri = jsonMap['URI'],
    nftSerial = jsonMap['nft_serial'];
  int? flags;
  String? issuer;
  String? tokenID;
  int? tokenTaxon;
  String? uri;
  int? nftSerial;
}

/// Model for metadata 
class MintMetaData {

  MintMetaData(
      {required this.quantity,
      required this.description,
      required this.hash,
      required this.itemName,
      required this.mintType,
      required this.primaryLink,
      this.secondaryLink});
  int quantity;
  String description;
  String hash;
  String itemName;
  String  mintType;
  String primaryLink;
  String? secondaryLink;
}