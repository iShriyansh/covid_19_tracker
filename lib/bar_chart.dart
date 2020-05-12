import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:supercharged/supercharged.dart';

class BarChartApplication extends StatefulWidget {
   final time_series_data;

  BarChartApplication({this.time_series_data,});

  @override
  _BarChartApplicationState createState() => _BarChartApplicationState();
}

class _BarChartApplicationState extends State<BarChartApplication> {


List sevenDaysData ;

@override
  void initState() {
    // TODO: implement initState
  StructuredData sevenDaysDatas =   StructuredData(data: widget.time_series_data);
  sevenDaysData = sevenDaysDatas.sData;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Bar(sevenDaysData[0]['dailyConfirmed'], sevenDaysData[0]['date']),
          Bar(sevenDaysData[1]['dailyConfirmed'], sevenDaysData[1]['date']),
          Bar(sevenDaysData[2]['dailyConfirmed'], sevenDaysData[2]['date']),
          Bar(sevenDaysData[3]['dailyConfirmed'], sevenDaysData[3]['date']),
          Bar(sevenDaysData[4]['dailyConfirmed'], sevenDaysData[4]['date']),
          Bar(sevenDaysData[5]['dailyConfirmed'], sevenDaysData[5]['date']),
          Bar(sevenDaysData[6]['dailyConfirmed'], sevenDaysData[6]['date']),


        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final double height;
  final String label;

  final int _baseDurationMs = 1000;
  final double _maxElementHeight = 100;

  Bar(this.height, this.label);

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
      duration: Duration(milliseconds: (height * _baseDurationMs).round()),
      tween: 0.0.tweenTo(height),
      builder: (context, child, animatedHeight) {
        return Column(
          children: <Widget>[
            Container(
              height: (1 - animatedHeight) * _maxElementHeight,
            ),
            Container(
              width: 10,
              height: animatedHeight * _maxElementHeight,
              color: Colors.red,
            ),
            Text(label)
          ],
        );
      },
    );
  }
}
class StructuredData{
  final data;
  List sData = [];
  StructuredData({this.data}){

    for(int i = 0 ; i < data.length;i++){
      double dc = int.parse(data[i]['dailyconfirmed'])/10000;
      String date = data[i]['date'];

      var s = {
      'dailyConfirmed' : dc,
      'date' :date
      };
      sData.add(s);

    }

    }








}