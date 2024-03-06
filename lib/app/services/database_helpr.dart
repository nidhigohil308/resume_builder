// database_helper.dart
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/resume_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._privateConstructor();

  factory DatabaseHelper() {
    _instance ??= DatabaseHelper._privateConstructor();
    return _instance!;
  }

  Future<Database> get database async {
    // ignore: unnecessary_null_comparison
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'resume_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE resumes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        image_path TEXT,
        name TEXT,
        email TEXT,
        phone_number TEXT,
        education TEXT,
        work_experience TEXT,
        skills TEXT,
        languages TEXT
      )
    ''');
  }

  Future<int> insertResume(ResumeModel resume) async {
    Database db = await database;
    return await db.insert('resumes', resume.toMap());
  }

  Future<List<ResumeModel>> getAllResumes() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('resumes');
    return List.generate(maps.length, (index) {
      return ResumeModel(
        id: maps[index]['id'],
        imagePath: maps[index]['image_path'],
        name: maps[index]['name'],
        email: maps[index]['email'],
        phoneNumber: maps[index]['phone_number'],
        education: maps[index]['education'],
        workExperience: maps[index]['work_experience'],
        skills: maps[index]['skills'],
        languages: maps[index]['languages'],
      );
    });
  }

  Future<ResumeModel> getResumeById(int id) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'resumes',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return ResumeModel(
        id: maps.first['id'],
        imagePath: maps.first['image_path'],
        name: maps.first['name'],
        email: maps.first['email'],
        phoneNumber: maps.first['phone_number'],
        education: maps.first['education'],
        workExperience: maps.first['work_experience'],
        skills: maps.first['skills'],
        languages: maps.first['languages'],
      );
    } else {
      return ResumeModel(); // Return null if no resume is found with the specified ID
    }
  }

  Future<int> updateResumeById(int id, ResumeModel updatedResume) async {
    Database db = await database;
    return await db.update(
      'resumes',
      updatedResume.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteResumeById(int id) async {
    Database db = await database;
    return await db.delete(
      'resumes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
