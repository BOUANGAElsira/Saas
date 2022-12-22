import 'package:flutter/material.dart';
import 'package:notice_2_parents/Auth/Verification.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:animate_do/animate_do.dart';
import 'package:notice_2_parents/Auth/login_page.dart';

class Forgot_page extends StatefulWidget {
  const Forgot_page({super.key});

  @override
  State<Forgot_page> createState() => _Forgot_pageState();
}

class _Forgot_pageState extends State<Forgot_page> {
  bool _isLoading = false;
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'TG';
  PhoneNumber number = PhoneNumber(isoCode: 'TG');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(245, 245, 245, 220),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                FadeInDown(
                  child: Text(
                    'Reset your password',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.brown),
                  ),
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 200),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20),
                    child: Text(
                      'Enter your phone number to continu, we will send you OTP to verifiy.',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade700),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 400),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black.withOpacity(0.13)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffeeeeee),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
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
                          maxLength: 8,
                          keyboardType: TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          cursorColor: Colors.black,
                          inputDecoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(bottom: 15, left: 0),
                            border: InputBorder.none,
                            hintText: 'Phone number',
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                        ),
                        Positioned(
                          left: 90,
                          top: 8,
                          bottom: 8,
                          child: Container(
                            height: 40,
                            width: 1,
                            color: Colors.black.withOpacity(0.13),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 600),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    onPressed: () {
                      setState(() {
                        _isLoading = true;
                      });

                      Future.delayed(Duration(seconds: 2), () {
                        setState(() {
                          _isLoading = false;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Verification()));
                      });
                    },
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: _isLoading
                        ? Container(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.brown,
                              color: Colors.brown,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            "Request OTP",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 800),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: bouttonAppuyer,
                        child: Text(
                          '',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void bouttonAppuyer() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login_page()),
    );
  }
}
