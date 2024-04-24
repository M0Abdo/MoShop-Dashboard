import 'dart:io';

import '../../AppLink.dart';
import '../../Core/Class/Crud.dart';

class CatagresData {
  Crud crud;
  CatagresData(this.crud);
  select() async {
    var res = await crud.postRequest(AppLink.selectCatagres, {});
    return res?.fold((l) => l, (r) => r);
  }
  add(String name, String  namear, File file) async {
   
    var res = await crud.postfileRequest(AppLink.addCatagres, {"name":name,"namear":namear},file);
    return res?.fold((l) => l, (r) => r);
  }
   delete(String id,img) async {
    var res = await crud.postRequest(AppLink.deleteCatagres, {"id":id,"img":img});
    return res?.fold((l) => l, (r) => r);
  }
   updataImg(String id, name,  namear, oldimg, File file) async {
   
    var res = await crud.postfileRequest(AppLink.updataCatagres, {"id":id,"name":name,"namear":namear,"oldimg":oldimg},file);
    return res?.fold((l) => l, (r) => r);
  }
  updata(String id, name,  namear, oldimg) async {
   
    var res = await crud.postRequest(AppLink.updataCatagres, {"id":id,"name":name,"namear":namear,"oldimg":oldimg});
    return res?.fold((l) => l, (r) => r);
  }
}
