import 'dart:convert';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:intl/intl.dart';


class SaveNeedAnalysis{
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
    SaveNeedAnalysis({
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

    SaveNeedAnalysis.fromJson(Map _subSectionDetails,String contactID,String loginUserName,List _mediaData, List<FieldData> _fieldData){
        productId = null;
        clientCode = null;
        isClientExist=  false;
        isClientExistFromService = null;
        dob = null;
        exisitingAdvisorName = null;
        userName = loginUserName;
        isForServices = false;
        type = (_subSectionDetails[1002][1] as SectionSubSection).fieldValue;
        salutation = (_subSectionDetails[1002][2] as SectionSubSection).fieldValue;
        name = (_subSectionDetails[1002][3] as SectionSubSection).fieldValue;
        lastName = (_subSectionDetails[1002][4] as SectionSubSection).fieldValue;
        mobile = ((_subSectionDetails[1002][12] as SectionSubSection).fieldValue.length > 0) ? ((_subSectionDetails[1002][12] as SectionSubSection).fieldValue.split("@")[1])  : null;
        email = (_subSectionDetails[1002][9] as SectionSubSection).fieldValue;;
        work = ((_subSectionDetails[1002][11] as SectionSubSection).fieldValue.length > 0) ? ((_subSectionDetails[1002][11] as SectionSubSection).fieldValue.split("@")[1])  : null;
        mobileCountryCode = ((_subSectionDetails[1002][12] as SectionSubSection).fieldValue.length > 0) ? ((_subSectionDetails[1002][12] as SectionSubSection).fieldValue.split("@")[2])  : null;
        homeCountryCode = ((_subSectionDetails[1002][10] as SectionSubSection).fieldValue.length > 0) ? ((_subSectionDetails[1002][10] as SectionSubSection).fieldValue.split("@")[2])  : null;
        workCountryCode = ((_subSectionDetails[1002][11] as SectionSubSection).fieldValue.length > 0) ? ((_subSectionDetails[1002][11] as SectionSubSection).fieldValue.split("@")[2])  : null;
        lstCountryCode = null;
        home = ((_subSectionDetails[1002][10] as SectionSubSection).fieldValue.length > 0) ? ((_subSectionDetails[1002][10] as SectionSubSection).fieldValue.split("@")[1])  : null;
        age = int.parse((_subSectionDetails[1002][8] as SectionSubSection).fieldValue);
        dateofBirth = DateTime.parse((_subSectionDetails[1002][7] as SectionSubSection).fieldValue);
        isQuoteCreated = false;
        strDateofBirth = null;
        occupation = ((_subSectionDetails[1002][13] as SectionSubSection).fieldValue.length > 0) ? int.parse((_subSectionDetails[1002][13] as SectionSubSection).fieldValue) : null;
        employerName = (_subSectionDetails[1003][8] as SectionSubSection).fieldValue;
        nic = (_subSectionDetails[1002][5] as SectionSubSection).fieldValue;
        gender = (_subSectionDetails[1002][6] as SectionSubSection).fieldValue;
        maritalStatus = (_subSectionDetails[1002][15] as SectionSubSection).fieldValue;
        displayMaritalStatus = (_subSectionDetails[1002][15] as SectionSubSection).fieldValue;
        avgMonthlyIncome = (_subSectionDetails[1002][14] as SectionSubSection).fieldValue;
        qutotaionCreatedDate = null;
        njevChildName = null;
        isDeleted = null;
        message = null;
        contactId = int.parse(contactID);
        stageId = null;
        objAddress = ObjAddress.formJson(_subSectionDetails);
        objNeedAnalysis = ObjNeedAnalysis.formJson(_subSectionDetails,contactID,_mediaData,_fieldData);
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
        isConfirmedProspect = false;
        isNeedAnalysisCompleted = true;
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
        address1 = (_subSectionDetails[1002][17] as SectionSubSection).fieldValue;
        address2 = (_subSectionDetails[1002][18] as SectionSubSection).fieldValue;
        address3 = null;
        pincodeId = null;
        city = (_subSectionDetails[1002][21] as SectionSubSection).fieldValue;
        district = (_subSectionDetails[1002][20] as SectionSubSection).fieldValue;
        state = (_subSectionDetails[1002][19] as SectionSubSection).fieldValue;
        country = null;
        pincode = (_subSectionDetails[1002][22] as SectionSubSection).fieldValue;
        pincodeNew = null;
        stateId = null;
        province = (_subSectionDetails[1002][19] as SectionSubSection).fieldValue;
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

    ObjNeedAnalysis.formJson(Map _subSectionDetails,String contactID,List _mediaData, List<FieldData> _fieldData){
        needAnalysisId =  0.0;
        prospectDob = (_subSectionDetails[1002][7] as SectionSubSection).fieldValue;
        objSpouseDetails = FNAObjSpouseDetails.formJson(_subSectionDetails);
        objDependents = List<ObjDependents>.from(returnDependents(_subSectionDetails).map((e) => ObjDependents.formJson(e)));
        objEstimateDetails = ObjEstimateDetails.formJson(_subSectionDetails);
        objAssetsAndLiabilities = ObjAssetsAndLiabilities.formJson(_subSectionDetails);
        objFamilyIncome = ObjFamilyIncome.formJson(_subSectionDetails);
        objNeeds = List<ObjNeeds>.from(returnObjNeeds(_subSectionDetails).map((e) => ObjNeeds.formJson(e)));
        total = (_subSectionDetails[1007][8] as SectionSubSection).fieldValue;
        productSelected = null;
        comments =(_subSectionDetails[1007][9] as SectionSubSection).fieldValue;
        needAnalysisFileAttachment = null;
        dateOfNextMeeting = ((_subSectionDetails[1008][2] as SectionSubSection).fieldValue.length> 0) ? (_subSectionDetails[1008][2] as SectionSubSection).fieldValue : null;
        List _timeList = ((_subSectionDetails[1008][3] as SectionSubSection).fieldValue.length > 0) ? 
        returnTimeStringWithFiledValue((_subSectionDetails[1008][3] as SectionSubSection).fieldValue).split(" ") : [];
        if(_timeList.length > 0){
           _timeList[1] = "0000"; 
        }
        timeOfNextMeeting = (_timeList.length > 0) ? _timeList.join(":") : null;
        purposeOfMeeting =  (_subSectionDetails[1008][4] as SectionSubSection).fieldValue;
        purposeOfMeeting1 = (_subSectionDetails[1008][5] as SectionSubSection).fieldValue;
        uploadSignPath = _mediaData.length > 0 ? _mediaData[0]["FileName"] : null;//"E:\\JSDocuments\\" + "ContactID_" + contactID.toString() + "\\1126.png";
        prospectSign = null;
        createdDate  = (_subSectionDetails[1008][8] as SectionSubSection).fieldValue;
        final _selectedProduct = _fieldData.where((e)=> (e.fieldId == (_subSectionDetails[1008][9] as SectionSubSection).fieldID) && (e.fieldDataID == (_subSectionDetails[1008][9] as SectionSubSection).fieldValue)).toList()[0];
        selectedProducts = _selectedProduct.fieldValue;
    }

    returnTimeStringWithFiledValue(String filedValue){
      final time = DateTime.parse(filedValue);
      final temp = DateFormat.jm().format(DateFormat("hh:mm:ss").parse(time.hour.toString() + ":" + time.minute.toString() + ":" + "00")); 
      return  temp.toString();
    }

    returnProducutSelected(SectionSubSection _subSectionDetails) async {
      List<FieldData> fieldDataDetails = await DBHelper().getFieldDataWithFieldDataID( _subSectionDetails.fieldValue, 1081);
      if (fieldDataDetails.length > 0) {
        return fieldDataDetails[0].fieldValue;
      }
      return "";
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
      fullName  = (_subSectionDetails[1003][10] as SectionSubSection).fieldValue;
      dateOfBirth = ((_subSectionDetails[1003][11] as SectionSubSection).fieldValue.length > 0) ? (_subSectionDetails[1003][11] as SectionSubSection).fieldValue : null;
      age = ((_subSectionDetails[1003][12] as SectionSubSection).fieldValue.length > 0) ?  (int.parse((_subSectionDetails[1003][12] as SectionSubSection).fieldValue)) : null;
      maritialStatus = null;
      occuaptionId = (_subSectionDetails[1003][13] as SectionSubSection).fieldValue;
      employer = (_subSectionDetails[1003][14] as SectionSubSection).fieldValue;
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
   final dependentData = (_subSectionDetails[1003][17] as SectionSubSection);
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
    food = (_dependentsDetails[1004][1] as SectionSubSection).fieldValue;
    houseElectricityWaterRent = (_dependentsDetails[1004][2] as SectionSubSection).fieldValue;
    clothes = (_dependentsDetails[1004][3] as SectionSubSection).fieldValue;
    transport = (_dependentsDetails[1004][4] as SectionSubSection).fieldValue;
    familyEducation = (_dependentsDetails[1004][6] as SectionSubSection).fieldValue;
    healthCare = (_dependentsDetails[1004][5] as SectionSubSection).fieldValue;
    specialEvents = (_dependentsDetails[1004][7] as SectionSubSection).fieldValue;
    maidAndOtherHelpers = (_dependentsDetails[1004][8] as SectionSubSection).fieldValue;
    otherMontly = (_dependentsDetails[1004][9] as SectionSubSection).fieldValue;
    totalMonthlyExp = (_dependentsDetails[1004][10] as SectionSubSection).fieldValue;
    monthlyInstallments = (_dependentsDetails[1004][11] as SectionSubSection).fieldValue;
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
     landOrHouse = (_sectionSubsectionDetails[1005][2] as SectionSubSection).fieldValue;
     motorVehicle = (_sectionSubsectionDetails[1005][3] as SectionSubSection).fieldValue;
     bankDeposits = (_sectionSubsectionDetails[1005][5] as SectionSubSection).fieldValue;
     investments = (_sectionSubsectionDetails[1005][6] as SectionSubSection).fieldValue;
     assetsTotal = (_sectionSubsectionDetails[1005][7] as SectionSubSection).fieldValue;
     motorVehicleType = (_sectionSubsectionDetails[1005][4] as SectionSubSection).fieldValue;
     isLiabilitiesCovered = ( (_sectionSubsectionDetails[1005][9] as SectionSubSection).fieldValue == "1") ? true : false;
     loans = (_sectionSubsectionDetails[1005][9] as SectionSubSection).fieldValue;
     mortgauges = (_sectionSubsectionDetails[1005][10] as SectionSubSection).fieldValue;
     leases = (_sectionSubsectionDetails[1005][11] as SectionSubSection).fieldValue;
     others = (_sectionSubsectionDetails[1005][12] as SectionSubSection).fieldValue;
     liabTotal = (_sectionSubsectionDetails[1005][13] as SectionSubSection).fieldValue;
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
  List<LstPrevInsuranceDetails> objLstPrevInsuranceDetails;
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
    prospectMonthlyIncome = (_sectionSubsectionDetails[1006][2] as SectionSubSection).fieldValue;
    spouseMonthlyIncome = (_sectionSubsectionDetails[1006][3] as SectionSubSection).fieldValue;
    houseHoldTotal = (_sectionSubsectionDetails[1006][4] as SectionSubSection).fieldValue;
    capitalReq =  (_sectionSubsectionDetails[1006][7] as SectionSubSection).fieldValue;
    personalLifeInsurance = null;
    savingsAndInvestments = (_sectionSubsectionDetails[1006][18] as SectionSubSection).fieldValue;
    totalProtection = (_sectionSubsectionDetails[1006][19] as SectionSubSection).fieldValue;
    gapIdentified = (_sectionSubsectionDetails[1006][20] as SectionSubSection).fieldValue;
    totalDeath = (_sectionSubsectionDetails[1006][13] as SectionSubSection).fieldValue;
    totalAccidental = (_sectionSubsectionDetails[1006][14] as SectionSubSection).fieldValue;
    totalCritical = (_sectionSubsectionDetails[1006][15] as SectionSubSection).fieldValue;
    totalHospitalization = (_sectionSubsectionDetails[1006][16] as SectionSubSection).fieldValue;
    totalHospitalizationReimbersement = (_sectionSubsectionDetails[1006][17] as SectionSubSection).fieldValue;
    rateOfInterest = ((_sectionSubsectionDetails[1006][6] as SectionSubSection).fieldValue.length > 0) ? int.parse((_sectionSubsectionDetails[1006][6] as SectionSubSection).fieldValue) : 0;
    objLstPrevInsuranceDetails = List<LstPrevInsuranceDetails>.from(returnLstPrevInsuranceDetails((_sectionSubsectionDetails[1006][12] as SectionSubSection).fieldValue).map((e) => LstPrevInsuranceDetails.formJson(e)));
    isOtherInsurance = ((_sectionSubsectionDetails[1006][9] as SectionSubSection).fieldValue == "1") ? true : false;
    noOfJanashaktiPolicy = (_sectionSubsectionDetails[1006][10] as SectionSubSection).fieldValue;
    noOfOtherPolicies = (_sectionSubsectionDetails[1006][11] as SectionSubSection).fieldValue;
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
      final dependentData = (_sectionSubsectionDetails[1007][i + 1] as SectionSubSection);
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