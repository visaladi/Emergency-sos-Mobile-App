import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';
import 'Pages/Fire.dart';
import 'Pages/Ambulance.dart';
import 'Pages/Land_Slide.dart';
import 'Pages/Flood.dart';
import 'Pages/Rape.dart';
import 'Pages/Electricity.dart';
import 'Pages/Water.dart';
import 'Pages/Police.dart';
import 'Pages/Bomb.dart';
import 'Pages/Hospital.dart';
import'Login.dart';

List<Map<String, dynamic>> data = [
  {
    'name': 'Fire',
    'telNumber': '911',
    'icon': Icons.fire_extinguisher,
    'page': FirePage(),
  },
  {
    'name': 'Ambulance',
    'telNumber': '112',
    'icon': Icons.local_hospital,
    'page': AmbulancePage(),
  },
  {
    'name': 'Land_slide',
    'telNumber': '911',
    'icon': Icons.landscape,
    'page': LandSlidePage(),
  },
  {
    'name': 'Flood',
    'telNumber': '911',
    'icon': Icons.invert_colors,
    'page': FloodPage(),
  },
  {
    'name': 'Rape',
    'telNumber': '911',
    'icon': Icons.report,
    'page': RapePage(),
  },
  {
    'name': 'Electricity',
    'telNumber': '911',
    'icon': Icons.flash_on,
    'page': ElectricityPage(),
  },
  {
    'name': 'Water',
    'telNumber': '911',
    'icon': Icons.opacity,
    'page': WaterPage(),
  },
  {
    'name': 'Police',
    'telNumber': '911',
    'icon': Icons.local_police,
    'page': PolicePage(),
  },
  {
    'name': 'Bomb',
    'telNumber': '911',
    'icon': Icons.dangerous,
    'page': BombPage(),
  },
  {
    'name': 'Hospital',
    'telNumber': '911',
    'icon': Icons.local_hospital,
    'page': HospitalPage(),
  },
];


Map<String, StatelessWidget> pageMap = {
  'Fire': FirePage(),
  'Ambulance': AmbulancePage(),
  'Land_slide': LandSlidePage(),
  'Flood': FloodPage(),
  'Rape': RapePage(),
  'Electricity': ElectricityPage(),
  'Water': WaterPage(),
  'Police': PolicePage(),
  'Bomb': BombPage(),
  'Hospital': HospitalPage(),
};

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'EMERGENCY SOS',
        style: TextStyle(fontSize: 35, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: const Color(0xFFBCA37F),
      actions: [
        IconButton(
          icon: Icon(Icons.person),
          iconSize: 40,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget buildBody(BuildContext context) {
    return Stack(
      children: [
        buildBackgroundImage(),
        buildGridView(context),
      ],
    );
  }

  Widget buildBackgroundImage() {
    return Image.asset(
      'assets/home.jpg',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }

  Widget buildGridView(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        for (var emergencyContact in data)
          createButton(context, emergencyContact),
      ],
    );
  }

  Widget createButton(BuildContext context, Map<String, dynamic> emergencyContact) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Material(
        color: Colors.orangeAccent.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => pageMap[emergencyContact['name']]!,
              ),
            );
          },
          child: buildButtonContent(emergencyContact),
        ),
      ),
    );
  }

  Widget buildButtonContent(Map<String, dynamic> emergencyContact) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            emergencyContact['icon'],
            size: 50,
            color: Colors.white,
          ),
          SizedBox(height: 10),
          Text(
            emergencyContact['name'],
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}


// Similarly, create pages for other emergencies using StatelessWidget.
