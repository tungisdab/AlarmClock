import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String tableAlarm = 'alarm';
final String columnId = 'id';
final String columnTitle = 'title';
final String columnDateTime = 'alarmDateTime';
final String columnPending = 'isPending';
final String columnColorIndex = 'gradientColorIndex';


class DBAlarm{
  static Database? _database;
  static DBAlarm? _dbAlarm;

  DBAlarm._createInstance();
  factory DBAlarm(){
    if(_dbAlarm == null){
      _dbAlarm = DBAlarm._createInstance();
    }
    return _dbAlarm!;
  }

  Future<Database> get database async{
    if(_database == null){
      _database = await _initializeDB();
    }
    return _database!;
  }
  Future<String> get fullPath async{
    const nameDB = "alarm.db";
    final path = await getDatabasesPath();
    return join(path, nameDB);
  }
  Future<Database> _initializeDB() async{
    var path = await fullPath;
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        db.execute('''
          CREATE TABLE $tableAlarm (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnTitle TEXT NOT NULL,
            $columnDateTime TEXT NOT NULL,
            $columnPending INTEGER,
            $columnColorIndex INTEGER,
        ''');
      },
    );
    return database;
  }

  // void insertAlarm(AlarmInfo alarmInfo){
  //   var db = this.database();
  //   db.insert(tableAlarm, alarmInfo.toMap());
  // }

}