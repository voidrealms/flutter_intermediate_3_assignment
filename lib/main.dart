import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class Sales {
  String animal;
  int sales;
  Sales(this.animal, this.sales);
}

class _State extends State<MyApp> {

  List<Sales> _data;
  List<charts.Series<Sales,String>> _chartData;

  void _makeData() {
    _data = new List<Sales>();
    _chartData = new List<charts.Series<Sales,String>>();

    _data.add(new Sales('Cats', 100));
    _data.add(new Sales('Dogs', 300));
    _data.add(new Sales('Birds', 50));
    _data.add(new Sales('Lizards', 25));

    _chartData.add(new charts.Series(
        id: 'Sales',
        data: _data,
        colorFn: (_,__) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (Sales sales, _) => sales.animal,
        measureFn: (Sales sales, _) => sales.sales,
        displayName: 'Sales'
    ));
  }

  @override
  void initState() {
    _makeData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('Pet Sales'),
              new Expanded(child: new charts.BarChart<Sales>(_chartData))
            ],
          ),
        )
      ),
    );
  }
}
