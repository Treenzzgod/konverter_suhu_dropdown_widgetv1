import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konverter_suhu_dropdown_widgetv1/Widgets/InputSuhu.dart';
import 'package:konverter_suhu_dropdown_widgetv1/Widgets/KonversiSuhu.dart';
import 'package:konverter_suhu_dropdown_widgetv1/Widgets/ResultFix.dart';
import 'package:konverter_suhu_dropdown_widgetv1/Widgets/RiwayatPerhintungan.dart';
import 'package:konverter_suhu_dropdown_widgetv1/Widgets/TargetPerhitungan.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;
  TextEditingController etInput = TextEditingController();
  double _inputUser = 0;
  double _result = 0.0;
  String selectedDropdown = 'Kelvin';
  List<String> listSatuanSuhu = ['Kelvin', 'Reamur', 'Fahrenheit'];
  List<String> listHasil = [];

  void _konverterSuhu() {
    return setState(() {
      if (etInput.text.isNotEmpty) {
        switch (selectedDropdown) {
          case 'Kelvin':
            _result = int.parse(etInput.text) + 273.15;

            break;
          case 'Reamur':
            _result = int.parse(etInput.text) * 4 / 5;

            break;
          case 'Fahrenheit':
            _result = (int.parse(etInput.text) * 9 / 5) + 32;

            break;
        }
        listHasil.add(selectedDropdown + ' : ' + _result.toString());
      }
    });
  }

  onDropdownChanged(Object? value) {
    setState(() {
      selectedDropdown = value.toString();
      if (etInput.text.isNotEmpty) {
        switch (selectedDropdown) {
          case 'Kelvin':
            _result = int.parse(etInput.text) + 273.15;

            break;
          case 'Reamur':
            _result = int.parse(etInput.text) * 4 / 5;

            break;
          case 'Fahrenheit':
            _result = (int.parse(etInput.text) * 9 / 5) + 32;

            break;
        }
        listHasil.add('Konversi dari ' +
            etInput.text +
            ' Celcius ke ' +
            selectedDropdown +
            ' Dengan Hasil ' +
            _result.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('konverter suhu'),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              InputSuhu(etInput: etInput),
              SizedBox(height: 10),
              TargetPerhitungan(
                selectedDropdown: selectedDropdown,
                listSatuanSuhu: listSatuanSuhu,
                onDropdownChanged: onDropdownChanged,
              ),
              SizedBox(height: 10),
              Text(
                'Hasil',
                style: TextStyle(fontSize: 20),
              ),
              ResultFix(result: _result),
              KonversiSuhu(
                onPressed: _konverterSuhu,
              ),
              SizedBox(height: 10),
              Text(
                'Riwayat Konversi',
                style: TextStyle(fontSize: 20),
              ),
              RiwayatPerhitungan(listHasil: listHasil),
            ],
          ),
        ),
      ),
    );
  }
}
