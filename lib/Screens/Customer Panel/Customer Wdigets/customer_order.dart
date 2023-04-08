import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerOrder extends StatefulWidget {
  const CustomerOrder({Key? key}) : super(key: key);

  @override
  State<CustomerOrder> createState() => _CustomerOrderState();
}

class _CustomerOrderState extends State<CustomerOrder> {
  _launchWhatsApp() async {
    const phoneNumber = '03319936207';
    const message = 'Hello, this is a pre-filled message from my Flutter app';
    const url = 'whatsapp://send?phone=$phoneNumber&text=$message';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffff5ebeb),
                      border: Border.all(
                        width: 1,
                      ),
                    ),
                    height: 60,
                    width: 60,
                    child: Image.network(
                      'https://images.pexels.com/photos/3764119/pexels-photo-3764119.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Tooba',
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Your Dress is ready',
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        '1 Blouse, 2 Dress',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  GestureDetector(
                    onTap: _launchWhatsApp,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.chat,
                        color: AppColors.backGroundColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 40.h,
              width: 310.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.backGroundColor,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Icon(Icons.access_time),
                  SizedBox(
                    width: 5.w,
                  ),
                  const Text(
                    'Delivery on 22 May 2022',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
