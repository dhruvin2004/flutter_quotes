import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exam/screen/quotespage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

import 'global.dart';


Future<void> copyDatabase() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, 'database.db');

  bool fileExists = await databaseExists(path);

  if (!fileExists) {
    ByteData data = await rootBundle.load(join('lib/database/quotes.db'));
    List<int> bytes =
    data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes);
  }
}


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await copyDatabase();
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, 'database.db');
  Database database = await openDatabase(path);
  list = await database.rawQuery('SELECT * FROM Data');
  runApp(const MyApp());


}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuotesApp(),
    );
  }
}
