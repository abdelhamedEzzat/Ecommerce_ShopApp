import 'package:ecommerce_shop_app/cubit/home_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../persentation _ layer/model/models.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  //
  //
  //

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    // إذا لم تكن قاعدة البيانات موجودة، قم بإنشائها.
    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    final String path = join(await getDatabasesPath(), 'shop.db');
    return await openDatabase(path,
        version: 1, onCreate: _createDatabase, onOpen: (db) {});
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        subTitle TEXT,
        price INTEGER,
        prodectImage TEXT,
        colorProdectImage INTEGER
      )
    ''').then((value) {
      print("DataBase Created And Open ");
      emit(AppCreateDataBaseSuccessfullyState());
    }).catchError((e) {
      print("dataBaseCreatedError $e");
      emit(AppCreateDataBaseFailedState());
    });
  }

  Future<int> insertProduct(ProductInfoModel product) async {
    final db = await database;
    print("insert ${product.toMap()}");
    int rowId = -1;
    return rowId = await db!.insert('Products', product.toMap()).then((value) {
      print("insert successfully ");
      emit(AppInsertDataBaseSuccessfollyState());
      return rowId;
    });
  }

  Future<List<ProductInfoModel>> getAllProducts(
      ProductInfoModel prodecut) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query('products');
    print("maps is : $maps");
    print("getdata successfully ");

    final prodecuts = List.generate(maps.length, (i) {
      return ProductInfoModel(
        title: maps[i]['title'],
        subTitle: maps[i]['subTitle'],
        price: double.parse(maps[i]['price']).toDouble(),
        prodectImage: maps[i]['prodectImage'],
        colorProdectImage: maps[i]['colorProdectImage'],
      );
    });
    emit(AppGetDataBaseState(prodecuts));

    return prodecuts;
  }
  //
  //
  //

  // this varuable for get price data From productInfoLISTForHotSales
  int index = 0;

// this varuable for get increment and  decrement data

  int currentIndex = 1;

  increment() {
    if (currentIndex < 1) {
      currentIndex = 1;
    } else {
      currentIndex++;
    }

    emit(AppIncrementState());
  }

  decrement() {
    if (currentIndex == 1) {
      currentIndex = 1;
    } else if (currentIndex >= 1) {
      currentIndex--;
    }

    emit(AppDecrementState());
  }
}
