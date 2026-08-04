import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_fonts.dart';
import '../../../auth/data/user_model.dart';
import '../../data/profile_model.dart';
import '../widget/custom_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  Future<void> handleSignOut(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('remember_me', false);
    await prefs.setBool('is_logged_in', false);

    if (!context.mounted) return;
    context.go('/login');
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
          onPressed: () {
            context.go("/home");
          },
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            color: AppColor.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: AppFonts.inter,
          ),
        ),
      ),
      body: FutureBuilder<UserModel?>(
        future: UserModel.getSavedUser(),
        builder: (context, snapshot) {
          final userProfile = UserProfileModel.fromUserModel(snapshot.data);

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 56),

                // صورة المستخدم مع الاسم والإيميل
                Center(
                  child: Column(
                    children: [
                      ProfileAvatar(
                        imageUrl: userProfile.imageUrl,
                        onCameraTap: () {
                          context.go('/edit-profile');
                          // تغيير الصورة مستقبلاً
                        },
                      ),
                      const SizedBox(height: 16),
                      UserDetails(
                        fullName: userProfile.fullName,
                        email: userProfile.email,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 64),

                // الخط الفاصل بين القسمين
                Divider(
                  color: AppColor.dividerColor,
                  thickness: 1,
                  indent: 24,
                  endIndent: 24,
                ),

                const SizedBox(height: 32),

                ...userProfile.options.map(
                  (option) => ProfileOptionTile(
                    iconData: option.icon,
                    title: option.title,
                    iconColor: option.iconColor,
                    onTap: () {},
                  ),
                ),

                const SizedBox(height: 40),

                // زر تسجيل الخروج
                SignOutButton(onTap: () => handleSignOut(context)),

                const SizedBox(height: 56),
              ],
            ),
          );
        },
      ),
    );
  }
}
