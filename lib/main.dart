import 'package:flutter/material.dart';
import 'package:kalkulator_bbm/bbm.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Map mobil = {'Avanza': 5, 'Xenia': 6, 'Brio': 7};
  int? bbmValue = 10000;
  String? mobilValue = 'Avanza';
  bool isShow = false;
  double bbmTerpakai = 0;
  double harga = 0;

  TextEditingController kota = TextEditingController();
  TextEditingController jarak = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Text(
            "Kalkulator BBM",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Center(
              child: Text(
                "Kalkulator BBM",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: kota,
                decoration: InputDecoration(hintText: 'Kota Tujuan'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: jarak,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: 'Jarak'),
                    ),
                  ),
                  Expanded(
                    child: DropdownButton(
                        value: bbmValue,
                        items: [
                          DropdownMenuItem(
                              child: Text("Solar : 7000"), value: 7000),
                          DropdownMenuItem(
                              child: Text("Pertalite : 10000"), value: 10000),
                          DropdownMenuItem(
                              child: Text("Pertamax : 12000"), value: 12000),
                        ],
                        onChanged: (newValue) {
                          setState(() {
                            bbmValue = newValue;
                          });
                        }),
                  ),
                ],
              ),
            ),
            DropdownButton(
              value: mobilValue,
              items: [
                DropdownMenuItem(child: Text("Avanza : 1:5"), value: 'Avanza'),
                DropdownMenuItem(child: Text("Xenia : 1:6"), value: 'Xenia'),
                DropdownMenuItem(child: Text("Brio : 1:7"), value: 'Brio'),
              ],
              onChanged: (newValue) {
                setState(() {
                  mobilValue = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Hitung BBM"),
              onPressed: () {
                setState(() {
                  bbmTerpakai = double.parse(jarak.text) / mobil[mobilValue];
                  print(bbmTerpakai);
                  harga = (bbmValue! * bbmTerpakai);
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[50],
                foregroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Divider(
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            Visibility(
              visible: !isShow,
              child: Column(
                children: [
                  Text(
                    "Perjalanan menuju: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("- ${kota.text}"),
                  Text("- Jarak ${jarak.text}km"),
                  Text("- Menggunakan ${mobilValue}"),
                  Text(
                    "Memerlukan BBM: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "- ${bbmTerpakai} ltr @ ${harga}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
