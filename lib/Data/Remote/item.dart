import 'dart:io';

import '../../AppLink.dart';
import '../../Core/Class/Crud.dart';

class ItemData {
  Crud crud;
  ItemData(this.crud);
  select() async {
    var res = await crud.postRequest(AppLink.selectItem, {});
    return res?.fold((l) => l, (r) => r);
  }
   firstdetails() async {
    var res = await crud.postRequest(AppLink.firstdetailsItem, {});
    return res?.fold((l) => l, (r) => r);
  }
   firstadd() async {
    var res = await crud.postRequest(AppLink.firstaddItem, {});
    return res?.fold((l) => l, (r) => r);
  }
    add(String name,String namear,String brand,String brandar,String des,String desar, String price,String discount,String count,String cat, File file) async {
   
    var res = await crud.postfileRequest(AppLink.addItem, {"name":name,"namear":namear,"brand":brand,"brandar":brandar,"des":des,"desar":desar,"price":price,"discount":discount,"count":count,"cat":cat},file);
    return res?.fold((l) => l, (r) => r);
  }
   editeImg(String id, String name,String namear,String brand,String brandar,String des,String desar, String price,String discount,String count,String cat,String old, File file) async {
   
    var res = await crud.postfileRequest(AppLink.updataItem, {"id":id,"name":name,"namear":namear,"brand":brand,"brandar":brandar,"des":des,"desar":desar,"price":price,"discount":discount,"count":count,"cat":cat,"old":old},file);
    return res?.fold((l) => l, (r) => r);
  }
   edite(String id, String name,String namear,String brand,String brandar,String des,String desar, String price,String discount,String count,String cat,String old,) async {
   
    var res = await crud.postRequest(AppLink.updataItem, {"id":id,"name":name,"namear":namear,"brand":brand,"brandar":brandar,"des":des,"desar":desar,"price":price,"discount":discount,"count":count,"cat":cat,"old":old});
    return res?.fold((l) => l, (r) => r);
  }
   addimageItem(String id, File file) async {
   
    var res = await crud.postfileRequest(AppLink.addimageItem, {"id":id},file);
    return res?.fold((l) => l, (r) => r);
  }
    addDetailsImg(String title,String titlear,String sub,String subar,String id,String old, File file) async {
   
    var res = await crud.postfileRequest(AppLink.adddetailsItem, {"title":title,"titlear":titlear,"sub":sub,"subar":subar,"id":id,"old":old},file);
    return res?.fold((l) => l, (r) => r);
  }
  addDetails(String title,String titlear,String sub,String subar,String id,String old) async {
   
    var res = await crud.postRequest(AppLink.adddetailsItem, {"title":title,"titlear":titlear,"sub":sub,"subar":subar,"id":id,"old":old});
    return res?.fold((l) => l, (r) => r);
  }
   delete(String id,String img) async {
    var res = await crud.postRequest(AppLink.deleteItem, {"id":id,"img":img});
    return res?.fold((l) => l, (r) => r);
  }
   deleteImg(String id,String img) async {
    var res = await crud.postRequest(AppLink.deleteImgItem, {"id":id,"img":img});
    return res?.fold((l) => l, (r) => r);
  }
  deletedetails(String id) async {
    var res = await crud.postRequest(AppLink.deletedetailsItem, {"id":id});
    return res?.fold((l) => l, (r) => r);
  }
   getDateFormBack(String filter) async {
    var res = await crud.postRequest(AppLink.detailsItem, {"id": filter});
    return res?.fold((l) => l, (r) => r);
  }
   active(String filter,String user) async {
    var res = await crud.postRequest(AppLink.activeItem, {"id": filter,"st":user});
    return res?.fold((l) => l, (r) => r);
  }
}

