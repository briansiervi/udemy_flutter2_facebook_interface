import 'package:facebook_interface/componentes/area_criar_postagem.dart';
import 'package:facebook_interface/componentes/area_estoria.dart';
import 'package:facebook_interface/componentes/botao_circulo.dart';
import 'package:facebook_interface/componentes/cartao_postagem.dart';
import 'package:facebook_interface/dados/dados.dart';
import 'package:facebook_interface/modelos/modelos.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:facebook_interface/uteis/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Responsivo(
      mobile: HomeMobile(),
      desktop: HomeDesktop(),
      //tablet: HomeTablet(),
    ));
  }
}

class HomeMobile extends StatelessWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          floating: true,
          centerTitle: false,
          title: const Text("facebook-M",
              style: TextStyle(
                color: PaletaCores.azulFacebook,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: -1.2,
              )),
          actions: [
            BotaoCirculo(
              icone: Icons.search,
              iconeTamanho: 30,
              onPressed: () {},
            ),
            BotaoCirculo(
              icone: LineIcons.facebookMessenger,
              iconeTamanho: 30,
              onPressed: () {},
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: AreaCriarPostagem(
            usuario: usuarioAtual,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: AreaEstoria(
              usuario: usuarioAtual,
              estorias: estorias,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, indice) {
            Postagem postagem = postagens[indice];
            return CartaoPostagem(postagem: postagem);
          }, childCount: postagens.length),
        ),
      ],
    );
  }
}

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: AreaEstoria(
              usuario: usuarioAtual,
              estorias: estorias,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: AreaCriarPostagem(
            usuario: usuarioAtual,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, indice) {
            Postagem postagem = postagens[indice];
            return CartaoPostagem(postagem: postagem);
          }, childCount: postagens.length),
        ),
      ],
    );
  }
}

class HomeTablet extends StatelessWidget {
  const HomeTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 5),
          sliver: SliverToBoxAdapter(
            child: AreaEstoria(
              usuario: usuarioAtual,
              estorias: estorias,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: AreaCriarPostagem(
            usuario: usuarioAtual,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, indice) {
            Postagem postagem = postagens[indice];
            return CartaoPostagem(postagem: postagem);
          }, childCount: postagens.length),
        ),
      ],
    );
  }
}
