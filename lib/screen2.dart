import 'package:flutter/material.dart';
import 'package:flutter_ics_homescreen/screen1.dart';
import 'package:flutter_ics_homescreen/screen3.dart';
import 'package:flutter_ics_homescreen/screen4.dart';
import 'package:flutter_ics_homescreen/screensize.dart';
import 'package:intl/intl.dart';

import 'Data/variables/variables.dart';
import 'defectselectionscreen.dart';


class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override

  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        color:Colors.blueGrey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: screenWidth*0.15,
                    color:Colors.white,
                    child: Image.asset('asset/mylogo.png')), // Replace 'assets/logo.png' with your logo
                //const SizedBox(width:250),
                Container(
                    alignment: Alignment.center,
                    width: screenWidth*0.60 ,child: const Text("Knemetic solutions",style: TextStyle(fontSize:40,fontWeight:FontWeight.normal,color:Colors.white),)),Container(
                  color:Colors.blue,
                  width: screenWidth*0.15,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.calendar_month_rounded,color:Colors.white),
                          Text(DateFormat('EEEE dd MMM').format(DateTime.now()).toString(), style: textStyleForAllText ()),
                        ],
                      ),
                      Row(
                        children: [
                          Text( DateFormat('            HH:mm:ss').format(DateTime.now()).toString(), style: textStyleForAllText ()),
                        ],
                      ),
                    ],
                  ),

                ),
              ],
            ),
            const Spacer(flex:2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height:screenHeight*.15,
                  width: screenWidth*0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), // Adjust the value as needed
                  ),
                  child: ElevatedButton(
                    onPressed: () {

                      Navigator.pushNamed(context, "Color and light settings-Top Screen",);
                      // Action for top camera view button
                    },
                    child:  Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.camera,size:50,),
                        Text('Top camera and light settings',style: textStyleForAllText ()),
                      ],
                    ),
                  ),
                ),


                Container(
                  height:screenHeight*.15,
                  width: screenWidth*0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), // Adjust the value as needed
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Action for top camera view button
                      Navigator.pushNamed(context,  "Color and light settings-Bottom Screen",);
                    },
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.camera_alt,size:50,),
                        Text('Bottom camera and light settings',style: textStyleForAllText ()),
                      ],
                    ),
                  ),
                ),

                Container(
                  height:screenHeight*.15,
                  width: screenWidth*0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), // Adjust the value as needed
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Action for top camera view button
                      Navigator.pushNamed(context, "Defect Selection Screen");
                    },
                    child: Text('Defect selction setting',style: textStyleForAllText ()),
                  ),
                ),

              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height:screenHeight*.1,
                  width: screenWidth*0.10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // Adjust the value as needed
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Action for top camera view button
                        Navigator.pushNamed(context, "HomeScreen");
                      },
                      child:  Text('Back ',style: textStyleForAllText ()),
                    ),
                  ),
                ),


              ],
            ),
            const Spacer(),
             SizedBox(
              width: screenWidth*.8,
              height: screenHeight*0.06,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.settings,size:50,color:Colors.blue,),
                  Text(' Settings ',style: textStyleBelowScreen ()),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}