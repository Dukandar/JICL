class MyPolicyDocumentUpload {
  String proposalNo;
  dynamic policyID;
  String quoteNo;
  MyPolicyDocumentUpload({this.proposalNo, this.policyID, this.quoteNo});
  MyPolicyDocumentUpload.fromJson(Map _documentDetails) {
    proposalNo = _documentDetails["ProposalNo"];
    policyID = _documentDetails["PolicyID"];
    quoteNo = _documentDetails["QuoteNo"];
  }
  Map toJson() =>
      {"ProposalNo": proposalNo, "PolicyID": policyID, "QuoteNo": quoteNo};
}
