import 'package:flutter/material.dart';

class ExpandPractice extends StatelessWidget {
  const ExpandPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded Task'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(color: Colors.red),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Expanded(child: Container(color: Colors.yellow)),
                      Expanded(child: Container(color: Colors.orange)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(color: Colors.blue),
                ),
                Expanded(
                  flex: 2,
                  child: Container(color: Colors.purple),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(child: Container(color: Colors.green)),
                      Expanded(child: Container(color: Colors.orange)),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(color: Colors.red),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(color: Colors.yellow),
                ),
                Expanded(
                  child: Container(color: Colors.redAccent),
                ),
                Expanded(
                  child: Container(color: Colors.teal),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(color: Colors.blue),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(color: Colors.purple)),
                            Expanded(
                                flex: 1,
                                child: Container(color: Colors.green)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(color: Colors.yellow),
                ),
                Expanded(
                  child: Container(color: Colors.red),
                ),
                Expanded(
                  child: Container(color: Colors.redAccent),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
