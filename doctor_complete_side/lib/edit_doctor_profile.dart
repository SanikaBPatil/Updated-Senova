import 'package:flutter/material.dart';

void main() {
  runApp(const EditDoctorProfile());
}

class EditDoctorProfile extends StatelessWidget {
  const EditDoctorProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: EditDoctorProfilePage(),
    );
  }
}

class EditDoctorProfilePage extends StatefulWidget {
  @override
  _EditDoctorProfilePageState createState() => _EditDoctorProfilePageState();
}

class _EditDoctorProfilePageState extends State<EditDoctorProfilePage> {
  // Controllers for editing fields
  final TextEditingController fullNameController =
  TextEditingController(text: "Dr. John Smith");
  final TextEditingController licenseNumberController =
  TextEditingController(text: "12345678");
  final TextEditingController specialtyController =
  TextEditingController(text: "Cardiologist");
  final TextEditingController hospitalNameController =
  TextEditingController(text: "ABC Hospital");
  final TextEditingController clinicAddressController =
  TextEditingController(text: "123 Main Street");
  final TextEditingController contactNumberController =
  TextEditingController(text: "+1-123-456-7890");
  final TextEditingController emailController =
  TextEditingController(text: "john.smith@example.com");
  final TextEditingController passwordController =
  TextEditingController(text: "********");

  String medicalLicenseDoc = "Uploaded";
  String govtIdDoc = "Uploaded";
  int patientsTreated = 1200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Doctor Profile'),
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture Section
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage:
                    const AssetImage('assets/doctor_profile.jpg'),
                    backgroundColor: Colors.blueAccent,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blueAccent),
                        onPressed: () {
                          // Logic to change profile picture
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Personal Details Section
            _buildSectionCard(
              title: 'Personal Details',
              content: Column(
                children: [
                  _buildEditableField(
                    label: 'Full Name',
                    controller: fullNameController,
                    icon: Icons.person,
                  ),
                  _buildEditableField(
                    label: 'Medical License Number',
                    controller: licenseNumberController,
                    icon: Icons.medical_services,
                  ),
                  _buildEditableField(
                    label: 'Specialty',
                    controller: specialtyController,
                    icon: Icons.local_hospital,
                  ),
                  _buildEditableField(
                    label: 'Hospital/Clinic Name',
                    controller: hospitalNameController,
                    icon: Icons.location_city,
                  ),
                  _buildEditableField(
                    label: 'Clinic Address',
                    controller: clinicAddressController,
                    icon: Icons.location_on,
                  ),
                  _buildEditableField(
                    label: 'Contact Number',
                    controller: contactNumberController,
                    icon: Icons.phone,
                  ),
                  _buildEditableField(
                    label: 'Email ID',
                    controller: emailController,
                    icon: Icons.email,
                  ),
                  _buildEditableField(
                    label: 'Password',
                    controller: passwordController,
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Verification Documents Section
            _buildSectionCard(
              title: 'Verification Documents',
              content: Column(
                children: [
                  _buildDocumentTile(
                    label: 'Medical License Document',
                    status: medicalLicenseDoc,
                    icon: Icons.document_scanner,
                    onUpload: () {
                      setState(() {
                        medicalLicenseDoc = "Updated";
                      });
                    },
                  ),
                  _buildDocumentTile(
                    label: 'Government-issued ID Document',
                    status: govtIdDoc,
                    icon: Icons.account_box,
                    onUpload: () {
                      setState(() {
                        govtIdDoc = "Updated";
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Practice Information Section
            _buildSectionCard(
              title: 'Practice Information',
              content: ListTile(
                leading: const Icon(Icons.healing, color: Colors.blueAccent),
                title: Text('Patients Treated: $patientsTreated'),
                trailing: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blueAccent),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        TextEditingController patientController =
                        TextEditingController(
                            text: patientsTreated.toString());
                        return AlertDialog(
                          title: const Text('Edit Patients Treated'),
                          content: TextField(
                            controller: patientController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Number of Patients',
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  patientsTreated =
                                      int.tryParse(patientController.text) ??
                                          0;
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Save Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Profile updated successfully!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text('Save Changes', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to build editable fields
  Widget _buildEditableField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.blueAccent),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  // Helper to build document tiles
  Widget _buildDocumentTile({
    required String label,
    required String status,
    required IconData icon,
    required VoidCallback onUpload,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(label),
      subtitle: Text('Status: $status'),
      trailing: IconButton(
        icon: const Icon(Icons.upload, color: Colors.blueAccent),
        onPressed: onUpload,
      ),
    );
  }

  // Helper to build section card
  Widget _buildSectionCard({
    required String title,
    required Widget content,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 10),
            content,
          ],
        ),
      ),
    );
  }
}
