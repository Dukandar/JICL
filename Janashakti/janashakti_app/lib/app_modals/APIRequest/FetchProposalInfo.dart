class FetchProposalInfo{
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
    List<dynamic> lstBenifitDetails;
    List<dynamic> lstPackageDetails;
    dynamic lstPremiumDetails;
    dynamic lstMedicalReports;
    dynamic listAssured;
    dynamic annualPremium;
    dynamic halfYearlyPremium;
    dynamic quaterlyPremium;
    dynamic monthlyPremium;
    dynamic singlePremium;
    dynamic totalPremium;
    dynamic cess;
    dynamic vat;
    dynamic policyFee;
    dynamic investmentPremium;
    dynamic protectionPremium;
    dynamic investmentTotalPremium;
    dynamic totalRiderPremium;
    int contributionAmtCess;
    int premiumCess;
    bool isForService;
    dynamic suminsured;
    dynamic premium;
    dynamic productBasicPremium;
    dynamic quoteNo;
    dynamic policyNo;
    dynamic isLi4InsuranceCovered;
    dynamic li4InsurancePremiumAmount;
    dynamic proposalNo;
    dynamic planName;
    dynamic planCode;
    dynamic term;
    dynamic policyTerm;
    dynamic paymentTerm;
    dynamic loanAmount;
    dynamic interestRate;
    dynamic paymentFrequency;
    dynamic paymentPaidBy;
    dynamic paymentMethod;
    dynamic paymentReceiptPrefferdBy;
    dynamic modeOfCommunication;
    dynamic others;
    dynamic totalPremiumPayble;
    dynamic totalAmountPaid;
    dynamic balancetobePaid;
    dynamic underWriterRemarks;
    dynamic isclIncluded;
    dynamic saType;
    dynamic coverType;
    dynamic scheme;
    dynamic preferredLanguage;
    dynamic objProspectDetails;
    dynamic objFillMemberDetials;
    bool isRegAsCommunication;
    dynamic message;
    dynamic status;
    dynamic uwMessage;
    dynamic listPlan;
    dynamic lstPolicyTerm;
    dynamic lstPremiumTerm;
    dynamic hdnDocumentDetails;
    dynamic assuredName;
    int assuredIndex;
    dynamic policyId;
    bool procceedToPayment;
    dynamic objPaymentInfo;
    bool isSpouseCovered;
    bool isViewProposal;
    dynamic objSuspectReAllocation;
    List<dynamic> objMemberDetails;
    dynamic objNomineeDetails;
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
    dynamic prospectSignaturePath;
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
    dynamic prospectImagePath;
    dynamic spouseSignPath;
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
    dynamic quotePdfPath;
    dynamic financialNeedAnalysisPath;
    dynamic proposalFormPath;

    FetchProposalInfo({
        this.lstIllustation,
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
    });

  FetchProposalInfo.fromJson(String _loginUserName,double _policyID){
        lstIllustation = null;
        userName  = _loginUserName;
        userId  = null;
        contactId  = null;
        lifeAssured  = null;
        suspectPoolCountInfo  = null;
        suspectPoolCount  = null;
        prospectPoolCountInfo  = null;
        quotePoolCountInfo  = null;
        quotePoolCount  = null;
        proposalPoolCountInfo  = null;
        approvalPoolCountInfo  = null;
        prospectPoolCount  = null;
        confirmedProspectPoolCount  = null;
        needAnanlysisProspectCount  = null;
        proposalStatusCount  = null;
        proposalPendingCount  = null;
        proposalIncompleteCount  = null;
        suspectAllocationCount  = null;
        propspectAllocationCount  = null;
        quotationAllocationCount  = null;
        proposalAllocationCount  = null;
        proposalFailedCount  = null;
        lstCashLessRiderChildren  = null;
        lstBenifitDetails  = null;
        lstPackageDetails  = [];
        lstPremiumDetails  = null;
        lstMedicalReports  = null;
        listAssured  = null;
        annualPremium  = null;
        halfYearlyPremium  = null;
        quaterlyPremium  = null;
        monthlyPremium  = null;
        singlePremium  = null;
        totalPremium  = null;
        cess  = null;
        vat  = null;
        policyFee  = null;
        investmentPremium  = null;
        protectionPremium  = null;
        investmentTotalPremium  = null;
        totalRiderPremium  = null;
        contributionAmtCess  = null;
        premiumCess  = null;
        isForService  = null;
        suminsured  = null;
        premium  = null;
        productBasicPremium  = null;
        quoteNo  = null;
        policyNo  = null;
        isLi4InsuranceCovered  = null;
        li4InsurancePremiumAmount  = null;
        proposalNo  = null;
        planName  = null;
        planCode  = null;
        term  = null;
        policyTerm  = null;
        paymentTerm  = null;
        loanAmount  = null;
        interestRate  = null;
        paymentFrequency  = null;
        paymentPaidBy  = null;
        paymentMethod  = null;
        paymentReceiptPrefferdBy = null;
        modeOfCommunication  = null;
        others  = null;
        totalPremiumPayble  = null;
        totalAmountPaid  = null;
        balancetobePaid  = null;
        underWriterRemarks  = null;
        isclIncluded  = null;
        saType  = null;
        coverType  = null;
        scheme  = null;
        preferredLanguage  = null;
        objProspectDetails  = null;
        objFillMemberDetials  = null;
        isRegAsCommunication  = null;
        status  = null;
        uwMessage  = null;
        listPlan  = null;
        lstPolicyTerm  = null;
        lstPremiumTerm  = null;
        hdnDocumentDetails  = null;
        assuredName  = null;
        assuredIndex  = null;
        policyId  = _policyID;
        procceedToPayment  = null;
        objPaymentInfo  = null;
        isSpouseCovered  = null;
        isViewProposal  = null;
        objSuspectReAllocation  = null;
        objMemberDetails  = [];
        objNomineeDetails  = null;
        childHeight  = null;
        childWeight  = null;
        childHeightUnit  = null;
        childWeightUnit  = null;
        childSuffer  = null;
        childUnderMedication  = null;
        sufferDetails  = null;
        noofJsPolicies  = null;
        areyouCoveredUnderOtherPolicies  = null;
        noofOtherPolicies  = null;
        totalDeath  = null;
        totalAccidental  = null;
        totalCritical  = null;
        totalHospitalization  = null;
        totalHospitalizationReimbursement  = null;
        isAllocationReq  = null;
        objLifeAssuredOtherInsurance  = null;
        policyStageId  = null;
        policyStageStatusId  = null;
        signature  = null;
        byteArray  = null;
        strHtml  = null;
        prospectSignature  = null;
        prospectSignaturePath  = null;
        prospectByteArray  = null;
        doctorName  = null;
        labName  = null;
        paymentMadeByForDoctor  = null;
        paymentMadeByForLab  = null;
        reportsTobeSendTo  = null;
        medicalTestExists  = null;
        childId  = null;
        questionAnswer  = null;
        diseaseQuestionCount  = null;
        prospectSignPath  = null;
        prospectImagePath  = null;
        spouseSignPath  = null;
        emailFrom  = null;
        emailPassword  = null;
        emailImageLogo  = null;
        domain  = null;
        smtpHost  = null;
        port  = null;
        isUat  = null;
        uatImage  = null;
        category  = null;
        referredBy  = null;
        referralReason  = null;
        decision  = null;
        lstDecision  = null;
        rejection  = null;
        lstRejection  = null;
        uwComments  = null;
        isExlusions  = null;
        exlusionsDetails  = null;
        isLoading  = null;
        loadingDetails  = null;
        healthCheckupCategory  = null;
        lstHealthCheckupCategory  = null;
        underwriter  = null;
        lstUnderwriter  = null;
        objDocumentUploadedFiles  = null;
        objDocumentUpload  = [];
        maritalStatuslist  = null;
        nationalities  = null;
        lstGender  = [];
        lstOccupation  = [];
        lstLanguage  = null;
        lstSalutation  = null;
        lstDocumentType  = null;
        lstRelations  = null;
        lstNomineeRelations  = null;
        lstPaymentfrequency  = null;
        lstPaymentMethod  = null;
        lstSateofHealth  = null;
        lstCauseOfDeath  = null;
        lstFamilyBackGroundRelationship  = null;
        lstDiseaseFamilyBackGroundRelationship  = null;
        lstGenitoDiseaseBackGroundRelationship  = null;
        lstSmokeAndAlcholPer  = null;
        lstSmokeTypes  = null;
        lstAlcoholTypes  = null;
        lstCurrentStatus  = null;
        lstAerobicExercise  = null;
        lstFruitOrVegetablePortions  = null;
        lstFluidOrWater  = null;
        lstDoctorNames  = null;
        lstLabNames  = null;
        lstHeight  = null;
        lstWeight  = null;
        lstCity  = null;
        lstDependentRelationship = [];
        lstModeofCommunication  = null;
        lstPreferredReceipt  = null;
        objListApproval  = null;
        lstCountryCode  = null;
        lstApprovalStatus  = null;
        lstPolicyPaymentItems  = [];
        quotePdfPath  = null;
        financialNeedAnalysisPath  = null;
        proposalFormPath  = null;
  }
   Map toJson()=>{
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
        "LstBenifitDetails": lstBenifitDetails,
        "LstPackageDetails": lstBenifitDetails,
        "LstPremiumDetails": lstPremiumDetails,
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
        "TotalPremiumPayble": totalPremiumPayble,
        "TotalAmountPaid": totalAmountPaid,
        "BalancetobePaid": balancetobePaid,
        "UnderWriterRemarks": underWriterRemarks,
        "IsclIncluded": isclIncluded,
        "saType": saType,
        "coverType": coverType,
        "scheme": scheme,
        "PreferredLanguage": preferredLanguage,
        "objProspectDetails": objProspectDetails,
        "objFillMemberDetials": objFillMemberDetials,
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
        "objMemberDetails": objMemberDetails,
        "objNomineeDetails": objNomineeDetails,
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
        "objDocumentUpload": objDocumentUpload,
        "MaritalStatuslist": maritalStatuslist,
        "Nationalities": nationalities,
        "lstGender": lstGender,
        "lstOccupation": lstOccupation,
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
        "lstDiseaseFamilyBackGroundRelationship": lstDiseaseFamilyBackGroundRelationship,
        "lstGenitoDiseaseBackGroundRelationship": lstGenitoDiseaseBackGroundRelationship,
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
        "lstDependentRelationship":lstDependentRelationship ,
        "LstModeofCommunication": lstModeofCommunication,
        "LstPreferredReceipt": lstPreferredReceipt,
        "objListApproval": objListApproval,
        "LstCountryCode": lstCountryCode,
        "LstApprovalStatus": lstApprovalStatus,
        "lstPolicyPaymentItems": lstPolicyPaymentItems,
        "QuotePDFPath": quotePdfPath,
        "FinancialNeedAnalysisPath": financialNeedAnalysisPath,
        "ProposalFormPath": proposalFormPath,
   };
}