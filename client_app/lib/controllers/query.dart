import 'package:url_launcher/url_launcher.dart';


Future<String> contactMail(String content) async{
   String message = Uri.encodeComponent(content);
  String email = "syed21ad067@rmkcet.ac.in";
    String subject = Uri.encodeComponent("User Inquiry");
    String body = Uri.encodeComponent("Hello, I couldn't reach you on WhatsApp. Here's my message:\n\n$message");
    String emailUrl = "mailto:$email?subject=$subject&body=$body";

    if (await canLaunchUrl(Uri.parse(emailUrl))) {
      await launchUrl(Uri.parse(emailUrl), mode: LaunchMode.externalApplication);
      return "sent mail";
    }
    else{
      return "error";
    }
}


 
Future<String> contactWhatsapp(String content) async{
  String phone = "7397423656";
  String message = Uri.encodeComponent(content);
  String whatsappUrl = "https://wa.me/$phone?text=$message";

  if (await canLaunchUrl(Uri.parse(whatsappUrl))){
    await launchUrl(Uri.parse(whatsappUrl), mode: LaunchMode.externalApplication);
    return "sent whatsapp";
  }
  else{
    return "error";

  }

}