import 'package:flutter/material.dart';
import 'package:stock_counter/screens/main_screens/reports.dart';
import 'package:stock_counter/screens/main_screens/stock_counter.dart';
import 'package:stock_counter/screens/main_screens/usages.dart';
import 'package:stock_counter/widgets/dynamic_button.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final _formKey = GlobalKey<FormState>();

  // Text Editing Controllers for fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // Regex patterns for validation
  final RegExp _usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');
  final RegExp _emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
  final RegExp _phoneRegex = RegExp(r'^[0-9]{10}$');

  int _selectedIndex = 0;

  // List of widgets to display

  // Navigation handler for bottom bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            Column(
              children: [
                // Custom AppBar
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Hamburger Icon
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color(0xFFEA4848),
                          shape: BoxShape.rectangle,
                        ),
                        child: const Icon(Icons.menu, color: Colors.white),
                      ),
                      // Middle Text
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8),
                        decoration: BoxDecoration(
                          color: Color(0xFFEA4848),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Personal Information',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Profile Icon
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color(0xFFEA4848),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // Profile Section
                SizedBox(height: 10),
                Text(
                  "Hello, Umair",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF959595),
                    ),
                    Positioned(
                      bottom:
                          8, // Adjust this value to control the vertical position
                      left: 0,
                      right: 0,
                      child: Icon(
                        Icons.edit,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Form Fields
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _buildTextField(
                            'Name',
                            _nameController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Name is required.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          _buildTextField(
                            'Username',
                            _usernameController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Username is required.';
                              } else if (!_usernameRegex.hasMatch(value)) {
                                return 'Username can only contain letters, numbers, and underscores.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          _buildTextField(
                            'Email Address',
                            _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required.';
                              } else if (!_emailRegex.hasMatch(value)) {
                                return 'Enter a valid email address.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          _buildTextField(
                            'Phone Number',
                            _phoneController,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Phone number is required.';
                              } else if (!_phoneRegex.hasMatch(value)) {
                                return 'Enter a valid 10-digit phone number.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          _buildTextField(
                            'Description',
                            _descriptionController,
                            maxLines: 3,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Description is required.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: DynamicButton(
                                      label: "Save Details",
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          // Save or update the information
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const StockCounter(),
                                            ),
                                          );
                                        }
                                      }))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Usages(),
            const Reports(),
          ],
        ),
      ),
      // Bottom Navigation Bar with Shadow
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart),
              label: 'Usage',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.report),
              label: 'Report',
            ),
          ],
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
        ),
      ),
    );
  }

  // Helper function to build text fields
  Widget _buildTextField(String hintText, TextEditingController controller,
      {int maxLines = 1,
      required String? Function(String?)? validator,
      TextInputType keyboardType = TextInputType.text,
      void Function(String)? onChanged,
      void Function()? onTap}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
