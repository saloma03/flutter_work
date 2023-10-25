import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test3/modules/BMIResult_Screen.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  bool isMale = true;
  double height = 120.0;
  int age = 18;
  int weight = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (

        title: Text('BMI',),

      ),
      body: Column
      (
        children:
        [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row
              (
                children:
                [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isMale ? Colors.blue[900]:Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male,size: 70.0,),
                            SizedBox(height: 5.0,),
                            Text('Male',style: TextStyle(fontSize: 15.0,),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isMale ? Colors.grey[300]: Colors.blue[900],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female,size: 70.0,),
                            SizedBox(height: 5.0,),
                            Text('Female',style: TextStyle(fontSize: 15.0,),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.0),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text('HEIGHT',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                      ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${height.round()}',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 40.0),
                        ),
                        Text('CM',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                        ),

                      ],
                    ),
                    Slider(
                        value: height,
                        min: 120,
                        max: 220,
                        onChanged: (value){
                          setState(() {
                            height = value;

                          });
                        }),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          Text('$age',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 40.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                mini: true,
                                child: Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                mini: true,
                                child: Icon(Icons.add),
                              ),
                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          Text('$weight',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 40.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                mini: true,
                                child: Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                mini: true,
                                child: Icon(Icons.add),
                              ),
                            ],
                          )

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50.0,
            child: MaterialButton(
              onPressed: (){
                var result = weight /pow(height/100, 2);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>BMIResultScreen(result: result, isMale: isMale, age: age)),
                );
              },
              child: Text(
                'CALCULATE',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue[900],

            ),
          )

        ],

      ),

    );
  }
}
