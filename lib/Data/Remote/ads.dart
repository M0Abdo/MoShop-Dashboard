import 'dart:io';

import '../../AppLink.dart';
import '../../Core/Class/Crud.dart';

class AdsData {
  Crud crud;
  AdsData(this.crud);
  select() async {
   
    var res = await crud.postRequest(AppLink.selectAds, {});
    return res?.fold((l) => l, (r) => r);
  }
  add(String title,titlear,content,contentar,item, File file) async {
   
    var res = await crud.postfileRequest(AppLink.addAds, {"title":title,"titlear":titlear,"content":content,"contentar":contentar,"item":item},file);
    return res?.fold((l) => l, (r) => r);
  }
   delete(String id,img) async {
    var res = await crud.postRequest(AppLink.deleteAds, {"id":id,"img":img});
    return res?.fold((l) => l, (r) => r);
  }
   updataImg(String id, title,titlear,content,contentar,item, oldimg, File file) async {
   
    var res = await crud.postfileRequest(AppLink.updataAds, {"id":id,"title":title,"titlear":titlear,"content":content,"contentar":contentar,"item":item,"oldimg":oldimg},file);
    return res?.fold((l) => l, (r) => r);
  }
  updata(String id,title,titlear,content,contentar,item, oldimg) async {
   
    var res = await crud.postRequest(AppLink.updataAds, {"id":id,"title":title,"titlear":titlear,"content":content,"contentar":contentar,"item":item,"oldimg":oldimg});
    return res?.fold((l) => l, (r) => r);
  }
   items() async {
   
    var res = await crud.postRequest(AppLink.itemsAds, {});
    return res?.fold((l) => l, (r) => r);
  }
}
