import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_db/app/data/db/database_manager.dart';
import 'package:sqflite_db/app/data/models/note_model.dart';

class HomeController extends GetxController {
  RxList allNotes = <Note>[].obs;
  DatabaseManager database = DatabaseManager.instance;

  @override
  void onInit() {
    getAllNotes();
    super.onInit();
  }

  Future<void> getAllNotes() async {
    Database db = await database.db;
    List<Map<String, dynamic>> data = await db.query('notes');

    if (data.isNotEmpty) {
      allNotes(Note.toJsonList(data));
      allNotes.refresh(); 
    } else {
      allNotes.clear();
      allNotes.refresh();
    }
  }

  void deleteNote(int id) async {
    Database db = await database.db;
    await db.delete('notes', where: 'id = ?', whereArgs: [id]);
    await getAllNotes();
    Get.back();
  }
}
