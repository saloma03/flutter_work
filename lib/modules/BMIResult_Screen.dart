import 'package:flutter/material.dart';
import 'package:test3/modules/BMICalulator.dart';

class BMIResultScreen extends StatelessWidget {
  final double result;
  final bool isMale;
  final int age;
  BMIResultScreen({
    required this.result,
    required this.isMale,
    required this.age,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
            ),
          ),

          title: Text('BMI Results'),

        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Gender : ${isMale ? 'Male': 'Female'}',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'Age : ${age}',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'Result : ${result.round()}',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}
