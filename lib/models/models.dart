///  Model NFT details
class NFTDetailsModel {
  final String index;
  NFTDetailsModel({required this.index});
}

class XRPLResponseData {
  String? id;
  XRPLTransaction? result;
  String? type;

  XRPLResponseData({this.id,this.result,this.type});

  XRPLResponseData.fromJson(Map<String, dynamic> jsonMap):
    id = jsonMap["id"],
    result = jsonMap["result"],
    type = jsonMap["type"];
}

/// Model for xrpl transaction data
class XRPLTransaction {
  String? account;
  List<AccountNFTs>? accountNFTs;
  int? ledgerCurrentIndex;
  bool? validated;

  XRPLTransaction({this.account,this.accountNFTs,this.ledgerCurrentIndex,this.validated});

  XRPLTransaction.fromJson(Map<String, dynamic> jsonMap):
    accountNFTs = jsonMap["account_nfts"],
    ledgerCurrentIndex = jsonMap["ledger_current_index"],
    validated = jsonMap["validated"];

}

/// Model for accountNFTs data from transaction
class AccountNFTs {
  int? flags;
  String? issuer;
  String? tokenID;
  int? tokenTaxon;
  String? uri;
  int? nftSerial;

  AccountNFTs({this.flags,this.issuer,this.nftSerial,this.tokenID,this.tokenTaxon,this.uri});

  AccountNFTs.fromJSON(Map<String, dynamic> jsonMap):
    flags = jsonMap["Flags"],
    issuer = jsonMap["Issuer"],
    tokenID = jsonMap["TokenID"],
    tokenTaxon = jsonMap["TokenTaxon"],
    uri = jsonMap["URI"],
    nftSerial = jsonMap["nft_serial"];
}
