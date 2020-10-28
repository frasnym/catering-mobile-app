import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

class HomeBanner extends StatefulWidget {
  HomeBanner({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;
  final List<String> bannerList = [
    "https://i.ibb.co/BCDXHSs/home-banner-3.jpg",
    "https://i.ibb.co/zXRJ0mQ/home-banner-1.jpg",
    "https://i.ibb.co/KVL61Ln/home-banner-2.jpg",
  ];

  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.transparent],
        ).createShader(Rect.fromLTRB(0, 150, rect.width, rect.height));
      },
      blendMode: BlendMode.dstIn,
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 300,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            items: widget.bannerList
                .map(
                  (item) => Container(
                    child: Center(
                      child: Image.network(
                        item,
                        fit: BoxFit.cover,
                        width: widget.screenSize.width,
                        height: 300,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 240.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.bannerList.map((url) {
                int index = widget.bannerList.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
