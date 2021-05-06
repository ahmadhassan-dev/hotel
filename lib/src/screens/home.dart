import 'package:flutter/material.dart';

import 'package:hotel/src/screens/filter_page.dart';
import 'package:hotel/src/widgets/appbar.dart';
import 'package:hotel/src/widgets/calendar.dart';
import 'package:hotel/src/widgets/hotel_item_card.dart';
import 'package:hotel/src/widgets/icon.dart';
import 'package:hotel/src/widgets/text.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart' show DateFormat;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, String>> hotelList = [
    {
      "image": "assets/hotel/hotel_1.png",
      "name": "Grand Royal Hotel",
      "price": "170",
      "adress": "Wembley, London",
      "distance": "3.0 km to city/per night",
      "review": "90 Reviews"
    },
    {
      "image": "assets/hotel/hotel_2.png",
      "name": "Queen Hotel",
      "price": "100",
      "adress": "Queensland, Australia",
      "distance": "30.0 km to city/per night",
      "review": "190 Reviews"
    },
    {
      "image": "assets/hotel/hotel_3.png",
      "name": "PC Hotel",
      "price": "70",
      "adress": "Lahore, Pakistan",
      "distance": "2.0 km to city/per night",
      "review": "60 Reviews"
    },
    {
      "image": "assets/hotel/hotel_4.png",
      "name": "Grand Avenu Hotel",
      "price": "110",
      "adress": "Islamabad, Pakistan",
      "distance": "3.0 km to city/per night",
      "review": "200 Reviews"
    },
    {
      "image": "assets/hotel/hotel_5.png",
      "name": "Sarena Hotel",
      "price": "270",
      "adress": "Islamabad, Pakistan",
      "distance": "3.0 km to city/per night",
      "review": "500 Reviews"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        isHome: true,
      ),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  backgroundColor: Colors.grey[200],
                  expandedHeight: MediaQuery.of(context).size.height * 0.25,
                  floating: true,
                  pinned: true,
                  // title: ,
                  flexibleSpace: _bodySliverAppBar(context))
            ];
          },
          body: _body(context)),
      // body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 1,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return HotelItemCard(
                hotel: hotelList[index],
              );
            },
            itemCount: hotelList.length,
          ),
        ),
      ],
    );
  }

  Widget _bodySliverAppBar(BuildContext context) {
    return FlexibleSpaceBar(
      titlePadding: EdgeInsets.only(bottom: 20),
      background: new Column(
        children: [
          textField(context),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: chooseDate(context),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey,
                    height: 40,
                    width: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: chooseRooms(),
                ),
              ],
            ),
          )
        ],
      ),
      title: filterContainer(context),
    );
  }

  Widget textField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        right: 20,
        left: 20,
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(
                25,
              ),
            )),
            elevation: 10,
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.7,
              child: new TextFormField(
                decoration: InputDecoration(
                  hintText: "London...",
                  contentPadding: EdgeInsets.only(top: 5, left: 10),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(
                25,
              ),
            )),
            elevation: 10,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      25,
                    ),
                  ),
                  color: Colors.lightBlue[300],
                ),
                height: 40,
                width: 40,
                child: MyIcon(
                  icon: Icons.search,
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }

  Widget chooseDate(BuildContext context) {
    return new Column(
      children: [
        new MyText(
          title: "Choose date",
          isDull: true,
          fontSize: 16,
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomDialogBox();
                });
          },
          child: new MyText(
            title: "04, May - 21, May",
            isBold: true,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget chooseRooms() {
    return new Column(
      children: [
        new MyText(
          title: "Number of Rooms",
          isDull: true,
          fontSize: 16,
        ),
        SizedBox(
          height: 10,
        ),
        new MyText(
          title: "1 Room - 2 Adults",
          isBold: true,
          fontSize: 16,
        ),
      ],
    );
  }

  Widget filterContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            new MyText(
              title: "530 hotels found",
              isBold: true,
              fontSize: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FilterPage()));
              },
              child: new Row(
                children: [
                  new MyText(
                    title: "Filter",
                    isBold: true,
                    fontSize: 10,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MyIcon(
                    icon: Icons.filter_list,
                    color: Colors.lightBlue[300],
                    size: 18,
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
