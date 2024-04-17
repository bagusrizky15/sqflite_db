class Note {
  int? id;
  String? title;
  String? subtitle;

  Note({this.id, this.title, this.subtitle});

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['subtitle'] = subtitle;
    return data;
  }

  static List<Note> toJsonList(List? data){
    if(data == null) return [];
    return data.map((item) => Note.fromJson(item)).toList();
  }
}
