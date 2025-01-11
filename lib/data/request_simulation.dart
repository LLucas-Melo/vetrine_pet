import '../models/produto.dart';

Future<List<Produto>> getProdutos() async {
  await Future.delayed(const Duration(seconds: 1));
  return [
    Produto(
      id: 1,
      name: 'Ração Premium para Cães',
      description: 'Ração rica em nutrientes para cães adultos.',
      image:
          'https://images.tcdn.com.br/img/img_prod/587393/racao_special_dog_ultralife_frango_e_arrroz_cao_adulto_de_raca_media_e_grande_2657_1_20200701202109.jpg',
      price: 89.90,
      isFavorite: false,
    ),
    Produto(
      id: 2,
      name: 'Ração Premium para Gatos',
      description: 'Alimento balanceado para gatos de todas as idades.',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5_i2iNEQQ2RP0VQVfBEXEuAB0mHMal7QZBA&s',
      price: 79.90,
      isFavorite: false,
    ),
    Produto(
      id: 3,
      name: 'Cama Confortável para Pets',
      description: 'Cama macia e confortável para cães e gatos.',
      image:
          'https://images.tcdn.com.br/img/img_prod/1245117/cama_conforto_10870_2_e3ecfc4563555f6d1c70073f26f2ec56.jpg',
      price: 129.90,
      isFavorite: false,
    ),
    Produto(
      id: 4,
      name: 'Coleira Ajustável',
      description: 'Coleira de nylon resistente e ajustável.',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8LPJ-aWFeysZ6mSS_nFlim_BGlqHNWJFi8Q&s',
      price: 29.90,
      isFavorite: false,
    ),
    Produto(
      id: 5,
      name: 'Brinquedo Mordedor para Cães',
      description:
          'Brinquedo durável para cães, ideal para diversão e dentição.',
      image:
          'https://cdn.awsli.com.br/600x450/2518/2518821/produto/2166062378b902abe40.jpg',
      price: 19.90,
      isFavorite: false,
    ),
    Produto(
      id: 6,
      name: 'Arranhador para Gatos',
      description: 'Arranhador compacto para. entreter e proteger os móveis.',
      image:
          'https://i.pinimg.com/736x/eb/26/63/eb2663f0d84c2a121d3e99d8222cd36e.jpg',
      price: 69.90,
      isFavorite: false,
    ),
    Produto(
      id: 7,
      name: 'Shampoo para Pets',
      description: 'Shampoo suave e hidratante para cães e gatos.',
      image:
          'https://images.tcdn.com.br/img/img_prod/573283/kit_banho_cachorro_shampoo_pelos_escuros_condicionador_revitalizante_e_perfume_colonia_caes_machos_s_536005_1_4b2a9c5f1c73d407c8bd119eb69fd915.jpg',
      price: 24.90,
      isFavorite: false,
    ),
    Produto(
      id: 8,
      name: 'Transportador para Pets',
      description: 'Caixa transportadora segura e confortável.',
      image:
          'https://cdn.awsli.com.br/2500x2500/1226/1226108/produto/55482961/7f6846cf14.jpg',
      price: 159.90,
      isFavorite: false,
    ),
    Produto(
      id: 9,
      name: 'Tapete Higiênico',
      description: 'Tapete absorvente para. facilitar a higiene do pet..',
      image:
          'https://media.breeds.com.br/media/catalog/product/cache/58b66ab76459b8fd9436b709660314ca/I/M/IMG_41376_638_1.webp',
      price: 49.90,
      isFavorite: false,
    ),
    Produto(
      id: 10,
      name: 'Comedouro e Bebedouro Automático',
      description: 'Sistema automático para alimentação e hidratação do pet.',
      image:
          'https://http2.mlstatic.com/D_NQ_NP_979421-MLB49385081239_032022-O.webp',
      price: 99.90,
      isFavorite: false,
    )
  ];
}
