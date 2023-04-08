import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';

class TailorSettingsScreen extends StatefulWidget {
  // static final String path = "lib/src/pages/settings/settings1.dart";

  @override
  _TailorSettingsScreenState createState() => _TailorSettingsScreenState();
}

class _TailorSettingsScreenState extends State<TailorSettingsScreen> {
  bool isSwitched = false;
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColors.backGroundColor,
        title: Text(
          'Setting',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: ListTile(
                    onTap: () {
                      //open edit profile
                    },
                    subtitle: Text(
                      'Tailor',
                      style: TextStyle(color: AppColors.backGroundColor),
                    ),
                    title: Text(
                      "Rasheed",
                      style: TextStyle(
                        color: AppColors.backGroundColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/images/TailorImages/TailorProfile.jpg'),
                    ),
                    trailing: Icon(
                      Icons.edit,
                      color: AppColors.backGroundColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.lock_outline,
                          color: AppColors.backGroundColor,
                        ),
                        title: Text("Change Password"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //open change password
                        },
                      ),
                      _buildDivider(),
                      ListTile(
                        leading: Icon(
                          Icons.location_on,
                          color: AppColors.backGroundColor,
                        ),
                        title: const Text("Change Location"),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //open change location
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Notification Settings",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SwitchListTile(
                  activeColor: Colors.white,
                  contentPadding: const EdgeInsets.all(0),
                  value: isSwitched,
                  title: const Text(
                    "Received notification",
                    style: TextStyle(color: Colors.white),
                  ),
                  onChanged: (val) {
                    setState(() {
                      isSwitched = val;
                    });
                  },
                ),
                SwitchListTile(
                  activeColor: Colors.white,
                  contentPadding: const EdgeInsets.all(0),
                  value: isSwitched1,
                  title: const Text(
                    "Received newsletter",
                    style: TextStyle(color: Colors.white),
                  ),
                  onChanged: (val) {
                    setState(() {
                      isSwitched1 = val;
                    });
                  },
                ),
                SwitchListTile(
                  activeColor: Colors.white,
                  contentPadding: const EdgeInsets.all(0),
                  value: isSwitched2,
                  title: Text(
                    "Received Offer Notification",
                    style: TextStyle(color: Colors.white),
                  ),
                  onChanged: (val) {
                    setState(() {
                      isSwitched2 = val;
                    });
                  },
                ),
                const SizedBox(height: 60.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
