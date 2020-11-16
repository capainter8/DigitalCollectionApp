import 'package:DigitalCollectionApp/models/Collection.dart';
import 'package:DigitalCollectionApp/models/Schema.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  /// Private constructor
  /// Singleton class
  LocalDatabase._();
  static final LocalDatabase instance = LocalDatabase._();

  static Database _database;
  Future<Database> get database async {
    if (_database == null) _database = await init();
    return _database;
  }

  Future<Database> init() async {
    return await openDatabase(join(await getDatabasesPath(), 'collections.db'),
        onCreate: (db, version) async {
      await db.execute('''
          CREATE TABLE collections (
            id TEXT PRIMARY KEY,
            name TEXT,
            description TEXT,
            creation_date TEXT,
            schema TEXT,
            items TEXT
          )''');
    }, version: 1);
  }

  Future<List<Collection>> getAllCollections() async {
    final Database db = await database;
    return (await db.query('collections'))
        .map((elem) => _buildCollection(elem))
        .toList();
  }

  Future<Collection> getCollectionByName(String name) async {
    final Database db = await database;
    List<Map<String, dynamic>> maps =
        await db.query('collections', where: 'name = ?', whereArgs: [name]);
    if (maps.isNotEmpty) {
      return _buildCollection(maps[0]);
    } else {
      return null;
    }
  }

  Collection _buildCollection(Map<String, dynamic> item) {
    return Collection.fromExisting(
        id: int.parse(item['id']),
        name: item['name'],
        description: item['description'],
        creationDate: DateTime.parse(item['creation_date']),
        itemsJson: item['items'],
        schema: Schema.fromJson(json: item['schema']));
  }

  Future<void> insertCollection(Collection c) async {
    final Database db = await database;

    List<String> collectionNames = await getCollectionNames();

    if (!collectionNames.contains(c.name)) {
      await db.insert('collections', {
        'id': c.id.toString(),
        'name': c.name,
        'description': c.description,
        'creation_date': c.creationDate.toIso8601String(),
        'schema': c.schema.serialize(),
        'items': c.serializeItems()
      });
    }
  }

  Future<void> updateCollection(Collection c) async {
    final Database db = await database;

    List<String> collectionNames = await getCollectionNames();

    if (collectionNames.contains(c.name)) {
      await db.update('collections', {
        'id': c.id.toString(),
        'name': c.name,
        'description': c.description,
        'creation_date': c.creationDate.toIso8601String(),
        'schema': c.schema.serialize(),
        'items': c.serializeItems()
      });
    }
  }

  Future<void> deleteCollection(Collection c) async {
    final Database db = await database;

    List<String> collectionNames = await getCollectionNames();

    if (collectionNames.contains(c.name)) {
      await db.delete('collections', where: 'name = ?', whereArgs: [c.name]);
    }
  }

  Future<List<String>> getCollectionNames() async {
    final Database db = await database;

    List<Map<String, dynamic>> maps =
        await db.query('collections', columns: ['name']);
    return maps.map((elem) => elem['name'].toString()).toList();
  }
}
