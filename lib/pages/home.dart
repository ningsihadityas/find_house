// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:find_house/modals/space.dart';
import 'package:find_house/modals/tips.dart';
import 'package:find_house/theme.dart';
import 'package:find_house/widgets/bottom_navbar_item.dart';
import 'package:find_house/widgets/city_card.dart';
import 'package:find_house/widgets/space_card.dart';
import 'package:find_house/widgets/tips_card.dart';
import 'package:flutter/material.dart';

import '../modals/city.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: Column(
                children: [
                  spaceCard(Space(
                      id: 1,
                      name: 'Kuretakeso Hott',
                      imageUrl: 'assets/images/space1.png',
                      price: 52,
                      rating: 4,
                      city: 'Bandung',
                      country: 'Germany')),
                  SizedBox(
                    height: 30,
                  ),
                  spaceCard(Space(
                      id: 2,
                      name: 'Roemah Nenek',
                      imageUrl: 'assets/images/space2.png',
                      price: 11,
                      rating: 5,
                      city: 'Seattle',
                      country: 'Bogor')),
                  SizedBox(
                    height: 30,
                  ),
                  spaceCard(Space(
                      id: 3,
                      name: 'Darrling How',
                      imageUrl: 'assets/images/space3.png',
                      price: 20,
                      rating: 3,
                      city: 'Jakarta',
                      country: 'Indonesia')),
                  SizedBox(
                    height: 30,
                  ),
                ],
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
