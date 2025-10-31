import 'package:flutter/material.dart';
import 'login.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool _isEditing = false;
  final _nameController = TextEditingController(text: 'gian');
  final _emailController = TextEditingController(text: 'gian@gmail.como');
  final _phoneController = TextEditingController(text: '+6285156542178');
  final _addressController = TextEditingController(text: 'cikunir');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header dengan gradient background
            Container(
              height: 250,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF6366F1),
                    Color(0xFF8B5CF6),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Profile Picture
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                        child: const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: Color(0xFF6366F1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Name
                    Text(
                      _nameController.text,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Email
                    Text(
                      _emailController.text,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Profile Information Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Informasi Profil',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              _isEditing ? Icons.save : Icons.edit,
                              color: const Color(0xFF6366F1),
                            ),
                            onPressed: () {
                              setState(() {
                                if (_isEditing) {
                                  // Save changes
                                }
                                _isEditing = !_isEditing;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Name Field
                      _buildProfileField(
                        icon: Icons.person,
                        label: 'Nama Lengkap',
                        controller: _nameController,
                        enabled: _isEditing,
                        color: const Color(0xFF6366F1),
                      ),
                      const SizedBox(height: 16),
                      // Email Field
                      _buildProfileField(
                        icon: Icons.email,
                        label: 'Email',
                        controller: _emailController,
                        enabled: _isEditing,
                        color: const Color(0xFF6366F1),
                      ),
                      const SizedBox(height: 16),
                      // Phone Field
                      _buildProfileField(
                        icon: Icons.phone,
                        label: 'Nomor Telepon',
                        controller: _phoneController,
                        enabled: _isEditing,
                        color: const Color(0xFF6366F1),
                      ),
                      const SizedBox(height: 16),
                      // Address Field
                      _buildProfileField(
                        icon: Icons.location_on,
                        label: 'Alamat',
                        controller: _addressController,
                        enabled: _isEditing,
                        maxLines: 2,
                        color: const Color(0xFF6366F1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Statistics Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Statistik Akun',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatItem('Pesanan', '12', const Color(0xFF6366F1)),
                          _buildStatItem('Ulasan', '24', const Color(0xFF8B5CF6)),
                          _buildStatItem('Poin', '350', const Color(0xFFEC4899)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Action Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildActionButton(
                    'Pengaturan Akun',
                    Icons.settings,
                    () {},
                    color: const Color(0xFF6366F1),
                  ),
                  const SizedBox(height: 10),
                  _buildActionButton(
                    'Riwayat Pesanan',
                    Icons.history,
                    () {},
                    color: const Color(0xFF8B5CF6),
                  ),
                  const SizedBox(height: 10),
                  _buildActionButton(
                    'Kebijakan Privasi',
                    Icons.privacy_tip,
                    () {},
                    color: const Color(0xFFEC4899),
                  ),
                  const SizedBox(height: 10),
                  _buildActionButton(
                    'Keluar',
                    Icons.logout,
                    () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Keluar'),
                          content: const Text('Apakah Anda yakin ingin keluar?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Batal'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                // Navigate back to login page
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Keluar',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField({
    required IconData icon,
    required String label,
    required TextEditingController controller,
    bool enabled = false,
    int maxLines = 1,
    Color color = const Color(0xFF6366F1),
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          enabled: enabled,
          maxLines: maxLines,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: color),
            border: enabled
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                : InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
          ),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(
    String text,
    IconData icon,
    VoidCallback onPressed, {
    Color color = Colors.blue,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color.withOpacity(0.1),
          foregroundColor: color,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            const SizedBox(width: 16),
            Icon(icon, color: color),
            const SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
