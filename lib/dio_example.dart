import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DioExample extends StatelessWidget {
  DioExample({Key? key}) : super(key: key);
  //
  final dio = Dio();
  /* Dio is a powerful HTTP client for Flutter,
  which provides a clean and efficient API for making HTTP requests.
  Dio supports a variety of features, including automatic decoding of response data,
  interceptors for request and response processing, and support for canceling and resuming requests.*/
  void getHttp1() async {
    final response = await dio.get("https://reqres.in/api/users?page=2");
    debugPrint(response.data.toString());
    // print(response.statusCode);
  }

  void getHttp2() async {
    Response response = await dio.get(
      'https://reqres.in/api/users',
      queryParameters: {'page': 2},
    );
    debugPrint(response.data.toString());
    // print(response.statusCode);
  }

  void postHttp1() async {
    /*1 data sends data as a JSON payload in the request body, while FormData sends data in a multipart/form-data format.
      2 data is used for sending simple key-value pairs, while FormData is used for sending complex data such as files and binary data.
      3 When using FormData, you can set the Content-Type header to multipart/form-data by default, while with data you need to set
      the Content-Type header to application/json manually if you want to send JSON data.*/
    try {
      Response response;
      response = await dio.post(
        'https://spv-dev.dkv.global:8000/api/user/register/',
        data: {
          "email": "q@you.net",
          "first_name": "a",
          "last_name": "b",
          "password": "abcd"
        },
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      // print(response.statusCode);
      // print(response.data.toString());
    } catch (e) {
      // print('Error: $e');
      if (e is DioError) {
        // print('Response status: ${e.response?.statusCode}');
        // print('Response data: ${e.response?.data}');
      }
    }
    // try {
    //   String url = 'https://spv-dev.dkv.global:8000/api/user/register/';
    //   // Create a FormData object
    //   FormData formData = FormData.fromMap({
    //     'email': 'aq@you.net',
    //     'first_name': 'a',
    //     'last_name': 'b',
    //     'password': 'abcd',
    //   });
    //
    //   // Send the FormData in a POST request
    //   Response response = await dio.post(
    //     url,
    //     data: formData,
    //     options: Options(
    //       headers: {
    //         "Content-Type": "multipart/form-data",
    //       },
    //     ),
    //   );
    //
    //   // Print the response status code and data
    //   print(response.statusCode);
    //   print(response.data);
    // } catch (e) {
    //   print('Error: $e');
    //   if (e is DioError) {
    //     print('Response status: ${e.response?.statusCode}');
    //     print('Response data: ${e.response?.data}');
    //   }
    // }
  }

//Downloading a file:
  void down() async {
    Response response = await dio.download(
      'https://www.codetrade.io/',
      '${(await getTemporaryDirectory()).path}code.html',
    );
    debugPrint(response.data.toString());
    debugPrint(
      '${(await getTemporaryDirectory()).path}code.html',
    );
    // print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio_Example'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: getHttp1,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    "Get Data1",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: getHttp2,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    "Get Data2",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: postHttp1,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    "post Data1",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: down,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    "Download",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
