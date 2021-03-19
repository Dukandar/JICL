import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'DBHelper.dart';
import 'MasterModals.dart';

class CSVReader {
  static CSVReader _sharedInstance;
  factory CSVReader() => _sharedInstance ??= CSVReader._();
  CSVReader._();
  final _allCsvFiles = CSVMasterNames.allCsvFiles;
  var _index = 0;

//MARK:- Reading CSV Files
  Future<bool> prepareDBWithCSVFiles() async {
    var csvData = {};
    // final file = _allCsvFiles[_index];
    if (_allCsvFiles[_index] == MasterNames.kSectionMaster) {
      List<List> csv = await getCSVData(_allCsvFiles[_index]);
      csvData[_allCsvFiles[_index]] = await parseSectionMaster(csv);
    }
    if (_allCsvFiles[_index + 1] == MasterNames.kSubSectionMaster) {
      List<List> csv = await getCSVData(_allCsvFiles[_index + 1]);
      csvData[_allCsvFiles[_index + 1]] = await parseSubSectionMaster(csv);
    }
    if (_allCsvFiles[_index + 2] == MasterNames.kFieldMaster) {
      List<List> csv = await getCSVData(_allCsvFiles[_index + 2]);
      csvData[_allCsvFiles[_index + 2]] = await parseFieldMaster(csv);
    }
    if (_allCsvFiles[_index + 3] == MasterNames.kFieldData) {
      List<List> csv = await getCSVData(_allCsvFiles[_index + 3]);
      csvData[_allCsvFiles[_index + 3]] = await parseFieldData(csv);
    }
    if (_allCsvFiles[_index + 4] == MasterNames.kFieldDependency) {
      List<List> csv = await getCSVData(_allCsvFiles[_index + 4]);
      csvData[_allCsvFiles[_index + 4]] = await parseFieldDependency(csv);
    }
    if (_allCsvFiles[_index + 5] == MasterNames.kFieldDependent) {
      List<List> csv = await getCSVData(_allCsvFiles[_index + 5]);
      csvData[_allCsvFiles[_index + 5]] = await parseFieldDepdent(csv);
    }
    if (_allCsvFiles[_index + 6] == MasterNames.kRiderMaster) {
      List<List> csv = await getRiderMaster(_allCsvFiles[_index + 6]);
      csvData[_allCsvFiles[_index + 6]] = await parseRiderMaster(csv);
    }
    if (_allCsvFiles[_index + 7] == MasterNames.kExpandCollapse) {
      List<List> csv = await getCSVData(_allCsvFiles[_index + 7]);
      csvData[_allCsvFiles[_index + 7]] = await parseExpandCollapseMaster(csv);
    }

    if (_allCsvFiles[_index + 8] == MasterNames.kHideUnHide) {
      List<List> csv = await getCSVData(_allCsvFiles[_index + 8]);
      csvData[_allCsvFiles[_index + 8]] = await parseHideUnHide(csv);
    }

    if (_allCsvFiles[_index + 9] == MasterNames.kHeaderSectionFields) {
      List<List> csv = await getCSVData(_allCsvFiles[_index + 9]);
      csvData[_allCsvFiles[_index + 9]] = await parseHeaderSectionFields(csv);
    }

    final _ = await DBHelper().insertingMasterData(csvData);
    return true;
  }

//MARK: Reading CSV files

  Future<List<List>> getRowsFromCSV(String csvName) async {
    final filename = 'assets/csv/' + csvName + '.csv';
    final csvStr = await rootBundle.loadString(filename);
    final csv = new CsvToListConverter().convert(csvStr, eol: "\n");
    csv.removeAt(0);
    return csv;
  }

//MARK:- Parsing Masters
  Future<List<HeaderSectionFields>> parseHeaderSectionFields(
      List<List> csv) async {
    var _hideUnHide = <HeaderSectionFields>[];
    await Future.forEach(csv, (element) async {
      int _fieldID = element[0] ?? int.tryParse(element[0]) ?? 0;
      String _fieldname = element[1];
      int _suspect = element[2] ?? int.tryParse(element[2]) ?? 0;
      int _prospect = element[3] ?? int.tryParse(element[3]) ?? 0;
      int _fna = element[4] ?? int.tryParse(element[4]) ?? 0;
      int _quotation = element[5] ?? int.tryParse(element[5]) ?? 0;
      int _proposal = element[6] ?? int.tryParse(element[6]) ?? 0;
      int _payment = element[7] ?? int.tryParse(element[7]) ?? 0;
      int _status = element[8] ?? int.tryParse(element[8]) ?? 0;
      int _failedproposals = element[9] ?? int.tryParse(element[9]) ?? 0;
      int _pendingrequirements = element[10] ?? int.tryParse(element[10]) ?? 0;
      _hideUnHide.add(new HeaderSectionFields(
          fieldID: _fieldID,
          fieldName: _fieldname,
          suspect: _suspect,
          prospsect: _prospect,
          fna: _fna,
          quotation: _quotation,
          proposal: _proposal,
          payment: _payment,
          status: _status,
          failedproposals: _failedproposals,
          pendingrequirements: _pendingrequirements));
    });
    return _hideUnHide;
  }

  Future<List<HideUnHide>> parseHideUnHide(List<List> csv) async {
    var _hideUnHide = <HideUnHide>[];
    await Future.forEach(csv, (element) async {
      int _fieldDeptID = element[0] ?? int.tryParse(element[0]) ?? 0;
      int _deptFieldDeptID = element[1] ?? int.tryParse(element[1]) ?? 0;
      int _value = element[2] ?? int.tryParse(element[2]) ?? 0;
      _hideUnHide.add(new HideUnHide(
          fielddeptID: _fieldDeptID,
          deptFieldDeptID: _deptFieldDeptID,
          value: _value));
    });
    return _hideUnHide;
  }

  Future<List<ExpandCollapseData>> parseExpandCollapseMaster(
      List<List> csv) async {
    var _kExpandCollapseData = <ExpandCollapseData>[];
    await Future.forEach(csv, (element) async {
      int _fieldID = element[0] ?? int.tryParse(element[0]) ?? 0;
      int _fieldDependencyID = element[1] ?? int.tryParse(element[1]) ?? 0;
      int ecFieldID = element[2] ?? int.tryParse(element[2]) ?? 0;
      _kExpandCollapseData.add(new ExpandCollapseData(
          fieldID: _fieldID,
          fieldDependencyID: _fieldDependencyID,
          ecFieldID: ecFieldID));
    });
    return _kExpandCollapseData;
  }

//MARK:- Parsing Masters
  Future<List<SectionMaster>> parseSectionMaster(List<List> csv) async {
    var _kSectionMaster = <SectionMaster>[];
    await Future.forEach(csv, (element) async {
      //csv.forEach((List<dynamic> list) {
      int _sectionId = element[0] ?? int.tryParse(element[0]) ?? 0;
      _kSectionMaster.add(
          new SectionMaster(sectionID: _sectionId, sectionName: element[1]));
    });
    return _kSectionMaster;
  }

  Future<List<SubSectionMaster>> parseSubSectionMaster(List<List> csv) async {
    var _kSubSectionMaster = <SubSectionMaster>[];
    await Future.forEach(csv, (element) async {
      int _subSectionId = element[0] ?? int.tryParse(element[0]) ?? 0;
      int _sectionId = element[2] ?? int.tryParse(element[2]) ?? 0;
      _kSubSectionMaster.add(new SubSectionMaster(
          subSectionID: _subSectionId,
          subSectionName: element[1],
          sectionID: _sectionId));
    });
    return _kSubSectionMaster;
  }

  Future<List<FieldMaster>> parseFieldMaster(List<List> csv) async {
    var _kFieldMaster = <FieldMaster>[];
    await Future.forEach(csv, (element) async {
      int _fieldId = element[0] ?? int.tryParse(element[0]) ?? 0;
      dynamic _fieldName = element[1];
      dynamic _fieldType = element[2];
      dynamic _validationMessage = element[3];
      dynamic _placeholder = element[4];
      _kFieldMaster.add(new FieldMaster(
          fieldId: _fieldId,
          fieldName: "$_fieldName",
          fieldType: "$_fieldType",
          validationMessage: "$_validationMessage",
          placeholder: "$_placeholder"));
    });
    return _kFieldMaster;
  }

  Future<List<FieldData>> parseFieldData(List<List> csv) async {
    var _kFieldData = <FieldData>[];
    await Future.forEach(csv, (element) async {
      int _dataID = element[0] ?? int.tryParse(element[0]);
      int _fieldId = element[1] ?? int.tryParse(element[1]);
      dynamic _fieldValue = element[2];
      dynamic _fieldDataID = element[3];
      dynamic _fieldDepdentID = element[4];
      dynamic _isShown = (element[5] == "TRUE") ? 1 : 0;
      _kFieldData.add(new FieldData(
          dataID: _dataID,
          fieldId: _fieldId,
          fieldValue: "$_fieldValue",
          fieldDataID: "$_fieldDataID",
          fieldDepdentID: "$_fieldDepdentID",
          isShown: _isShown));
    });
    return _kFieldData;
  }

  Future<List<FieldDependency>> parseFieldDependency(List<List> csv) async {
    var _kFieldDependency = <FieldDependency>[];
    await Future.forEach(csv, (element) async {
      int _subSectionId = element[0] ?? int.tryParse(element[0]) ?? 0;
      int _fieldId = element[1] ?? int.tryParse(element[1]) ?? 0;
      int _sortOrder = element[2] ?? int.tryParse(element[2]) ?? 0;
      int _isMandatory =
          (element[3] == "TRUE" || element[3] == "TRUE") ? 1 : 0 ?? 0;
      int _isEditable =
          (element[4] == "TRUE" || element[4] == "TRUE") ? 1 : 0 ?? 0;
      int _isDependent =
          (element[5] == "TRUE" || element[5] == "TRUE") ? 1 : 0 ?? 0;
      int _isHide = (element[6] == "TRUE" || element[6] == "TRUE") ? 1 : 0 ?? 0;
      int fieldDependencyID = element[7] ?? int.tryParse(element[7]) ?? 0;
      _kFieldDependency.add(new FieldDependency(
          subSectionId: _subSectionId,
          fieldId: _fieldId,
          sortOrder: _sortOrder,
          isMandatory: _isMandatory,
          isEditable: _isEditable,
          isDependent: _isDependent,
          isHide: _isHide,
          fieldDependencyID: fieldDependencyID));
    });
    return _kFieldDependency;
  }

//Parse field depdent
  Future<List<FieldDependent>> parseFieldDepdent(List<List> csv) async {
    var _kSubSectionMaster = <FieldDependent>[];
    await Future.forEach(csv, (element) async {
      int _fieldID = element[0] ?? int.tryParse(element[0]) ?? 0;
      int _dependentID = element[1] ?? int.tryParse(element[1]) ?? 0;
      int _sectionID = element[2] ?? int.tryParse(element[2]) ?? 0;
      int _dependentFieldID = element[3] ?? int.tryParse(element[3]) ?? 0;
      int _subsectionID = element[4] ?? int.tryParse(element[4]) ?? 0;
      int _dependentsubsectionID = element[5] ?? int.tryParse(element[5]) ?? 0;
      _kSubSectionMaster.add(new FieldDependent(
          fieldID: _fieldID,
          dependentID: _dependentID,
          sectionID: _sectionID,
          dependentFieldID: _dependentFieldID,
          subsectionID: _subsectionID,
          dependentsubsectionID: _dependentsubsectionID));
    });
    return _kSubSectionMaster;
  }

//MARK:- CSV Data
  Future<List> getCSVData(String csvName) async {
    return await getRowsFromCSV(csvName);
  }

//MARK:- Rider Master
  Future<List> getRiderMaster(String csvName) async {
    return await getRowsFromCSV(csvName);
  }

//Parse field depdent
  Future<List<RiderMaster>> parseRiderMaster(List<List> csv) async {
    var _kRiderMaster = <RiderMaster>[];
    await Future.forEach(csv, (element) async {
      String benefitCode = element[0];
      int main = (element[1] == "TRUE" || element[1] == "TRUE") ? 1 : 0 ?? 0;
      int spouse = (element[2] == "TRUE" || element[2] == "TRUE") ? 1 : 0 ?? 0;
      int child = (element[3] == "TRUE" || element[3] == "TRUE") ? 1 : 0 ?? 0;
      String benefitName = element[4];
      String description = element[5];
      String imageName = element[6];
      String benefitID = element[7].toString();
      String riderCode = element[8].toString();
      String planCode = element[9].toString();
      int sortOrder = element[10] ?? int.tryParse(element[10]) ?? 0;
      int isEditable =
          (element[11] == "TRUE" || element[11] == "TRUE") ? 1 : 0 ?? 0;
      _kRiderMaster.add(new RiderMaster(
          benefitCode: benefitCode,
          main: main,
          spouse: spouse,
          child: child,
          benefitName: benefitName,
          description: description,
          imageName: imageName,
          benefitID: benefitID,
          riderCode: riderCode,
          planCode: planCode,
          sortOrder: sortOrder,
          isEditable: isEditable));
    });
    return _kRiderMaster;
  }
}
