import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var scoreController = TextEditingController();
  String result = '';

  String getGrade(double score) {
    if (score >= 90) {
      return "A";
    } else if (score >= 80) {
      return "B";
    } else if (score >= 70) {
      return "C";
    } else if (score >= 60) {
      return "D";
    } else {
      return "F";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Center(child: Text("Grade Calculator",style: TextStyle(
                    color: Colors.white,
                  ))),
              backgroundColor: Colors.pinkAccent,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
             children: [
                   Padding(padding:const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: TextField(
                    controller: scoreController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(Icons.calculate_outlined ),
                      hintText: 'Type your score',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),),
                    ),
                  ),),


                ElevatedButton(
                  onPressed: () {
                    if (scoreController.text.isNotEmpty) {
                      var grade = double.parse(scoreController.text);
                      result = getGrade(grade);
                      setState(() {});
                    }
                  },
                  
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    minimumSize: Size(300, 60),
                  ),
                  child: const Text('Calculate', style: TextStyle(fontSize: 18,color: Colors.white)),
                ),

                //display the result
            if (result != '')
                  Padding(padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(result,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent,
                        fontSize: 100,
                      ),
                    ),
                  ),
              ],
            )));
  }
}
