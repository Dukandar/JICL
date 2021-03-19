
// class SampleJson{
//   String test;
//   String test1;
//   SampleJson({
//     this.test,
//     this.test1
//   });
// SampleJson.formJson(Map map){
//   test = map["test"];
//   test1 = map["test1"];
// }
//  Map toJson()=>{
//   "test" : test,
//   "test1" : test1
//  };
// }

import 'dart:convert';

import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_util/Constant.dart';

returnMemebrWithIdWithIndex(int index){
      switch(index){
         case 0:
            return "267";
         case 1:
            return "268";
          case 2:
            return "270";
          case 3:
            return "269";       
      }
    }

  returnAssuredWithIdWithIndex(int index){
      switch(index){
         case 0:
            return "MainLife";
         case 1:
            return "Spouse";
          default:
            return "Child${index - 1}";       
      }
    }

  //MARK:- return index
  returnIndexWithField(int fieldDependencyID,List<SectionSubSection> _sectionDetails){
    if (_sectionDetails.length > 0) {
      for(var index = 0; index < _sectionDetails.length; index++){
      final _value = _sectionDetails[index];
        if (_value.fieldDependencyID == fieldDependencyID){
          return index;
        }
      } 
    }
  }

class RiderMaxAndMin{
    dynamic isQuickQuote;
    int childCount;
    bool isForServices;
    int quoteIndex;
    dynamic lstIllustation;
    ObjProspect objProspect;
    ObjProductDetials objProductDetials;
    int age;
    dynamic spouseOccupationClass;
    dynamic spouseOccupationCode;
    dynamic cess;
    dynamic policyFee;
    dynamic vat;
    dynamic annualPremium;
    dynamic halfYearlyPremium;
    dynamic quaterlyPremium;
    dynamic monthlyPremium;
    dynamic singlePremium;
    int basicSumInsured;
    double quotePremium;
    dynamic basicPremium;
    double productBasicPremium;
    double totalPremium;
    double tClientPremium;
    dynamic basicPackageRiderPremium;
    dynamic investmentPremium;
    dynamic protectionPremium;
    dynamic investmentTotalPremium;
    dynamic totalRiderPremium;
    double contributionAmtCess;
    double premiumCess;
    int contactid;
    bool isInsuranceCovered;
    dynamic contributionAmount;
    dynamic isSelfMedicalBenefit;
    dynamic isBenefitReceivingPeriod;
    dynamic isCoverAppliedFor;
    bool isSelfCovered;
    bool isSpouseCovered;
    bool isChildCovered;
    bool isNeedsIdentified;
    bool isModifyQuote;
    dynamic isCashLessSelf;
    dynamic isCashLessSumAssured;
    dynamic isCashlessNone;
    dynamic noofChilds;
    dynamic noofCashLessChildren;
    dynamic lifetobeAssuredDd;
    dynamic lifetobeAssuredDdNo;
    ObjSpouseDetails objSpouseDetials;
    ObjBusinessPartnerDetials objBusinessPartnerDetials;
    ObjLoanBorrowerDetials objLoanBorrowerDetials;
    List<ObjChildDetials> objChildDetials;
    dynamic objEighteenPlusChildDetials;
    dynamic strHtml;
    dynamic strPremiumHtml;
    dynamic userName;
    dynamic quoteNo;
    dynamic message;
    dynamic listAssured;
    dynamic panelIndex;
    String selectedMember;
    String memberIndex;
    int quoteVersion;
    bool isPremiumCall;
    int minEntryAge;
    int maxEntryAge;
    int maturityAge;
    dynamic cashlessRiderChildren;
    List<ObjQuoteMemberDetail> objQuoteMemberDetails;
    dynamic listPlan;
    dynamic lstPolicyTerm;
    dynamic lstPremiumTerm;
    dynamic lstLanguage;
    dynamic lstCountryCode;
    dynamic lstPrefMode;
    List<LstBenefitOverView> lstBenefitOverView;
    List<dynamic> lstPremiumOverview;
    dynamic objPackageDetails;
    dynamic status;
    List<dynamic> lstGender;
    List<dynamic> lstOccupation;
    dynamic objQuotationPool;
    dynamic lstDecision;
    dynamic lstReportee;
    dynamic lstLifetobeAssured;
    dynamic lstLifetobeAssuredSelfNo;
    List<dynamic> lstCashLessRiderChildren;
    dynamic lstChildDetails;

    RiderMaxAndMin({
        this.isQuickQuote,
        this.childCount,
        this.isForServices,
        this.quoteIndex,
        this.lstIllustation,
        this.objProspect,
        this.objProductDetials,
        this.age,
        this.spouseOccupationClass,
        this.spouseOccupationCode,
        this.cess,
        this.policyFee,
        this.vat,
        this.annualPremium,
        this.halfYearlyPremium,
        this.quaterlyPremium,
        this.monthlyPremium,
        this.singlePremium,
        this.basicSumInsured,
        this.quotePremium,
        this.basicPremium,
        this.productBasicPremium,
        this.totalPremium,
        this.tClientPremium,
        this.basicPackageRiderPremium,
        this.investmentPremium,
        this.protectionPremium,
        this.investmentTotalPremium,
        this.totalRiderPremium,
        this.contributionAmtCess,
        this.premiumCess,
        this.contactid,
        this.isInsuranceCovered,
        this.contributionAmount,
        this.isSelfMedicalBenefit,
        this.isBenefitReceivingPeriod,
        this.isCoverAppliedFor,
        this.isSelfCovered,
        this.isSpouseCovered,
        this.isChildCovered,
        this.isNeedsIdentified,
        this.isModifyQuote,
        this.isCashLessSelf,
        this.isCashLessSumAssured,
        this.isCashlessNone,
        this.noofChilds,
        this.noofCashLessChildren,
        this.lifetobeAssuredDd,
        this.lifetobeAssuredDdNo,
        this.objSpouseDetials,
        this.objBusinessPartnerDetials,
        this.objLoanBorrowerDetials,
        this.objChildDetials,
        this.objEighteenPlusChildDetials,
        this.strHtml,
        this.strPremiumHtml,
        this.userName,
        this.quoteNo,
        this.message,
        this.listAssured,
        this.panelIndex,
        this.selectedMember,
        this.memberIndex,
        this.quoteVersion,
        this.isPremiumCall,
        this.minEntryAge,
        this.maxEntryAge,
        this.maturityAge,
        this.cashlessRiderChildren,
        this.objQuoteMemberDetails,
        this.listPlan,
        this.lstPolicyTerm,
        this.lstPremiumTerm,
        this.lstLanguage,
        this.lstCountryCode,
        this.lstPrefMode,
        this.lstBenefitOverView,
        this.lstPremiumOverview,
        this.objPackageDetails,
        this.status,
        this.lstGender,
        this.lstOccupation,
        this.objQuotationPool,
        this.lstDecision,
        this.lstReportee,
        this.lstLifetobeAssured,
        this.lstLifetobeAssuredSelfNo,
        this.lstCashLessRiderChildren,
        this.lstChildDetails,
    });

    RiderMaxAndMin.formJson(Map sectionSubsectionDetails, Map riderDetails,String value,int currentPage,int contactID){
      isQuickQuote = null;
      childCount = 0;
      isForServices = false;
      quoteIndex = 0;
      lstIllustation = null;
      objProspect = ObjProspect.formJson(sectionSubsectionDetails);
      objProductDetials = ObjProductDetials.formJson(sectionSubsectionDetails);
      age = 31;
      spouseOccupationClass = null;
      spouseOccupationCode = null;
      cess = null;
      policyFee = null;
      vat = null;
      annualPremium = null;
      halfYearlyPremium = null;
      quaterlyPremium = null;
      monthlyPremium = null;
      singlePremium = null;
      basicSumInsured = 50000;
      quotePremium = 0.0;
      basicPremium = null;
      productBasicPremium = 0.0;
      totalPremium = 0.0;
      tClientPremium = 0.0;
      basicPackageRiderPremium = null;
      investmentPremium = null;
      protectionPremium = null;
      investmentTotalPremium = null;
      totalRiderPremium = null;
      contributionAmtCess = 0.0;
      premiumCess = 0.0;
      contactid = contactID;
      isInsuranceCovered = false;
      contributionAmount = null;
      isSelfMedicalBenefit = null;
      isBenefitReceivingPeriod = null;
      isCoverAppliedFor = null;
      isSelfCovered = true;
      isSpouseCovered = true;
      isChildCovered = true;
      isNeedsIdentified = false;
      isModifyQuote = false;
      isCashLessSelf = false;
      isCashLessSumAssured = false;
      isCashlessNone = null;
      noofChilds = "2";
      noofCashLessChildren = "2";
      lifetobeAssuredDd = null;
      lifetobeAssuredDdNo = null;
      objSpouseDetials = ObjSpouseDetails.formJson(sectionSubsectionDetails);
      objBusinessPartnerDetials = ObjBusinessPartnerDetials.formJson(sectionSubsectionDetails);
      objLoanBorrowerDetials = ObjLoanBorrowerDetials.formJson(sectionSubsectionDetails);
      objChildDetials = List<ObjChildDetials>.from(returnChildDetails(sectionSubsectionDetails).map((e) => ObjChildDetials.formJson(e)));
      objEighteenPlusChildDetials = null;
      strHtml = null;
      strPremiumHtml = null;
      userName = null;
      quoteNo = null;
      message = null;
      listAssured = null;
      panelIndex = null;
      selectedMember = "MainLife";
      memberIndex = "0";
      quoteVersion = 0;
      isPremiumCall = false;
      minEntryAge = 18;
      maxEntryAge = 60;
      maturityAge = 70;
      cashlessRiderChildren = null;
      objQuoteMemberDetails = List<ObjQuoteMemberDetail>.from(returnObjMemberDetails(sectionSubsectionDetails).map((e) => ObjQuoteMemberDetail.formJson(e)));
      listPlan = null;
      lstPolicyTerm = null;
      lstPremiumTerm = null;
      lstLanguage = null;
      lstCountryCode = null;
      lstPrefMode = null;
      lstBenefitOverView = returnBenfitOverView(sectionSubsectionDetails, riderDetails,value,currentPage);
      lstPremiumOverview = [];
      objPackageDetails = null;
      status = null;
      lstGender = [];
      lstOccupation = [];
      objQuotationPool = null;
      lstDecision = null;
      lstReportee = null;
      lstLifetobeAssured = null;
      lstLifetobeAssuredSelfNo = null;
      lstCashLessRiderChildren = [];
      lstChildDetails = null;
    }

    Map toJson()=>{
      "IsQuickQuote" : isQuickQuote,
      "ChildCount" :childCount,
      "IsForServices":isForServices,
      "QuoteIndex" : quoteIndex,
      "LstIllustation" : lstIllustation,
      "objProspect" : objProspect.toJson(),
      "objProductDetials" : objProductDetials.toJson(),
      "Age" : age,
      "SpouseOccupationClass" : spouseOccupationClass,
      "SpouseOccupationCode" : spouseOccupationCode,
      "Cess" : cess,
      "PolicyFee" : policyFee,
      "VAT" : vat,
      "AnnualPremium" : annualPremium,
      "HalfYearlyPremium" : halfYearlyPremium,
      "QuaterlyPremium" : quaterlyPremium,
      "MonthlyPremium" : monthlyPremium,
      "SinglePremium" : singlePremium,
      "BasicSumInsured" : basicSumInsured,
      "QuotePremium" : quotePremium,
      "BasicPremium" : basicPremium,
      "ProductBasicPremium" : productBasicPremium,
      "TotalPremium" : totalPremium,
      "tClientPremium" : tClientPremium,
      "BasicPackageRiderPremium" : basicPackageRiderPremium,
      "InvestmentPremium" : investmentPremium,
      "ProtectionPremium" : protectionPremium,
      "InvestmentTotalPremium" :investmentTotalPremium,
      "totalRiderPremium" : totalRiderPremium,
      "ContributionAmtCess" : contributionAmtCess,
      "PremiumCess" : premiumCess,
      "Contactid" : contactid,
      "IsInsuranceCovered" : isInsuranceCovered,
      "ContributionAmount" : contributionAmount,
      "IsSelfMedicalBenefit" : isSelfMedicalBenefit,
      "IsBenefitReceivingPeriod" : isBenefitReceivingPeriod,
      "IsCoverAppliedFor" : isCoverAppliedFor,
      "IsSelfCovered" : isSelfCovered,
      "IsSpouseCovered" : isSpouseCovered,
      "IsChildCovered" : isChildCovered,
      "IsNeedsIdentified" : isNeedsIdentified,
      "IsModifyQuote" : isModifyQuote,
      "IsCashLessSelf" : isCashLessSelf,
      "IsCashLessSumAssured" : isCashLessSumAssured,
      "IsCashlessNone" : isCashlessNone,
      "NoofChilds" : noofChilds,
      "NoofCashLessChildren" : noofCashLessChildren,
      "LifetobeAssuredDD" : lifetobeAssuredDd,
      "LifetobeAssuredDDNo" : lifetobeAssuredDdNo,
      "objSpouseDetials": objSpouseDetials.toJson(),
      "objBusinessPartnerDetials": objBusinessPartnerDetials.toJson(),
      "objLoanBorrowerDetials": objLoanBorrowerDetials.toJson(),
      "objChildDetials":  List<dynamic>.from(objChildDetials.map((e) => e.toJson())),
      "objEighteenPlusChildDetials" : objEighteenPlusChildDetials,
      "STRHtml" : strHtml,
      "STRPremiumHtml" : strPremiumHtml,
      "UserName" : userName,
      "QuoteNo" : quoteNo,
      "Message" : message,
      "ListAssured" : listAssured,
      "PanelIndex" : panelIndex,
      "SelectedMember" : selectedMember,
      "_memberIndex" : memberIndex,
      "QuoteVersion" : quoteVersion,
      "IsPremiumCall" : isPremiumCall,
      "MinEntryAge" : minEntryAge,
      "MaxEntryAge" : maxEntryAge,
      "MaturityAge" : maturityAge,
      "CashlessRiderChildren" : cashlessRiderChildren,
      "objQuoteMemberDetails" : List<dynamic>.from(objQuoteMemberDetails.map((e) => e.toJson())), 
      "ListPlan" : listPlan,
      "LstPolicyTerm" : lstPolicyTerm,
      "LstPremiumTerm" : lstPremiumTerm,
      "lstLanguage" : lstLanguage,
      "LstCountryCode" : lstCountryCode,
      "lstPrefMode" : lstPrefMode,
      "LstBenefitOverView" : List<dynamic>.from(lstBenefitOverView.map((e) => e.toJson())),
      "LstPremiumOverview" : lstPremiumOverview,
      "objPackageDetails" : objPackageDetails,
      "Status" : status,
      "lstGender": lstGender,
      "lstOccupation" : lstOccupation,
      "ObjQuotationPool" : objQuotationPool,
      "lstDecision" : lstDecision,
      "lstReportee" : lstReportee,
      "lstLifetobeAssured" : lstLifetobeAssured,
      "lstLifetobeAssuredSelfNo" : lstLifetobeAssuredSelfNo,
      "LstCashLessRiderChildren" : lstCashLessRiderChildren,
      "LstChildDetails" : lstChildDetails
    };

    //MARK:- Dependent Details
    List returnChildDetails(_subSectionDetails){
    List childDetails = [];
    final dependentIndex = returnIndexWithField(1168,_subSectionDetails[1010]); 
    var dependentData = (_subSectionDetails[1010][dependentIndex] as SectionSubSection);
    if(dependentData.fieldValue.length > 0){
         final decodeDetails = json.decode(dependentData.fieldValue);
    if (decodeDetails.length > 0){
        var tempArray = [];
        for(final value in decodeDetails){
          final decode = jsonDecode(value);
          tempArray.add(decode);
        }
        for (final val in tempArray) {
          final Map<String,dynamic> details ={
            "ChildName": val["0"],
            "ChildDOB": val["2"],
            "SumAssured": null,
            "Assured": null,
            "Relationship": val["1"],
            "Occupation": null,
            "NICNo": null,
            "isCashlessapplicable": null,
            "Age": val["3"],
            "CurrentAge": null,
            "IsDeleted": false,
            "ChildCount": 0
          };
          childDetails.add(details);
        }
      }
    }
     return childDetails;
    }

    List returnObjMemberDetails(_subSectionDetails){
      List memberDetails = [];
      var memeberCount = 1;
      //Marital status
      final maritalStatusXndex = returnIndexWithField(1144,_subSectionDetails[1009]); 
      var maritalStatusData = (_subSectionDetails[1009][maritalStatusXndex] as SectionSubSection);
      if(maritalStatusData.fieldValue == "14") {
        memeberCount = memeberCount + 1;
      }
      var tempArray = [];
      final dependentIndex = returnIndexWithField(1168,_subSectionDetails[1010]); 
      var dependentData = (_subSectionDetails[1010][dependentIndex] as SectionSubSection);
      if(dependentData.fieldValue.length > 0){
       final decodeDetails = json.decode(dependentData.fieldValue); 
        if (decodeDetails.length > 0){
            for(final value in decodeDetails){
              final decode = jsonDecode(value);
              tempArray.add(decode);
          }
          memeberCount = memeberCount + tempArray.length;
        }
      }
        for(var i = 0 ; i < memeberCount ; i++ ){
            final Map<String,dynamic> details ={
              "BasicSumInsured": null,
	          	"Assured": returnAssuredWithIdWithIndex(i),
	            "Relationship": returnMemebrWithIdWithIndex(i),
	          	"MemberIndex": i,
		          "MemberOccupation": (i > 1) ? 2 : 0,
	          	"Age": (i <= 1) ? (_subSectionDetails[(i == 0) ? 1009 : 1010][((i == 0) ? 8 : 12)] as SectionSubSection).fieldValue : tempArray[i - 2]["3"],
	          	"ChildRelationship": null,
		          "MemberName": (i <= 1) ? (_subSectionDetails[(i == 0) ? 1009 : 1010][((i == 0) ? 3 : 10)] as SectionSubSection).fieldValue : tempArray[i - 2]["0"],
		          "MemberDOB": (i <= 1) ? (_subSectionDetails[(i == 0) ? 1009 : 1010][((i == 0) ? 7 : 11)] as SectionSubSection).fieldValue : tempArray[i - 2]["2"],
		          "TabIndex": null,
		          "IsBenefitRequested": false,
		          "ObjBenefitDetails": [],
		          "HospitalizationAvailability": null,
		          "MemberPremium": null
           };
           memberDetails.add(details);
        }
      return memberDetails;
    }

    List<LstBenefitOverView> returnBenfitOverView(_sectionDetails, Map riderDetails,String value,int currentPage){
      List<LstBenefitOverView> benefitOverViewDetails = [];
      // final keys = riderDetails.keys;
      // for (final key in keys){
          final riderDetail = riderDetails["main"];
          for (var item in riderDetail) {
            LstBenefitOverView benefitDetails = LstBenefitOverView.formJson(_sectionDetails, item,value,currentPage);
            benefitOverViewDetails.add(benefitDetails);
        //  }
      }
      return benefitOverViewDetails;
    }
}

class ObjProspect {
    dynamic productId;
    dynamic clientCode;
    bool isClientExist;
    dynamic isClientExistFromService;
    dynamic dob;
    dynamic exisitingAdvisorName;
    dynamic userName;
    bool isForServices;
    dynamic type;
    dynamic salutation;
    dynamic name;
    dynamic lastName;
    dynamic mobile;
    dynamic email;
    dynamic work;
    dynamic mobileCountryCode;
    dynamic homeCountryCode;
    dynamic workCountryCode;
    dynamic lstCountryCode;
    dynamic home;
    int age;
    String dateofBirth;
    bool isQuoteCreated;
    dynamic strDateofBirth;
    int occupation;
    dynamic employerName;
    dynamic nic;
    String gender;
    dynamic maritalStatus;
    dynamic displayMaritalStatus;
    dynamic avgMonthlyIncome;
    dynamic qutotaionCreatedDate;
    dynamic njevChildName;
    bool isDeleted;
    dynamic message;
    int contactId;
    int stageId;
    dynamic objAddress;
    ObjNeedAnalysis objNeedAnalysis;
    dynamic existsContactId;
    dynamic isQuickQuote;
    dynamic isPremiumQuickQuote;
    dynamic signature;
    dynamic byteArray;
    bool isExisitingClint;
    dynamic objSuspectPool;
    dynamic listSuspectPool;
    dynamic lstDecision;
    dynamic lstReportee;
    dynamic lstDownloadSuspectInfo;
    dynamic objProspectReAllocate;
    dynamic objProspectPool;
    bool isConfirmedProspect;
    bool isNeedAnalysisCompleted;
    int prospectStage;
    dynamic reasonForRemove;
    dynamic listPlan;
    dynamic lstSalutation;
    dynamic lstOccupation;
    dynamic lstGender;
    dynamic maritalStatuslist;
    dynamic lstRelations;
    dynamic lstMotorVehicle;
    dynamic lstDependentRelationship;
    dynamic lstAvgMonthlyIncome;
    dynamic lstCurrentStatus;
    dynamic lstNeedsPriority;
    dynamic lstPurposeOfMeeting;
    bool isApproved;
    dynamic isClientExistInNeedAnalysis;
    ObjProspect({
        this.productId,
        this.clientCode,
        this.isClientExist,
        this.isClientExistFromService,
        this.dob,
        this.exisitingAdvisorName,
        this.userName,
        this.isForServices,
        this.type,
        this.salutation,
        this.name,
        this.lastName,
        this.mobile,
        this.email,
        this.work,
        this.mobileCountryCode,
        this.homeCountryCode,
        this.workCountryCode,
        this.lstCountryCode,
        this.home,
        this.age,
        this.dateofBirth,
        this.isQuoteCreated,
        this.strDateofBirth,
        this.occupation,
        this.employerName,
        this.nic,
        this.gender,
        this.maritalStatus,
        this.displayMaritalStatus,
        this.avgMonthlyIncome,
        this.qutotaionCreatedDate,
        this.njevChildName,
        this.isDeleted,
        this.message,
        this.contactId,
        this.stageId,
        this.objAddress,
        this.objNeedAnalysis,
        this.existsContactId,
        this.isQuickQuote,
        this.isPremiumQuickQuote,
        this.signature,
        this.byteArray,
        this.isExisitingClint,
        this.objSuspectPool,
        this.listSuspectPool,
        this.lstDecision,
        this.lstReportee,
        this.lstDownloadSuspectInfo,
        this.objProspectReAllocate,
        this.objProspectPool,
        this.isConfirmedProspect,
        this.isNeedAnalysisCompleted,
        this.prospectStage,
        this.reasonForRemove,
        this.listPlan,
        this.lstSalutation,
        this.lstOccupation,
        this.lstGender,
        this.maritalStatuslist,
        this.lstRelations,
        this.lstMotorVehicle,
        this.lstDependentRelationship,
        this.lstAvgMonthlyIncome,
        this.lstCurrentStatus,
        this.lstNeedsPriority,
        this.lstPurposeOfMeeting,
        this.isApproved,
        this.isClientExistInNeedAnalysis,
    });

    ObjProspect.formJson(Map sectionSubsectionDetails){
      productId = null;
      clientCode = null;
      isClientExist = false;
      isClientExistFromService = null;
      dob = null;
      exisitingAdvisorName = null;
      userName = null;
      isForServices = false;
      type = null;
      salutation = null;
      name = null;
      lastName = null;
      mobile = null;
      email = null;
      work = null;
      mobileCountryCode = null;
      homeCountryCode = null;
      workCountryCode = null;
      lstCountryCode = null;
      home = null;
      age = 31;
      dateofBirth = "1989-08-26T00:00:00";
      isQuoteCreated = false;
      strDateofBirth = null;
      occupation = 2;
      employerName = null;
      nic  = null;
      gender = "20";
      maritalStatus = null;
      displayMaritalStatus = null;
      avgMonthlyIncome = null;
      qutotaionCreatedDate = null;
      njevChildName = null;
      isDeleted = false;
      message = null;
      contactId = 0;
      stageId = 0;
      objAddress = null;
      objNeedAnalysis = ObjNeedAnalysis.formJson(sectionSubsectionDetails);
      existsContactId = null;
      isQuickQuote = null;
      isPremiumQuickQuote = null;
      signature = null;
      byteArray = null;
      isExisitingClint = false;
      objSuspectPool = null;
      listSuspectPool = null;
      lstDecision = null;
      lstReportee = null;
      lstDownloadSuspectInfo = null;
      objProspectReAllocate = null;
      objProspectPool = null;
      isConfirmedProspect = false;
      isNeedAnalysisCompleted = false;
      prospectStage = 0;
      reasonForRemove = null;
      listPlan = null;
      lstSalutation = null;
      lstOccupation = null;
      lstGender = null;
      maritalStatuslist = null;
      lstRelations = null;
      lstMotorVehicle = null;
      lstDependentRelationship = null;
      lstAvgMonthlyIncome = null;
      lstCurrentStatus = null;
      lstNeedsPriority = null;
      lstPurposeOfMeeting = null;
      isApproved = false;
      isClientExistInNeedAnalysis = null;
    }

    Map toJson()=>{
      "ProductId" : productId,
      "ClientCode" : clientCode,
      "IsClientExist" : isClientExist,
      "IsClientExistFromService" : isClientExistFromService,
      "DOB" : dob,
      "ExisitingAdvisorName" : exisitingAdvisorName,
      "UserName" : userName,
      "IsForServices" : isForServices,
      "Type" : type,
      "Salutation" : salutation,
      "Name" : name,
      "LastName" : lastName,
      "Mobile" : mobile,
      "Email" : email,
      "Work" : work,
      "MobileCountryCode" : mobileCountryCode,
      "HomeCountryCode" : homeCountryCode,
      "WorkCountryCode" : workCountryCode,
      "LstCountryCode" : lstCountryCode,
      "Home" : home,
      "Age" : age,
      "DateofBirth" : dateofBirth,
      "IsQuoteCreated" : isQuoteCreated,
      "STRDateofBirth" : strDateofBirth,
      "Occupation" : occupation,
      "EmployerName" : employerName,
      "NIC"  : nic,
      "Gender" : gender,
      "MaritalStatus" : maritalStatus,
      "DisplayMaritalStatus" : displayMaritalStatus,
      "AvgMonthlyIncome" : avgMonthlyIncome,
      "QutotaionCreatedDate" : qutotaionCreatedDate,
      "NJEVChildName" : njevChildName,
      "IsDeleted" : isDeleted,
      "Message" : message,
      "ContactID" : contactId,
      "StageId" : stageId,
      "objAddress" : objAddress,
      "objNeedAnalysis" : objNeedAnalysis.toJson(),
      "ExistsContactID" : existsContactId,
      "isQuickQuote" : isQuickQuote,
      "isPremiumQuickQuote" : isPremiumQuickQuote,
      "Signature" : signature,
      "ByteArray" : byteArray,
      "IsExisitingClint" : isExisitingClint,
      "ObjSuspectPool" : objSuspectPool,
      "listSuspectPool" : listSuspectPool,
      "lstDecision" : lstDecision,
      "lstReportee" : lstReportee,
      "lstDownloadSuspectInfo" : lstDownloadSuspectInfo,
      "ObjProspectReAllocate" : objProspectReAllocate,
      "ObjProspectPool" : objProspectPool,
      "IsConfirmedProspect" : isConfirmedProspect,
      "IsNeedAnalysisCompleted" : isNeedAnalysisCompleted,
      "ProspectStage" : prospectStage,
      "ReasonForRemove" : reasonForRemove,
      "ListPlan" : listPlan,
      "lstSalutation" : lstSalutation,
      "lstOccupation" : lstOccupation,
      "lstGender" : lstGender,
      "MaritalStatuslist" : maritalStatuslist,
      "lstRelations" : lstRelations,
      "lstMotorVehicle" : lstMotorVehicle,
      "lstDependentRelationship" : lstDependentRelationship,
      "lstAvgMonthlyIncome" : lstAvgMonthlyIncome,
      "lstCurrentStatus" : lstCurrentStatus,
      "lstNeedsPriority" : lstNeedsPriority,
      "lstPurposeOfMeeting" : lstPurposeOfMeeting,
      "isApproved" : isApproved,
      "IsClientExistInNeedAnalysis" : isClientExistInNeedAnalysis
    };
}

//MARK:- ObjNeedAnalysis
class ObjNeedAnalysis {

    double needAnalysisId;
    dynamic prospectDob;
    FNAObjSpouseDetails objSpouseDetails;
    List<dynamic> objDependents;
    dynamic objEstimateDetails;
    dynamic objAssetsAndLiabilities;
    ObjFamilyIncome objFamilyIncome;
    dynamic objNeeds;
    dynamic total;
    dynamic productSelected;
    dynamic comments;
    dynamic needAnalysisFileAttachment;
    dynamic dateOfNextMeeting;
    dynamic timeOfNextMeeting;
    dynamic purposeOfMeeting;
    dynamic purposeOfMeeting1;
    dynamic uploadSignPath;
    dynamic prospectSign;
    dynamic createdDate;
    dynamic selectedProducts;

    ObjNeedAnalysis({
        this.needAnalysisId,
        this.prospectDob,
        this.objSpouseDetails,
        this.objDependents,
        this.objEstimateDetails,
        this.objAssetsAndLiabilities,
        this.objFamilyIncome,
        this.objNeeds,
        this.total,
        this.productSelected,
        this.comments,
        this.needAnalysisFileAttachment,
        this.dateOfNextMeeting,
        this.timeOfNextMeeting,
        this.purposeOfMeeting,
        this.purposeOfMeeting1,
        this.uploadSignPath,
        this.prospectSign,
        this.createdDate,
        this.selectedProducts,
    });

    ObjNeedAnalysis.formJson(Map sectionSubsectionDetails){
        needAnalysisId =  0.0;
        prospectDob = null;
        objSpouseDetails = FNAObjSpouseDetails.formJson(sectionSubsectionDetails);
        objDependents = [];
        objEstimateDetails = null;
        objAssetsAndLiabilities = null;
        objFamilyIncome = ObjFamilyIncome.formJson(sectionSubsectionDetails);
        objNeeds = null;
        total = null;
        productSelected = null;
        comments = null;
        needAnalysisFileAttachment = null;
        dateOfNextMeeting = null;
        timeOfNextMeeting = null;
        purposeOfMeeting = null;
        purposeOfMeeting1 = null;
        uploadSignPath = null;
        prospectSign = null;
        createdDate  = null;
        selectedProducts = null;
    }

    Map toJson()=>{
      "NeedAnalysisID" : needAnalysisId,
      "ProspectDOB" : prospectDob,
      "objSpouseDetails" : objSpouseDetails.toJson(),
      "objDependents" : objDependents,
      "objEstimateDetails" : objEstimateDetails,
      "objAssetsAndLiabilities" : objAssetsAndLiabilities,
      "objFamilyIncome" : objFamilyIncome.toJoson(),
      "objNeeds" : objNeeds,
      "Total" : total,
      "ProductSelected" : productSelected,
      "Comments" : comments,
      "NeedAnalysisFileAttachment" : needAnalysisFileAttachment,
      "DateOfNextMeeting" : dateOfNextMeeting,
      "TimeOfNextMeeting" : timeOfNextMeeting,
      "PurposeOfMeeting" : purposeOfMeeting,
      "PurposeOfMeeting1" : purposeOfMeeting1,
      "UploadSignPath" : uploadSignPath,
      "ProspectSign" : prospectSign,
      "CreatedDate" : createdDate,
      "SelectedProducts" : selectedProducts
    };
}

class FNAObjSpouseDetails {
    dynamic fullName;
    dynamic dateOfBirth;
    int age;
    dynamic maritialStatus;
    dynamic occuaptionId;
    dynamic employer;
    int contactId;

    FNAObjSpouseDetails({
        this.fullName,
        this.dateOfBirth,
        this.age,
        this.maritialStatus,
        this.occuaptionId,
        this.employer,
        this.contactId,
    });

    FNAObjSpouseDetails.formJson(Map sectionSubsectionDetails){
      fullName  = null;
      dateOfBirth = null;
      age = 0;
      maritialStatus = null;
      occuaptionId = null;
      employer = null;
      contactId = 0;
    }

    Map toJson()=>{
      "FullName" : fullName,
      "DateOfBirth" : dateOfBirth,
      "Age" : age,
      "MaritialStatus" : maritialStatus,
      "OccuaptionID" : occuaptionId,
      "Employer" : employer,
      "ContactID" : contactId
    };
}

//objFamilyIncome
class ObjFamilyIncome{
  dynamic prospectMonthlyIncome;
  dynamic spouseMonthlyIncome;
  dynamic houseHoldTotal;
  dynamic capitalReq;
  dynamic personalLifeInsurance;
  dynamic savingsAndInvestments;
  dynamic totalProtection;
  dynamic gapIdentified;
  dynamic totalDeath;
  dynamic totalAccidental;
  dynamic totalCritical;
  dynamic totalHospitalization;
  dynamic totalHospitalizationReimbersement;
  int rateOfInterest;
  dynamic objLstPrevInsuranceDetails;
  dynamic isOtherInsurance;
  dynamic noOfJanashaktiPolicy;
  dynamic noOfOtherPolicies;

  ObjFamilyIncome({
    this.prospectMonthlyIncome,
    this.spouseMonthlyIncome,
    this.houseHoldTotal,
    this.capitalReq,
    this.personalLifeInsurance,
    this.savingsAndInvestments,
    this.totalProtection,
    this.gapIdentified,
    this.totalDeath,
    this.totalAccidental,
    this.totalCritical,
    this.totalHospitalization,
    this.totalHospitalizationReimbersement,
    this.rateOfInterest,
    this.objLstPrevInsuranceDetails,
    this.isOtherInsurance,
    this.noOfJanashaktiPolicy,
    this.noOfOtherPolicies
  });

  ObjFamilyIncome.formJson(Map sectionSubsectionDetails){
    prospectMonthlyIncome = null;
    spouseMonthlyIncome = null;
    houseHoldTotal = null;
    capitalReq = null;
    personalLifeInsurance = null;
    savingsAndInvestments = null;
    totalProtection = null;
    gapIdentified = null;
    totalDeath = null;
    totalAccidental = null;
    totalCritical = null;
    totalHospitalization = null;
    totalHospitalizationReimbersement = null;
    rateOfInterest = 0;
    objLstPrevInsuranceDetails = null;
    isOtherInsurance = null;
    noOfJanashaktiPolicy = null;
    noOfOtherPolicies = null;
  }

  Map toJoson()=>{
    "ProspectMonthlyIncome" : prospectMonthlyIncome,
    "SpouseMonthlyIncome" : spouseMonthlyIncome,
    "HouseHoldTotal" : houseHoldTotal,
    "CapitalReq" : capitalReq,
    "PersonalLifeInsurance" : personalLifeInsurance,
    "SavingsAndInvestments" : savingsAndInvestments,
    "TotalProtection" : totalProtection,
    "GapIdentified" : gapIdentified,
    "TotalDeath" : totalDeath,
    "TotalAccidental" : totalAccidental,
    "TotalCritical" : totalCritical,
    "TotalHospitalization" : totalHospitalization,
    "TotalHospitalizationReimbersement" : totalHospitalizationReimbersement,
    "RateOfInterest" : rateOfInterest,
    "objLstPrevInsuranceDetails" : objLstPrevInsuranceDetails,
    "IsOtherInsurance" : isOtherInsurance,
    "NoOfJanashaktiPolicy" : noOfJanashaktiPolicy,
    "NoOfOtherPolicies" : noOfOtherPolicies
  };
}

class ObjProductDetials {
    dynamic plan;
    dynamic planCode;
    dynamic planDescription;
    dynamic policyTerm;
    dynamic premiumTerm;
    dynamic preferredLangauage;
    dynamic preferredMode;
    dynamic contributionPremium;
    dynamic basicSumInsured;
    dynamic lSPContributionPremium;
    dynamic lSPBasicSumInsured;

    ObjProductDetials({
      this.plan,
      this.planCode,
      this.planDescription,
      this.policyTerm,
      this.premiumTerm,
      this.preferredLangauage,
      this.preferredMode,
      this.contributionPremium,
      this.basicSumInsured,
      this.lSPContributionPremium,
      this.lSPBasicSumInsured
    });

    ObjProductDetials.formJson(Map sectionSubsectionDetails){
      final productDetails  = sectionSubsectionDetails[1016];
      plan  = (productDetails[1] as SectionSubSection).fieldValue;
      planCode = (productDetails[2]as SectionSubSection).fieldValue;
      planDescription = "A unique life insurance policy, which increases the cover by 10% every year to provide for increasing needs and the effects of inflation.";
      policyTerm = (productDetails[3]as SectionSubSection).fieldValue;
      premiumTerm = (productDetails[4] as SectionSubSection).fieldValue;
      preferredLangauage = (productDetails[5] as SectionSubSection).fieldValue;
      preferredMode = (productDetails[6] as SectionSubSection).fieldValue;
      contributionPremium = (productDetails[7]as SectionSubSection).fieldValue;
      basicSumInsured = null;
      lSPContributionPremium = null;
      lSPBasicSumInsured = null;
    }
    
    Map toJson()=>{
      "Plan" : plan,
      "PlanCode": planCode,
      "PlanDescription": planDescription,
      "PolicyTerm": policyTerm,
      "PremiumTerm": premiumTerm,
      "PreferredLangauage": preferredLangauage,
      "PreferredMode": preferredMode,
      "ContributionPremium": contributionPremium,
      "BasicSumInsured": basicSumInsured,
      "LSPContributionPremium": lSPContributionPremium,
      "LSPBasicSumInsured": lSPBasicSumInsured
    };

    retrunPlanNameWithPlanCode(String code) async {
      List<FieldData> fieldDataDetails = await DBHelper().getFieldDataWithFieldDataID( code,1088);
      if (fieldDataDetails.length > 0) {
       final fieldDataDetail = fieldDataDetails[0];
       return fieldDataDetail.fieldValue;
      }
    }
}

class ObjSpouseDetails {
    int age;
    dynamic dateOfBirth;
    dynamic nicNo;
    dynamic gender;
    dynamic occupation;
    dynamic assuredName;

    ObjSpouseDetails({
        this.age,
        this.dateOfBirth,
        this.nicNo,
        this.gender,
        this.occupation,
        this.assuredName,
    });

    ObjSpouseDetails.formJson(Map sectionSubsectionDetails){
      final spouseDetails = sectionSubsectionDetails[1016];
      age = 0;//((spouseDetails[16] as SectionSubSection).fieldValue).length > 0 ? int.parse((spouseDetails[16] as SectionSubSection).fieldValue): 0;
      dateOfBirth = null;//(spouseDetails[15]as SectionSubSection).fieldValue;
      nicNo = (spouseDetails[14]as SectionSubSection).fieldValue;
      gender = null;//(spouseDetails[13]as SectionSubSection).fieldValue;
      occupation = ((spouseDetails[17]as SectionSubSection).fieldValue.length <= 0) ? "2" : (spouseDetails[17]as SectionSubSection).fieldValue;
      assuredName  = null;//(spouseDetails[12]as SectionSubSection).fieldValue;
    }

    Map toJson()=>{
      "Age" : age,
      "DOB" : dateOfBirth,
      "NICNo" : nicNo,
      "Gender" : gender,
      "Occupation" : occupation,
      "AssuredName" : assuredName,
    };
}

class ObjBusinessPartnerDetials {
    int age;
    dynamic dateOfBirth;
    dynamic nicNo;
    dynamic gender;
    dynamic occupation;
    dynamic name;

    ObjBusinessPartnerDetials({
        this.age,
        this.dateOfBirth,
        this.nicNo,
        this.gender,
        this.occupation,
        this.name,
    });

    ObjBusinessPartnerDetials.formJson(Map sectionSubsectionDetails){
      final spouseDetails = sectionSubsectionDetails[1016];
      age = 0;//((spouseDetails[16] as SectionSubSection).fieldValue).length > 0 ? int.parse((spouseDetails[16] as SectionSubSection).fieldValue): 0;
      dateOfBirth = null;//(spouseDetails[15]as SectionSubSection).fieldValue;
      nicNo = (spouseDetails[14]as SectionSubSection).fieldValue;
      gender = null;//(spouseDetails[13]as SectionSubSection).fieldValue;
      occupation = (spouseDetails[17]as SectionSubSection).fieldValue;
      name  = null;//(spouseDetails[12]as SectionSubSection).fieldValue;
    }

    Map toJson()=>{
      "Age" : age,
      "DOB" : dateOfBirth,
      "NICNo" : nicNo,
      "Gender" : gender,
      "Occupation" : occupation,
      "Name" : name,
    };
}

class ObjLoanBorrowerDetials {
    int age;
    dynamic dateOfBirth;
    dynamic nicNo;
    dynamic gender;
    dynamic occupation;
    dynamic name;

    ObjLoanBorrowerDetials({
        this.age,
        this.dateOfBirth,
        this.nicNo,
        this.gender,
        this.occupation,
        this.name,
    });

    ObjLoanBorrowerDetials.formJson(Map sectionSubsectionDetails){
      final spouseDetails = sectionSubsectionDetails[1016];
      age = 0;//((spouseDetails[16] as SectionSubSection).fieldValue).length > 0 ? int.parse((spouseDetails[16] as SectionSubSection).fieldValue): 0;
      dateOfBirth = null;//(spouseDetails[15]as SectionSubSection).fieldValue;
      nicNo = (spouseDetails[14]as SectionSubSection).fieldValue;
      gender = null;//(spouseDetails[13]as SectionSubSection).fieldValue;
      occupation = (spouseDetails[17]as SectionSubSection).fieldValue;
      name  = null;//(spouseDetails[12]as SectionSubSection).fieldValue;
    }

    Map toJson()=>{
      "Age" : age,
      "DOB" : dateOfBirth,
      "NICNo" : nicNo,
      "Gender" : gender,
      "Occupation" : occupation,
      "Name" : name,
    };
}

class ObjChildDetials {
    dynamic childName;
		dynamic	childDOB;
		dynamic	sumAssured;
		dynamic	assured;
		dynamic	relationship;
		dynamic	occupation;
		dynamic	nicNo;
		dynamic	isCashlessapplicable;
		int	age;
		dynamic	currentAge;
		dynamic	isDeleted;
		dynamic	childCount;

    ObjChildDetials({
      this.childName,
			this.childDOB,
			this.sumAssured,
			this.assured,
			this.relationship,
			this.occupation,
			this.nicNo,
			this.isCashlessapplicable,
			this.age,
			this.currentAge,
			this.isDeleted,
			this.childCount
    });

    ObjChildDetials.formJson(childDetials){
      childName = childDetials["ChildName"];
			childDOB = childDetials["ChildDOB"];
			sumAssured = null;
			assured = null;
			relationship = childDetials["Relationship"];
			occupation = null;
			nicNo = null;
			isCashlessapplicable = null;
			age = (childDetials["Age"].length > 0) ? int.parse(childDetials["Age"]) : 0;
			currentAge = null;
			isDeleted = false;
			childCount = 0;
    }

    Map toJson()=>{
      "ChildName": childName,
			"ChildDOB": childDOB,
			"SumAssured": sumAssured,
			"Assured": assured,
			"Relationship": relationship,
			"Occupation": occupation,
			"NICNo": nicNo,
			"isCashlessapplicable": isCashlessapplicable,
			"Age": age,
			"CurrentAge": currentAge,
			"IsDeleted": isDeleted,
			"ChildCount": childCount
    };
}

class ObjQuoteMemberDetail {
    dynamic basicSumInsured;
		dynamic	assured;
		dynamic	relationship;
		dynamic	memberIndex;
		int memberOccupation;
		int age;
		dynamic	childRelationship;
		dynamic	memberName;
		dynamic	memberDOB;
		dynamic	tabIndex;
		bool isBenefitRequested;
		List<dynamic>	objBenefitDetails;
		dynamic	hospitalizationAvailabilit;
		dynamic  memberPremium;

    ObjQuoteMemberDetail({
      this.basicSumInsured,
			this.assured,
			this.relationship,
			this.memberIndex,
			this.memberOccupation,
			this.age,
			this.childRelationship,
			this.memberName,
			this.memberDOB,
			this.tabIndex,
			this.isBenefitRequested,
			this.objBenefitDetails,
			this.hospitalizationAvailabilit,
		  this.memberPremium
    });
    
    ObjQuoteMemberDetail.formJson(memberDetails){
      basicSumInsured = memberDetails["BasicSumInsured"];
			assured = memberDetails["Assured"];
			relationship = memberDetails["Relationship"];
			memberIndex = memberDetails["MemberIndex"];
			memberOccupation = memberDetails["MemberOccupation"];
			age = (memberDetails["Age"].length > 0) ? int.parse(memberDetails["Age"]) : 0;
			childRelationship = memberDetails["ChildRelationship"];
			memberName = memberDetails["MemberName"];
			memberDOB = memberDetails["MemberDOB"];
			tabIndex = memberDetails["TabIndex"];
			isBenefitRequested = memberDetails["IsBenefitRequested"];
			objBenefitDetails = [];
			hospitalizationAvailabilit = memberDetails["HospitalizationAvailability"];
		  memberPremium = memberDetails["MemberPremium"];
    }

    Map toJson()=>{
      "BasicSumInsured": basicSumInsured,
			"Assured": assured,
			"Relationship": relationship,
			"MemberIndex": memberIndex,
			"MemberOccupation": memberOccupation,
			"Age": age,
			"ChildRelationship": childRelationship,
			"MemberName": memberName,
			"MemberDOB": memberDOB,
			"TabIndex": tabIndex,
			"IsBenefitRequested": isBenefitRequested,
			"ObjBenefitDetails": objBenefitDetails,
			"HospitalizationAvailability": hospitalizationAvailabilit,
			"MemberPremium": memberPremium
    };
}

class LstBenefitOverView {
  int  memberBenifitID;
	int	benefitID;
	dynamic	riderImagePath;
  dynamic  benifitName;
  dynamic  benifitCode;
  dynamic  assuredMember;
  dynamic  benifitOpted;
  dynamic  riderSuminsured;
	bool	benefitAvailability;
  dynamic  isCashlessapplicable;
  List<ObjBenefitMemberRelationship> objBenefitMemberRelationship;
  dynamic  riderCode;
  dynamic  minSumInsured;
  dynamic  maxSumInsured;
  dynamic  riderPremium;
	int	riderProductID;
  dynamic  relationshipWithProspect;
  dynamic  description;
  dynamic  multiple;
  dynamic  order;

    LstBenefitOverView({
      this.memberBenifitID,
			this.benefitID,
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
			this.riderProductID,
			this.relationshipWithProspect,
			this.description,
			this.multiple,
			this.order,
    });

    LstBenefitOverView.formJson(Map sectionSubsectionDetails, RiderMaster riderDetails,String value,int currentPage){
      memberBenifitID = 0;
			benefitID = (riderDetails.benefitID.length > 0) ? int.parse(riderDetails.benefitID) : 0;
			riderImagePath = "~/Content/Images/Base Sum Assured.png";
			benifitName = riderDetails.benefitName;
			benifitCode = riderDetails.benefitCode;
			assuredMember = null;
			benifitOpted = false;
			riderSuminsured = null;
			benefitAvailability = false;
			isCashlessapplicable = null;
      objBenefitMemberRelationship = returnObjBenefitMemberRelationship(sectionSubsectionDetails,riderDetails,value,currentPage);
      riderCode = riderDetails.riderCode;
			minSumInsured = null;
			maxSumInsured = null;
			riderPremium = null;
			riderProductID = 0;
			relationshipWithProspect = null;
			description = riderDetails.description;
			multiple = null;
			order = null;
    }

    Map toJson()=>{
      "MemberBenifitID": memberBenifitID,
			"BenefitID": benefitID,
			"RiderImagePath": riderImagePath,
			"BenifitName": benifitName,
			"BenifitCode": benifitCode,
			"AssuredMember": assuredMember,
			"BenifitOpted": benifitOpted,
			"RiderSuminsured": riderSuminsured,
			"BenefitAvailability": benefitAvailability,
			"isCashlessapplicable": isCashlessapplicable,
      "objBenefitMemberRelationship": List<dynamic>.from(objBenefitMemberRelationship.map((e) => e.toJson())),
      "RiderCode": riderCode,
			"MinSumInsured": minSumInsured,
			"MaxSumInsured": maxSumInsured,
			"RiderPremium": riderPremium,
			"RiderProductID": riderProductID,
			"RelationshipWithProspect": relationshipWithProspect,
			"Description": description,
			"Multiple": multiple,
			"Order": order
    };

    List<ObjBenefitMemberRelationship> returnObjBenefitMemberRelationship(_subSectionDetails,RiderMaster riderDetails,String value,int currentPage) {
      List<ObjBenefitMemberRelationship> memberDetails = [];
      var memeberCount = 1;
      //Marital status
      final maritalStatusXndex = returnIndexWithField(1144,_subSectionDetails[1009]); 
      var maritalStatusData = (_subSectionDetails[1009][maritalStatusXndex] as SectionSubSection);
      if(maritalStatusData.fieldValue == "14") {
        memeberCount = memeberCount + 1;
      }
      final dependentIndex = returnIndexWithField(1168,_subSectionDetails[1010]); 
      var dependentData = (_subSectionDetails[1010][dependentIndex] as SectionSubSection);
      if(dependentData.fieldValue.length > 0){
         var tempArray = [];
        final decodeDetails = json.decode(dependentData.fieldValue);
        if (decodeDetails.length > 0){
            for(final value in decodeDetails){
              final decode = jsonDecode(value);
              tempArray.add(decode);
          }
          memeberCount = memeberCount + tempArray.length;
        }
      }
      for(var i = 0 ; i < memeberCount ; i++ ){
        ObjBenefitMemberRelationship objMemberDetails = ObjBenefitMemberRelationship.formJson(_subSectionDetails, i,riderDetails,value,currentPage);
        memberDetails.add(objMemberDetails);
      }
      return memberDetails;
    }
}

class ObjBenefitMemberRelationship {
    int policyMemberBenefitID;
    dynamic riderSI;
    dynamic memberRelationship;
    dynamic riderPremium;
    dynamic assuredName;
    bool riderAvailability;

    ObjBenefitMemberRelationship({
      this.policyMemberBenefitID,
      this.riderSI,
      this.memberRelationship,
      this.riderPremium,
      this.assuredName,
      this.riderAvailability,
    });

    ObjBenefitMemberRelationship.formJson(Map sectionSubsectionDetails, int i,RiderMaster riderDetails,String value,int currentPage){
      policyMemberBenefitID = 0;
      riderSI = (i == currentPage && riderDetails.benefitCode == "BSA") ? int.parse(value.replaceAll(',', '')) : null;
      memberRelationship = returnMemebrWithIdWithIndex(i);
      riderPremium = null;
      assuredName = returnAssuredWithIdWithIndex(i);
      riderAvailability = true;
    }

    Map toJson()=>{
      "PolicyMemberBenefitID": policyMemberBenefitID,
      "RiderSI": riderSI,
      "Member_Relationship": memberRelationship,
      "Rider_Premium": riderPremium,
      "Assured_Name": assuredName,
      "RiderAvailability": riderAvailability
    };
}