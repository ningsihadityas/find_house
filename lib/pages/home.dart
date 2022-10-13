// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:find_house/modals/space.dart';
import 'package:find_house/modals/tips.dart';
import 'package:find_house/theme.dart';
import 'package:find_house/widgets/bottom_navbar_item.dart';
import 'package:find_house/widgets/city_card.dart';
import 'package:find_house/widgets/space_card.dart';
import 'package:find_house/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modals/city.dart';
import '../providers/space_provider.dart';

class Home extends StatelessWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    //spaceProvider.getRecommendedSpaces();

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text('Explore Now',
                    style: blackTextStyle.copyWith(fontSize: 24))),
            SizedBox(
              height: 2,
            ),
            Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text('Mencari kosan yang cozy',
                    style: regulerTextStyle.copyWith(fontSize: 16))),
            SizedBox(
              height: 30,
            ),
            Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text('Popular Cities',
                    style: regulerTextStyle.copyWith(fontSize: 16))),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  CityCard(City(
                    id: 1,
                    name: 'Jakarta',
                    imageUrl: 'assets/images/city1.png',
                  )),
                  SizedBox(width: 20),
                  CityCard(City(
                      id: 2,
                      name: 'bandung',
                      imageUrl: 'assets/images/city2.png',
                      isPopular: true)),
                  SizedBox(width: 20),
                  CityCard(City(
                    id: 3,
                    name: 'Surabaya',
                    imageUrl: 'assets/images/city3.png',
                  )),
                ],
              ),
            ),

            SizedBox(
              height: 30,
            ),
            // NOTE: RECOMMENDED SPACE
            Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text('Recommended Space',
                    style: regulerTextStyle.copyWith(fontSize: 16))),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: FutureBuilder(
                future: spaceProvider.getRecommendedSpaces(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data;

                    //different first container
                    int index = 0;
                    return Column(
                        children: data.map((item) {
                      index++;
                      return Container(
                        margin: EdgeInsets.only(
                          top: index == 1 ? 0 : 30,
                        ),
                        child: SpaceCard(item),
                      );
                    }).toList());
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE TIPS & GUIDANCE
            Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text('Tips & Guidance',
                    style: regulerTextStyle.copyWith(fontSize: 16))),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  TipsCard(Tips(
                      id: 1,
                      name: 'City Guidelines',
                      imageUrl: 'assets/images/icon.png',
                      updateAt: 'Updated 2 Apr')),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(Tips(
                      id: 2,
                      name: 'Jakarta Fairship',
                      imageUrl: 'assets/images/icon-2.png',
                      updateAt: 'Updated 11 Dec')),
                ],
              ),
            ),
            SizedBox(
              height: 50 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
            color: Color(0xffF6F7F8), borderRadius: BorderRadius.circular(23)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/images/Icon_home_solid.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/Icon_mail_solid.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/Icon_card_solid.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/Icon_love_solid.png',
              isActive: false,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
