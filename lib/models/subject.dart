class Subject {
  Subject(
      {required this.title,
      this.classAttended = 0,
      this.totalClasses = 0,
      this.percentage = 0});

  final String title;
  int classAttended;
  int totalClasses;
  double percentage;
}

