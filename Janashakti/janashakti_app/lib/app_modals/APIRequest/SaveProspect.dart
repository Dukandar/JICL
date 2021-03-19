import 'package:jiclapp/app_util/Constant.dart';

class SaveProspect{
  dynamic productId;
    dynamic clientCode;
    bool isClientExist;
    dynamic isClientExistFromService;
    dynamic dob;
    dynamic exisitingAdvisorName;
    String userName;
    bool isForServices;
    String type;
    String salutation;
    String name;
    String lastName;
    String mobile;
    String email;
    dynamic work;
    String mobileCountryCode;
    String homeCountryCode;
    String workCountryCode;
    dynamic lstCountryCode;
    dynamic home;
    int age;
    DateTime dateofBirth;
    bool isQuoteCreated;
    dynamic strDateofBirth;
    int occupation;
    dynamic employerName;
    dynamic nic;
    dynamic gender;
    dynamic maritalStatus;
    dynamic displayMaritalStatus;
    dynamic avgMonthlyIncome;
    dynamic qutotaionCreatedDate;
    dynamic njevChildName;
    bool isDeleted;
    dynamic message;
    int contactId;
    int stageId;
    ObjAddress objAddress;
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
    SaveProspect({
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

    SaveProspect.fromJson(Map _subSectionDetails,String contactID,String userName){
        productId = null;
        clientCode = null;
        isClientExist=  null;
        isClientExistFromService = null;
        dob = null;
        exisitingAdvisorName = null;
        userName = userName;
        isForServices = null;
        type = (_subSectionDetails[1001][1] as SectionSubSection).fieldValue;
        salutation = (_subSectionDetails[1001][2] as SectionSubSection).fieldValue;
        name = (_subSectionDetails[1001][3] as SectionSubSection).fieldValue;
        lastName = (_subSectionDetails[1001][4] as SectionSubSection).fieldValue;
        mobile = ((_subSectionDetails[1001][10] as SectionSubSection).fieldValue.length > 0) ? ((_subSectionDetails[1001][10] as SectionSubSection).fieldValue.split("@")[1])  : null;
        email = (_subSectionDetails[1001][7] as SectionSubSection).fieldValue;;
        work = ((_subSectionDetails[1001][6] as SectionSubSection).fieldValue.length > 0) ? ((_subSectionDetails[1001][6] as SectionSubSection).fieldValue.split("@")[1])  : null;
        mobileCountryCode = ((_subSectionDetails[1001][10] as SectionSubSection).fieldValue.length > 0) ? ((_subSectionDetails[1001][10] as SectionSubSection).fieldValue.split("@")[2])  : null;
        homeCountryCode = ((_subSectionDetails[1001][5] as SectionSubSection).fieldValue.length > 0) ? ((_subSectionDetails[1001][5] as SectionSubSection).fieldValue.split("@")[2])  : null;
        workCountryCode = ((_subSectionDetails[1001][6] as SectionSubSection).fieldValue.length > 0) ? ((_subSectionDetails[1001][6] as SectionSubSection).fieldValue.split("@")[2])  : null;
        lstCountryCode = null;
        home = ((_subSectionDetails[1001][5] as SectionSubSection).fieldValue.length > 0) ? ((_subSectionDetails[1001][5] as SectionSubSection).fieldValue.split("@")[1])  : null;
        age = int.parse((_subSectionDetails[1001][9] as SectionSubSection).fieldValue);
        dateofBirth = DateTime.parse((_subSectionDetails[1001][8] as SectionSubSection).fieldValue);
        isQuoteCreated = null;
        strDateofBirth = null;
        occupation = ((_subSectionDetails[1001][11] as SectionSubSection).fieldValue.length > 0) ? int.parse((_subSectionDetails[1001][11] as SectionSubSection).fieldValue) : null;
        employerName = null;
        nic = null;
        gender = null;
        maritalStatus = null;
        displayMaritalStatus = null;
        avgMonthlyIncome = null;
        qutotaionCreatedDate = null;
        njevChildName = null;
        isDeleted = null;
        message = null;
        contactId = int.parse(contactID);
        stageId = null;
        objAddress = ObjAddress.formJson(_subSectionDetails);
        objNeedAnalysis = ObjNeedAnalysis.formJson(_subSectionDetails);
        existsContactId = null;
        isQuickQuote = null;
        isPremiumQuickQuote = null;
        signature = null;
        byteArray = null;
        isExisitingClint = null;
        objSuspectPool = null;
        listSuspectPool = null;
        lstDecision = null;
        lstReportee = null;
        lstDownloadSuspectInfo = null;
        objProspectReAllocate = null;
        objProspectPool = null;
        isConfirmedProspect = null;
        isNeedAnalysisCompleted = null;
        prospectStage = null;
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
        isApproved = null;
        isClientExistInNeedAnalysis = null;
    }

    Map toJson()=>{
        "ProductId": productId,
        "ClientCode": clientCode,
        "IsClientExist": isClientExist,
        "IsClientExistFromService": isClientExistFromService,
        "DOB": dob,
        "ExisitingAdvisorName": exisitingAdvisorName,
        "UserName": userName,
        "IsForServices": isForServices,
        "Type": type,
        "Salutation": salutation,
        "Name": name,
        "LastName": lastName,
        "Mobile": mobile,
        "Email": email,
        "Work": work,
        "MobileCountryCode": mobileCountryCode,
        "HomeCountryCode": homeCountryCode,
        "WorkCountryCode": workCountryCode,
        "LstCountryCode": lstCountryCode,
        "Home": home,
        "Age": age,
        "DateofBirth": dateofBirth.toIso8601String(),
        "IsQuoteCreated": isQuoteCreated,
        "STRDateofBirth": strDateofBirth,
        "Occupation": occupation,
        "EmployerName": employerName,
        "NIC": nic,
        "Gender": gender,
        "MaritalStatus": maritalStatus,
        "DisplayMaritalStatus": displayMaritalStatus,
        "AvgMonthlyIncome": avgMonthlyIncome,
        "QutotaionCreatedDate": qutotaionCreatedDate,
        "NJEVChildName": njevChildName,
        "IsDeleted": isDeleted,
        "Message": message,
        "ContactID": contactId,
        "StageId": stageId,
        "objAddress": objAddress.toJson(),
        "objNeedAnalysis": objNeedAnalysis.toJson(),
        "ExistsContactID": existsContactId,
        "isQuickQuote": isQuickQuote,
        "isPremiumQuickQuote": isPremiumQuickQuote,
        "Signature": signature,
        "ByteArray": byteArray,
        "IsExisitingClint": isExisitingClint,
        "ObjSuspectPool": objSuspectPool,
        "listSuspectPool": listSuspectPool,
        "lstDecision": lstDecision,
        "lstReportee": lstReportee,
        "lstDownloadSuspectInfo": lstDownloadSuspectInfo,
        "ObjProspectReAllocate": objProspectReAllocate,
        "ObjProspectPool": objProspectPool,
        "IsConfirmedProspect": isConfirmedProspect,
        "IsNeedAnalysisCompleted": isNeedAnalysisCompleted,
        "ProspectStage": prospectStage,
        "ReasonForRemove": reasonForRemove,
        "ListPlan": listPlan,
        "lstSalutation": lstSalutation,
        "lstOccupation": lstOccupation,
        "lstGender": lstGender,
        "MaritalStatuslist": maritalStatuslist,
        "lstRelations": lstRelations,
        "lstMotorVehicle": lstMotorVehicle,
        "lstDependentRelationship": lstDependentRelationship,
        "lstAvgMonthlyIncome": lstAvgMonthlyIncome,
        "lstCurrentStatus": lstCurrentStatus,
        "lstNeedsPriority": lstNeedsPriority,
        "lstPurposeOfMeeting": lstPurposeOfMeeting,
        "isApproved": isApproved,
        "IsClientExistInNeedAnalysis": isClientExistInNeedAnalysis,
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
        address1 = (_subSectionDetails[1001][13] as SectionSubSection).fieldValue;
        address2 = (_subSectionDetails[1001][14] as SectionSubSection).fieldValue;
        address3 = null;
        pincodeId = null;
        city = (_subSectionDetails[1001][17] as SectionSubSection).fieldValue;
        district = (_subSectionDetails[1001][16] as SectionSubSection).fieldValue;
        state = (_subSectionDetails[1001][15] as SectionSubSection).fieldValue;
        country = null;
        pincode = (_subSectionDetails[1001][18] as SectionSubSection).fieldValue;
        pincodeNew = null;
        stateId = null;
        province = (_subSectionDetails[1001][15] as SectionSubSection).fieldValue;
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
