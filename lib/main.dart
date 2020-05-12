import 'package:coronovirus_info/tracker_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:coronovirus_info/home_screen_widgets.dart';
import 'newsScreen.dart';

void main() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
   systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor:Color(0xff131053), // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
       
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
   home: Homepage(),
    );
  }
}


class Homepage extends StatefulWidget {






  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
int selectedIndex= 0;
final widgetOptions = [
  home_screen_widgets(),
  Tracker(),
    newScreen(),
      Text("Ds"),


];



  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
 

 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(
        onTap: (index){
          setState(() {
             selectedIndex = index;
          });
         
        },
       elevation: 0,
        selectedItemColor: Colors.white,
        
        type : BottomNavigationBarType.fixed,
        showSelectedLabels: false,
showUnselectedLabels: false,
        
        currentIndex: selectedIndex,
        items: [
     BottomNavigationBarItem(
       icon:Container(
       decoration: BoxDecoration(
   color: selectedIndex ==0 ?Colors.blue : Colors.transparent,
    borderRadius: BorderRadius.all(
  Radius.circular(20)
)
       ),
       child: Padding(
         padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
         child: Icon(Icons.home),
       )),
       title: Text("")   
     ),

      BottomNavigationBarItem(
       icon:Container(
       decoration: BoxDecoration(
   color: selectedIndex ==1?Colors.blue : Colors.transparent,
    borderRadius: BorderRadius.all(
  Radius.circular(20)
)
       ),
       child: Padding(
         padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
         child: Icon(Icons.insert_chart),
       )),
       title: Text("")   
     ),
     
       BottomNavigationBarItem(
       icon:Container(
       decoration: BoxDecoration(
   color: selectedIndex ==2?Colors.blue : Colors.transparent,
    borderRadius: BorderRadius.all(
  Radius.circular(20)
)
       ),
       child: Padding(
         padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
         child: Icon(Icons.event_note),
       )),
       title: Text("")   
     ),
      BottomNavigationBarItem(
       icon:Container(
       decoration: BoxDecoration(
   color: selectedIndex ==3?Colors.blue : Colors.transparent,
    borderRadius: BorderRadius.all(
  Radius.circular(20)
)
       ),
       child: Padding(
         padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
         child: Icon(Icons.info),
       )),
       title: Text("")   
     ),
    
   
     

      ]),
      drawer: Drawer(),
      appBar: AppBar(
        actions: <Widget>[
         Padding(
           padding: const EdgeInsets.only(right:8.0),
           child: Icon(Icons.notifications_none,size: 30,),
         )
        ],
        elevation: 0,
        backgroundColor:Color(0xff131053),
       
      ),
    
          body: widgetOptions[selectedIndex],
    );
  }

}