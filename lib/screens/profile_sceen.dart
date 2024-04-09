import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_clone/common/colors.dart';
import 'package:netflix_clone/widgets/bottom_nav.dart';
import 'package:netflix_clone/widgets/more_screen/user_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  void changeScreen(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => const BottomNavBar()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image centered
                Expanded(
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 200,
                    ),
                  ),
                ),
                // Icon to the right
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    color: iconColor,
                    size: iconSize1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Who\'s Watching?',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserProfileItem(
                  color: Colors.blue,
                  name: 'Subruzz',
                  screenChange: () {
                    changeScreen(context);
                  },
                ),
                const SizedBox(width: 10), // Add spacing between items
                const UserProfileItem(
                    color: Color.fromARGB(255, 160, 148, 39), name: 'Dasha'),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserProfileItem(color: Colors.red, name: 'New'),
                SizedBox(width: 10), // Add spacing between items
                UserProfileItem(color: Colors.transparent, name: 'Kids'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
