import 'package:get/get_connect.dart';
import 'package:scm_fe/app/constanta/function_global.dart';
import 'package:scm_fe/app/constanta/service_handler.dart';

import '../constanta/config_url.dart';
ServiceHandler serviceHandler=ServiceHandler();
class AuthService extends GetConnect{
  Future<dynamic> login(String username, String password) async {
    Map<String, String> body;
    if (getHive("idcompany")!=null){
      body={"username":username, "password": password,"idcompany":await encryptDataLocal(getHive("idcompany"))};
    }else{
      body={"username":username, "password": password};
    }
    return serviceHandler.fetchPostWithToken(ConfigURL.login,body);
  }
}