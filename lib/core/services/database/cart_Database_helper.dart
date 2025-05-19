// ignore_for_file: file_names

import 'package:ecommerce/constant.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDataBaseHelper {
  CartDataBaseHelper._();

  static final CartDataBaseHelper db = CartDataBaseHelper._();

  static Database? _database;

  Future<Database?> get databes async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDb();
    }
    return null;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), "CartProduct.db");

    return await openDatabase(path, version: 2,
        onUpgrade: (db, oldVersion, newVersion) async {
      if (oldVersion < newVersion) {
        await db.execute('DROP TABLE IF EXISTS $tableCartProduct');
        await db.execute('''
        CREATE TABLE $tableCartProduct (
          $uid TEXT,
          $columnName TEXT,
          $columnImage TEXT UNIQUE,
          $columnPrice INTEGER,
          $columnQuantity INTEGER,
          $columnPhone TEXT NOT NULL
        )
      ''');
      }
    }, onCreate: (db, version) async {
      await db.execute('''
      CREATE TABLE $tableCartProduct (
        $uid TEXT,
        $columnName TEXT,
        $columnImage TEXT UNIQUE,
        $columnPrice INTEGER,
        $columnQuantity INTEGER,
        $columnPhone TEXT NOT NULL
      )
    ''');
    });
  }

  Future<List<CartProductModel>> getAllProduct() async {
    Database? dbClient = await databes;
    List<Map> maps = await dbClient!.query(tableCartProduct);
    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];

    return list;
  }

  insert(CartProductModel model) async {
    var dbClient = await databes;

    await dbClient?.insert(
      tableCartProduct,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  delete() async {
    var dbClient = await databes;
    await dbClient?.delete(tableCartProduct);
  }

  deleteRaw(var image) async {
    var dbClient = await databes;
    await dbClient!.rawDelete(
        'DELETE FROM $tableCartProduct WHERE $columnImage = ?', [image]);
  }
}
