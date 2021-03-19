
import 'dart:convert';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_util/Constant.dart';

import 'package:intl/intl.dart';

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
          case 4:
            return "271"; 
          case 5:
            return "272";        
          case 5:
            return "273";   
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

class SaveQuote{
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
    int memberIndex;
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

    SaveQuote({
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

    SaveQuote.formJson(Map sectionSubsectionDetails,Map benifitOverViewDetails, Map riderDetails,int currentPage,String quotationNo,String contactID,String username,dynamic tempJsonObject){
      final premiumObject = jsonDecode(tempJsonObject.premiumObject);
      final quotationNoList = (quotationNo.length > 0) ? quotationNo.split("-")  : [];
      final newQuoteNumber = (quotationNoList.length > 0) ? (int.parse(quotationNoList[1][1]) + 1) : 0;
      final tempVersionNumber = newQuoteNumber > 9 ? newQuoteNumber.toString() :  "0$newQuoteNumber";
      final nextQuoteNumber = (quotationNo.length > 0) ? ((quotationNoList[0] as String) + "-" + tempVersionNumber) : null;
      isQuickQuote = null;
      childCount = 0;
      isForServices = false;
      quoteIndex = 2;
      lstIllustation = null;
      objProspect = ObjProspect.formJson(sectionSubsectionDetails);
      objProductDetials = ObjProductDetials.formJson(sectionSubsectionDetails,benifitOverViewDetails);
      age = 31;
      spouseOccupationClass = "CLASS-I ";
      spouseOccupationCode = null;
      cess = premiumObject["Cess"];
      policyFee = premiumObject["PolicyFee"];
      vat = premiumObject["VAT"];
      annualPremium = premiumObject["AnnualPremium"];
      halfYearlyPremium = premiumObject["HalfYearlyPremium"];
      quaterlyPremium = premiumObject["QuaterlyPremium"];
      monthlyPremium = premiumObject["MonthlyPremium"];
      singlePremium = premiumObject["SinglePremium"];
      basicSumInsured = premiumObject["BasicSumInsured"];
      quotePremium = premiumObject["QuotePremium"];
      basicPremium = premiumObject["BasicPremium"];
      productBasicPremium = premiumObject["ProductBasicPremium"];
      totalPremium = premiumObject["TotalPremium"];
      tClientPremium = premiumObject["tClientPremium"];
      basicPackageRiderPremium = null;
      investmentPremium = premiumObject["InvestmentPremium"];
      protectionPremium = premiumObject["ProtectionPremium"];
      investmentTotalPremium = premiumObject["InvestmentTotalPremium"];
      totalRiderPremium = premiumObject["totalRiderPremium"];
      contributionAmtCess = premiumObject["ContributionAmtCess"];
      premiumCess = premiumObject["PremiumCess"];
      contactid = int.parse(contactID);
      isInsuranceCovered = ((sectionSubsectionDetails[1016][8] as SectionSubSection).fieldValue == "1") ? true : true;
      contributionAmount = (sectionSubsectionDetails[1016][7] as SectionSubSection).fieldValue;
      isSelfMedicalBenefit = null;
      isBenefitReceivingPeriod = null;
      isCoverAppliedFor = null;
      isSelfCovered = true;
      isSpouseCovered = ((sectionSubsectionDetails[1016][11] as SectionSubSection).fieldValue == "1") ? true : null;
      isChildCovered = ((sectionSubsectionDetails[1016][18] as SectionSubSection).fieldValue == "1") ? true : null;
      isNeedsIdentified = false;
      isModifyQuote = (quotationNo.length > 0) ? true : false;
      isCashLessSelf = (((sectionSubsectionDetails[1016][27] as SectionSubSection).fieldValue == "1") || ((sectionSubsectionDetails[1016][27] as SectionSubSection).fieldValue == "2")) ? true : null;
      isCashLessSumAssured = ((sectionSubsectionDetails[1016][28] as SectionSubSection).fieldValue == "1") ? true : null;
      isCashlessNone = ((sectionSubsectionDetails[1016][27] as SectionSubSection).fieldValue == "3") ? true : false;
      noofChilds = (sectionSubsectionDetails[1016][19] as SectionSubSection).fieldValue;
      noofCashLessChildren = (sectionSubsectionDetails[1016][19] as SectionSubSection).fieldValue;
      lifetobeAssuredDd = null;
      lifetobeAssuredDdNo = null;
      objSpouseDetials = ObjSpouseDetails.formJson(sectionSubsectionDetails);
      objBusinessPartnerDetials = ObjBusinessPartnerDetials.formJson(sectionSubsectionDetails);
      objLoanBorrowerDetials = ObjLoanBorrowerDetials.formJson(sectionSubsectionDetails);
      objChildDetials = List<ObjChildDetials>.from(returnChildDetails(sectionSubsectionDetails).map((e) => ObjChildDetials.formJson(e)));
      objEighteenPlusChildDetials = null;
      strHtml = null;
      strPremiumHtml = null;
      userName = username;
      quoteNo = nextQuoteNumber;//(quotationNo.length > 0) ? quotationNo : null;
      message = null;
      listAssured = returnLifeToBeAssured(sectionSubsectionDetails);
      panelIndex = null;
      selectedMember = null;
      memberIndex = 0;
      quoteVersion = int.parse(tempVersionNumber);
      isPremiumCall = false;
      minEntryAge = 18;
      maxEntryAge = 60;
      maturityAge = 70;
      cashlessRiderChildren = null;
      objQuoteMemberDetails = List<ObjQuoteMemberDetail>.from(returnObjMemberDetails(sectionSubsectionDetails,benifitOverViewDetails,tempJsonObject).map((e) => ObjQuoteMemberDetail.formJson(e)));
      listPlan = null;
      lstPolicyTerm = null;
      lstPremiumTerm = null;
      lstLanguage = null;
      lstCountryCode = null;
      lstPrefMode = null;
      lstBenefitOverView = returnBenfitOverView(sectionSubsectionDetails, riderDetails,currentPage,benifitOverViewDetails);
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

    String _returnMemberName(int _index,Map _sectionSubSectionDetails,bool _isSpouseCovered,List _childDetails){
    switch (_index) {
      case 0:
       return (_sectionSubSectionDetails[1009][3] as SectionSubSection).fieldValue;
      default:
      if(_isSpouseCovered && _index == 1){
        return (_sectionSubSectionDetails[1010][10] as SectionSubSection).fieldValue;
      }else{
        return _childDetails[((_isSpouseCovered) ? _index - 2 : _index - 1)]["0"];
      }
    }
  }

  String _returnMemberDOB(int _index,Map _sectionSubSectionDetails,bool _isSpouseCovered,List _childDetails){
    switch (_index) {
      case 0:
       return (_sectionSubSectionDetails[1009][7] as SectionSubSection).fieldValue;
      default:
      if(_isSpouseCovered && _index == 1){
        return (_sectionSubSectionDetails[1010][11] as SectionSubSection).fieldValue;
      }else{
        return _childDetails[((_isSpouseCovered) ? _index - 2 : _index - 1)]["2"];
      }
    }
  }

  String _returnAge(int _index,Map _sectionSubSectionDetails,bool _isSpouseCovered,List _childDetails){
    switch (_index) {
      case 0:
       return (_sectionSubSectionDetails[1009][8] as SectionSubSection).fieldValue;
      default:
      if(_isSpouseCovered && _index == 1){
        return (_sectionSubSectionDetails[1010][12] as SectionSubSection).fieldValue;
      }else{
        return _childDetails[((_isSpouseCovered) ? _index - 2 : _index - 1)]["3"];
      }
    }
  }


    List returnObjMemberDetails(_subSectionDetails,Map benifitOverViewDetails,dynamic tempJsonObject){
      final premiumDetails = jsonDecode(tempJsonObject.premiumObject);
      final objQuoteMemberDetails = premiumDetails["objQuoteMemberDetails"];
      List memberDetails = [];
      var _isSpouseCovered = false;
      List _membersDetailsList = _returnMembersDetailsWithDetails(_subSectionDetails);
      final selfToBeBeCoveredDetails = _subSectionDetails[1016][9] as SectionSubSection;
      final lifeToBeAssuredDetails = _subSectionDetails[1016][10] as SectionSubSection;
      final spouseToBeCovered = _subSectionDetails[1016][11] as SectionSubSection;
      final childToBeCovered = _subSectionDetails[1016][18] as SectionSubSection;
      var tempArray = [];
      //Marital status
      final maritalStatusXndex = returnIndexWithField(1144,_subSectionDetails[1009]); 
      var maritalStatusData = (_subSectionDetails[1009][maritalStatusXndex] as SectionSubSection);
      if(maritalStatusData.fieldValue == "14") {
        if (selfToBeBeCoveredDetails.fieldValue == "1" && spouseToBeCovered.fieldValue == "1"){
          _isSpouseCovered = true;
        }else if (selfToBeBeCoveredDetails.fieldValue == "0"){
          if (lifeToBeAssuredDetails.fieldValue == "2"){
          }
      }
      }
      final dependentIndex = returnIndexWithField(1168,_subSectionDetails[1010]); 
      var dependentData = (_subSectionDetails[1010][dependentIndex] as SectionSubSection);
      if(dependentData.fieldValue.length > 0){
          final decodeDetails = json.decode(dependentData.fieldValue);
        if (decodeDetails.length > 0){
            for(final value in decodeDetails){
              final decode = jsonDecode(value);
              tempArray.add(decode);
          }
          if (selfToBeBeCoveredDetails.fieldValue == "1" && childToBeCovered.fieldValue == "1"){
              
          }else if (selfToBeBeCoveredDetails.fieldValue == "0"){
            if (lifeToBeAssuredDetails.fieldValue == "2" || lifeToBeAssuredDetails.fieldValue == "3"){
            }
          }
         }
      }
        for(var i = 0 ; i <  _membersDetailsList.length ; i++ ){
            final benifitOverViewDetail = benifitOverViewDetails[i];
            final benifitCode = (benifitOverViewDetail.keys).elementAt(0);
            var premiumDetails = benifitOverViewDetail[benifitCode] as PremiumDetails;
            var modePremiumTextEditingController = (benifitOverViewDetail[benifitCode] as PremiumDetails).modePremiumTextEditingController;
            final Map<String,dynamic> details ={
              "BasicSumInsured": premiumDetails.sumAssured, 
	          	"Assured": _membersDetailsList[i]["assured"],
	            "Relationship": _membersDetailsList[i]["relationship"],
	          	"MemberIndex": i.toString(),
		          "MemberOccupation": (i > 1) ? 0 : 2,
	          	"Age": _returnAge(i,_subSectionDetails,_isSpouseCovered,tempArray),
	          	"ChildRelationship": null,
		          "MemberName": _returnMemberName(i,_subSectionDetails,_isSpouseCovered,tempArray),
		          "MemberDOB": _returnMemberDOB(i,_subSectionDetails,_isSpouseCovered,tempArray),
		          "TabIndex": null,
		          "IsBenefitRequested": false,
		          "ObjBenefitDetails": [],
		          "HospitalizationAvailability": null,
		          "MemberPremium": objQuoteMemberDetails[i]["MemberPremium"]//modePremiumTextEditingController.text
           };
           memberDetails.add(details);
        }
      return memberDetails;
    }

    List<LstBenefitOverView> returnBenfitOverView(_sectionDetails, Map riderDetails,int currentPage,Map benifitOverViewDetails){
      List<LstBenefitOverView> benefitOverViewDetails = [];
      //final keys = riderDetails.keys;
        // for (final key in keys){
            final riderDetail = riderDetails["main"];
            for (var item in riderDetail) {
            LstBenefitOverView benefitDetails = LstBenefitOverView.formJson(_sectionDetails, item,currentPage,benifitOverViewDetails);
            benefitOverViewDetails.add(benefitDetails);
        //}
      }
      return benefitOverViewDetails;
    }
}


//MARK:- Return member details
  List _returnMembersDetailsWithDetails(Map _sectionSubSectionDetails){
      List _memberDetailsList = List();
      final selfToBeBeCoveredDetails = _sectionSubSectionDetails[1016][9] as SectionSubSection;
      final lifeToBeAssuredDetails = _sectionSubSectionDetails[1016][10] as SectionSubSection;
      final spouseToBeCovered = _sectionSubSectionDetails[1016][11] as SectionSubSection;
      final Map<String,dynamic> details ={
          "relationship":"267",
          "assured":"MainLife"
      };
      _memberDetailsList.add(details);
      //Marital status
      final maritalStatusXndex = returnIndexWithField(1144,_sectionSubSectionDetails[1009]); 
      var maritalStatusData = (_sectionSubSectionDetails[1009][maritalStatusXndex] as SectionSubSection);
      if(maritalStatusData.fieldValue == "14") {
        if (selfToBeBeCoveredDetails.fieldValue == "1" && spouseToBeCovered.fieldValue == "1"){
         final Map<String,dynamic> details ={
           "relationship":"268",
            "assured":"Spouse"
         };
        _memberDetailsList.add(details);
        }else if (selfToBeBeCoveredDetails.fieldValue == "0"){
          if (lifeToBeAssuredDetails.fieldValue == "2"){
            //  memeberCount = memeberCount + 1;
          }
      }
      }
      final dependentIndex = returnIndexWithField(1168,_sectionSubSectionDetails[1010]); 
      var dependentData = (_sectionSubSectionDetails[1010][dependentIndex] as SectionSubSection);
      if(dependentData.fieldValue.length > 0){
          final decodeDetails = json.decode(dependentData.fieldValue);
         if (decodeDetails.length > 0){
           var _index = 1;
          for(final value in decodeDetails){
            final decode = jsonDecode(value);
            final Map<String,dynamic> details ={
               "relationship":decode["1"],
               "assured":"Child$_index"
            };
           _memberDetailsList.add(details);
           _index = _index + 1;
          }
         }
      }
      return _memberDetailsList;
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
      type = ((sectionSubsectionDetails[1009] as List)[1] as SectionSubSection).fieldValue;
      salutation = ((sectionSubsectionDetails[1009] as List)[2] as SectionSubSection).fieldValue;
      name = ((sectionSubsectionDetails[1009] as List)[3] as SectionSubSection).fieldValue;
      lastName = ((sectionSubsectionDetails[1009] as List)[4] as SectionSubSection).fieldValue;
      mobile = (((sectionSubsectionDetails[1009] as List)[12] as SectionSubSection).fieldValue.length > 0) ? (((sectionSubsectionDetails[1009] as List)[12] as SectionSubSection).fieldValue.split("@")[1])  : null;
      email =  (((sectionSubsectionDetails[1009] as List)[9] as SectionSubSection).fieldValue).split("");
      work = (((sectionSubsectionDetails[1009] as List)[11] as SectionSubSection).fieldValue.length > 0) ? (((sectionSubsectionDetails[1009] as List)[11] as SectionSubSection).fieldValue.split("@")[1])  : null;
      mobileCountryCode = (((sectionSubsectionDetails[1009] as List)[12] as SectionSubSection).fieldValue.length > 0) ? (((sectionSubsectionDetails[1009] as List)[12] as SectionSubSection).fieldValue.split("@")[2])  : null;
      homeCountryCode = (((sectionSubsectionDetails[1009] as List)[10] as SectionSubSection).fieldValue.length > 0) ? (((sectionSubsectionDetails[1009] as List)[10] as SectionSubSection).fieldValue.split("@")[2])  : null;
      workCountryCode = (((sectionSubsectionDetails[1009] as List)[11] as SectionSubSection).fieldValue.length > 0) ? (((sectionSubsectionDetails[1009] as List)[11] as SectionSubSection).fieldValue.split("@")[2])  : null;
      lstCountryCode = null;
      home = (((sectionSubsectionDetails[1009] as List)[10] as SectionSubSection).fieldValue.length > 0) ? (((sectionSubsectionDetails[1009] as List)[10] as SectionSubSection).fieldValue.split("@")[1])  : null;
      age = int.parse(((sectionSubsectionDetails[1009] as List)[8] as SectionSubSection).fieldValue);
      dateofBirth = ((sectionSubsectionDetails[1009] as List)[7] as SectionSubSection).fieldValue;
      isQuoteCreated = true;
      strDateofBirth = null;
      occupation = int.parse(((sectionSubsectionDetails[1009] as List)[13] as SectionSubSection).fieldValue);
      employerName = null;
      nic  = ((sectionSubsectionDetails[1009] as List)[5] as SectionSubSection).fieldValue;
      gender = ((sectionSubsectionDetails[1009] as List)[6] as SectionSubSection).fieldValue;
      maritalStatus = ((sectionSubsectionDetails[1009] as List)[15] as SectionSubSection).fieldValue;
      displayMaritalStatus = ((sectionSubsectionDetails[1009] as List)[15] as SectionSubSection).fieldValue;
      avgMonthlyIncome = ((sectionSubsectionDetails[1009] as List)[14] as SectionSubSection).fieldValue;
      qutotaionCreatedDate = null;
      njevChildName = null;
      isDeleted = false;
      message = null;
      contactId = 0;
      stageId = 0;
      objAddress = ObjAddress.formJson(sectionSubsectionDetails);
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

//MARK:- ObjAddress
class ObjAddress{
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
    ObjAddress({
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
    ObjAddress.formJson(Map _subSectionDetails){
        addressId = null;
        addressTypeId = null;
        address1 = (_subSectionDetails[1009][17] as SectionSubSection).fieldValue;
        address2 = (_subSectionDetails[1009][18] as SectionSubSection).fieldValue;
        address3 = null;
        pincodeId = null;
        city = (_subSectionDetails[1009][21] as SectionSubSection).fieldValue;
        district = (_subSectionDetails[1009][20] as SectionSubSection).fieldValue;
        state = (_subSectionDetails[1009][19] as SectionSubSection).fieldValue;
        country = null;
        pincode = (_subSectionDetails[1009][22] as SectionSubSection).fieldValue;
        pincodeNew = null;
        stateId = null;
        province = (_subSectionDetails[1009][19] as SectionSubSection).fieldValue;
        provinceCode = null;
        districtCode = null;
        cityCode = null;
        lstPincode = null;
    }

     Map toJson()=>{
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

//MARK:- ObjNeedAnalysis
class ObjNeedAnalysis {

    double needAnalysisId;
    dynamic prospectDob;
    FNAObjSpouseDetails objSpouseDetails;
    List<ObjDependents> objDependents;
    dynamic objEstimateDetails;
    dynamic objAssetsAndLiabilities;
    ObjFamilyIncome objFamilyIncome;
    List<ObjNeeds> objNeeds;
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

    ObjNeedAnalysis.formJson(Map _subSectionDetails){
        needAnalysisId =  0.0;
        prospectDob = (_subSectionDetails[1009][7] as SectionSubSection).fieldValue;
        objSpouseDetails = FNAObjSpouseDetails.formJson(_subSectionDetails);
        objDependents = List<ObjDependents>.from(returnDependents(_subSectionDetails).map((e) => ObjDependents.formJson(e)));
        objEstimateDetails = ObjEstimateDetails.formJson(_subSectionDetails);
        objAssetsAndLiabilities = ObjAssetsAndLiabilities.formJson(_subSectionDetails);
        objFamilyIncome = ObjFamilyIncome.formJson(_subSectionDetails);
        objNeeds = List<ObjNeeds>.from(returnObjNeeds(_subSectionDetails).map((e) => ObjNeeds.formJson(e)));
        total = (_subSectionDetails[1014][8] as SectionSubSection).fieldValue;
        productSelected = null;
        comments =(_subSectionDetails[1014][9] as SectionSubSection).fieldValue;
        needAnalysisFileAttachment = null;
        dateOfNextMeeting = (_subSectionDetails[1015][2] as SectionSubSection).fieldValue;
        timeOfNextMeeting = returnTimeStringWithFiledValue((_subSectionDetails[1015][3] as SectionSubSection).fieldValue);//(_subSectionDetails[1015][3] as SectionSubSection).fieldValue;
        purposeOfMeeting =  (_subSectionDetails[1015][4] as SectionSubSection).fieldValue;
        purposeOfMeeting1 = (_subSectionDetails[1015][5] as SectionSubSection).fieldValue;
        uploadSignPath = null;
        prospectSign = null;
        createdDate  = (_subSectionDetails[1015][8] as SectionSubSection).fieldValue;
        final productDetails  = _subSectionDetails[1016];
        selectedProducts = (productDetails[1] as SectionSubSection).fieldValue;
    }

    returnTimeStringWithFiledValue(String filedValue){
        final time = DateTime.parse(filedValue);
        final temp = DateFormat.jm().format(DateFormat("hh:mm:ss").parse(time.hour.toString() + ":" + time.minute.toString() + ":" + "00")); 
        return  temp.toString();
    }
    
    Map toJson()=>{
      "NeedAnalysisID" : needAnalysisId,
      "ProspectDOB" : prospectDob,
      "objSpouseDetails" : objSpouseDetails.toJson(),
      "objDependents" :  List<dynamic>.from(objDependents.map((e) => e.toJson())),
      "objEstimateDetails" : objEstimateDetails,
      "objAssetsAndLiabilities" : objAssetsAndLiabilities,
      "objFamilyIncome" : objFamilyIncome.toJoson(),
      "objNeeds" :List<dynamic>.from(objNeeds.map((e) => e.toJson())),
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

    FNAObjSpouseDetails.  formJson(Map _subSectionDetails){
      fullName  = (_subSectionDetails[1010][10] as SectionSubSection).fieldValue;
      dateOfBirth = (_subSectionDetails[1010][11] as SectionSubSection).fieldValue;
      age = ((_subSectionDetails[1010][12] as SectionSubSection).fieldValue.length > 0) ? int.parse((_subSectionDetails[1010][12] as SectionSubSection).fieldValue) :  null;
      maritialStatus = null;
      occuaptionId = (_subSectionDetails[1010][13] as SectionSubSection).fieldValue;
      employer = (_subSectionDetails[1010][14] as SectionSubSection).fieldValue;
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

//objDependents
returnDependents(Map _subSectionDetails){
   List childDetails = [];
   final dependentData = (_subSectionDetails[1010][17] as SectionSubSection);
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
             "DependentName" : val["0"],
             "Relationship" :  val["1"],
             "DateOfBirth" :  val["2"],
             "Age" :  val["3"],
             "ContactID" : 0,
             "IsDeleted" : false
           };
           childDetails.add(details);
        }
    }
   }
   return childDetails;
}

class ObjDependents{
  dynamic dependentName;
  dynamic relationship;
  dynamic dateOfBirth;
  dynamic age;
  dynamic contactID;
  dynamic isDeleted;

  ObjDependents({
    this.dependentName,
    this.relationship,
    this.dateOfBirth,
    this.age,
    this.contactID,
    this.isDeleted
  });

   ObjDependents.formJson(Map _dependentsDetails){
     dependentName = _dependentsDetails["DependentName"];
     relationship =  _dependentsDetails["Relationship"];
     dateOfBirth =  _dependentsDetails["DateOfBirth"];
     age = _dependentsDetails["Age"];
     contactID = _dependentsDetails["ContactID"];
     isDeleted = _dependentsDetails["IsDeleted"];
   }

   Map toJson()=>{
     "DependentName" : dependentName,
     "Relationship" : relationship,
     "DateOfBirth" : dateOfBirth,
     "Age" : age,
     "ContactID" : contactID,
     "IsDeleted" : isDeleted
   };
}

//objEstimateDetails
class ObjEstimateDetails{
  dynamic  food;
  dynamic  houseElectricityWaterRent;
  dynamic  clothes;
  dynamic  transport;
  dynamic  familyEducation;
  dynamic  healthCare;
  dynamic  specialEvents;
  dynamic  maidAndOtherHelpers;
  dynamic  otherMontly;
  dynamic  totalMonthlyExp;
  dynamic  monthlyInstallments;

  ObjEstimateDetails({
    this.food,
    this.houseElectricityWaterRent,
    this.clothes,
    this.transport,
    this.familyEducation,
    this.healthCare,
    this.specialEvents,
    this.maidAndOtherHelpers,
    this.otherMontly,
    this.totalMonthlyExp,
    this.monthlyInstallments
  });

  ObjEstimateDetails.formJson(Map _dependentsDetails){
    food = (_dependentsDetails[1011][1] as SectionSubSection).fieldValue;
    houseElectricityWaterRent = (_dependentsDetails[1011][2] as SectionSubSection).fieldValue;
    clothes = (_dependentsDetails[1011][3] as SectionSubSection).fieldValue;
    transport = (_dependentsDetails[1011][4] as SectionSubSection).fieldValue;
    familyEducation = (_dependentsDetails[1011][6] as SectionSubSection).fieldValue;
    healthCare = (_dependentsDetails[1011][5] as SectionSubSection).fieldValue;
    specialEvents = (_dependentsDetails[1011][7] as SectionSubSection).fieldValue;
    maidAndOtherHelpers = (_dependentsDetails[1011][8] as SectionSubSection).fieldValue;
    otherMontly = (_dependentsDetails[1011][9] as SectionSubSection).fieldValue;
    totalMonthlyExp = (_dependentsDetails[1011][10] as SectionSubSection).fieldValue;
    monthlyInstallments = (_dependentsDetails[1011][11] as SectionSubSection).fieldValue;
  }

   Map toJson()=>{
     "Food" : food,
     "HouseElectricityWaterRent" : houseElectricityWaterRent,
     "Clothes" : clothes,
     "Transport" : transport,
     "FamilyEducation" : familyEducation,
     "HealthCare" : healthCare,
     "SpecialEvents" : specialEvents,
     "MaidAndOtherHelpers" : maidAndOtherHelpers,
     "OtherMontly" : otherMontly,
     "TotalMonthlyExp" : totalMonthlyExp,
     "MonthlyInstallments" : monthlyInstallments
   };
}

//objAssetsAndLiabilities
class ObjAssetsAndLiabilities{

  dynamic landOrHouse;
  dynamic motorVehicle;
  dynamic bankDeposits;
  dynamic investments;
  dynamic assetsTotal;
  dynamic motorVehicleType;
  dynamic isLiabilitiesCovered;
  dynamic loans;
  dynamic mortgauges;
  dynamic leases;
  dynamic others;
  dynamic liabTotal;

  ObjAssetsAndLiabilities({
    this.landOrHouse,
    this.motorVehicle,
    this.bankDeposits,
    this.investments,
    this.assetsTotal,
    this.motorVehicleType,
    this.isLiabilitiesCovered,
    this.loans,
    this.mortgauges,
    this.leases,
    this.others,
    this.liabTotal
  });

   ObjAssetsAndLiabilities.formJson(Map _sectionSubsectionDetails){
     landOrHouse = (_sectionSubsectionDetails[1012][2] as SectionSubSection).fieldValue;
     motorVehicle = (_sectionSubsectionDetails[1012][3] as SectionSubSection).fieldValue;
     bankDeposits = (_sectionSubsectionDetails[1012][5] as SectionSubSection).fieldValue;
     investments = (_sectionSubsectionDetails[1012][6] as SectionSubSection).fieldValue;
     assetsTotal = (_sectionSubsectionDetails[1012][7] as SectionSubSection).fieldValue;
     motorVehicleType = (_sectionSubsectionDetails[1012][4] as SectionSubSection).fieldValue;
     isLiabilitiesCovered = ( (_sectionSubsectionDetails[1012][9] as SectionSubSection).fieldValue == "1") ? true : false;
     loans = (_sectionSubsectionDetails[1012][9] as SectionSubSection).fieldValue;
     mortgauges = (_sectionSubsectionDetails[1012][10] as SectionSubSection).fieldValue;
     leases = (_sectionSubsectionDetails[1012][11] as SectionSubSection).fieldValue;
     others = (_sectionSubsectionDetails[1012][12] as SectionSubSection).fieldValue;
     liabTotal = (_sectionSubsectionDetails[1012][13] as SectionSubSection).fieldValue;
   }

    Map toJson()=>{
      "LandOrHouse" : landOrHouse,
      "MotorVehicle" : motorVehicle,
      "BankDeposits" : bankDeposits,
      "Investments" : investments,
      "AssetsTotal" : assetsTotal,
      "MotorVehicleType" : motorVehicleType,
      "IsLiabilitiesCovered" : isLiabilitiesCovered,
      "Loans" : loans,
      "Mortgauges" : mortgauges,
      "leases" : leases,
      "others" : others,
      "Liab_Total" : liabTotal
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

  ObjFamilyIncome.formJson(Map _sectionSubsectionDetails){
    prospectMonthlyIncome = (_sectionSubsectionDetails[1013][2] as SectionSubSection).fieldValue;
    spouseMonthlyIncome = (_sectionSubsectionDetails[1013][3] as SectionSubSection).fieldValue;
    houseHoldTotal = (_sectionSubsectionDetails[1013][4] as SectionSubSection).fieldValue;
    capitalReq =  (_sectionSubsectionDetails[1013][7] as SectionSubSection).fieldValue;
    personalLifeInsurance = null;
    savingsAndInvestments = (_sectionSubsectionDetails[1013][18] as SectionSubSection).fieldValue;
    totalProtection = (_sectionSubsectionDetails[1013][19] as SectionSubSection).fieldValue;
    gapIdentified = (_sectionSubsectionDetails[1013][20] as SectionSubSection).fieldValue;
    totalDeath = (_sectionSubsectionDetails[1013][13] as SectionSubSection).fieldValue;
    totalAccidental = (_sectionSubsectionDetails[1013][14] as SectionSubSection).fieldValue;
    totalCritical = (_sectionSubsectionDetails[1013][15] as SectionSubSection).fieldValue;
    totalHospitalization = (_sectionSubsectionDetails[1013][16] as SectionSubSection).fieldValue;
    totalHospitalizationReimbersement = (_sectionSubsectionDetails[1013][17] as SectionSubSection).fieldValue;
    rateOfInterest = ((_sectionSubsectionDetails[1013][6] as SectionSubSection).fieldValue.length > 0) ? int.parse((_sectionSubsectionDetails[1013][6] as SectionSubSection).fieldValue) : 0;
    objLstPrevInsuranceDetails = List<LstPrevInsuranceDetails>.from(returnLstPrevInsuranceDetails((_sectionSubsectionDetails[1013][12] as SectionSubSection).fieldValue).map((e) => LstPrevInsuranceDetails.formJson(e)));
    isOtherInsurance = ((_sectionSubsectionDetails[1013][9] as SectionSubSection).fieldValue == "1") ? true : false;
    noOfJanashaktiPolicy = (_sectionSubsectionDetails[1013][10] as SectionSubSection).fieldValue;;
    noOfOtherPolicies = (_sectionSubsectionDetails[1013][11] as SectionSubSection).fieldValue;
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
    "objLstPrevInsuranceDetails" : List<dynamic>.from(objLstPrevInsuranceDetails.map((e) => e.toJson())),
    "IsOtherInsurance" : isOtherInsurance,
    "NoOfJanashaktiPolicy" : noOfJanashaktiPolicy,
    "NoOfOtherPolicies" : noOfOtherPolicies
  };
}

//objLstPrevInsuranceDetails
List returnLstPrevInsuranceDetails(String _details){
  List prevInsuranceDetails = [];
  if(_details.length > 0){
    final _decodeData = jsonDecode(_details);
    for (final item in _decodeData) {
       final Map<String,dynamic> details ={
         "company" : item["0"],
         "policyOrProposalNo" : item["1"],
         "death" : item["2"],
         "accidental" : item["3"],
         "critical" : item["4"],
         "hospitalization" : item["5"],
         "hospitalizationreimbursement" : item["6"],
         "currentStatus" : item["7"],
         "comments" : item["8"],
       };
        prevInsuranceDetails.add(details);
    }
  }
    return prevInsuranceDetails;
}

class LstPrevInsuranceDetails{
  String company;
  String policyOrProposalNo;
  String death;
  String accidental;
  String critical;
  String hospitalization;
  String hospitalizationreimbursement;
  String currentStatus; 
  String comments;
  LstPrevInsuranceDetails({
    this.company,
    this.policyOrProposalNo,
    this.death,
    this.accidental,
    this.critical,
    this.hospitalization,
    this.hospitalizationreimbursement,
    this.currentStatus,
    this.comments
  });

  LstPrevInsuranceDetails.formJson(Map _details){
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

  Map toJson()=>{
    "Company" : company,
    "PolicyOrProposalNo" : policyOrProposalNo,
    "Death" : death,
    "Accidental" : accidental,
    "Critical" : critical,
    "Hospitalization" : hospitalization,
    "Hospitalization_Reimbursement" : hospitalizationreimbursement,
    "CurrentStatus" : currentStatus,
    "Comments" : comments
  };
}


//OBJ Needs
returnObjNeeds(Map _sectionSubsectionDetails){
   List needDetails = [];
    for(var i=0;i<7;i++){
      final dependentData = (_sectionSubsectionDetails[1014][i + 1] as SectionSubSection);
      if(dependentData.fieldValue.length > 0){
        final decodeDetails = json.decode(dependentData.fieldValue);
      final Map<String,dynamic> details ={
             "PKNeedID" : 0,
             "NeedName" : returnNeedNameWithIndex(i + 1),
             "NeedID" :  i + 1,
             "IsNeedOpted" : (decodeDetails["1"] == "1") ? true : false,
             "Value" : decodeDetails["2"],
             "Priority" : returnPriorityiDWithIndex(decodeDetails["3"]),
             "PlanSuggested" : null,
             "ImagePath" : null
           };
           needDetails.add(details);
      }
    }  
    return needDetails;
}

returnPriorityiDWithIndex(String index){
  switch (index) {
    case "1":
      return "1247";
      break;
     case "2":
      return "1248";
    case "3":
      return "1249"; 
    case "4":
      return "1250";  
      break;  
    case "5":
      return "1251";
      break;
    case "6":
      return "1252";
      break;    
    case "7":
      return "1253";
      break;   
    default:break;
  }
}

returnNeedNameWithIndex(int index){
  switch (index) {
    case 1:
      return "Family Income Protection";
      break;
    case 2:
      return "Childrens Higher Education";
      break;  
    case 3:
      return "Childrens Marriage";
      break;   
    case 4:
      return "Income on Retirement";
      break;  
    case 5:
      return "Funds for Sickness and Hospitalization";
      break;   
    case 6:
      return "Other Savings Needs";
      break; 
    case 7:
      return "Other Liabilities and Loans";
      break;       
    default:
  }
}

//objNeeds
class ObjNeeds{
  dynamic pKNeedID;
  dynamic needName;
  dynamic needID;
  dynamic isNeedOpted;
  dynamic value;
  dynamic priority;
  dynamic planSuggested;
  dynamic imagePath;

  ObjNeeds({
    this.pKNeedID,
    this.needName,
    this.needID,
    this.isNeedOpted,
    this.value,
    this.priority,
    this.planSuggested,
    this.imagePath
  });

  ObjNeeds.formJson(Map _needDetails){
    pKNeedID = _needDetails["PKNeedID"];
    needName =  _needDetails["NeedName"];
    needID = _needDetails["NeedID"];
    isNeedOpted = _needDetails["IsNeedOpted"];
    value = _needDetails["Value"];
    priority = _needDetails["Priority"];
    planSuggested = _needDetails["PlanSuggested"];
    imagePath = _needDetails["ImagePath"];
  }
   Map toJson()=>{
    "PKNeedID" : pKNeedID,
    "NeedName" : needName,
    "NeedID" : needID,
    "IsNeedOpted" : isNeedOpted,
    "Value" : value,
    "Priority" : priority,
    "PlanSuggested" : planSuggested,
    "ImagePath" : imagePath
  };
}



returnLifeToBeAssured(_subSectionDetails){
      var lifeToAssured = ["MainLife"];

      final selfToBeBeCoveredDetails = _subSectionDetails[1016][9] as SectionSubSection;
      final lifeToBeAssuredDetails = _subSectionDetails[1016][10] as SectionSubSection;
      final spouseToBeCovered = _subSectionDetails[1016][11] as SectionSubSection;
      final childToBeCovered = _subSectionDetails[1016][18] as SectionSubSection;

      //Marital status
      final maritalStatusXndex = returnIndexWithField(1144,_subSectionDetails[1009]); 
      var maritalStatusData = (_subSectionDetails[1009][maritalStatusXndex] as SectionSubSection);

       if(maritalStatusData.fieldValue == "14") {
        if (selfToBeBeCoveredDetails.fieldValue == "1" && spouseToBeCovered.fieldValue == "1"){
            lifeToAssured.add("Spouse");
        }else if (selfToBeBeCoveredDetails.fieldValue == "0"){
          if (lifeToBeAssuredDetails.fieldValue == "2"){
            lifeToAssured.add("Spouse");
          }
        }
       }

      final dependentIndex = returnIndexWithField(1168,_subSectionDetails[1010]); 
      var dependentData = (_subSectionDetails[1010][dependentIndex] as SectionSubSection);
      if(dependentData.fieldValue.length > 0){
         final decodeDetails = json.decode(dependentData.fieldValue);
      if (decodeDetails.length > 0){
          var index = 0;
          if (selfToBeBeCoveredDetails.fieldValue == "1" && childToBeCovered.fieldValue == "1"){
               for(final _ in decodeDetails){
                lifeToAssured.add("Child$index");
                index = index + 1;
         }
          }else if (selfToBeBeCoveredDetails.fieldValue == "0"){
            if (lifeToBeAssuredDetails.fieldValue == "2" || lifeToBeAssuredDetails.fieldValue == "3"){
               for(final _ in decodeDetails){
                lifeToAssured.add("Child$index");
                index = index + 1;
             }
            }
          }
       }
      }
    return lifeToAssured;
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

    ObjProductDetials.formJson(Map sectionSubsectionDetails,Map benifitOverViewDetails){
      final benifitOverViewDetail = benifitOverViewDetails[0];
      final benifitCode = (benifitOverViewDetail.keys).elementAt(0);
      var premiumDetails = benifitOverViewDetail[benifitCode] as PremiumDetails;
      final productDetails  = sectionSubsectionDetails[1016];
      plan  = (productDetails[1] as SectionSubSection).fieldValue;
      planCode = (productDetails[2]as SectionSubSection).fieldValue;
      planDescription = "A nontraditional life insurance policy, that combines the positives of a bank account and a life insurance policy giving the policyholder a higher return and a life protection.";
      policyTerm = (productDetails[3]as SectionSubSection).fieldValue;
      premiumTerm = (productDetails[4] as SectionSubSection).fieldValue;
      preferredLangauage = (productDetails[5] as SectionSubSection).fieldValue;
      preferredMode = (productDetails[6] as SectionSubSection).fieldValue;
      contributionPremium = premiumDetails.sumAssured;
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
      age = ((spouseDetails[16] as SectionSubSection).fieldValue).length > 0 ? int.parse((spouseDetails[16] as SectionSubSection).fieldValue): 0;
      dateOfBirth = (spouseDetails[15]as SectionSubSection).fieldValue;
      nicNo = (spouseDetails[14]as SectionSubSection).fieldValue;
      gender = (spouseDetails[13]as SectionSubSection).fieldValue;
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
      nicNo = null;//(spouseDetails[14]as SectionSubSection).fieldValue;
      gender = null;//(spouseDetails[13]as SectionSubSection).fieldValue;
      occupation = null;//(spouseDetails[17]as SectionSubSection).fieldValue;
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
      nicNo = null;//(spouseDetails[14]as SectionSubSection).fieldValue;
      gender = null;//(spouseDetails[13]as SectionSubSection).fieldValue;
      occupation = null;//(spouseDetails[17]as SectionSubSection).fieldValue;
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
			age = (childDetials["Age"].length > 0) ? int.parse( childDetials["Age"]) : 0;
			currentAge = (childDetials["Age"].length > 0) ? (int.parse( childDetials["Age"]) - 1) : 0;
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
			age = (memberDetails["Age"].length > 0) ? int.parse( memberDetails["Age"]) : 0;
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

    LstBenefitOverView.formJson(Map sectionSubsectionDetails, RiderMaster riderDetails,int currentPage,Map benifitOverViewDetails){
      final benifitOverViewDetail = benifitOverViewDetails[0];
      var premiumDetails = benifitOverViewDetail[riderDetails.benefitCode] as PremiumDetails;
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
      objBenefitMemberRelationship = returnObjBenefitMemberRelationship(sectionSubsectionDetails,riderDetails,currentPage,benifitOverViewDetails,riderDetails.benefitCode);
      riderCode = (riderDetails.riderCode.length > 0) ?  riderDetails.riderCode : null;
			minSumInsured = premiumDetails.min.toString();
			maxSumInsured = premiumDetails.max.toString();
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

    List<ObjBenefitMemberRelationship> returnObjBenefitMemberRelationship(_subSectionDetails,RiderMaster riderDetails,int currentPage,Map benifitOverViewDetails,String benefitCode) {
      List<ObjBenefitMemberRelationship> memberDetails = [];
      List _membersDetailsList = _returnMembersDetailsWithDetails(_subSectionDetails);
      for(var i = 0 ; i < _membersDetailsList.length ; i++ ){
        ObjBenefitMemberRelationship objMemberDetails = ObjBenefitMemberRelationship.formJson(_subSectionDetails, i,riderDetails,currentPage,benifitOverViewDetails,benefitCode,_membersDetailsList[i]);
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

    ObjBenefitMemberRelationship.formJson(Map sectionSubsectionDetails, int i,RiderMaster riderDetails,int currentPage,Map benifitOverViewDetails,String benefitCode,Map memberRelationshipMap){
      String _formatNumber(String s) => NumberFormat.decimalPattern(LabelConstant.kLocale).format(int.parse(s));
      final benifitOverViewDetail = benifitOverViewDetails[i];
      var premiumDetails = benifitOverViewDetail[benefitCode] as PremiumDetails;
      final premium =  (benifitOverViewDetail[benefitCode] != null) ? ((premiumDetails.premiumm.length > 0) ?  '${_formatNumber(double.parse(premiumDetails.premiumm.replaceAll(',', '')).round().toString())}' : null) : null;
      final sumAssured =  (benifitOverViewDetail[benefitCode] != null) ? ((premiumDetails.sumAssured.length > 0) ?  '${_formatNumber(double.parse(premiumDetails.sumAssured.replaceAll(',', '')).round().toString())}' : null) : null;
      policyMemberBenefitID = 0;
      riderSI = sumAssured;	
      memberRelationship = memberRelationshipMap["relationship"];
       riderPremium = premium;
      assuredName = memberRelationshipMap["assured"];
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