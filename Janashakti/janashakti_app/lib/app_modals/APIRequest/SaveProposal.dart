import 'dart:convert';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_util/Constant.dart';

class SaveProposal {
  dynamic lstIllustation;
  String userName;
  dynamic userId;
  int contactId;
  dynamic lifeAssured;
  int suspectPoolCountInfo;
  int suspectPoolCount;
  int prospectPoolCountInfo;
  int quotePoolCountInfo;
  int quotePoolCount;
  int proposalPoolCountInfo;
  int approvalPoolCountInfo;
  int prospectPoolCount;
  int confirmedProspectPoolCount;
  int needAnanlysisProspectCount;
  int proposalStatusCount;
  int proposalPendingCount;
  int proposalIncompleteCount;
  int suspectAllocationCount;
  int propspectAllocationCount;
  int quotationAllocationCount;
  int proposalAllocationCount;
  int proposalFailedCount;
  dynamic lstCashLessRiderChildren;
  List<LstBenifitDetails> lstBenifitDetails;
  List<dynamic> lstPackageDetails;
  List<LstPremiumDetails> lstPremiumDetails;
  dynamic lstMedicalReports;
  dynamic listAssured;
  String annualPremium;
  String halfYearlyPremium;
  String quaterlyPremium;
  String monthlyPremium;
  String singlePremium;
  int totalPremium;
  String cess;
  String vat;
  String policyFee;
  dynamic investmentPremium;
  dynamic protectionPremium;
  dynamic investmentTotalPremium;
  dynamic totalRiderPremium;
  dynamic contributionAmtCess;
  dynamic premiumCess;
  bool isForService;
  dynamic suminsured;
  String premium;
  dynamic productBasicPremium;
  String quoteNo;
  dynamic policyNo;
  dynamic isLi4InsuranceCovered;
  dynamic li4InsurancePremiumAmount;
  dynamic proposalNo;
  String planName;
  String planCode;
  dynamic term;
  String policyTerm;
  String paymentTerm;
  dynamic loanAmount;
  dynamic interestRate;
  String paymentFrequency;
  String paymentPaidBy;
  String paymentMethod;
  String paymentReceiptPrefferdBy;
  String modeOfCommunication;
  dynamic others;
  dynamic totalPremiumPayble;
  dynamic totalAmountPaid;
  dynamic balancetobePaid;
  dynamic underWriterRemarks;
  dynamic isclIncluded;
  dynamic saType;
  dynamic coverType;
  dynamic scheme;
  String preferredLanguage;
  dynamic objProspectDetails;
  dynamic objFillMemberDetials;
  bool isRegAsCommunication;
  dynamic message;
  dynamic status;
  dynamic uwMessage;
  dynamic listPlan;
  dynamic lstPolicyTerm;
  dynamic lstPremiumTerm;
  String hdnDocumentDetails;
  dynamic assuredName;
  int assuredIndex;
  int policyId;
  bool procceedToPayment;
  dynamic objPaymentInfo;
  bool isSpouseCovered;
  bool isViewProposal;
  dynamic objSuspectReAllocation;
  List<dynamic> objMemberDetails;
  List<dynamic> objNomineeDetails;
  dynamic childHeight;
  dynamic childWeight;
  dynamic childHeightUnit;
  dynamic childWeightUnit;
  dynamic childSuffer;
  dynamic childUnderMedication;
  dynamic sufferDetails;
  int noofJsPolicies;
  bool areyouCoveredUnderOtherPolicies;
  int noofOtherPolicies;
  dynamic totalDeath;
  dynamic totalAccidental;
  dynamic totalCritical;
  dynamic totalHospitalization;
  dynamic totalHospitalizationReimbursement;
  bool isAllocationReq;
  dynamic objLifeAssuredOtherInsurance;
  dynamic policyStageId;
  dynamic policyStageStatusId;
  dynamic signature;
  dynamic byteArray;
  dynamic strHtml;
  dynamic prospectSignature;
  String prospectSignaturePath;
  dynamic prospectByteArray;
  dynamic doctorName;
  dynamic labName;
  dynamic paymentMadeByForDoctor;
  dynamic paymentMadeByForLab;
  dynamic reportsTobeSendTo;
  bool medicalTestExists;
  dynamic childId;
  dynamic questionAnswer;
  int diseaseQuestionCount;
  dynamic prospectSignPath;
  String prospectImagePath;
  String spouseSignPath;
  dynamic emailFrom;
  dynamic emailPassword;
  dynamic emailImageLogo;
  dynamic domain;
  dynamic smtpHost;
  int port;
  dynamic isUat;
  dynamic uatImage;
  dynamic category;
  dynamic referredBy;
  dynamic referralReason;
  dynamic decision;
  dynamic lstDecision;
  dynamic rejection;
  dynamic lstRejection;
  dynamic uwComments;
  bool isExlusions;
  dynamic exlusionsDetails;
  bool isLoading;
  dynamic loadingDetails;
  dynamic healthCheckupCategory;
  dynamic lstHealthCheckupCategory;
  dynamic underwriter;
  dynamic lstUnderwriter;
  dynamic objDocumentUploadedFiles;
  List<dynamic> objDocumentUpload;
  dynamic maritalStatuslist;
  dynamic nationalities;
  List<dynamic> lstGender;
  List<dynamic> lstOccupation;
  dynamic lstLanguage;
  dynamic lstSalutation;
  dynamic lstDocumentType;
  dynamic lstRelations;
  dynamic lstNomineeRelations;
  dynamic lstPaymentfrequency;
  dynamic lstPaymentMethod;
  dynamic lstSateofHealth;
  dynamic lstCauseOfDeath;
  dynamic lstFamilyBackGroundRelationship;
  dynamic lstDiseaseFamilyBackGroundRelationship;
  dynamic lstGenitoDiseaseBackGroundRelationship;
  dynamic lstSmokeAndAlcholPer;
  dynamic lstSmokeTypes;
  dynamic lstAlcoholTypes;
  dynamic lstCurrentStatus;
  dynamic lstAerobicExercise;
  dynamic lstFruitOrVegetablePortions;
  dynamic lstFluidOrWater;
  dynamic lstDoctorNames;
  dynamic lstLabNames;
  dynamic lstHeight;
  dynamic lstWeight;
  dynamic lstCity;
  List<dynamic> lstDependentRelationship;
  dynamic lstModeofCommunication;
  dynamic lstPreferredReceipt;
  dynamic objListApproval;
  dynamic lstCountryCode;
  dynamic lstApprovalStatus;
  List<dynamic> lstPolicyPaymentItems;
  String quotePdfPath;
  dynamic financialNeedAnalysisPath;
  dynamic proposalFormPath;
  bool answer;
  SaveProposal(
      {this.lstIllustation,
      this.userName,
      this.userId,
      this.contactId,
      this.lifeAssured,
      this.suspectPoolCountInfo,
      this.suspectPoolCount,
      this.prospectPoolCountInfo,
      this.quotePoolCountInfo,
      this.quotePoolCount,
      this.proposalPoolCountInfo,
      this.approvalPoolCountInfo,
      this.prospectPoolCount,
      this.confirmedProspectPoolCount,
      this.needAnanlysisProspectCount,
      this.proposalStatusCount,
      this.proposalPendingCount,
      this.proposalIncompleteCount,
      this.suspectAllocationCount,
      this.propspectAllocationCount,
      this.quotationAllocationCount,
      this.proposalAllocationCount,
      this.proposalFailedCount,
      this.lstCashLessRiderChildren,
      this.lstBenifitDetails,
      this.lstPackageDetails,
      this.lstPremiumDetails,
      this.lstMedicalReports,
      this.listAssured,
      this.annualPremium,
      this.halfYearlyPremium,
      this.quaterlyPremium,
      this.monthlyPremium,
      this.singlePremium,
      this.totalPremium,
      this.cess,
      this.vat,
      this.policyFee,
      this.investmentPremium,
      this.protectionPremium,
      this.investmentTotalPremium,
      this.totalRiderPremium,
      this.contributionAmtCess,
      this.premiumCess,
      this.isForService,
      this.suminsured,
      this.premium,
      this.productBasicPremium,
      this.quoteNo,
      this.policyNo,
      this.isLi4InsuranceCovered,
      this.li4InsurancePremiumAmount,
      this.proposalNo,
      this.planName,
      this.planCode,
      this.term,
      this.policyTerm,
      this.paymentTerm,
      this.loanAmount,
      this.interestRate,
      this.paymentFrequency,
      this.paymentPaidBy,
      this.paymentMethod,
      this.paymentReceiptPrefferdBy,
      this.modeOfCommunication,
      this.others,
      this.totalPremiumPayble,
      this.totalAmountPaid,
      this.balancetobePaid,
      this.underWriterRemarks,
      this.isclIncluded,
      this.saType,
      this.coverType,
      this.scheme,
      this.preferredLanguage,
      this.objProspectDetails,
      this.objFillMemberDetials,
      this.isRegAsCommunication,
      this.message,
      this.status,
      this.uwMessage,
      this.listPlan,
      this.lstPolicyTerm,
      this.lstPremiumTerm,
      this.hdnDocumentDetails,
      this.assuredName,
      this.assuredIndex,
      this.policyId,
      this.procceedToPayment,
      this.objPaymentInfo,
      this.isSpouseCovered,
      this.isViewProposal,
      this.objSuspectReAllocation,
      this.objMemberDetails,
      this.objNomineeDetails,
      this.childHeight,
      this.childWeight,
      this.childHeightUnit,
      this.childWeightUnit,
      this.childSuffer,
      this.childUnderMedication,
      this.sufferDetails,
      this.noofJsPolicies,
      this.areyouCoveredUnderOtherPolicies,
      this.noofOtherPolicies,
      this.totalDeath,
      this.totalAccidental,
      this.totalCritical,
      this.totalHospitalization,
      this.totalHospitalizationReimbursement,
      this.isAllocationReq,
      this.objLifeAssuredOtherInsurance,
      this.policyStageId,
      this.policyStageStatusId,
      this.signature,
      this.byteArray,
      this.strHtml,
      this.prospectSignature,
      this.prospectSignaturePath,
      this.prospectByteArray,
      this.doctorName,
      this.labName,
      this.paymentMadeByForDoctor,
      this.paymentMadeByForLab,
      this.reportsTobeSendTo,
      this.medicalTestExists,
      this.childId,
      this.questionAnswer,
      this.diseaseQuestionCount,
      this.prospectSignPath,
      this.prospectImagePath,
      this.spouseSignPath,
      this.emailFrom,
      this.emailPassword,
      this.emailImageLogo,
      this.domain,
      this.smtpHost,
      this.port,
      this.isUat,
      this.uatImage,
      this.category,
      this.referredBy,
      this.referralReason,
      this.decision,
      this.lstDecision,
      this.rejection,
      this.lstRejection,
      this.uwComments,
      this.isExlusions,
      this.exlusionsDetails,
      this.isLoading,
      this.loadingDetails,
      this.healthCheckupCategory,
      this.lstHealthCheckupCategory,
      this.underwriter,
      this.lstUnderwriter,
      this.objDocumentUploadedFiles,
      this.objDocumentUpload,
      this.maritalStatuslist,
      this.nationalities,
      this.lstGender,
      this.lstOccupation,
      this.lstLanguage,
      this.lstSalutation,
      this.lstDocumentType,
      this.lstRelations,
      this.lstNomineeRelations,
      this.lstPaymentfrequency,
      this.lstPaymentMethod,
      this.lstSateofHealth,
      this.lstCauseOfDeath,
      this.lstFamilyBackGroundRelationship,
      this.lstDiseaseFamilyBackGroundRelationship,
      this.lstGenitoDiseaseBackGroundRelationship,
      this.lstSmokeAndAlcholPer,
      this.lstSmokeTypes,
      this.lstAlcoholTypes,
      this.lstCurrentStatus,
      this.lstAerobicExercise,
      this.lstFruitOrVegetablePortions,
      this.lstFluidOrWater,
      this.lstDoctorNames,
      this.lstLabNames,
      this.lstHeight,
      this.lstWeight,
      this.lstCity,
      this.lstDependentRelationship,
      this.lstModeofCommunication,
      this.lstPreferredReceipt,
      this.objListApproval,
      this.lstCountryCode,
      this.lstApprovalStatus,
      this.lstPolicyPaymentItems,
      this.quotePdfPath,
      this.financialNeedAnalysisPath,
      this.proposalFormPath,
      this.answer});

  SaveProposal.formJson(
      Map sectionSubsectionDetails,
      String username,
      String contactID,
      JsonObject jsonObject,
      String _memberID,
      String _memberLifeStyleID,
      dynamic fetchProposalInfo,
      List fieldDataDetails,
      List _mediaFiles,
      List _mediaData,
      String _webRefNumber,
      bool _isProceedToPayment) {
    final premiumObject = jsonDecode(jsonObject.premiumObject);
    final quotationObject = jsonDecode(jsonObject.quotationObject);
    final documentAndDeclartion = (sectionSubsectionDetails[1024][1]
                    as SectionSubSection)
                .fieldValue
                .length >
            0
        ? jsonDecode(
            (sectionSubsectionDetails[1024][1] as SectionSubSection).fieldValue)
        : "";
    final payingDetails = (documentAndDeclartion.length) > 0
        ? (documentAndDeclartion["1153"] as String).split("#")
        : [];
    final communicationMethod = (documentAndDeclartion.length) > 0
        ? (documentAndDeclartion["1154"] as String).split("#")
        : [];
    final documentUploadAndDeclaration = (documentAndDeclartion.length) > 0
        ? (documentAndDeclartion["1155"] as String).split("#")
        : [];
    final quotationPool =
        jsonDecode(jsonObject.quotationPool)["objMemberDetails"] as List;
    //final quotationDetails = quotationPool[0];
    final medicalTestRequirements = sectionSubsectionDetails[1025];
    final fetchProposalData =
        (fetchProposalInfo != null) ? jsonDecode(fetchProposalInfo) : null;
    lstIllustation = null;
    userName = username;
    userId = null;
    contactId = int.parse(contactID);
    lifeAssured = null;
    suspectPoolCountInfo = 0;
    suspectPoolCount = 0;
    prospectPoolCountInfo = 0;
    quotePoolCountInfo = 0;
    quotePoolCount = 0;
    proposalPoolCountInfo = 0;
    approvalPoolCountInfo = 0;
    prospectPoolCount = 0;
    confirmedProspectPoolCount = 0;
    needAnanlysisProspectCount = 0;
    proposalStatusCount = 0;
    proposalPendingCount = 0;
    proposalIncompleteCount = 0;
    suspectAllocationCount = 0;
    propspectAllocationCount = 0;
    quotationAllocationCount = 0;
    proposalAllocationCount = 0;
    proposalFailedCount = 0;
    lstCashLessRiderChildren = null;
    lstBenifitDetails = List<LstBenifitDetails>.from(
        returnLstBenifitDetails(sectionSubsectionDetails).map(
            (e) => LstBenifitDetails.formJson(e, sectionSubsectionDetails)));
    lstPackageDetails = [];
    lstPremiumDetails = List<LstPremiumDetails>.from(
        returnLstPremiumDetails(sectionSubsectionDetails).map(
            (e) => LstPremiumDetails.formJson(e, sectionSubsectionDetails)));
    lstMedicalReports = null;
    listAssured = null;
    annualPremium = premiumObject["AnnualPremium"];
    halfYearlyPremium = premiumObject["HalfYearlyPremium"];
    quaterlyPremium = premiumObject["QuaterlyPremium"];
    monthlyPremium = premiumObject["MonthlyPremium"].toString();
    singlePremium = premiumObject["SinglePremium"];
    totalPremium = premiumObject["TotalPremium"].round();
    cess = premiumObject["Cess"];
    vat = premiumObject["VAT"];
    policyFee = premiumObject["PolicyFee"];
    investmentPremium = null; //premiumObject["InvestmentPremium"];
    protectionPremium = null; //premiumObject["ProtectionPremium"];
    investmentTotalPremium = null; //premiumObject["InvestmentTotalPremium"];
    totalRiderPremium = null; //premiumObject["totalRiderPremium"];
    contributionAmtCess = 0.0; //premiumObject["ContributionAmtCess"].round();
    premiumCess = 0.0; //premiumObject["PremiumCess"].round();
    isForService = false;
    suminsured = null;
    premium = _returnPremium(int.parse(premiumObject["objProductDetials"]["PreferredMode"]),premiumObject);
    productBasicPremium = premiumObject["ProductBasicPremium"];
    quoteNo = quotationObject["QuoteNo"];
    policyNo = null;
    isLi4InsuranceCovered = true;
    li4InsurancePremiumAmount = null;
    proposalNo = null;
    planName = premiumObject["objProductDetials"]["Plan"];
    planCode = premiumObject["objProductDetials"]["PlanCode"];
    term = null;
    policyTerm = premiumObject["objProductDetials"]["PolicyTerm"];
    paymentTerm = premiumObject["objProductDetials"]["PolicyTerm"];
    loanAmount = null;
    interestRate = null;
    paymentFrequency = premiumObject["objProductDetials"]["PreferredMode"];
    paymentPaidBy =
        "267"; //(payingDetails.length > 0) ? payingDetails[1] : null;
    paymentMethod = (payingDetails.length > 0) ? payingDetails[0] : null;
    paymentReceiptPrefferdBy =
        (payingDetails.length > 0) ? payingDetails[3] : null;
    modeOfCommunication =
        (communicationMethod.length > 0) ? communicationMethod[1] : null;
    others = (payingDetails.length > 0) ? payingDetails[2] : null;
    answer = (documentUploadAndDeclaration.length > 0)
        ? ((documentUploadAndDeclaration[2] == "1") ? true : false)
        : false;
    totalPremiumPayble = null;
    totalAmountPaid = null;
    balancetobePaid = null;
    underWriterRemarks = null;
    isclIncluded = null;
    saType = null;
    coverType = null;
    scheme = null;
    preferredLanguage =
        (communicationMethod.length > 0) ? communicationMethod[0] : null;
    objProspectDetails =
        OBJProspectDetails.formJson(sectionSubsectionDetails, fieldDataDetails);
    objFillMemberDetials = ObjFillMemberDetials.formJson();
    isRegAsCommunication = true;
    message = null;
    status = null;
    uwMessage = null;
    listPlan = null;
    lstPolicyTerm = null;
    lstPremiumTerm = null;
    hdnDocumentDetails = returnHdnDocumentDetails(
        (sectionSubsectionDetails[1024][1] as SectionSubSection).fieldValue,
        contactID,
        _mediaFiles,
        _mediaData,
        _webRefNumber);
    assuredName = null;
    assuredIndex = 0;
    policyId = 0;
    procceedToPayment = (_isProceedToPayment) ? true : false;
    objPaymentInfo = null;
    isSpouseCovered = false;
    isViewProposal = false;
    objSuspectReAllocation = null;
    objMemberDetails = List<ObjMemberDetails>.from(returnMemberDetails(
      sectionSubsectionDetails,
    ).map((e) => ObjMemberDetails.formJson(
        e,
        sectionSubsectionDetails,
        quotationPool,
        _memberID,
        _memberLifeStyleID,
        fetchProposalData,
        fieldDataDetails)));
    objNomineeDetails = List<ObjNomineeDetails>.from(
        returnNomineeDetails(sectionSubsectionDetails, fetchProposalInfo)
            .map((e) => ObjNomineeDetails.formJson(e)));
    childHeight = null;
    childWeight = null;
    childHeightUnit = null;
    childWeightUnit = null;
    childSuffer = null;
    childUnderMedication = null;
    sufferDetails = null;
    noofJsPolicies = 0;
    areyouCoveredUnderOtherPolicies = false;
    noofOtherPolicies = 0;
    totalDeath = null;
    totalAccidental = null;
    totalCritical = null;
    totalHospitalization = null;
    totalHospitalizationReimbursement = null;
    isAllocationReq = false;
    objLifeAssuredOtherInsurance = null;
    policyStageId = null;
    policyStageStatusId = null;
    signature = null;
    byteArray = null;
    strHtml = null;
    prospectSignature = null;
    prospectSignaturePath = null;
    prospectByteArray = null;
    doctorName = (medicalTestRequirements[3] as SectionSubSection).fieldValue;
    labName = (medicalTestRequirements[5] as SectionSubSection).fieldValue;
    paymentMadeByForDoctor =
        ((medicalTestRequirements[4] as SectionSubSection).fieldValue.length >
                0)
            ? (medicalTestRequirements[4] as SectionSubSection).fieldValue
            : null;
    paymentMadeByForLab =
        ((medicalTestRequirements[6] as SectionSubSection).fieldValue.length >
                0)
            ? (medicalTestRequirements[6] as SectionSubSection).fieldValue
            : null;
    reportsTobeSendTo =
        ((medicalTestRequirements[7] as SectionSubSection).fieldValue.length >
                0)
            ? (medicalTestRequirements[7] as SectionSubSection).fieldValue
            : null;
    medicalTestExists = false;
    childId = null;
    questionAnswer = null;
    diseaseQuestionCount = 0;
    prospectSignPath = null;
    prospectImagePath = null;
    spouseSignPath = null;
    emailFrom = null;
    emailPassword = null;
    emailImageLogo = null;
    domain = null;
    smtpHost = null;
    port = 0;
    isUat = null;
    uatImage = null;
    category = null;
    referredBy = null;
    referralReason = null;
    decision = null;
    lstDecision = null;
    rejection = null;
    lstRejection = null;
    uwComments = null;
    isExlusions = false;
    exlusionsDetails = null;
    isLoading = false;
    loadingDetails = null;
    healthCheckupCategory = null;
    lstHealthCheckupCategory = null;
    underwriter = null;
    lstUnderwriter = null;
    objDocumentUploadedFiles = null;
    objDocumentUpload = [];
    maritalStatuslist = null;
    nationalities = null;
    lstGender = [];
    lstOccupation = [];
    lstLanguage = null;
    lstSalutation = null;
    lstDocumentType = null;
    lstRelations = null;
    lstNomineeRelations = null;
    lstPaymentfrequency = null;
    lstPaymentMethod = null;
    lstSateofHealth = null;
    lstCauseOfDeath = null;
    lstFamilyBackGroundRelationship = null;
    lstDiseaseFamilyBackGroundRelationship = null;
    lstGenitoDiseaseBackGroundRelationship = null;
    lstSmokeAndAlcholPer = null;
    lstSmokeTypes = null;
    lstAlcoholTypes = null;
    lstCurrentStatus = null;
    lstAerobicExercise = null;
    lstFruitOrVegetablePortions = null;
    lstFluidOrWater = null;
    lstDoctorNames = null;
    lstLabNames = null;
    lstHeight = null;
    lstWeight = null;
    lstCity = null;
    lstDependentRelationship = [];
    lstModeofCommunication = null;
    lstPreferredReceipt = null;
    objListApproval = null;
    lstCountryCode = null;
    lstApprovalStatus = null;
    lstPolicyPaymentItems = [];
    quotePdfPath = "\\\\uatavoapps\\JIDocuments\\" +
        "ContactID_" +
        contactID.toString() +
        "\\${quotationObject["QuoteNo"]}.pdf"; //_contactID;//quotationObject["QuoteNo"];
    financialNeedAnalysisPath = null;
    proposalFormPath = null;
  }

  Map toJson() => {
        "LstIllustation": lstIllustation,
        "UserName": userName,
        "UserID": userId,
        "ContactID": contactId,
        "LifeAssured": lifeAssured,
        "SuspectPoolCountInfo": suspectPoolCountInfo,
        "SuspectPoolCount": suspectPoolCount,
        "ProspectPoolCountInfo": prospectPoolCountInfo,
        "QuotePoolCountInfo": quotePoolCountInfo,
        "QuotePoolCount": quotePoolCount,
        "ProposalPoolCountInfo": proposalPoolCountInfo,
        "ApprovalPoolCountInfo": approvalPoolCountInfo,
        "ProspectPoolCount": prospectPoolCount,
        "ConfirmedProspectPoolCount": confirmedProspectPoolCount,
        "NeedAnanlysisProspectCount": needAnanlysisProspectCount,
        "ProposalStatusCount": proposalStatusCount,
        "ProposalPendingCount": proposalPendingCount,
        "ProposalIncompleteCount": proposalIncompleteCount,
        "SuspectAllocationCount": suspectAllocationCount,
        "PropspectAllocationCount": propspectAllocationCount,
        "QuotationAllocationCount": quotationAllocationCount,
        "ProposalAllocationCount": proposalAllocationCount,
        "ProposalFailedCount": proposalFailedCount,
        "LstCashLessRiderChildren": lstCashLessRiderChildren,
        "LstBenifitDetails":
            List<dynamic>.from(lstBenifitDetails.map((x) => x.toJson())),
        "LstPackageDetails": lstPackageDetails,
        "LstPremiumDetails":
            List<dynamic>.from(lstPremiumDetails.map((x) => x.toJson())),
        "LstMedicalReports": lstMedicalReports,
        "ListAssured": listAssured,
        "AnnualPremium": annualPremium,
        "HalfYearlyPremium": halfYearlyPremium,
        "QuaterlyPremium": quaterlyPremium,
        "MonthlyPremium": monthlyPremium,
        "SinglePremium": singlePremium,
        "TotalPremium": totalPremium,
        "Cess": cess,
        "VAT": vat,
        "PolicyFee": policyFee,
        "InvestmentPremium": investmentPremium,
        "ProtectionPremium": protectionPremium,
        "InvestmentTotalPremium": investmentTotalPremium,
        "totalRiderPremium": totalRiderPremium,
        "ContributionAmtCess": contributionAmtCess,
        "PremiumCess": premiumCess,
        "IsForService": isForService,
        "Suminsured": suminsured,
        "Premium": premium,
        "ProductBasicPremium": productBasicPremium,
        "QuoteNo": quoteNo,
        "PolicyNo": policyNo,
        "IsLI4InsuranceCovered": isLi4InsuranceCovered,
        "LI4InsurancePremiumAmount": li4InsurancePremiumAmount,
        "ProposalNo": proposalNo,
        "PlanName": planName,
        "PlanCode": planCode,
        "Term": term,
        "PolicyTerm": policyTerm,
        "PaymentTerm": paymentTerm,
        "LoanAmount": loanAmount,
        "InterestRate": interestRate,
        "PaymentFrequency": paymentFrequency,
        "PaymentPaidBy": paymentPaidBy,
        "PaymentMethod": paymentMethod,
        "PaymentReceiptPrefferdBy": paymentReceiptPrefferdBy,
        "ModeOfCommunication": modeOfCommunication,
        "others": others,
        "Answer": answer,
        "TotalPremiumPayble": totalPremiumPayble,
        "TotalAmountPaid": totalAmountPaid,
        "BalancetobePaid": balancetobePaid,
        "UnderWriterRemarks": underWriterRemarks,
        "IsclIncluded": isclIncluded,
        "saType": saType,
        "coverType": coverType,
        "scheme": scheme,
        "PreferredLanguage": preferredLanguage,
        "objProspectDetails": objProspectDetails.toJson(),
        "objFillMemberDetials": objFillMemberDetials.toJson(),
        "IsRegAsCommunication": isRegAsCommunication,
        "Message": message,
        "Status": status,
        "UWMessage": uwMessage,
        "ListPlan": listPlan,
        "LstPolicyTerm": lstPolicyTerm,
        "LstPremiumTerm": lstPremiumTerm,
        "HdnDocumentDetails": hdnDocumentDetails,
        "AssuredName": assuredName,
        "AssuredIndex": assuredIndex,
        "PolicyID": policyId,
        "ProcceedToPayment": procceedToPayment,
        "objPaymentInfo": objPaymentInfo,
        "IsSpouseCovered": isSpouseCovered,
        "IsViewProposal": isViewProposal,
        "objSuspectReAllocation": objSuspectReAllocation,
        "objMemberDetails":
            List<dynamic>.from(objMemberDetails.map((x) => x.toJson())),
        "objNomineeDetails":
            List<dynamic>.from(objNomineeDetails.map((e) => e.toJson())),
        "ChildHeight": childHeight,
        "ChildWeight": childWeight,
        "ChildHeightUnit": childHeightUnit,
        "ChildWeightUnit": childWeightUnit,
        "ChildSuffer": childSuffer,
        "ChildUnderMedication": childUnderMedication,
        "SufferDetails": sufferDetails,
        "NoofJsPolicies": noofJsPolicies,
        "AreyouCoveredUnderOtherPolicies": areyouCoveredUnderOtherPolicies,
        "NoofOtherPolicies": noofOtherPolicies,
        "TotalDeath": totalDeath,
        "TotalAccidental": totalAccidental,
        "TotalCritical": totalCritical,
        "TotalHospitalization": totalHospitalization,
        "TotalHospitalizationReimbursement": totalHospitalizationReimbursement,
        "IsAllocationReq": isAllocationReq,
        "objLifeAssuredOtherInsurance": objLifeAssuredOtherInsurance,
        "PolicyStageID": policyStageId,
        "PolicyStageStatusID": policyStageStatusId,
        "Signature": signature,
        "ByteArray": byteArray,
        "STRHtml": strHtml,
        "ProspectSignature": prospectSignature,
        "ProspectSignaturePath": prospectSignaturePath,
        "ProspectByteArray": prospectByteArray,
        "DoctorName": doctorName,
        "LabName": labName,
        "PaymentMadeByForDoctor": paymentMadeByForDoctor,
        "PaymentMadeByForLab": paymentMadeByForLab,
        "ReportsTobeSendTo": reportsTobeSendTo,
        "MedicalTestExists": medicalTestExists,
        "ChildID": childId,
        "QuestionAnswer": questionAnswer,
        "DiseaseQuestionCount": diseaseQuestionCount,
        "ProspectSignPath": prospectSignPath,
        "ProspectImagePath": prospectImagePath,
        "SpouseSignPath": spouseSignPath,
        "EmailFrom": emailFrom,
        "EmailPassword": emailPassword,
        "EmailImageLogo": emailImageLogo,
        "Domain": domain,
        "SmtpHost": smtpHost,
        "Port": port,
        "IsUAT": isUat,
        "UATImage": uatImage,
        "Category": category,
        "ReferredBy": referredBy,
        "ReferralReason": referralReason,
        "Decision": decision,
        "LstDecision": lstDecision,
        "Rejection": rejection,
        "LstRejection": lstRejection,
        "UWComments": uwComments,
        "IsExlusions": isExlusions,
        "ExlusionsDetails": exlusionsDetails,
        "IsLoading": isLoading,
        "LoadingDetails": loadingDetails,
        "HealthCheckupCategory": healthCheckupCategory,
        "LstHealthCheckupCategory": lstHealthCheckupCategory,
        "Underwriter": underwriter,
        "LstUnderwriter": lstUnderwriter,
        "objDocumentUploadedFiles": objDocumentUploadedFiles,
        "objDocumentUpload":
            List<dynamic>.from(objDocumentUpload.map((x) => x)),
        "MaritalStatuslist": maritalStatuslist,
        "Nationalities": nationalities,
        "lstGender": List<dynamic>.from(lstGender.map((x) => x)),
        "lstOccupation": List<dynamic>.from(lstOccupation.map((x) => x)),
        "lstLanguage": lstLanguage,
        "lstSalutation": lstSalutation,
        "lstDocumentType": lstDocumentType,
        "lstRelations": lstRelations,
        "lstNomineeRelations": lstNomineeRelations,
        "LstPaymentfrequency": lstPaymentfrequency,
        "LstPaymentMethod": lstPaymentMethod,
        "lstSateofHealth": lstSateofHealth,
        "lstCauseOfDeath": lstCauseOfDeath,
        "lstFamilyBackGroundRelationship": lstFamilyBackGroundRelationship,
        "lstDiseaseFamilyBackGroundRelationship":
            lstDiseaseFamilyBackGroundRelationship,
        "lstGenitoDiseaseBackGroundRelationship":
            lstGenitoDiseaseBackGroundRelationship,
        "lstSmokeAndAlcholPer": lstSmokeAndAlcholPer,
        "lstSmokeTypes": lstSmokeTypes,
        "lstAlcoholTypes": lstAlcoholTypes,
        "lstCurrentStatus": lstCurrentStatus,
        "lstAerobicExercise": lstAerobicExercise,
        "lstFruitOrVegetablePortions": lstFruitOrVegetablePortions,
        "lstFluidOrWater": lstFluidOrWater,
        "lstDoctorNames": lstDoctorNames,
        "lstLabNames": lstLabNames,
        "lstHeight": lstHeight,
        "lstWeight": lstWeight,
        "lstCity": lstCity,
        "lstDependentRelationship":
            List<dynamic>.from(lstDependentRelationship.map((x) => x)),
        "LstModeofCommunication": lstModeofCommunication,
        "LstPreferredReceipt": lstPreferredReceipt,
        "objListApproval": objListApproval,
        "LstCountryCode": lstCountryCode,
        "LstApprovalStatus": lstApprovalStatus,
        "lstPolicyPaymentItems":
            lstPolicyPaymentItems, //List<dynamic>.from(lstPolicyPaymentItems.map((x) => x)),
        "QuotePDFPath": quotePdfPath,
        "FinancialNeedAnalysisPath": financialNeedAnalysisPath,
        "ProposalFormPath": proposalFormPath,
      };
}

//Return premium 
String _returnPremium(int _selectedMode,Map _premiumObject){
  switch(_selectedMode){
    case 0:
    return  _premiumObject["SinglePremium"];
    case 1:
    return  _premiumObject["AnnualPremium"];
    case 2:
    return  _premiumObject["HalfYearlyPremium"];
    case 4:
    return  _premiumObject["QuaterlyPremium"];
     case 12:
    return  _premiumObject["MonthlyPremium"];
  }
  return _premiumObject["AnnualPremium"]; 
}

//MARK:- HdnDocumentDetails
List returnMediaDetails(
    List _details, List _mediaFiles, List _mediaData, String _webRefNumber) {
  List _list = List();
  var _index = 0;
  if (_details[0].length > 0) {
    final _tempList = json.decode(json.decode(_details[0]));
    for (final _item in _tempList) {
      final Map<String, dynamic> _mapDetails = {
        "data": _item,
        "itemType": returnItemType(0),
        "docType": _item["1"],
        "fileName": _item["0"],
        "docName": null,
        "path": returnPath(_item["2"], _mediaFiles, _mediaData, _webRefNumber),
      };
      _list.add(_mapDetails);
    }
  }
  for (final _item in _details) {
    if (_item.length > 0 && _item.contains(".png") && _index > 0) {
      final Map<String, dynamic> _mapDetails = {
        "itemType": returnItemType(_index),
        "docType": returnDocumentType(_index),
        "path": returnPath(_item, _mediaFiles, _mediaData, _webRefNumber),
        "fileName": returnItemType(_index),
        "docName": null,
      };
      if (_index >= 1 && _index <= 3) {
      } else {
        _list.add(_mapDetails);
      }
    }
    _index = _index + 1;
  }
  return _list;
}

String returnPath(
    String _pathName, List _mediaFiles, List _mediaData, String _webRefNumber) {
  print("");
  Map _mediaMap = _mediaFiles
      .where((element) =>
          element["filePath"].split(_webRefNumber)[1].split("/")[1] ==
          _pathName)
      .toList()[0];
  final _index = _mediaFiles.indexOf(_mediaMap);
  final _filePath = _mediaData[_index]["FileName"];
  return _filePath;
}

String returnDocumentType(int index) {
  switch (index) {
    case 0:
      return "PolicyDocuments";
      break;
    case 4:
      return "Proposer Photograph";
      break;
    case 5:
      return "Proposer Signature";
      break;
    case 6:
      return "Proposer Signature";
      break;
    case 8:
      return "Spouse Signature";
      break;
    case 9:
      return "Spouse Signature";
      break;
    default:
      return "PolicyDocuments";
      break;
  }
}

String returnItemType(int index) {
  switch (index) {
    case 0:
      return "PolicyDocuments";
      break;
    case 4:
      return "ProposerImage";
      break;
    case 5:
      return "Proposer Signature";
      break;
    case 6:
      return "Proposer Signature";
      break;
    case 8:
      return "SpouseSignature";
      break;
    case 9:
      return "SpouseSignature";
      break;
    default:
      return "PolicyDocuments";
      break;
  }
}

//ItemType
String returnHdnDocumentDetails(String _details, String _contactID,
    List _mediaFiles, List _mediaData, String _webRefNumber) {
  List _list = List();
  if (_details.length > 0) {
    final _decodeDetails = json.decode(_details);
    final _mediaDetails = _decodeDetails["1155"];
    if (_mediaDetails.length > 0) {
      final _mediaList = returnMediaDetails(
          _mediaDetails.split("#"), _mediaFiles, _mediaData, _webRefNumber);
      //   var _index = 0;
      var _mediaIndex = 0;
      //   bool isPolicyDocuments = false;
      //  for (final _item in _mediaList){
      //    List _mediaDetails = List();
      //     if (_index > 0 && _item != null){
      //         _mediaDetails.add(_item);
      //     }else if (_index == 0){
      //       if (_item is Map){
      //         if(json.decode(json.decode(_item["data"])) is List){
      //            _mediaDetails = json.decode(json.decode(_item["data"]));
      //            isPolicyDocuments = true;
      //         }else{
      //           _mediaDetails.add(_item);
      //         }
      //       }else{
      //          _mediaDetails = json.decode(json.decode(_item["data"]));
      //           isPolicyDocuments = true;
      //       }
      //     }
      for (final _item in _mediaList) {
        final Map<String, dynamic> details = {
          "DOCID": 0,
          "Index": _mediaIndex + 1,
          "DocName": _item["docName"],
          "DocumentType": _item["docType"],
          "FileName": _item["fileName"],
          "FilePath": _item["path"],
          "Key": null,
          "ItemType": _item["itemType"],
          "IsDocExists": "Y",
          "Extension": null
        };
        _list.add(details);
      }
      _mediaIndex = _mediaIndex + 1;
    }
  }
  return jsonEncode(_list);
}

//MARK:-
class ObjFillMemberDetials {
  int index;
  int contactId;
  dynamic memberId;
  int quoteMemberId;
  dynamic clientCode;
  dynamic relationShipWithPropspect;
  dynamic relationShipWithPropspectId;
  dynamic relationShipWithPropspectText;
  dynamic salutation;
  dynamic fullName;
  dynamic diseasesSelected;
  dynamic firstName;
  dynamic lastName;
  dynamic fatherFullName;
  dynamic motherFullName;
  dynamic middleName;
  dynamic weddingAnniversaryDate;
  dynamic otherMobileNo;
  dynamic hasNewNic;
  bool isClaimExists;
  dynamic nameWithInitial;
  dynamic prefferedName;
  dynamic dateOfBirth;
  dynamic age;
  int maturityAge;
  dynamic currentAge;
  dynamic gender;
  dynamic genderText;
  dynamic maritialStatus;
  dynamic oldnicNo;
  dynamic newNicno;
  dynamic occupationId;
  dynamic companyName;
  dynamic nameOfDuties;
  dynamic monthlyIncome;
  dynamic nationality;
  dynamic homeNumber;
  dynamic workNumber;
  dynamic mobileNo;
  String mobileCountryCode;
  String altMobileCountryCode;
  String homeCountryCode;
  String workCountryCode;
  dynamic email;
  dynamic height;
  dynamic weight;
  dynamic intBasicSumInsured;
  dynamic basicSumInsured;
  dynamic basicpremium;
  dynamic memberpremium;
  dynamic medicalTestSi;
  dynamic cashlessSi;
  bool isCommunicationAddressSameasProspect;
  ObjFillCommunicationAddress objCommunicationAddress;
  ObjFillPermenantAddress objPermenantAddress;
  bool isRegAsCommunication;
  List<dynamic> objBenifitDetails;
  dynamic objLstMedicalHistory;
  List<dynamic> objMedicalFamilyMemberDetails;
  dynamic objLstJuvenileHistory;
  List<dynamic> objLstDiseaseHistory;
  dynamic objDiseaseFamilyMemberGridDetails;
  dynamic objGenitoDiseaseGridDetails;
  dynamic objLstFamilyBackground;
  dynamic objLstLifeStyleQuestions;
  int noofJsPolicies;
  bool areyouCoveredUnderOtherPolicies;
  dynamic objClaimInfo;
  bool areyouClaimedAnyPolicies;
  int noofOtherPolicies;
  dynamic totalDeath;
  dynamic totalAccidental;
  dynamic totalCritical;
  dynamic totalHospitalization;
  dynamic totalHospitalizationReimbursement;
  dynamic objLifeAssuredOtherInsurance;
  List<dynamic> objMedicalTests;
  bool isSelfCovered;
  bool isSpouseCoverd;
  bool isSelfIsMainLife;
  int noofChilds;
  dynamic assuredName;
  dynamic isCashlessapplicable;
  dynamic isproposerlifeAssured;
  dynamic isSteadyWeight;
  dynamic steadyWeightDetails;
  bool isSameasProposerAddress;
  bool isSameasProposerAddressInfo;
  dynamic objLifeStyleQuetions;
  dynamic objAdditionalQuestions;
  dynamic lstAvgMonthlyIncome;
  ObjFillMemberDetials({
    this.index,
    this.contactId,
    this.memberId,
    this.quoteMemberId,
    this.clientCode,
    this.relationShipWithPropspect,
    this.relationShipWithPropspectId,
    this.relationShipWithPropspectText,
    this.salutation,
    this.fullName,
    this.diseasesSelected,
    this.firstName,
    this.lastName,
    this.fatherFullName,
    this.motherFullName,
    this.middleName,
    this.weddingAnniversaryDate,
    this.otherMobileNo,
    this.hasNewNic,
    this.isClaimExists,
    this.nameWithInitial,
    this.prefferedName,
    this.dateOfBirth,
    this.age,
    this.maturityAge,
    this.currentAge,
    this.gender,
    this.genderText,
    this.maritialStatus,
    this.oldnicNo,
    this.newNicno,
    this.occupationId,
    this.companyName,
    this.nameOfDuties,
    this.monthlyIncome,
    this.nationality,
    this.homeNumber,
    this.workNumber,
    this.mobileNo,
    this.mobileCountryCode,
    this.altMobileCountryCode,
    this.homeCountryCode,
    this.workCountryCode,
    this.email,
    this.height,
    this.weight,
    this.intBasicSumInsured,
    this.basicSumInsured,
    this.basicpremium,
    this.memberpremium,
    this.medicalTestSi,
    this.cashlessSi,
    this.isCommunicationAddressSameasProspect,
    this.objCommunicationAddress,
    this.objPermenantAddress,
    this.isRegAsCommunication,
    this.objBenifitDetails,
    this.objLstMedicalHistory,
    this.objMedicalFamilyMemberDetails,
    this.objLstJuvenileHistory,
    this.objLstDiseaseHistory,
    this.objDiseaseFamilyMemberGridDetails,
    this.objGenitoDiseaseGridDetails,
    this.objLstFamilyBackground,
    this.objLstLifeStyleQuestions,
    this.noofJsPolicies,
    this.areyouCoveredUnderOtherPolicies,
    this.objClaimInfo,
    this.areyouClaimedAnyPolicies,
    this.noofOtherPolicies,
    this.totalDeath,
    this.totalAccidental,
    this.totalCritical,
    this.totalHospitalization,
    this.totalHospitalizationReimbursement,
    this.objLifeAssuredOtherInsurance,
    this.objMedicalTests,
    this.isSelfCovered,
    this.isSpouseCoverd,
    this.isSelfIsMainLife,
    this.noofChilds,
    this.assuredName,
    this.isCashlessapplicable,
    this.isproposerlifeAssured,
    this.isSteadyWeight,
    this.steadyWeightDetails,
    this.isSameasProposerAddress,
    this.isSameasProposerAddressInfo,
    this.objLifeStyleQuetions,
    this.objAdditionalQuestions,
    this.lstAvgMonthlyIncome,
  });
  ObjFillMemberDetials.formJson() {
    index = 0;
    contactId = 0;
    memberId = 0.0;
    quoteMemberId = 0;
    clientCode = null;
    relationShipWithPropspect = null;
    relationShipWithPropspectId = null;
    relationShipWithPropspectText = null;
    salutation = null;
    fullName = null;
    diseasesSelected = null;
    firstName = null;
    lastName = null;
    fatherFullName = null;
    motherFullName = null;
    middleName = null;
    weddingAnniversaryDate = null;
    otherMobileNo = null;
    hasNewNic = null;
    isClaimExists = null;
    nameWithInitial = null;
    prefferedName = null;
    dateOfBirth = null;
    age = null;
    maturityAge = 0;
    currentAge = null;
    gender = null;
    genderText = null;
    maritialStatus = null;
    oldnicNo = null;
    newNicno = null;
    occupationId = null;
    companyName = null;
    nameOfDuties = null;
    monthlyIncome = null;
    nationality = null;
    homeNumber = null;
    workNumber = null;
    mobileNo = null;
    mobileCountryCode = "lk";
    altMobileCountryCode = "lk";
    homeCountryCode = "lk";
    workCountryCode = "lk";
    email = null;
    height = null;
    weight = null;
    intBasicSumInsured = null;
    basicSumInsured = null;
    basicpremium = null;
    memberpremium = null;
    medicalTestSi = null;
    cashlessSi = null;
    isCommunicationAddressSameasProspect = null;
    objCommunicationAddress = ObjFillCommunicationAddress.formJson();
    objPermenantAddress = ObjFillPermenantAddress.formJson();
    isRegAsCommunication = false;
    objBenifitDetails = [];
    objLstMedicalHistory = null;
    objMedicalFamilyMemberDetails = [];
    objLstJuvenileHistory = null;
    objLstDiseaseHistory = [];
    objDiseaseFamilyMemberGridDetails = null;
    objGenitoDiseaseGridDetails = null;
    objLstFamilyBackground = null;
    objLstLifeStyleQuestions = null;
    noofJsPolicies = null;
    areyouCoveredUnderOtherPolicies = null;
    objClaimInfo = null;
    areyouClaimedAnyPolicies = null;
    noofOtherPolicies = null;
    totalDeath = null;
    totalAccidental = null;
    totalCritical = null;
    totalHospitalization = null;
    totalHospitalizationReimbursement = null;
    objLifeAssuredOtherInsurance = null;
    objMedicalTests = [];
    isSelfCovered = false;
    isSpouseCoverd = false;
    isSelfIsMainLife = false;
    noofChilds = 0;
    assuredName = null;
    isCashlessapplicable = null;
    isproposerlifeAssured = null;
    isSteadyWeight = null;
    steadyWeightDetails = null;
    isSameasProposerAddress = false;
    isSameasProposerAddressInfo = false;
    objLifeStyleQuetions = null;
    objAdditionalQuestions = null;
    lstAvgMonthlyIncome = null;
  }

  Map toJson() => {
        "Index": index,
        "ContactID": contactId,
        "MemberID": memberId,
        "QuoteMemberID": quoteMemberId,
        "ClientCode": clientCode,
        "RelationShipWithPropspect": relationShipWithPropspect,
        "RelationShipWithPropspectID": relationShipWithPropspectId,
        "RelationShipWithPropspectText": relationShipWithPropspectText,
        "Salutation": salutation,
        "FullName": fullName,
        "DiseasesSelected": diseasesSelected,
        "FirstName": firstName,
        "LastName": lastName,
        "FatherFullName": fatherFullName,
        "MotherFullName": motherFullName,
        "MiddleName": middleName,
        "WeddingAnniversaryDate": weddingAnniversaryDate,
        "OtherMobileNo": otherMobileNo,
        "HasNewNIC": hasNewNic,
        "IsClaimExists": isClaimExists,
        "NameWithInitial": nameWithInitial,
        "PrefferedName": prefferedName,
        "DateOfBirth": dateOfBirth,
        "Age": age,
        "MaturityAge": maturityAge,
        "CurrentAge": currentAge,
        "Gender": gender,
        "GenderText": genderText,
        "MaritialStatus": maritialStatus,
        "OLDNICNo": oldnicNo,
        "NewNICNO": newNicno,
        "OccupationID": occupationId,
        "CompanyName": companyName,
        "NameOfDuties": nameOfDuties,
        "MonthlyIncome": monthlyIncome,
        "Nationality": nationality,
        "HomeNumber": homeNumber,
        "WorkNumber": workNumber,
        "MobileNo": mobileNo,
        "MobileCountryCode": mobileCountryCode,
        "AltMobileCountryCode": altMobileCountryCode,
        "HomeCountryCode": homeCountryCode,
        "WorkCountryCode": workCountryCode,
        "Email": email,
        "Height": height,
        "Weight": weight,
        "INTBasicSumInsured": intBasicSumInsured,
        "BasicSumInsured": basicSumInsured,
        "Basicpremium": basicpremium,
        "Memberpremium": memberpremium,
        "MedicalTestSI": medicalTestSi,
        "CashlessSI": cashlessSi,
        "IsCommunicationAddressSameasProspect":
            isCommunicationAddressSameasProspect,
        "objCommunicationAddress": objCommunicationAddress.toJson(),
        "objPermenantAddress": objPermenantAddress.toJson(),
        "IsRegAsCommunication": isRegAsCommunication,
        "objBenifitDetails": objBenifitDetails,
        "objLstMedicalHistory": objLstMedicalHistory,
        "ObjMedicalFamilyMemberDetails": objMedicalFamilyMemberDetails,
        "objLstJuvenileHistory": objLstJuvenileHistory,
        "objLstDiseaseHistory": objLstDiseaseHistory,
        "ObjDiseaseFamilyMemberGridDetails": objDiseaseFamilyMemberGridDetails,
        "ObjGenitoDiseaseGridDetails": objGenitoDiseaseGridDetails,
        "objLstFamilyBackground": objLstFamilyBackground,
        "objLstLifeStyleQuestions": objLstLifeStyleQuestions,
        "NoofJsPolicies": noofJsPolicies,
        "AreyouCoveredUnderOtherPolicies": areyouCoveredUnderOtherPolicies,
        "objClaimInfo": objClaimInfo,
        "AreyouClaimedAnyPolicies": areyouClaimedAnyPolicies,
        "NoofOtherPolicies": noofOtherPolicies,
        "TotalDeath": totalDeath,
        "TotalAccidental": totalAccidental,
        "TotalCritical": totalCritical,
        "TotalHospitalization": totalHospitalization,
        "TotalHospitalizationReimbursement": totalHospitalizationReimbursement,
        "objLifeAssuredOtherInsurance": objLifeAssuredOtherInsurance,
        "objMedicalTests": objMedicalTests,
        "IsSelfCovered": isSelfCovered,
        "IsSpouseCoverd": isSpouseCoverd,
        "IsSelfIsMainLife": isSelfIsMainLife,
        "NoofChilds": noofChilds,
        "AssuredName": assuredName,
        "isCashlessapplicable": isCashlessapplicable,
        "IsproposerlifeAssured": isproposerlifeAssured,
        "IsSteadyWeight": isSteadyWeight,
        "SteadyWeightDetails": steadyWeightDetails,
        "IsSameasProposerAddress": isSameasProposerAddress,
        "IsSameasProposerAddressInfo": isSameasProposerAddressInfo,
        "objLifeStyleQuetions": objLifeStyleQuetions,
        "objAdditionalQuestions": objAdditionalQuestions,
        "lstAvgMonthlyIncome": lstAvgMonthlyIncome,
      };
}

class ObjFillCommunicationAddress {
  int addressId;
  int addressTypeId;
  String address1;
  String address2;
  dynamic address3;
  dynamic pincodeId;
  String city;
  String district;
  String state;
  dynamic country;
  String pincode;
  dynamic pincodeNew;
  dynamic stateId;
  dynamic province;
  dynamic provinceCode;
  dynamic districtCode;
  dynamic cityCode;
  dynamic lstPincode;

  ObjFillCommunicationAddress({
    this.addressId,
    this.addressTypeId,
    this.address1,
    this.address2,
    this.address3,
    this.pincodeId,
    this.city,
    this.district,
    this.state,
    this.country,
    this.pincode,
    this.pincodeNew,
    this.stateId,
    this.province,
    this.provinceCode,
    this.districtCode,
    this.cityCode,
    this.lstPincode,
  });

  ObjFillCommunicationAddress.formJson() {
    addressId = 0;
    addressTypeId = 0;
    address1 = null;
    address2 = null;
    address3 = null;
    pincodeId = null;
    city = null;
    district = null;
    state = null;
    country = null;
    pincode = null;
    pincodeNew = null;
    stateId = null;
    province = null;
    provinceCode = null;
    districtCode = null;
    cityCode = null;
    lstPincode = null;
  }
  Map toJson() => {
        "AddressID": addressId,
        "AddressTypeId": addressTypeId,
        "Address1": address1,
        "Address2": address2,
        "Address3": address3,
        "PincodeID": pincodeId,
        "City": city,
        "District": district,
        "State": state,
        "Country": country,
        "Pincode": pincode,
        "PincodeNew": pincodeNew,
        "StateID": stateId,
        "Province": province,
        "ProvinceCode": provinceCode,
        "DistrictCode": districtCode,
        "CityCode": cityCode,
        "LstPincode": lstPincode,
      };
}

class ObjFillPermenantAddress {
  int addressId;
  int addressTypeId;
  String address1;
  String address2;
  dynamic address3;
  dynamic pincodeId;
  String city;
  String district;
  String state;
  dynamic country;
  String pincode;
  dynamic pincodeNew;
  dynamic stateId;
  dynamic province;
  dynamic provinceCode;
  dynamic districtCode;
  dynamic cityCode;
  dynamic lstPincode;

  ObjFillPermenantAddress({
    this.addressId,
    this.addressTypeId,
    this.address1,
    this.address2,
    this.address3,
    this.pincodeId,
    this.city,
    this.district,
    this.state,
    this.country,
    this.pincode,
    this.pincodeNew,
    this.stateId,
    this.province,
    this.provinceCode,
    this.districtCode,
    this.cityCode,
    this.lstPincode,
  });

  ObjFillPermenantAddress.formJson() {
    addressId = 0;
    addressTypeId = 0;
    address1 = null;
    address2 = null;
    address3 = null;
    pincodeId = null;
    city = null;
    district = null;
    state = null;
    country = null;
    pincode = null;
    pincodeNew = null;
    stateId = null;
    province = null;
    provinceCode = null;
    districtCode = null;
    cityCode = null;
    lstPincode = null;
  }
  Map toJson() => {
        "AddressID": addressId,
        "AddressTypeId": addressTypeId,
        "Address1": address1,
        "Address2": address2,
        "Address3": address3,
        "PincodeID": pincodeId,
        "City": city,
        "District": district,
        "State": state,
        "Country": country,
        "Pincode": pincode,
        "PincodeNew": pincodeNew,
        "StateID": stateId,
        "Province": province,
        "ProvinceCode": provinceCode,
        "DistrictCode": districtCode,
        "CityCode": cityCode,
        "LstPincode": lstPincode,
      };
}

//MARK: -LstBenifitDetails
returnLstPremiumDetails(Map _subSectionDetails) {
  //Rider Master
  List benifitDetails = [];
  final fieldValue =
      (_subSectionDetails[1022][3] as SectionSubSection).fieldValue;
  if (fieldValue.length > 0) {
    double total = 0.0;
    final decodeDetails = json.decode(fieldValue)["MainLife"];
    if (decodeDetails.length > 0) {
      for (final val in decodeDetails) {
        final Map<String, dynamic> details = {
          "BenfitCode": val["BenfitCode"],
          "benefitName": val["benefitName"],
          "benefitID": val["benefitID"],
          "SumAssured": val["SumAssured"],
        };
        final sumAssured = ((val["SumAssured"] as String).length > 0)
            ? (val["SumAssured"] as String)
            : "0";
        total = total + double.parse(sumAssured.replaceAll(",", ""));
        if (int.parse(sumAssured) > 0) {
          benifitDetails.add(details);
        }
      }
      //Total
      final Map<String, dynamic> details = {
        "BenfitCode": "Total",
        "benefitName": "Total",
        "benefitID": "-2",
        "SumAssured": total.round().toString(),
      };
      benifitDetails.add(details);
    }
    return benifitDetails;
  }
}

class LstPremiumDetails {
  int memberBenifitId;
  int benefitId;
  String riderImagePath;
  String benifitName;
  dynamic benifitCode;
  dynamic assuredMember;
  bool benifitOpted;
  dynamic riderSuminsured;
  bool benefitAvailability;
  dynamic isCashlessapplicable;
  List<ObjPreBenefitMemberRelationship> objBenefitMemberRelationship;
  dynamic riderCode;
  dynamic minSumInsured;
  dynamic maxSumInsured;
  dynamic riderPremium;
  int riderProductId;
  dynamic relationshipWithProspect;
  dynamic description;
  dynamic multiple;
  dynamic order;
  LstPremiumDetails({
    this.memberBenifitId,
    this.benefitId,
    this.riderImagePath,
    this.benifitName,
    this.benifitCode,
    this.assuredMember,
    this.benifitOpted,
    this.riderSuminsured,
    this.benefitAvailability,
    this.isCashlessapplicable,
    this.objBenefitMemberRelationship,
    this.riderCode,
    this.minSumInsured,
    this.maxSumInsured,
    this.riderPremium,
    this.riderProductId,
    this.relationshipWithProspect,
    this.description,
    this.multiple,
    this.order,
  });

  LstPremiumDetails.formJson(Map benifitDetails, Map _subSectionDetails) {
    final fieldValue =
        (_subSectionDetails[1022][3] as SectionSubSection).fieldValue;
    var decodeDetails = jsonDecode(fieldValue) as Map;
    final keys = decodeDetails.keys.toList();
    // keys.removeLast();
    List tempKey = List();
    for (final key in keys) {
      if ((decodeDetails[key] as List).length > 0) {
        tempKey.add(key);
      }
    }
    Map _totalMap = Map();
    for(final key in tempKey){
      final _details = decodeDetails[key] as List;
        double _total = 0.0;
        for(final item in _details){
          _total = _total + double.parse(item["SumAssured"].replaceAll(",",""));
        }
        _totalMap[key] = _total.toString();
    }

    memberBenifitId = 0;
    benefitId = int.parse(benifitDetails["benefitID"]);
    riderImagePath = null;
    benifitName = benifitDetails["benefitName"];
    benifitCode = null;
    assuredMember = null;
    benifitOpted = false;
    riderSuminsured = null;
    benefitAvailability = false;
    isCashlessapplicable = null;
    objBenefitMemberRelationship = List<ObjPreBenefitMemberRelationship>.from(
        tempKey.map((key) => ObjPreBenefitMemberRelationship.formJson(
            key, decodeDetails, benifitDetails, _subSectionDetails,_totalMap)));
    riderCode = null;
    minSumInsured = null;
    maxSumInsured = null;
    riderPremium = null;
    riderProductId = 0;
    relationshipWithProspect = null;
    description = null;
    multiple = null;
    order = null;
  }

  Map toJson() => {
        "MemberBenifitID": memberBenifitId,
        "BenefitID": benefitId,
        "RiderImagePath": riderImagePath,
        "BenifitName": benifitName,
        "BenifitCode": benifitCode,
        "AssuredMember": assuredMember,
        "BenifitOpted": benifitOpted,
        "RiderSuminsured": riderSuminsured,
        "BenefitAvailability": benefitAvailability,
        "isCashlessapplicable": isCashlessapplicable,
        "objBenefitMemberRelationship": List<dynamic>.from(
            objBenefitMemberRelationship.map((x) => x.toJson())),
        "RiderCode": riderCode,
        "MinSumInsured": minSumInsured,
        "MaxSumInsured": maxSumInsured,
        "RiderPremium": riderPremium,
        "RiderProductID": riderProductId,
        "RelationshipWithProspect": relationshipWithProspect,
        "Description": description,
        "Multiple": multiple,
        "Order": order,
      };
}

class ObjPreBenefitMemberRelationship {
  int policyMemberBenefitId;
  String riderSi;
  String memberRelationship;
  String riderPremium;
  String assuredName;
  bool riderAvailability;

  ObjPreBenefitMemberRelationship({
    this.policyMemberBenefitId,
    this.riderSi,
    this.memberRelationship,
    this.riderPremium,
    this.assuredName,
    this.riderAvailability,
  });

  ObjPreBenefitMemberRelationship.formJson(String key, Map decodeDetails,
      Map benfitDetails, Map _subSectionDetails,Map _totalMap) {
    final list = decodeDetails[key] as List;
    final _total = _totalMap[key];
    final riderSI = list
        .where(
            (element) => element["BenfitCode"] == benfitDetails["BenfitCode"])
        .toList();
    policyMemberBenefitId = 0;
    riderSi = null;
    memberRelationship =
        returnMemberRelationshipWithKey(key, _subSectionDetails);
    riderPremium = (riderSI.length > 0)
        ? riderSI[0]["SumAssured"]
        : ((benfitDetails["BenfitCode"] == "Total")
            ? _total
            : null);
    assuredName = key;
    riderAvailability = false;
  }
  Map toJson() => {
        "PolicyMemberBenefitID": policyMemberBenefitId,
        "RiderSI": riderSi,
        "Member_Relationship": memberRelationship,
        "Rider_Premium": riderPremium,
        "Assured_Name": assuredName,
        "RiderAvailability": riderAvailability,
      };
}

//MARK: -LstBenifitDetails
returnLstBenifitDetails(Map _subSectionDetails) {
  //Rider Master
  List benifitDetails = [];
  final fieldValue =
      (_subSectionDetails[1021][1] as SectionSubSection).fieldValue;
  if (fieldValue.length > 0) {
    double total = 0.0;
    double riderPremiumTotal = 0.0;
    final decodeDetails = json.decode(fieldValue)["MainLife"];
    if (decodeDetails.length > 0) {
      for (final val in decodeDetails) {
        final Map<String, dynamic> details = {
          "riderPremium": val["riderPremium"],
          "BenfitCode": val["BenfitCode"],
          "benefitName": val["benefitName"],
          "benefitID": val["benefitID"],
          "SumAssured": val["SumAssured"],
        };
        final sumAssured = ((val["SumAssured"] as String).length > 0)
            ? (val["SumAssured"] as String)
            : "0";
        final riderPremiumSumAssured =
            ((val["riderPremium"] as String).length > 0)
                ? (val["riderPremium"] as String)
                : "0";
        total = total + double.parse(sumAssured.replaceAll(",", ""));
        riderPremiumTotal = riderPremiumTotal +
            double.parse(riderPremiumSumAssured.replaceAll(",", ""));
        if (int.parse(sumAssured.replaceAll(",", "")) > 0) {
          benifitDetails.add(details);
        }
      }
      //Total
      final Map<String, dynamic> details = {
        "BenfitCode": "Total",
        "benefitName": "Total",
        "benefitID": "-2",
        "SumAssured": total.round().toString(),
        "riderPremium": riderPremiumTotal.round().toString(),
      };
      benifitDetails.add(details);
    }
    return benifitDetails;
  }
}

class LstBenifitDetails {
  int memberBenifitId;
  int benefitId;
  String riderImagePath;
  String benifitName;
  dynamic benifitCode;
  dynamic assuredMember;
  bool benifitOpted;
  dynamic riderSuminsured;
  bool benefitAvailability;
  dynamic isCashlessapplicable;
  List<ObjBenefitMemberRelationship> objBenefitMemberRelationship;
  dynamic riderCode;
  dynamic minSumInsured;
  dynamic maxSumInsured;
  dynamic riderPremium;
  int riderProductId;
  dynamic relationshipWithProspect;
  dynamic description;
  dynamic multiple;
  dynamic order;
  LstBenifitDetails({
    this.memberBenifitId,
    this.benefitId,
    this.riderImagePath,
    this.benifitName,
    this.benifitCode,
    this.assuredMember,
    this.benifitOpted,
    this.riderSuminsured,
    this.benefitAvailability,
    this.isCashlessapplicable,
    this.objBenefitMemberRelationship,
    this.riderCode,
    this.minSumInsured,
    this.maxSumInsured,
    this.riderPremium,
    this.riderProductId,
    this.relationshipWithProspect,
    this.description,
    this.multiple,
    this.order,
  });

  LstBenifitDetails.formJson(Map benifitDetails, Map _subSectionDetails) {
    final fieldValue =
        (_subSectionDetails[1021][1] as SectionSubSection).fieldValue;
    var decodeDetails = jsonDecode(fieldValue) as Map;
    final keys = decodeDetails.keys.toList();
    List tempKey = List();
    for (final key in keys) {
      if ((decodeDetails[key] as List).length > 0) {
        tempKey.add(key);
      }
    }
     Map _totalMap = Map();
    for(final key in tempKey){
      final _details = decodeDetails[key] as List;
        double _total = 0.0;
        for(final item in _details){
          _total = _total + double.parse(item["SumAssured"].replaceAll(",",""));
        }
        _totalMap[key] = _total.toString();
    }

    memberBenifitId = 0;
    benefitId = int.parse(benifitDetails["benefitID"]);
    riderImagePath = null; //"~/Content/Images/Base Sum Assured.png";
    benifitName = benifitDetails["benefitName"];
    benifitCode = null;
    assuredMember = null;
    benifitOpted = false;
    riderSuminsured = null;
    benefitAvailability = false;
    isCashlessapplicable = null;
    objBenefitMemberRelationship = List<ObjBenefitMemberRelationship>.from(
        tempKey.map((key) => ObjBenefitMemberRelationship.formJson(
            key, decodeDetails, benifitDetails, _subSectionDetails,_totalMap)));
    riderCode = null;
    minSumInsured = null;
    maxSumInsured = null;
    riderPremium = null;
    riderProductId = 0;
    relationshipWithProspect = null;
    description = null;
    multiple = null;
    order = null;
  }

  Map toJson() => {
        "MemberBenifitID": memberBenifitId,
        "BenefitID": benefitId,
        "RiderImagePath": riderImagePath,
        "BenifitName": benifitName,
        "BenifitCode": benifitCode,
        "AssuredMember": assuredMember,
        "BenifitOpted": benifitOpted,
        "RiderSuminsured": riderSuminsured,
        "BenefitAvailability": benefitAvailability,
        "isCashlessapplicable": isCashlessapplicable,
        "objBenefitMemberRelationship": List<dynamic>.from(
            objBenefitMemberRelationship.map((x) => x.toJson())),
        "RiderCode": riderCode,
        "MinSumInsured": minSumInsured,
        "MaxSumInsured": maxSumInsured,
        "RiderPremium": riderPremium,
        "RiderProductID": riderProductId,
        "RelationshipWithProspect": relationshipWithProspect,
        "Description": description,
        "Multiple": multiple,
        "Order": order,
      };
}

String returnMemberRelationshipWithKey(String key, Map _subSectionDetails) {
  switch (key) {
    case "MainLife":
      return "267";
      break;
    case "Spouse":
      return "268";
      break;
    default:
      //Checking other Membder ID's
      var fieldValueList = (_subSectionDetails[1019][1] as SectionSubSection)
          .fieldValue
          .split(",");
      var relationShipIDs = (_subSectionDetails[1019][2] as SectionSubSection)
          .fieldValue
          .split(",");
      fieldValueList.removeAt(0);
      if (fieldValueList.length > 0) {
        final index = fieldValueList.indexOf((key));
        if (index != null && index >= 0) {
          final memberID = (relationShipIDs is List)
              ? relationShipIDs[index]
              : relationShipIDs;
          return memberID;
        } else {
          return key;
        }
      }
      return "267";
  }
}

class ObjBenefitMemberRelationship {
  int policyMemberBenefitId;
  String riderSi;
  String memberRelationship;
  String riderPremium;
  String assuredName;
  bool riderAvailability;

  ObjBenefitMemberRelationship({
    this.policyMemberBenefitId,
    this.riderSi,
    this.memberRelationship,
    this.riderPremium,
    this.assuredName,
    this.riderAvailability,
  });

  ObjBenefitMemberRelationship.formJson(String key, Map decodeDetails,
      Map benfitDetails, Map _subSectionDetails,Map _totalMap) {
    final list = decodeDetails[key] as List;
    final _total = _totalMap[key];
    final riderSI = list
        .where(
            (element) => element["BenfitCode"] == benfitDetails["BenfitCode"])
        .toList();
    policyMemberBenefitId = 0;
    riderSi = (riderSI.length > 0)
        ? riderSI[0]["SumAssured"]
        : ((benfitDetails["BenfitCode"] == "Total")
            ? _total
            : null);
    memberRelationship =
        returnMemberRelationshipWithKey(key, _subSectionDetails);
    riderPremium = (riderSI.length > 0)
        ? riderSI[0]["riderPremium"]
        : ((benfitDetails["BenfitCode"] == "Total")
            ? _total
            : null);
    assuredName = key;
    riderAvailability = false;
  }
  Map toJson() => {
        "PolicyMemberBenefitID": policyMemberBenefitId,
        "RiderSI": riderSi,
        "Member_Relationship": memberRelationship,
        "Rider_Premium": riderPremium,
        "Assured_Name": assuredName,
        "RiderAvailability": riderAvailability,
      };
}

class OBJProspectDetails {
  int index;
  int contactId;
  int memberId;
  int quoteMemberId;
  dynamic clientCode;
  dynamic relationShipWithPropspect;
  dynamic relationShipWithPropspectId;
  dynamic relationShipWithPropspectText;
  String salutation;
  dynamic fullName;
  dynamic diseasesSelected;
  String firstName;
  String lastName;
  dynamic fatherFullName;
  dynamic motherFullName;
  dynamic middleName;
  dynamic weddingAnniversaryDate;
  dynamic otherMobileNo;
  bool hasNewNic;
  bool isClaimExists;
  String nameWithInitial;
  dynamic prefferedName;
  DateTime dateOfBirth;
  int age;
  int maturityAge;
  dynamic currentAge;
  String gender;
  dynamic genderText;
  String maritialStatus;
  dynamic oldnicNo;
  String newNicno;
  int occupationId;
  dynamic companyName;
  dynamic nameOfDuties;
  String monthlyIncome;
  dynamic nationality;
  String homeNumber;
  String workNumber;
  String mobileNo;
  String mobileCountryCode;
  String altMobileCountryCode;
  String homeCountryCode;
  String workCountryCode;
  String email;
  dynamic height;
  dynamic weight;
  dynamic intBasicSumInsured;
  dynamic basicSumInsured;
  dynamic basicpremium;
  dynamic memberpremium;
  dynamic medicalTestSi;
  dynamic cashlessSi;
  bool isCommunicationAddressSameasProspect;
  ObjCommunicationAddress objCommunicationAddress;
  ObjPermenantAddress objPermenantAddress;
  bool isRegAsCommunication;
  List<dynamic> objBenifitDetails;
  dynamic objLstMedicalHistory;
  List<dynamic> objMedicalFamilyMemberDetails;
  dynamic objLstJuvenileHistory;
  List<dynamic> objLstDiseaseHistory;
  dynamic objDiseaseFamilyMemberGridDetails;
  dynamic objGenitoDiseaseGridDetails;
  dynamic objLstFamilyBackground;
  dynamic objLstLifeStyleQuestions;
  int noofJsPolicies;
  bool areyouCoveredUnderOtherPolicies;
  dynamic objClaimInfo;
  bool areyouClaimedAnyPolicies;
  int noofOtherPolicies;
  dynamic totalDeath;
  dynamic totalAccidental;
  dynamic totalCritical;
  dynamic totalHospitalization;
  dynamic totalHospitalizationReimbursement;
  dynamic objLifeAssuredOtherInsurance;
  List<dynamic> objMedicalTests;
  bool isSelfCovered;
  bool isSpouseCoverd;
  bool isSelfIsMainLife;
  int noofChilds;
  dynamic assuredName;
  dynamic isCashlessapplicable;
  bool isproposerlifeAssured;
  dynamic isSteadyWeight;
  dynamic steadyWeightDetails;
  bool isSameasProposerAddress;
  bool isSameasProposerAddressInfo;
  dynamic objLifeStyleQuetions;
  dynamic objAdditionalQuestions;
  dynamic lstAvgMonthlyIncome;
  OBJProspectDetails({
    this.index,
    this.contactId,
    this.memberId,
    this.quoteMemberId,
    this.clientCode,
    this.relationShipWithPropspect,
    this.relationShipWithPropspectId,
    this.relationShipWithPropspectText,
    this.salutation,
    this.fullName,
    this.diseasesSelected,
    this.firstName,
    this.lastName,
    this.fatherFullName,
    this.motherFullName,
    this.middleName,
    this.weddingAnniversaryDate,
    this.otherMobileNo,
    this.hasNewNic,
    this.isClaimExists,
    this.nameWithInitial,
    this.prefferedName,
    this.dateOfBirth,
    this.age,
    this.maturityAge,
    this.currentAge,
    this.gender,
    this.genderText,
    this.maritialStatus,
    this.oldnicNo,
    this.newNicno,
    this.occupationId,
    this.companyName,
    this.nameOfDuties,
    this.monthlyIncome,
    this.nationality,
    this.homeNumber,
    this.workNumber,
    this.mobileNo,
    this.mobileCountryCode,
    this.altMobileCountryCode,
    this.homeCountryCode,
    this.workCountryCode,
    this.email,
    this.height,
    this.weight,
    this.intBasicSumInsured,
    this.basicSumInsured,
    this.basicpremium,
    this.memberpremium,
    this.medicalTestSi,
    this.cashlessSi,
    this.isCommunicationAddressSameasProspect,
    this.objCommunicationAddress,
    this.objPermenantAddress,
    this.isRegAsCommunication,
    this.objBenifitDetails,
    this.objLstMedicalHistory,
    this.objMedicalFamilyMemberDetails,
    this.objLstJuvenileHistory,
    this.objLstDiseaseHistory,
    this.objDiseaseFamilyMemberGridDetails,
    this.objGenitoDiseaseGridDetails,
    this.objLstFamilyBackground,
    this.objLstLifeStyleQuestions,
    this.noofJsPolicies,
    this.areyouCoveredUnderOtherPolicies,
    this.objClaimInfo,
    this.areyouClaimedAnyPolicies,
    this.noofOtherPolicies,
    this.totalDeath,
    this.totalAccidental,
    this.totalCritical,
    this.totalHospitalization,
    this.totalHospitalizationReimbursement,
    this.objLifeAssuredOtherInsurance,
    this.objMedicalTests,
    this.isSelfCovered,
    this.isSpouseCoverd,
    this.isSelfIsMainLife,
    this.noofChilds,
    this.assuredName,
    this.isCashlessapplicable,
    this.isproposerlifeAssured,
    this.isSteadyWeight,
    this.steadyWeightDetails,
    this.isSameasProposerAddress,
    this.isSameasProposerAddressInfo,
    this.objLifeStyleQuetions,
    this.objAdditionalQuestions,
    this.lstAvgMonthlyIncome,
  });
  OBJProspectDetails.formJson(
      Map sectionSubsectionDetails, List fieldDataDetails) {
    final prospectDetails = sectionSubsectionDetails[1018];
    index = 0;
    contactId = 0;
    memberId = 0;
    quoteMemberId = 0;
    clientCode = null;
    relationShipWithPropspect = null;
    relationShipWithPropspectId = null;
    relationShipWithPropspectText = null;
    salutation = (prospectDetails[1] as SectionSubSection).fieldValue;
    fullName = null;
    diseasesSelected = null;
    firstName = (prospectDetails[2] as SectionSubSection).fieldValue;
    lastName = (prospectDetails[4] as SectionSubSection).fieldValue;
    fatherFullName = null;
    motherFullName = null;
    middleName = (prospectDetails[3] as SectionSubSection).fieldValue;
    weddingAnniversaryDate = null;
    otherMobileNo =
        ((prospectDetails[19] as SectionSubSection).fieldValue.length > 0)
            ? ((prospectDetails[19] as SectionSubSection)
                .fieldValue
                .split("@")[1])
            : null;
    hasNewNic = true;
    isClaimExists = false;
    nameWithInitial = (prospectDetails[5] as SectionSubSection).fieldValue;
    prefferedName = null;
    dateOfBirth =
        DateTime.parse((prospectDetails[6] as SectionSubSection).fieldValue);
    age = int.parse((prospectDetails[7] as SectionSubSection).fieldValue);
    maturityAge = 0;
    currentAge = null;
    gender = (prospectDetails[8] as SectionSubSection).fieldValue;
    genderText = null;
    maritialStatus = (prospectDetails[9] as SectionSubSection).fieldValue;
    oldnicNo =
        ((prospectDetails[10] as SectionSubSection).fieldValue.length > 0)
            ? (prospectDetails[10] as SectionSubSection).fieldValue
            : null;
    newNicno = (prospectDetails[11] as SectionSubSection).fieldValue;
    occupationId =
        int.parse((prospectDetails[12] as SectionSubSection).fieldValue);
    companyName = (prospectDetails[13] as SectionSubSection).fieldValue;
    nameOfDuties = (prospectDetails[14] as SectionSubSection).fieldValue;
    final monthlyIncomeValue = fieldDataDetails
        .where((element) =>
            element.fieldDataID ==
            (prospectDetails[15] as SectionSubSection).fieldValue)
        .toList();
    monthlyIncome = (monthlyIncomeValue.length > 0)
        ? monthlyIncomeValue[0].fieldValue
        : null; //(prospectDetails[15] as SectionSubSection).fieldValue;
    nationality = (prospectDetails[16] as SectionSubSection).fieldValue;
    homeNumber = ((prospectDetails[20] as SectionSubSection).fieldValue.length >
            0)
        ? ((prospectDetails[20] as SectionSubSection).fieldValue.split("@")[1])
        : null;
    workNumber = ((prospectDetails[21] as SectionSubSection).fieldValue.length >
            0)
        ? ((prospectDetails[21] as SectionSubSection).fieldValue.split("@")[1])
        : null;
    mobileNo = ((prospectDetails[18] as SectionSubSection).fieldValue.length >
            0)
        ? ((prospectDetails[18] as SectionSubSection).fieldValue.split("@")[1])
        : null;
    mobileCountryCode =
        ((prospectDetails[18] as SectionSubSection).fieldValue.length > 0)
            ? ((prospectDetails[18] as SectionSubSection)
                    .fieldValue
                    .split("@")[2])
                .toLowerCase()
            : null;
    altMobileCountryCode =
        ((prospectDetails[19] as SectionSubSection).fieldValue.length > 0)
            ? ((prospectDetails[19] as SectionSubSection)
                    .fieldValue
                    .split("@")[2])
                .toLowerCase()
            : null;
    homeCountryCode =
        ((prospectDetails[20] as SectionSubSection).fieldValue.length > 0)
            ? ((prospectDetails[20] as SectionSubSection)
                    .fieldValue
                    .split("@")[2])
                .toLowerCase()
            : null;
    workCountryCode =
        ((prospectDetails[21] as SectionSubSection).fieldValue.length > 0)
            ? ((prospectDetails[21] as SectionSubSection)
                    .fieldValue
                    .split("@")[2])
                .toLowerCase()
            : null;
    email = (prospectDetails[22] as SectionSubSection).fieldValue;
    height = null;
    weight = null;
    intBasicSumInsured = null;
    basicSumInsured = null;
    basicpremium = null;
    memberpremium = null;
    medicalTestSi = null;
    cashlessSi = null;
    isCommunicationAddressSameasProspect = false;
    objCommunicationAddress = ObjCommunicationAddress.formJson(
        sectionSubsectionDetails, 0, fieldDataDetails);
    objPermenantAddress = ObjPermenantAddress.formJson(
        sectionSubsectionDetails, 0, fieldDataDetails);
    isRegAsCommunication =
        (prospectDetails[31] as SectionSubSection).fieldValue == "1"
            ? true
            : false;
    objBenifitDetails =
        []; //List<dynamic>.from(json["objBenifitDetails"].map((x) => x)),
    objLstMedicalHistory = null;
    objMedicalFamilyMemberDetails =
        []; //List<dynamic>.from(json["ObjMedicalFamilyMemberDetails"].map((x) => x)),
    objLstJuvenileHistory = null;
    objLstDiseaseHistory =
        []; //List<dynamic>.from(json["objLstDiseaseHistory"].map((x) => x)),
    objDiseaseFamilyMemberGridDetails = null;
    objGenitoDiseaseGridDetails = null;
    objLstFamilyBackground = null;
    objLstLifeStyleQuestions = null;
    noofJsPolicies = 0;
    areyouCoveredUnderOtherPolicies = false;
    objClaimInfo = null;
    areyouClaimedAnyPolicies = false;
    noofOtherPolicies = 0;
    totalDeath = null;
    totalAccidental = null;
    totalCritical = null;
    totalHospitalization = null;
    totalHospitalizationReimbursement = null;
    objLifeAssuredOtherInsurance = null;
    objMedicalTests =
        []; //List<dynamic>.from(jsonObjMedicalFamilyMemberDetails["objMedicalTests"].map((x) => x)),
    isSelfCovered = false;
    isSpouseCoverd = false;
    isSelfIsMainLife = false;
    noofChilds = 0;
    assuredName = null;
    isCashlessapplicable = null;
    isproposerlifeAssured = true;
    steadyWeightDetails = null;
    isSameasProposerAddress = false;
    isSameasProposerAddressInfo = false;
    objLifeStyleQuetions = null;
    objAdditionalQuestions = null;
    lstAvgMonthlyIncome = null;
  }

  Map toJson() => {
        "Index": index,
        "ContactID": contactId,
        "MemberID": memberId,
        "QuoteMemberID": quoteMemberId,
        "ClientCode": clientCode,
        "RelationShipWithPropspect": relationShipWithPropspect,
        "RelationShipWithPropspectID": relationShipWithPropspectId,
        "RelationShipWithPropspectText": relationShipWithPropspectText,
        "Salutation": salutation,
        "FullName": fullName,
        "DiseasesSelected": diseasesSelected,
        "FirstName": firstName,
        "LastName": lastName,
        "FatherFullName": fatherFullName,
        "MotherFullName": motherFullName,
        "MiddleName": middleName,
        "WeddingAnniversaryDate": weddingAnniversaryDate,
        "OtherMobileNo": otherMobileNo,
        "HasNewNIC": hasNewNic,
        "IsClaimExists": isClaimExists,
        "NameWithInitial": nameWithInitial,
        "PrefferedName": prefferedName,
        "DateOfBirth": dateOfBirth.toIso8601String(),
        "Age": age,
        "MaturityAge": maturityAge,
        "CurrentAge": currentAge,
        "Gender": gender,
        "GenderText": genderText,
        "MaritialStatus": maritialStatus,
        "OLDNICNo": oldnicNo,
        "NewNICNO": newNicno,
        "OccupationID": occupationId,
        "CompanyName": companyName,
        "NameOfDuties": nameOfDuties,
        "MonthlyIncome": monthlyIncome,
        "Nationality": nationality,
        "HomeNumber": homeNumber,
        "WorkNumber": workNumber,
        "MobileNo": mobileNo,
        "MobileCountryCode": mobileCountryCode,
        "AltMobileCountryCode": altMobileCountryCode,
        "HomeCountryCode": homeCountryCode,
        "WorkCountryCode": workCountryCode,
        "Email": email,
        "Height": height,
        "Weight": weight,
        "INTBasicSumInsured": intBasicSumInsured,
        "BasicSumInsured": basicSumInsured,
        "Basicpremium": basicpremium,
        "Memberpremium": memberpremium,
        "MedicalTestSI": medicalTestSi,
        "CashlessSI": cashlessSi,
        "IsCommunicationAddressSameasProspect":
            isCommunicationAddressSameasProspect,
        "objCommunicationAddress": objCommunicationAddress.toJson(),
        "objPermenantAddress": objPermenantAddress.toJson(),
        "IsRegAsCommunication": isRegAsCommunication,
        "objBenifitDetails":
            objBenifitDetails, //List<dynamic>.from(objBenifitDetails.map((x) => x)),
        "objLstMedicalHistory": objLstMedicalHistory,
        "ObjMedicalFamilyMemberDetails":
            List<dynamic>.from(objMedicalFamilyMemberDetails.map((x) => x)),
        "objLstJuvenileHistory": objLstJuvenileHistory,
        "objLstDiseaseHistory":
            List<dynamic>.from(objLstDiseaseHistory.map((x) => x)),
        "ObjDiseaseFamilyMemberGridDetails": objDiseaseFamilyMemberGridDetails,
        "ObjGenitoDiseaseGridDetails": objGenitoDiseaseGridDetails,
        "objLstFamilyBackground": objLstFamilyBackground,
        "objLstLifeStyleQuestions": objLstLifeStyleQuestions,
        "NoofJsPolicies": noofJsPolicies,
        "AreyouCoveredUnderOtherPolicies": areyouCoveredUnderOtherPolicies,
        "objClaimInfo": objClaimInfo,
        "AreyouClaimedAnyPolicies": areyouClaimedAnyPolicies,
        "NoofOtherPolicies": noofOtherPolicies,
        "TotalDeath": totalDeath,
        "TotalAccidental": totalAccidental,
        "TotalCritical": totalCritical,
        "TotalHospitalization": totalHospitalization,
        "TotalHospitalizationReimbursement": totalHospitalizationReimbursement,
        "objLifeAssuredOtherInsurance": objLifeAssuredOtherInsurance,
        "objMedicalTests": List<dynamic>.from(objMedicalTests.map((x) => x)),
        "IsSelfCovered": isSelfCovered,
        "IsSpouseCoverd": isSpouseCoverd,
        "IsSelfIsMainLife": isSelfIsMainLife,
        "NoofChilds": noofChilds,
        "AssuredName": assuredName,
        "isCashlessapplicable": isCashlessapplicable,
        "IsproposerlifeAssured": isproposerlifeAssured,
        "IsSteadyWeight": isSteadyWeight,
        "SteadyWeightDetails": steadyWeightDetails,
        "IsSameasProposerAddress": isSameasProposerAddress,
        "IsSameasProposerAddressInfo": isSameasProposerAddressInfo,
        "objLifeStyleQuetions": objLifeStyleQuetions,
        "objAdditionalQuestions": objAdditionalQuestions,
        "lstAvgMonthlyIncome": lstAvgMonthlyIncome,
      };
}

class ObjCommunicationAddress {
  int addressId;
  int addressTypeId;
  String address1;
  String address2;
  dynamic address3;
  dynamic pincodeId;
  String city;
  String district;
  String state;
  dynamic country;
  String pincode;
  dynamic pincodeNew;
  dynamic stateId;
  dynamic province;
  dynamic provinceCode;
  dynamic districtCode;
  dynamic cityCode;
  dynamic lstPincode;

  ObjCommunicationAddress({
    this.addressId,
    this.addressTypeId,
    this.address1,
    this.address2,
    this.address3,
    this.pincodeId,
    this.city,
    this.district,
    this.state,
    this.country,
    this.pincode,
    this.pincodeNew,
    this.stateId,
    this.province,
    this.provinceCode,
    this.districtCode,
    this.cityCode,
    this.lstPincode,
  });

  ObjCommunicationAddress.formJson(
      Map sectionSubsectionDetails, int index, List fieldDataDetails) {
    final prospectDetails = sectionSubsectionDetails[1018];
    addressId = 0;
    addressTypeId = 0;
    address1 = (index == 0)
        ? (prospectDetails[24] as SectionSubSection).fieldValue
        : ((((sectionSubsectionDetails[1019][28] as SectionSubSection)
                        .fieldValue)
                    .split(",")[index - 1]
                    .length >
                0)
            ? ((sectionSubsectionDetails[1019][28] as SectionSubSection)
                    .fieldValue)
                .split(",")[index - 1]
            : null);
    address2 = (index == 0)
        ? (prospectDetails[25] as SectionSubSection).fieldValue
        : ((((sectionSubsectionDetails[1019][29] as SectionSubSection)
                        .fieldValue)
                    .split(",")[index - 1]
                    .length >
                0)
            ? ((sectionSubsectionDetails[1019][29] as SectionSubSection)
                    .fieldValue)
                .split(",")[index - 1]
            : null);
    address3 = null;
    pincodeId = null;
    // final cityValue = fieldDataDetails.where((element) => element.fieldDataID == ((index == 0) ? (prospectDetails[28] as SectionSubSection).fieldValue : ((sectionSubsectionDetails[1019][32] as SectionSubSection).fieldValue).split(",")[index -1])).toList();
    city = (index == 0)
        ? (prospectDetails[28] as SectionSubSection).fieldValue
        : ((sectionSubsectionDetails[1019][32] as SectionSubSection).fieldValue)
            .split(",")[index - 1];
    district = (index == 0)
        ? (prospectDetails[27] as SectionSubSection).fieldValue
        : ((((sectionSubsectionDetails[1019][31] as SectionSubSection)
                        .fieldValue)
                    .split(",")[index - 1]
                    .length >
                0)
            ? ((sectionSubsectionDetails[1019][31] as SectionSubSection)
                    .fieldValue)
                .split(",")[index - 1]
            : null);
    state = (index == 0)
        ? (prospectDetails[26] as SectionSubSection).fieldValue
        : ((((sectionSubsectionDetails[1019][30] as SectionSubSection)
                        .fieldValue)
                    .split(",")[index - 1]
                    .length >
                0)
            ? ((sectionSubsectionDetails[1019][30] as SectionSubSection)
                    .fieldValue)
                .split(",")[index - 1]
            : null);
    country = null;
    pincode = (index == 0)
        ? (prospectDetails[29] as SectionSubSection).fieldValue
        : ((((sectionSubsectionDetails[1019][33] as SectionSubSection)
                        .fieldValue)
                    .split(",")[index - 1]
                    .length >
                0)
            ? ((sectionSubsectionDetails[1019][33] as SectionSubSection)
                    .fieldValue)
                .split(",")[index - 1]
            : null);
    pincodeNew = null;
    stateId = null;
    province = null;
    provinceCode = null;
    districtCode = null;
    cityCode = null;
    lstPincode = null;
  }
  Map toJson() => {
        "AddressID": addressId,
        "AddressTypeId": addressTypeId,
        "Address1": address1,
        "Address2": address2,
        "Address3": address3,
        "PincodeID": pincodeId,
        "City": city,
        "District": district,
        "State": state,
        "Country": country,
        "Pincode": pincode,
        "PincodeNew": pincodeNew,
        "StateID": stateId,
        "Province": province,
        "ProvinceCode": provinceCode,
        "DistrictCode": districtCode,
        "CityCode": cityCode,
        "LstPincode": lstPincode,
      };
}

class ObjPermenantAddress {
  int addressId;
  int addressTypeId;
  String address1;
  String address2;
  dynamic address3;
  dynamic pincodeId;
  String city;
  String district;
  String state;
  dynamic country;
  String pincode;
  dynamic pincodeNew;
  dynamic stateId;
  dynamic province;
  dynamic provinceCode;
  dynamic districtCode;
  dynamic cityCode;
  dynamic lstPincode;

  ObjPermenantAddress({
    this.addressId,
    this.addressTypeId,
    this.address1,
    this.address2,
    this.address3,
    this.pincodeId,
    this.city,
    this.district,
    this.state,
    this.country,
    this.pincode,
    this.pincodeNew,
    this.stateId,
    this.province,
    this.provinceCode,
    this.districtCode,
    this.cityCode,
    this.lstPincode,
  });

  ObjPermenantAddress.formJson(
      Map sectionSubsectionDetails, int index, List fieldDataDetails) {
    final prospectDetails = sectionSubsectionDetails[1018];
    addressId = 0;
    addressTypeId = 0;
    address1 = (index == 0)
        ? (prospectDetails[32] as SectionSubSection).fieldValue
        : ((((sectionSubsectionDetails[1019][36] as SectionSubSection)
                        .fieldValue)
                    .split(",")[index - 1]
                    .length >
                0)
            ? ((sectionSubsectionDetails[1019][36] as SectionSubSection)
                    .fieldValue)
                .split(",")[index - 1]
            : null);
    address2 = (index == 0)
        ? (prospectDetails[33] as SectionSubSection).fieldValue
        : ((((sectionSubsectionDetails[1019][37] as SectionSubSection)
                        .fieldValue)
                    .split(",")[index - 1]
                    .length >
                0)
            ? ((sectionSubsectionDetails[1019][37] as SectionSubSection)
                    .fieldValue)
                .split(",")[index - 1]
            : null);
    address3 = null;
    pincodeId = null;
    // final cityValue = fieldDataDetails.where((element) => element.fieldDataID == ((index == 0) ? (prospectDetails[36] as SectionSubSection).fieldValue : ((sectionSubsectionDetails[1019][40] as SectionSubSection).fieldValue).split(",")[index -1])).toList();
    city = (index == 0)
        ? (prospectDetails[36] as SectionSubSection).fieldValue
        : ((((sectionSubsectionDetails[1019][40] as SectionSubSection)
                        .fieldValue)
                    .split(",")[index - 1]
                    .length >
                0)
            ? ((sectionSubsectionDetails[1019][40] as SectionSubSection)
                    .fieldValue)
                .split(",")[index - 1]
            : null);
    district = (index == 0)
        ? (prospectDetails[35] as SectionSubSection).fieldValue
        : ((((sectionSubsectionDetails[1019][39] as SectionSubSection)
                        .fieldValue)
                    .split(",")[index - 1]
                    .length >
                0)
            ? ((sectionSubsectionDetails[1019][39] as SectionSubSection)
                    .fieldValue)
                .split(",")[index - 1]
            : null);
    state = (index == 0)
        ? (prospectDetails[34] as SectionSubSection).fieldValue
        : ((((sectionSubsectionDetails[1019][38] as SectionSubSection)
                        .fieldValue)
                    .split(",")[index - 1]
                    .length >
                0)
            ? ((sectionSubsectionDetails[1019][38] as SectionSubSection)
                    .fieldValue)
                .split(",")[index - 1]
            : null);
    country = null;
    pincode = (index == 0)
        ? (prospectDetails[37] as SectionSubSection).fieldValue
        : ((((sectionSubsectionDetails[1019][41] as SectionSubSection)
                        .fieldValue)
                    .split(",")[index - 1]
                    .length >
                0)
            ? ((sectionSubsectionDetails[1019][41] as SectionSubSection)
                    .fieldValue)
                .split(",")[index - 1]
            : null);
    pincodeNew = null;
    stateId = null;
    province = null;
    provinceCode = null;
    districtCode = null;
    cityCode = null;
    lstPincode = null;
  }
  Map toJson() => {
        "AddressID": addressId,
        "AddressTypeId": addressTypeId,
        "Address1": address1,
        "Address2": address2,
        "Address3": address3,
        "PincodeID": pincodeId,
        "City": city,
        "District": district,
        "State": state,
        "Country": country,
        "Pincode": pincode,
        "PincodeNew": pincodeNew,
        "StateID": stateId,
        "Province": province,
        "ProvinceCode": provinceCode,
        "DistrictCode": districtCode,
        "CityCode": cityCode,
        "LstPincode": lstPincode,
      };
}

//MARK:
returnNomineeDetails(Map _subSectionDetails, dynamic fetchProposalInfo) {
  List childDetails = [];
  final fieldValue =
      (_subSectionDetails[1023][3] as SectionSubSection).fieldValue;
  final fetchProposalData =
      (fetchProposalInfo != null) ? jsonDecode(fetchProposalInfo) : null;
  if (fieldValue.length > 0) {
    final decodeDetails = json.decode(fieldValue);
    if (decodeDetails.length > 0) {
      var index = 0;
      for (final val in decodeDetails) {
        final objNomineeDetails = (fetchProposalData != null)
            ? fetchProposalData["objNomineeDetails"] as List
            : null;
        final Map<String, dynamic> details = {
          "nomineeName": val["0"],
          "nomineeNICNo": val["1"],
          "NomineeNicNoDOB": val["3"],
          "nomineeRelationship": val["2"],
          "nomineePercentage": (val["4"].length > 0) ? val["4"] : "0",
          "nomineeDetailsId": (objNomineeDetails != null &&
                  objNomineeDetails.length > 0 &&
                  index <= objNomineeDetails.length)
              ? (objNomineeDetails[index]["NomineeDetailsId"])
              : null
        };
        childDetails.add(details);
      }
    }
  }
  return childDetails;
}

class ObjNomineeDetails {
  String nomineeName;
  String nomineeNICNo;
  DateTime nomineeNicNoDOB;
  String nomineeRelationship;
  String nomineePercentage;
  int index;
  double nomineeDetailsId;

  ObjNomineeDetails(
      {this.nomineeName,
      this.nomineeNICNo,
      this.nomineeNicNoDOB,
      this.nomineeRelationship,
      this.nomineePercentage,
      this.index,
      this.nomineeDetailsId});

  ObjNomineeDetails.formJson(Map nomineDetails) {
    nomineeName = nomineDetails["nomineeName"];
    nomineeNICNo = nomineDetails["nomineeNICNo"];
    nomineeNicNoDOB = DateTime.parse(nomineDetails["NomineeNicNoDOB"]);
    nomineeRelationship = nomineDetails["nomineeRelationship"];
    nomineePercentage =
        int.parse(nomineDetails["nomineePercentage"]).toString();
    //index = 0;
    nomineeDetailsId = nomineDetails["nomineeDetailsId"];
  }
  Map toJson() => {
        "NomineeName": nomineeName,
        "NomineeNICNo": nomineeNICNo,
        "NomineeNicNoDOB": nomineeNicNoDOB.toIso8601String(),
        "NomineeRelationship": nomineeRelationship,
        "NomineePercentage": nomineePercentage,
        //"Index" : index,
        //"NomineeDetailsId" : nomineeDetailsId
      };
}

//Return memebr details
List returnMemberDetails(Map _sectionSubsectionDetails) {
  List memberDetails = [];
  final sectionSubSectionDetails =
      _sectionSubsectionDetails[1020][1] as SectionSubSection;
  final tempArray = sectionSubSectionDetails.fieldValue.split(",");
  tempArray.removeAt(0);
  var index = 0;
  for (final item in tempArray) {
    final Map<String, dynamic> details = {"object": item, "index": index};
    index = index + 1;
    memberDetails.add(details);
  }
  return memberDetails;
}

//OBJMember details
class ObjMemberDetails {
  int index;
  int contactId;
  dynamic memberId;
  int quoteMemberId;
  dynamic clientCode;
  String relationShipWithPropspect;
  String relationShipWithPropspectId;
  dynamic relationShipWithPropspectText;
  String salutation;
  dynamic fullName;
  dynamic diseasesSelected;
  String firstName;
  String lastName;
  dynamic fatherFullName;
  dynamic motherFullName;
  dynamic middleName;
  DateTime weddingAnniversaryDate;
  dynamic otherMobileNo;
  bool hasNewNic;
  bool isClaimExists;
  String nameWithInitial;
  dynamic prefferedName;
  DateTime dateOfBirth;
  int age;
  int maturityAge;
  dynamic currentAge;
  String gender;
  dynamic genderText;
  String maritialStatus;
  dynamic oldnicNo;
  String newNicno;
  int occupationId;
  dynamic companyName;
  dynamic nameOfDuties;
  String monthlyIncome;
  dynamic nationality;
  String homeNumber;
  String workNumber;
  String mobileNo;
  dynamic mobileCountryCode;
  dynamic altMobileCountryCode;
  dynamic homeCountryCode;
  dynamic workCountryCode;
  String email;
  dynamic height;
  dynamic weight;
  dynamic intBasicSumInsured;
  String basicSumInsured;
  String basicpremium;
  String memberpremium;
  dynamic medicalTestSi;
  dynamic cashlessSi;
  bool isCommunicationAddressSameasProspect;
  ObjCommunicationAddress objCommunicationAddress;
  ObjPermenantAddress objPermenantAddress;
  bool isRegAsCommunication;
  List<dynamic> objBenifitDetails;
  List<ObjLstMedicalHistory> objLstMedicalHistory;
  List<dynamic> objMedicalFamilyMemberDetails;
  dynamic objLstJuvenileHistory;
  List<dynamic> objLstDiseaseHistory;
  dynamic objDiseaseFamilyMemberGridDetails;
  dynamic objGenitoDiseaseGridDetails;
  List<ObjLstFamilyBackground> objLstFamilyBackground;
  dynamic objLstLifeStyleQuestions;
  int noofJsPolicies;
  bool areyouCoveredUnderOtherPolicies;
  List<ObjClaimInfo> objClaimInfo;
  bool areyouClaimedAnyPolicies;
  int noofOtherPolicies;
  dynamic totalDeath;
  dynamic totalAccidental;
  dynamic totalCritical;
  dynamic totalHospitalization;
  dynamic totalHospitalizationReimbursement;
  List<ObjLifeAssuredOtherInsurance> objLifeAssuredOtherInsurance;
  List<dynamic> objMedicalTests;
  bool isSelfCovered;
  bool isSpouseCoverd;
  bool isSelfIsMainLife;
  int noofChilds;
  String assuredName;
  dynamic isCashlessapplicable;
  dynamic isproposerlifeAssured;
  dynamic isSteadyWeight;
  dynamic steadyWeightDetails;
  bool isSameasProposerAddress;
  bool isSameasProposerAddressInfo;
  ObjLifeStyleQuetions objLifeStyleQuetions;
  List<ObjAdditionalQuestion> objAdditionalQuestions;
  dynamic lstAvgMonthlyIncome;

  ObjMemberDetails(
      {this.index,
      this.contactId,
      this.memberId,
      this.quoteMemberId,
      this.clientCode,
      this.relationShipWithPropspect,
      this.relationShipWithPropspectId,
      this.relationShipWithPropspectText,
      this.salutation,
      this.fullName,
      this.diseasesSelected,
      this.firstName,
      this.lastName,
      this.fatherFullName,
      this.motherFullName,
      this.middleName,
      this.weddingAnniversaryDate,
      this.otherMobileNo,
      this.hasNewNic,
      this.isClaimExists,
      this.nameWithInitial,
      this.prefferedName,
      this.dateOfBirth,
      this.age,
      this.maturityAge,
      this.currentAge,
      this.gender,
      this.genderText,
      this.maritialStatus,
      this.oldnicNo,
      this.newNicno,
      this.occupationId,
      this.companyName,
      this.nameOfDuties,
      this.monthlyIncome,
      this.nationality,
      this.homeNumber,
      this.workNumber,
      this.mobileNo,
      this.mobileCountryCode,
      this.altMobileCountryCode,
      this.homeCountryCode,
      this.workCountryCode,
      this.email,
      this.height,
      this.weight,
      this.intBasicSumInsured,
      this.basicSumInsured,
      this.basicpremium,
      this.memberpremium,
      this.medicalTestSi,
      this.cashlessSi,
      this.isCommunicationAddressSameasProspect,
      this.objCommunicationAddress,
      this.objPermenantAddress,
      this.isRegAsCommunication,
      this.objBenifitDetails,
      this.objLstMedicalHistory,
      this.objMedicalFamilyMemberDetails,
      this.objLstJuvenileHistory,
      this.objLstDiseaseHistory,
      this.objDiseaseFamilyMemberGridDetails,
      this.objGenitoDiseaseGridDetails,
      this.objLstFamilyBackground,
      this.objLstLifeStyleQuestions,
      this.noofJsPolicies,
      this.areyouCoveredUnderOtherPolicies,
      this.objClaimInfo,
      this.areyouClaimedAnyPolicies,
      this.noofOtherPolicies,
      this.totalDeath,
      this.totalAccidental,
      this.totalCritical,
      this.totalHospitalization,
      this.totalHospitalizationReimbursement,
      this.objLifeAssuredOtherInsurance,
      this.objMedicalTests,
      this.isSelfCovered,
      this.isSpouseCoverd,
      this.isSelfIsMainLife,
      this.noofChilds,
      this.assuredName,
      this.isCashlessapplicable,
      this.isproposerlifeAssured,
      this.isSteadyWeight,
      this.steadyWeightDetails,
      this.isSameasProposerAddress,
      this.isSameasProposerAddressInfo,
      this.objLifeStyleQuetions,
      this.objAdditionalQuestions,
      this.lstAvgMonthlyIncome});

  ObjMemberDetails.formJson(
      Map objDetails,
      Map _sectionSubSectionDetails,
      List quotationDetails,
      String _memberID,
      String _memberLifeStyleID,
      dynamic fetchProposalData,
      List fieldDataDetails) {
    final tempIndex = objDetails["index"];
    final coverageDetails = jsonDecode(
        (_sectionSubSectionDetails[1021][1] as SectionSubSection).fieldValue);
    final premiumDetails = jsonDecode(
        (_sectionSubSectionDetails[1022][3] as SectionSubSection).fieldValue);
    final tempQuotationDetails =
        (_sectionSubSectionDetails[1020][2] as SectionSubSection).fieldValue;
    final _questionDetails = (tempQuotationDetails.split("@").length > 0)
        ? tempQuotationDetails.split("@")[tempIndex]
        : tempQuotationDetails;
    final decodeQuotationDetails =
        (_questionDetails.length > 0) ? jsonDecode(_questionDetails) : null;
    final preCurrentInsuranceDetails = (decodeQuotationDetails != null)
        ? decodeQuotationDetails["1179"].split("#")
        : [];
    final _preCurrentInsuranceList = (preCurrentInsuranceDetails.length > 0 &&
            preCurrentInsuranceDetails[2].length > 0)
        ? jsonDecode(preCurrentInsuranceDetails[2])
        : [];
    index = 0;
    contactId = 0;
    memberId = (fetchProposalData != null)
        ? (fetchProposalData["objMemberDetails"][tempIndex] as Map)["MemberID"]
        : 0;
    quoteMemberId = quotationDetails[tempIndex]["QuoteMemberID"];
    clientCode = null;
    relationShipWithPropspect = (tempIndex == 0)
        ? "267"
        : returnMemberRelationshipWithKey(
            ((_sectionSubSectionDetails[1019][2] as SectionSubSection)
                    .fieldValue)
                .split(",")[tempIndex - 1],
            _sectionSubSectionDetails);
    relationShipWithPropspectId = (tempIndex == 0)
        ? "267"
        : returnMemberRelationshipWithKey(
            ((_sectionSubSectionDetails[1019][2] as SectionSubSection)
                    .fieldValue)
                .split(",")[tempIndex - 1],
            _sectionSubSectionDetails);
    relationShipWithPropspectText = null;
    salutation = (tempIndex == 0)
        ? (_sectionSubSectionDetails[1018][1] as SectionSubSection).fieldValue
        : ((_sectionSubSectionDetails[1019][3] as SectionSubSection).fieldValue)
            .split(",")[tempIndex - 1];
    fullName = null;
    diseasesSelected = null;
    firstName = (tempIndex == 0)
        ? (_sectionSubSectionDetails[1018][2] as SectionSubSection).fieldValue
        : ((((_sectionSubSectionDetails[1019][4] as SectionSubSection)
                        .fieldValue)
                    .split(",")[tempIndex - 1]
                    .length >
                0)
            ? ((_sectionSubSectionDetails[1019][4] as SectionSubSection)
                    .fieldValue)
                .split(",")[tempIndex - 1]
            : null);
    lastName = (tempIndex == 0)
        ? (_sectionSubSectionDetails[1018][4] as SectionSubSection).fieldValue
        : ((((_sectionSubSectionDetails[1019][6] as SectionSubSection)
                        .fieldValue)
                    .split(",")[tempIndex - 1]
                    .length >
                0)
            ? ((_sectionSubSectionDetails[1019][6] as SectionSubSection)
                    .fieldValue)
                .split(",")[tempIndex - 1]
            : null);
    fatherFullName = null;
    motherFullName = null;
    middleName = (tempIndex == 0)
        ? (_sectionSubSectionDetails[1018][3] as SectionSubSection).fieldValue
        : ((((_sectionSubSectionDetails[1019][5] as SectionSubSection)
                        .fieldValue)
                    .split(",")[tempIndex - 1]
                    .length >
                0)
            ? ((_sectionSubSectionDetails[1019][5] as SectionSubSection)
                    .fieldValue)
                .split(",")[tempIndex - 1]
            : null);
    weddingAnniversaryDate = (tempIndex == 0)
        ? null
        : ((((_sectionSubSectionDetails[1019][19] as SectionSubSection)
                        .fieldValue)
                    .split(",")[tempIndex - 1]
                    .length >
                0)
            ? DateTime.parse(
                ((_sectionSubSectionDetails[1019][19] as SectionSubSection)
                        .fieldValue)
                    .split(",")[tempIndex - 1])
            : null);
    var tempOtherMobileNo = "";
    if (tempIndex == 0) {
      tempOtherMobileNo =
          ((_sectionSubSectionDetails[1018][19] as SectionSubSection)
                      .fieldValue
                      .length >
                  0)
              ? ((_sectionSubSectionDetails[1018][19] as SectionSubSection)
                  .fieldValue
                  .split("@")[1])
              : null;
    } else {
      tempOtherMobileNo =
          (((_sectionSubSectionDetails[1019][22] as SectionSubSection)
                          .fieldValue)
                      .split(",")[tempIndex - 1]
                      .length >
                  0)
              ? ((((_sectionSubSectionDetails[1019][22] as SectionSubSection)
                      .fieldValue)
                  .split(",")[tempIndex - 1]
                  .split("@")[1]))
              : null;
    }
    otherMobileNo = tempOtherMobileNo;
    hasNewNic = true;
    isClaimExists = false;
    nameWithInitial = (tempIndex == 0)
        ? (_sectionSubSectionDetails[1018][5] as SectionSubSection).fieldValue
        : ((((_sectionSubSectionDetails[1019][7] as SectionSubSection)
                        .fieldValue)
                    .split(",")[tempIndex - 1]
                    .length >
                0)
            ? ((_sectionSubSectionDetails[1019][7] as SectionSubSection)
                    .fieldValue)
                .split(",")[tempIndex - 1]
            : null);
    prefferedName = null;
    dateOfBirth = DateTime.parse((tempIndex == 0)
        ? (_sectionSubSectionDetails[1018][6] as SectionSubSection).fieldValue
        : ((_sectionSubSectionDetails[1019][8] as SectionSubSection).fieldValue)
            .split(",")[tempIndex - 1]);
    age = int.parse((tempIndex == 0)
        ? (_sectionSubSectionDetails[1018][7] as SectionSubSection).fieldValue
        : ((_sectionSubSectionDetails[1019][9] as SectionSubSection).fieldValue)
            .split(",")[tempIndex - 1]);
    maturityAge = 0;
    currentAge = null;
    gender = (tempIndex == 0)
        ? (_sectionSubSectionDetails[1018][8] as SectionSubSection).fieldValue
        : ((((_sectionSubSectionDetails[1019][10] as SectionSubSection)
                        .fieldValue)
                    .split(",")[tempIndex - 1]
                    .length >
                0)
            ? (((_sectionSubSectionDetails[1019][10] as SectionSubSection)
                    .fieldValue)
                .split(",")[tempIndex - 1])
            : null);
    genderText = null;
    maritialStatus = (tempIndex == 0)
        ? (_sectionSubSectionDetails[1018][9] as SectionSubSection).fieldValue
        : ((((_sectionSubSectionDetails[1019][11] as SectionSubSection)
                        .fieldValue)
                    .split(",")[tempIndex - 1]
                    .length >
                0)
            ? ((_sectionSubSectionDetails[1019][11] as SectionSubSection)
                    .fieldValue)
                .split(",")[tempIndex - 1]
            : null);
    oldnicNo = (tempIndex == 0)
        ? (_sectionSubSectionDetails[1018][10] as SectionSubSection).fieldValue
        : ((((_sectionSubSectionDetails[1019][13] as SectionSubSection)
                        .fieldValue)
                    .split(",")[tempIndex - 1]
                    .length >
                0)
            ? ((_sectionSubSectionDetails[1019][13] as SectionSubSection)
                    .fieldValue)
                .split(",")[tempIndex - 1]
            : null);
    newNicno = (tempIndex == 0)
        ? (_sectionSubSectionDetails[1018][11] as SectionSubSection).fieldValue
        : ((((_sectionSubSectionDetails[1019][14] as SectionSubSection)
                        .fieldValue)
                    .split(",")[tempIndex - 1]
                    .length >
                0)
            ? ((_sectionSubSectionDetails[1019][14] as SectionSubSection)
                    .fieldValue)
                .split(",")[tempIndex - 1]
            : null);
    occupationId = (tempIndex == 0)
        ? int.parse((_sectionSubSectionDetails[1018][12] as SectionSubSection)
            .fieldValue)
        : ((((_sectionSubSectionDetails[1019][15] as SectionSubSection)
                        .fieldValue)
                    .split(",")[tempIndex - 1]
                    .length >
                0)
            ? int.parse(
                ((_sectionSubSectionDetails[1019][15] as SectionSubSection)
                        .fieldValue)
                    .split(",")[tempIndex - 1])
            : null);
    companyName = (tempIndex == 0)
        ? (_sectionSubSectionDetails[1018][13] as SectionSubSection).fieldValue
        : ((((_sectionSubSectionDetails[1019][16] as SectionSubSection)
                        .fieldValue)
                    .split(",")[tempIndex - 1]
                    .length >
                0)
            ? ((_sectionSubSectionDetails[1019][16] as SectionSubSection)
                    .fieldValue)
                .split(",")[tempIndex - 1]
            : null);
    nameOfDuties = (tempIndex == 0)
        ? (_sectionSubSectionDetails[1018][14] as SectionSubSection).fieldValue
        : (((_sectionSubSectionDetails[1019][17] as SectionSubSection)
                        .fieldValue)
                    .split(",")[tempIndex - 1]
                    .length >
                0)
            ? ((_sectionSubSectionDetails[1019][17] as SectionSubSection)
                    .fieldValue)
                .split(",")[tempIndex - 1]
            : null;
    monthlyIncome = (tempIndex == 0)
        ? (_sectionSubSectionDetails[1018][15] as SectionSubSection).fieldValue
        : ((((_sectionSubSectionDetails[1019][18] as SectionSubSection)
                        .fieldValue)
                    .split(",")[tempIndex - 1]
                    .length >
                0)
            ? ((_sectionSubSectionDetails[1019][18] as SectionSubSection)
                    .fieldValue)
                .split(",")[tempIndex - 1]
            : null);
    nationality = (tempIndex == 0)
        ? (_sectionSubSectionDetails[1018][16] as SectionSubSection).fieldValue
        : ((((_sectionSubSectionDetails[1019][12] as SectionSubSection)
                        .fieldValue)
                    .split(",")[tempIndex - 1]
                    .length >
                0)
            ? ((_sectionSubSectionDetails[1019][12] as SectionSubSection)
                    .fieldValue)
                .split(",")[tempIndex - 1]
            : null);
    //((prospectDetails[20] as SectionSubSection).fieldValue.length > 0) ? ((prospectDetails[20] as SectionSubSection).fieldValue.split(",")[1])  : null;
    var tempHomeNumber = "";
    if (tempIndex == 0) {
      tempHomeNumber =
          ((_sectionSubSectionDetails[1018][20] as SectionSubSection)
                      .fieldValue
                      .length >
                  0)
              ? ((_sectionSubSectionDetails[1018][20] as SectionSubSection)
                  .fieldValue
                  .split("@")[1])
              : null;
    } else {
      tempHomeNumber =
          (((_sectionSubSectionDetails[1019][23] as SectionSubSection)
                          .fieldValue)
                      .split(",")[tempIndex - 1]
                      .length >
                  0)
              ? ((((_sectionSubSectionDetails[1019][23] as SectionSubSection)
                      .fieldValue)
                  .split(",")[tempIndex - 1]
                  .split("@")[1]))
              : null;
    }
    homeNumber = tempHomeNumber;
    var tempWorkNumber = "";
    if (tempIndex == 0) {
      tempWorkNumber =
          ((_sectionSubSectionDetails[1018][21] as SectionSubSection)
                      .fieldValue
                      .length >
                  0)
              ? ((_sectionSubSectionDetails[1018][21] as SectionSubSection)
                  .fieldValue
                  .split("@")[1])
              : null;
    } else {
      tempWorkNumber =
          (((_sectionSubSectionDetails[1019][24] as SectionSubSection)
                          .fieldValue)
                      .split(",")[tempIndex - 1]
                      .length >
                  0)
              ? ((((_sectionSubSectionDetails[1019][24] as SectionSubSection)
                      .fieldValue)
                  .split(",")[tempIndex - 1]
                  .split("@")[1]))
              : null;
    }
    workNumber = tempWorkNumber;
    var tempMobileNo = "";
    if (tempIndex == 0) {
      tempMobileNo = ((_sectionSubSectionDetails[1018][18] as SectionSubSection)
                  .fieldValue
                  .length >
              0)
          ? ((_sectionSubSectionDetails[1018][18] as SectionSubSection)
              .fieldValue
              .split("@")[1])
          : null;
    } else {
      tempMobileNo =
          (((_sectionSubSectionDetails[1019][21] as SectionSubSection)
                          .fieldValue)
                      .split(",")[tempIndex - 1]
                      .length >
                  0)
              ? ((((_sectionSubSectionDetails[1019][21] as SectionSubSection)
                      .fieldValue)
                  .split(",")[tempIndex - 1]
                  .split("@")[1]))
              : null;
    }
    mobileNo = tempMobileNo;
    var tempMobileCountryCode = "";
    if (tempIndex == 0) {
      tempMobileCountryCode =
          ((_sectionSubSectionDetails[1018][18] as SectionSubSection)
                      .fieldValue
                      .length >
                  0)
              ? ((_sectionSubSectionDetails[1018][18] as SectionSubSection)
                      .fieldValue
                      .split("@")[2])
                  .toLowerCase()
              : null;
    } else {
      tempMobileCountryCode =
          (((_sectionSubSectionDetails[1019][22] as SectionSubSection)
                          .fieldValue)
                      .split(",")[tempIndex - 1]
                      .length >
                  0)
              ? ((((_sectionSubSectionDetails[1019][22] as SectionSubSection)
                          .fieldValue)
                      .split(",")[tempIndex - 1]
                      .split("@")[2]))
                  .toLowerCase()
              : null;
    }
    mobileCountryCode = tempMobileCountryCode;
    var tempAltMobileCountryCode = "";
    if (tempIndex == 0) {
      tempAltMobileCountryCode =
          ((_sectionSubSectionDetails[1018][19] as SectionSubSection)
                      .fieldValue
                      .length >
                  0)
              ? ((_sectionSubSectionDetails[1018][19] as SectionSubSection)
                      .fieldValue
                      .split("@")[2])
                  .toLowerCase()
              : null;
    } else {
      tempAltMobileCountryCode =
          (((_sectionSubSectionDetails[1019][22] as SectionSubSection)
                          .fieldValue)
                      .split(",")[tempIndex - 1]
                      .length >
                  0)
              ? ((((_sectionSubSectionDetails[1019][22] as SectionSubSection)
                          .fieldValue)
                      .split(",")[tempIndex - 1]
                      .split("@")[2]))
                  .toLowerCase()
              : null;
    }
    altMobileCountryCode = tempAltMobileCountryCode;
    var tempHomeCountryCode = "";
    if (tempIndex == 0) {
      tempHomeCountryCode =
          ((_sectionSubSectionDetails[1018][20] as SectionSubSection)
                      .fieldValue
                      .length >
                  0)
              ? ((_sectionSubSectionDetails[1018][20] as SectionSubSection)
                      .fieldValue
                      .split("@")[2])
                  .toLowerCase()
              : null;
    } else {
      tempHomeCountryCode =
          (((_sectionSubSectionDetails[1019][23] as SectionSubSection)
                          .fieldValue)
                      .split(",")[tempIndex - 1]
                      .length >
                  0)
              ? ((((_sectionSubSectionDetails[1019][23] as SectionSubSection)
                          .fieldValue)
                      .split(",")[tempIndex - 1]
                      .split("@")[2]))
                  .toLowerCase()
              : null;
    }
    homeCountryCode = tempHomeCountryCode;
    var tempWorkCountryCode = "";
    if (tempIndex == 0) {
      tempWorkCountryCode =
          ((_sectionSubSectionDetails[1018][21] as SectionSubSection)
                      .fieldValue
                      .length >
                  0)
              ? ((_sectionSubSectionDetails[1018][21] as SectionSubSection)
                      .fieldValue
                      .split("@")[2])
                  .toLowerCase()
              : null;
    } else {
      tempWorkCountryCode =
          (((_sectionSubSectionDetails[1019][24] as SectionSubSection)
                          .fieldValue)
                      .split(",")[tempIndex - 1]
                      .length >
                  0)
              ? ((((_sectionSubSectionDetails[1019][24] as SectionSubSection)
                          .fieldValue)
                      .split(",")[tempIndex - 1]
                      .split("@")[2]))
                  .toLowerCase()
              : null;
    }
    workCountryCode = tempWorkCountryCode;
    email = (tempIndex == 0)
        ? (_sectionSubSectionDetails[1018][25] as SectionSubSection).fieldValue
        : ((((_sectionSubSectionDetails[1019][25] as SectionSubSection)
                        .fieldValue)
                    .split(",")[tempIndex - 1]
                    .length >
                0)
            ? ((_sectionSubSectionDetails[1019][25] as SectionSubSection)
                    .fieldValue)
                .split(",")[tempIndex - 1]
            : null);
    height = null;
    weight = null;
    intBasicSumInsured = null;
    basicSumInsured = coverageDetails["MainLife"][0]["SumAssured"];
    basicpremium = premiumDetails["MainLife"][0]["SumAssured"];
    memberpremium = null; //"0";
    medicalTestSi = null;
    cashlessSi = null;
    isCommunicationAddressSameasProspect = false;
    objCommunicationAddress = ObjCommunicationAddress.formJson(
        _sectionSubSectionDetails, tempIndex, fieldDataDetails);
    objPermenantAddress = ObjPermenantAddress.formJson(
        _sectionSubSectionDetails, tempIndex, fieldDataDetails);
    isRegAsCommunication = (tempIndex == 0) ? false : true;
    objBenifitDetails = [];
    objLstMedicalHistory = List<ObjLstMedicalHistory>.from(
        returnObjLstMedicalHistory(
                ((fetchProposalData != null)
                    ? (fetchProposalData["objMemberDetails"][tempIndex]
                        as Map)["objLstMedicalHistory"]
                    : null),
                _sectionSubSectionDetails,
                tempIndex)
            .map((e) => ObjLstMedicalHistory.formJson(e)));
    objMedicalFamilyMemberDetails = [];
    objLstJuvenileHistory = null;
    objLstDiseaseHistory = [];
    objDiseaseFamilyMemberGridDetails = null;
    objGenitoDiseaseGridDetails = null;
    objLstFamilyBackground = List<ObjLstFamilyBackground>.from(
        returnObjLstFamilyBackground(_sectionSubSectionDetails, tempIndex)
            .map((e) => ObjLstFamilyBackground.formJson(e)));
    objLstLifeStyleQuestions = null;
    noofJsPolicies = 0;
    areyouCoveredUnderOtherPolicies = (preCurrentInsuranceDetails.length > 0)
        ? ((preCurrentInsuranceDetails[1] == "1" ? true : false))
        : false;
    objClaimInfo = List<ObjClaimInfo>.from(returnObjClaimInfo(
            ((preCurrentInsuranceDetails.length > 0)
                ? preCurrentInsuranceDetails[9]
                : ""))
        .map((e) => ObjClaimInfo.formJson(e)));
    areyouClaimedAnyPolicies = (preCurrentInsuranceDetails.length > 0)
        ? ((preCurrentInsuranceDetails[8] == "1" ? true : false))
        : false;
    noofOtherPolicies = _preCurrentInsuranceList.length;
    totalDeath = (preCurrentInsuranceDetails.length > 0)
        ? preCurrentInsuranceDetails[3]
        : null;
    totalAccidental = (preCurrentInsuranceDetails.length > 0)
        ? preCurrentInsuranceDetails[4]
        : null;
    totalCritical = (preCurrentInsuranceDetails.length > 0)
        ? preCurrentInsuranceDetails[5]
        : null;
    totalHospitalization = (preCurrentInsuranceDetails.length > 0)
        ? preCurrentInsuranceDetails[6]
        : null;
    totalHospitalizationReimbursement = (preCurrentInsuranceDetails.length > 0)
        ? preCurrentInsuranceDetails[7]
        : null;
    objLifeAssuredOtherInsurance = List<ObjLifeAssuredOtherInsurance>.from(
        returnObjLifeAssuredOtherInsurance(_preCurrentInsuranceList)
            .map((e) => ObjLifeAssuredOtherInsurance.formJson(e)));
    objMedicalTests = [];
    isSelfCovered = false;
    isSpouseCoverd = false;
    isSelfIsMainLife = false;
    noofChilds = 0;
    assuredName = (tempIndex == 0)
        ? "MainLife"
        : ((_sectionSubSectionDetails[1019][1] as SectionSubSection).fieldValue)
            .split(",")[tempIndex];
    isCashlessapplicable = null;
    isproposerlifeAssured = null;
    isSteadyWeight = null;
    steadyWeightDetails = null;
    isSameasProposerAddress = (tempIndex == 0)
        ? false
        : ((((_sectionSubSectionDetails[1019][27] as SectionSubSection)
                        .fieldValue)
                    .split(",")[tempIndex - 1] ==
                "1")
            ? true
            : false);
    isSameasProposerAddressInfo = false;
    objLifeStyleQuetions = (assuredName.toLowerCase().contains("child"))
        ? null
        : (ObjLifeStyleQuetions.formJson(
            _sectionSubSectionDetails,
            _memberLifeStyleID,
            tempIndex,
            ((fetchProposalData != null)
                ? (fetchProposalData["objMemberDetails"][tempIndex])
                : Map())));
    objAdditionalQuestions = (List<ObjAdditionalQuestion>.from(
        returnObjAdditionalQuestion(
                ((fetchProposalData != null)
                    ? (fetchProposalData["objMemberDetails"][tempIndex]
                        as Map)["objAdditionalQuestions"]
                    : null),
                _sectionSubSectionDetails,
                tempIndex)
            .map((e) => ObjAdditionalQuestion.formJson(e))));
    lstAvgMonthlyIncome = null;
  }
  Map toJson() => {
        "Index": index,
        "ContactID": contactId,
        "MemberID": memberId,
        "QuoteMemberID": quoteMemberId,
        "ClientCode": clientCode,
        "RelationShipWithPropspect": relationShipWithPropspect,
        "RelationShipWithPropspectID": relationShipWithPropspectId,
        "RelationShipWithPropspectText": relationShipWithPropspectText,
        "Salutation": salutation,
        "FullName": fullName,
        "DiseasesSelected": diseasesSelected,
        "FirstName": firstName,
        "LastName": lastName,
        "FatherFullName": fatherFullName,
        "MotherFullName": motherFullName,
        "MiddleName": middleName,
        "WeddingAnniversaryDate": (weddingAnniversaryDate == null)
            ? null
            : weddingAnniversaryDate.toIso8601String(),
        "OtherMobileNo": otherMobileNo,
        "HasNewNIC": hasNewNic,
        "IsClaimExists": isClaimExists,
        "NameWithInitial": nameWithInitial,
        "PrefferedName": prefferedName,
        "DateOfBirth": dateOfBirth.toIso8601String(),
        "Age": age,
        "MaturityAge": maturityAge,
        "CurrentAge": currentAge,
        "Gender": gender,
        "GenderText": genderText,
        "MaritialStatus": maritialStatus,
        "OLDNICNo": oldnicNo,
        "NewNICNO": newNicno,
        "OccupationID": occupationId,
        "CompanyName": companyName,
        "NameOfDuties": nameOfDuties,
        "MonthlyIncome": monthlyIncome,
        "Nationality": nationality,
        "HomeNumber": homeNumber,
        "WorkNumber": workNumber,
        "MobileNo": mobileNo,
        "MobileCountryCode": mobileCountryCode,
        "AltMobileCountryCode": altMobileCountryCode,
        "HomeCountryCode": homeCountryCode,
        "WorkCountryCode": workCountryCode,
        "Email": email,
        "Height": height,
        "Weight": weight,
        "INTBasicSumInsured": intBasicSumInsured,
        "BasicSumInsured": basicSumInsured,
        "Basicpremium": basicpremium,
        "Memberpremium": memberpremium,
        "MedicalTestSI": medicalTestSi,
        "CashlessSI": cashlessSi,
        "IsCommunicationAddressSameasProspect":
            isCommunicationAddressSameasProspect,
        "objCommunicationAddress": objCommunicationAddress.toJson(),
        "objPermenantAddress": objPermenantAddress.toJson(),
        "IsRegAsCommunication": isRegAsCommunication,
        "objBenifitDetails":
            objBenifitDetails, //List<dynamic>.from(objBenifitDetails.map((x) => x)),
        "objLstMedicalHistory":
            List<dynamic>.from(objLstMedicalHistory.map((e) => e.toJson())),
        "ObjMedicalFamilyMemberDetails":
            objMedicalFamilyMemberDetails, //List<dynamic>.from(objMedicalFamilyMemberDetails.map((x) => x)),
        "objLstJuvenileHistory": objLstJuvenileHistory,
        "objLstDiseaseHistory":
            objLstDiseaseHistory, //List<dynamic>.from(objLstDiseaseHistory.map((x) => x)),
        "ObjDiseaseFamilyMemberGridDetails": objDiseaseFamilyMemberGridDetails,
        "ObjGenitoDiseaseGridDetails": objGenitoDiseaseGridDetails,
        "objLstFamilyBackground":
            List<dynamic>.from(objLstFamilyBackground.map((e) => e.toJson())),
        "objLstLifeStyleQuestions": objLstLifeStyleQuestions,
        "NoofJsPolicies": noofJsPolicies,
        "AreyouCoveredUnderOtherPolicies": areyouCoveredUnderOtherPolicies,
        "objClaimInfo": List<dynamic>.from(objClaimInfo.map((e) => e.toJson())),
        "AreyouClaimedAnyPolicies": areyouClaimedAnyPolicies,
        "NoofOtherPolicies": noofOtherPolicies,
        "TotalDeath": totalDeath,
        "TotalAccidental": totalAccidental,
        "TotalCritical": totalCritical,
        "TotalHospitalization": totalHospitalization,
        "TotalHospitalizationReimbursement": totalHospitalizationReimbursement,
        "objLifeAssuredOtherInsurance": List<dynamic>.from(
            objLifeAssuredOtherInsurance.map((e) => e.toJson())),
        "objMedicalTests": objMedicalTests,
        "IsSelfCovered": isSelfCovered,
        "IsSpouseCoverd": isSpouseCoverd,
        "IsSelfIsMainLife": isSelfIsMainLife,
        "NoofChilds": noofChilds,
        "AssuredName": assuredName,
        "isCashlessapplicable": isCashlessapplicable,
        "IsproposerlifeAssured": isproposerlifeAssured,
        "IsSteadyWeight": isSteadyWeight,
        "SteadyWeightDetails": steadyWeightDetails,
        "IsSameasProposerAddress": isSameasProposerAddress,
        "IsSameasProposerAddressInfo": isSameasProposerAddressInfo,
        "objLifeStyleQuetions": (objLifeStyleQuetions == null)
            ? objLifeStyleQuetions
            : (objLifeStyleQuetions.toJson()),
        "objAdditionalQuestions":
            (List<dynamic>.from(objAdditionalQuestions.map((e) => e.toJson()))),
        "lstAvgMonthlyIncome": lstAvgMonthlyIncome,
      };
}

//MARK:- objLstPrevInsuranceDetails
List returnObjLifeAssuredOtherInsurance(List _details) {
  List prevInsuranceDetails = [];
  for (final item in _details) {
    final Map<String, dynamic> details = {
      "company": item["0"],
      "policyOrProposalNo": item["1"],
      "death": item["2"],
      "accidental": item["3"],
      "critical": item["4"],
      "hospitalization": item["5"],
      "hospitalizationreimbursement": item["6"],
      "currentStatus": item["7"],
      "comments": item["8"],
    };
    prevInsuranceDetails.add(details);
  }
  return prevInsuranceDetails;
}

class ObjLifeAssuredOtherInsurance {
  String company;
  String policyOrProposalNo;
  String death;
  String accidental;
  String critical;
  String hospitalization;
  String hospitalizationreimbursement;
  String currentStatus;
  String comments;
  ObjLifeAssuredOtherInsurance(
      {this.company,
      this.policyOrProposalNo,
      this.death,
      this.accidental,
      this.critical,
      this.hospitalization,
      this.hospitalizationreimbursement,
      this.currentStatus,
      this.comments});

  ObjLifeAssuredOtherInsurance.formJson(Map _details) {
    company = _details["company"];
    policyOrProposalNo = _details["policyOrProposalNo"];
    death = _details["death"];
    accidental = _details["accidental"];
    critical = _details["critical"];
    hospitalization = _details["hospitalization"];
    hospitalizationreimbursement = _details["hospitalizationreimbursement"];
    currentStatus = _details["currentStatus"];
    comments = _details["comments"];
  }

  Map toJson() => {
        "CompanyName": company,
        "PolicyNo": policyOrProposalNo,
        "TotalSAAtDeath": death,
        "AccidentalBenefitAmount": accidental,
        "CriticalIllnessBenefit": critical,
        "HospitalizationPerDay": hospitalization,
        "HospitalizationReimbursement": hospitalizationreimbursement,
        "CurrentStatus": currentStatus,
        "Comments": comments
      };
}

//MARK:- objClaimInfo
List returnObjClaimInfo(String _details) {
  List objClaimInfoDetails = [];
  if (_details.length > 0) {
    final _decodeData = jsonDecode(jsonDecode(_details));
    for (final item in _decodeData) {
      final Map<String, dynamic> details = {
        "companyName": item["0"],
        "natureOfClaim": item["1"],
        "policyNo": item["2"],
        "dateOfClaim": item["3"],
      };
      objClaimInfoDetails.add(details);
    }
  }
  return objClaimInfoDetails;
}

class ObjClaimInfo {
  String companyName;
  String natureOfClaim;
  String policyNo;
  String dateOfClaim;
  ObjClaimInfo(
      {this.companyName, this.natureOfClaim, this.policyNo, this.dateOfClaim});
  ObjClaimInfo.formJson(Map _details) {
    companyName = _details["companyName"];
    natureOfClaim = _details["natureOfClaim"];
    policyNo = _details["policyNo"];
    dateOfClaim = _details["dateOfClaim"];
  }
  Map toJson() => {
        "CompanyName": companyName,
        "NatureOfClaim": natureOfClaim,
        "PolicyNo": policyNo,
        "DateOfClaim": dateOfClaim
      };
}

//MARK:- ObjAdditionalQuestion
List returnObjAdditionalQuestion(dynamic objAdditionalQuestion,
    Map _sectionSubSectionDetails, int tempIndex) {
  final _questionsFieldValue =
      (_sectionSubSectionDetails[1020][2] as SectionSubSection).fieldValue;
  final _questionDetails = (_questionsFieldValue.split("@").length > 0)
      ? _questionsFieldValue.split("@")[tempIndex]
      : _questionsFieldValue;
  List _additionalQuestion = [];
  if (_questionDetails.length > 0) {
    final _decodeData = jsonDecode(_questionDetails);
    _additionalQuestion = _decodeData["1178"].split("#") as List;
    _additionalQuestion.removeLast();
  }

  //SubAnswer
  //Answer
  //303
  List lstMedicalHistory = [];
  //SIT 301, 302
  List qID = [11, 12, 13, 15, 16, 37];
  var index = 0;
  for (final item in qID) {
    final Map<String, dynamic> details = {
      "MemberQuestionID": (objAdditionalQuestion != null)
          ? ((objAdditionalQuestion as List)
              .where((element) => element["QID"] == item)
              .toList()[0] as Map)["MemberQuestionID"]
          : 0,
      "QID": item,
      "SeqID": 0,
      "answer": (_additionalQuestion.length > 0)
          ? (_additionalQuestion[index] == "1" ? "true" : "false")
          : "false",
      "subAnswer": (_additionalQuestion.length > 0)
          ? _additionalQuestion[index + 1]
          : "",
    };
    index = index + 2;
    lstMedicalHistory.add(details);
  }
  return lstMedicalHistory;
}

class ObjAdditionalQuestion {
  int memberQuestionId;
  int qid;
  int seqId;
  dynamic parentId;
  dynamic question;
  String answer;
  dynamic subType;
  dynamic controlType;
  dynamic subQuestion;
  dynamic subControl;
  dynamic subAnswer;
  dynamic master;
  dynamic value;
  dynamic sequenceNo;
  dynamic lstDropDownvalues;
  ObjAdditionalQuestion({
    this.memberQuestionId,
    this.qid,
    this.seqId,
    this.parentId,
    this.question,
    this.answer,
    this.subType,
    this.controlType,
    this.subQuestion,
    this.subControl,
    this.subAnswer,
    this.master,
    this.value,
    this.sequenceNo,
    this.lstDropDownvalues,
  });
  ObjAdditionalQuestion.formJson(Map _additionalQuestionDetails) {
    memberQuestionId = _additionalQuestionDetails["MemberQuestionID"];
    qid = _additionalQuestionDetails["QID"];
    seqId = _additionalQuestionDetails["SeqID"];
    parentId = null;
    question = null;
    answer = _additionalQuestionDetails["answer"];
    subType = null;
    controlType = null;
    subQuestion = null;
    subControl = null;
    subAnswer = _additionalQuestionDetails["subAnswer"];
    master = null;
    value = null;
    sequenceNo = null;
    lstDropDownvalues = null;
  }
  Map toJson() => {
        "MemberQuestionID": memberQuestionId,
        "QID": qid,
        "SeqID": seqId,
        "ParentID": parentId,
        "Question": question,
        "Answer": answer,
        "SubType": subType,
        "ControlType": controlType,
        "SubQuestion": subQuestion,
        "SubControl": subControl,
        "SubAnswer": subAnswer,
        "Master": master,
        "Value": value,
        "SequenceNo": sequenceNo,
        "LstDropDownvalues": lstDropDownvalues,
      };
}

//MARK:- objLifeStyleQuetions
class ObjLifeStyleQuetions {
  int memberLifeStyleId;
  String height;
  String weight;
  bool steadyWeight;
  dynamic steadyWeightDetails;
  String heightUnit;
  String weightUnit;
  bool isSmoker;
  dynamic smokeType;
  dynamic smokeQuantity;
  dynamic smokePerDay;
  dynamic smokeDuration;
  bool isAlcholic;
  dynamic alcholType;
  dynamic alcholQuantity;
  dynamic alcholPerDay;
  dynamic alcholDuration;
  List<ObjSmokeDetails> objSmokeDetails;
  List<ObjAlcoholDetails> objAlcoholDetails;
  dynamic questions;
  ObjLifeStyleQuetions({
    this.memberLifeStyleId,
    this.height,
    this.weight,
    this.steadyWeight,
    this.steadyWeightDetails,
    this.heightUnit,
    this.weightUnit,
    this.isSmoker,
    this.smokeType,
    this.smokeQuantity,
    this.smokePerDay,
    this.smokeDuration,
    this.isAlcholic,
    this.alcholType,
    this.alcholQuantity,
    this.alcholPerDay,
    this.alcholDuration,
    this.objSmokeDetails,
    this.objAlcoholDetails,
    this.questions,
  });

  ObjLifeStyleQuetions.formJson(Map _sectionSubSectionDetails,
      String _memberLifeStyleID, int tempIndex, Map _memberDetails) {
    final _questionsFieldValue =
        (_sectionSubSectionDetails[1020][2] as SectionSubSection).fieldValue;
    final _questionDetails = (_questionsFieldValue.split("@").length > 0)
        ? _questionsFieldValue.split("@")[tempIndex]
        : _questionsFieldValue;
    final _decodeData =
        (_questionDetails.length > 0) ? jsonDecode(_questionDetails) : Map();
    final _lifeStyleQuotionList =
        (_decodeData.length > 0) ? (_decodeData["1175"].split("#")) : List();
    memberLifeStyleId = (_memberDetails.length > 0 &&
            _memberDetails["objLifeStyleQuetions"]["MemberLifeStyleID"] !=
                null &&
            _memberDetails["objLifeStyleQuetions"]["MemberLifeStyleID"] > 0)
        ? _memberDetails["objLifeStyleQuetions"]["MemberLifeStyleID"]
        : 0;
    height = (_lifeStyleQuotionList.length > 0)
        ? ((_lifeStyleQuotionList[0] as String).split(",")[0])
        : null;
    weight = (_lifeStyleQuotionList.length > 0)
        ? ((_lifeStyleQuotionList[1] as String).split(",")[0])
        : null;
    steadyWeight = (_lifeStyleQuotionList.length > 0)
        ? (((_lifeStyleQuotionList[2] as String) == "1") ? false : true)
        : null;
    steadyWeightDetails = (_lifeStyleQuotionList.length > 0)
        ? (_lifeStyleQuotionList[3] as String)
        : null;
    heightUnit = "INCHS";
    weightUnit = "KGS";
    isSmoker = (_lifeStyleQuotionList.length > 0)
        ? (((_lifeStyleQuotionList[4] as String) == "1") ? true : false)
        : null;
    smokeType = null;
    smokeQuantity = null;
    smokePerDay = null;
    smokeDuration = null;
    isAlcholic = (_lifeStyleQuotionList.length > 0)
        ? (((_lifeStyleQuotionList[6] as String) == "1") ? true : false)
        : null;
    alcholType = null;
    alcholQuantity = null;
    alcholPerDay = null;
    alcholDuration = null;
    objSmokeDetails = (_lifeStyleQuotionList.length > 0)
        ? (List<ObjSmokeDetails>.from(
            returnSmokeDetails((_lifeStyleQuotionList[5] as String))
                .map((e) => ObjSmokeDetails.formJson(e))))
        : null;
    objAlcoholDetails = (_lifeStyleQuotionList.length > 0)
        ? (List<ObjAlcoholDetails>.from(
            returnAlcoholDetails((_lifeStyleQuotionList[7] as String))
                .map((e) => ObjAlcoholDetails.formJson(e))))
        : null;
    questions = [];
  }

  Map toJson() => {
        "MemberLifeStyleID": memberLifeStyleId,
        "Height": height,
        "Weight": weight,
        "SteadyWeight": steadyWeight,
        "SteadyWeightDetails": steadyWeightDetails,
        "HeightUnit": heightUnit,
        "WeightUnit": weightUnit,
        "IsSmoker": isSmoker,
        "SmokeType": smokeType,
        "SmokeQuantity": smokeQuantity,
        "SmokePerDay": smokePerDay,
        "SmokeDuration": smokeDuration,
        "IsAlcholic": isAlcholic,
        "AlcholType": alcholType,
        "AlcholQuantity": alcholQuantity,
        "AlcholPerDay": alcholPerDay,
        "AlcholDuration": alcholDuration,
        "objSmokeDetails": (objSmokeDetails == null)
            ? objSmokeDetails
            : (List<dynamic>.from(objSmokeDetails.map((e) => e.toJson()))),
        "objAlcoholDetails": (objAlcoholDetails != null)
            ? (List<dynamic>.from(objAlcoholDetails.map((e) => e.toJson())))
            : null,
        "Questions": questions
      };
}

//SmokeType,SmokeQuantity,SmokePerDay,SmokeDuration
//MARK:- SmokeDetails

List returnSmokeDetails(String _details) {
  List lstSmokeDetails = [];
  if (_details.length > 0) {
    final _decodeData = jsonDecode(jsonDecode(_details));
    for (final item in _decodeData) {
      final Map<String, dynamic> details = {
        "smokeType": item["0"],
        "smokeQuantity": item["1"],
        "smokePerDay": item["2"],
        "smokeDuration": item["3"],
      };
      lstSmokeDetails.add(details);
    }
  }
  return lstSmokeDetails;
}

class ObjSmokeDetails {
  String smokeType;
  int smokeQuantity;
  String smokePerDay;
  int smokeDuration;
  ObjSmokeDetails(
      {this.smokeType,
      this.smokeQuantity,
      this.smokePerDay,
      this.smokeDuration});
  ObjSmokeDetails.formJson(Map _details) {
    smokeType = _details["smokeType"];
    smokeQuantity = int.parse(_details["smokeQuantity"]);
    smokePerDay = _details["smokePerDay"];
    smokeDuration = int.parse(_details["smokeDuration"]);
  }
  Map toJson() => {
        "SmokeType": smokeType,
        "SmokeQuantity": smokeQuantity,
        "SmokePerDay": smokePerDay,
        "SmokeDuration": smokeDuration
      };
}

//AlcholType,AlcholQuantity,AlcholPerDay,AlcholDuration
//MARK:- AlcoholDetails
List returnAlcoholDetails(String _details) {
  List lstAlcoholDetails = [];
  if (_details.length > 0) {
    final _decodeData = jsonDecode(jsonDecode(_details));
    for (final item in _decodeData) {
      final Map<String, dynamic> details = {
        "alcholType": item["0"],
        "alcholQuantity": item["1"],
        "alcholPerDay": item["2"],
        "alcholDuration": item["3"],
      };
      lstAlcoholDetails.add(details);
    }
  }
  return lstAlcoholDetails;
}

class ObjAlcoholDetails {
  String alcholType;
  int alcholQuantity;
  String alcholPerDay;
  int alcholDuration;
  ObjAlcoholDetails(
      {this.alcholType,
      this.alcholQuantity,
      this.alcholPerDay,
      this.alcholDuration});
  ObjAlcoholDetails.formJson(Map _details) {
    alcholType = _details["alcholType"];
    alcholQuantity = int.parse(_details["alcholQuantity"]);
    alcholPerDay = _details["alcholPerDay"];
    alcholDuration = int.parse(_details["alcholDuration"]);
  }
  Map toJson() => {
        "AlcholType": alcholType,
        "AlcholQuantity": alcholQuantity,
        "AlcholPerDay": alcholPerDay,
        "AlcholDuration": alcholDuration
      };
}

//MARK:- ObjLstMedicalHistory
List returnObjLstMedicalHistory(
    dynamic objMedicalHistory, Map _sectionSubSectionDetails, int tempIndex) {
  final _questionsFieldValue =
      (_sectionSubSectionDetails[1020][2] as SectionSubSection).fieldValue;
  final _questionDetails = (_questionsFieldValue.split("@").length > 0)
      ? _questionsFieldValue.split("@")[tempIndex]
      : _questionsFieldValue;
  List lstMedicalHistory = [];
  if (_questionDetails.length > 0) {
    final _decodeData = jsonDecode(_questionDetails);
    var _medicalHistory = _decodeData["1176"].split("#") as List;
    _medicalHistory.removeLast();
    var _index = 0;
    List medicalID = [29, 30, 32, 33, 31];
    for (final item in medicalID) {
      final Map<String, dynamic> details = {
        "answer": ((_medicalHistory[_index].length) > 0)
            ? ((_medicalHistory[_index] == "1") ? "true" : "false")
            : ((_index == 0) ? "true" : "false"),
        "subAnswer": ((_medicalHistory[_index + 1].length) > 0)
            ? _medicalHistory[_index + 1]
            : "",
        "QuestionID": item,
        "MedicalHistoryID": (objMedicalHistory != null)
            ? ((objMedicalHistory as List)
                .where((element) => element["QuestionID"] == item)
                .toList()[0] as Map)["MedicalHistoryID"]
            : 0 // item["MedicalHistoryID"],
      };
      lstMedicalHistory.add(details);
      _index = _index + 2;
    }
  }
  return lstMedicalHistory;
}

class ObjLstMedicalHistory {
  int questionId;
  dynamic parentId;
  dynamic parentAnswer;
  int medicalHistoryId;
  dynamic questionText;
  String answer;
  dynamic details;
  dynamic cotrolType;
  dynamic subType;
  dynamic subControlType;
  dynamic subQuestion;
  dynamic subAnswer;
  dynamic value;
  dynamic master;
  dynamic sequenceNo;
  List<String> diseases;
  String selectedDiseases;
  dynamic gynecologicalDisease;
  dynamic diseasesSelected;
  dynamic lstDropDownvalues;
  ObjLstMedicalHistory({
    this.questionId,
    this.parentId,
    this.parentAnswer,
    this.medicalHistoryId,
    this.questionText,
    this.answer,
    this.details,
    this.cotrolType,
    this.subType,
    this.subControlType,
    this.subQuestion,
    this.subAnswer,
    this.value,
    this.master,
    this.sequenceNo,
    this.diseases,
    this.selectedDiseases,
    this.gynecologicalDisease,
    this.diseasesSelected,
    this.lstDropDownvalues,
  });

  ObjLstMedicalHistory.formJson(Map _medicalHistoryDetails) {
    questionId = _medicalHistoryDetails["QuestionID"];
    parentId = null;
    parentAnswer = null;
    medicalHistoryId = _medicalHistoryDetails["MedicalHistoryID"];
    questionText = null;
    answer = _medicalHistoryDetails["answer"];
    details = null;
    cotrolType = null;
    subType = null;
    subControlType = null;
    subQuestion = null;
    subAnswer = _medicalHistoryDetails["subAnswer"];
    value = null;
    master = null;
    sequenceNo = null;
    diseases = null;
    selectedDiseases = null;
    diseasesSelected = null;
    lstDropDownvalues = null;
  }
  Map toJson() => {
        "QuestionID": questionId,
        "ParentID": parentId,
        "ParentAnswer": parentAnswer,
        "MedicalHistoryID": medicalHistoryId,
        "QuestionText": questionText,
        "Answer": answer,
        "Details": details,
        "CotrolType": cotrolType,
        "SubType": subType,
        "SubControlType": subControlType,
        "SubQuestion": subQuestion,
        "SubAnswer": subAnswer,
        "Value": value,
        "Master": master,
        "SequenceNo": sequenceNo,
        "Diseases": diseases,
        "SelectedDiseases": selectedDiseases == null ? null : selectedDiseases,
        "GynecologicalDisease": gynecologicalDisease,
        "DiseasesSelected": diseasesSelected,
        "LstDropDownvalues": lstDropDownvalues,
      };
}

//MARK:- ObjLstFamilyBackground
List returnObjLstFamilyBackground(
    Map _sectionSubSectionDetails, int tempIndex) {
  final _questionsFieldValue =
      (_sectionSubSectionDetails[1020][2] as SectionSubSection).fieldValue;
  final _questionDetails = (_questionsFieldValue.split("@").length > 0)
      ? _questionsFieldValue.split("@")[tempIndex]
      : _questionsFieldValue;
  List lstMedicalHistory = [];
  if (_questionDetails.length > 0) {
    final _decodeData = jsonDecode(_questionDetails);
    if (_decodeData["1177"].length > 0) {
      var _familyBackground = jsonDecode(jsonDecode(_decodeData["1177"]));
      for (final item in _familyBackground) {
        final Map<String, dynamic> details = {
          "familyPersonType": item["1"],
          "ageAtDeath": item["5"],
          "presentAge": item["2"],
          "stateOfHealth": item["3"],
          "cause": item["6"],
        };
        lstMedicalHistory.add(details);
      }
    }
  }
  return lstMedicalHistory;
}

class ObjLstFamilyBackground {
  String familyPersonType;
  int familyBackgroundId;
  int presentAge;
  String stateOfHealth;
  dynamic ageAtDeath;
  dynamic cause;
  bool isSuffering;
  bool isDeathBelowSixty;
  dynamic anyMemberOfFamily;
  dynamic deathBelow;
  dynamic details;
  ObjLstFamilyBackground({
    this.familyPersonType,
    this.familyBackgroundId,
    this.presentAge,
    this.stateOfHealth,
    this.ageAtDeath,
    this.cause,
    this.isSuffering,
    this.isDeathBelowSixty,
    this.anyMemberOfFamily,
    this.deathBelow,
    this.details,
  });
  ObjLstFamilyBackground.formJson(Map _familyBackgroundDetails) {
    familyPersonType = _familyBackgroundDetails["familyPersonType"];
    familyBackgroundId = _familyBackgroundDetails["FamilyBackgroundId"];
    presentAge = int.parse(_familyBackgroundDetails["presentAge"]);
    stateOfHealth = _familyBackgroundDetails["stateOfHealth"];
    ageAtDeath = _familyBackgroundDetails["ageAtDeath"];
    cause = _familyBackgroundDetails["cause"];
    isSuffering = false;
    isDeathBelowSixty = false;
    anyMemberOfFamily = null;
    deathBelow = null;
    details = null;
  }
  Map toJson() => {
        "FamilyPersonType": familyPersonType,
        "FamilyBackgroundId": familyBackgroundId,
        "PresentAge": presentAge,
        "StateOfHealth": stateOfHealth,
        "AgeAtDeath": ageAtDeath,
        "Cause": cause,
        "IsSuffering": isSuffering,
        "IsDeathBelowSixty": isDeathBelowSixty,
        "AnyMemberOfFamily": anyMemberOfFamily,
        "DeathBelow": deathBelow,
        "Details": details
      };
}
