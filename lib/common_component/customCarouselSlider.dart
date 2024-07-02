import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCarouselSlider extends StatefulWidget {
  @override
  _CustomCarouselSliderState createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 163.0,
            viewportFraction: 1.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/c41e9eaa3eac27df8607535b420c360c.jpg",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 163,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff252525).withOpacity(.5),
                            blurStyle: BlurStyle.inner,
                          ),
                        ],
                      ),
                      // width: double.infinity,
                      // height: 163,
                    ),
                    Positioned(
                      child: SvgPicture.asset(
                        "assets/images/Group 1000000927.svg",
                        width: 32,
                        height: 32,
                      ),
                      left: 5,
                      bottom: 5,
                    ),
                    Align(
                      child: DotsIndicator(
                        dotsCount: 5,
                        position: currentIndex,
                        decorator: DotsDecorator(
                          activeColor: Colors.white,
                          // Change the active dot color
                          size: const Size.square(9.0),
                          activeSize: const Size(9.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      alignment: Alignment.bottomCenter,
                    ),
                  ],
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
