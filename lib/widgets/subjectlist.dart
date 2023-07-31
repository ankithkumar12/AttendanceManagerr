import 'package:attendace/models/subject.dart';
import 'package:attendace/widgets/subject_list_item.dart';
import 'package:flutter/material.dart';

class SubjectList extends StatefulWidget {
  const SubjectList(
      {super.key, required this.subjectlist, required this.onRemoved});

  final List<Subject> subjectlist;
  final Function(Subject sub) onRemoved;

  @override
  State<SubjectList> createState() => _SubjectListState();
}

//var latesttap = "";

class _SubjectListState extends State<SubjectList> {
  void _classAttended(Subject sub) {
    setState(() {
      sub.latesttap = "YES";
      sub.classAttended++;
      sub.totalClasses++;
      sub.percentage = (sub.classAttended / sub.totalClasses) * 100;
    });
  }

  void _classNotAttended(Subject sub) {
    setState(() {
      sub.latesttap = "NO";
      sub.totalClasses++;
      sub.percentage = (sub.classAttended / sub.totalClasses) * 100;
    });
  }

  void byMistake(Subject sub) {
    if (sub.latesttap == "YES") {
      setState(() {
        sub.classAttended--;
        sub.totalClasses--;

        sub.percentage = (sub.classAttended / sub.totalClasses) * 100;
        if (sub.totalClasses == 0 && sub.classAttended == 0) sub.percentage = 0;

        sub.latesttap = "";
      });
    }
    if (sub.latesttap == "NO") {
      setState(() {
        if (sub.totalClasses > 0) {
          sub.totalClasses--;
          sub.percentage = (sub.classAttended / sub.totalClasses) * 100;
          if (sub.totalClasses == 0 && sub.classAttended == 0)
          {
                 sub.percentage = 0;
          }
            
          sub.latesttap = "";
        }
      });
    }
  }

  void showSheet(Subject sub) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return InkWell(
            onTap: () {
              widget.onRemoved(sub);
            },
            child: const Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.delete_forever),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Remove Subject ",
                      style:
                          TextStyle(fontWeight: FontWeight.w200, fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.subjectlist.length,
      itemBuilder: (ctx, index) => InkWell(
        onLongPress: () {
          showSheet(widget.subjectlist[index]);
        },
        child: SubjectlistItem(
          sub: widget.subjectlist[index],
          onAttended: _classAttended,
          onNotAttended: _classNotAttended,
          onPressesByMistake: byMistake,
        ),
      ),
    );
  }
}
