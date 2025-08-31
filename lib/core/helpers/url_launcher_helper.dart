import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper{

  static void launchWhatsappLink(String phoneNumber)async{
    final Uri url = Uri.parse("https://wa.me/${"+966$phoneNumber"}");
    if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
    }
  }

  static void callPhoneNumber(String phoneNumber)async{
    final Uri url = Uri.parse("tel:${"+966$phoneNumber"}");
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  static void openLink(String link)async{
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  static void shareLinkWithWhatsapp(String link)async{
    final url = Uri.parse('https://wa.me/?text=${Uri.encodeComponent(link)}');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  static void shareLinkWithX(String link) async {
    final url = Uri.parse('https://twitter.com/intent/tweet?text=${Uri.encodeComponent(link)}');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  static void openGoogleMap(String lat, String long) async {
    final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$long');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

}