import 'dart:convert';

/// Generated using [Dart Data Class Generator]:
class TodoModel {
  final String id;
  final String desc;

  final bool completed;

  TodoModel({
    required this.id,
    required this.desc,
    required this.completed,
  });

  TodoModel copyWith({
    String? id,
    String? desc,
    bool? completed,
  }) {
    return TodoModel(
      id: id ?? this.id,
      desc: desc ?? this.desc,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'desc': desc,
      'completed': completed,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] ?? '',
      desc: map['desc'] ?? '',
      completed: map['completed'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) => TodoModel.fromMap(json.decode(source));

  @override
  String toString() => 'TodoModel(id: $id, desc: $desc, completed: $completed)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TodoModel &&
        other.id == id &&
        other.desc == desc &&
        other.completed == completed;
  }

  @override
  int get hashCode => id.hashCode ^ desc.hashCode ^ completed.hashCode;
}
