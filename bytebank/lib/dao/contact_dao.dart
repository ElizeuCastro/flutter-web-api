import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/Contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDAO {
  static const String SQL = 'CREATE TABLE $TABLE('
      '$ID INTEGER PRIMARY KEY, '
      '$NAME TEXT, '
      '$ACCOUNT_NUMBER NUMBER)';

  static const String TABLE = "contacts";
  static const String ID = "id";
  static const String NAME = "name";
  static const String ACCOUNT_NUMBER = "account_number";

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contacts = toMap(contact);
    return db.insert(TABLE, contacts);
  }

  Map<String, dynamic> toMap(Contact contact) {
    final Map<String, dynamic> contacts = Map();
    contacts[NAME] = contact.name;
    contacts[ACCOUNT_NUMBER] = contact.accountNumber;
    return contacts;
  }

  Future<int> update(Contact contact) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> contactMap = toMap(contact);
    return db.update(
      TABLE,
      contactMap,
      where: '$ID = ?',
      whereArgs: [contact.id],
    );
  }

  Future<int> delete(int id) async {
    final Database db = await getDatabase();
    return db.delete(
      TABLE,
      where: '$ID = ?',
      whereArgs: [id],
    );
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> contacts = await db.query(TABLE);
    final List<Contact> result = toList(contacts);
    return result;
  }

  List<Contact> toList(List<Map<String, dynamic>> contacts) {
    final List<Contact> result = [];
    for (Map<String, dynamic> contact in contacts) {
      result.add(
        Contact(
          contact[ID],
          contact[NAME],
          contact[ACCOUNT_NUMBER],
        ),
      );
    }
    return result;
  }
}
