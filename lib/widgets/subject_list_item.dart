import 'package:attendace/models/subject.dart';
import 'package:attendace/widgets/subjectlist.dart';
import 'package:flutter/material.dart';

class SubjectlistItem extends StatelessWidget {
  const SubjectlistItem(
      {super.key,
      required this.sub,
      required this.onAttended,
      required this.onNotAttended,
      required this.onPressesByMistake});

  final Function(Subject sub) onAttended;
  final Function(Subject sub) onNotAttended;
  final Function(Subject sub) onPressesByMistake;

  final Subject sub;

  @override
  Widget build(BuildContext context) {
    final textscale=MediaQuery.of(context).textScaleFactor;
    final width = MediaQuery.of(context).size.width;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        width: width,
        padding: EdgeInsets.all(8*textscale),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                    width: width - 160,
                    child: Text(
                      sub.title,
                      maxLines: 4,
                      style:  TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25*textscale),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Attended ${sub.classAttended} of ${sub.totalClasses} classes",
                    style:  TextStyle(
                        fontWeight: FontWeight.w200, fontSize: 16*textscale),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "What about today's Class?",
                    style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15*textscale),
                  ),
                  Row(children: [
                    TextButton(
                      onPressed: () {
                        onAttended(sub);
                      },
                      style: TextButton.styleFrom(),
                      child:  Text(
                        "YES",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 13*textscale),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          onNotAttended(sub);
                        },
                        child:  Text(
                          "NO",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 13*textscale),
                        )),
            
                     TextButton(
                        onPressed: latesttap=="" ? null :() {
                          
                          onPressesByMistake(sub);
                        },
                        child: Text(
                          "UNDO",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize:13*textscale ),
                        ))    
                  ])
                ],
              ),
            ),
            //const Spacer(),
            Text(
              "${sub.percentage.toStringAsFixed(2)}%",
              style: TextStyle(
                  color: sub.percentage >= 75 ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 17  *textscale),
            ),
          ],
        ),
      ),
    );
  }
}
