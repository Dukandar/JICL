import 'dart:convert';

import 'package:jiclapp/app_util/Constant.dart';

class SaveProposalPaymentInfo {
  String userName;
  dynamic message;
  dynamic proposalNo;
  String quoteNo;
  bool payforMultipleRecords;
  dynamic nicno;
  dynamic policyNo;
  List<LstPaymentItem> lstPaymentItems;
  dynamic attachment1;
  dynamic attachment2;
  dynamic attachment3;
  dynamic attachment4;
  String payableAmount;
  String payingAmount;
  dynamic mobile;
  dynamic home;
  dynamic work;
  dynamic email;
  String paymentOption;
  String paymentOtp;
  dynamic instrumentdate;
  DateTime cashDate;
  List<LstInsumentDetail> lstInsumentDetails;
  List<dynamic> lstPolicyInsumentDetails;
  dynamic lstInternalUtilization;
  dynamic uwMessage;
  dynamic uploadBankBioPage;
  dynamic accountNumber;
  dynamic maximumLimit;
  dynamic totalAmountToBeUtilized;
  dynamic totalBalanceAmount;
  dynamic chequeAmount;
  dynamic ddAmount;
  dynamic cashAmount;
  dynamic amountInDeposit;
  dynamic internalUtilization;
  dynamic advisorDeposit;
  dynamic clientEmail;
  dynamic mailStage;
  dynamic objDailyEmailDetails1;
  dynamic objDailyEmailDetails2;
  dynamic objDailyEmailDetails3;
  dynamic objDailyEmailDetails4;
  dynamic objDailyEmailDetails5;
  dynamic lstPaymentMethod;
  dynamic lstRelations;
  dynamic lstBankNames;
  int contactId;
  List<dynamic> lstPolicyPaymentItems;
  List<dynamic> lstReportee;
  SaveProposalPaymentInfo({
    this.userName,
    this.message,
    this.proposalNo,
    this.quoteNo,
    this.payforMultipleRecords,
    this.nicno,
    this.policyNo,
    this.lstPaymentItems,
    this.attachment1,
    this.attachment2,
    this.attachment3,
    this.attachment4,
    this.payableAmount,
    this.payingAmount,
    this.mobile,
    this.home,
    this.work,
    this.email,
    this.paymentOption,
    this.paymentOtp,
    this.instrumentdate,
    this.cashDate,
    this.lstInsumentDetails,
    this.lstPolicyInsumentDetails,
    this.lstInternalUtilization,
    this.uwMessage,
    this.uploadBankBioPage,
    this.accountNumber,
    this.maximumLimit,
    this.totalAmountToBeUtilized,
    this.totalBalanceAmount,
    this.chequeAmount,
    this.ddAmount,
    this.cashAmount,
    this.amountInDeposit,
    this.internalUtilization,
    this.advisorDeposit,
    this.clientEmail,
    this.mailStage,
    this.objDailyEmailDetails1,
    this.objDailyEmailDetails2,
    this.objDailyEmailDetails3,
    this.objDailyEmailDetails4,
    this.objDailyEmailDetails5,
    this.lstPaymentMethod,
    this.lstRelations,
    this.lstBankNames,
    this.contactId,
    this.lstPolicyPaymentItems,
    this.lstReportee,
  });
  SaveProposalPaymentInfo.fromJson(Map _sectionSubsectionDetails,String _userName) {
    List _list = _sectionSubsectionDetails[1026];
    List _insurmentDetailsList = json.decode(_list[22].fieldValue);
    userName = _userName;
    message = null;
    proposalNo = null;
    quoteNo = _insurmentDetailsList[0]["1"];
    payforMultipleRecords = false;
    nicno = null;
    policyNo = null;
    lstPaymentItems = [];
    attachment1 = null;
    attachment2 = null;
    attachment3 = null;
    attachment4 = null;
    payableAmount =  _list[20].fieldValue;
    payingAmount = _list[21].fieldValue;
    mobile = null;
    home = null;
    work = null;
    email = null;
    paymentOption = null;
    paymentOtp = null;
    instrumentdate = null;
    cashDate = null;
    lstInsumentDetails = List<LstInsumentDetail>.from(_insurmentDetailsList.map((e) => LstInsumentDetail.fromJson(e)));
    lstPolicyInsumentDetails = [];
    lstInternalUtilization = null;
    uwMessage = null;
    uploadBankBioPage = null;
    accountNumber = null;
    maximumLimit = null;
    totalAmountToBeUtilized = null;
    totalBalanceAmount = null;
    chequeAmount = null;
    ddAmount = null;
    cashAmount = null;
    amountInDeposit = null;
    internalUtilization = null;
    advisorDeposit = null;
    clientEmail = null;
    mailStage = null;
    objDailyEmailDetails1 = null;
    objDailyEmailDetails2 = null;
    objDailyEmailDetails3 = null;
    objDailyEmailDetails4 = null;
    objDailyEmailDetails5 = null;
    lstPaymentMethod = null;
    lstRelations = null;
    lstBankNames = null;
    contactId = null;
    lstPolicyPaymentItems = [];
    lstReportee = [];
  }

  Map toJson() => {
        "UserName": userName,
        "Message": message,
        "ProposalNo": proposalNo,
        "QuoteNo": quoteNo,
        "PayforMultipleRecords": payforMultipleRecords,
        "NICNO": nicno,
        "PolicyNo": policyNo,
        "lstPaymentItems":lstPaymentItems,
        "Attachment1": attachment1,
        "Attachment2": attachment2,
        "Attachment3": attachment3,
        "Attachment4": attachment4,
        "PayableAmount": payableAmount,
        "PayingAmount": payingAmount,
        "Mobile": mobile,
        "Home": home,
        "Work": work,
        "Email": email,
        "PaymentOption": paymentOption,
        "PaymentOTP": paymentOtp,
        "Instrumentdate": instrumentdate,
        "CashDate": cashDate,
        "lstInsumentDetails":
            List<dynamic>.from(lstInsumentDetails.map((e) => e.toJson())),
        "lstPolicyInsumentDetails":lstPolicyInsumentDetails,
        "lstInternalUtilization": lstInternalUtilization,
        "UWMessage": uwMessage,
        "UploadBankBioPage": uploadBankBioPage,
        "AccountNumber": accountNumber,
        "MaximumLimit": maximumLimit,
        "TotalAmountToBeUtilized": totalAmountToBeUtilized,
        "TotalBalanceAmount": totalBalanceAmount,
        "chequeAmount": chequeAmount,
        "ddAmount": ddAmount,
        "cashAmount": cashAmount,
        "AmountInDeposit": amountInDeposit,
        "InternalUtilization": internalUtilization,
        "AdvisorDeposit": advisorDeposit,
        "ClientEmail": clientEmail,
        "MailStage": mailStage,
        "objDailyEmailDetails1": objDailyEmailDetails1,
        "objDailyEmailDetails2": objDailyEmailDetails2,
        "objDailyEmailDetails3": objDailyEmailDetails3,
        "objDailyEmailDetails4": objDailyEmailDetails4,
        "objDailyEmailDetails5": objDailyEmailDetails5,
        "LstPaymentMethod": lstPaymentMethod,
        "lstRelations": lstRelations,
        "lstBankNames": lstBankNames,
        "ContactID": contactId,
        "lstPolicyPaymentItems":lstPolicyPaymentItems,
        "lstReportee": lstReportee,
      };
}

//LstInsumentDetail
class LstInsumentDetail {
  String clientName;
  dynamic payerType;
  String proposalNumber;
  dynamic policyNumber;
  String methodofPayment;
  String premiumAmount;
  dynamic instrumentNo;
  String amountPaid;
  String bankName;
  String branchName;
  dynamic instrumentdate;
  bool isDeleted;
  LstInsumentDetail({
    this.clientName,
    this.payerType,
    this.proposalNumber,
    this.policyNumber,
    this.methodofPayment,
    this.premiumAmount,
    this.instrumentNo,
    this.amountPaid,
    this.bankName,
    this.branchName,
    this.instrumentdate,
    this.isDeleted,
  });
  LstInsumentDetail.fromJson(Map object) {
    clientName = (object["0"].length > 0) ? object["0"] : null;
    payerType = (object["5"].length > 0) ? object["5"] : null;
    proposalNumber = null;
    policyNumber = ( object["1"].length > 0) ?  object["1"] : null;
    methodofPayment = (object["2"].length > 0) ? object["2"] : null;
    premiumAmount = (object["3"].length > 0) ? object["3"] : null;
    instrumentNo = (object["7"].length > 0) ? object["7"] : null;
    amountPaid = (object["4"].length > 0) ? object["4"] : null;
    bankName =  (object["9"].length > 0) ? object["9"] : null;
    branchName =  (object["10"].length > 0) ? object["10"] : null;
    instrumentdate = (object["8"].length > 0) ? object["8"] : null;
    isDeleted = false;
  }

  Map toJson() => {
        "ClientName": clientName,
        "PayerType": payerType,
        "ProposalNumber": proposalNumber,
        "PolicyNumber": policyNumber,
        "MethodofPayment": methodofPayment,
        "PremiumAmount": premiumAmount,
        "InstrumentNo": instrumentNo,
        "AmountPaid": amountPaid,
        "BankName": bankName,
        "BranchName": branchName,
        "Instrumentdate": instrumentdate,
        "IsDeleted": isDeleted,
      };
}

class LstPaymentItem {
  int paymentId;
  bool isSelected;
  dynamic isInsuranceCover;
  dynamic contributionPremium;
  int index;
  int policyId;
  dynamic quoteNo;
  dynamic proposalNo;
  dynamic insuredName;
  dynamic planName;
  dynamic policyTerm;
  dynamic paymentFrequency;
  dynamic issueDate;
  dynamic premium;

  LstPaymentItem({
    this.paymentId,
    this.isSelected,
    this.isInsuranceCover,
    this.contributionPremium,
    this.index,
    this.policyId,
    this.quoteNo,
    this.proposalNo,
    this.insuredName,
    this.planName,
    this.policyTerm,
    this.paymentFrequency,
    this.issueDate,
    this.premium,
  });

  LstPaymentItem.fromJson() {
    paymentId = null;
    isSelected = null;
    isInsuranceCover = null;
    contributionPremium = null;
    index = null;
    policyId = null;
    quoteNo = null;
    proposalNo = null;
    insuredName = null;
    planName = null;
    policyTerm = null;
    paymentFrequency = null;
    issueDate = null;
    premium = null;
  }

  Map toJson() => {
        "PaymentId": paymentId,
        "IsSelected": isSelected,
        "IsInsuranceCover": isInsuranceCover,
        "ContributionPremium": contributionPremium,
        "Index": index,
        "PolicyId": policyId,
        "QuoteNo": quoteNo,
        "ProposalNo": proposalNo,
        "InsuredName": insuredName,
        "PlanName": planName,
        "PolicyTerm": policyTerm,
        "PaymentFrequency": paymentFrequency,
        "IssueDate": issueDate,
        "Premium": premium,
      };
}
