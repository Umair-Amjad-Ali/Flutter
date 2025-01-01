import 'package:flutter/material.dart';

class SignupDetails extends StatefulWidget {
  const SignupDetails({super.key});

  @override
  _SignupDetailsState createState() => _SignupDetailsState();
}

class _SignupDetailsState extends State<SignupDetails> {
  // Controllers for the text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Global key to access form state
  final _formKey = GlobalKey<FormState>();

  // Error messages for individual fields
  String? _nameError;
  String? _phoneError;
  String? _emailError;
  String? _passwordError;

  // State for show/hide password functionality
  bool _obscurePassword = true;

  // Method to handle form submission
  void _submitForm() {
    setState(() {
      // Perform field-specific validations
      _nameError =
          _nameController.text.isEmpty ? 'Please enter your name' : null;
      _phoneError = _phoneController.text.isEmpty
          ? 'Please enter your phone number'
          : null;
      _emailError = _validateEmail(_emailController.text);
      _passwordError = _passwordController.text.isEmpty
          ? 'Please enter your password'
          : null;
    });

    // Check if all fields are valid
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form is valid!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all fields correctly.')),
      );
    }
  }

  // Method to validate email
  String? _validateEmail(String value) {
    if (value.isEmpty) return 'Please enter your email';
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Method to toggle password visibility
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Heading text
                Text(
                  'Create Your Account',
                  style: TextStyle(
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),

                // Full Name Field
                _buildTextFieldWithError(
                  controller: _nameController,
                  placeholder: 'Full Name',
                  errorText: _nameError,
                ),
                const SizedBox(height: 5),

                // Phone Number Field
                _buildTextFieldWithError(
                  controller: _phoneController,
                  placeholder: 'Phone Number',
                  errorText: _phoneError,
                ),
                const SizedBox(height: 5),

                // Email Field
                _buildTextFieldWithError(
                  controller: _emailController,
                  placeholder: 'Email',
                  errorText: _emailError,
                ),
                const SizedBox(height: 5),

                // Password Field with Show/Hide functionality
                _buildTextFieldWithError(
                  controller: _passwordController,
                  placeholder: 'Password',
                  errorText: _passwordError,
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                const SizedBox(height: 5),

                Row(
                  children: [
                    Text(
                      "Check it if you agree to our Terms\n& Conditions and Privacy Policy",
                      style: TextStyle(
                        fontSize: size.width * 0.044,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade600,
                      ),
                      textAlign:
                          TextAlign.start, // Ensure text aligns to the left
                    ),
                  ],
                ),
                const SizedBox(height: 5),

                // Signup Button
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.02,
                      horizontal: size.width * 0.3,
                    ),
                    backgroundColor: const Color(0xFFEA4848),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 15),

                // Line with "OR"
                Row(
                  children: [
                    const Expanded(child: Divider(thickness: 1.5)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'OR With',
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider(thickness: 1.5)),
                  ],
                ),
                const SizedBox(height: 15),

                // Row of social media icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialIcon(Icons.g_mobiledata), // Google Icon
                    const SizedBox(width: 20),
                    _buildSocialIcon(Icons.facebook), // Facebook Icon
                    const SizedBox(width: 20),
                    _buildSocialIcon(Icons.apple), // Apple Icon
                  ],
                ),
                const SizedBox(height: 20),

                // Already have an account text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to login
                      },
                      child: const Text(
                        "Login here",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Build reusable text field with error handling
  Widget _buildTextFieldWithError({
    required TextEditingController controller,
    required String placeholder,
    required String? errorText,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: placeholder,
              border: InputBorder.none, // Remove the border
              suffixIcon: suffixIcon,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            ),
          ),
        ),
        if (errorText != null && errorText.isNotEmpty) // Show error if present
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              errorText,
              style: const TextStyle(fontSize: 12, color: Colors.red),
            ),
          ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey.shade300,
      child: Icon(
        icon,
        color: Colors.black,
        size: 40,
      ),
    );
  }
}
