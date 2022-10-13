import 'package:find_house/modals/space.dart';
import 'package:find_house/theme.dart';
import 'package:find_house/widgets/facilities.dart';
import 'package:find_house/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  //const DetailPage({Key? key}) : super(key: key);

  final Space space;
  DetailPage(this.space);

  @override
  Widget build(BuildContext context) {
    // final Uri url = Uri.parse('https://goo.gl/maps/n6Bhhjxhd7NftAd46');

    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        throw (url);
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          top: false,
          child: Stack(
            children: [
              Image.network(
                space.imageUrl,
                height: 400,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              ListView(children: [
                SizedBox(
                  height: 325,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  space.name,
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                                Text.rich(TextSpan(
                                    text: '\$${space.price}',
                                    style:
                                        purpleTextStyle.copyWith(fontSize: 16),
                                    children: [
                                      TextSpan(
                                          text: '/ month',
                                          style: greyTextStyle.copyWith(
                                              fontSize: 16))
                                    ])),
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5].map((index) {
                                return Container(
                                    margin: EdgeInsets.only(left: 2),
                                    child: RatingItem(
                                      index: index,
                                      rating: space.rating,
                                    ));
                              }).toList(),
                              //[
                              // RatingItem(index: 1, rating: space.rating),
                              // SizedBox(
                              //   width: 2,
                              // ),
                              // RatingItem(index: 2, rating: space.rating),
                              // SizedBox(
                              //   width: 2,
                              // ),
                              // RatingItem(index: 3, rating: space.rating),
                              // SizedBox(
                              //   width: 2,
                              // ),
                              // RatingItem(index: 4, rating: space.rating),
                              // SizedBox(
                              //   width: 2,
                              // ),
                              // RatingItem(index: 5, rating: space.rating),
                              //],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text('Main Facilities',
                            style: regulerTextStyle.copyWith(fontSize: 16)),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MainFacilities(
                                imageUrl: 'assets/images/kitchen.png',
                                name: 'kitchen',
                                number: space.numberOfKitchens),
                            MainFacilities(
                                imageUrl: 'assets/images/Group-2.png',
                                name: 'bedroom',
                                number: space.numberOfBedrooms),
                            MainFacilities(
                                imageUrl: 'assets/images/Group-3.png',
                                name: 'big cupboards',
                                number: space.numberOfCupboards)
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Photos',
                          style: regulerTextStyle.copyWith(fontSize: 16),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 88,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: space.photos.map((item) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    left: 24,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      item,
                                      width: 110,
                                      height: 88,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }).toList()
                              //[

                              //   Image.asset(
                              //     'assets/images/pic-4.png',
                              //     width: 110,
                              //     height: 88,
                              //     fit: BoxFit.cover,
                              //   ),
                              //   SizedBox(
                              //     width: 18,
                              //   ),
                              //   Image.asset(
                              //     'assets/images/pic-3.png',
                              //     width: 110,
                              //     height: 88,
                              //   ),
                              //   SizedBox(
                              //     width: 18,
                              //   ),
                              //   Image.asset(
                              //     'assets/images/pic-2.png',
                              //     width: 110,
                              //     height: 88,
                              //   )
                              // ],
                              ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Location',
                          style: regulerTextStyle.copyWith(fontSize: 16),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${space.address}\n${space.city}',
                                style: greyTextStyle.copyWith(fontSize: 14),
                              ),
                              InkWell(
                                onTap: () {
                                  launchUrl(space.mapUrl);
                                },
                                child: Image.asset(
                                  'assets/images/btn_location.png',
                                  width: 40,
                                ),
                              )
                            ]),
                        SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: Container(
                            height: 50,
                            width: 327,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                  primary: purpleColor),
                              onPressed: () {
                                launchUrl('tel:${space.phone}');
                              },
                              child: Text('Book Now'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge, vertical: 85),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/images/btn_back.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Image.asset(
                      'assets/images/btn_wishlist.png',
                      width: 40,
                      height: 40,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
