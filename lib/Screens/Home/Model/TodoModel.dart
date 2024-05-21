class TodoModel {
  final List<Todos>? todos;
  final int? total;
  final int? skip;
  final int? limit;

  TodoModel({
    this.todos,
    this.total,
    this.skip,
    this.limit,
  });

  TodoModel.fromJson(Map<String, dynamic> json)
      : todos = (json['todos'] as List?)?.map((dynamic e) => Todos.fromJson(e as Map<String,dynamic>)).toList(),
        total = json['total'] as int?,
        skip = json['skip'] as int?,
        limit = json['limit'] as int?;

  Map<String, dynamic> toJson() => {
    'todos' : todos?.map((e) => e.toJson()).toList(),
    'total' : total,
    'skip' : skip,
    'limit' : limit
  };
}

class Todos {
  final int? id;
  String? todo;
  bool? completed;
  final int? userId;

  Todos({
    this.id,
    this.todo,
    this.completed,
    this.userId,
  });

  Todos.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        todo = json['todo'] as String?,
        completed = json['completed'] as bool?,
        userId = json['userId'] as int?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'todo' : todo,
    'completed' : completed,
    'userId' : userId
  };
}