
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medom/constants.dart';
import 'package:medom/models/hospital.dart';

class StoreAndGet {

    static CollectionReference firestoreCOll;

  addHospital(Hospital hospital) {
    firestoreCOll.add({
      kname: hospital.name,
      kabrv: hospital.abrv,
      kemailName: hospital.emailName,
      knbrplaces : hospital.nbrPbaces,
      knbrMedecin : hospital.nbrMedecins,

    });
  }

static  Future<List<Hospital>> loadHospitals() async{
    List<Hospital> hospitals =[];
    print('************************');
    print(firestoreCOll.toString());
    Hospital hop ;
    firestoreCOll.get()
       .then((QuerySnapshot querySnapshot) {
     querySnapshot.docs.forEach((doc) {
       hop = Hospital.fromJson(doc.data());
       hospitals.add(hop);
     });
   });
   return hospitals ;
  }


  }

/*

  deleteProduct(documentId) {
    _firestore.collection(kProductsCollection).document(documentId).delete();
  }

  editProduct(data, documentId) {
    _firestore
        .collection(kProductsCollection)
        .document(documentId)
        .updateData(data);
  }

  storeOrders(data, List<Product> products) {
    var documentRef = _firestore.collection(kOrders).document();
    documentRef.setData(data);
    for (var product in products) {
      documentRef.collection(kOrderDetails).document().setData({
        kProductName: product.pName,
        kProductPrice: product.pPrice,
        kProductQuantity: product.pQuantity,
        kProductLocation: product.pLocation,
        kProductCategory: product.pCategory
      });
    }
  }
}*/