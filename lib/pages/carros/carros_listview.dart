import 'package:carros/pages/carros/carros.dart';
import 'package:carros/pages/carros/carros_api.dart';
import 'package:flutter/material.dart';
class CarroListView extends StatefulWidget {
  String tipo;
  CarroListView(this.tipo);

  @override
  _CarroListViewState createState() => _CarroListViewState();
}

class _CarroListViewState extends State<CarroListView> with AutomaticKeepAliveClientMixin <CarroListView> {
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _body();

  }

  _body(){
    return _CarsFuture();
  }

  FutureBuilder<List<Carro>> _CarsFuture() {
    Future<List<Carro>> future = CarrosApi.getCarros(widget.tipo);
    return FutureBuilder (
      future: future,
      builder: (context, snapshot) {
        if (! snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }
        List<Carro> carros = snapshot.data;
        return _ListViewCars(carros);
      },

    );
  }
}
_ListViewCars(List<Carro> carros) {
  return Container(
    padding: EdgeInsets.all(16),
    child: ListView.builder(
        itemCount: carros != null ? carros.length: 0,
        itemBuilder: (context, index){
          Carro c = carros[index];
          return Card(
            color: Colors.grey[200],
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Image.network(
                    c.urlFoto ?? "http://www.livroandroid.com.br/livro/carros/classicos/Cadillac_Deville_Convertible.png",
                    width: 150,
                  ),
                  Text(
                    c.nome,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 25),

                  ),
                  Text(
                    c.tipo, style: TextStyle(fontSize:16),
                  ),
                  ButtonBarTheme(
                    data: ButtonBarTheme.of(context),
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('DETALHES'),
                          onPressed: (
                                                         ) {
                            /* ... */
                          },
                        ),
                        FlatButton(
                          child: const Text('SHARE'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),

          );
        }),
  );
}
