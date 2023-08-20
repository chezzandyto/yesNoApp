import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message herMessage;
  const HerMessageBubble({super.key, required this.herMessage});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colors.secondary,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              //'Doctus commune doctus elementum noluisse noster te dignissim consul. Nihil cu eget legere definitionem. Doming conceptam affert principes sapientem integer feugait tristique. Semper brute ornatus eirmod singulis quidam ridens donec quod. Erroribus movet quam accusata scripserit propriae gloriatur fabellas volutpat eos. Dignissim himenaeos dicam tibique deseruisse no veniam. Bibendum habeo oratio agam maiorum scripta. Consetetur veri partiendo torquent felis velit nascetur. Interesset consetetur tincidunt ac laoreet regione. Elementum duis fames vivendo fabulas dolore pertinacia aliquid auctor. Quaerendum quas elementum habitant potenti. Ignota salutatus legere vulputate petentium numquam interpretaris. Natoque et orci persius eam altera vel odio saperet. Ocurreret mauris suscipiantur lacinia quam morbi aliquid porta dicat senserit. Platea conubia aliquip accumsan epicurei. Diam ius definiebas ornare lorem vehicula iusto sale. Posse ultrices facilisi epicuri utamur cetero lacinia fabellas vocibus urna. Elementum corrumpit massa convenire alterum. Eum wisi velit pellentesque nonumy disputationi praesent nulla. Alia quod partiendo fecenas potenti. Cpam adipiscing ocurrtur feugait.',
              herMessage.text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        _ImageBubble(imageUrl: herMessage.imageUrl),
        const SizedBox(height: 5),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String? imageUrl;
  const _ImageBubble({this.imageUrl});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        //'https://yesno.wtf/assets/no/32-b62f1f8058c1d7f06c528319faccfb38.gif',
        imageUrl!,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Recibiendo imagen'),
            color: Colors.white54,
          );
        },
      ),
    );
  }
}
