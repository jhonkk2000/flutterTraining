import 'package:flutter/cupertino.dart';
import 'package:notes_app/models/category.dart';
import 'package:notes_app/models/task.dart';

class Note {
  String id, title, description, image;
  int color;
  List<Task> tasks;
  Category category;

  Note(this.id, this.title, this.description, this.image, this.tasks,
      this.category, this.color);
  

  factory Note.fromJson(Map<dynamic, dynamic> json, List<Task> tasks) => Note(
      json['id'],
      json['title'],
      json['description'],
      json['image'],
      tasks,
      Category.fromJson(json['category']),
      json['color']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
        'color': color,
        'tasks': List<dynamic>.from(tasks.map((e) => e.toJson())),
        'category': category.toJson(),
      };
}

/*List<Note> demo_notes = [
  Note("Task", lorem, "assets/images/study.jpg", demo_task, demo_categories[0],
      0),
  Note("Task2", lorem, "", demo_task, demo_categories[1], 1),
  Note("Task3", lorem, "", demo_task, demo_categories[2], 2),
  Note("Task4", lorem, "", demo_task, demo_categories[1], 3),
  Note("Task5", lorem, "", demo_task, demo_categories[2], 4),
  Note("Task6", lorem, "assets/images/study.jpg", demo_task, demo_categories[1],
      5),
  Note("Task7", lorem, "", demo_task, demo_categories[0], 6),
  Note("Task8", lorem, "", demo_task, demo_categories[2], 0)
];*/

String lorem =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas viverra mi magna, ut malesuada nulla volutpat sed. Nam vitae sollicitudin lorem.";
