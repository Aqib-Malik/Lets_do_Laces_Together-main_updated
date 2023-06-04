import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lets_do_laces_together/Screens/Customer%20Panel/customer_signup.dart';
import 'package:lets_do_laces_together/Screens/Customer%20Panel/customer_login_new.dart';
import 'package:lets_do_laces_together/Screens/login_screen.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';

import '../Screens/Customer Panel/Custommer Nav Bar/custom_nav_bar.dart';
import '../Screens/Customer Panel/otp_view/otp.dart';
import '../Screens/Tailor Panel/tailor_home_view.dart';
import '../auth_page.dart';

class AuthController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );
  final _firebaseAuth = FirebaseAuth.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('shop');

  CollectionReference customer =
      FirebaseFirestore.instance.collection('customer');

  DatabaseReference ref = FirebaseDatabase.instance.ref('shopData');

  var isLoading = false.obs;
  var isObscurePass = true.obs;
  var isObscurePass1 = true.obs;

  List<int> selectedValue = [];
  void obscurePassword() {
    isObscurePass.value = !isObscurePass.value;
  }

  void obscurePassword1() {
    isObscurePass1.value = !isObscurePass1.value;
  }

  void addValue(int value) {
    selectedValue.add(value);
  }

  void removeValue(int value) {
    selectedValue.remove(value);
  }



//TODO: Customer login
  Future<void> Customerlogin(
    String? email,
    String? password,
    BuildContext context,
  ) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.backGroundColor,
          ),
        );
      },
      barrierDismissible: false,
    );

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email!,
        password: password!,
      )
          .then((value) {
        Navigator.of(context).pop();
        Get.to(() => CustommerBottomNavBar());
        Get.snackbar(
          'Congratulation',
          'Successfully Login',
          icon: const Icon(Icons.error, color: Colors.red),
          snackPosition: SnackPosition.TOP,
        );
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Failed ${e.code}',
        '${e.message}',
        icon: const Icon(Icons.error, color: Colors.red),
        snackPosition: SnackPosition.TOP,
      );
      Navigator.of(context).pop();
    }
  }









//TODO: Tailer login
  Future<void> login(
    String? email,
    String? password,
    BuildContext context,
  ) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.backGroundColor,
          ),
        );
      },
      barrierDismissible: false,
    );

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email!,
        password: password!,
      )
          .then((value) {
        Navigator.of(context).pop();
        Get.to(() => TailorHomeView());
        Get.snackbar(
          'Congratulation',
          'Successfully Login',
          icon: const Icon(Icons.error, color: Colors.red),
          snackPosition: SnackPosition.TOP,
        );
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Failed ${e.code}',
        '${e.message}',
        icon: const Icon(Icons.error, color: Colors.red),
        snackPosition: SnackPosition.TOP,
      );
      Navigator.of(context).pop();
    }
  }

  //TODO:Shop Register
  Future<void> addShop(
    String? shopName,
    String? fullName,
    String? email,
    String? city,
    String? shopAddress,
    String? deliveryName,
    String? deliveryPhone,
    String? phoneNumber,
    String? about,
    String? password,
    String? img,
    int? rate,
    BuildContext context,
  ) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.backGroundColor,
          ),
        );
      },
      barrierDismissible: false,
    );
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      )
          .then((value) {

        users.doc(FirebaseAuth.instance.currentUser!.email).set({
          'uid': FirebaseAuth.instance.currentUser!.uid,
          'shopName': shopName!,
          'name': fullName!,
          'email': email,
          'city': city,
          'shop': shopAddress,
          'deliveryName': deliveryName!,
          'deliveryPhone': deliveryPhone!,
          'phone': phoneNumber,
          'about': about,
          'password': password,
          'imgUrl': img,
          'rate':rate
        }).then((value) {
          Navigator.of(context).pop();
          print("shop add");
          Get.to(const LoginScreen());
          Get.snackbar(
            'Congratulation',
            'Successfully Register',
            icon: const Icon(Icons.notifications_active, color: Colors.red),
            snackPosition: SnackPosition.TOP,
          );
        });
      });
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      Get.snackbar(
        'Failed ${e.code}',
        '${e.message}',
        icon: const Icon(Icons.error, color: Colors.red),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  // //TODO:Shop Details Update
  // Future<void> updateShopDetails(
  //   String? fullName,
  //   String? city,
  //   String? shopAddress,
  //   String? phoneNumber,
  //   String? about,
  //   BuildContext context,
  // ) async {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return Center(
  //         child: CircularProgressIndicator(
  //           color: AppColors.backGroundColor,
  //         ),
  //       );
  //     },
  //     barrierDismissible: false,
  //   );
  //   try {
  //     //    users.doc(snapshot.data!.docs[index]['id'].toString()).update({});
  //     users.doc(FirebaseAuth.instance.currentUser!.uid).update({
  //       "uid": FirebaseAuth.instance.currentUser!.uid,
  //       'name': fullName!,
  //       'city': city,
  //       'shop': shopAddress,
  //       'phone': phoneNumber,
  //       'about': about,
  //     })
  //         // users.update({
  //         //   'uid': FirebaseAuth.instance.currentUser!.uid,
  //         //   'name': fullName!,
  //         //   'city': city,
  //         //   'shop': shopAddress,
  //         //   'phone': phoneNumber,
  //         //   'about': about,
  //         // })
  //         .then((value) {
  //       Navigator.of(context).pop();
  //       print("update");
  //       Get.back();
  //       Get.snackbar(
  //         'Congratulation',
  //         'Successfully Update',
  //         icon: const Icon(Icons.notifications_active, color: Colors.red),
  //         snackPosition: SnackPosition.TOP,
  //       );
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     Navigator.of(context).pop();
  //     Get.snackbar(
  //       'Failed ${e.code}',
  //       '${e.message}',
  //       icon: const Icon(Icons.error, color: Colors.red),
  //       snackPosition: SnackPosition.TOP,
  //     );
  //   }
  // }

  //TODO: shops data Realtime DataBase post
  Future<void> addShopDetails(
    String? title,
    String? price,
    String? description,
    String? category,
    String? shopName,
    String? shopAddress,
    String? city,
    String? shopNumber,
    String? deliveryName,
    String? deliveryPhone,
    String? tailerName,
    String? tailerPhone,
    String? img,
    BuildContext context,
  ) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(color: AppColors.backGroundColor),
        );
      },
      barrierDismissible: false,
    );
    try {
      final String id = DateTime.now().microsecondsSinceEpoch.toString();
      await FirebaseFirestore.instance.collection("Posts").doc(id).set({
        "id": id,
        "product_name": title!,
        "product_price": price!,
        "product_description": description!,
        "type": category!,
        "shopName": shopName!,
        "shopAddress": shopAddress!,
        "city": city!,
        "shopNumber": shopNumber!,
        "deliveryName": deliveryName!,
        "deliveryPhone": deliveryPhone!,
        "tailerName": tailerName!,
        "tailerPhone": tailerPhone!,
        "imgUrl": img!,
      })
      // await ref.child(id).set({
      //   "id": id,
      //   "product_name": title!,
      //   "product_price": price!,
      //   "product_description": description!,
      //   "type": category!,
      //   "shopName": shopName!,
      //   "shopAddress": shopAddress!,
      //   "city": city!,
      //   "shopNumber": shopNumber!,
      //   "deliveryName": deliveryName!,
      //   "deliveryPhone": deliveryPhone!,
      //   "tailerName": tailerName!,
      //   "tailerPhone": tailerPhone!,
      //   "imgUrl": img!,
      // })
      
      .then((value) {
        Navigator.of(context).pop();
        Get.snackbar(
          'Congregation',
          'Successfully Add',
          snackPosition: SnackPosition.TOP,
        );
        Get.offAll(() => TailorHomeView());
      });
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      Get.snackbar(
        'Failed ${e.code}',
        '${e.message}',
        icon: const Icon(Icons.error, color: Colors.red),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  //TODO:Customer Google SignUp
  Future<void> googleSignup(
    BuildContext context,
  ) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.backGroundColor,
          ),
        );
      },
      barrierDismissible: false,
    );
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );
      await FirebaseAuth.instance
          .signInWithCredential(authCredential)
          .then((value) {
        Navigator.of(context).pop();
        Get.offAll(CustommerBottomNavBar(
            // img: data.email,
            // name: data.email,
            // email: data.email,
            ));
        Get.snackbar(
          'Congratulation',
          'Successfully Register',
          icon: const Icon(Icons.error, color: Colors.red),
          snackPosition: SnackPosition.TOP,
        );
      });
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      Get.snackbar(
        'Failed ${e.code}',
        '${e.message}',
        icon: const Icon(Icons.error, color: Colors.red),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  //TODO: Tailer forgot password
  Future<void> forgotPassword(String? email, BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(color: AppColors.backGroundColor),
        );
      },
      barrierDismissible: false,
    );
    try {
      await _firebaseAuth
          .sendPasswordResetEmail(
        email: email!,
      )
          .then((value) {
        Navigator.of(context).pop();
        Get.back();
        Get.snackbar(
          'Message',
          'Check Your Email',
          icon: const Icon(Icons.notifications_active, color: Colors.red),
          snackPosition: SnackPosition.TOP,
        );
      });
    } on FirebaseException catch (e) {
      Get.snackbar(
        'Failed ${e.code}',
        '${e.message}',
        icon: const Icon(Icons.error, color: Colors.red),
        snackPosition: SnackPosition.TOP,
      );
      Navigator.of(context).pop();
    }
  }

  //TODO:shop logout
  Future<void> shopLogOut(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.backGroundColor,
          ),
        );
      },
      barrierDismissible: false,
    );
    await _firebaseAuth.signOut().then(
      (value) {
        Navigator.of(context).pop();
        Get.offAll(const AuthPage());
      },
    );
  }

  //TODO:Customer Phone Number login
  Future<void> phoneNumber(
    String? name,
    String? email,
    String? password,
    String? phoneNumber,
    String? address,
    String? img,
    BuildContext context,
  ) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.backGroundColor,
          ),
        );
      },
      barrierDismissible: false,
    );
    try {
      await FirebaseAuth.instance
          .verifyPhoneNumber(
              phoneNumber: "+92$phoneNumber",
              verificationCompleted: (_) {},
              verificationFailed: (e) {
                Get.snackbar(
                  'Failed ${e.code}',
                  '${e.message}',
                  icon: const Icon(Icons.error, color: Colors.red),
                  snackPosition: SnackPosition.TOP,
                );
              },
              codeSent: (String verificationId, int? token) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OTPView(
                          // email: email,
                          // password: password,
                              verificationID: verificationId,
                            )));
              },
              codeAutoRetrievalTimeout: (e) {
                Get.snackbar(
                  'Failed ${e.toString()}',
                  e.toString(),
                  icon: const Icon(Icons.error, color: Colors.red),
                  snackPosition: SnackPosition.TOP,
                );
              })
          .then((value) {
            FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!).whenComplete(() {
                   customer.doc(email).set({
          'uid': FirebaseAuth.instance.currentUser!.uid,
          'name': name!,
          'email': email!,
          'phone': phoneNumber!,
          'address': address!,
          'img': img!,
        });
       
            });
        Navigator.of(context).pop();
      });
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      Get.snackbar(
        'Failed ${e.code}',
        '${e.message}',
        icon: const Icon(Icons.error, color: Colors.red),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  //TODO:Customer Phone Number login Otp
  Future<void> oTP(
    String? otp,
    final String? verificationID,
    BuildContext context,
  ) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.backGroundColor,
          ),
        );
      },
      barrierDismissible: false,
    );
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationID.toString(), smsCode: otp.toString());
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
            // FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
               


        Navigator.of(context).pop();
        Get.offAll(CustomerLoginNew());
        Get.snackbar(
          'Congratulation',
          'Successfully Register',
          icon: const Icon(Icons.error, color: Colors.red),
          snackPosition: SnackPosition.TOP,
        );
      });
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      Get.snackbar(
        'Failed ${e.code}',
        '${e.message}',
        icon: const Icon(Icons.error, color: Colors.red),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  //TODO:Customer Google SignUp
  // Future<void> googleSignup(
  //   BuildContext context,
  // ) async {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return Center(
  //         child: CircularProgressIndicator(
  //           color: AppColors.backGroundColor,
  //         ),
  //       );
  //     },
  //     barrierDismissible: false,
  //   );
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await _googleSignIn.signIn();
  //     final GoogleSignInAuthentication? googleSignInAuthentication =
  //         await googleSignInAccount?.authentication;
  //     final AuthCredential authCredential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication?.accessToken,
  //       idToken: googleSignInAuthentication?.idToken,
  //     );
  //     await FirebaseAuth.instance
  //         .signInWithCredential(authCredential)
  //         .then((value) {
  //       Navigator.of(context).pop();
  //       Get.offAll(const CustommerBottomNavBar());
  //       Get.snackbar(
  //         'Congratulation',
  //         'Successfully Register',
  //         icon: const Icon(Icons.error, color: Colors.red),
  //         snackPosition: SnackPosition.TOP,
  //       );
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     Navigator.of(context).pop();
  //     Get.snackbar(
  //       'Failed ${e.code}',
  //       '${e.message}',
  //       icon: const Icon(Icons.error, color: Colors.red),
  //       snackPosition: SnackPosition.TOP,
  //     );
  //   }
  // }

  //TODO:Customer facebook
  Future<void> facebook(
    BuildContext context,
  ) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.backGroundColor,
          ),
        );
      },
      barrierDismissible: false,
    );
    try {
      await FacebookAuth.i
          .login(permissions: ['email', 'public_profile']).then((value) {
        Navigator.of(context).pop();
        Get.offAll(CustommerBottomNavBar());
        Get.snackbar(
          'Congratulation',
          'Successfully Register',
          icon: const Icon(Icons.error, color: Colors.red),
          snackPosition: SnackPosition.TOP,
        );
      });
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      Get.snackbar(
        'Failed ${e.code}',
        '${e.message}',
        icon: const Icon(Icons.error, color: Colors.red),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  ///Realtime DataBase Delete
  Future<void> realtimeDatabaseDelete(
    String id,
    BuildContext context,
  ) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      },
      barrierDismissible: false,
    );
    try {
      await ref.child(id).remove().then((value) {
        Navigator.of(context).pop();
        Get.snackbar(
          'Successfully delete',
          '',
          snackPosition: SnackPosition.TOP,
        );
      });
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      Get.snackbar(
        'Failed ${e.code}',
        '${e.message}',
        icon: const Icon(Icons.error, color: Colors.red),
        snackPosition: SnackPosition.TOP,
      );
    }
  }




  Future<bool> isDocumentExists(String collectionPath, String documentId) async {
  final documentSnapshot = await FirebaseFirestore.instance
      .collection(collectionPath)
      .doc(documentId)
      .get();
  return documentSnapshot.exists;
}
}
