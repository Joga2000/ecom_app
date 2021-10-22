import 'package:http/http.dart' as http;

class Repository {
   String _baseUrl = 'http://ecomappjoga.x10.mx/api';

   httpGet(String api) async {
     return await http.get(_baseUrl + '/' + api);
   }
}