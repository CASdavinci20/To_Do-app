
class TaskClass {
  final String id;
  final String name;
  final String content;

  TaskClass({
    required this.id,
    required this.name,
    required this.content,
  });

  factory TaskClass.fromJson(Map<String, dynamic> json) {
    return TaskClass(
      id: json['id'] ?? 'not found',
      name: json['title'] ?? 'No Name',
      content: json['content'] ?? 'no content',
    );
  }

  static List<TaskClass> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => TaskClass.fromJson(json)).toList();
  }
}

class TaskIdClass {
  final String tagId;

  TaskIdClass({
    required this.tagId,
  });

  factory TaskIdClass.fromJson(Map<String, String> json) {
    return TaskIdClass(
      tagId: json['tag_id'] ?? 'notfound',
    );
  }
}