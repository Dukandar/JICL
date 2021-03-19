class FetchProposalFailedCases {
  String userName;
  FetchProposalFailedCases(this.userName);
  FetchProposalFailedCases.fromJson(String _userName) {
    userName = _userName;
  }
  Map toJson() => {"UserName": userName};
}
