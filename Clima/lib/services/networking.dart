import 'package:http/http.dart' as http;//we are using http.dart package to make API request
//it is downloaded from pub.dev - named http made by flutter team
import 'dart:convert'; //this package is required to convert json to string

//In this file we are fetching data through the url passes to it
class NetworkHelper{

  final Uri url;
  NetworkHelper({required this.url});

  dynamic getData() async{
    http.Response response = await http.get(url);
    //get method take a Uri type data so we have to convert api address into a Uri type using Uri.parse
    var decodedData = jsonDecode(response.body); //the response/json is stored in response body

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      print(response.statusCode);
    }
  }
}