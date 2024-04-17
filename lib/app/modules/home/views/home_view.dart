import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sqflite_db/app/data/models/note_model.dart';
import 'package:sqflite_db/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: controller.getAllNotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("Loading"),
              );
            }
            return Obx(() => controller.allNotes.length == 0 
            ? Center(
                child: Text("Tidak ada data"),
              ) :
            ListView.builder(
                  itemCount: controller.allNotes.length,
                  itemBuilder: (context, index) {
                    Note note = controller.allNotes[index];
                    return ListTile(
                      onTap: () => Get.toNamed(
                        Routes.EDIT_NOTE,
                        arguments: note
                        ),
                      leading: CircleAvatar(
                        child: Text("${note.id}"),
                      ),
                      title: Text("${note.title}"),
                      subtitle: Text("${note.subtitle}"),
                      trailing: IconButton(onPressed: (){
                        Get.defaultDialog(
                          title: "Hapus",
                          middleText: "Apakah anda yakin ingin menghapus data ini?",
                          textConfirm: "Ya",
                          textCancel: "Tidak",
                          onConfirm: (){
                            controller.deleteNote(note.id!);
                          },
                          onCancel: () {
                            Get.back();
                          },
                        );
                      }, icon: Icon(Icons.delete)),
                    );
                  },
                ));
          }),
      floatingActionButton: FloatingActionButton(
          child: Text("+"),
          onPressed: () {
            Get.toNamed(Routes.ADD_NOTE);
          }),
    );
  }
}
