import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();
  static final CartDatabaseHelper cartDatabaseHelper = CartDatabaseHelper._();
  Database? _database;
  Future<Database?>? get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();

    return _database;
  }

  initDB() async {
    final path = join(await getDatabasesPath(), "CartProduct.db");
    return openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      return db.execute(''' 
      CREATE TABLE $cartProductTable (
        $columnName TEXT NOT NULL,
        $columnImage TEXT NOT NULL,
        $columnQuantity INTEGER NOT NULL,
        $columnPrice TEXT NOT NULL,
        $columnId TEXT NOT NULL)
      ''');
    });
  }

  Future insertToDatabase(CartProductModel cartProductModel) async {
    final dbClient = await database;
    await dbClient!.insert(cartProductTable, cartProductModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CartProductModel>> getAllData() async {
    final dbClient = await database;
    List<Map<String, dynamic>> tableData =
        await dbClient!.query(cartProductTable);
    List<CartProductModel> cartData = tableData.isNotEmpty
        ? tableData
            .map((product) => CartProductModel.fromJson(product))
            .toList()
        : [];
    return cartData;
  }

  updateData(CartProductModel cartProductModel) async {
    final dbClient = await database;
    return await dbClient!.update(cartProductTable, cartProductModel.toJson(),
        where: "$columnId = ?", whereArgs: [cartProductModel.productId]);
  }
}
