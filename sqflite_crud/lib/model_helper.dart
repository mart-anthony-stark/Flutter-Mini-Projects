import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ModelHelper {
  static final ModelHelper _instance = ModelHelper.internal();

  factory ModelHelper() => _instance;
  static Database? _database;

  final String tableName = 'my_table';
  final String columnId = 'id';
  final String columnName = 'name';

  ModelHelper.internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'my_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, $columnName TEXT)',
        );
      },
    );
  }

  Future<List<MyModel>> getAllItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (index) {
      return MyModel(
        id: maps[index][columnId],
        name: maps[index][columnName],
      );
    });
  }

  Future<int> insertItem(MyModel item) async {
    final db = await database;

    return await db.insert(tableName, item.toMap());
  }

  Future<int> updateItem(MyModel item) async {
    final db = await database;

    return await db.update(
      tableName,
      item.toMap(),
      where: '$columnId = ?',
      whereArgs: [item.id],
    );
  }

  Future<int> deleteItem(int id) async {
    final db = await database;

    return await db.delete(
      tableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future closeDatabase() async {
    final db = await database;
    db.close();
  }
}

class MyModel {
  final int id;
  final String name;

  MyModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}

final dbHelper = ModelHelper();
