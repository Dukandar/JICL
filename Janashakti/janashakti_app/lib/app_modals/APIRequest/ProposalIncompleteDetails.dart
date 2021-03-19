class ProposalIncompleteDetails{
  String  userName;
  dynamic userId;
  dynamic quoteNo;
  dynamic message;
  dynamic objProposalDetails;
  dynamic lstProposalfailedCases;
  dynamic lstDecision;
  dynamic lstReportee;

  ProposalIncompleteDetails({
    this.userName,
    this.userId,
    this.quoteNo,
    this.message,
    this.objProposalDetails,  
    this.lstProposalfailedCases,
    this.lstDecision,
    this.lstReportee,
  });

   ProposalIncompleteDetails.fromJson(String loginUserName){
      userName = loginUserName;
      userId = null;
      quoteNo = null;
      message = null;
      objProposalDetails = [];
      lstProposalfailedCases = null;
      lstDecision = null;
      lstReportee = null;
    }

  Map toJson()=>{
    "UserName": userName,
    "UserID": userId,
    "QuoteNo": quoteNo,
    "Message": message, 
    "objProposalDetails": objProposalDetails,
    "LstProposalfailedCases": lstProposalfailedCases,
    "lstDecision": lstDecision,
    "lstReportee": lstReportee,
  };

}