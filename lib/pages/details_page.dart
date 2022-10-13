import 'dart:developer';

import 'package:find_house/theme.dart';
import 'package:find_house/widgets/facilities.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  //const DetailPage({Key? key}) : super(key: key);

  final Uri url = Uri.parse('https://goo.gl/maps/n6Bhhjxhd7NftAd46');

  launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else
      (throw (url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          top: false,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/city3.png',
                height: 400,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              ListView(children: [
                SizedBox(
                  height: 300,
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
                                  'Kuretakeso Hott',
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                                Text.rich(TextSpan(
                                    text: '\$52 ',
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
                              children: [
                                Image.asset(
                                  'assets/images/icon_star.png',
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Image.asset(
                                  'assets/images/icon_star.png',
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Image.asset(
                                  'assets/images/icon_star.png',
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Image.asset(
                                  'assets/images/icon_star.png',
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Image.asset(
                                  'assets/images/icon_star.png',
                                  width: 20,
                                  height: 20,
                                  color: Colors.grey,
                                )
                              ],
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
                                number: 2),
                            MainFacilities(
                                imageUrl: 'assets/images/Group-2.png',
                                name: 'bedroom',
                                number: 3),
                            MainFacilities(
                                imageUrl: 'assets/images/Group-3.png',
                                name: 'big lemari',
                                number: 3)
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
                            children: [
                              Image.asset(
                                'assets/images/pic-4.png',
                                width: 110,
                                height: 88,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Image.asset(
                                'assets/images/pic-3.png',
                                width: 110,
                                height: 88,
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Image.asset(
                                'assets/images/pic-2.png',
                                width: 110,
                                height: 88,
                              )
                            ],
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
                                'Jln. Kappan Sukses No. 20\nPalembang',
                                style: greyTextStyle.copyWith(fontSize: 14),
                              ),
                              InkWell(
                                onTap: () {
                                  launchUrl(url);
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
                              onPressed: () {},
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
