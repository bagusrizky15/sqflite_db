import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sqflite_db/app/modules/home/controllers/home_controller.dart';

import '../controllers/add_note_controller.dart';

class AddNoteView extends GetView<AddNoteController> {
  
  HomeController homeC = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddNoteView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: controller.judulC,
              decoration: InputDecoration(
                labelText: "Judul",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: controller.subjudulC,
              decoration: InputDecoration(
                labelText: "Sub Judul",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              debugPrint("ADD NOTE");
              controller.addNote();
              homeC.getAllNotes();
            }, child: Text("Save"))
          ],
        ),
      )
    );
  }
}
