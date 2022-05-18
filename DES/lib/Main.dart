import 'DES.dart';

void main(List<String> args) {
  String message = "It is secure";
  String key = "AABB09182736CCDD";

  DES des = new DES();
  des.process(message, key, DES.ENCRYPT);
  print("The message: '${message}' has been encrypted to => ${des.getEncryptedText()}");

  des.process(des.getEncryptedText(), key, DES.DECRYPT);
  print("The message: '${des.getEncryptedText()}' has been decrypted to => ${des.getDecryptedText()}");

}
