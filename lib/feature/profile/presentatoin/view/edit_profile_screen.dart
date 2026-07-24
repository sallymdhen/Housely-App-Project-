import 'package:flutter/material.dart';

import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_fonts.dart';
import '../../../auth/presentation/widget/custom_field.dart';
import '../../data/edit_profile_model.dart';
import '../widget/custom_widget.dart';
import '../widget/edit_profile_widgets.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final EditProfileData _editProfileData = EditProfileData();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    _editProfileData.loadFromPrefs().then((_) {
      if (mounted) {
        setState(() {
          _isReady = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _editProfileData.dispose();
    super.dispose();
  }

  Future<void> openDatePicker() async {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(1992, 11, 21),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate == null) return;

    setState(() {
      _editProfileData.dateOfBirthController.text =
          '${months[selectedDate.month - 1]}/${selectedDate.day}/${selectedDate.year}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.blackColor),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: AppColor.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: AppFonts.inter,
          ),
        ),
      ),
      body: !_isReady
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    Center(
                      child: ProfileAvatar(
                        imageUrl: _editProfileData.imageUrl,
                        onCameraTap: () {
                          // تغيير الصورة مستقبلاً
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomTextFormField(
                      label: 'Text Form',
                      hintText: '',
                      controller: _editProfileData.fullNameController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      label: 'Username',
                      hintText: '',
                      controller: _editProfileData.usernameController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      label: 'Email',
                      hintText: '',
                      controller: _editProfileData.emailController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email';
                        }

                        final emailRegex = RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        );
                        if (!emailRegex.hasMatch(value.trim())) {
                          return 'Email is not correct';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    DateOfBirthField(
                      controller: _editProfileData.dateOfBirthController,
                      onCalendarTap: openDatePicker,
                    ),
                    const SizedBox(height: 40),
                    CustomPrimaryButton(
                      text: 'Save Change',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          bool saved =
                              await _editProfileData.saveProfileLocal();

                          if (!mounted) return;

                          if (saved) {
                            Navigator.maybePop(context);
                          }
                        }
                      },
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
    );
  }
}
