import 'package:flutter/material.dart';
import 'signup_practice_info.dart';

class SignUpVerificationWidget extends StatefulWidget {
  const SignUpVerificationWidget({super.key});

  @override
  State<SignUpVerificationWidget> createState() =>
      _SignUpVerificationWidgetState();
}

class _SignUpVerificationWidgetState
    extends State<SignUpVerificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sign Up - Verification Documents'),
        backgroundColor: const Color(0xFF49B2CC),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUploadField('Upload Medical License Document'),
              const SizedBox(height: 20),
              _buildUploadField('Upload Government Issued ID'),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpPracticeInfoWidget(),
                    ),
                  );
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
    );
  }

  Widget _buildUploadField(String labelText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () {
            // Add file upload logic here
            print('Upload $labelText');
          },
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            side: const BorderSide(color: Color(0xFF4FB0CD)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Choose File'),
        ),
      ],
    );
  }
}
