import 'package:blood/HomePage/BecomeDonorPage.dart';
import 'package:blood/HomePage/FindDonorPage.dart';
import 'package:blood/HomePage/RequestBloodPage.dart';
import 'package:blood/WelcomePage/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSection(),
            ActionButtons(),
            DonationNeeds(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Log Out',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          } else if (index == 1) {
          } else if (index == 2) {
            showLogoutConfirmationDialog(context);
          } else {}
        },
      ),
    );
  }
}

void showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Log Out'),
        content: Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            child: Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              // Add your logout logic here
              // For example, navigate to the login screen or clear user data
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        LoginPage()), // Replace with your login page
              );
            },
          ),
        ],
      );
    },
  );
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35)),
        gradient: LinearGradient(
          colors: [Color(0xFFE91E63), Color.fromARGB(255, 154, 8, 184)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BLOOD WAVE',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Donate Your Blood,\nSave A Life And Be Part Of Someone\'s Happiness.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 30),
                hintText: '  Search',
                suffixIcon: Container(
                  decoration: BoxDecoration(
                    color:
                        Colors.grey[300], // Set your desired background color
                    shape: BoxShape
                        .circle, // Optional: makes the background circular
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ActionButton(
            icon: Icons.search,
            label: 'Find Donors',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FindDonorPage()),
              );
            },
          ),
          ActionButton(
            icon: Icons.add,
            label: 'Donate',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BecomeDonorPage()),
              );
            },
          ),
          ActionButton(
            icon: Icons.shopping_cart,
            label: 'Request Blood',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RequestBloodPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  ActionButton(
      {required this.icon, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.pink,
            child: Icon(icon, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class DonationNeeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Donation Need',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          DonationNeedItem(
            bloodType: 'O+',
            name: 'Amara Kumara',
            units: 1,
            distance: 8,
            timeAgo: '2 hours ago',
          ),
          DonationNeedItem(
            bloodType: 'B-',
            name: 'Kumara Dasu',
            units: 2,
            distance: 5,
            timeAgo: '5 hours ago',
          ),
          DonationNeedItem(
            bloodType: 'A+',
            name: 'Mahinda Rajapaksha',
            units: 3,
            distance: 10,
            timeAgo: '1 day ago',
          ),
        ],
      ),
    );
  }
}

class DonationNeedItem extends StatelessWidget {
  final String bloodType;
  final String name;
  final int units;
  final int distance;
  final String timeAgo;

  DonationNeedItem(
      {required this.bloodType,
      required this.name,
      required this.units,
      required this.distance,
      required this.timeAgo});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text('$bloodType - $name'),
        subtitle: Text('$units unit(s) - $distance km away\n$timeAgo'),
      ),
    );
  }
}
