
import '../../AppLink.dart';
import '../../Core/Class/Crud.dart';

class DashboardData {
  Crud crud;
  DashboardData(this.crud);
  select() async {
    var res = await crud.postData(AppLink.selectDashboard,{});
    return res.fold((l) => l, (r) => r);
  }
 
}
