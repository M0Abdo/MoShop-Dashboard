
import '../../AppLink.dart';
import '../../Core/Class/Crud.dart';

class DeliveryCostData {
  Crud crud;
  DeliveryCostData(this.crud);
  select() async {
   
    var res = await crud.postRequest(AppLink.selectDeliveryCost, {});
    return res?.fold((l) => l, (r) => r);
  }
  add(String name, String  namear,cost) async {
   
    var res = await crud.postRequest(AppLink.addDeliveryCost, {"name":name,"namear":namear,"cost":cost});
    return res?.fold((l) => l, (r) => r);
  }
   delete(String id) async {
    var res = await crud.postRequest(AppLink.deleteDeliveryCost, {"id":id});
    return res?.fold((l) => l, (r) => r);
  }
  updata(String id, name,  namear, cost) async {
   
    var res = await crud.postRequest(AppLink.updataDeliveryCost, {"id":id,"name":name,"namear":namear,"cost":cost});
    return res?.fold((l) => l, (r) => r);
  }
}
