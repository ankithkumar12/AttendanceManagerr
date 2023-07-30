import 'package:flutter/material.dart';

class NewSubject extends StatefulWidget {
  const NewSubject({super.key, required this.onAddSubject});

  @override
  State<NewSubject> createState() => _NewSubjectState();

  final Function(String text) onAddSubject;
}

class _NewSubjectState extends State<NewSubject> {
  final TextEditingController titlecontroller = TextEditingController();

  @override
  void dispose() {
    titlecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
         TextField(
              decoration: const InputDecoration(
                labelText: "Subject",
                hintText: "Enter Subject Name here",
              ),
              controller: titlecontroller,
            ),
          
          const SizedBox(height: 15),
          ElevatedButton(
              onPressed: () {
                if (titlecontroller.text.trim() == "") {
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          title: const Text(
                              "Uh-Oh..No subject entered,Try adding a subject name!"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(ctx);
                                },
                                child: const Text("Okay"))
                          ],
                        );
                      });
                  return;
                }
                widget.onAddSubject(titlecontroller.text);
              },
              child: const Text("Add Subject!"))
        ],
      ),
    );
  }
}
