
import '../../AppLink.dart';
import '../../Core/Class/Crud.dart';

class LogInData {
  Crud crud;
  LogInData(this.crud);
  postdata(String email,String pass) async {
    var res = await crud.postRequest(AppLink.login, {"email":email ,"pass":pass});
    return res?.fold((l) => l, (r) => r);
  }
 
}
