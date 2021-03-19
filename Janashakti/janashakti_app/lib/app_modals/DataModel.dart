import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:jiclapp/app_modals/SectionMaster.dart';

class DataModel {

  static final _databaseName = "jicl.db";
  static final _databaseVersion = 1;
  // make this a singleton class
  DataModel._privateConstructor();
  static final DataModel instance = DataModel._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  static final entity_sectionMaster = 'sectionMaster';
//
  static final att_sectionId = 'sectionId';
  static final att_sectionName = 'sectionName';

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $entity_sectionMaster (
            $att_sectionId INTEGER PRIMARY KEY,
            $att_sectionName TEXT NOT NULL
          )
          ''');

    await db.rawInsert('INSERT INTO $entity_sectionMaster ($att_sectionId, $att_sectionName) VALUES(1000, "Bob")');
    await db.rawInsert('INSERT INTO $entity_sectionMaster ($att_sectionId, $att_sectionName) VALUES(1001, "Mary")');
    await db.rawInsert('INSERT INTO $entity_sectionMaster ($att_sectionId, $att_sectionName) VALUES(1002, "Susan")');
  }

  // MARK: Helper methods
  Future<int> insertIntoSectionMaster(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(entity_sectionMaster, row);
  }

//  Future<List<Map<String, dynamic>>> queryAllRows() async {
//    Database db = await instance.database;
//    return await db.query(table);
//  }
//
  Future<List<Map<String, dynamic>>> getSectionMasterData() async {
    Database db = await instance.database;
    return await db.query(entity_sectionMaster);
  }

  Future<List<SectionMaster>> getSectionMasters() async {
    var sectionMastersMapList = await getSectionMasterData();
    int count = sectionMastersMapList.length;

    List<SectionMaster> newList = List<SectionMaster>();
    for (int i = 0; i < count; i++) {
      print(sectionMastersMapList);
//      var obj = SectionMaster.fromList(items[]);
//      newList.add(obj);
    }
  }
//
//  Future<int> update(Map<String, dynamic> row) async {
//    Database db = await instance.database;
//    int id = row[columnId];
//    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
//  }
//
//  Future<int> delete(int id) async {
//    Database db = await instance.database;
//    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
//  }
}