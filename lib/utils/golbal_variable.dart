import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:monis/domain/service/category_service.dart';

///load the existent categories
final itemsCategory =
    CategoryListService().getAllCategories().map((e) => e.name);

///collection from firebase
const _userCollection = 'users', _bookCollection = 'books';

/// reference [_userCollection] from firebase
final userInstanceFirebase =
    FirebaseFirestore.instance.collection(_userCollection);

/// reference [_bookCollection] from firebase
final bookInstanceFirebase =
    FirebaseFirestore.instance.collection(_bookCollection);

///item selected from dropdown
String? selectedItem = itemsCategory.first;
