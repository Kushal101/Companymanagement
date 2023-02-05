import 'package:flutter/animation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/Companymodel.dart';


class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableNotes ( 
  ${CompanyModelField.id} $idType, 
  ${CompanyModelField.isImportant} $boolType,
  ${CompanyModelField.title} $textType,
 
 
  )
''');
  }

  Future<CompanyModel> create(CompanyModel companyModel) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableNotes, companyModel.toJson());
    return companyModel.copy(id: id);
  }

  Future<CompanyModel> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableNotes,
      columns: CompanyModelField.values,
      where: '${CompanyModelField.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return CompanyModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<CompanyModel>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${CompanyModelField.id} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableNotes, orderBy: orderBy);

    return result.map((json) => CompanyModel.fromJson(json)).toList();
  }

  Future<int> update(CompanyModel companyModel) async {
    final db = await instance.database;

    return db.update(
      tableNotes,
      companyModel.toJson(),
      where: '${companyModel.id} = ?',
      whereArgs: [companyModel.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableNotes,
      where: '${CompanyModelField.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
