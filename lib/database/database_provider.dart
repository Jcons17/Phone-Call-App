import 'package:appcall/model/contact_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBprovider {

  static Database? _database;

  static DBprovider db = DBprovider._();

  DBprovider._();

  Future<Database> get database async {
    if(_database != null ) return _database!;
    _database = await initDB();
    return _database!;
    
  }

  Future<Database> initDB() async {
    final pathDirectory = await getApplicationDocumentsDirectory();
    final pathDB = join(pathDirectory.path, "contact_database.db");
    //await deleteDatabase(pathDB);

    print(pathDB);

    return await openDatabase(pathDB, version: 3, 
      onCreate: (db, version) async {
        await db.execute('''
              CREATE TABLE IF NOT EXISTS contactos(
                idContact INTEGER PRIMARY KEY,
                firstName TEXT,
                lastName TEXT,
                numberPhone TEXT,
                pathImage TEXT,
                email TEXT
                );
            ''');
    });
  }

  Future<int> addContact(Map<String,dynamic> map)async{
    int id = await _database!.insert("contactos", map); 
    return id;
  }

  Future<List<Contact>> getAllContacts()async{
    final listContacts = await _database!.query("contactos"); 
    return listContacts.map((e) => Contact.fromMap(e)).toList();
  }

  Future<Contact> getContactByNumberPhone(String numberPhone)async{
    print(numberPhone);
    final contact = await _database!.query("contactos",where: "numberPhone = ?",whereArgs: [numberPhone]); 
    print(contact);
    return contact.map((e) => Contact.fromMap(e)).toList().first;
  }

  Future<int> deleteContact(int id)async{
    return await _database!.delete("contactos",where: "idContact = ?", whereArgs: [id]); 
  }

  Future<int> updateContact(Map<String,dynamic> map,int id)async{
    return await _database!.update("contactos", map, where: "idContact = ?",whereArgs: [id]); 
  }

  Future<int> updatePhotoContact(String path,int id)async{
    return await _database!.update("contactos", {"pathImage":path}, where: "idContact = ?",whereArgs: [id]); 
  }

  


}

  
