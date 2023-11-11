import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../Models/OrderModels/OrderDetailsModel.dart';

class OrderDetailsDatabase {
  late Database _database;

  Future<Database> get database async {
    if (_database.isOpen) {
      return _database;
    }
    return await initDatabase();
  }

  Future<Database> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'order_database.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await createOrderDetailsTable(db, version);
      },
    );

    return _database; // Return the initialized database
  }

  Future<void> createOrderDetailsTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE order_details(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        order_master_id INTEGER,
        product_name TEXT,
        quantity INTEGER,
        price INTEGER,
        amount INTEGER,
        FOREIGN KEY (order_master_id) REFERENCES order_master(orderId)
      )
    ''');
  }

  Future<void> addOrderDetails(List<OrderDetailsModel> orderDetailsList) async {
    final db = await database;
    for (var orderDetails in orderDetailsList) {
      await db.insert('order_details', orderDetails.toMap());
    }
  }

}
