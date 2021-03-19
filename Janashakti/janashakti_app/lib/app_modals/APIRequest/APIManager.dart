import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:jiclapp/app_modals/APIRequest/FetchProposalFailedCases.dart';
import 'package:jiclapp/app_modals/APIRequest/FetchUWProposals.dart';
import 'package:jiclapp/app_modals/APIRequest/LoadMastersForQuote.dart';
import 'package:jiclapp/app_modals/APIRequest/MyPolicyDocumentUpload.dart';
import 'package:jiclapp/app_modals/APIRequest/SaveProposalPaymentInfo.dart';
import 'package:jiclapp/app_modals/APIRequest/SubmitProposalPaymentOTPInfo.dart';
import 'package:jiclapp/app_modals/APIRequest/VerifyProposalPaymentOTPInfo.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_modals/APIRequest/RiderMaxAndMin.dart';
import 'package:jiclapp/app_modals/APIRequest/SaveProspect.dart';
import 'package:jiclapp/app_modals/APIRequest/SaveSuspect.dart';
import 'package:jiclapp/app_modals/APIRequest/QuotePool.dart';
import 'package:jiclapp/app_modals/APIRequest/LoginService.dart';
import 'package:jiclapp/app_modals/APIRequest/ChangePasswordRequest.dart';
import 'package:jiclapp/app_modals/APIRequest/ProposalIncompleteDetails.dart';
import 'package:jiclapp/app_modals/APIRequest/FetchProposalInfo.dart';
import 'package:jiclapp/app_modals/APIRequest/LoadProposalInfo.dart';
import 'package:jiclapp/app_util/Configuration.dart';
import 'package:jiclapp/app_modals/APIRequest/PremiumCalculation.dart';
import 'package:jiclapp/app_modals/APIRequest/SaveNeedAnalysis.dart';
import 'package:jiclapp/app_modals/APIRequest/SaveProposal.dart';
import 'package:jiclapp/app_modals/APIRequest/SaveQuote.dart';
import 'package:jiclapp/app_util/UserManager.dart';

class Header {
  static final kContentType = "application/json";
}

class MethodName {
  static final kFetchRiderMaxAndMinLimits =
      "/LifeQuoteApi/FetchRiderMaxAndMinLimits";
  static final kCalculateQuotePremium = "/LifePolicyApi/CalculateQuotePremium";
  static final kSaveSuspect = "/SuspectApi/SaveSuspect";
  static final kSaveProspect = "/SuspectApi/SaveProspect";
  static final kSaveNeedAnalysis = "/SuspectApi/SaveNeedAnalysis";
  static final kSaveQuote = "/LifeQuoteApi/SaveQuote";
  static final kSaveProposal = "/LifePolicyApi/SaveProposal";
  static final kEncryption = "/LifeQuoteApi/Encryption";
  static final kViewPDF = "/Reports/ReportForCashQuotation";
  static final kSendEmailWithPdfAttachment =
      "/Reports/SendEmailWithPdfAttachment";
  static final kLoadQuotationPoolData = "/LifeQuoteApi/LoadQuotationPoolData";
  static final kFetchProposalIncompleteDetails =
      "/LifePolicyApi/FetchProposalIncompleteDetails";
  static final kFetchProposalInfo = "/LifePolicyApi/FetchProposalInfo";
  static final kSaveFile = "/Utility/SaveFile";
  static final kDocumentUpload = "/Utility/SaveDocuments";
  static final kLoadProposalInfo = "/LifePolicyApi/LoadProposalInfo";
  static final kMobilityLogin = "/Account/MobilityLogin";
  static final kUserManagement = "/UserManagement/MobilityResetPassword";
  static final kSaveQuotePDF = "/Reports/SaveQuotePDF";
  static final kMPolicyDocumentUpload = "/Policy/MPolicyDocumentUpload";
  static final kSubmitProposalPaymentOTPInfo =
      "/LifePaymentApi/SubmitProposalPaymentOTPInfo";
  static final kVerifyProposalPaymentOTPInfo =
      "/LifePaymentApi/VerifyProposalPaymentOTPInfo";
  static final kSaveProposalPaymentInfo =
      "/LifePaymentApi/SaveProposalPaymentInfo";
  static final kFetchUWProposals = "/LifePolicyApi/FetchUWProposals";
  static final kFetchProposalFailedCases =
      "/LifePolicyApi/FetchProposalFailedCases";
  static final kLoadMastersForQuote = "/LifeQuoteApi/LoadMastersForQuote";
}

class APIManager {
  static APIManager _shareInstance;
  factory APIManager() => _shareInstance ??= APIManager._();
  APIManager._();

Future<String>loadMastersForQuote(String _planName){
  LoadMastersForQuote _loadMastersForQuote = LoadMastersForQuote.fromJSON(_planName);
   final jsonValues = jsonEncode(_loadMastersForQuote.toJson());
    Future<String> resposne =
        postRequest(jsonValues, MethodName.kLoadMastersForQuote);
  return resposne;
}

  //FetchUWProposals
  Future<String> fetchUWProposals() {
    FetchUWProposals proposalInfo =
        FetchUWProposals.fromJson(UserManager().userID);
    final jsonValues = jsonEncode(proposalInfo.toJson());
    Future<String> resposne =
        postRequest(jsonValues, MethodName.kFetchUWProposals);
    return resposne;
  }

  //FetchProposalFailedCases
  Future<String> fetchProposalFailedCases() {
    FetchProposalFailedCases proposalInfo =
        FetchProposalFailedCases.fromJson(UserManager().iD);
    final jsonValues = jsonEncode(proposalInfo.toJson());
    Future<String> resposne =
        postRequest(jsonValues, MethodName.kFetchProposalFailedCases);
    return resposne;
  }

  //SubmitProposalPaymentOTPInfo
  Future<String> submitProposalPaymentOTPInfo(Map _object) {
    SubmitProposalPaymentOTPInfo proposalInfo =
        SubmitProposalPaymentOTPInfo.fromJson(_object);
    final jsonValues = jsonEncode(proposalInfo.toJson());
    Future<String> resposne =
        postRequest(jsonValues, MethodName.kSubmitProposalPaymentOTPInfo);
    return resposne;
  }

  //VerifyProposalPaymentOTPInfo
  Future<String> verifyProposalPaymentOTPInfo(Map _object) {
    VerifyProposalPaymentOTPInfo proposalInfo =
        VerifyProposalPaymentOTPInfo.fromJson(_object);
    final jsonValues = jsonEncode(proposalInfo.toJson());
    Future<String> resposne =
        postRequest(jsonValues, MethodName.kVerifyProposalPaymentOTPInfo);
    return resposne;
  }

  //SaveProposalPaymentInfo
  Future<String> saveProposalPaymentInfo(
      Map _sectionSubsectionDetails, String userName) {
    SaveProposalPaymentInfo proposalInfo =
        SaveProposalPaymentInfo.fromJson(_sectionSubsectionDetails, userName);
    final jsonValues = jsonEncode(proposalInfo.toJson());
    Future<String> resposne =
        postRequest(jsonValues, MethodName.kSaveProposalPaymentInfo);
    return resposne;
  }

  //Save Document to the NewJann
  Future<dynamic> saveDocument(Map _object) {
    MyPolicyDocumentUpload proposalInfo =
        MyPolicyDocumentUpload.fromJson(_object);
    final jsonValues = jsonEncode(proposalInfo.toJson());
    Future<dynamic> resposne =
        userManagmentPostRequest(jsonValues, MethodName.kMPolicyDocumentUpload);
    return resposne;
  }

  //Change Password
  Future<dynamic> changePassword(Map _details) {
    ChangePasswordRequest _changePassword =
        ChangePasswordRequest.fromJson(_details);
    final _encodeJson = jsonEncode(_changePassword);
    Future<dynamic> resposne =
        userManagmentPostRequest(_encodeJson, MethodName.kUserManagement);
    return resposne;
  }

  //Login
  Future<dynamic> login(Map _details) {
    LoginService loginData = LoginService.fromJson(_details);
    final jsonValues = jsonEncode(loginData.toJson());
    Future<dynamic> resposne =
        userManagmentPostRequest(jsonValues, MethodName.kMobilityLogin);
    return resposne;
  }

  //UploadMediaFiles
  Future<String> uploadMediFiles(List file) {
    //UploadMedia proposalInfo = UploadMedia.fromJson(file);
    //final jsonValues = jsonEncode(proposalInfo.toJson());
    Future<String> resposne =
        uploadMediFilePostRequest(file, MethodName.kDocumentUpload);
    return resposne;
  }

  //LoadProposalInfo
  Future<String> getLoadProposalInfohUsername(
      String _userName, String _quoteNo) {
    LoadProposalInfo proposalInfo =
        LoadProposalInfo.fromJson(_userName, _quoteNo);
    final jsonValues = jsonEncode(proposalInfo.toJson());
    Future<String> resposne =
        postRequest(jsonValues, MethodName.kLoadProposalInfo);
    return resposne;
  }

  //FetchProposalInfo
  Future<String> getFetchProposalInfoWithUsername(
      String _userName, double _policyID) {
    FetchProposalInfo proposalInfo =
        FetchProposalInfo.fromJson(_userName, _policyID);
    final jsonValues = jsonEncode(proposalInfo.toJson());
    Future<String> resposne =
        postRequest(jsonValues, MethodName.kFetchProposalInfo);
    return resposne;
  }

  //Incomplete proposal Pool
  Future<String> getInCompleteProposalPoolWithUsername(String userName) {
    ProposalIncompleteDetails proposalPool =
        ProposalIncompleteDetails.fromJson(userName);
    final jsonValues = jsonEncode(proposalPool.toJson());
    Future<String> resposne =
        postRequest(jsonValues, MethodName.kFetchProposalIncompleteDetails);
    return resposne;
  }

  //Qotation pool
  //Send Email
  Future<String> sendEmailWithData(String data) {
    Future<String> resposne =
        getRequest("${MethodName.kSendEmailWithPdfAttachment}?QuoteNo=$data");
    return resposne;
  }

  Future<String> getQuotationPoolWithUsername(String userName) {
    LoadQuotationPool quotePool = LoadQuotationPool.fromJson(userName);
    final jsonValues = jsonEncode(quotePool.toJson());
    Future<String> resposne =
        postRequest(jsonValues, MethodName.kLoadQuotationPoolData);
    return resposne;
  }

  //SEND PDF
  Future<String> sendPDF(String quoteNo) {
    Future<String> resposne =
        getRequest("${MethodName.kSaveQuotePDF}?QuoteNo=$quoteNo");
    return resposne;
  }

  //VIEW PDF
  Future<Uint8List> viewPDFWithData(String data) {
    Future<Uint8List> resposne =
        getPDFRequest(null, "${MethodName.kViewPDF}?QuoteNo=$data");
    return resposne;
  }

  //Encryption
  Future<String> encryptionWithData(String data) {
    Future<String> resposne =
        postRequest(null, "${MethodName.kEncryption}?EncryptValue=$data");
    return resposne;
  }

  //Get MIN and MAx Values
  Future<String> getRiderMaxMinLimitsWithValue(
      _subSectionDetails, String value, riderMasters, int currentPage,int contactID) {
    RiderMaxAndMin maxMinJson = RiderMaxAndMin.formJson(
        _subSectionDetails, riderMasters, value, currentPage,contactID);
    final jsonValues = jsonEncode(maxMinJson.toJson());
    Future<String> resposne =
        postRequest(jsonValues, MethodName.kFetchRiderMaxAndMinLimits);
    return resposne;
  }

  //Calcualte Premium
  Future<String> calculatePremium(_subSectionDetails,
      Map benifitOverViewDetails, riderMasters, int currentPage,int contactID) {
    PremiumCalculation maxMinJson = PremiumCalculation.formJson(
        _subSectionDetails, benifitOverViewDetails, riderMasters, currentPage,contactID);
    final jsonValues = jsonEncode(maxMinJson.toJson());
    Future<String> resposne =
        postRequest(jsonValues, MethodName.kCalculateQuotePremium);
    return resposne;
  }

  //Save Quote
  Future<String> saveQuote(
      _subSectionDetails,
      Map benifitOverViewDetails,
      riderMasters,
      int currentPage,
      String quoteNo,
      String contactid,
      String username,
      dynamic tempJsonObject) {
    SaveQuote saveQuoteJson = SaveQuote.formJson(
        _subSectionDetails,
        benifitOverViewDetails,
        riderMasters,
        currentPage,
        quoteNo,
        contactid,
        username,
        tempJsonObject);
    final jsonValues = jsonEncode(saveQuoteJson.toJson());
    Future<String> resposne = postRequest(jsonValues, MethodName.kSaveQuote);
    return resposne;
  }

  //Save Proposal
  Future<String> saveProposal(
      _subSectionDetails,
      String contactid,
      String username,
      JsonObject jsonObject,
      String _memberID,
      String _memberLifeStyleID,
      dynamic fetchProposalInfo,
      List fieldDataDetails,
      List _mediaFiles,
      List _mediaData,
      String _webRefNumber,
      bool _isProceedToPayment) {
    SaveProposal saveProposalJson = SaveProposal.formJson(
        _subSectionDetails,
        username,
        contactid,
        jsonObject,
        _memberID,
        _memberLifeStyleID,
        fetchProposalInfo,
        fieldDataDetails,
        _mediaFiles,
        _mediaData,
        _webRefNumber,
        _isProceedToPayment);
    final jsonValues = jsonEncode(saveProposalJson.toJson());
    Future<String> resposne = postRequest(jsonValues, MethodName.kSaveProposal);
    return resposne;
  }

  //Save Suspect
  Future<String> saveSuspect(_subSectionDetails) {
    SaveSuspect suspect = SaveSuspect.fromJson(_subSectionDetails);
    final jsonValues = jsonEncode(suspect.toJson());
    Future<String> resposne = postRequest(jsonValues, MethodName.kSaveSuspect);
    return resposne;
  }

  //Save Prospect
  Future<String> saveProspect(
      Map _subSectionDetails, String contactID, String userName) {
    SaveProspect prospect =
        SaveProspect.fromJson(_subSectionDetails, contactID, userName);
    final jsonValues = jsonEncode(prospect.toJson());
    Future<String> resposne = postRequest(jsonValues, MethodName.kSaveProspect);
    return resposne;
  }

  //Save Need Analysis
  Future<String> saveSaveNeedAnalysis(Map _subSectionDetails, String contactID,
      String userName, List _mediaData, List<FieldData> _fieldData) {
    SaveNeedAnalysis needAnalysis = SaveNeedAnalysis.fromJson(
        _subSectionDetails, contactID, userName, _mediaData,_fieldData);
    final jsonValues = jsonEncode(needAnalysis.toJson());
    Future<String> resposne =
        postRequest(jsonValues, MethodName.kSaveNeedAnalysis);
    return resposne;
  }

  String returnAPIURLWithMethodName(String methodName) {
    switch (methodName) {
      case "/Reports/SendEmailWithPdfAttachment":
        return FlavorConfiguration.returnPDFOtherAPIURL();
        break;
      default:
        return FlavorConfiguration.returnAPIURL();
        break;
    }
  }

  //Uplaod Media FilePost Request
  Future<String> uploadMediFilePostRequest(
      List _list, String methodName) async {
    var url = FlavorConfiguration.returnPDFOtherAPIURL() +
        methodName +
        "?strUser=${_list[0]["contactId"]}&Req=${_list.length - 1}";
    var request = http.MultipartRequest("POST", Uri.parse(url));
    for (final item in _list) {
      Map _map = item as Map;
      var _media = await http.MultipartFile.fromPath("file_", _map["filePath"]);
      request.files.add(_media);
    }
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    return (response.statusCode == 200)
        ? String.fromCharCodes(responseData)
        : "";
  }

  //UserMangment Login
  Future<dynamic> userManagmentPostRequest(
      jsonValues, String methodName) async {
    var url = FlavorConfiguration.returnPDFOtherAPIURL() + methodName;
    var response = await http
        .post(url,
            headers: {"Content-Type": Header.kContentType}, body: jsonValues)
        .timeout(Duration(seconds: 60), onTimeout: () {
      return null;
    });
    print((response != null)
        ? "Request = $url\nResponse = ${response.body}"
        : "");
    return  (response != null) ? response : "";
  }

  //Post Request
  Future<String> postRequest(jsonValues, String methodName) async {
    var url = FlavorConfiguration.returnAPIURL() + methodName;
    var response = await http
        .post(url,
            headers: {"Content-Type": Header.kContentType}, body: jsonValues)
        .timeout(Duration(seconds: 300), onTimeout: () {
      return null;
    });
    print((response != null)
        ? "Request = $url\nResponse = ${response.body}"
        : "");
    return (response != null) ? response.body : "";
  }

  //Get Request
  Future<String> getRequest(String methodName) async {
    var url = FlavorConfiguration.returnPDFOtherAPIURL() + methodName;
    var response = await http.get(
      url,
      headers: {"Content-Type": Header.kContentType},
    );
    print((response != null)
        ? "Request = $url\nResponse = ${response.body}"
        : "");
    return (response != null) ? response.body : "";
  }

  //Get PDF Request
  Future<Uint8List> getPDFRequest(jsonValues, String methodName) async {
    var url = FlavorConfiguration.returnPDFOtherAPIURL() + methodName;
    var response = await http.get(
      url,
      headers: {"Content-Type": Header.kContentType},
    );
    print((response != null)
        ? "Request = $url\nResponse = ${response.body}"
        : "");
    return (response != null) ? response.bodyBytes : "";
  }
}
