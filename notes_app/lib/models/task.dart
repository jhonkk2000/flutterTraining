class Task {
  bool state;
  String description;

  Task({required this.state, required this.description});

  factory Task.fromJson(Map<dynamic,dynamic> json) =>
      Task(state: json['state'], description: json['description']);

  Map<String, dynamic> toJson() => {
        'state': state,
        'description': description,
      };
}

/*List<Task> demo_task = [
  Task(state: false, description: "Learn new things"),
  Task(state: false, description: "Design things"),
  Task(state: true, description: "Share my work"),
  Task(state: true, description: "Teach my works"),
];*/
