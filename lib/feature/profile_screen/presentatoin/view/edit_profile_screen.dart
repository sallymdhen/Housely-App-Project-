import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

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

  Future<void> _pickAndUpdateImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (pickedFile == null) return;

    final appDir = await getApplicationDocumentsDirectory();
    final fileName = p.basename(pickedFile.path);
    final savedImage = await File(
      pickedFile.path,
    ).copy('${appDir.path}/$fileName');

    await _editProfileData.updateProfileImage(savedImage.path);
    if (!mounted) return;
    setState(() {});
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
          onPressed: () => context.pop(),
          //Navigator.maybePop(context),
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
                        onCameraTap: _pickAndUpdateImage,
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
                      width: double.infinity,
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
                      width: double.infinity,
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
                      width: double.infinity,
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
                          bool saved = await _editProfileData
                              .saveProfileLocal();

                          if (!mounted) return;

                          if (saved) {
                            context.pop();
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
