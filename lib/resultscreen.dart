






import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ics_homescreen/Data/variables/variables.dart';
import 'package:flutter_ics_homescreen/resultscreenwidget.dart';
import 'package:flutter_ics_homescreen/screen1.dart';
import 'package:flutter_ics_homescreen/screensize.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<Map<String, String>> _dataList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> agentData = prefs.getStringList('agents') ?? [];
    setState(() {
      _dataList = agentData.map((data) => Map<String, String>.from(jsonDecode(data))).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDataAvailable = _dataList.isNotEmpty;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: Colors.blueGrey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: screenWidth * 0.15,
                    color: Colors.white,
                    child: Image.asset('asset/mylogo.png')), // Replace 'assets/logo.png' with your logo
                Container(
                  alignment: Alignment.center,
                  width: screenWidth * 0.60,
                  child: const Text(
                    "Knemetic solutions",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal, color: Colors.white),
                  ),
                ),
                Container(
                  color: Colors.blue,
                  width: screenWidth * 0.15,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.calendar_month_rounded, color: Colors.white),
                          Text(
                            DateFormat('EEEE dd MMM').format(DateTime.now()).toString(),
                            style: textStyleForAllText(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            DateFormat('            HH:mm:ss').format(DateTime.now()).toString(),
                            style: textStyleForAllText(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            if (isDataAvailable)
              Row(
                children: [
                  const SizedBox(width: 30),
                  Container(
                    alignment: Alignment.center,
                    width: screenWidth * 0.30,
                    height: screenHeight * .05,
                    color: Colors.blue,
                    child: Text(
                      _dataList[_dataList.length - 1]['name'] ?? "null",
                      style: textStyleForAllText(),
                    ),
                  ),
                  const SizedBox(width: screenWidth * 0.05),
                  Container(
                    alignment: Alignment.center,
                    width: screenWidth * 0.30,
                    height: screenHeight * .05,
                    color: Colors.blue,
                    child: Text(
                      _dataList[_dataList.length - 1]['AnalysisDate'] ?? "null",
                      style: textStyleForAllText(),
                    ),
                  ),
                ],
              )
            else
              Container(
                alignment: Alignment.center,
                width: screenWidth,
                height: screenHeight * .05,
                color: Colors.blue,
                child: Text(
                  'No data available',
                  style: textStyleForAllText(),
                ),
              ),
            const SizedBox(height: 40),
            if (isDataAvailable)
              Row(
                children: [
                  Column(
                    children: [
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "MC",
                          percentagetext: _dataList[_dataList.length - 1]['MC'] ?? "null"),
                      const SizedBox(height: 10),
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "PB",
                          percentagetext: _dataList[_dataList.length - 1]['PB'] ?? "null"),
                      const SizedBox(height: 10),
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "AAA",
                          percentagetext: _dataList[_dataList.length - 1]['AAA'] ?? "null"),
                      const SizedBox(height: 10),
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "AA",
                          percentagetext: _dataList[_dataList.length - 1]['AA'] ?? "null"),
                      const SizedBox(height: 10),
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "A",
                          percentagetext: _dataList[_dataList.length - 1]['A'] ?? "null"),
                      const SizedBox(height: 10),
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "B",
                          percentagetext: _dataList[_dataList.length - 1]['B'] ?? "null"),
                      const SizedBox(height: 10),
                    ],
                  ),
                  const SizedBox(width: screenWidth * 0.20),
                  Column(
                    children: [
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "C",
                          percentagetext: _dataList[_dataList.length - 1]['C'] ?? "null"),
                      const SizedBox(height: 10),
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "BB",
                          percentagetext: _dataList[_dataList.length - 1]['BB'] ?? "null"),
                      const SizedBox(height: 10),
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "BL",
                          percentagetext: _dataList[_dataList.length - 1]['BL'] ?? "null"),
                      const SizedBox(height: 10),
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "BERRY",
                          percentagetext: _dataList[_dataList.length - 1]['BERRY'] ?? "null"),
                      const SizedBox(height: 10),
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "BITS",
                          percentagetext: _dataList[_dataList.length - 1]['BITS'] ?? "null"),
                      const SizedBox(height: 10),
                      ResultScreenWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          innertext: "HUSK/Stone",
                          percentagetext: _dataList[_dataList.length - 1]['HUSK/Stone'] ?? "null"),
                      const SizedBox(height: 10),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Column(
                    children: [
                      Container(
                        height: screenHeight * .06,
                        width: screenWidth * 0.10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), // Adjust the value as needed
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Action for save button
                          },
                          child: Text('Save', style: textStyleForAllText()),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: screenHeight * .06,
                        width: screenWidth * 0.10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), // Adjust the value as needed
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Action for discard button
                          },
                          child: Text('Discard', style: textStyleForAllText()),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: screenHeight * .06,
                        width: screenWidth * 0.10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), // Adjust the value as needed
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Action for print button
                          },
                          child: Text('Print', style: textStyleForAllText()),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: screenHeight * .06,
                        width: screenWidth * 0.10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), // Adjust the value as needed
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Action for home button
                            Navigator.push(context,
                                MaterialPageRoute(builder: (BuildContext context) => const Screen1()));
                          },
                          child: Text('Home', style: textStyleForAllText()),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              )
            else
              Container(
                alignment: Alignment.center,
                width: screenWidth,
                height: screenHeight * .1,
                child: Text(
                  'No data available to display results.',
                  style: textStyleForAllText(),
                ),
              ),
            const Spacer(),
            Container(
              //color:Colors.wh,
              decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey)),
              width: screenWidth * .8,
              height: screenHeight * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.analytics_outlined, color: Colors.white, size: iconbelowscreen),
                  Text(
                    'Analysis Completed ',
                    style: textStyleBelowScreen(),
                  )
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




















// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_ics_homescreen/Data/variables/variables.dart';
// import 'package:flutter_ics_homescreen/resultscreenwidget.dart';
// import 'package:flutter_ics_homescreen/screen1.dart';
// import 'package:flutter_ics_homescreen/screen2.dart';
// import 'package:flutter_ics_homescreen/screensize.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// class ResultScreen extends StatefulWidget {
//   const ResultScreen({super.key});
//
//
//   @override
//   State<ResultScreen> createState() => _ResultScreenState();
// }
//
// class _ResultScreenState extends State<ResultScreen> {
//   @override
//
//   List<Map<String, String>> _dataList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//   }
//
//   void _loadData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> agentData = prefs.getStringList('agents') ?? [];
//     setState(() {
//       _dataList = agentData.map((data) => Map<String, String>.from(jsonDecode(data))).toList();
//
//     });
//   }
//
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//
//       body: Container(
//         height: screenHeight,
//         width: screenWidth,
//         color:Colors.blueGrey,
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                     width: screenWidth*0.15,
//                     color:Colors.white,
//                     child: Image.asset('asset/mylogo.png')), // Replace 'assets/logo.png' with your logo
//                 Container(
//                     alignment: Alignment.center,
//                     width: screenWidth*0.60 ,child: const Text("Knemetic solutions",style: TextStyle(fontSize:40,fontWeight:FontWeight.normal,color:Colors.white),)),
//                 Container(
//                   color:Colors.blue,
//                   width: screenWidth*0.15,
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           const Icon(Icons.calendar_month_rounded,color:Colors.white),
//                           Text(DateFormat('EEEE dd MMM').format(DateTime.now()).toString(), style: textStyleForAllText ()),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Text( DateFormat('            HH:mm:ss').format(DateTime.now()).toString(), style: textStyleForAllText ()),
//                         ],
//                       ),
//                     ],
//                   ),
//
//                 ),
//               ],
//             ),
//             const SizedBox(height: 50),
//              Row(
//
//               children: [
//                 const SizedBox(width:30,),
//                 Container(alignment:Alignment.center,
//                   width:screenWidth*0.30,height:screenHeight*.05,color:Colors.blue,child: Text(_dataList[_dataList.length-1]!['name']??"null",style:textStyleForAllText ()),
//                 )
//                 ,
//                 const SizedBox(width:screenWidth*0.05,),
//                 Container(alignment:Alignment.center,
//                   width:screenWidth*0.30,height:screenHeight*.05,color:Colors.blue,child:  Text(_dataList[_dataList.length-1]!['AnalysisDate']??"null",style:textStyleForAllText ()),
//                 ),
//               ],
//             ),
//             const SizedBox(height:40,),
//             Row(
//               children: [
//                  Column(children: [
//                   ResultScreenWidget(screenwidth: screenWidth, screenheight: screenHeight, innertext: "MC", percentagetext: _dataList[_dataList.length-1]['MC']??"null"),
//                   const SizedBox(height: 10,),
//                   ResultScreenWidget(screenwidth: screenWidth, screenheight: screenHeight, innertext: "PB", percentagetext: _dataList[_dataList.length-1]['PB']??"null"),
//                   const SizedBox(height: 10,),
//                   ResultScreenWidget(screenwidth: screenWidth, screenheight: screenHeight, innertext: "AAA", percentagetext: _dataList[_dataList.length-1]['AAA']??"null"),
//                   const SizedBox(height: 10,),
//                   ResultScreenWidget(screenwidth: screenWidth, screenheight: screenHeight, innertext: "AA", percentagetext: _dataList[_dataList.length-1]['AA']??"null"),
//                   const SizedBox(height: 10,),
//                   ResultScreenWidget(screenwidth: screenWidth, screenheight: screenHeight, innertext: "A", percentagetext: _dataList[_dataList.length-1]['A']??"null"),
//                   const SizedBox(height: 10,),
//                   ResultScreenWidget(screenwidth: screenWidth, screenheight: screenHeight, innertext: "B", percentagetext: _dataList[_dataList.length-1]['B']??"null"),
//                   const SizedBox(height: 10,),
//
//                 ],),
//
//
//                 const SizedBox(width:screenWidth*0.20,),
//                  Column(children: [
//                   ResultScreenWidget(screenwidth: screenWidth, screenheight: screenHeight, innertext: "C", percentagetext: _dataList[_dataList.length-1]['C']??"null"),
//                   const SizedBox(height: 10,),
//                   ResultScreenWidget(screenwidth: screenWidth, screenheight: screenHeight, innertext: "BB", percentagetext: _dataList[_dataList.length-1]['BB']??"null"),
//                   const SizedBox(height: 10,),
//                   ResultScreenWidget(screenwidth: screenWidth, screenheight: screenHeight, innertext: "BL", percentagetext: _dataList[_dataList.length-1]['BL']??"null"),
//                   const SizedBox(height: 10,),
//                   ResultScreenWidget(screenwidth: screenWidth, screenheight: screenHeight, innertext: "BERRY", percentagetext: _dataList[_dataList.length-1]['BERRY']??"null"),
//                   const SizedBox(height: 10,),
//                   ResultScreenWidget(screenwidth: screenWidth, screenheight: screenHeight, innertext: "BITS", percentagetext: _dataList[_dataList.length-1]['BITS']??"null"),
//                   const SizedBox(height: 10,),
//                   ResultScreenWidget(screenwidth: screenWidth, screenheight: screenHeight, innertext: "HUSK/Stone", percentagetext: _dataList[_dataList.length-1]['HUSK/Stone']??"null"),
//                   const SizedBox(height: 10,),
//
//
//
//                 ],),
//
//
//               const SizedBox(width:30,),
//
//                 Column(children: [
//                   Container(
//
//                     height:screenHeight*.06,
//                     width: screenWidth*0.10,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20), // Adjust the value as needed
//                     ),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Action for top camera view button
//                       },
//                       child: Text('Save',style:textStyleForAllText ()),
//                     ),
//                   ),
//
//
//                   const SizedBox(height: 20,),
//
//                   Container(
//                     height:screenHeight*.06,
//                     width: screenWidth*0.10,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20), // Adjust the value as needed
//                     ),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Action for top camera view button
//                       },
//                       child: Text('Discard ',style:textStyleForAllText ()),
//
//
//
//
//                     ),
//                   ),
//
//
//                   const SizedBox(height: 20,),
//
//                   Container(
//                     height:screenHeight*.06,
//                     width: screenWidth*0.10,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20), // Adjust the value as needed
//                     ),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Action for top camera view button
//                       },
//                       child: Text('Print ',style:textStyleForAllText ()),
//                     ),
//                   ),
//
//
//
//                   const SizedBox(height: 20,),
//                   Container(
//                     height:screenHeight*.06,
//                     width: screenWidth*0.10,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20), // Adjust the value as needed
//                     ),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Action for top camera view button
//                         Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>const Screen1()));
//                       },
//                       child:  Text('Home ',style:textStyleForAllText ()),
//                     ),
//                   ),
//
//
//                   const SizedBox(height: 20,),
//
//                 ],),
//               ],
//             ),
//             const Spacer(),
//             Container(
//
//               //color:Colors.wh,
//               decoration:BoxDecoration(
//                   border: Border.all(color:Colors.blueGrey)
//               ),
//               width: screenWidth*.8,
//               height: screenHeight*0.1,
//               child:   Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(Icons.analytics_outlined,color: Colors.white,size: iconbelowscreen,),
//                   Text('Analysis Completed ',style:textStyleBelowScreen (),)
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }