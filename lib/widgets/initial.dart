import 'package:flutter/material.dart';

class IntialScreen extends StatelessWidget {
  const IntialScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return height >= width
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Image.asset(
                  "assets/images/education.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text("Uh-Oh!..No subjects added",
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headlineMedium),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text("Try adding subjects!",
                      style: Theme.of(context).textTheme.headlineMedium),
                ),
              ])
        : Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/education.png",
                      fit: BoxFit.cover,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Uh-Oh!..No subjects added",
                            style: Theme.of(context).textTheme.headlineSmall),
                        Text("Try adding subjects!",
                            style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    )
                  ],
                ),
              )
            ],
          );
  }
}
