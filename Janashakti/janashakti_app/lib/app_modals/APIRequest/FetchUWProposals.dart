class FetchUWProposals {
  String userName;
  FetchUWProposals(this.userName);
  FetchUWProposals.fromJson(String _userName) {
    userName = _userName;
  }
  Map toJson() => {"UserName": userName};
}
