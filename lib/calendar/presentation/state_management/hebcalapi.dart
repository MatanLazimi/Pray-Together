import 'package:http/http.dart' as http;

Future<http.Response> fetchPost() {
  return http.get(Uri.parse(
      'https://www.hebcal.com/hebcal?v=1&cfg=json&maj=on&min=on&mod=on&nx=on&year=now&month=x&ss=on&mf=on&c=on&geo=geoname&geonameid=3448439&m=50&s=on'));
}
