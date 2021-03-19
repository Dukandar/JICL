import 'dart:convert';
import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:jiclapp/app_modals/Fields/Button.dart';
import 'package:jiclapp/app_modals/Fields/Checkbox.dart';
import 'package:jiclapp/app_modals/Fields/CoverageDetails.dart';
import 'package:jiclapp/app_modals/Fields/CustomButton.dart';
import 'package:jiclapp/app_modals/Fields/CustomCheckbox.dart';
import 'package:jiclapp/app_modals/Fields/CustomDocument.dart';
import 'package:jiclapp/app_modals/Fields/CustomDropDown.dart';
import 'package:jiclapp/app_modals/Fields/CustomSelection.dart';
import 'package:jiclapp/app_modals/Fields/CustomUpload.dart';
import 'package:jiclapp/app_modals/Fields/CustomeSpinner.dart';
import 'package:jiclapp/app_modals/Fields/ExpandCollapse.dart';
import 'package:jiclapp/app_modals/Fields/LabelView.dart';
import 'package:jiclapp/app_modals/Fields/MainLabel.dart';
import 'package:jiclapp/app_modals/Fields/NomineeDetails.dart';
import 'package:jiclapp/app_modals/Fields/Segment.dart';
import 'package:jiclapp/app_modals/Fields/TextBox.dart';
import 'package:jiclapp/app_modals/Fields/TimePicker.dart';
import 'package:jiclapp/app_modals/Fields/CustomHeaderLabel.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/Utility.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'Fields/DatePicker.dart';
import 'Fields/DependentField.dart';
import 'Fields/DependentView.dart';
import 'Fields/DropDown.dart';
import 'Fields/ImagePicker.dart';
import 'Fields/Label.dart';
import 'Fields/MediaController.dart';
import 'Fields/Mediaslider.dart';
import 'Fields/Number.dart';
import 'Fields/RadioButton.dart';
import 'Fields/Signature.dart';
import 'Fields/TextArea.dart';
import 'MasterModals.dart';

class DBHelper {
  static Database _sharedInstance;

  Future<Database> get db async {
    if (_sharedInstance != null) return _sharedInstance;
    _sharedInstance = await initDb();
    return _sharedInstance;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "jiclapp.db");
    print("Path" + path);
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE SectionMaster(sectionID INTEGER, sectionName TEXT)");
    await db.execute(
        "CREATE TABLE RiderMaster(benefitCode Text, main INTEGER,spouse INTEGER,child INTEGER,benefitName TEXT, description TEXT, imageName TEXT,benefitID TEXT,riderCode TEXT, planCode TEXT, sortOrder INTEGER, isEditable INTEGER)");
    await db.execute(
        "CREATE TABLE RiderDetails(benefitCode Text,min Text,max Text,multiples Text,suminsured Text,webRefNumber Text,riderIndex INTEGER)");
    await db.execute(
        "CREATE TABLE SubSectionMaster(subSectionID INTEGER, subSectionName TEXT, sectionID INTEGER)");
    await db.execute(
        "CREATE TABLE FieldMaster(fieldId INTEGER, fieldName TEXT, fieldType TEXT, validationMessage TEXT, placeholder TEXT,questionID INTEGER)");
    await db.execute(
        "CREATE TABLE FieldData(dataID INTEGER, fieldId INTEGER, fieldValue TEXT,fieldDataID TEXT,fieldDepdentID TEXT,isShown INTEGER)");
    await db.execute(
        "CREATE TABLE FieldDependency(subSectionId INTEGER, fieldId INTEGER, sortOrder INTEGER, isMandatory INTEGER, isEditable INTEGER,isDependent INTEGER,isHide INTEGER,fieldDependencyID INTEGER)");
    await db.execute(
        "CREATE TABLE FieldDependent(fieldId INTEGER, dependentID INTEGER,sectionID INTEGER,dependentFieldID INTEGER,subsectionID INTEGER,dependentsubsectionID INTEGER)");
    await db.execute(
        "CREATE TABLE Login(userID TEXT,username TEXT,iD TEXT,address TEXT,themcolor TEXT)");
    await db.execute(
        "CREATE TABLE FieldResponse(fieldId INTEGER,sectionId INTEGER,subSectionId INTEGER,fieldValue TEXT,webRefNumber TEXT,fieldDependencyID INTEGER)");
    await db.execute(
        "CREATE TABLE ExpandCollapse(fieldID INTEGER,fieldDependencyID INTEGER,ecFieldID INTEGER)");
    await db.execute(
        "CREATE TABLE ServiceResponseID(webRefNumber Text, contactID Text,quotationNumber Text,proposalNumber Text)");
    await db.execute(
        "CREATE TABLE JsonObject(webRefNumber Text,suspectObject Text,prospectObject Text,fnaObject Text,premiumObject Text,quotationObject Text,quotationPool Text,incompleteProposalInfo Text,proposalInfo Text,proposalObject Text,paymentObject Text)");
    await db.execute(
        "CREATE TABLE HideUnHide(fieldDeptID INTEGER,deptFieldDeptID INTEGER,value INTEGER)");
    await db.execute(
        "CREATE TABLE HeaderSectionFields(fieldID INTEGER,fieldname Text,suspect INTEGER,prospect INTEGER,fna INTEGER,quotation INTEGER,proposal INTEGER,payment INTEGER,status INTEGER,failedproposals INTEGER,pendingrequirements INTEGER)");
  }

//MARK:- Inserting Master data
  Future<bool> insertingMasterData(data) async {
    if (data.length > 0) {
      await Future.forEach(data.keys, (element) async {
        // final detail = data[index];
        //final key = data[element];//data.keys.elementAt(index);
        final csvVData = data[element];
        switch (element) {
          case "SectionMaster":
            bool _ = await insertSectionMasterList(csvVData);
            break;
          case "SubSectionMaster":
            bool _ = await insertSubSectionMasterList(csvVData);
            break;
          case "FieldMaster":
            bool _ = await insertFieldMasterList(csvVData);
            break;
          case "FieldData":
            bool _ = await insertFieldDataList(csvVData);
            break;
          case "FieldDependency":
            bool _ = await insertFieldDependencyList(csvVData);
            break;
          case "FieldDependent":
            bool _ = await insertFieldDependentList(csvVData);
            break;
          case "RiderMaster":
            bool _ = await insertRiderMasterList(csvVData);
            break;
          case "ExpandCollapse":
            bool _ = await insertExpandCollapseMasterList(csvVData);
            break;
          case "HideUnHide":
            bool _ = await insertHideUnHide(csvVData);
            break;
          case "HeaderSectionFields":
            bool _ = await insertIntoHeaderSectionFields(csvVData);
            break;
        }
      });
    }
    return true;
  }

  //MARK:- Insert Into table
  Future<bool> insertIntoHeaderSectionFields(
      List<HeaderSectionFields> items) async {
    var dbClient = await db;
    await Future.forEach(items, (element) async {
      HeaderSectionFields hs = element as HeaderSectionFields;
      await dbClient.transaction((txn) async {
        return txn.rawInsert(
            'INSERT INTO HeaderSectionFields(fieldID,fieldname,suspect,prospect,fna,quotation,proposal,payment,status,failedproposals,pendingrequirements) VALUES (?,?,?,?,?,?,?,?,?,?,?)',
            [
              hs.fieldID,
              hs.fieldName,
              hs.suspect,
              hs.prospsect,
              hs.fna,
              hs.quotation,
              hs.proposal,
              hs.payment,
              hs.status,
              hs.failedproposals,
              hs.pendingrequirements
            ]);
      });
    });
    return true;
  }

  Future<List<HeaderSectionFields>> getHeaderSectionFields(
      String poolName) async {
    var dbClient = await db;
    List<Map> list = await dbClient
        .rawQuery('SELECT * FROM HeaderSectionFields where $poolName = 1');
    List<HeaderSectionFields> hs = new List();
    for (int i = 0; i < list.length; i++) {
      hs.add(new HeaderSectionFields(
        fieldID: list[i]["fieldID"],
        fieldName: list[i]["fieldname"],
        suspect: list[i]["suspect"],
        prospsect: list[i]["prospect"],
        fna: list[i]["fna"],
        quotation: list[i]["quotation"],
        proposal: list[i]["proposal"],
        payment: list[i]["payment"],
        status: list[i]["status"],
        failedproposals: list[i]["failedproposals"],
        pendingrequirements: list[i]["pendingrequirements"],
      ));
    }
    return hs;
  }

  Future<bool> insertHideUnHide(List<HideUnHide> items) async {
    var dbClient = await db;
    await Future.forEach(items, (element) async {
      HideUnHide ec = element as HideUnHide;
      await dbClient.transaction((txn) async {
        return txn.rawInsert(
            'INSERT INTO HideUnHide(fieldDeptID,deptFieldDeptID,value) VALUES (?,?,?)',
            [ec.fielddeptID, ec.deptFieldDeptID, ec.value]);
      });
    });
    return true;
  }

  Future<List<HideUnHide>> getHideUnHideList(int fieldDeptID) async {
    var dbClient = await db;
    List<Map> list = await dbClient
        .rawQuery('SELECT * FROM HideUnHide where fieldDeptID = $fieldDeptID');
    List<HideUnHide> hh = new List();
    for (int i = 0; i < list.length; i++) {
      hh.add(new HideUnHide(
          fielddeptID: list[i]["fieldDeptID"],
          deptFieldDeptID: list[i]["deptFieldDeptID"],
          value: list[i]["value"]));
    }
    return hh;
  }

  Future<bool> insertJsonObject(
      String webRefNumber, String object, String objectName) async {
    var dbClient = await db;
    final tempJsonObject = await getJsonObject(webRefNumber);
    if (tempJsonObject.length <= 0) {
      await dbClient.transaction((txn) async {
        return txn.rawInsert(
            'INSERT INTO JsonObject(webRefNumber,suspectObject,prospectObject,fnaObject,premiumObject,quotationObject,quotationPool,incompleteProposalInfo,proposalInfo,proposalObject,paymentObject) VALUES (?,?,?,?,?,?,?,?,?,?,?)',
            [webRefNumber, object, "", "", "", "", "", "", "", "", ""]);
      });
    } else {
      final _ = await updateJsonObjectWithWebRefNumber(
          webRefNumber, object, objectName);
    }
    return true;
  }

  //Update Service Response
  Future<bool> updateJsonObjectWithWebRefNumber(
      String webRefNumber, String object, String objectName) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      txn.rawUpdate(
          'UPDATE JsonObject SET $objectName = ? WHERE webRefNumber = ?',
          [object, webRefNumber]);
    });
    return true;
  }

  Future<List<JsonObject>> getJsonObject(String webRefNumber) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery(
        'SELECT * FROM JsonObject where webRefNumber = $webRefNumber');
    List<JsonObject> jo = new List();
    for (int i = 0; i < list.length; i++) {
      jo.add(new JsonObject(
          webRefNumber: list[i]["webRefNumber"],
          suspectObject: list[i]["suspectObject"],
          prospectObject: list[i]["prospectObject"],
          fnaObject: list[i]["fnaObject"],
          premiumObject: list[i]["premiumObject"],
          quotationObject: list[i]["quotationObject"],
          quotationPool: list[i]["quotationPool"],
          incompleteProposalInfo: list[i]["incompleteProposalInfo"],
          proposalInfo: list[i]["proposalInfo"],
          proposalObject: list[i]["proposalObject"],
          paymentObject: list[i]["paymentObject"]));
    }
    print(jo.length);
    return jo;
  }

  Future<bool> insertExpandCollapseMasterList(
      List<ExpandCollapseData> items) async {
    var dbClient = await db;
    await Future.forEach(items, (element) async {
      ExpandCollapseData ec = element as ExpandCollapseData;
      await dbClient.transaction((txn) async {
        return txn.rawInsert(
            'INSERT INTO ExpandCollapse(fieldID,fieldDependencyID,ecFieldID) VALUES (?,?,?)',
            [ec.fieldID, ec.fieldDependencyID, ec.ecFieldID]);
      });
    });
    return true;
  }

  Future<List<ExpandCollapseData>> getExpandCollapseMasterList() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM ExpandCollapse');
    List<ExpandCollapseData> sm = new List();
    for (int i = 0; i < list.length; i++) {
      sm.add(new ExpandCollapseData(
          fieldID: list[i]["fieldID"],
          fieldDependencyID: list[i]["fieldDependencyID"],
          ecFieldID: list[i]["ecFieldID"]));
    }
    print(sm.length);
    return sm;
  }

//MARK:- DBHelper methods
//FieldDepdent
  // void insertFieldDependent(FieldDependent sm) async {
  //   var dbClient = await db;
  //   await dbClient.transaction((txn) async {
  //     return txn.rawInsert(
  //         'INSERT INTO FieldDependent(fieldID, dependentID,sectionID,dependentFieldID,subsectionID,dependentsubsectionID) VALUES (?,?,?,?,?,?)',
  //         [sm.fieldID, sm.dependentID,sm.sectionID,sm.dependentFieldID,sm.subsectionID,sm.dependentsubsectionID]);
  //   });
  // }

  Future<bool> insertFieldDependentList(List<FieldDependent> items) async {
    var dbClient = await db;
    await Future.forEach(items, (element) async {
      FieldDependent fd = element as FieldDependent;
      await dbClient.transaction((txn) async {
        return txn.rawInsert(
            'INSERT INTO FieldDependent(fieldID, dependentID,sectionID,dependentFieldID,subsectionID,dependentsubsectionID) VALUES (?,?,?,?,?,?)',
            [
              fd.fieldID,
              fd.dependentID,
              fd.sectionID,
              fd.dependentFieldID,
              fd.subsectionID,
              fd.dependentsubsectionID
            ]);
      });
    });
    return true;
    // items.forEach((FieldDependent item) => insertFieldDependent(item));
  }

  Future<List<FieldDependent>> getFieldDependentList() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM FieldDependent');
    List<FieldDependent> sm = new List();
    for (int i = 0; i < list.length; i++) {
      sm.add(new FieldDependent(
          fieldID: list[i]["fieldId"],
          dependentID: list[i]["dependentID"],
          sectionID: list[i]["sectionID"],
          dependentFieldID: list[i]["dependentFieldID"],
          subsectionID: list[i]["subsectionID"],
          dependentsubsectionID: list[i]["dependentsubsectionID"]));
    }
    print(sm.length);
    return sm;
  }

  Future<List<FieldDependent>> getFieldDependentListWithFieldID(
      int fieldID) async {
    var dbClient = await db;
    List<Map> list = await dbClient
        .rawQuery('SELECT * FROM FieldDependent where fieldID = $fieldID');
    List<FieldDependent> sm = new List();
    for (int i = 0; i < list.length; i++) {
      sm.add(new FieldDependent(
          fieldID: list[i]["fieldId"],
          dependentID: list[i]["dependentID"],
          sectionID: list[i]["sectionID"],
          dependentFieldID: list[i]["dependentFieldID"],
          subsectionID: list[i]["subsectionID"],
          dependentsubsectionID: list[i]["dependentsubsectionID"]));
    }
    print(sm.length);
    return sm;
  }

//Rider Master
  // void insertRiderMaster(RiderMaster sm) async {
  //   var dbClient = await db;
  //   await dbClient.transaction((txn) async {
  //     return txn.rawInsert(
  //         'INSERT INTO RiderMaster(benefitCode, main,spouse,child,benefitName, description, imageName, benefitID,riderCode,planCode, sortOrder, isEditable) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)',
  //         [sm.benefitCode,sm.main,sm.spouse,sm.child,sm.benefitName, sm.description,sm.imageName,sm.benefitID,sm.riderCode,sm.planCode,sm.sortOrder,sm.isEditable]);
  //   });
  // }

  Future<bool> insertRiderMasterList(List<RiderMaster> items) async {
    var dbClient = await db;
    await Future.forEach(items, (element) async {
      RiderMaster rm = element as RiderMaster;
      await dbClient.transaction((txn) async {
        return txn.rawInsert(
            'INSERT INTO RiderMaster(benefitCode, main,spouse,child,benefitName, description, imageName, benefitID,riderCode,planCode, sortOrder, isEditable) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)',
            [
              rm.benefitCode,
              rm.main,
              rm.spouse,
              rm.child,
              rm.benefitName,
              rm.description,
              rm.imageName,
              rm.benefitID,
              rm.riderCode,
              rm.planCode,
              rm.sortOrder,
              rm.isEditable
            ]);
      });
    });
    return true;
    // items.forEach((RiderMaster item) => insertRiderMaster(item));
  }

//Get rider master with plan code
  Future<List<RiderMaster>> getRiderMaster() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM RiderMaster');
    List<RiderMaster> sm = new List();
    for (int i = 0; i < list.length; i++) {
      sm.add(new RiderMaster(
          benefitCode: list[i]["benefitCode"],
          main: (list[i]["main"] == 1) ? 1 : 0,
          spouse: (list[i]["spouse"] == 1) ? 1 : 0,
          child: (list[i]["child"] == 1) ? 1 : 0,
          benefitName: list[i]["benefitName"],
          description: list[i]["description"],
          imageName: list[i]["imageName"],
          benefitID: list[i]["benefitID"],
          riderCode: list[i]["riderCode"],
          planCode: list[i]["planCode"],
          sortOrder: list[i]["sortOrder"],
          isEditable: (list[i]["isEditable"] == 1) ? 1 : 0,
          min: "0",
          max: "0",
          multiple: "0"));
    }
    return sm;
  }

  Future<List<RiderMaster>> getRiderMasterWithPlanCode(String planCode) async {
    var dbClient = await db;
    List<Map> list = await dbClient
        .rawQuery('SELECT * FROM RiderMaster where planCode = "$planCode"');
    List<RiderMaster> sm = new List();
    for (int i = 0; i < list.length; i++) {
      sm.add(new RiderMaster(
          benefitCode: list[i]["benefitCode"],
          main: (list[i]["main"] == 1) ? 1 : 0,
          spouse: (list[i]["spouse"] == 1) ? 1 : 0,
          child: (list[i]["child"] == 1) ? 1 : 0,
          benefitName: list[i]["benefitName"],
          description: list[i]["description"],
          imageName: list[i]["imageName"],
          benefitID: list[i]["benefitID"],
          riderCode: list[i]["riderCode"],
          planCode: list[i]["planCode"],
          sortOrder: list[i]["sortOrder"],
          isEditable: (list[i]["isEditable"] == 1) ? 1 : 0,
          min: "0",
          max: "0",
          multiple: "0"));
    }
    return sm;
  }

  Future<List<RiderMaster>> getRiderMasterWithLife(
      String life, String planCode) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery(
        'SELECT * FROM RiderMaster where planCode = "$planCode" AND "$life" == 1');
    List<RiderMaster> sm = new List();
    for (int i = 0; i < list.length; i++) {
      sm.add(new RiderMaster(
          benefitCode: list[i]["benefitCode"],
          main: (list[i]["main"] == 1) ? 1 : 0,
          spouse: (list[i]["spouse"] == 1) ? 1 : 0,
          child: (list[i]["child"] == 1) ? 1 : 0,
          benefitName: list[i]["benefitName"],
          description: list[i]["description"],
          imageName: list[i]["imageName"],
          benefitID: list[i]["benefitID"],
          riderCode: list[i]["riderCode"],
          planCode: list[i]["planCode"],
          sortOrder: list[i]["sortOrder"],
          isEditable: (list[i]["isEditable"] == 1) ? 1 : 0,
          min: "0",
          max: "0",
          multiple: "0"));
    }
    return sm;
  }

  //MARK:- DBHelper methods
  // void insertSectionMaster(SectionMaster sm) async {
  //   var dbClient = await db;
  //   await dbClient.transaction((txn) async {
  //     print(sm.sectionID);
  //     return txn.rawInsert(
  //         'INSERT INTO SectionMaster(sectionId, sectionName) VALUES (?, ?)',
  //         [sm.sectionID, sm.sectionName]);
  //   });
  // }

  Future<bool> insertSectionMasterList(List<SectionMaster> items) async {
    var dbClient = await db;
    await Future.forEach(items, (element) async {
      SectionMaster sm = element as SectionMaster;
      await dbClient.transaction((txn) async {
        print(sm.sectionID);
        return txn.rawInsert(
            'INSERT INTO SectionMaster(sectionId, sectionName) VALUES (?, ?)',
            [sm.sectionID, sm.sectionName]);
      });
    });
    return true;
    // items.forEach((SectionMaster item) => insertSectionMaster(item));
  }

  Future<List<SectionMaster>> getSectionMasterList() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM SectionMaster');
    List<SectionMaster> sm = new List();
    for (int i = 0; i < list.length; i++) {
      sm.add(new SectionMaster(
          sectionID: list[i]["sectionID"],
          sectionName: list[i]["sectionName"]));
    }
    print(sm.length);
    return sm;
  }

  // // SubSectionMaster
  // void insertSubSectionMaster(SubSectionMaster ssm) async {
  //   var dbClient = await db;
  //   await dbClient.transaction((txn) async {
  //     print(ssm.sectionID);
  //     return txn.rawInsert(
  //         'INSERT INTO SubSectionMaster(subSectionID, subSectionName, sectionID) VALUES (?, ?, ?)',
  //         [ssm.subSectionID, ssm.subSectionName, ssm.sectionID]);
  //   });
  // }

  Future<bool> insertSubSectionMasterList(List<SubSectionMaster> items) async {
    var dbClient = await db;
    await Future.forEach(items, (element) async {
      SubSectionMaster ssm = element as SubSectionMaster;
      await dbClient.transaction((txn) async {
        print(ssm.sectionID);
        return txn.rawInsert(
            'INSERT INTO SubSectionMaster(subSectionID, subSectionName, sectionID) VALUES (?, ?, ?)',
            [ssm.subSectionID, ssm.subSectionName, ssm.sectionID]);
      });
    });
    return true;
    // items.forEach((SubSectionMaster item) => insertSubSectionMaster(item));
  }

  Future<List<SubSectionMaster>> getSubSectionMasterList() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM SubSectionMaster');

    List<SubSectionMaster> sm = new List();
    for (int i = 0; i < list.length; i++) {
      sm.add(new SubSectionMaster(
          subSectionID: list[i]["subSectionID"],
          subSectionName: list[i]["subSectionName"],
          sectionID: list[i]["sectionID"]));
    }
    print(sm.length);
    return sm;
  }

  Future<bool> insertFieldMasterList(List<FieldMaster> items) async {
    var dbClient = await db;
    await Future.forEach(items, (element) async {
      FieldMaster fm = element as FieldMaster;
      await dbClient.transaction((txn) async {
        print(fm.fieldId);
        return txn.rawInsert(
            'INSERT INTO FieldMaster(fieldId, fieldName, fieldType, validationMessage, placeholder,questionID) VALUES (?, ?, ?, ?, ?,?)',
            [
              fm.fieldId,
              fm.fieldName,
              fm.fieldType,
              fm.validationMessage,
              fm.placeholder,
              fm.questionID
            ]);
      });
    });
    return true;
    //items.forEach((FieldMaster item) => insertFieldMaster(item));
  }

  Future<List<FieldMaster>> getFieldMasterList() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM FieldMaster');

    List<FieldMaster> sm = new List();
    for (int i = 0; i < list.length; i++) {
      sm.add(new FieldMaster(
          fieldId: list[i]["fieldId"],
          fieldName: list[i]["fieldName"],
          fieldType: list[i]["fieldType"],
          validationMessage: list[i]["validationMessage"],
          placeholder: list[i]["placeholder"],
          questionID: list[i]["questionID"]));
    }
    print(sm.length);
    return sm;
  }

  //FieldData
  void insertFieldData(FieldData fd) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      print(fd.fieldId);
      return txn.rawInsert(
          'INSERT INTO FieldData(dataID, fieldId, fieldValue,fieldDataID,fieldDepdentID,isShown) VALUES (?,?,?,?,?,?)',
          [
            fd.dataID,
            fd.fieldId,
            fd.fieldValue,
            fd.fieldDataID,
            fd.fieldDepdentID,
            fd.isShown
          ]);
    });
  }

  Future<bool> insertFieldDataList(List<FieldData> items) async {
    var dbClient = await db;
    await Future.forEach(items, (element) async {
      FieldData fd = element as FieldData;
      await dbClient.transaction((txn) async {
        print(fd.fieldId);
        return txn.rawInsert(
            'INSERT INTO FieldData(dataID, fieldId, fieldValue,fieldDataID,fieldDepdentID,isShown) VALUES (?,?,?,?,?,?)',
            [
              fd.dataID,
              fd.fieldId,
              fd.fieldValue,
              fd.fieldDataID,
              fd.fieldDepdentID,
              fd.isShown
            ]);
      });
    });
    return true;
    // items.forEach((FieldData item) => insertFieldData(item));
  }

  Future<List<FieldData>> getFieldDataList() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM FieldData');

    List<FieldData> sm = new List();
    for (int i = 0; i < list.length; i++) {
      sm.add(new FieldData(
          dataID: list[i]["dataID"],
          fieldId: list[i]["fieldId"],
          fieldValue: list[i]["fieldValue"],
          fieldDataID: list[i]["fieldDataID"],
          fieldDepdentID: list[i]["fieldDepdentID"],
          isShown: list[i]["isShown"]));
    }
    print(sm.length);
    return sm;
  }

//Get field data with filedId
  Future<List<FieldData>> getFieldDataWithField(int fieldID) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery(
        'SELECT * FROM FieldData where fieldId = $fieldID AND isShown = 1');
    List<FieldData> sm = new List();
    for (int i = 0; i < list.length; i++) {
      sm.add(new FieldData(
          dataID: list[i]["dataID"],
          fieldId: list[i]["fieldId"],
          fieldValue: list[i]["fieldValue"],
          fieldDataID: list[i]["fieldDataID"],
          fieldDepdentID: list[i]["fieldDepdentID"],
          isShown: list[i]["isShown"]));
    }
    return sm;
  }

  Future<List<FieldData>> getFieldDataWithFieldDataID(
      String fieldDataID, int fieldID) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery(
        'SELECT * FROM FieldData where fieldDataID = "$fieldDataID" AND fieldId = $fieldID AND isShown = 1');
    List<FieldData> sm = new List();
    for (int i = 0; i < list.length; i++) {
      sm.add(new FieldData(
          dataID: list[i]["dataID"],
          fieldId: list[i]["fieldId"],
          fieldValue: list[i]["fieldValue"],
          fieldDataID: list[i]["fieldDataID"],
          fieldDepdentID: list[i]["fieldDepdentID"],
          isShown: list[i]["isShown"]));
    }
    return sm;
  }

//Get field data with FieldId and DependentID
//fieldDepdentID
  Future<List<FieldData>> getFieldDataWithFieldDepdentID(
      String depdentID, int fieldID) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery(
        'SELECT * FROM FieldData where fieldId = $fieldID AND fieldDepdentID = "$depdentID" AND isShown = 1');
    List<FieldData> sm = new List();
    for (int i = 0; i < list.length; i++) {
      sm.add(new FieldData(
          dataID: list[i]["dataID"],
          fieldId: list[i]["fieldId"],
          fieldValue: list[i]["fieldValue"],
          fieldDataID: list[i]["fieldDataID"],
          fieldDepdentID: list[i]["fieldDepdentID"],
          isShown: list[i]["isShown"]));
    }
    return sm;
  }
  //FieldDependency
  // void insertFieldDependency(FieldDependency fd) async {
  //   var dbClient = await db;
  //   await dbClient.transaction((txn) async {
  //     print(fd.fieldId);
  //     return txn.rawInsert(
  //         'INSERT INTO FieldDependency(subSectionId, fieldId, sortOrder, isMandatory, isEditable,isDependent,isHide,fieldDependencyID) VALUES (?, ?, ?, ?, ?,?,?,?)',
  //         [fd.subSectionId, fd.fieldId, fd.sortOrder, fd.isMandatory, fd.isEditable,fd.isDependent,fd.isHide,fd.fieldDependencyID]);
  //   });
  // }

  Future<bool> insertFieldDependencyList(List<FieldDependency> items) async {
    var dbClient = await db;
    await Future.forEach(items, (element) async {
      FieldDependency fd = element as FieldDependency;
      await dbClient.transaction((txn) async {
        print(fd.fieldId);
        return txn.rawInsert(
            'INSERT INTO FieldDependency(subSectionId, fieldId, sortOrder, isMandatory, isEditable,isDependent,isHide,fieldDependencyID) VALUES (?, ?, ?, ?, ?,?,?,?)',
            [
              fd.subSectionId,
              fd.fieldId,
              fd.sortOrder,
              fd.isMandatory,
              fd.isEditable,
              fd.isDependent,
              fd.isHide,
              fd.fieldDependencyID
            ]);
      });
    });
    return true;

    //items.forEach((FieldDependency item) => insertFieldDependency(item));
  }

  Future<List<FieldDependency>> getFieldDependencyList() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM FieldDependency');

    List<FieldDependency> sm = new List();
    for (int i = 0; i < list.length; i++) {
      sm.add(new FieldDependency(
          subSectionId: list[i]["fieldDataId"],
          fieldId: list[i]["fieldId"],
          sortOrder: list[i]["fieldValue"],
          isMandatory: list[i]["isMandatory"],
          isEditable: list[i]["isEditable"],
          isDependent: list[i]["isDependent"],
          isHide: list[i]["isHide"],
          fieldDependencyID: list[i]["fieldDependencyID"]));
    }
    print(sm.length);
    return sm;
  }

  //MARK:- Query
  Future<List<SubSectionMaster>> getSubSectionMasterWith(int sectionID) async {
    final tempSectionID = (sectionID == 2001) ? 2000 : sectionID;
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery(
        'SELECT * FROM SubSectionMaster where sectionID= $tempSectionID');
    List<SubSectionMaster> sm = new List();
    for (int i = 0; i < list.length; i++) {
      sm.add(new SubSectionMaster(
          subSectionID: list[i]["subSectionID"],
          subSectionName: list[i]["subSectionName"],
          sectionID: list[i]["sectionID"]));
    }
    return sm;
  }

  Future<List<SectionSubSection>> getFieldMasterDataWith(
      int subSectionID, int sectionID, String webRefNumber) async {
    var dbClient = await db;
    //Get fieldData
    List<FieldData> fieldDataDetails = await getFieldDataList();
    //Get JSON object
    List<JsonObject> jsonObjectDetails =
        await getJsonObject((webRefNumber.length > 0) ? webRefNumber : "0");
    //Get fieldDependent
    List<FieldDependent> fieldDependentDetails = await getFieldDependentList();
    //Get fieldMaster
    List<FieldMaster> fieldMasterData = await getFieldMaster();
    //Get fieldResponse
    List<FieldResponse> fieldResponse = await getFieldResponseDetails();
    //Get Service Response
    List<ServiceResponseID> serviceResponseID = await getServiceResponse();
    //Premium Response Details
    List<PremiumDetails> premiumResponseDetails =
        await DBHelper().getPremiumDetailsWithWebRefNumber(webRefNumber);
    //Rider Master
    List<RiderMaster> riderMasterDetails = await getRiderMaster();
    List<Map> list = await dbClient.rawQuery(
        'SELECT * FROM FieldDependency where subSectionId= $subSectionID');
    List<SectionSubSection> ss = new List();

    for (int i = 0; i < list.length; i++) {
      int isFieldHide = list[i]["isHide"];
      final tempFieldMasterData = fieldMasterData
          .where((element) => element.fieldId == list[i]["fieldId"])
          .toList();
      if (tempFieldMasterData.length > 0) {
        final tempFieldDependentDetails = fieldDependentDetails
            .where((element) =>
                (element.fieldID == list[i]["fieldDependencyID"]) &&
                (element.dependentID != 0))
            .toList();
        var dependentIDs = "";
        if (tempFieldDependentDetails.length > 0) {
          for (final value in tempFieldDependentDetails) {
            dependentIDs = dependentIDs + value.dependentID.toString() + ",";
          }
        }
        //Field dependent
        var responseValue = "";
        if (list[i]["fieldDependencyID"] == 1699) {
          print("object");
        }
        final tempFieldResponse = fieldResponse
            .where((element) =>
                (element.fieldDependencyID == list[i]["fieldDependencyID"]) &&
                (element.subSectionID == subSectionID) &&
                (element.sectionID == sectionID) &&
                (element.webRefNumber == webRefNumber))
            .toList();
        if (tempFieldResponse.length <= 0) {
          final tempDependent = fieldDependentDetails
              .where((element) =>
                  (element.fieldID == list[i]["fieldDependencyID"]) &&
                  (element.sectionID ==
                      returnRefSectionIDWihSectionID(
                          sectionID, subSectionID)) &&
                  (element.dependentID == 0) &&
                  (element.subsectionID == subSectionID))
              .toList();
          if (tempDependent.length > 0) {
            if (tempDependent.length > 1) {
              var tempResponse = "";
              for (final item in tempDependent) {
                final tempFieldReaponse = fieldResponse
                    .where((element) => ((element.fieldDependencyID ==
                            item.dependentFieldID) &&
                        (element.sectionID ==
                            returnFieldResponseSectionID(
                                sectionID, subSectionID)) &&
                        (element.webRefNumber == webRefNumber) &&
                        (element.subSectionID == item.dependentsubsectionID)))
                    .toList();
                if (tempFieldReaponse.length > 0 &&
                    tempFieldReaponse[0].fieldValue.length > 0) {
                  tempResponse =
                      tempResponse + tempFieldReaponse[0].fieldValue + " ";
                }
              }
              responseValue = tempResponse;
            } else {
              final tempFieldReaponse = fieldResponse
                  .where((element) => ((element.fieldDependencyID ==
                          tempDependent[0].dependentFieldID) &&
                      (element.sectionID ==
                          returnFieldResponseSectionID(
                              sectionID, subSectionID)) &&
                      (element.webRefNumber == webRefNumber) &&
                      (element.subSectionID ==
                          tempDependent[0].dependentsubsectionID)))
                  .toList();
              if (tempFieldReaponse.length > 0) {
                if (subSectionID == 1022 &&
                    list[i]["fieldDependencyID"] == 1356) {
                  final fieldData = fieldDataDetails
                      .where((element) =>
                          element.fieldId == 1093 &&
                          element.fieldDataID ==
                              tempFieldReaponse[0].fieldValue)
                      .toList();
                  if (fieldData.length > 0) {
                    final fieldDependencyData = fieldDataDetails
                        .where((element) =>
                            element.fieldId == 1140 &&
                            element.fieldValue == fieldData[0].fieldValue)
                        .toList();
                    if (fieldDependencyData.length > 0) {
                      responseValue = fieldDependencyData[0].fieldValue;
                    }
                  }
                } else {
                  responseValue = tempFieldReaponse[0].fieldValue;
                }
              }
            }
          } else if (list[i]["fieldId"] == 1008) {
            responseValue = "Own";
          } else if (list[i]["fieldDependencyID"] == 1127) {
            DateTime now = new DateTime.now();
            responseValue = "${now.year}-${now.month}-${now.day}";
          } else if (list[i]["subSectionId"] == 1004) {
            responseValue = "0";
          } else if (list[i]["fieldDependencyID"] == 1656) {
            final tempResponse = jsonDecode(ss[3].fieldValue)["MainLife"];
            double total = 0.0;
            for (final item in tempResponse) {
              final sumAssured =
                  (item["SumAssured"] as String).replaceAll(",", "");
              total = total +
                  ((sumAssured.length > 0) ? double.parse(sumAssured) : 0.0);
            }
            responseValue = total.round().toString();
          } else if (list[i]["subSectionId"] == 1005) {
            responseValue =
                (list[i]["fieldDependencyID"] == 1082) ? "Select" : "0";
          } else if (list[i]["subSectionId"] == 1006 &&
              list[i]["fieldDependencyID"] != 1635) {
            responseValue = "0";
          } else if (list[i]["fieldDependencyID"] == 1310) {
            responseValue = returnDeptDetails(
                fieldResponse, webRefNumber, list[i]["fieldDependencyID"]);
          } else if (list[i]["fieldDependencyID"] == 1393) {
            responseValue = returnDeptDetails(
                fieldResponse, webRefNumber, list[i]["fieldDependencyID"]);
          } else if (subSectionID == 1020 &&
              list[i]["fieldDependencyID"] == 1352) {
            var deptValue = ss[1].fieldValue.split(",");
            deptValue.removeAt(0);
            var index = 0;
            for (final _ in deptValue) {
              responseValue =
                  responseValue + ((deptValue.length == index + 1) ? "" : "@");
              index = index + 1;
            }
          } else if (subSectionID == 1019 &&
              list[i]["fieldDependencyID"] >= 1311 &&
              list[i]["fieldDependencyID"] <= 1350) {
            responseValue = returnFieldResponseWith(
                sectionID,
                list[i]["fieldDependencyID"],
                fieldResponse,
                responseValue,
                ss,
                webRefNumber);
          } else if (subSectionID == 1021 &&
              list[i]["fieldDependencyID"] == 1354) {
            responseValue = returnBenfitCoverageDetails(
                fieldResponse,
                webRefNumber,
                premiumResponseDetails,
                riderMasterDetails,
                list[i]["fieldDependencyID"],
                jsonObjectDetails[0]);
          } else if (subSectionID == 1022 &&
              list[i]["fieldDependencyID"] == 1358) {
            responseValue = returnPremiumDetails(
                fieldResponse,
                webRefNumber,
                premiumResponseDetails,
                riderMasterDetails,
                list[i]["fieldDependencyID"],
                jsonObjectDetails[0]);
          } else if (subSectionID == 1022 &&
              list[i]["fieldDependencyID"] == 1359) {
            final premiumObject =
                jsonDecode(jsonObjectDetails[0].premiumObject);
            responseValue = _returnPremium(
               int.parse(premiumObject["objProductDetials"]["PreferredMode"]),
                premiumObject);
          } else if (subSectionID == 1022 &&
              list[i]["fieldDependencyID"] == 1357) {
            final premiumObject =
                jsonDecode(jsonObjectDetails[0].premiumObject);
            final lstBenefitOverView =
                premiumObject["LstBenefitOverView"] as List;
            responseValue = ((lstBenefitOverView[0]
                ["objBenefitMemberRelationship"] as List)[0])["RiderSI"];
          } else if (subSectionID == 1025 &&
              (list[i]["fieldDependencyID"] == 1368 ||
                  list[i]["fieldDependencyID"] == 1367)) {
            var isSpouseCovered = false;
            final spouseFieldResponse = fieldResponse
                .where((element) =>
                    (element.fieldDependencyID == 1144) &&
                    (element.subSectionID == 1009) &&
                    (element.webRefNumber == webRefNumber))
                .toList();
            final spouseDetails = spouseFieldResponse[0];
            if (spouseDetails.fieldValue == "14") {
              isSpouseCovered = true;
            }
            responseValue = (list[i]["fieldDependencyID"] == 1368)
                ? ((isSpouseCovered) ? "1" : "0")
                : "1";
          } else if (subSectionID == 1155 &&
              (list[i]["fieldDependencyID"] == 1668 ||
                  list[i]["fieldDependencyID"] == 1669 ||
                  list[i]["fieldDependencyID"] == 1670)) {
            final spouseFieldResponse = fieldResponse
                .where((element) =>
                    (element.fieldDependencyID == 1144) &&
                    (element.subSectionID == 1009) &&
                    (element.webRefNumber == webRefNumber))
                .toList();
            isFieldHide = (spouseFieldResponse is List &&
                    spouseFieldResponse.length > 0 &&
                    spouseFieldResponse[0].fieldValue != "14")
                ? 1
                : 0;
          } else if (list[i]["fieldDependencyID"] == 1264) {
            final serviceResponseIDDetails = serviceResponseID
                .where((element) => element.webRefNumber == webRefNumber)
                .toList();
            if (serviceResponseIDDetails.length > 0) {
              final serviceResponseIDDetail = serviceResponseIDDetails[0];
              responseValue = serviceResponseIDDetail.quotationNumber;
            }
          }
        } else {
          responseValue = tempFieldResponse[0].fieldValue;
        }

        ss.add(new SectionSubSection(
            fieldID: tempFieldMasterData[0].fieldId,
            fieldName: tempFieldMasterData[0].fieldName,
            fieldType: tempFieldMasterData[0].fieldType.replaceAll(' ', ''),
            isManditory: (list[i]["isMandatory"] == 1) ? true : false,
            sectionID: sectionID,
            subSectionID: subSectionID,
            webRefNumber: "",
            fieldValue: responseValue,
            isEditable: (list[i]["isEditable"] == 1) ? true : false,
            placeHolder: tempFieldMasterData[0].placeholder,
            validationMessage: tempFieldMasterData[0].validationMessage,
            globalKey: retunFieldsWith1(tempFieldMasterData[0].fieldType),
            isDependent: (list[i]["isDependent"] == 1) ? true : false,
            dependentIDs: dependentIDs,
            isHide: (isFieldHide == 1) ? true : false,
            index: i,
            fieldDependencyID: list[i]["fieldDependencyID"],
            questionID: tempFieldMasterData[0].questionID));
      }
    }
    return ss;
  }

//Return premium
  String _returnPremium(int _selectedMode, Map _premiumObject) {
    switch (_selectedMode) {
      case 0:
        return _premiumObject["SinglePremium"];
      case 1:
        return _premiumObject["AnnualPremium"];
      case 2:
        return _premiumObject["HalfYearlyPremium"];
      case 4:
        return _premiumObject["QuaterlyPremium"];
      case 12:
        return _premiumObject["MonthlyPremium"];
    }
    return _premiumObject["AnnualPremium"];
  }

//MARK:- Depet Details
  returnDeptDetails(List<FieldResponse> fieldResponse, String webRefNumber,
      int fieldDependencyID) {
    var deptDetails = "0";
    //Proposal Life to be Assured
    if (fieldDependencyID == 1393) {
      deptDetails =
          deptDetails + ((deptDetails.length == 2) ? ",MainLife" : ",MainLife");
    }
    //1144
    final spouseFieldResponse = fieldResponse
        .where((element) =>
            (element.fieldDependencyID == 1144) &&
            (element.subSectionID == 1009) &&
            (element.webRefNumber == webRefNumber))
        .toList();
    //1167
    final childFieldResponse = fieldResponse
        .where((element) =>
            (element.fieldDependencyID == 1167) &&
            (element.subSectionID == 1010) &&
            (element.webRefNumber == webRefNumber))
        .toList();
    var deptCount = 0;
    if (childFieldResponse.length > 0) {
      final childDetails = childFieldResponse[0];
      deptCount = (childDetails.fieldValue.length > 0)
          ? int.parse(childDetails.fieldValue)
          : 0;
    }
    if (spouseFieldResponse.length > 0) {
      final spouseDetails = spouseFieldResponse[0];
      if (spouseDetails.fieldValue == "14") {
        deptDetails = deptDetails + ((deptCount > 0) ? ",Spouse" : ",Spouse");
      }
      for (var k = 0; k < deptCount; k++) {
        deptDetails = deptDetails +
            ((k + 1 == deptCount) ? ",Child${k + 1}" : ",Child${k + 1}");
      }
    }
    return deptDetails;
  }

//MARK:-
  returnPremiumDetails(
      List _fieldResponse,
      String _webRefNumber,
      List<PremiumDetails> premiumResponseDetails,
      List<RiderMaster> riderMasterDetails,
      int fieldDependencyID,
      JsonObject jsonObjectDetails) {
    final deptDetails =
        returnDeptDetails(_fieldResponse, _webRefNumber, fieldDependencyID);
    var deptValue = deptDetails.split(",");
    deptValue[0] = "MainLife";
    Map<String, dynamic> benifitDetails = Map();
    if (premiumResponseDetails.length > 0) {
      var riderIndex = 0;
      final premiumObject = jsonDecode(jsonObjectDetails.premiumObject);
      final lstBenefitOverView = premiumObject["LstBenefitOverView"] as List;
      for (final dept in deptValue) {
        final premiumResponseDetail = (premiumResponseDetails
            .where((element) => (element.riderIndex == riderIndex))).toList();
        List premiumDetailMap = List();
        var premiumIndex = 0;
        for (final item in premiumResponseDetail) {
          final benefitOverView = lstBenefitOverView
              .where((element) => element["BenifitCode"] == item.benfitCode)
              .toList()[0]; //lstBenefitOverView[premiumIndex];
          final objBenefitMemberRelationship =
              (benefitOverView["objBenefitMemberRelationship"]
                  as List)[riderIndex];
          Map<String, String> premiumDetailDic = Map();
          final riderMasterDetail = riderMasterDetails
              .where((element) => element.benefitCode == item.benfitCode)
              .toList()[0];
          final riderPremium =
              (objBenefitMemberRelationship["Rider_Premium"] != null)
                  ? ((objBenefitMemberRelationship["Rider_Premium"] as String)
                      .replaceAll(",", ""))
                  : "0.0";
          if (riderPremium.length > 0 &&
              double.parse(riderPremium).round() > 0) {
            premiumDetailDic["SumAssured"] = riderPremium.length > 0
                ? (double.parse(riderPremium).round().toString())
                : "0";
            premiumDetailDic["Description"] = riderMasterDetail.description;
            premiumDetailDic["BenfitCode"] = item.benfitCode;
            premiumDetailDic["benefitName"] = riderMasterDetail.benefitName;
            premiumDetailDic["benefitID"] = riderMasterDetail.benefitID;
            premiumDetailDic["assuredName"] = "MainLife";
            premiumDetailDic["memberRelationship"] = "267";
            premiumDetailMap.add(premiumDetailDic);
          }
          premiumIndex = premiumIndex + 1;
        }
        benifitDetails[dept] = premiumDetailMap;
        riderIndex = riderIndex + 1;
      }
    }
    return jsonEncode(benifitDetails).toString();
  }

//MARK:-
  returnBenfitCoverageDetails(
      List _fieldResponse,
      String _webRefNumber,
      List<PremiumDetails> premiumResponseDetails,
      List<RiderMaster> riderMasterDetails,
      int fieldDependencyID,
      JsonObject jsonObjectDetails) {
    final deptDetails =
        returnDeptDetails(_fieldResponse, _webRefNumber, fieldDependencyID);
    var deptValue = deptDetails.split(",");
    deptValue[0] = "MainLife";
    Map<String, dynamic> benifitDetails = Map();
    if (premiumResponseDetails.length > 0) {
      var riderIndex = 0;
      final premiumObject = jsonDecode(jsonObjectDetails.premiumObject);
      final lstBenefitOverView = premiumObject["LstBenefitOverView"] as List;
      for (final dept in deptValue) {
        final premiumResponseDetail = (premiumResponseDetails
            .where((element) => (element.riderIndex == riderIndex))).toList();
        List premiumDetailMap = List();
        for (final item in premiumResponseDetail) {
          final benefitOverView = lstBenefitOverView
              .where((element) => element["BenifitCode"] == item.benfitCode)
              .toList()[0]; //lstBenefitOverView[premiumIndex];
          final objBenefitMemberRelationship =
              (benefitOverView["objBenefitMemberRelationship"]
                  as List)[riderIndex];
          Map<String, String> premiumDetailDic = Map();
          final riderMasterDetail = riderMasterDetails
              .where((element) => element.benefitCode == item.benfitCode)
              .toList()[0];
          final riderPremium =
              (objBenefitMemberRelationship["Rider_Premium"] != null)
                  ? ((objBenefitMemberRelationship["Rider_Premium"] as String)
                      .replaceAll(",", ""))
                  : "0.0";
          if (riderPremium.length > 0 &&
              double.parse(riderPremium).round() > 0) {
            premiumDetailDic["riderPremium"] = riderPremium.length > 0
                ? (double.parse(riderPremium).round().toString())
                : "0";
            premiumDetailDic["SumAssured"] = item.sumAssured.toString();
            premiumDetailDic["Description"] = riderMasterDetail.description;
            premiumDetailDic["BenfitCode"] = item.benfitCode;
            premiumDetailDic["benefitName"] = riderMasterDetail.benefitName;
            premiumDetailDic["benefitID"] = riderMasterDetail.benefitID;
            premiumDetailDic["assuredName"] = "MainLife";
            premiumDetailDic["memberRelationship"] = "267";
            premiumDetailMap.add(premiumDetailDic);
          }
        }
        benifitDetails[dept] = premiumDetailMap;
        riderIndex = riderIndex + 1;
      }
    }
    return jsonEncode(benifitDetails).toString();
  }

  returnFieldResponseWith(int sectionID, int fieldDependencyID,
      List fieldResponse, String responseValue, List ss, String webRefNumber) {
    var fieldResponseValue = responseValue;
    var deptValue = (ss[1] as SectionSubSection).fieldValue.split(",");
    deptValue.removeAt(0);
    final childFieldResponse = fieldResponse
        .where((element) =>
            (element.fieldDependencyID == 1252) &&
            (element.subSectionID == 1016) &&
            (element.webRefNumber == webRefNumber))
        .toList();
    var tempArray = [];
    if (childFieldResponse.length > 0) {
      final childDetails = childFieldResponse[0] as FieldResponse;
      if (childDetails.fieldValue.length > 0) {
        final decodeDetails = json.decode(childDetails.fieldValue);
        for (final value in decodeDetails) {
          final decode = jsonDecode(value);
          tempArray.add(decode);
        }
      }
    }
    var index = 0;
    var isSpouseCovered = false;
    for (final item in deptValue) {
      if (item.length > 0) {
        switch (fieldDependencyID) {
          case 1311:
            if (item == "Spouse") {
              isSpouseCovered = true;
              fieldResponseValue = fieldResponseValue + "Spouse,";
            } else {
              if (tempArray.length > 0) {
                final details =
                    tempArray[(isSpouseCovered) ? index - 1 : index];
                fieldResponseValue = fieldResponseValue +
                    ((deptValue.length == index + 1)
                        ? "${details["1"]}"
                        : "${details["1"]},");
              }
            }
            break;
          case 1312:
            if (item == "Spouse") {
              isSpouseCovered = true;
              var tempFieldValue = "";
              final _genderSectionSubsection = fieldResponse
                  .where((e) => e.fieldDependencyID == 1245)
                  .toList();
              if (_genderSectionSubsection.length > 0) {
                tempFieldValue =
                    (_genderSectionSubsection[0].fieldValue == "20")
                        ? "1092"
                        : "1094";
              }
              fieldResponseValue = fieldResponseValue + "$tempFieldValue,";
            } else {
              var _tempFieldValue = "";
              final _genderSectionSubsection = fieldResponse
                  .where((e) => e.fieldDependencyID == 1168)
                  .toList();
              if (_genderSectionSubsection.length > 0) {
                final decodeDetails =
                    json.decode(_genderSectionSubsection[0].fieldValue);
                if (decodeDetails.length > 0) {
                  for (final _item in decodeDetails) {
                    final _childDetails = jsonDecode(_item);
                    _tempFieldValue =
                        _returnRleationShip(int.parse(_childDetails["1"]));
                  }
                }
              }
              fieldResponseValue = fieldResponseValue +
                  ((deptValue.length == index + 1)
                      ? "$_tempFieldValue"
                      : "$_tempFieldValue,");
            }
            break;
          case 1313:
            if (item == "Spouse") {
              isSpouseCovered = true;
              final spouseFieldResponse = fieldResponse
                  .where((element) =>
                      (element.fieldDependencyID == 1244) &&
                      (element.subSectionID == 1016) &&
                      (element.webRefNumber == webRefNumber))
                  .toList();
              fieldResponseValue = fieldResponseValue +
                  ((spouseFieldResponse.length > 0)
                      ? "${(spouseFieldResponse[0] as FieldResponse).fieldValue},"
                      : ",");
            } else {
              if (tempArray.length > 0) {
                final details =
                    tempArray[(isSpouseCovered) ? index - 1 : index];
                fieldResponseValue = fieldResponseValue +
                    ((deptValue.length == index + 1)
                        ? "${details["0"]}"
                        : "${details["0"]},");
              }
            }
            break;
          case 1317:
            if (item == "Spouse") {
              isSpouseCovered = true;
              final spouseFieldResponse = fieldResponse
                  .where((element) =>
                      (element.fieldDependencyID == 1247) &&
                      (element.subSectionID == 1016) &&
                      (element.webRefNumber == webRefNumber))
                  .toList();
              fieldResponseValue = fieldResponseValue +
                  ((spouseFieldResponse.length > 0)
                      ? "${(spouseFieldResponse[0] as FieldResponse).fieldValue},"
                      : "");
            } else {
              if (tempArray.length > 0) {
                final details =
                    tempArray[(isSpouseCovered) ? index - 1 : index];
                fieldResponseValue = fieldResponseValue +
                    ((deptValue.length == index + 1)
                        ? "${details["2"]}"
                        : "${details["2"]},");
              }
            }
            break;
          case 1318:
            if (item == "Spouse") {
              isSpouseCovered = true;
              final spouseFieldResponse = fieldResponse
                  .where((element) =>
                      (element.fieldDependencyID == 1248) &&
                      (element.subSectionID == 1016) &&
                      (element.webRefNumber == webRefNumber))
                  .toList();
              fieldResponseValue = fieldResponseValue +
                  ((spouseFieldResponse.length > 0)
                      ? "${(spouseFieldResponse[0] as FieldResponse).fieldValue},"
                      : "");
            } else {
              if (tempArray.length > 0) {
                final details =
                    tempArray[(isSpouseCovered) ? index - 1 : index];
                fieldResponseValue = fieldResponseValue +
                    ((deptValue.length == index + 1)
                        ? "${details["3"]}"
                        : "${details["3"]},");
              }
            }
            break;
          case 1319:
            if (item == "Spouse") {
              isSpouseCovered = true;
              //final spouseFieldResponse = fieldResponse.where((element) => (element.fieldDependencyID == 1245) && (element.subSectionID == 1016) && (element.webRefNumber == webRefNumber)).toList();
              fieldResponseValue = fieldResponseValue + "21,";
            } else {
              var _tempFieldValue = "";
              final _genderSectionSubsection = fieldResponse
                  .where((e) => e.fieldDependencyID == 1168)
                  .toList();
              if (_genderSectionSubsection.length > 0) {
                final decodeDetails =
                    json.decode(_genderSectionSubsection[0].fieldValue);
                if (decodeDetails.length > 0) {
                  for (final _item in decodeDetails) {
                    final _childDetails = jsonDecode(_item);
                    _tempFieldValue =
                        _returnGender(int.parse(_childDetails["1"]));
                  }
                }
              }
              fieldResponseValue = fieldResponseValue +
                  ((deptValue.length == index + 1)
                      ? "$_tempFieldValue"
                      : "$_tempFieldValue,");
            }
            break;
          case 1320:
            if (item == "Spouse") {
              isSpouseCovered = true;
              // final spouseFieldResponse = fieldResponse.where((element) => (element.fieldDependencyID == 1245) && (element.subSectionID == 1016) && (element.webRefNumber == webRefNumber)).toList();
              fieldResponseValue = fieldResponseValue + "14,";
            } else {
              fieldResponseValue = fieldResponseValue +
                  ((deptValue.length == index + 1) ? "" : ",");
            }
            break;
          case 1323:
            if (item == "Spouse") {
              isSpouseCovered = true;
              final spouseFieldResponse = fieldResponse
                  .where((element) =>
                      (element.fieldDependencyID == 1246) &&
                      (element.subSectionID == 1016) &&
                      (element.webRefNumber == webRefNumber))
                  .toList();
              fieldResponseValue = fieldResponseValue +
                  ((spouseFieldResponse.length > 0)
                      ? "${(spouseFieldResponse[0] as FieldResponse).fieldValue},"
                      : "");
            } else {
              fieldResponseValue = fieldResponseValue +
                  ((deptValue.length == index + 1) ? "" : ",");
            }
            break;
          case 1324:
            if (item == "Spouse") {
              isSpouseCovered = true;
              final spouseFieldResponse = fieldResponse
                  .where((element) =>
                      (element.fieldDependencyID == 1249) &&
                      (element.subSectionID == 1016) &&
                      (element.webRefNumber == webRefNumber))
                  .toList();
              fieldResponseValue = fieldResponseValue +
                  ((spouseFieldResponse.length > 0)
                      ? "${(spouseFieldResponse[0] as FieldResponse).fieldValue.replaceAll(" ","")},"
                      : "");
            } else {
              fieldResponseValue = fieldResponseValue +
                  ((deptValue.length == index + 1) ? "" : ",");
            }
            break;
          default:
            fieldResponseValue = fieldResponseValue +
                ((deptValue.length == index + 1) ? "" : ",");
        }
      }
      index = index + 1;
    }
    return fieldResponseValue;
  }

  _returnRleationShip(int iD) {
    final _mASTER = "1090";
    final _bABY = "1087";
    final _mISS = "1094";
    final _mR = "1092";
    switch (iD) {
      case 1455:
        return _mR;
      case 270:
        return _bABY;
      case 272:
        return _mR;
      case 1563:
        return _mISS;
      case 1562:
        return _mR;
      case 273:
        return _mISS;
      case 1560:
        return _mR;
      case 1561:
        return _mISS;
      case 1456:
        return _mISS;
      case 269:
        return _mASTER;
      case 268:
        return _mISS;
        break;
      default:
    }
  }

  _returnGender(int iD) {
    final _male = "20";
    final _female = "21";
    switch (iD) {
      case 1455:
        return _male;
      case 270:
        return _female;
      case 272:
        return _male;
      case 1563:
        return _female;
      case 1562:
        return _male;
      case 273:
        return _female;
      case 1560:
        return _male;
      case 1561:
        return _female;
      case 1456:
        return _female;
      case 269:
        return _male;
      case 268:
        return _female;
        break;
      default:
    }
  }

  returnFieldResponseSectionID(int sectionID, int subSectionID) {
    switch (sectionID) {
      case 4000:
        return 3000;
        break;
      case 1138:
        return (subSectionID == 1026 || subSectionID == 1405) ? 4000 : 3000;
        break;
      default:
        return sectionID;
        break;
    }
  }

  returnRefSectionIDWihSectionID(int sectionID, int subSectionID) {
    if (sectionID == 1001 && subSectionID == 1001) {
      return 1000;
    } else if (sectionID == 2000 && subSectionID == 1002) {
      return 1001;
    } else if (sectionID == 2000 && subSectionID == 1003) {
      return 1001;
    } else if (sectionID == 3000 && subSectionID == 1009) {
      return 2002;
    } else if (sectionID == 3000 && subSectionID == 1010) {
      return 2002;
    } else if (sectionID == 3000 && subSectionID == 1011) {
      return 2002;
    } else if (sectionID == 3000 && subSectionID == 1012) {
      return 2002;
    } else if (sectionID == 3000 && subSectionID == 1013) {
      return 2002;
    } else if (sectionID == 3000 && subSectionID == 1014) {
      return 2002;
    } else if (sectionID == 3000 && subSectionID == 1015) {
      return 2002;
    } else if (sectionID == 3000 && subSectionID == 1016) {
      return 2002;
    } else if (sectionID == 4000 && subSectionID == 1017) {
      return 3000;
    } else if (sectionID == 4000 && subSectionID == 1018) {
      return 3000;
    } else if (sectionID == 4000 && subSectionID == 1022) {
      return 3000;
    } else if (sectionID == 1138 && subSectionID == 1179) {
      return 4000;
    } else if (sectionID == 6000 && subSectionID == 1026) {
      return 6000;
    } else if (sectionID == 6000 && subSectionID == 1026) {
      return 6000;
    }
  }

  retunFieldsWith1(String fieldType) {
    switch (fieldType.replaceAll(' ', '')) {
      case "customheaderlabel":
        final GlobalKey<CustomeHeaderLableState> _key = GlobalKey();
        return _key;
        break;
      case "label":
        final GlobalKey<LabelState> _key = GlobalKey();
        return _key;
        break;
      case "phone":
        final GlobalKey<NumberState> _key = GlobalKey();
        return _key;
        break;
      case "numeric":
        final GlobalKey<TextBoxState> _key = GlobalKey();
        return _key;
        break;
      case "textbox":
        final GlobalKey<TextBoxState> _key = GlobalKey();
        return _key;
        break;
      case "dropdown":
        final GlobalKey<DropDownWidgetState> _key = GlobalKey();
        return _key;
        break;
      case "customedropdown":
        final GlobalKey<CustomDropDownState> _key = GlobalKey();
        return _key;
        break;
      case "date":
        final GlobalKey<DatePickerState> _key = GlobalKey();
        return _key;
        break;
      case "emailID":
        final GlobalKey<TextBoxState> _key = GlobalKey();
        return _key;
      case "radiogroup":
        final GlobalKey<RadioButtonState> _key = GlobalKey();
        return _key;
        break;
      case "mediaslider":
        final GlobalKey<MediaSliderState> _key = GlobalKey();
        return _key;
        break;
      case "mediacontroller":
        final GlobalKey<MediaControllerState> _key = GlobalKey();
        return _key;
        break;
      case "signature":
        final GlobalKey<SignatureWidgetState> _key = GlobalKey();
        return _key;
        break;
      case "imagePicker":
        final GlobalKey<MyImagePickerState> _key = GlobalKey();
        return _key;
        break;
      case "textarea":
        final GlobalKey<TextAreaState> _key = GlobalKey();
        return _key;
        break;
      case "dependentView":
        final GlobalKey<DependentViewState> _key = GlobalKey();
        return _key;
        break;
      case "dependent":
        final GlobalKey<DependentState> _key = GlobalKey();
        return _key;
        break;
      case "button":
        final GlobalKey<ButtonWidgetState> _key = GlobalKey();
        return _key;
        break;
      case "time":
        final GlobalKey<TimePickerState> _key = GlobalKey();
        return _key;
        break;
      case "imagelable":
        final GlobalKey<ImageLabelState> _key = GlobalKey();
        return _key;
        break;
      case "customelabel":
        final GlobalKey<CustomeLabelState> _key = GlobalKey();
        return _key;
        break;
      case "expandCollapse":
        final GlobalKey<ExpandCollapseState> _key = GlobalKey();
        return _key;
        break;
      case "coverageDetails":
        final GlobalKey<CoverageDetailsState> _key = GlobalKey();
        return _key;
        break;
      case "nomineeDetails":
        final GlobalKey<NomineeDetailsState> _key = GlobalKey();
        return _key;
        break;
      case "labelView":
        final GlobalKey<LabelViewState> _key = GlobalKey();
        return _key;
        break;
      case "customButton":
        final GlobalKey<CustomButtonState> _key = GlobalKey();
        return _key;
        break;
      case "mainLabel":
        final GlobalKey<MainLabelState> _key = GlobalKey();
        return _key;
        break;
      case "customDocument":
        final GlobalKey<CustomDocumentState> _key = GlobalKey();
        return _key;
        break;
      case "customCheckbox":
        final GlobalKey<CustomCheckboxState> _key = GlobalKey();
        return _key;
        break;
      case "customUpload":
        final GlobalKey<CustomUploadState> _key = GlobalKey();
        return _key;
        break;
      case "checkbox":
        final GlobalKey<CheckBoxWidgetState> _key = GlobalKey();
        return _key;
        break;
      case "segment":
        final GlobalKey<SegmentState> _key = GlobalKey();
        return _key;
        break;
      case "customspinner":
        final GlobalKey<CustomeSpinnerState> _key = GlobalKey();
        return _key;
        break;
      case "customselection":
        final GlobalKey<CustomSelectionState> _key = GlobalKey();
        return _key;
        break;
    }
  }

//MARK:-
//Get fieldMaster
  Future<List<FieldMaster>> getFieldMaster() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM FieldMaster');
    List<FieldMaster> sm = new List();
    for (int i = 0; i < list.length; i++) {
      sm.add(new FieldMaster(
          fieldId: list[i]["fieldId"],
          fieldName: list[i]["fieldName"],
          fieldType: list[i]["fieldType"],
          validationMessage: list[i]["validationMessage"],
          placeholder: list[i]["placeholder"]));
    }
    print(sm.length);
    return sm;
  }

  Future<List<FieldMaster>> getFieldMasterWith1(int fieldID) async {
    var dbClient = await db;
    List<Map> list = await dbClient
        .rawQuery('SELECT * FROM FieldMaster where fieldId= $fieldID');
    List<FieldMaster> sm = new List();
    for (int i = 0; i < list.length; i++) {
      sm.add(new FieldMaster(
          fieldId: list[i]["fieldId"],
          fieldName: list[i]["fieldName"],
          fieldType: list[i]["fieldType"],
          validationMessage: list[i]["validationMessage"],
          placeholder: list[i]["placeholder"]));
    }
    print(sm.length);
    return sm;
  }

//MARK:- Login details
//Insert
  Future<bool> insertIntoLoginDetails(Map data) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return txn.rawInsert(
          'INSERT INTO Login(userID, username, iD, address,themcolor) VALUES (?, ?, ?, ?,?)',
          [
            data["userID"],
            data["username"],
            data["iD"],
            data["address"],
            data["themcolor"]
          ]);
    });
    return true;
  }

  //Update Service Response
  Future<bool> updareServiceResponseWithWebRefNumber(
      String webRefNumber, String quotationNumber) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      txn.rawUpdate(
          'UPDATE ServiceResponseID SET quotationNumber = ? WHERE webRefNumber = ?',
          [quotationNumber, webRefNumber]);
    });
    return true;
  }

  //Update proposl number
  Future<bool> updareProposalNumberWithWebRefNumber(
      String webRefNumber, String proposalNumber) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      txn.rawUpdate(
          'UPDATE ServiceResponseID SET proposalNumber = ? WHERE webRefNumber = ?',
          [proposalNumber, webRefNumber]);
    });
    return true;
  }

  //Get
  Future<List<Login>> getLoginDetails() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Login');
    List<Login> login = new List();
    for (int i = 0; i < list.length; i++) {
      login.add(new Login(
          userID: list[i]["userID"],
          username: list[i]["username"],
          address: list[i]["address"],
          iD: list[i]["iD"],
          themcolor: list[i]["themcolor"]));
    }
    return login;
  }

  deleteLoginDataWithUsername(String userID) async {
    var dbClient = await db;
    return await dbClient
        .rawDelete('DELETE FROM login WHERE userID = "$userID"');
  }

  Future<bool> deleteCSVMasters() async {
    var dbClient = await db;
    final _allCsvFiles = CSVMasterNames.allCsvFiles;
    await Future.forEach(_allCsvFiles, (element) async {
      return await dbClient.rawDelete('DELETE FROM $element');
    });
    return true;
  }

  //MARK:- Field Response
  //Insert page wise field Response
  Future<bool> insertIntoPageFieldResponse(
      List _subSectionDetails, String webRefNumber, int sectionID) async {
    var tempWebRefNumber = "";
    if (webRefNumber.length > 0) {
      tempWebRefNumber = webRefNumber;
      List<FieldResponse> fieldResponse =
          await getPageFieldResponseDetailsWithSectionId(
              sectionID, webRefNumber);
      if (fieldResponse.length > 0) {
        deleteFieldResponseWithSectionID(sectionID, webRefNumber);
      } else {
        deleteFieldResponse(webRefNumber);
      }
      print("object");
    } else {
      tempWebRefNumber = Utility().returnWebRefNumber().toString();
    }
    var dbClient = await db;
    await Future.forEach(_subSectionDetails, (data) async {
      final fieldDetails = data as SectionSubSection;
      await dbClient.transaction((txn) async {
        txn.rawInsert(
            'INSERT INTO FieldResponse(fieldId, sectionId, subSectionId, fieldValue,webRefNumber,fieldDependencyID) VALUES (?, ?, ?, ?,?,?)',
            [
              fieldDetails.fieldID,
              returnSectionIDWihSectionID(fieldDetails.sectionID, false),
              fieldDetails.subSectionID,
              fieldDetails.fieldValue,
              tempWebRefNumber,
              fieldDetails.fieldDependencyID
            ]);
      });
    });
    return true;
  }

  //MARK:- RiderDetails
  Future<bool> insertIntoRiderDetails(
      Map<int, dynamic> _benifitOverViewDetails, String webRefNumber) async {
    if (webRefNumber.length > 0) {
      deleteRiderDetails(webRefNumber);
    }
    var dbClient = await db;
    final keys = _benifitOverViewDetails.keys;
    for (final key in keys) {
      final _benifitOverViewDetail = _benifitOverViewDetails[key];
      final codeKeys = (_benifitOverViewDetails[key] as Map).keys;
      for (final code in codeKeys) {
        final premiumDetails = _benifitOverViewDetail[code] as PremiumDetails;
        await dbClient.transaction((txn) async {
          txn.rawInsert(
              'INSERT INTO RiderDetails(benefitCode, min, max, multiples,suminsured,webRefNumber,riderIndex) VALUES (?, ?, ?, ?,?,?,?)',
              [
                premiumDetails.benfitCode,
                premiumDetails.min,
                premiumDetails.max,
                premiumDetails.multiple,
                premiumDetails.sumAssured,
                webRefNumber,
                key
              ]);
        });
      }
    }
    return true;
  }

//Update proposal payment
  Future<bool> updateProposalPayment(
      JsonObject _jsonObject,
      int _sectionID,
      int fieldDependencyID,
      String _webRefNumber) async {
    final premiumObject = jsonDecode(_jsonObject.premiumObject);
    final policyFee = premiumObject["PolicyFee"];
    final premiumAmount =
       double.parse( _returnPremium(
                int.parse(premiumObject["objProductDetials"]["PreferredMode"]),
                premiumObject).replaceAll(",","")) + double.parse(policyFee.replaceAll(",", ""));
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      txn.rawUpdate(
          'UPDATE FieldResponse SET fieldValue = ? WHERE webRefNumber = ? AND sectionId = ? AND fieldDependencyID = ?',
          [premiumAmount, _webRefNumber, _sectionID, fieldDependencyID]);
    });
    return true;
  }

  //Insert
  Future<bool> insertIntoFieldResponse(
      Map data, String webRefNumber, bool isInternSave, bool isFNA) async {
    var tempWebRefNumber = "";
    if (webRefNumber.length > 0) {
      tempWebRefNumber = webRefNumber;
      deleteFieldResponse(webRefNumber);
    } else {
      tempWebRefNumber = Utility().returnWebRefNumber().toString();
    }
    var dbClient = await db;
    await Future.forEach(data.keys, (element) async {
      final _subSectionDetails = data[element];
      await Future.forEach(_subSectionDetails, (data) async {
        final fieldDetails = data as SectionSubSection;
        await dbClient.transaction((txn) async {
          txn.rawInsert(
              'INSERT INTO FieldResponse(fieldId, sectionId, subSectionId, fieldValue,webRefNumber,fieldDependencyID) VALUES (?, ?, ?, ?,?,?)',
              [
                fieldDetails.fieldID,
                ((!isInternSave)
                    ? returnSectionIDWihSectionID(fieldDetails.sectionID, isFNA)
                    : fieldDetails.sectionID),
                fieldDetails.subSectionID,
                fieldDetails.fieldValue,
                tempWebRefNumber,
                fieldDetails.fieldDependencyID
              ]);
        });
      });
    });
    return true;
  }

  returnSectionIDWihSectionID(int sectionID, bool isFNA) {
    switch (sectionID) {
      case 1000:
        return 1001;
        break;
      case 1001:
        return 2000;
        break;
      case 2000:
        return (isFNA) ? 2002 : 2001;
        break;
      case 2001:
        return 2002;
        break;
      case 2002:
        return 3000;
        break;
      case 3000:
        return 4000;
        break;
      case 4000:
        return 6000;
        break;
      case 6000:
        return 4001;
      default:
        return sectionID;
        break;
    }
  }

  //Get
  Future<List<FieldResponse>> getFieldResponseDetails() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM FieldResponse');
    List<FieldResponse> fieldResponse = new List();
    for (int i = 0; i < list.length; i++) {
      fieldResponse.add(new FieldResponse(
          fieldID: list[i]["fieldId"],
          sectionID: list[i]["sectionId"],
          subSectionID: list[i]["subSectionId"],
          fieldValue: list[i]["fieldValue"],
          webRefNumber: list[i]["webRefNumber"],
          fieldDependencyID: list[i]["fieldDependencyID"]));
    }
    return fieldResponse;
  }

  //Update field response
  Future<bool> updateFieldResponse(int _sectionID, String _webRefNumber) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      txn.rawUpdate(
          'UPDATE FieldResponse SET sectionId = ? WHERE webRefNumber = ?',
          [_sectionID, _webRefNumber]);
    });
    return true;
  }

  //Delete
  deleteFieldResponse(String webRefNumber) async {
    var dbClient = await db;
    return await dbClient.rawDelete(
        'DELETE FROM FieldResponse WHERE webRefNumber = $webRefNumber');
  }

  deleteRiderDetails(String webRefNumber) async {
    var dbClient = await db;
    return await dbClient.rawDelete(
        'DELETE FROM RiderDetails WHERE webRefNumber = $webRefNumber');
  }

  deleteFieldResponseWithSectionID(int sectionID, String webRefNumber) async {
    var dbClient = await db;
    return await dbClient.rawDelete(
        'DELETE FROM FieldResponse WHERE webRefNumber = "$webRefNumber" AND sectionId = "$sectionID"');
  }

  Future<List<FieldResponse>> getFieldResponseDetailsWithSectionId(
      int sectionId) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery(
        'SELECT * FROM FieldResponse where sectionId = $sectionId ORDER BY webRefNumber DESC');
    List<FieldResponse> fieldResponse = new List();
    for (int i = 0; i < list.length; i++) {
      fieldResponse.add(new FieldResponse(
          fieldID: list[i]["fieldId"],
          sectionID: list[i]["sectionId"],
          subSectionID: list[i]["subSectionId"],
          fieldValue: list[i]["fieldValue"],
          webRefNumber: list[i]["webRefNumber"]));
    }
    return fieldResponse;
  }

  Future<List<FieldResponse>> getPageFieldResponseDetailsWithSectionId(
      int sectionId, String webRefNumber) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery(
        'SELECT * FROM FieldResponse where sectionId = $sectionId AND webRefNumber = "$webRefNumber"');
    List<FieldResponse> fieldResponse = new List();
    for (int i = 0; i < list.length; i++) {
      fieldResponse.add(new FieldResponse(
          fieldID: list[i]["fieldId"],
          sectionID: list[i]["sectionId"],
          subSectionID: list[i]["subSectionId"],
          fieldValue: list[i]["fieldValue"],
          webRefNumber: list[i]["webRefNumber"]));
    }
    return fieldResponse;
  }

  Future<List<PremiumDetails>> getPremiumDetailsWithWebRefNumber(
      String webRefNumber) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery(
        'SELECT * FROM RiderDetails where webRefNumber = "$webRefNumber"');
    List<PremiumDetails> riderResponse = new List();
    for (int i = 0; i < list.length; i++) {
      riderResponse.add(new PremiumDetails(
          benfitCode: list[i]["benefitCode"],
          min: list[i]["min"],
          max: list[i]["max"],
          multiple: list[i]["multiples"],
          sumAssured: list[i]["suminsured"],
          riderIndex: list[i]["riderIndex"]));
    }
    return riderResponse;
  }

//Service Response
//Insert
  Future<bool> insertIntoServiceResponseID(
      String webRefNumber, Map object) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO ServiceResponseID(webRefNumber, contactID, quotationNumber,proposalNumber) VALUES (?,?,?,?)',
          [webRefNumber, object["contactID"], object["quotationNumber"], ""]);
    });
    return true;
  }

//Get
  Future<List<ServiceResponseID>> getServiceResponseIDWith(
      String webRefNumber) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery(
        'SELECT * FROM ServiceResponseID where webRefNumber = "$webRefNumber"');
    List<ServiceResponseID> serviceResponseID = new List();
    for (int i = 0; i < list.length; i++) {
      serviceResponseID.add(new ServiceResponseID(
          webRefNumber: list[i]["webRefNumber"],
          contactID: list[i]["contactID"],
          quotationNumber: list[i]["quotationNumber"],
          proposalNumber: list[i]["proposalNumber"]));
    }
    return serviceResponseID;
  }

  Future<List<ServiceResponseID>> getServiceResponse() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM ServiceResponseID');
    List<ServiceResponseID> serviceResponseID = new List();
    for (int i = 0; i < list.length; i++) {
      serviceResponseID.add(new ServiceResponseID(
          webRefNumber: list[i]["webRefNumber"],
          contactID: list[i]["contactID"],
          quotationNumber: list[i]["quotationNumber"],
          proposalNumber: list[i]["proposalNumber"]));
    }
    return serviceResponseID;
  }
}
