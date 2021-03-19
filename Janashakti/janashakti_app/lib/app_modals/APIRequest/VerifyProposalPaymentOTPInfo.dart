class VerifyProposalPaymentOTPInfo {
  String userName;
  String paymentOTP;
  VerifyProposalPaymentOTPInfo({this.userName, this.paymentOTP});
  VerifyProposalPaymentOTPInfo.fromJson(Map _object) {
    userName = _object["userName"];
    paymentOTP = _object["paymentOTP"];
  }

  Map toJson() => {"UserName": userName, "PaymentOTP": paymentOTP};
}
