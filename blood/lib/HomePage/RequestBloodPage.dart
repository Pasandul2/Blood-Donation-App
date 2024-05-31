import 'package:blood/HomePage/MainPage.dart';
import 'package:blood/WelcomePage/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RequestBloodPage extends StatefulWidget {
  @override
  _RequestBloodPageState createState() => _RequestBloodPageState();
}

class _RequestBloodPageState extends State<RequestBloodPage> {
  final TextEditingController _dateController = TextEditingController();
  String _bloodGroup = 'A+';
  int _units = 1;
  bool _isContactVisible = false;

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

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
            RequestBloodForm(
              dateController: _dateController,
              bloodGroup: _bloodGroup,
              units: _units,
              isContactVisible: _isContactVisible,
              onBloodGroupChanged: (value) {
                setState(() {
                  _bloodGroup = value;
                });
              },
              onUnitsChanged: (value) {
                setState(() {
                  _units = value;
                });
              },
              onContactVisibilityChanged: (value) {
                setState(() {
                  _isContactVisible = value;
                });
              },
              onDateTap: () => _selectDate(context),
            ),
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
            'Request Blood',
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

class RequestBloodForm extends StatelessWidget {
  final TextEditingController dateController;
  final String bloodGroup;
  final int units;
  final bool isContactVisible;
  final ValueChanged<String> onBloodGroupChanged;
  final ValueChanged<int> onUnitsChanged;
  final ValueChanged<bool> onContactVisibilityChanged;
  final VoidCallback onDateTap;

  RequestBloodForm({
    required this.dateController,
    required this.bloodGroup,
    required this.units,
    required this.isContactVisible,
    required this.onBloodGroupChanged,
    required this.onUnitsChanged,
    required this.onContactVisibilityChanged,
    required this.onDateTap,
  });

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
              suffixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Contact Number',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.phone),
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Blood Group',
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                  controller: TextEditingController(text: bloodGroup),
                  onTap: () => _showBloodGroupDialog(context),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Unit',
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                  controller: TextEditingController(text: '$units'),
                  onTap: () => _showUnitDialog(context),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Hospital',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.local_hospital),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: dateController,
            decoration: InputDecoration(
              labelText: 'Date',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.calendar_today),
            ),
            readOnly: true,
            onTap: onDateTap,
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Checkbox(
                value: isContactVisible,
                onChanged: (value) {
                  onContactVisibilityChanged(value!);
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
                  isSelected: bloodGroup == 'A+',
                  onTap: () {
                    onBloodGroupChanged('A+');
                    Navigator.of(context).pop();
                  },
                ),
                BloodGroupChip(
                  label: 'A-',
                  isSelected: bloodGroup == 'A-',
                  onTap: () {
                    onBloodGroupChanged('A-');
                    Navigator.of(context).pop();
                  },
                ),
                BloodGroupChip(
                  label: 'B+',
                  isSelected: bloodGroup == 'B+',
                  onTap: () {
                    onBloodGroupChanged('B+');
                    Navigator.of(context).pop();
                  },
                ),
                BloodGroupChip(
                  label: 'B-',
                  isSelected: bloodGroup == 'B-',
                  onTap: () {
                    onBloodGroupChanged('B-');
                    Navigator.of(context).pop();
                  },
                ),
                BloodGroupChip(
                  label: 'O+',
                  isSelected: bloodGroup == 'O+',
                  onTap: () {
                    onBloodGroupChanged('O+');
                    Navigator.of(context).pop();
                  },
                ),
                BloodGroupChip(
                  label: 'O-',
                  isSelected: bloodGroup == 'O-',
                  onTap: () {
                    onBloodGroupChanged('O-');
                    Navigator.of(context).pop();
                  },
                ),
                BloodGroupChip(
                  label: 'AB+',
                  isSelected: bloodGroup == 'AB+',
                  onTap: () {
                    onBloodGroupChanged('AB+');
                    Navigator.of(context).pop();
                  },
                ),
                BloodGroupChip(
                  label: 'AB-',
                  isSelected: bloodGroup == 'AB-',
                  onTap: () {
                    onBloodGroupChanged('AB-');
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

  void _showUnitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Unit'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    for (int i = 1; i <= 10; i++)
                      ListTile(
                        title: Text('$i'),
                        onTap: () {
                          onUnitsChanged(i);
                          Navigator.of(context).pop();
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

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
