//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Home.dart';
import 'widgets/app_bar.dart';
import 'Login.dart';
import 'contact/AddEmergency.dart';
import 'contact/CallEmergency.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MyAppBar(
          iconType: Icons.logout_outlined,
          onPressed: () {
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
      );},
        ),
        body:
        Stack(
          fit: StackFit.expand,
          children: [
          Image.asset(
          'assets/main.jpg', // Replace with your image file path
          fit: BoxFit.cover,
        ),

        Column(
          children: [
            SizedBox(
              height: 200.0, // Adjust the height of the CarouselSlider
              child: CarouselSlider(
                items: [
                  buildImageWithLink(
                    imageUrl: 'assets/scr1.jpg',
                    link: 'https://bharatifire.com/Firefite_manage_fire.php',
                  ),
                  buildImageWithLink(
                    imageUrl: 'assets/scr2.jpg',
                    link: 'https://www.accuweather.com/en/lk/sri-lanka-weather',
                  ),
                  buildImageWithLink(
                    imageUrl: 'assets/scr3.jpg',
                    link: 'https://www.dailymirror.lk/',
                  ),
                  buildImageWithLink(
                    imageUrl: 'assets/scr4.jpg',
                    link: 'http://www.dmc.gov.lk/index.php?lang=en',
                  ),
                ],
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
            ),
            SizedBox(height: 40.0), // Increase the spacing between the CarouselSlider and the containers
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RoundedContainerTypeOne(height: 128.1),
                    SizedBox(height: 30.0),
                    RoundedContainerTypeTwo(height: 90.05),
                    SizedBox(height: 30.0),
                    RoundedContainerTypeThree(height: 90.05),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircularIconButton(
                          icon: Icons.call,
                          size: 60,
                          iconSize: 35,
                          onPressed: () {
                            navigateToPage(context, Homepage());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        ],
        ),
      ),
    );
  }
  Widget buildImageWithLink({required String imageUrl, required String link}) {
    return GestureDetector(
      onTap: () {
        launchWebPage(link);
      },
      child: Container(
        width: double.infinity,
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  void launchWebPage(String url) async {
    print("Launching URL: $url");
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
      // Add fallback mechanism here, such as showing an error message.
    }
  }

}



class RoundedContainerTypeOne extends StatelessWidget {
  final double height;

  const RoundedContainerTypeOne({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      height: height, // Adjust the height as needed
      decoration: BoxDecoration(
        color: Colors.blue, // Set the background color
        borderRadius: BorderRadius.circular(
            10.0), // Set the border radius for the outer container
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Set the shadow color
            spreadRadius: 1, // Set the spread radius of the shadow
            blurRadius: 5, // Set the blur radius of the shadow
            offset: const Offset(
                0, 4), // Negative offset to shift the shadow upward
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2, // 75% width
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFF6B6B), // Set the color for the left column
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                      10.0), // Set rounded corners for the top-left
                  bottomLeft: Radius.circular(
                      10.0), // Set rounded corners for the bottom-left
                ),
              ),
              child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Colombo",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w400),
                          ),
                          Icon(Icons.thunderstorm_outlined)
                        ],
                      ),
                      Text(
                        "23 October 2023",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Monday",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                      )
                    ],
                  )),
            ),
          ),
          Expanded(
            flex: 1, // 25% width
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFC0C0), // Set the color for the right column
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                      10.0), // Set rounded corners for the top-right
                  bottomRight: Radius.circular(
                      10.0), // Set rounded corners for the bottom-right
                ),
              ),
              child: const Center(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.error_outline),
                        Text(
                          "Alert Level",
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "High",
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedContainerTypeTwo extends StatelessWidget {
  final double height;

  const RoundedContainerTypeTwo({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      height: height, // Adjust the height as needed
      decoration: BoxDecoration(
        color: Colors.blue, // Set the background color
        borderRadius: BorderRadius.circular(
            10.0), // Set the border radius for the outer container
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Set the shadow color
            spreadRadius: 1, // Set the spread radius of the shadow
            blurRadius: 5, // Set the blur radius of the shadow
            offset: const Offset(
                0, 4), // Negative offset to shift the shadow upward
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3, // 75% width
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFF6B6B), // Set the color for the left column
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                      10.0), // Set rounded corners for the top-left
                  bottomLeft: Radius.circular(
                      10.0), // Set rounded corners for the bottom-left
                ),
              ),
              child: const Center(
                child: Text(
                  'Add Emergency Number',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1, // 25% width
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFC0C0), // Set the color for the right column
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                      10.0), // Set rounded corners for the top-right
                  bottomRight: Radius.circular(
                      10.0), // Set rounded corners for the bottom-right
                ),
              ),
              child: Center(
                  child: CircularIconButton(
                    icon: Icons.add,
                    size: 30,
                    iconSize: 15,
                    onPressed: () {
                      navigateToPage(context, AddEmergencyPage());
                    },
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedContainerTypeThree extends StatelessWidget {
  final double height;

  const RoundedContainerTypeThree({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      height: height, // Adjust the height as needed
      decoration: BoxDecoration(
        color: Colors.blue, // Set the background color
        borderRadius: BorderRadius.circular(
            10.0), // Set the border radius for the outer container
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Set the shadow color
            spreadRadius: 1, // Set the spread radius of the shadow
            blurRadius: 5, // Set the blur radius of the shadow
            offset: const Offset(
                0, 4), // Negative offset to shift the shadow upward
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3, // 75% width
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFF6B6B), // Set the color for the left column
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                      10.0), // Set rounded corners for the top-left
                  bottomLeft: Radius.circular(
                      10.0), // Set rounded corners for the bottom-left
                ),
              ),
              child: const Center(
                child: Text(
                  'Call Emergency Number',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1, // 25% width
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFC0C0), // Set the color for the right column
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                      10.0), // Set rounded corners for the top-right
                  bottomRight: Radius.circular(
                      10.0), // Set rounded corners for the bottom-right
                ),
              ),
              child: Center(
                  child: CircularIconButton(
                    icon: Icons.call,
                    size: 30,
                    iconSize: 15,
                    onPressed: () {
                      navigateToPage(context,CallEmergencyPage());
                    },
                  )),
            ),
          ),
        ],

      ),
    );
  }
}

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final double iconSize;
  final VoidCallback onPressed;

  const CircularIconButton(
      {super.key,
        required this.icon,
        required this.size,
        required this.iconSize,
        required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size, // Adjust the width as needed
      height: size, // Adjust the height as needed
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          )
        ],
        color: const Color(
            0xFFCA3333), // Set the background color for the circular icon button
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.black,
          size: iconSize, // Set the icon color for the circular icon button
        ),
        alignment: Alignment.center,
        onPressed: onPressed,
      ),
    );
  }
}

void navigateToPage(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

