import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quotes/model/data/db_author_collection.dart';
import 'package:quotes/model/models.dart';
import 'package:quotes/res/constants.dart';
import 'package:quotes/view/widgets/quote_card.dart';

import '../../../view_model/provider.dart';
import '../../widgets/edit_pop_up.dart';

class AuthorCollectionScreen extends StatefulWidget {
  AuthorCollectionScreen({super.key, required this.collectionName});
  String? collectionName;
  @override
  State<AuthorCollectionScreen> createState() => _AuthorCollectionScreenState();
}

class _AuthorCollectionScreenState extends State<AuthorCollectionScreen> {
  @override
  void initState() {
    Provider.of<Model>(context, listen: false).futureA =
        DBAuthorCollection.getQuotesOfAuthor(widget.collectionName.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbackgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(widget.collectionName.toString(),
            style: const TextStyle(
                fontSize: 37, fontFamily: "Ramaraja", color: Colors.white)),
      ),
      body: Consumer<Model>(builder: (context, model, child) {
        return FutureBuilder(
          future: model.futureA,
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) => QuoteTile(
                    onDoubleTap: () => showDialog(
                        context: context,
                        builder: (context) => EditPopUpCard(
                              onTap: () {
                                //update quote
                                context
                                    .read<Model>()
                                    .updateQuote(snapshot.data![index]);
                                //Clear controllers
                                context.read<Model>().quoteController.clear();
                                context.read<Model>().authorController.clear();
                                Navigator.pop(context);
                              },
                              author: snapshot.data?[index].author ?? "",
                              quote: snapshot.data?[index].quote ?? "",
                            )),
                    favIcon: (snapshot.data?[index].isFav == 0)
                        ? const Icon(
                            color: Colors.white70,
                            Icons.favorite_outline_rounded)
                        : const Icon(
                            color: Colors.white70, Icons.favorite_rounded),
                    favorites: () => Provider.of<Model>(context, listen: false)
                        .switchFavourites(snapshot.data![index]),
                    copy: () async {
                      await Clipboard.setData(
                          const ClipboardData(text: "your text"));
                      // copied successfully
                    },
                    delete: () => Provider.of<Model>(context, listen: false)
                        .delQuote(snapshot.data?[index] ??
                            Quote(
                                author: "",
                                quote: "",
                                isFav: 0,
                                collectionName: "")),
                    quoteObj: snapshot.data?[index] ??
                        Quote(
                            // id: 0,
                            author: "",
                            quote: "",
                            isFav: 0,
                            collectionName: ""),
                    quote: snapshot.data?[index].quote ?? " ",
                    author: snapshot.data?[index].author ?? ""));
          },
        );
      }),
    );
  }
}
