import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global/global.dart';
import '../res/size_confiq.dart';
import '../roaster/controller/riderProfileController.dart';
import '../utils/utils.dart';

class ProfileFragment extends StatefulWidget {
  ProfileFragment({super.key});

  @override
  State<ProfileFragment> createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  TextEditingController confirmNewPassword = TextEditingController();
  String firstName_ = "";
  TextEditingController newPassword = TextEditingController();

  Uint8List? _bytesImage;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setName();
  }

  Future<void> setName() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    firstName_ = sp.getString('firstName')!;
    var profileImage = await httpServices.getRiderProfileImage();
    /*  _bytesImage = convertBase64Image(profileImage.toString());

    if (_bytesImage != null && _bytesImage!.isNotEmpty) {
      setState(() {
        _bytesImage;
      });
      // _bytesImage is not null or empty, it should contain image data.
    } else {
      // _bytesImage is null or empty, handle this case.
    }*/
    setState(() {});
  }

  Future<Uint8List> convertBase64Image(String base64String) async {
    return await Base64Decoder().convert(base64String.split(',').last);
  }

  bool Validation() {
    if (newPassword.text.isEmpty || confirmNewPassword.text.isEmpty) {
      Utils.flushBarErrorMessage(
          'Please enter new password on both Fields', context);
      return false;
    } else if (confirmNewPassword.text.compareTo(confirmNewPassword.text) !=
        0) {
      Utils.flushBarErrorMessage('Both Passwords must match', context);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    String base64Image =
        "iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAIAAADTED8xAAADMElEQVR4nOzVwQnAIBQFQYXff81RUkQCOyDj1YOPnbXWPmeTRef+/3O/OyBjzh3CD95BfqICMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMO0TAAD//2Anhf4QtqobAAAAAElFTkSuQmCC";
    Uint8List bytes = base64Decode(base64Image);
    RiderProfileController riderProfileController = RiderProfileController();

    // TODO: implement build
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: const EdgeInsets.all(30),
        child: firstName_ == ''
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: <Widget>[
                  //CircleAvatar(
                  //radius: 100,
                  //backgroundImage: FileImage(File(userimg)),
                  //),
                  // backgroundImage: NetworkImage(
                  //   "https://firebasestorage.googleapis.com/v0/b/mechfinder-569f0.appspot.com/o/user_image%2F1NwOWL3qWdbpVvIoSPvGelMqZEy1.jpg?alt=media&token=e1ec2d51-2d2b-4cbf-a4da-30a67091844d",
                  // ),

                  // UserImagePicker(_pickedImage),
                  // SizedBox(
                  //   height: 20,
                  // ),

                  Center(
                    child: Stack(
                      children: <Widget>[
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.red,
                              width: SizeConfig.screenWidth * 0.02,
                            ),
                          ),
                          child: _bytesImage != null
                              ? CircleAvatar(
                                  // AssetImage('assets/drawable-xxhdpi/rsz_user.png'),
                                  backgroundImage:
                                      MemoryImage(_bytesImage!), //here
                                  // backgroundImage: _imageFile == null
                                  //     AssetImage('assets/fyp.png')
                                  //    : FileImage(File(userData.image)),
                                  radius: 70.0,
                                )
                              : CircleAvatar(
                                  backgroundImage: MemoryImage(bytes),

                                  // backgroundImage: NetworkImage(
                                  //   "https://firebasestorage.googleapis.com/v0/b/mechfinder-569f0.appspot.com/o/user_image%2F1NwOWL3qWdbpVvIoSPvGelMqZEy1.jpg?alt=media&token=e1ec2d51-2d2b-4cbf-a4da-30a67091844d",
                                  // ),
                                  // backgroundImage: AssetImage(
                                  //     'assets/drawable-xxhdpi/rsz_user.png'),

                                  // backgroundImage: _imageFile == null
                                  //     AssetImage('assets/fyp.png')
                                  //    : FileImage(File(userData.image)),
                                  radius: 70.0,
                                ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.email,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth * 0.01,
                          ),
                          Text(
                            'User Name : $firstName_',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(18.0),
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.02,
                      ),
                    ],
                  ),
                  Divider(
                    height: SizeConfig.screenHeight * 0.060,
                    color: Colors.orange[800],
                  ),
                  // SizedBox(
                  //   height: SizeConfig.screenHeight ,
                  // ),
                  Text(
                    'Edit your Profile',
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(18.0),
                        fontWeight: FontWeight.bold),
                  ),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: newPassword,
                          obscureText: true,
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.red,
                              ),
                              hintText: 'New Password',
                              hintStyle: TextStyle(color: Colors.red)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        TextFormField(
                          controller: confirmNewPassword,
                          obscureText: true,
                          validator: (val) {
                            if (val != newPassword.text) {
                              return "Password does not match";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.red,
                              ),
                              hintText: 'Re-type New Password',
                              hintStyle: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),

                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(SizeConfig.screenWidth * 0.3, 0),
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text(
                          "Update",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate() &&
                              Validation()) {
                            httpServices.updateRiderPassword(
                                newPassword.text, context);
                          }
                        }),
                  ),
                ],
              ),
      )),
    );
  }
}
