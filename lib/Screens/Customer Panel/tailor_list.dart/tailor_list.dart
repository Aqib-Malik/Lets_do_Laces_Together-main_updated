import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_do_laces_together/Screens/Customer%20Panel/tailor_list.dart/measurement_form.dart';
import 'package:lets_do_laces_together/Screens/Customer%20Panel/tailor_list.dart/tailor_detail.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';

class TailorList extends StatefulWidget {
  @override
  _TailorListState createState() => _TailorListState();
}
class _TailorListState extends State<TailorList> {
  late Stream<QuerySnapshot> _tailorsStream;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tailorsStream = FirebaseFirestore.instance.collection('shop').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
          onChanged: (value) {
            setState(() {
              _tailorsStream = FirebaseFirestore.instance
                  .collection('shop')
                  .where('city', isGreaterThanOrEqualTo: value)
                  .where('city', isLessThanOrEqualTo: value + '\uf8ff')
                  .snapshots();
            });
          },
        ),
        backgroundColor: AppColors.backGroundColor,
        elevation: 0,
      ),
      body: SizedBox(
        child: Expanded(
          child: StreamBuilder(
            stream: _tailorsStream,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else {
                List<dynamic> list = snapshot.data?.docs ?? [];
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return tailor_widget(
                      list[index]['imgUrl'],
                      list[index]['name'],
                      list[index]['deliveryName'],
                      list[index]['phone'],
                      list[index]['shop'],
                      list[index]['email'],
                      list[index]['rate'],
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

  // tailor_widget implementation remains the same



  tailor_widget(image, name, title, phone, location,email,rate) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage(image),
            ),
            title: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4),
                Text(
                  title.toString(),
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 16,
                      color: Colors.grey[700],
                    ),
                    SizedBox(width: 4),
                    Text(
                      phone.toString(),
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: Colors.grey[700],
                    ),
                    SizedBox(width: 4),
                    Text(
                      location.toString(),
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.price_change,
                      size: 16,
                      color: Colors.grey[700],
                    ),
                    SizedBox(width: 4),
                    Text(
                      rate.toString(),
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
               
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.to(MeasurementForm(email: email,rate: rate.toString()));
                      },
                      child: Text(
                        'Order',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.backGroundColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(ExpertScreen(
                          rate:rate.toString(),
                          email: email,
                          imageUrl: image,
                          name: name,
                          title: title,
                          phone: phone,
                          location: location,
                          description:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit...vnv jhvjkbkjnklnbkjbvgjhkvjkvjkblkbk',
                        ));
                      },
                      child: Text(
                        'Detail',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
