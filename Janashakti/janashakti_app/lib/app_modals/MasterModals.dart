
//SectionMaster
import 'dart:ui';

import 'package:flutter/material.dart';

class SectionMaster {
  int sectionID;
  String sectionName;

  SectionMaster({
    this.sectionID,
    this.sectionName
  });

  SectionMaster.fromMap(Map map) {
    sectionID = map[sectionID];
    sectionName = map[sectionName];
  }
}

//RiderMaster
class RiderMaster {
  String benefitCode;
  int main;
  int spouse;
  int child;
  String benefitName;
  String description;
  String imageName;
  String benefitID;
  String riderCode;
  String planCode;
  int sortOrder;
  int isEditable;
  String min;
  String max;
  String multiple;

  RiderMaster({
    this.benefitCode,
    this.main,
    this.spouse,
    this.child,
    this.benefitName,
    this.description,
    this.imageName,
    this.benefitID,
    this.riderCode,
    this.planCode,
    this.sortOrder,
    this.isEditable,
    this.min,
    this.max,
    this.multiple
  });
}

class PremiumDetails{
  String min;
  String max;
  String multiple;
  String sumAssured;
  String premiumm;
  String modePremium;
  String totalModePremium;
  String annualPremium;
  String halfYearlyPremium;
  String quaterlyPremium;
  String monthlyPremium;
  String benfitCode;
  int riderIndex;
  TextEditingController sumAssuredTextEditingController;
  TextEditingController minTextEditingController;
  TextEditingController maxTextEditingController;
  TextEditingController multipleTextEditingController;
  TextEditingController premiumTextEditingController;
  TextEditingController modePremiumTextEditingController;
  TextEditingController totalModeTextEditingController;
  TextEditingController annualTextEditingController;
  TextEditingController halfYearlyTextEditingController;
  TextEditingController quaterlyTextEditingController;
  TextEditingController monthlyTextEditingController;
  PremiumDetails({
    this.min,
    this.max,
    this.multiple,
    this.sumAssured,
    this.premiumm,
    this.modePremium,
    this.totalModePremium,
    this.annualPremium,
    this.halfYearlyPremium,
    this.quaterlyPremium,
    this.monthlyPremium,
    this.benfitCode,
    this.riderIndex,
    this.sumAssuredTextEditingController,
    this.minTextEditingController,
    this.maxTextEditingController,
    this.multipleTextEditingController,
    this.premiumTextEditingController,
    this.modePremiumTextEditingController,
    this.totalModeTextEditingController,
    this.annualTextEditingController,
    this.halfYearlyTextEditingController,
    this.quaterlyTextEditingController,
    this.monthlyTextEditingController
  });
}

//HeaderSectionFields
class HeaderSectionFields{
  int fieldID;
  String fieldName;
  int suspect;
  int prospsect;
  int fna;
  int quotation;
  int proposal;
  int payment;
  int status;
  int failedproposals;
  int pendingrequirements;
  String fieldValue;
  String quoteNo;
  String webRefNumber;
  String selectedProduct;
  HeaderSectionFields({
    this.fieldID,
    this.fieldName,
    this.suspect,
    this.prospsect,
    this.fna,
    this.quotation,
    this.proposal,
    this.payment,
    this.status,
    this.failedproposals,
    this.pendingrequirements,
    this.fieldValue,
    this.quoteNo,
    this.webRefNumber,
    this.selectedProduct
  });
}

//HideUnHide
class HideUnHide {
  int fielddeptID;
  int deptFieldDeptID;
  int value;
  HideUnHide({
    this.fielddeptID,
    this.deptFieldDeptID,
    this.value
  });
}


//Guidelines
class Guidelines {
  String name;
  Color color;
  String imgName;

  Guidelines({
    this.name,
    this.color,
    this.imgName
  });
}

//Benefit Details
class BenefitDetails {
  String name;
  Color color;
  String imgName;
  String life;

  BenefitDetails({
    this.name,
    this.color,
    this.imgName,
    this.life
  });
}

//FieldDepdent
  class FieldDependent {
  int fieldID;
  int dependentID;
  int sectionID;
  int dependentFieldID;
  int subsectionID;
  int dependentsubsectionID;

  FieldDependent({
    this.fieldID,
    this.dependentID,
    this.sectionID,
    this.dependentFieldID,
    this.subsectionID,
    this.dependentsubsectionID
  });
}

//SubSectionMaster
class SubSectionMaster {
  int subSectionID;
  String subSectionName;
  int sectionID;

  SubSectionMaster({
  this.subSectionID,
    this.subSectionName,
    this.sectionID
  });

  SubSectionMaster.fromMap(Map map) {
    subSectionID = map[subSectionID];
    subSectionName = map[subSectionName];
    sectionID = map[sectionID];
  }
}

//FieldMaster
class FieldMaster {
  int fieldId;
  String fieldName, fieldType, validationMessage, placeholder;
  int questionID;

  FieldMaster({
    this.fieldId,
    this.fieldName,
    this.fieldType,
    this.validationMessage,
    this.placeholder,
    this.questionID
  });

  FieldMaster.fromMap(Map map) {
    fieldId = map[fieldId];
    fieldName = map[fieldName];
    fieldType = map[fieldType];
    validationMessage = map[validationMessage];
    placeholder = map[placeholder];
    questionID = map[questionID];
  }
}

//FieldData
class FieldData {
  int dataID;
  int fieldId;
  String fieldValue;
  String fieldDataID;
  String fieldDepdentID;
  int isShown;

  FieldData({
    this.dataID,
    this.fieldId,
    this.fieldValue,
    this.fieldDataID,
    this.fieldDepdentID,
    this.isShown
  });

  

  // FieldData.fromMap(Map map) {
  //   fieldDataId = map[fieldDataId];
  //   fieldId = map[fieldId];
  //   fieldValue = map[fieldValue];
  // }

  toLowerCase() {}
}

//ExpandCollapse
 class ExpandCollapseData {
 int fieldID;
 int ecFieldID;
 int fieldDependencyID;
 
 ExpandCollapseData({
 this.fieldID,
 this.ecFieldID,
 this.fieldDependencyID
 });
}

//JsonObject
class JsonObject{
  String webRefNumber;
  String suspectObject;
  String prospectObject;
  String fnaObject;
  String premiumObject;
  String quotationObject;
  String quotationPool;
  String incompleteProposalInfo;
  String proposalInfo;
  String proposalObject;
  String paymentObject;
JsonObject({
  this.webRefNumber,
  this.suspectObject,
  this.prospectObject,
  this.fnaObject,
  this.premiumObject,
  this.quotationObject,
  this.quotationPool,
  this.incompleteProposalInfo,
  this.proposalInfo,
  this.proposalObject,
  this.paymentObject
});
}

//Premium and Coverage Deails
class PremiumCoverageDetails{
  String benifitCode;
  String sumAssured;
  String description;
  TextEditingController textEditingController;
  PremiumCoverageDetails({
    this.benifitCode,
    this.description,
    this.sumAssured,
    this.textEditingController
  });
}

//ServiceResponseID
class ServiceResponseID{
  String webRefNumber;
  String contactID;
  String quotationNumber;
  String proposalNumber;
  ServiceResponseID({
    this.webRefNumber,
    this.contactID,
    this.quotationNumber,
    this.proposalNumber
  });
}

//FieldDependency
class FieldDependency {
  int subSectionId;
  int fieldId;
  int sortOrder;
  int isMandatory;
  int isEditable;
  int isDependent;
  int isHide;
  int fieldDependencyID;

  FieldDependency({
    this.subSectionId,
    this.fieldId,
    this.sortOrder,
    this.isMandatory,
    this.isEditable,
    this.isDependent,
    this.isHide,
    this.fieldDependencyID
  });

  FieldDependency.fromMap(Map map) {
    subSectionId = map[subSectionId];
    fieldId = map[fieldId];
    sortOrder = map[sortOrder];
    isMandatory = map[isMandatory];
    isEditable = map[isEditable];
  }
}

//Login
class Login{
   String userID;
   String username;
   String address;
   String iD;
   String themcolor;

   Login({
     this.userID,
     this.username,
     this.address,
     this.iD,
     this.themcolor
   });
 }

 //Field Response
 class FieldResponse{
   int fieldID;
   int sectionID;
   int subSectionID;
   String fieldValue;
   String webRefNumber;
   int fieldDependencyID;

   FieldResponse({
     this.fieldID,
     this.sectionID,
     this.subSectionID,
     this.fieldValue,
     this.webRefNumber,
     this.fieldDependencyID
   });
 }