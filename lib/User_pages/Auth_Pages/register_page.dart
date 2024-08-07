import 'package:provider/provider.dart';
import 'package:keralatour/Controller/user_controller.dart';
import 'package:keralatour/User_pages/Auth_Pages/login_page.dart';
import 'package:keralatour/Widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keralatour/Widgets/pallete.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool checkedValue = false;
  List textfieldsStrings = [
    "", // firstName
    "", // lastName
    "", // email
    "", // password
    "", // confirmPassword
    "Male", // sex
    "", // age
    "Select Country", // country
    "", // currentYear
  ];
  final _firstnamekey = GlobalKey<FormState>();
  final _lastNamekey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _confirmPasswordKey = GlobalKey<FormState>();
  final _sexKey = GlobalKey<FormState>();
  final _ageKey = GlobalKey<FormState>();
  final _countryKey = GlobalKey<FormState>();
  final _currentYearKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  final TextEditingController _lastController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _currentYearController = TextEditingController();

  DateTime selectedYear = DateTime.now();

  List<String> countries = [
    "Select Country",
    "United States",
    "India",
    "Canada",
    "Australia",
    "Germany",
    "France",
    "China",
    "Japan",
    "South Korea",
    // Add more countries as needed
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: isDarkMode ? const Color(0xff151f2c) : Colors.white,
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 200,
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sign ',
                            style: GoogleFonts.poppins(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontSize: size.height * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'up',
                            style: GoogleFonts.poppins(
                              color: Pallete.green,
                              fontSize: size.height * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.015),
                        child: Align(
                          child: Text(
                            'Create an Account',
                            style: GoogleFonts.poppins(
                              color: isDarkMode
                                  ? Colors.white
                                  : const Color(0xff1D1617),
                              fontSize: size.height * 0.025,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                      ),
                      buildTextField(
                        "First Name",
                        Icons.person_outlined,
                        false,
                        size,
                        (valuename) {
                          if (valuename.length <= 2) {
                            buildSnackError(
                              'Invalid Name',
                              context,
                              size,
                            );
                            return '';
                          }
                          if (!RegExp(r"^[a-zA-Z]").hasMatch(valuename)) {
                            buildSnackError(
                              'Invalid Name',
                              context,
                              size,
                            );
                            return '';
                          }
                          return null;
                        },
                        _firstnamekey,
                        0,
                        _nameController,
                        isDarkMode,
                      ),
                      buildTextField(
                        "Last Name",
                        Icons.person_outlined,
                        false,
                        size,
                        (valuesurname) {
                          if (valuesurname.length <= 2) {
                            buildSnackError(
                              'Invalid last name',
                              context,
                              size,
                            );
                            return '';
                          }
                          if (!RegExp(r"^[a-zA-Z]").hasMatch(valuesurname)) {
                            buildSnackError(
                              'Invalid last name',
                              context,
                              size,
                            );
                            return '';
                          }
                          return null;
                        },
                        _lastNamekey,
                        1,
                        _lastController,
                        isDarkMode,
                      ),
                      Form(
                        child: buildTextField(
                          "Email",
                          Icons.email_outlined,
                          false,
                          size,
                          (valuemail) {
                            if (valuemail.length < 5) {
                              buildSnackError(
                                'Invalid email',
                                context,
                                size,
                              );
                              return '';
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                                .hasMatch(valuemail)) {
                              buildSnackError(
                                'Invalid email',
                                context,
                                size,
                              );
                              return '';
                            }
                            return null;
                          },
                          _emailKey,
                          2,
                          _emailController,
                          isDarkMode,
                        ),
                      ),
                      Form(
                        child: buildTextField(
                          "Password",
                          Icons.lock_outline,
                          true,
                          size,
                          (valuepassword) {
                            if (valuepassword.length < 6) {
                              buildSnackError(
                                'Invalid password',
                                context,
                                size,
                              );
                              return '';
                            }
                            return null;
                          },
                          _passwordKey,
                          3,
                          _passwordController,
                          isDarkMode,
                        ),
                      ),
                      Form(
                        child: buildTextField(
                          "Confirm Password",
                          Icons.lock_outline,
                          true,
                          size,
                          (valuepassword) {
                            if (valuepassword != textfieldsStrings[3]) {
                              buildSnackError(
                                'Passwords must match',
                                context,
                                size,
                              );
                              return '';
                            }
                            return null;
                          },
                          _confirmPasswordKey,
                          4,
                          _confirmpasswordController,
                          isDarkMode,
                        ),
                      ),
                      buildDropdownField(
                        "Sex",
                        Icons.person_outline,
                        size,
                        ["Male", "Female", "Other"],
                        _sexKey,
                        5,
                        _sexController,
                        isDarkMode,
                      ),
                      buildTextField(
                        "Age",
                        Icons.calendar_today_outlined,
                        false,
                        size,
                        (valueage) {
                          if (valueage.isEmpty ||
                              int.tryParse(valueage) == null) {
                            buildSnackError(
                              'Invalid age',
                              context,
                              size,
                            );
                            return '';
                          }
                          return null;
                        },
                        _ageKey,
                        6,
                        _ageController,
                        isDarkMode,
                      ),
                      buildDropdownField(
                        "Country",
                        Icons.public_outlined,
                        size,
                        countries,
                        _countryKey,
                        7,
                        _countryController,
                        isDarkMode,
                      ),
                      buildYearPickerField(
                        "Current Year",
                        Icons.calendar_today_outlined,
                        size,
                        _currentYearKey,
                        8,
                        _currentYearController,
                        isDarkMode,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.015,
                          vertical: size.height * 0.01,
                        ),
                        child: CheckboxListTile(
                          title: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "By creating an account, you agree to our ",
                                  style: TextStyle(
                                    color: const Color(0xffADA4A5),
                                    fontSize: size.height * 0.015,
                                  ),
                                ),
                                WidgetSpan(
                                  child: InkWell(
                                    onTap: () {
                                      // ignore: avoid_print
                                      print('Conditions of Use');
                                    },
                                    child: Text(
                                      "Conditions of Use",
                                      style: TextStyle(
                                        color: const Color(0xffADA4A5),
                                        decoration: TextDecoration.underline,
                                        fontSize: size.height * 0.015,
                                      ),
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: " and ",
                                  style: TextStyle(
                                    color: const Color(0xffADA4A5),
                                    fontSize: size.height * 0.015,
                                  ),
                                ),
                                WidgetSpan(
                                  child: InkWell(
                                    onTap: () {
                                      // ignore: avoid_print
                                      print('Privacy Notice');
                                    },
                                    child: Text(
                                      "Privacy Notice",
                                      style: TextStyle(
                                        color: const Color(0xffADA4A5),
                                        decoration: TextDecoration.underline,
                                        fontSize: size.height * 0.015,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          activeColor: Pallete.green,
                          value: checkedValue,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.only(top: size.height * 0.015),
                        child: ButtonWidget(
                          text: "Register",
                          backColor: isDarkMode
                              ? [
                                  Colors.black,
                                  Colors.black,
                                ]
                              : const [Pallete.green, Pallete.green],
                          textColor: const [
                            Colors.white,
                            Colors.white,
                          ],
                          onPressed: () async {
                            if (_firstnamekey.currentState!.validate() &&
                                _lastNamekey.currentState!.validate() &&
                                _emailKey.currentState!.validate() &&
                                _passwordKey.currentState!.validate() &&
                                _confirmPasswordKey.currentState!.validate() &&
                                _sexKey.currentState!.validate() &&
                                _ageKey.currentState!.validate() &&
                                _countryKey.currentState!.validate() &&
                                _currentYearKey.currentState!.validate()) {
                              if (checkedValue == false) {
                                buildSnackError(
                                  'Accept our Privacy Policy and Term Of Use',
                                  context,
                                  size,
                                );
                              } else {
                                Provider.of<UserProvider>(context,
                                        listen: false)
                                    .userRegistration(
                                  email: _emailController.text,
                                  name: _nameController.text,
                                  lastName: _lastController.text,
                                  password: _passwordController.text,
                                  sex: _sexController.text,
                                  age: _ageController.text,
                                  country: _countryController.text,
                                  currentYear: _currentYearController.text,
                                  context: context,
                                );
                              }
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(
                                  color: isDarkMode
                                      ? Colors.white
                                      : const Color(0xff1D1617),
                                  fontSize: size.height * 0.018,
                                ),
                              ),
                              WidgetSpan(
                                child: InkWell(
                                  onTap: () => setState(() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginPage(),
                                      ),
                                    );
                                  }),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      foreground: Paint()
                                        ..shader = const LinearGradient(
                                          colors: <Color>[
                                            Color(0xffEEA4CE),
                                            Color(0xffC58BF2),
                                          ],
                                        ).createShader(
                                          const Rect.fromLTWH(
                                            0.0,
                                            0.0,
                                            200.0,
                                            70.0,
                                          ),
                                        ),
                                      fontSize: size.height * 0.018,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool pwVisible = false;

  Widget buildTextField(
    String hintText,
    IconData icon,
    bool password,
    Size size,
    FormFieldValidator validator,
    Key key,
    int stringToEdit,
    TextEditingController controller,
    bool isDarkMode,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.025),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.09,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black : const Color(0xffF7F8F8),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Form(
            key: key,
            child: TextFormField(
              controller: controller,
              style: TextStyle(
                  color: isDarkMode ? const Color(0xffADA4A5) : Colors.black),
              onChanged: (value) {
                setState(() {
                  textfieldsStrings[stringToEdit] = value;
                });
              },
              validator: validator,
              textInputAction: TextInputAction.next,
              obscureText: password ? !pwVisible : false,
              decoration: InputDecoration(
                errorStyle: const TextStyle(height: 0),
                hintStyle: const TextStyle(
                  color: Color(0xffADA4A5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Pallete.green,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Pallete.borderColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Pallete.green,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.only(
                  top: size.height * 0.012,
                ),
                hintText: hintText,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.005,
                  ),
                  child: Icon(
                    icon,
                    color: const Color(0xff7B6F72),
                  ),
                ),
                suffixIcon: password
                    ? Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.005,
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              pwVisible = !pwVisible;
                            });
                          },
                          child: pwVisible
                              ? const Icon(
                                  Icons.visibility_off_outlined,
                                  color: Color.fromARGB(255, 80, 72, 72),
                                )
                              : const Icon(
                                  Icons.visibility_outlined,
                                  color: Color.fromARGB(255, 80, 72, 72),
                                ),
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDropdownField(
    String hintText,
    IconData icon,
    Size size,
    List<String> options,
    Key key,
    int stringToEdit,
    TextEditingController controller,
    bool isDarkMode,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.025),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.09,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black : const Color(0xffF7F8F8),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Form(
            key: key,
            child: DropdownButtonFormField<String>(
              value: textfieldsStrings[stringToEdit],
              icon: Icon(icon, color: const Color(0xff7B6F72)),
              style: TextStyle(
                color: isDarkMode ? const Color(0xffADA4A5) : Colors.black,
              ),
              decoration: InputDecoration(
                errorStyle: const TextStyle(height: 0),
                hintStyle: const TextStyle(
                  color: Color(0xffADA4A5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Pallete.green,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Pallete.borderColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Pallete.green,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.only(
                  top: size.height * 0.012,
                ),
                hintText: hintText,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.005,
                  ),
                  child: Icon(
                    icon,
                    color: const Color(0xff7B6F72),
                  ),
                ),
              ),
              onChanged: (String? newValue) {
                setState(() {
                  textfieldsStrings[stringToEdit] = newValue!;
                });
              },
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildYearPickerField(
    String hintText,
    IconData icon,
    Size size,
    Key key,
    int stringToEdit,
    TextEditingController controller,
    bool isDarkMode,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.025),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.09,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black : const Color(0xffF7F8F8),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Form(
            key: key,
            child: TextFormField(
              controller: controller,
              readOnly: true,
              style: TextStyle(
                color: isDarkMode ? const Color(0xffADA4A5) : Colors.black,
              ),
              decoration: InputDecoration(
                errorStyle: const TextStyle(height: 0),
                hintStyle: const TextStyle(
                  color: Color(0xffADA4A5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Pallete.green,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Pallete.borderColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Pallete.green,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.only(
                  top: size.height * 0.012,
                ),
                hintText: hintText,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.005,
                  ),
                  child: Icon(
                    icon,
                    color: const Color(0xff7B6F72),
                  ),
                ),
              ),
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedYear,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.dark(),
                      child: child!,
                    );
                  },
                );
                if (picked != null && picked != selectedYear) {
                  setState(() {
                    selectedYear = picked;
                    textfieldsStrings[stringToEdit] =
                        DateFormat('yyyy').format(selectedYear);
                    controller.text = textfieldsStrings[stringToEdit];
                  });
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  void buildSnackError(String text, BuildContext context, Size size) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          height: size.height * 0.06,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
