import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/modelos/modelos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AreaEstoria extends StatelessWidget {
  final Usuario usuario;
  final List<Estoria> estorias;

  AreaEstoria({Key? key, required this.usuario, required this.estorias})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          scrollDirection: Axis.horizontal,
          itemCount: estorias.length,
          itemBuilder: (context, indice) {
            Estoria estoria = estorias[indice];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: CartaoEstoria(
                estoria: estoria,
              ),
            );
          }),
    );
  }
}

class CartaoEstoria extends StatelessWidget {
  final Estoria estoria;

  CartaoEstoria({Key? key, required this.estoria}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: estoria.urlImagem,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
