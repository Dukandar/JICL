class SubmitProposalPaymentOTPInfo {
  String quoteNo;
  String userName;
  SubmitProposalPaymentOTPInfo({this.quoteNo, this.userName});
  SubmitProposalPaymentOTPInfo.fromJson(Map _object) {
    quoteNo = _object["quoteNo"];
    userName = _object["userName"];
  }
  Map toJson() => {"QuoteNo": quoteNo, "UserName": userName};
}
