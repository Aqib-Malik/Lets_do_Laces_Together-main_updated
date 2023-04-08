import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../auth_page.dart';

class SetUpYourShopScreen extends StatefulWidget {
  const SetUpYourShopScreen({Key? key}) : super(key: key);

  @override
  State<SetUpYourShopScreen> createState() => _SetUpYourShopScreenState();
}

enum SingingCharacter { ladies, gents, boths }

class _SetUpYourShopScreenState extends State<SetUpYourShopScreen> {
  bool checkedValue = true;
  bool checkedValue1 = false;
  bool checkedValue2 = false;
  SingingCharacter? _character = SingingCharacter.ladies;

  int _activeCurrentStep = 0;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  static const menuItems = <String>[
    'Gents',
    'Ladies',
    'Alteration',
    'Both',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();
  String _btn1SelectedVal = 'Gents';
  String? _btn2SelectedVal;
  late String _btn3SelectedVal;

  List<Step> stepList() => [
        //step 1
        Step(
          state:
              _activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 0,
          title: const Text('Shop\nAddress'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                'Shop Adrees',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.location_on)),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'City',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'City Name',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'State',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'State Name',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Country',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Pakistan',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Pin Code',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '*****',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        // step 2
        Step(
            state: _activeCurrentStep <= 1
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 1,
            title: const Text('Shop Detais'),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Shop Name',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Mobile No.',
                  style: TextStyle(fontSize: 16),
                ),
                Form(
                  key: formKey,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                          },
                          onInputValidated: (bool value) {
                            print(value);
                          },
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: TextStyle(color: Colors.black),
                          initialValue: number,
                          textFieldController: controller,
                          formatInput: false,
                          keyboardType: TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          // inputBorder: OutlineInputBorder(),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Email (Optional)',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Pakistan',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Webstie URL (Optional)',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Pakistan',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            )),

        // step 3
        Step(
            state: StepState.complete,
            isActive: _activeCurrentStep >= 2,
            title: const Text('Stitiching\n Done For'),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: const Text(
                    'Stitiching Don For',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: DropdownButton<String>(
                    // Must be one of items.value.
                    value: _btn1SelectedVal,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() => _btn1SelectedVal = newValue);
                      }
                    },
                    items: this._dropDownMenuItems,
                  ),
                ),
                const Text('Add Logo if you have',
                    style: TextStyle(fontSize: 18)),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 200.h,
                    width: 200.w,
                    child: Card(
                      elevation: 3,
                      color: Colors.grey.shade300,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 100,
                        color: Colors.blue.shade300,
                      ),
                    )),
                const Divider(),
                const Text('Add your Shop Image',
                    style: TextStyle(fontSize: 18)),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                        height: 150.h,
                        width: 150.w,
                        child: Card(
                          elevation: 3,
                          color: Colors.grey.shade300,
                          child: Icon(
                            Icons.camera_enhance_sharp,
                            size: 100,
                            color: Colors.blue.shade300,
                          ),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                        height: 150.h,
                        width: 150.w,
                        child: Card(
                          elevation: 3,
                          color: Colors.grey.shade300,
                          child: Icon(
                            Icons.camera_enhance_sharp,
                            size: 100,
                            color: Colors.blue.shade300,
                          ),
                        )),
                  ],
                )
              ],
            ))
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[300],
        title: const Text(
          'Set Up Your Shop',
          style: TextStyle(color: Colors.white),
        ),
      ),
      // Here we have initialized the stepper widget
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _activeCurrentStep,
        steps: stepList(),

        // onStepContinue takes us to the next step
        onStepContinue: () {
          if (_activeCurrentStep < (stepList().length - 1)) {
            setState(() {
              _activeCurrentStep += 1;
            });
          } else {
            print('created');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AuthPage()),
            );
          }
        },

        // onStepCancel takes us to the previous step
        onStepCancel: () {
          if (_activeCurrentStep == 0) {
            return;
          }

          setState(() {
            _activeCurrentStep -= 1;
          });
        },

        // onStepTap allows to directly click on the particular step we want
        onStepTapped: (int index) {
          setState(() {
            _activeCurrentStep = index;
          });
        },
      ),
    );
  }
}
