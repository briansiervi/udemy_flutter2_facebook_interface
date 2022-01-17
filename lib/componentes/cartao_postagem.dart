import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/componentes/cabecalho_postagem.dart';
import 'package:facebook_interface/modelos/postagem.dart';
import 'package:flutter/material.dart';

class CartaoPostagem extends StatelessWidget {
  final Postagem postagem;

  const CartaoPostagem({Key? key, required this.postagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //Cabeçalho
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //cabeçalho
                CabecalhoPostagem(postagem: postagem),

                //descrição
                Text(postagem.descricao),
              ],
            ),
          ),

          //Imagem Postagem
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CachedNetworkImage(
              imageUrl: postagem.urlImagem,
            ),
          ),

          //Área de estatísticas
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
          ),
        ],
      ),
    );
  }
}
