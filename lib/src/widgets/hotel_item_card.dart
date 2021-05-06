import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel/src/widgets/icon.dart';
import 'package:hotel/src/widgets/text.dart';

class HotelItemCard extends StatefulWidget {
  final Map<String, String> hotel;
  HotelItemCard({this.hotel});

  @override
  _HotelItemCardState createState() => _HotelItemCardState();
}

class _HotelItemCardState extends State<HotelItemCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                25,
              ),
            ),
          ),
          color: Colors.grey,
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  25,
                ),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 1,
            child: Column(
              children: [
                _widgetPart(context),
                descriptionPart(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _widgetPart(BuildContext context) {
    return Stack(
      children: [
        new Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                25,
              ),
              topRight: Radius.circular(
                25,
              ),
            ),
            image: DecorationImage(
                image: AssetImage(
                  "${widget.hotel['image']}",
                ),
                fit: BoxFit.fill),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: MyIcon(
                icon: (isFavorite == false)
                    ? Icons.favorite_border_outlined
                    : Icons.favorite,
                color: Colors.green,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget descriptionPart(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            25,
          ),
          bottomRight: Radius.circular(
            25,
          ),
        ),
        color: Colors.white,
      ),
      child: new Column(
        children: [
          namePrice(),
          address(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 4.0),
            child: Row(
              children: [
                ratingBar(),
                SizedBox(
                  width: 5,
                ),
                review(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget namePrice() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          new MyText(
            title: "${widget.hotel['name']}",
            fontSize: 20,
            isBold: true,
          ),
          new MyText(
            title: "\$${widget.hotel['price']}",
            fontSize: 18,
            isBold: true,
          ),
        ],
      ),
    );
  }

  Widget address() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          MyText(
            title: "${widget.hotel['adress']}",
            fontSize: 10,
            isDull: true,
          ),
          SizedBox(
            width: 5,
          ),
          MyIcon(
            icon: Icons.location_pin,
            size: 10,
            color: Colors.lightBlue[300],
          ),
          SizedBox(
            width: 5,
          ),
          MyText(
            title: "${widget.hotel['distance']}",
            fontSize: 10,
            isDull: true,
          ),
        ],
      ),
    );
  }

  Widget ratingBar() {
    return Container(
      height: 10,
      child: RatingBar.builder(
        itemSize: 10,
        initialRating: 3,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
        itemBuilder: (context, _) => Container(
          child: MyIcon(
            icon: Icons.star,
            color: Colors.lightBlue[300],
          ),
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
    );
  }

  Widget review() {
    return MyText(
      title: "${widget.hotel['review']}",
      fontSize: 10,
      isDull: true,
    );
  }
}
