import 'package:flutter/material.dart';

class DemoExpanded extends StatelessWidget {
  const DemoExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expanded Demo",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Text(
            "List of Containers",
            style: TextStyle(fontSize: 35),
          ),
          Expanded(
            // flex: 3,
            child: ListView.builder(
              itemCount: 8,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(20),
                  height: 100,
                  width: double.infinity,
                  color: Colors.red,
                );
              },
            ),
          ),
          Text(
            "Bottom of the screen",
            style: TextStyle(fontSize: 35),
          ),
        ],
      ),
    );
  }
}
