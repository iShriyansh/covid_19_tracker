import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;
import 'package:http/http.dart'as http;


class newScreen extends StatefulWidget {
  @override
  _newScreenState createState() => _newScreenState();
}

class _newScreenState extends State<newScreen> {

  
  @override
  void initState() {
    // TODO: implement initState
    
    getNewsData();
    
    super.initState();
  }

 Future getNewsData() async{


    
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
