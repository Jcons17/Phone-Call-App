import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBprovider {
  static Database? _database;
  static final DBprovider db = DBprovider._();
  DBprovider._();

  Future<Database> get database async {
    if (_database == null) return _database!;

    _database = await initDB();

    return _database!;
  }

  Future<Database> initDB() async {
    final pathName = await getApplicationDocumentsDirectory();
    final path = join(pathName.path, "contactos.db");

    print(path);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      db.execute('''
            CREATE TABLE contactos(
              idcontact INTEGER PRIMARY,
              firstName TEXT,
              lastName TEXT,
              numberPhone TEXT,
              pathImage TEXT,
              );
          ''');
    });
  }
}
