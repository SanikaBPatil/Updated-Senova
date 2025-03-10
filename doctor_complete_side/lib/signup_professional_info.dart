import 'package:flutter/material.dart';
import 'signup_verification.dart';

class SignUpProfessionalInfoWidget extends StatefulWidget {
  const SignUpProfessionalInfoWidget({super.key});

  @override
  State<SignUpProfessionalInfoWidget> createState() =>
      _SignUpProfessionalInfoWidgetState();
}

class _SignUpProfessionalInfoWidgetState
    extends State<SignUpProfessionalInfoWidget> {
  final _formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final licenseController = TextEditingController();
  final specialtyController = TextEditingController();
  final hospitalNameController = TextEditingController();
  final clinicAddressController = TextEditingController();
  final contactNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sign Up - Professional Info'),
        backgroundColor: const Color(0xFF49B2CC),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField(fullNameController, 'Full Name', Icons.person),
                  const SizedBox(height: 20),
                  _buildTextField(
                      licenseController, 'Medical License Number', Icons.badge),
                  const SizedBox(height: 20),
                  _buildTextField(
                      specialtyController, 'Specialty', Icons.local_hospital),
                  const SizedBox(height: 20),
                  _buildTextField(hospitalNameController, 'Hospital/Clinic Name',
                      Icons.local_hospital_outlined),
                  const SizedBox(height: 20),
                  _buildTextField(
                      clinicAddressController, 'Clinic Address', Icons.map),
                  const SizedBox(height: 20),
                  _buildTextField(contactNumberController, 'Contact Number',
                      Icons.phone),
                  const SizedBox(height: 20),
                  _buildTextField(
                      emailController, 'Email (Username)', Icons.email),
                  const SizedBox(height: 20),
                  _buildTextField(
                      passwordController, 'Create Password ', Icons.password),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const SignUpVerificationWidget(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF49B2CC),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Next'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String labelText, IconData icon) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: Icon(icon),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $labelText';
        }
        return null;
      },
    );
  }
}
