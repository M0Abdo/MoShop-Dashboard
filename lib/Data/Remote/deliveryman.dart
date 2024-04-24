import 'dart:io';

import '../../AppLink.dart';
import '../../Core/Class/Crud.dart';

class DeliveryManData {
  Crud crud;
  DeliveryManData(this.crud);
  select() async {
   
    var res = await crud.postRequest(AppLink.selectDeliveryMan, {});
    return res?.fold((l) => l, (r) => r);
  }
  add(String name,username,pass,phone,address,id,File file) async {
   
    var res = await crud.postfileRequest(AppLink.addDeliveryMan, {"name":name,"username":username,"pass":pass,"phone":phone,"address":address,"id":id},file);
    return res?.fold((l) => l, (r) => r);
  }
   delete(String id,img) async {
    var res = await crud.postRequest(AppLink.deleteDeliveryMan, {"id":id,"img":img});
    return res?.fold((l) => l, (r) => r);
  }
   updataImg(String name,username,pass,phone,address,id,man,oldimg, File file) async {
   
    var res = await crud.postfileRequest(AppLink.updataDeliveryMan, {"name":name,"username":username,"pass":pass,"phone":phone,"address":address,"id":id,"man":man,"oldimg":oldimg},file);
    return res?.fold((l) => l, (r) => r);
  }
  updata(String name,username,pass,phone,address,id,man,oldimg) async {
   
    var res = await crud.postRequest(AppLink.updataDeliveryMan, {"name":name,"username":username,"pass":pass,"phone":phone,"address":address,"id":id,"man":man,"oldimg":oldimg});
    return res?.fold((l) => l, (r) => r);
  }
   deteils(String id) async {
   
    var res = await crud.postRequest(AppLink.detailsDeliveryMan, {"id":id});
    return res?.fold((l) => l, (r) => r);
  }
}
