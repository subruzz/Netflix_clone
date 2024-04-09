import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_clone/common/colors.dart';
import 'package:netflix_clone/widgets/more_screen/user_profile.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 150,
              child: ListView(
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                children: const [
                  UserProfileItem(color: Colors.blue, name: 'Subruzz'),
                  UserProfileItem(
                      color: Color.fromARGB(255, 181, 169, 37), name: 'Dasha'),
                  UserProfileItem(color: Colors.transparent, name: 'Kids'),
                  // SizedBox(
                  //   width: 100, // Adjust the width of the container
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: Colors.white),
                  //         borderRadius: BorderRadius.circular(
                  //             10), // Optional: Add border radius
                  //       ),
                  //       child: Icon(
                  //         Icons.add,
                  //         color: Colors.white,
                  //         size: 60,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle button click
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                label: const Text(
                  "Manage Profiles",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              color: secColor,
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '💬  Tell Friends About Netflix.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                      "Lorem ipsum dolor sit amet,consectetur adipiscing elit,sed do eiusmod tempor incididuntut labore et dolore magna aliqua.",
                      style: TextStyle(fontSize: 14)),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Terms & Conditions',
                    style: TextStyle(
                        fontSize: 13,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        decorationThickness: 3),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        flex: 3,
                        child: SizedBox(
                          height: 45,
                          child: TextField(
                            decoration: InputDecoration(
                                filled: true, fillColor: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        height: 40,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Copy Link',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.whatsapp,
                        size: 30,
                        color: Colors.green,
                      ),
                      const FaIcon(
                        FontAwesomeIcons.facebook,
                        size: 30,
                        color: Colors.blueAccent,
                      ),
                      const FaIcon(
                        FontAwesomeIcons.envelope,
                        size: 30,
                        color: Color.fromARGB(255, 180, 106, 106),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_horiz_outlined,
                            color: Colors.white,
                            size: 30,
                          ))
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '✔️ My List',
                  ),
                  Divider(),
                  Text('App Settings', style: TextStyle(fontSize: 17)),
                  Text('Account', style: TextStyle(fontSize: 17)),
                  Text('Help', style: TextStyle(fontSize: 17)),
                  Text('Sign Out', style: TextStyle(fontSize: 17))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
