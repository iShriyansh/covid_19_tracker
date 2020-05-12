
import 'package:flutter/material.dart';
class home_screen_widgets extends StatefulWidget {
  @override
  _home_screen_widgetsState createState() => _home_screen_widgetsState();
}

class _home_screen_widgetsState extends State<home_screen_widgets> {

 String _value = "2";


  @override
  Widget build(BuildContext context) {
    return Container(
          child: SingleChildScrollView(
                        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Container(
                   decoration: BoxDecoration(
                       color: Color(0xff131053),
                     borderRadius: BorderRadius.only(
                      bottomRight:Radius.circular(35),
                      bottomLeft: Radius.circular(35)
       //                 <--- border radius here
  ),
                   ),
                 
                  padding: EdgeInsets.only(bottom: 20),
                   width: double.infinity,
                   child: SafeArea(
                                        child: Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         Text("Covid-19",style: TextStyle(fontSize: 35,color:Colors.white,fontWeight: FontWeight.bold),),
                     
                         Card(
                         shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                         ),
                         child: DropdownButton(
                        underline: Container(),
                        iconSize: 40,
                        iconEnabledColor: Color(0xff3b4839),
                               
                        items: [

                  
        DropdownMenuItem(
            value: "2",
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                 Image.asset("assets/india.png",height: 35,),
                 SizedBox(width:10),
                  Text(
                    
                    "India",
                    style: TextStyle(fontWeight: FontWeight.bold,color:Color(0xff131053,),fontSize:25),
                  ),
                ],
              ),
            ),
        ),
      ],
    
                       onChanged: (value) {
        setState(() {
            _value = value;
        });
      },
      value: _value,
                       
                       ),
                         )
                    
                       ],
                     ),
                      
                      
              SizedBox(height: 30,),

              Text("Are you feeling Sick?",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold
              ,color: Colors.white
              ),),
             SizedBox(height: 15,),
              Text("if you feel sick with any of covid-19 symptioms please call or SMS us immediately for help ",style: TextStyle(fontSize: 17,
              color: Colors.white70
              ),),

                 SizedBox(height: 15,),
                 Row(children: <Widget>[
               
               MaterialButton(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(Radius.circular(30))
                 ),
                 color: Colors.pinkAccent,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
                  child: Row(children: <Widget>[
                     Icon(Icons.phone,color: Colors.white,size: 27,),
                     SizedBox(width: 10,),
                  Text("Call Now",style: TextStyle(color:Colors.white,fontSize: 20),)
                   ],),
                ),
                 onPressed: (){

                 }
               ),
SizedBox(width: 20,),
         MaterialButton(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(Radius.circular(30))
                 ),
                 color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
                  child: Row(children: <Widget>[
                     Icon(Icons.message,color: Colors.white,size: 27,),
                     SizedBox(width: 10,),
                  Text("Send SMS",style: TextStyle(color:Colors.white,fontSize: 20),)
                   ],),
                ),
                 onPressed: (){

                 }
               )
                 ],)   
                       ],
                     ),
                                        ),
                   ),
                 ),


                 //upper blue container ends here ,

               

                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                
                     children: <Widget>[

                       Container(
                         
                         child: Text("Prevention",style: TextStyle(color: Color(0xff131053),fontSize: 20,fontWeight: FontWeight.w500),))
                    ,Container(
    margin: EdgeInsets.symmetric(vertical: 20.0),
    height: 200.0,
    child: new ListView(
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      Container(
     width: 130,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
      
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(radius: 50,backgroundColor: Color(0xfffce4ec
              ),
              child:  Image.asset("assets/keep-distance.png",
              )
              
              ),
            ),
        
       Text("Avoid close contact",style: TextStyle(fontSize: 17,color: Color(0xff131053
       
       ),fontWeight: FontWeight.w600),textAlign: TextAlign.center,)

        ],

        ),


      ),
      
        Container(
     width: 120,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
      
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(radius: 50,backgroundColor: Color(0xfffce4ec
              ),
              child:  Image.asset("assets/hand_wash.png",
              )
              
              ),
            ),
        
       Text("clean your hands often",style: TextStyle(fontSize: 17,color: Color(0xff131053
       
       ),fontWeight: FontWeight.w600),textAlign: TextAlign.center,)

        ],

        ),


      ),

      Container(
     width: 120,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
      
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(radius: 50,backgroundColor: Color(0xfffce4ec
              ),
              child:  Image.asset("assets/mask.png",
              )
              
              ),
            ),
        
       Text("wear a facemask",style: TextStyle(fontSize: 17,color: Color(0xff131053
       
       ),fontWeight: FontWeight.w600),textAlign: TextAlign.center,)

        ],

        ),


      ),



    ],
  )
  ),
                       Container(

                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(20),
                           ),
                           gradient: LinearGradient(
                             colors: [Color(0x564527a0),Color(0xff4527a0)]
                             
                             ),
                        
                          ),
                         height:110,width:MediaQuery.of(context).size.width,
                         
                       
                       child: Row(
                         
                         children: <Widget>[ 

                           Container(
                             margin: EdgeInsets.only(left: 20),
                             child: Image.asset("assets/dotest.png")),
                       
                       Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                                 Text("Do your own test!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold
              ,color: Colors.white
              ),),
             SizedBox(height: 8,),
              Text("Follow the instructions to do your own test",style: TextStyle(fontSize: 17,
              color: Colors.white70
              ),),
                           ],
                         ),
                                                  ),
                       )
          



                         ],
                       ),
                       
                        )
                     ],
                   ),
                 )
               


              
              
               ],
              
            ),
          ),
      
    );
  }
}

   
  

