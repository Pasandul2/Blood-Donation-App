import 'package:blood/HomePage/MainPage.dart';
import 'package:blood/WelcomePage/LoginPage.dart';
import 'package:flutter/material.dart';

// This is the main class for the Become Donor Page
class BecomeDonorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with no visible elements
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSection(), // Custom header section
            DonorForm(), // Form for donor details
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
        currentIndex: 0, // Default selected index
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          } else if (index == 1) {
            // Map functionality can be added here
          } else if (index == 2) {
            showLogoutConfirmationDialog(
                context); // Show logout confirmation dialog
          }
        },
      ),
    );
  }
}

// Function to show the logout confirmation dialog
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
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          TextButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        LoginPage()), // Navigate to login page
              );
            },
          ),
        ],
      );
    },
  );
}

// Custom header section widget
class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        gradient: LinearGradient(
          colors: [Color(0xFFE91E63), Color.fromARGB(255, 154, 8, 184)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/MainPage');
                },
              ),
              SizedBox(width: 16),
              Text(
                'BLOOD WAVE',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Become a donor',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// Form widget to collect donor details
class DonorForm extends StatefulWidget {
  @override
  _DonorFormState createState() => _DonorFormState();
}

class _DonorFormState extends State<DonorForm> {
  String _gender = 'Male';
  String _bloodGroup = 'A+';
  bool _isContactVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'E-Mail',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Text('Gender', style: TextStyle(fontSize: 16)),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Text('Male'),
                  leading: Radio(
                    value: 'Male',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value.toString();
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text('Female'),
                  leading: Radio(
                    value: 'Female',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value.toString();
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text('Select Blood Group', style: TextStyle(fontSize: 16)),
          Wrap(
            spacing: 8.0,
            children: [
              BloodGroupChip(
                label: 'A+',
                isSelected: _bloodGroup == 'A+',
                onTap: () {
                  setState(() {
                    _bloodGroup = 'A+';
                  });
                },
              ),
              BloodGroupChip(
                label: 'A-',
                isSelected: _bloodGroup == 'A-',
                onTap: () {
                  setState(() {
                    _bloodGroup = 'A-';
                  });
                },
              ),
              BloodGroupChip(
                label: 'B+',
                isSelected: _bloodGroup == 'B+',
                onTap: () {
                  setState(() {
                    _bloodGroup = 'B+';
                  });
                },
              ),
              BloodGroupChip(
                label: 'B-',
                isSelected: _bloodGroup == 'B-',
                onTap: () {
                  setState(() {
                    _bloodGroup = 'B-';
                  });
                },
              ),
              BloodGroupChip(
                label: 'O+',
                isSelected: _bloodGroup == 'O+',
                onTap: () {
                  setState(() {
                    _bloodGroup = 'O+';
                  });
                },
              ),
              BloodGroupChip(
                label: 'O-',
                isSelected: _bloodGroup == 'O-',
                onTap: () {
                  setState(() {
                    _bloodGroup = 'O-';
                  });
                },
              ),
              BloodGroupChip(
                label: 'AB+',
                isSelected: _bloodGroup == 'AB+',
                onTap: () {
                  setState(() {
                    _bloodGroup = 'AB+';
                  });
                },
              ),
              BloodGroupChip(
                label: 'AB-',
                isSelected: _bloodGroup == 'AB-',
                onTap: () {
                  setState(() {
                    _bloodGroup = 'AB-';
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Checkbox(
                value: _isContactVisible,
                onChanged: (value) {
                  setState(() {
                    _isContactVisible = value!;
                  });
                },
              ),
              Text(
                  'Do you want to make your contact number\nvisible for others?')
            ],
          ),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Submit form
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 212, 14, 129),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
              ),
              child: Text(
                'Done',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom ChoiceChip widget for blood group selection
class BloodGroupChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function onTap;

  BloodGroupChip(
      {required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        onTap();
      },
      selectedColor: Colors.red,
      backgroundColor: Colors.grey[200],
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
    );
  }
}
