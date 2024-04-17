/// title : "sample"
/// description : "test"
/// isCompleted : false

class Task {
  Task(
    String? title,
    String? description,
    bool isCompleted,
  ) {
    _title = title;
    _description = description;
    isCompleted = isCompleted;
  }

  Task.fromJson(dynamic json) {
    id = json['id'];
    _title = json['title'];
    _description = json['description'];
    isCompleted =
        json['isCompleted'] != null && json['isCompleted'] == 1 ? true : false;
  }
  num? id;
  String? _title;
  String? _description;
  bool isCompleted = false;

  String? get title => _title;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    map['isCompleted'] = isCompleted ? 1 : 0;
    return map;
  }
}
