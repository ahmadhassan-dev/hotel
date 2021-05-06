import 'package:flutter/material.dart';
import 'package:hotel/src/widgets/appbar.dart';
import 'package:hotel/src/widgets/text.dart';
import 'package:flutter_switch/flutter_switch.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<Map<String, dynamic>> values = [
    {
      'name': 'Free Breakfast',
      'value': false,
    },
    {
      'name': 'Free Parking',
      'value': false,
    },
    {
      'name': 'Pool',
      'value': true,
    },
    {
      'name': 'Pet Friendly',
      'value': false,
    },
    {
      'name': 'Free Wifi',
      'value': false,
    },
  ];

  List<Map<String, dynamic>> values1 = [
    {
      'name': 'Apartment',
      'value': false,
    },
    {
      'name': 'Home',
      'value': true,
    },
    {
      'name': 'Villa',
      'value': false,
    },
    {
      'name': 'Hostel',
      'value': false,
    },
    {
      'name': 'Resort',
      'value': false,
    },
  ];

  double _value = 0.0;
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isHome: false,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: "Popular Filters",
              isDull: true,
              isBold: true,
              fontSize: 16,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.17,
              child: GridView.builder(
                itemBuilder: (context, index) {
                  return new CheckboxListTile(
                    title: MyText(
                      title: values[index]['name'],
                      fontSize: 14,
                    ),
                    value: values[index]['value'],
                    onChanged: (bool value) {
                      setState(() {
                        values[index]['value'] = value;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.lightBlue[300],
                  );
                },
                itemCount: 5,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 9),
                ),
              ),
            ),
            Divider(),
            MyText(
              title: "Distance from city center",
              isDull: true,
              isBold: true,
              fontSize: 16,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.15, top: 20),
              child: MyText(
                title: "Less than ${_value.toInt()} km",
                isBold: true,
                fontSize: 14,
              ),
            ),
            Slider(
              activeColor: Colors.lightBlue[300],
              min: 0,
              max: 100,
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
            ),
            Divider(),
            MyText(
              title: "Type of Accommodation",
              isDull: true,
              isBold: true,
              fontSize: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new MyText(
                      title: "All",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlutterSwitch(
                      inactiveColor: Colors.grey[300],
                      width: 60.0,
                      height: 30.0,
                      toggleSize: 40.0,
                      activeColor: Colors.lightBlue[300],
                      value: status,
                      borderRadius: 30.0,
                      padding: 1.0,
                      showOnOff: false,
                      onToggle: (val) {
                        values1.forEach((element) {
                          setState(() {
                            element['value'] = val;
                          });
                        });
                        setState(() {
                          status = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              height: 300,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new MyText(
                            title: values1[index]['name'],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlutterSwitch(
                            inactiveColor: Colors.grey[300],
                            activeColor: Colors.lightBlue[300],
                            width: 60.0,
                            height: 30.0,
                            toggleSize: 40.0,
                            value: values1[index]['value'],
                            borderRadius: 30.0,
                            padding: 1.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                values1[index]['value'] = val;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: values1.length,
              ),
            ),
            Divider(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: Center(
                child: new Text(
                  "Apply",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.lightBlue[300],
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    120,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
