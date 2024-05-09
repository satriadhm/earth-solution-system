import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/auth/register_service.dart';
import '../../../services/inputs/register_input.dart';

class RegisterController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();
  TextEditingController emailInstansiController = TextEditingController();
  TextEditingController namaInstansiController = TextEditingController();
  String email = '';
  String password = '';
  String confirmPassword = '';
  String nama = '';
  String alamat = '';
  String noTelp = '';
  String emailInstansi = '';
  String namaInstansi = '';

  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();


  void register() async {
    RegisterInput registerInput = RegisterInput(
      name: nama,
      email: email,
      password: password,
      passwordConfirmation: confirmPassword,
      alamat: alamat,
      noTelp: noTelp,
      emailInstansi: emailInstansi,
      namaInstansi: namaInstansi
    );

    Future<bool> isRegistered = RegisterService().registerWithEmailAndPassword(registerInput.email, registerInput.password);
    if (await isRegistered) {
      RegisterService().updateUserData(registerInput.name, registerInput.alamat, registerInput.noTelp, registerInput.namaInstansi, registerInput.emailInstansi);
      Get.snackbar('Register Success', 'Register Success');
      clearForm();
    } else {
      Get.snackbar('Register Failed', 'Register Failed');
    }
    
  }

  void clearForm (){
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    namaController.clear();
    alamatController.clear();
    noTelpController.clear();
    emailInstansiController.clear();
    namaInstansiController.clear();
  }
  
}
