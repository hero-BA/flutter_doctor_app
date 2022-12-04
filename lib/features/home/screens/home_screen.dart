import 'package:flutter/material.dart';
import 'package:flutter_doctor_app/common/widgets/custom_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter_doctor_app/common/constants/utils.dart';
import 'package:flutter_doctor_app/providers/user_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  width: 150,
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.logout),
                  color: Colors.black,
                  onPressed: () => showAlertDialog(
                    context,
                    'Log Out',
                    'Are you sure you want to log out form the console?',
                    'Cancel',
                    'Yes',
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 50,
              bottom: 10,
            ),
            // TODO: Refactor code to fetch data from database
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/doctor-icon.png',
                      ),
                      radius: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'My Profile',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Dr. ${user.name}',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Patient list for today',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomCard(
                  avatar: 'assets/images/1.png',
                  name: 'Alen K.',
                  time: '16:00',
                  diagnose: 'Common cold',
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomCard(
                  avatar: 'assets/images/2.png',
                  name: 'Amy F.',
                  time: '16:30',
                  diagnose: 'Right Arm Pain',
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomCard(
                  avatar: 'assets/images/3.png',
                  name: 'Kim H.',
                  time: '16:30',
                  diagnose: 'Covid 19',
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Tomorrow',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomCard(
                  avatar: 'assets/images/4.png',
                  name: 'Andy A.',
                  time: '08:00',
                  diagnose: 'Common cold',
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomCard(
                  avatar: 'assets/images/5.png',
                  name: 'Bell B.',
                  time: '09:30',
                  diagnose: 'Headache',
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomCard(
                  avatar: 'assets/images/1.png',
                  name: 'Fiona L.',
                  time: '10:10',
                  diagnose: 'Covid 19',
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomCard(
                  avatar: 'assets/images/4.png',
                  name: 'Nezir B.',
                  time: '11:00',
                  diagnose: 'Broken Heart',
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomCard(
                  avatar: 'assets/images/2.png',
                  name: 'Peter P.',
                  time: '11:10',
                  diagnose: 'Covid 19',
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomCard(
                  avatar: 'assets/images/5.png',
                  name: 'Suad H.',
                  time: '17:00',
                  diagnose: 'Headache',
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomCard(
                  avatar: 'assets/images/1.png',
                  name: 'Alma F.',
                  time: '17:00',
                  diagnose: 'Common cold',
                ),
              ],
            ),
          ),
        ));
  }
}
