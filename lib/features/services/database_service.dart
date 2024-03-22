import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gem_book/features/presentation/models/gem_add.dart';

const String GEMM_ADD = 'gemAdd';

class DatabaseService {
  final fireStore = FirebaseFirestore.instance;

  late final CollectionReference addRef;

  DatabaseService() {
    addRef = fireStore.collection(GEMM_ADD).withConverter<Add>(
        fromFirestore: (snapshots, _) => Add.fromJson(snapshots.data()!),
        toFirestore: (add, _) => add.tojson());
  }
  Stream<QuerySnapshot> getAdds(){
    return addRef.snapshots();
  }

  void addAGemAdd(Add add) async {
    final DocumentReference docRef = await addRef.add(add);
    addRef.add(add);
    await docRef.update({'addID': docRef.id});
  }

  void updateAdd(String addID,Add add){
    addRef.doc(addID).update(add.tojson());
  }

  void deleteAdd(String addID){
    addRef.doc(addID).delete();
  }

}
