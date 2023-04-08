class OrderPendingModel{
  String? orderNum,img,item,itemName,date,amount,name,daysLeft;
  OrderPendingModel({this.orderNum,this.img,this.item,this.date,this.name,this.amount,this.itemName,required this.daysLeft});

}

class PendingDataController{
  List<OrderPendingModel> PendingData = [
    OrderPendingModel(name:'Dr Tooba',img:'assets/images/TailorImages/DressShirt.png',orderNum:'#6849',item:'1',itemName:'Dress Shirt',date:'5th Jan 2023',amount:"1000",daysLeft:'5'),

  ];
}
