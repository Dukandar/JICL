class LoadQuotationPool{
   dynamic isQuickQuote;
    int childCount;
    bool isForServices;
    int quoteIndex;
    dynamic lstIllustation;
    dynamic objProspect;
    dynamic objProductDetials;
    dynamic age;
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
    int quotePremium;
    dynamic basicPremium;
    int productBasicPremium;
    int totalPremium;
    int tClientPremium;
    dynamic basicPackageRiderPremium;
    dynamic investmentPremium;
    dynamic protectionPremium;
    dynamic investmentTotalPremium;
    dynamic totalRiderPremium;
    int contributionAmtCess;
    int premiumCess;
    int contactid;
    dynamic isInsuranceCovered;
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
    dynamic objSpouseDetials;
    dynamic objBusinessPartnerDetials;
    dynamic objLoanBorrowerDetials;
    dynamic objChildDetials;
    dynamic objEighteenPlusChildDetials;
    dynamic strHtml;
    dynamic strPremiumHtml;
    String userName;
    dynamic quoteNo;
    dynamic message;
    dynamic listAssured;
    dynamic panelIndex;
    dynamic selectedMember;
    int memberIndex;
    int quoteVersion;
    bool isPremiumCall;
    int minEntryAge;
    int maxEntryAge;
    int maturityAge;
    dynamic cashlessRiderChildren;
    List<dynamic> objQuoteMemberDetails;
    dynamic listPlan;
    dynamic lstPolicyTerm;
    dynamic lstPremiumTerm;
    dynamic lstLanguage;
    dynamic lstCountryCode;
    dynamic lstPrefMode;
    List<dynamic> lstBenefitOverView;
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
    LoadQuotationPool({
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

    LoadQuotationPool.fromJson(String _userName){
        isQuickQuote = null;
        childCount  = null;
        isForServices  = null;
        quoteIndex  = null;
        lstIllustation  = null;
        objProspect  = null;
        objProductDetials  = null;
        age  = null;
        spouseOccupationClass  = null;
        spouseOccupationCode  = null;
        cess  = null;
        policyFee  = null;
        vat  = null;
        annualPremium  = null;
        halfYearlyPremium  = null;
        quaterlyPremium  = null;
        monthlyPremium  = null;
        singlePremium  = null;
        basicSumInsured  = null;
        quotePremium  = null;
        basicPremium  = null;
        productBasicPremium  = null;
        totalPremium  = null;
        tClientPremium  = null;
        basicPackageRiderPremium  = null;
        investmentPremium  = null;
        protectionPremium  = null;
        investmentTotalPremium  = null;
        totalRiderPremium  = null;
        contributionAmtCess  = null;
        premiumCess  = null;
        contactid  = null;
        isInsuranceCovered  = null;
        contributionAmount  = null;
        isSelfMedicalBenefit  = null;
        isBenefitReceivingPeriod  = null;
        isCoverAppliedFor  = null;
        isSelfCovered  = null;
        isSpouseCovered  = null;
        isChildCovered  = null;
        isNeedsIdentified  = null;
        isModifyQuote  = null;
        isCashLessSelf  = null;
        isCashLessSumAssured  = null;
        isCashlessNone  = null;
        noofChilds  = null;
        noofCashLessChildren  = null;
        lifetobeAssuredDd  = null;
        lifetobeAssuredDdNo  = null;
        objSpouseDetials  = null;
        objBusinessPartnerDetials  = null;
        objLoanBorrowerDetials  = null;
        objChildDetials  = null;
        objEighteenPlusChildDetials  = null;
        strHtml  = null;
        strPremiumHtml  = null;
        userName  = _userName;
        quoteNo  = null;
        message  = null;
        listAssured  = null;
        panelIndex  = null;
        selectedMember  = null;
        memberIndex  = null;
        quoteVersion  = null;
        isPremiumCall  = null;
        minEntryAge  = null;
        maxEntryAge  = null;
        maturityAge  = null;
        cashlessRiderChildren  = null;
        objQuoteMemberDetails  = null;
        listPlan  = null;
        lstPolicyTerm  = null;
        lstPremiumTerm  = null;
        lstLanguage  = null;
        lstCountryCode  = null;
        lstPrefMode  = null;
        lstBenefitOverView  = null;
        lstPremiumOverview  = null;
        objPackageDetails  = null;
        status  = null;
        lstGender  = null;
        lstOccupation  = null;
        objQuotationPool  = null;
        lstDecision  = null;
        lstReportee  = null;
        lstLifetobeAssured  = null;
        lstLifetobeAssuredSelfNo  = null;
        lstCashLessRiderChildren  = null;
        lstChildDetails  = null;
    }
    Map toJson()=>{
      "IsQuickQuote": isQuickQuote,
        "ChildCount": childCount,
        "IsForServices": isForServices,
        "QuoteIndex": quoteIndex,
        "LstIllustation": lstIllustation,
        "objProspect": objProspect,
        "objProductDetials": objProductDetials,
        "Age": age,
        "SpouseOccupationClass": spouseOccupationClass,
        "SpouseOccupationCode": spouseOccupationCode,
        "Cess": cess,
        "PolicyFee": policyFee,
        "VAT": vat,
        "AnnualPremium": annualPremium,
        "HalfYearlyPremium": halfYearlyPremium,
        "QuaterlyPremium": quaterlyPremium,
        "MonthlyPremium": monthlyPremium,
        "SinglePremium": singlePremium,
        "BasicSumInsured": basicSumInsured,
        "QuotePremium": quotePremium,
        "BasicPremium": basicPremium,
        "ProductBasicPremium": productBasicPremium,
        "TotalPremium": totalPremium,
        "tClientPremium": tClientPremium,
        "BasicPackageRiderPremium": basicPackageRiderPremium,
        "InvestmentPremium": investmentPremium,
        "ProtectionPremium": protectionPremium,
        "InvestmentTotalPremium": investmentTotalPremium,
        "totalRiderPremium": totalRiderPremium,
        "ContributionAmtCess": contributionAmtCess,
        "PremiumCess": premiumCess,
        "Contactid": contactid,
        "IsInsuranceCovered": isInsuranceCovered,
        "ContributionAmount": contributionAmount,
        "IsSelfMedicalBenefit": isSelfMedicalBenefit,
        "IsBenefitReceivingPeriod": isBenefitReceivingPeriod,
        "IsCoverAppliedFor": isCoverAppliedFor,
        "IsSelfCovered": isSelfCovered,
        "IsSpouseCovered": isSpouseCovered,
        "IsChildCovered": isChildCovered,
        "IsNeedsIdentified": isNeedsIdentified,
        "IsModifyQuote": isModifyQuote,
        "IsCashLessSelf": isCashLessSelf,
        "IsCashLessSumAssured": isCashLessSumAssured,
        "IsCashlessNone": isCashlessNone,
        "NoofChilds": noofChilds,
        "NoofCashLessChildren": noofCashLessChildren,
        "LifetobeAssuredDD": lifetobeAssuredDd,
        "LifetobeAssuredDDNo": lifetobeAssuredDdNo,
        "objSpouseDetials": objSpouseDetials,
        "objBusinessPartnerDetials": objBusinessPartnerDetials,
        "objLoanBorrowerDetials": objLoanBorrowerDetials,
        "objChildDetials": objChildDetials,
        "objEighteenPlusChildDetials": objEighteenPlusChildDetials,
        "STRHtml": strHtml,
        "STRPremiumHtml": strPremiumHtml,
        "UserName": userName,
        "QuoteNo": quoteNo,
        "Message": message,
        "ListAssured": listAssured,
        "PanelIndex": panelIndex,
        "SelectedMember": selectedMember,
        "_memberIndex": memberIndex,
        "QuoteVersion": quoteVersion,
        "IsPremiumCall": isPremiumCall,
        "MinEntryAge": minEntryAge,
        "MaxEntryAge": maxEntryAge,
        "MaturityAge": maturityAge,
        "CashlessRiderChildren": cashlessRiderChildren,
        "objQuoteMemberDetails": objQuoteMemberDetails,
        "ListPlan": listPlan,
        "LstPolicyTerm": lstPolicyTerm,
        "LstPremiumTerm": lstPremiumTerm,
        "lstLanguage": lstLanguage,
        "LstCountryCode": lstCountryCode,
        "lstPrefMode": lstPrefMode,
        "LstBenefitOverView": lstBenefitOverView,
        "LstPremiumOverview":lstPremiumOverview,
        "objPackageDetails": objPackageDetails,
        "Status": status,
        "lstGender": lstGender,
        "lstOccupation": lstOccupation,
        "ObjQuotationPool": objQuotationPool,
        "lstDecision": lstDecision,
        "lstReportee": lstReportee,
        "lstLifetobeAssured": lstLifetobeAssured,
        "lstLifetobeAssuredSelfNo": lstLifetobeAssuredSelfNo,
        "LstCashLessRiderChildren": lstCashLessRiderChildren,
        "LstChildDetails": lstChildDetails,
    };
}