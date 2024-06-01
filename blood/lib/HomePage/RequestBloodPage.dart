import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// This class represents the page where users can request blood.
class RequestBloodPage extends StatefulWidget {
  @override
  _RequestBloodPageState createState() => _RequestBloodPageState();
}

// This class represents the state of the RequestBloodPage.
class _RequestBloodPageState extends State<RequestBloodPage> {
  // Controller for the date input field.
  final TextEditingController _dateController = TextEditingController();
  // Initial values for blood group, units, and contact visibility.
  String _bloodGroup = 'A+';
  int _units = 1;
  bool _isContactVisible = false;

  // Dispose of the controller when the state is disposed.
  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  // Method to select a date.
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

  // Build method for the UI.
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
            // Header section widget.
            HeaderSection(),
            // Blood request form widget.
            RequestBloodForm(
              dateController: _dateController,
              bloodGroup: _bloodGroup,
              units: _units,
              isContactVisible: _isContactVisible,
              // Callbacks for form field changes.
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
      // Bottom navigation bar.
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
            // Navigate to the main page.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          } else if (index == 1) {
            // Handle map option.
          } else if (index == 2) {
            // Show logout confirmation dialog.
            showLogoutConfirmationDialog(context);
          } else {}
        },
      ),
    );
  }
}

// Widget for showing logout confirmation dialog.
void showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Log Out'), // Display logout confirmation.
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

// Widget for the header section.
class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Styling for the header section.
    );
  }
}

// Widget for the blood request form.
class RequestBloodForm extends StatelessWidget {
  // Properties for the form.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Form fields.
        ],
      ),
    );
  }
}

// Widget for displaying blood group options.
class BloodGroupChip extends StatelessWidget {
  // Properties for the blood group chip.
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      // Styling and functionality for the blood group chip.
    );
  }
}
