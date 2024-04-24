// ignore_for_file: non_constant_identifier_names

import '../../AppLink.dart';
import '../../Core/Class/Crud.dart';

class OrderData {
  Crud crud;
  OrderData(this.crud);
  select() async {
    var res = await crud.postRequest(AppLink.selectOrders, {});
    return res?.fold((l) => l, (r) => r);
  } postdata(String id) async {
    var res = await crud.postRequest(AppLink.orderDetails, {"id":id});
    return res?.fold((l) => l, (r) => r);
  }
   accept_delete(String id,st) async {
    var res = await crud.postRequest(AppLink.accepet_cancel, {"id":id,"st":st});
    return res?.fold((l) => l, (r) => r);
  }
  adddelivery(String id,st,de) async {
    var res = await crud.postRequest(AppLink.adddelivery, {"id":id,"st":st,"de":de});
    return res?.fold((l) => l, (r) => r);
  }
}
