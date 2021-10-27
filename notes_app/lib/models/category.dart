class Category{
  final String description;

  Category({required this.description});

  factory Category.fromJson(Map<dynamic,dynamic> json) => Category(
    description: json['description']
  );

  Map<String,dynamic> toJson() =>{
    'description':description
  };
}

/*List<Category> demo_categories=[
  Category(description: "Travel"),
  Category(description: "Work"),
  Category(description: "Hobbies"),
];*/