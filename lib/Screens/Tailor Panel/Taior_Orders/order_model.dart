class OrderRequestModel{
  String? orderNum,img,item,itemName,date,amount,name;
   OrderRequestModel({this.orderNum,this.img,this.item,this.date,this.name,this.amount,this.itemName});

}

class DataController{
  List<OrderRequestModel> modelData = [
    OrderRequestModel(name:'Aneeqa',img:'assets/images/TailorImages/DressShirt.png',orderNum:'#6849',item:'1',itemName:'Dress Shirt',date:'5th Jan 2023',amount:"1000"),
    OrderRequestModel(name:'Rasheed',img:'assets/images/TailorImages/Frock.png',orderNum:'#4849',item:'3',itemName:'Frock',date:'6th Jan 2023',amount:"999"),
    OrderRequestModel(name:'Tooba',img:'assets/images/TailorImages/ThreePieaceSuit.png',orderNum:'#6749',item:'1',itemName:'Three Pieace Suit',date:'10th Jan 2023',amount:"1000"),


  ];
}