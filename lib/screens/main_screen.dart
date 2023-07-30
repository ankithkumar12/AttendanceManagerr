import 'package:attendace/models/subject.dart';
import 'package:attendace/widgets/initial.dart';
import 'package:attendace/widgets/new_subject.dart';

import 'package:attendace/widgets/subjectlist.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Subject> list = [];

  void addSubject(String subTitle) {
    setState(() {
      list.add(Subject(title: subTitle));
      Navigator.pop(context);
    });
  }

  void removeSubject(Subject subbu) {
    setState(() {
      list.remove(subbu);
      Navigator.pop(context);
    });
  }


  void showOverlay(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewSubject(
          onAddSubject: addSubject,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showOverlay(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        title: const Text("Subjects"),
        //actions: [IconButton(onPressed: onPressed, icon: icon)],
      ),
      body: list.isEmpty
          ? const IntialScreen()
          : SubjectList(
              subjectlist: list,
              onRemoved: removeSubject,
            ),
    );
  }
}








