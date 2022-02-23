import 'package:mega_store/constants.dart';
import 'package:mega_store/models/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MegaStoreDatabaseHelper {
  MegaStoreDatabaseHelper._();
  static final MegaStoreDatabaseHelper db = MegaStoreDatabaseHelper._();
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), "MegaStoreDatabase.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int verson) async {
        await db.execute('''CREATE TABLE $cartTableName 
        ($productNameColumn TEXT NOT NULL, 
        $productImageColumn TEXT NOT NULL, 
        $productQuantityColumn INTEGER NOT NULL,
        $productPriceColumn TEXT NOT NULL)''');
      },
    );
  }

  insert(CartProductModel cart) async {
    var dbClient = await database;
    await dbClient?.insert(
      cartTableName,
      cart.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}