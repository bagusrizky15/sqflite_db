import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_db/app/data/db/database_manager.dart';

class AddNoteController extends GetxController {
  DatabaseManager database = DatabaseManager.instance;

  TextEditingController judulC = TextEditingController();
  TextEditingController subjudulC = TextEditingController();

  void addNote() async {
    if (judulC.text.isEmpty || subjudulC.text.isEmpty) {
      Get.snackbar('Error', 'Judul dan sub judul harus diisi');
    } else {
      Database db = await database.db;
      await db.insert('notes', {
        'title': judulC.text,
        'subtitle': subjudulC.text
      });

      Get.back();
    }
  }
}
