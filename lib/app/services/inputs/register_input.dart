class RegisterInput{
  String name;
  String email;
  String password;
  String passwordConfirmation; 
  String alamat;
  String noTelp;
  String namaInstansi;
  String emailInstansi;

  RegisterInput({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.alamat,
    required this.noTelp,
    required this.emailInstansi,
    required this.namaInstansi
  });
}