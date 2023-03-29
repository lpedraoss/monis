import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:monis/service/category_service.dart';

///load the existent categories
final itemsCategory =
    CategoryListService().getAllCategories().map((e) => e.name);

///collection from firebase
const userCollection = 'users', bookCollection = 'books';

/// reference [userCollection] from firebase
final userInstanceFirebase =
    FirebaseFirestore.instance.collection(userCollection);

/// reference [bookCollection] from firebase
final bookInstanceFirebase =
    FirebaseFirestore.instance.collection(bookCollection);

///item selected from dropdown
String? selectedItem = itemsCategory.first;
