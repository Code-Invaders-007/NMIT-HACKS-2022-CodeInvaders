import 'package:http/http.dart' as http;

void fetchData(String url) async {
  http.Response response =await http.get(Uri.parse(url));
}
