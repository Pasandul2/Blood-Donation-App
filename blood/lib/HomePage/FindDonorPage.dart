// ignore_for_file: unused_import

import 'package:blood/WelcomePage/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:blood/HomePage/BecomeDonorPage.dart';
import 'package:blood/HomePage/MainPage.dart';

class FindDonorPage extends StatefulWidget {
  @override
  _FindDonorPageState createState() => _FindDonorPageState();
}

class _FindDonorPageState extends State<FindDonorPage> {
  String? selectedBloodGroup;
  String location = '';

  void _showBloodGroupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Blood Group'),
          content: SingleChildScrollView(
            child: Wrap(
              spacing: 8.0,
              children: [
                BloodGroupChip(
                  label: 'A+',
                  isSelected: selectedBloodGroup == 'A+',
                  onTap: () {
                    setState(() {
                      selectedBloodGroup = 'A+';
                    });
                    Navigator.of(context).pop();
                  },
                ),
                BloodGroupChip(
                  label: 'A-',
                  isSelected: selectedBloodGroup == 'A-',
                  onTap: () {
                    setState(() {
                      selectedBloodGroup = 'A-';
                    });
                    Navigator.of(context).pop();
                  },
                ),
                BloodGroupChip(
                  label: 'B+',
                  isSelected: selectedBloodGroup == 'B+',
                  onTap: () {
                    setState(() {
                      selectedBloodGroup = 'B+';
                    });
                    Navigator.of(context).pop();
                  },
                ),
                BloodGroupChip(
                  label: 'B-',
                  isSelected: selectedBloodGroup == 'B-',
                  onTap: () {
                    setState(() {
                      selectedBloodGroup = 'B-';
                    });
                    Navigator.of(context).pop();
                  },
                ),
                BloodGroupChip(
                  label: 'O+',
                  isSelected: selectedBloodGroup == 'O+',
                  onTap: () {
                    setState(() {
                      selectedBloodGroup = 'O+';
                    });
                    Navigator.of(context).pop();
                  },
                ),
                BloodGroupChip(
                  label: 'O-',
                  isSelected: selectedBloodGroup == 'O-',
                  onTap: () {
                    setState(() {
                      selectedBloodGroup = 'O-';
                    });
                    Navigator.of(context).pop();
                  },
                ),
                BloodGroupChip(
                  label: 'AB+',
                  isSelected: selectedBloodGroup == 'AB+',
                  onTap: () {
                    setState(() {
                      selectedBloodGroup = 'AB+';
                    });
                    Navigator.of(context).pop();
                  },
                ),
                BloodGroupChip(
                  label: 'AB-',
                  isSelected: selectedBloodGroup == 'AB-',
                  onTap: () {
                    setState(() {
                      selectedBloodGroup = 'AB-';
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Wave'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushNamed(context, '/MainPage');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Blood Group',
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              controller: TextEditingController(text: selectedBloodGroup),
              onTap: () => _showBloodGroupDialog(context),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter location',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on),
              ),
              onChanged: (value) {
                setState(() {
                  location = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle search action
              },
              child: Text('Search'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  DonorCard(
                    bloodGroup: 'O+',
                    name: 'Amara Kumara',
                    units: 1,
                    distance: 8,
                    time: '2 hours ago',
                  ),
                  DonorCard(
                    bloodGroup: 'B-',
                    name: 'Kumara Dasu',
                    units: 5,
                    distance: 8,
                    time: '5 hours ago',
                  ),
                  DonorCard(
                    bloodGroup: 'A+',
                    name: 'Mahinda Rajapaksha',
                    units: 1,
                    distance: 14,
                    time: '7 hours ago',
                  ),
                  DonorCard(
                    bloodGroup: 'A+',
                    name: 'Mahinda Rajapaksha',
                    units: 1,
                    distance: 14,
                    time: '7 hours ago',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
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
            // Handle Map navigation
          } else if (index == 2) {
            showLogoutConfirmationDialog(context);
          }
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

class BloodGroupChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  BloodGroupChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        label: Text(label),
        backgroundColor: isSelected ? Colors.red : Colors.grey[300],
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class DonorCard extends StatelessWidget {
  final String bloodGroup;
  final String name;
  final int units;
  final int distance;
  final String time;

  DonorCard({
    required this.bloodGroup,
    required this.name,
    required this.units,
    required this.distance,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.red,
          child: Text(
            bloodGroup,
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: Text(name),
        subtitle: Text(
            '$units unit${units > 1 ? 's' : ''} · $distance km away · $time'),
      ),
    );
  }
}
