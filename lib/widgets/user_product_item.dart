import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/edit_product_screen.dart';
import '../providers/products.dart';

class UserProductItem extends StatelessWidget {
  const UserProductItem({Key? key, this.title, this.imageUrl, this.id}) : super(key: key);

  final String? id;
  final String? title;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    print(id);
    return ListTile(
      title: Text(title!),
      leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl!)
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(onPressed: (){
              Navigator.of(context).pushNamed(EditProductScreen.routeName, arguments: id);
            }, icon: const Icon(Icons.edit), color: Theme.of(context).primaryColor),
            IconButton(onPressed: (){
              Provider.of<Products>(context, listen: false).deleteProduct(id!);
            }, icon: const Icon(Icons.delete), color: Theme.of(context).errorColor)
          ],
        ),
      ),
    );
  }
}
