import 'package:url_launcher/url_launcher.dart';

Future<void> openLink(String action, List<String> urls) async {
  final Uri uri = Uri.parse(urls[0]);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {}
}
