import 'dart:convert';

import 'package:qrcode/student%20pending%20payment/model.dart';
import 'package:http/http.dart' as http;



Future<Stdpendingpaymentsmodel?> stdpendingpaymnetsjson() async {
  final resp = await http
      .post(Uri.parse(Api.baseurl + Api.stdpendingpayments), headers: {
    Api.mainapikey: "a4ea4994898731bc696707376fba9c2e",
  }, body: {
    Api.stdid: "1"
  });
  // final response = await http.get(Uri.parse(Api.baseurl +
  //     'accountant_login?email=accountant@erisn.com&password=Admin@123'));
  if (resp.statusCode == 200) {
    print('dfgfhghjghjghg$resp');
    final decoded = jsonDecode(resp.body);
    // print(resp.body);

    return Stdpendingpaymentsmodel.fromJson(json.decode(resp.body));
  } else {
    throw Exception('Failed to load data');
  }
}














class Api {
  static const baseurl = "https://demo.blackboard.com.np/api/Accountant_api/";
  static const paymenthisurl = 'payments_by_date';
  static const accprofileurl = 'accountant_details';
  static const scanstdinfo = 'student_info';
  static const allpayments = "all_payments";
  static const scanid = "student_app_id";
  static const mainapikey = "x-api-key";
  static const stdpaymenhist = "payment_history";
  static const searchstudents = "search_students";
  static const stdpendingpayments = "pending_payments";
  static const course_id = "course_id";
  static const section_id = "section_id";
  static const stdid = "student_id";
  static const searchstdsection = "search_students_section";
  static const Searchstdresult = "search_student_result";
  static const studentname = "student_name";
}