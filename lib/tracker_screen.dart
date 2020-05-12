import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'bar_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'bar_chart.dart';

class Tracker extends StatefulWidget {
  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  



  @override
  void initState() {
    // TODO: implement initState
    getCovidData();
    
  }

  Map<String ,dynamic> datax;
  List cases_time_series;
  Future<List> getCovidData() async{

  var response = await http.get("https://api.covid19india.org/data.json");
  if(response.statusCode==200){
    print("OK");

    setState(() {

    datax = jsonDecode(response.body);
   // print(datax);
    cases_time_series = datax['cases_time_series'];
    datax =  datax['cases_time_series'][datax['cases_time_series'].length-1];
    getLastSevenDaysData();

    });
  }

  }

  getLastSevenDaysData(){

    int cases_time_series_start =  cases_time_series.length -7;
    int cases_time_series_end=  cases_time_series.length;

    setState(() {
      cases_time_series =  cases_time_series.sublist(cases_time_series_start,cases_time_series_end);
    });


   //print(cases_time_series);



  }



  var data = "hey";
  bool isMyCountrySelected = true;
 int statsInterval = 1;
 //1  = total cases , 2 = Today, 3 =  yesterday

  @override
  Widget build(BuildContext context) {

    return Container(
       width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color(0xff131053),
      child: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                
                Text("Statistics",style: TextStyle(color: Colors.white,fontSize: 22),),
                SizedBox(height:30),
               
               
                 Container(
               width : MediaQuery.of(context).size.width, 
               height: 60,
         
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(40)),
                   color: Colors.white10,
               ),
               
               child: Row(
                 
                 children: <Widget>[
                    Expanded(
                        child: GestureDetector(
                          onTap: (){

                            setState(() {
                             isMyCountrySelected = true;
                            });
                          },
                                                        child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
               width : MediaQuery.of(context).size.width/2.5, 
               height: 50,
         
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(40)),
                   color: isMyCountrySelected? Colors.white : Colors.transparent,
               ),
                 child: Center(child: Text("My Country",style: TextStyle( 
                   
                     color:  isMyCountrySelected? Color(0xff131053):Colors.white,fontSize: 17,
                 fontWeight: FontWeight.bold
                 ),))     
                 
                 ,),
                      ),
                        ),
                    ),

                    Expanded(
                      child: GestureDetector (
                        onTap: (){
              setState(() {
                  isMyCountrySelected = false;
              });
                       
                        },
                        child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(40)),
                   color: !isMyCountrySelected ? Colors.white : Colors.transparent,
               ),
                 child: Center(child: Text("Global",style: TextStyle(color: !isMyCountrySelected ? Color(0xff131053):Colors.white,fontSize: 17,
                 fontWeight: FontWeight.bold
                 ),))     
                 
                 ,),
                        ),
                      ),
                    ),

                 ],
               ),  
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top: 15,bottom: 15),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       GestureDetector(
                         onTap: (){
               setState(() {
                 statsInterval =1;
               });
                         },                  
                         child: Text("Total",style: TextStyle(color: statsInterval ==1 ? Colors.white :Colors.white70 ),)),
                 SizedBox(width:25),
              GestureDetector(
                         onTap: (){
               setState(() {
                 statsInterval =2;
               });
                         },                  
                         child: Text("Today",style: TextStyle(color: statsInterval ==2 ? Colors.white :Colors.white70 ),)),
              SizedBox(width:25),
               GestureDetector(
                         onTap: (){
               setState(() {
                 statsInterval =3;
               });
                         },                  
                         child: Text("Yesterday",style: TextStyle(color: statsInterval ==3 ? Colors.white :Colors.white70 ),))


                   
                   
                     ],
                   ),
                 ),

                 
                 Container(
                   height: MediaQuery.of(context).size.height/7.5,
                   
                   child: Row(
                     children: <Widget>[

                     Expanded(child: Container(
               decoration: BoxDecoration(
                 color: Colors.orangeAccent,
                 borderRadius: BorderRadius.all(Radius.circular(10))       
               ),
                     child: Padding(
                       padding: const EdgeInsets.all(12.0),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
               Text("Confirmed",style: TextStyle(color:Colors.white,fontSize: 15),),


                         datax != null? Text(datax['totalconfirmed'].toString(),
                           style: TextStyle(color:Colors.white,fontSize: 25,fontWeight: FontWeight.bold),):Center(child: CircularProgressIndicator(
                           valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),


                         ))
                       
                       


                         ],
                       ),
                     ),
                     )),

                    SizedBox(width:20),

                     Expanded(child: Container(
               decoration: BoxDecoration(
                 color: Colors.redAccent,
                 borderRadius: BorderRadius.all(Radius.circular(10))       
               ),
                     child: Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
               Text("Death",style: TextStyle(color:Colors.white,fontSize: 15),),

                       datax != null? Text(datax['totaldeceased'].toString(),
                         style: TextStyle(color:Colors.white,fontSize: 25,fontWeight: FontWeight.bold),):Center(child: CircularProgressIndicator(
                         valueColor: new AlwaysStoppedAnimation<Color>(Colors.white))),
                         ],
                       ),
                     ),
                     ))



                     ],
                   ),
                 ),

     SizedBox(height:20),

     Container(
                   height: MediaQuery.of(context).size.height/7.5,
                   
                   child: Row(
                     children: <Widget>[

                     Expanded(child: Container(
               decoration: BoxDecoration(
                 color: Colors.green.withOpacity(0.9),
                 borderRadius: BorderRadius.all(Radius.circular(10))       
               ),
                     child: Padding(
                       padding: const EdgeInsets.all(12.0),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
               Text("Recovered",style: TextStyle(color:Colors.white,fontSize: 15),),

                           datax != null? Text(datax['totalrecovered'].toString(),
                             style: TextStyle(color:Colors.white,fontSize: 25,fontWeight: FontWeight.bold),):Center(child: CircularProgressIndicator(
                               valueColor: new AlwaysStoppedAnimation<Color>(Colors.white))),
                         ],
                       ),
                     ),
                     )),

                    SizedBox(width:20),

                     Expanded(child: Container(
               decoration: BoxDecoration(
                 color: Colors.lightBlueAccent,
                 borderRadius: BorderRadius.all(Radius.circular(10))       
               ),
                     child: Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
               Text("Active",style: TextStyle(color:Colors.white,fontSize: 15),),

               Text("null",style: TextStyle(color:Colors.white,fontSize: 21,fontWeight: FontWeight.bold),)
                         ],
                       ),
                     ),
                     )),

                        SizedBox(width:20),

                     Expanded(child: Container(
               decoration: BoxDecoration(
                 color: Colors.deepPurple,
                 borderRadius: BorderRadius.all(Radius.circular(10))       
               ),
                     child: Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
               Text("Serious",style: TextStyle(color:Colors.white,fontSize: 15),),

               Text("null",style: TextStyle(color:Colors.white,fontSize: 21,fontWeight: FontWeight.bold),)
                         ],
                       ),
                     ),
                     )),
                  



                     ],
                   ),
                 ),
              
               
              


               


                
                  
                ],
              ),
            ),
          SizedBox(height: 20,),
         Container(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Padding(
                 padding: const EdgeInsets.only(left:20.0,top: 20),
                 child: Text("Daily New Cases",textAlign: TextAlign.left,style: TextStyle(fontSize: 22,color: Color(0xff131053),
                 fontWeight: FontWeight.w500 ),),
               ),

               cases_time_series !=null ?Center(child: BarChartApplication(time_series_data: cases_time_series,)):Text("Loading"),
             ],
           ),
           decoration: BoxDecoration(
             color: Colors.white,

            borderRadius: BorderRadius.only(topLeft:Radius.circular(40),topRight:Radius.circular(40) )
           ),
           height: 210,
           )
        
          ],
        ),
      ),
      
     


     
    );
  }
}