import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sqflite_db/app/data/models/note_model.dart';

import '../controllers/edit_note_controller.dart';

// ignore: must_be_immutable
class EditNoteView extends GetView<EditNoteController> {
  Note note = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditNoteView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: controller.judulC,
              decoration: InputDecoration(
                hintText: note.title,
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: controller.subjudulC,
              decoration: InputDecoration(
                hintText: note.subtitle,
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              debugPrint("EDIT NOTE");
            }, child: Text("Save"))
          ],
        ),
      )
    );
  }
}
