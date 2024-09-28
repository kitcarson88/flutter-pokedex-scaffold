import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pokedex_scaffold/core/models/dto/pokemon_dto.dart';
import 'package:pokedex_scaffold/core/repositories/pokemon_repository.dart';

@Injectable(as: PokemonRepository, env: ['mock'])
class PokemonMockedRepository implements PokemonRepository {
  static const _kFakeDelay = 1;

  @override
  Future<List<PokemonDTO>> getPokemons(
      {String? language = 'en', int offset = 0, int limit = 150, forceReload = false}) async {
    const json = '''
      [
            {
                "id": 1,
                "name": "Bulbasaur",
                "description": "Questo Pokémon può stare a lungo senza\\nmangiare. Accumula energia nel bulbo che\\nha sulla schiena.",
                "main-type": "grass",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
                "url": "https://pokeapi.co/api/v2/pokemon/1/"
            },
            {
                "id": 2,
                "name": "Ivysaur",
                "description": "Il suo bocciolo cresce assorbendo nutrimento e,\\nquando è prossimo alla fioritura, emana un\\nforte profumo.",
                "main-type": "grass",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png",
                "url": "https://pokeapi.co/api/v2/pokemon/2/"
            },
            {
                "id": 3,
                "name": "Venusaur",
                "description": "Il grande fiore che ha sulla schiena può assorbire\\ni raggi solari e trasformarli in energia.",
                "main-type": "grass",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png",
                "url": "https://pokeapi.co/api/v2/pokemon/3/"
            },
            {
                "id": 4,
                "name": "Charmander",
                "description": "Nel silenzio più assoluto si può udire la fiamma\\nin cima alla sua coda scoppiettare bruciando.",
                "main-type": "fire",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png",
                "url": "https://pokeapi.co/api/v2/pokemon/4/"
            },
            {
                "id": 5,
                "name": "Charmeleon",
                "description": "Si infervora durante le lotte più dure e talvolta\\nsputa fiamme bluastre.",
                "main-type": "fire",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png",
                "url": "https://pokeapi.co/api/v2/pokemon/5/"
            },
            {
                "id": 6,
                "name": "Charizard",
                "description": "Quando emette lingue di fuoco roventi\\ndalla bocca, la fiamma rossa sulla punta\\ndella coda brucia più intensamente.",
                "main-type": "fire",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png",
                "url": "https://pokeapi.co/api/v2/pokemon/6/"
            },
            {
                "id": 7,
                "name": "Squirtle",
                "description": "Se ne sta tra i flutti e attacca le prede con\\npotenti getti d’acqua. Se si sente in pericolo\\nsi ritira dentro la corazza.",
                "main-type": "water",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png",
                "url": "https://pokeapi.co/api/v2/pokemon/7/"
            },
            {
                "id": 8,
                "name": "Wartortle",
                "description": "Quando viene colpito sulla testa si ritira nella\\ncorazza. La coda, però, sporge sempre un po’.",
                "main-type": "water",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/8.png",
                "url": "https://pokeapi.co/api/v2/pokemon/8/"
            },
            {
                "id": 9,
                "name": "Blastoise",
                "description": "Dopo aver preso la mira colpisce il nemico con\\ngetti d’acqua più potenti di quelli di un idrante.",
                "main-type": "water",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/9.png",
                "url": "https://pokeapi.co/api/v2/pokemon/9/"
            },
            {
                "id": 10,
                "name": "Caterpie",
                "description": "Se gli si toccano le antenne che ha sulla testa,\\nsi difende emettendo un odore insopportabile.",
                "main-type": "bug",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10.png",
                "url": "https://pokeapi.co/api/v2/pokemon/10/"
            },
            {
                "id": 11,
                "name": "Metapod",
                "description": "Per difendersi indurisce la corazza, ma un colpo\\nviolento può scaraventarlo fuori dal guscio.",
                "main-type": "bug",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/11.png",
                "url": "https://pokeapi.co/api/v2/pokemon/11/"
            },
            {
                "id": 12,
                "name": "Butterfree",
                "description": "Possiede ali idrorepellenti ricoperte da una\\npolvere velenosa. Può volare anche quando\\npiove.",
                "main-type": "bug",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/12.png",
                "url": "https://pokeapi.co/api/v2/pokemon/12/"
            },
            {
                "id": 13,
                "name": "Weedle",
                "description": "Ha un pungiglione acuminato sul capo. Vive tra\\nl’erba alta e nei boschi, dove si nutre di foglie.",
                "main-type": "bug",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/13.png",
                "url": "https://pokeapi.co/api/v2/pokemon/13/"
            },
            {
                "id": 14,
                "name": "Kakuna",
                "description": "È molto limitato nei movimenti. Se si sente\\nminacciato, estrae il pungiglione e avvelena\\nil nemico.",
                "main-type": "bug",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/14.png",
                "url": "https://pokeapi.co/api/v2/pokemon/14/"
            },
            {
                "id": 15,
                "name": "Beedrill",
                "description": "Possiede tre aculei velenosi, due sulle zampe\\nanteriori e uno sull’addome, con cui punge\\nripetutamente i nemici.",
                "main-type": "bug",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/15.png",
                "url": "https://pokeapi.co/api/v2/pokemon/15/"
            },
            {
                "id": 16,
                "name": "Pidgey",
                "description": "Di indole docile, preferisce gettare sabbia\\nverso il nemico per proteggersi piuttosto\\nche attaccarlo.",
                "main-type": "normal",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/16.png",
                "url": "https://pokeapi.co/api/v2/pokemon/16/"
            },
            {
                "id": 17,
                "name": "Pidgeotto",
                "description": "Un Pokémon pieno di vitalità che vola\\ninstancabile sul suo territorio in cerca di prede.",
                "main-type": "normal",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/17.png",
                "url": "https://pokeapi.co/api/v2/pokemon/17/"
            },
            {
                "id": 18,
                "name": "Pidgeot",
                "description": "Può volare a una velocità di Mach 2 in cerca\\ndi prede. I suoi artigli sono armi micidiali.",
                "main-type": "normal",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/18.png",
                "url": "https://pokeapi.co/api/v2/pokemon/18/"
            },
            {
                "id": 19,
                "name": "Rattata",
                "description": "Con i suoi incisivi rode qualsiasi cosa.\\nSe se ne avvista uno, è probabile che\\nin zona vivano almeno 40 esemplari.",
                "main-type": "normal",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/19.png",
                "url": "https://pokeapi.co/api/v2/pokemon/19/"
            },
            {
                "id": 20,
                "name": "Raticate",
                "description": "Dispone di zampe posteriori palmate che\\ngli permettono di nuotare nei fiumi in cerca\\ndi prede.",
                "main-type": "normal",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/20.png",
                "url": "https://pokeapi.co/api/v2/pokemon/20/"
            },
            {
                "id": 21,
                "name": "Spearow",
                "description": "Incapace di raggiungere alte quote, sorvola\\nil suo territorio a gran velocità per proteggerlo.",
                "main-type": "normal",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/21.png",
                "url": "https://pokeapi.co/api/v2/pokemon/21/"
            },
            {
                "id": 22,
                "name": "Fearow",
                "description": "Questo Pokémon molto antico vola in alto\\nnel cielo al minimo accenno di pericolo.",
                "main-type": "normal",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/22.png",
                "url": "https://pokeapi.co/api/v2/pokemon/22/"
            },
            {
                "id": 23,
                "name": "Ekans",
                "description": "Si allunga sempre più con l’età.\\nLa notte si avvolge attorno a qualche ramo\\nper dormire.",
                "main-type": "poison",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/23.png",
                "url": "https://pokeapi.co/api/v2/pokemon/23/"
            },
            {
                "id": 24,
                "name": "Arbok",
                "description": "Gli spaventosi disegni che ha sulla pancia\\nsono oggetto di studio. Ne sono state scoperte\\nsei diverse variazioni.",
                "main-type": "poison",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/24.png",
                "url": "https://pokeapi.co/api/v2/pokemon/24/"
            },
            {
                "id": 25,
                "name": "Pikachu",
                "description": "Vive nelle foreste. Accumula elettricità nelle\\nsacche sulle guance, e chiunque le tocchi\\nprende la scossa.",
                "main-type": "electric",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
                "url": "https://pokeapi.co/api/v2/pokemon/25/"
            },
            {
                "id": 26,
                "name": "Raichu",
                "description": "Quando accumula elettricità nel suo corpo,\\nsi fa aggressivo. Al buio brilla di luce propria.",
                "main-type": "electric",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/26.png",
                "url": "https://pokeapi.co/api/v2/pokemon/26/"
            },
            {
                "id": 27,
                "name": "Sandshrew",
                "description": "Il suo corpo è molto asciutto, ma si dice che\\nquando di notte la temperatura si abbassa\\nsi ricopra di fine rugiada.",
                "main-type": "ground",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/27.png",
                "url": "https://pokeapi.co/api/v2/pokemon/27/"
            },
            {
                "id": 28,
                "name": "Sandslash",
                "description": "È abilissimo a graffiare i nemici con i suoi\\nartigli affilati. Se si rompono, ricrescono in un\\ngiorno.",
                "main-type": "ground",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/28.png",
                "url": "https://pokeapi.co/api/v2/pokemon/28/"
            },
            {
                "id": 29,
                "name": "Nidoran♀",
                "description": "Pokémon molto tranquillo che rifugge la lotta.\\nBisogna fare attenzione al suo piccolo corno,\\nche secerne veleno.",
                "main-type": "poison",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/29.png",
                "url": "https://pokeapi.co/api/v2/pokemon/29/"
            },
            {
                "id": 30,
                "name": "Nidorina",
                "description": "Quando è nella sua tana i suoi aculei si ritirano.\\nQuesto dimostra che è rilassato.",
                "main-type": "poison",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/30.png",
                "url": "https://pokeapi.co/api/v2/pokemon/30/"
            },
            {
                "id": 31,
                "name": "Nidoqueen",
                "description": "Sembra che le dure squame che ricoprono\\nil suo corpo robusto cadano ciclicamente\\nper poi ricrescere.",
                "main-type": "poison",
                "other-types": [
                    "ground"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/31.png",
                "url": "https://pokeapi.co/api/v2/pokemon/31/"
            },
            {
                "id": 32,
                "name": "Nidoran♂",
                "description": "Rizza le orecchie enormi per sondare i dintorni.\\nSe percepisce un pericolo, attacca con gli aculei\\nvelenosi.",
                "main-type": "poison",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/32.png",
                "url": "https://pokeapi.co/api/v2/pokemon/32/"
            },
            {
                "id": 33,
                "name": "Nidorino",
                "description": "Quando colpisce il nemico con il suo corno\\ndurante la lotta, questo secerne un forte veleno.",
                "main-type": "poison",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/33.png",
                "url": "https://pokeapi.co/api/v2/pokemon/33/"
            },
            {
                "id": 34,
                "name": "Nidoking",
                "description": "La pelle dura come l’acciaio garantisce alle\\nsue cariche una potenza devastante.\\nIl suo corno può perforare anche il diamante.",
                "main-type": "poison",
                "other-types": [
                    "ground"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/34.png",
                "url": "https://pokeapi.co/api/v2/pokemon/34/"
            },
            {
                "id": 35,
                "name": "Clefairy",
                "description": "È molto amato per l’aspetto adorabile\\ne le graziose movenze, ma non si vede\\nspesso perché ne esistono pochi esemplari.",
                "main-type": "fairy",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/35.png",
                "url": "https://pokeapi.co/api/v2/pokemon/35/"
            },
            {
                "id": 36,
                "name": "Clefable",
                "description": "Sembra che queste creature simili alle fate siano\\nmolto protettive verso il loro habitat.\\nSi mostrano agli esseri umani solo di rado.",
                "main-type": "fairy",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/36.png",
                "url": "https://pokeapi.co/api/v2/pokemon/36/"
            },
            {
                "id": 37,
                "name": "Vulpix",
                "description": "Il suo manto e le sue code sono meravigliosi.\\nCrescendo, la sua coda sviluppa diverse\\ndiramazioni.",
                "main-type": "fire",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/37.png",
                "url": "https://pokeapi.co/api/v2/pokemon/37/"
            },
            {
                "id": 38,
                "name": "Ninetales",
                "description": "Narra la leggenda che le anime di nove saggi\\nsi siano unite e reincarnate in questo Pokémon.",
                "main-type": "fire",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/38.png",
                "url": "https://pokeapi.co/api/v2/pokemon/38/"
            },
            {
                "id": 39,
                "name": "Jigglypuff",
                "description": "Usa gli enormi occhi per ammaliare i\\nnemici, poi canta una dolce melodia per\\naddormentarli.",
                "main-type": "normal",
                "other-types": [
                    "fairy"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/39.png",
                "url": "https://pokeapi.co/api/v2/pokemon/39/"
            },
            {
                "id": 40,
                "name": "Wigglytuff",
                "description": "Il suo corpo è estremamente elastico e può\\ngonfiarsi fino a dimensioni impressionanti.",
                "main-type": "normal",
                "other-types": [
                    "fairy"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/40.png",
                "url": "https://pokeapi.co/api/v2/pokemon/40/"
            },
            {
                "id": 41,
                "name": "Zubat",
                "description": "Durante il volo emette degli ultrasuoni\\ndalla bocca per localizzare gli ostacoli\\nsul suo percorso.",
                "main-type": "poison",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/41.png",
                "url": "https://pokeapi.co/api/v2/pokemon/41/"
            },
            {
                "id": 42,
                "name": "Golbat",
                "description": "Attacca in modo repentino e furtivo. Usa i denti\\naguzzi per mordere e succhiare sangue.",
                "main-type": "poison",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/42.png",
                "url": "https://pokeapi.co/api/v2/pokemon/42/"
            },
            {
                "id": 43,
                "name": "Oddish",
                "description": "Spesso confuso con un’erbaccia, questo\\nPokémon stride atrocemente se si prova\\na estirparlo.",
                "main-type": "grass",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/43.png",
                "url": "https://pokeapi.co/api/v2/pokemon/43/"
            },
            {
                "id": 44,
                "name": "Gloom",
                "description": "Puzza da levare il fiato! Tuttavia circa una\\npersona su mille adora annusarne il fetido\\nlezzo.",
                "main-type": "grass",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/44.png",
                "url": "https://pokeapi.co/api/v2/pokemon/44/"
            },
            {
                "id": 45,
                "name": "Vileplume",
                "description": "Scuote gli enormi petali per liberare polline\\nvelenoso, producendo un gran frastuono.",
                "main-type": "grass",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/45.png",
                "url": "https://pokeapi.co/api/v2/pokemon/45/"
            },
            {
                "id": 46,
                "name": "Paras",
                "description": "Scava nella terra per cibarsi delle radici degli\\nalberi, ma i funghi che ha sul dorso assorbono\\nquasi tutte le sostanze nutritive.",
                "main-type": "bug",
                "other-types": [
                    "grass"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/46.png",
                "url": "https://pokeapi.co/api/v2/pokemon/46/"
            },
            {
                "id": 47,
                "name": "Parasect",
                "description": "Il fungo sulla schiena assorbe l’energia\\ndell’organismo ospite, su cui ha anche\\npieno controllo.",
                "main-type": "bug",
                "other-types": [
                    "grass"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/47.png",
                "url": "https://pokeapi.co/api/v2/pokemon/47/"
            },
            {
                "id": 48,
                "name": "Venonat",
                "description": "Gli occhi enormi fungono da radar. Alla luce\\nsi può notare che sono formati da molti occhi\\npiù piccoli.",
                "main-type": "bug",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/48.png",
                "url": "https://pokeapi.co/api/v2/pokemon/48/"
            },
            {
                "id": 49,
                "name": "Venomoth",
                "description": "Se si attaccano alla pelle, le scaglie che\\nricoprono le sue ali sono difficili da togliere.\\nInoltre, rilasciano una sostanza velenosa.",
                "main-type": "bug",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/49.png",
                "url": "https://pokeapi.co/api/v2/pokemon/49/"
            },
            {
                "id": 50,
                "name": "Diglett",
                "description": "Ama i luoghi bui e vive soprattutto sottoterra,\\nma esce spesso allo scoperto nelle grotte.",
                "main-type": "ground",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/50.png",
                "url": "https://pokeapi.co/api/v2/pokemon/50/"
            },
            {
                "id": 51,
                "name": "Dugtrio",
                "description": "Un gruppo di tre Diglett che può scavare\\ngallerie fino a 100 km di profondità. Per questo\\nsi dice che causi dei terremoti.",
                "main-type": "ground",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/51.png",
                "url": "https://pokeapi.co/api/v2/pokemon/51/"
            },
            {
                "id": 52,
                "name": "Meowth",
                "description": "Pare che sia più attivo durante la notte. Ama\\ngli oggetti lucenti e rotondi, e quando ne vede\\nnon può fare a meno di raccoglierli.",
                "main-type": "normal",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/52.png",
                "url": "https://pokeapi.co/api/v2/pokemon/52/"
            },
            {
                "id": 53,
                "name": "Persian",
                "description": "La gemma che ha in fronte emette una luce\\nsplendente. Ha le movenze sinuose ed eleganti\\ndi una regina.",
                "main-type": "normal",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/53.png",
                "url": "https://pokeapi.co/api/v2/pokemon/53/"
            },
            {
                "id": 54,
                "name": "Psyduck",
                "description": "Ha sempre un forte mal di testa.\\nNon è chiaro se utilizzi volontariamente\\ni suoi poteri psicocinetici.",
                "main-type": "water",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/54.png",
                "url": "https://pokeapi.co/api/v2/pokemon/54/"
            },
            {
                "id": 55,
                "name": "Golduck",
                "description": "Ha zampe palmate lunghe e sottili, che\\ngli permettono di nuotare elegantemente\\nnei laghi.",
                "main-type": "water",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/55.png",
                "url": "https://pokeapi.co/api/v2/pokemon/55/"
            },
            {
                "id": 56,
                "name": "Mankey",
                "description": "Un Pokémon agile che vive sugli alberi.\\nÈ molto irascibile e non esita ad attaccare\\nchiunque gli capiti a tiro.",
                "main-type": "fighting",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/56.png",
                "url": "https://pokeapi.co/api/v2/pokemon/56/"
            },
            {
                "id": 57,
                "name": "Primeape",
                "description": "È molto difficile vedere questo Pokémon calmo,\\ndato che la sua furia si placa solamente\\nquando si trova nella solitudine più assoluta.",
                "main-type": "fighting",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/57.png",
                "url": "https://pokeapi.co/api/v2/pokemon/57/"
            },
            {
                "id": 58,
                "name": "Growlithe",
                "description": "È un Pokémon molto affettuoso, ma si mette\\nad abbaiare impetuosamente contro chiunque\\ninvada il suo habitat.",
                "main-type": "fire",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/58.png",
                "url": "https://pokeapi.co/api/v2/pokemon/58/"
            },
            {
                "id": 59,
                "name": "Arcanine",
                "description": "È considerato un Pokémon leggendario in\\noriente. Molti sono ammaliati dal modo\\nleggiadro in cui corre.",
                "main-type": "fire",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/59.png",
                "url": "https://pokeapi.co/api/v2/pokemon/59/"
            },
            {
                "id": 60,
                "name": "Poliwag",
                "description": "La direzione della spirale che ha sulla pancia\\nvaria a seconda della zona in cui è nato.\\nÈ più bravo a nuotare che a camminare.",
                "main-type": "water",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/60.png",
                "url": "https://pokeapi.co/api/v2/pokemon/60/"
            },
            {
                "id": 61,
                "name": "Poliwhirl",
                "description": "Quando si sente in pericolo usa la spirale\\nche ha sulla pancia per addormentare\\ngli avversari, poi si dà alla fuga.",
                "main-type": "water",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/61.png",
                "url": "https://pokeapi.co/api/v2/pokemon/61/"
            },
            {
                "id": 62,
                "name": "Poliwrath",
                "description": "Nuota velocissimo usando tutti i muscoli.\\nRiesce persino a battere atleti di caratura\\nmondiale.",
                "main-type": "water",
                "other-types": [
                    "fighting"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/62.png",
                "url": "https://pokeapi.co/api/v2/pokemon/62/"
            },
            {
                "id": 63,
                "name": "Abra",
                "description": "Dorme 18 ore al giorno. Se percepisce\\nun pericolo, riesce a teletrasportarsi anche\\nsenza svegliarsi.",
                "main-type": "psychic",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/63.png",
                "url": "https://pokeapi.co/api/v2/pokemon/63/"
            },
            {
                "id": 64,
                "name": "Kadabra",
                "description": "Quando è vicino succedono molte cose strane.\\nPer esempio, gli orologi girano al contrario.",
                "main-type": "psychic",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/64.png",
                "url": "https://pokeapi.co/api/v2/pokemon/64/"
            },
            {
                "id": 65,
                "name": "Alakazam",
                "description": "Questo Pokémon intelligentissimo ha una\\nmemoria prodigiosa e non dimentica mai\\nciò che impara.",
                "main-type": "psychic",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/65.png",
                "url": "https://pokeapi.co/api/v2/pokemon/65/"
            },
            {
                "id": 66,
                "name": "Machop",
                "description": "È piccolo, ma molto potente. La sua maestria\\nin tutte le arti marziali lo rende un osso duro.",
                "main-type": "fighting",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/66.png",
                "url": "https://pokeapi.co/api/v2/pokemon/66/"
            },
            {
                "id": 67,
                "name": "Machoke",
                "description": "La cintura che porta attorno alla vita serve\\na contenere la sua energia. Senza di essa\\nsarebbe inarrestabile.",
                "main-type": "fighting",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/67.png",
                "url": "https://pokeapi.co/api/v2/pokemon/67/"
            },
            {
                "id": 68,
                "name": "Machamp",
                "description": "Con un solo braccio riesce a muovere una\\nmontagna. Quando usa tutte e quattro le braccia\\nsferra pugni di una potenza inimmaginabile.",
                "main-type": "fighting",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/68.png",
                "url": "https://pokeapi.co/api/v2/pokemon/68/"
            },
            {
                "id": 69,
                "name": "Bellsprout",
                "description": "Ama i luoghi caldi e umidi. Cattura minuscoli\\nPokémon di tipo Coleottero con i suoi viticci\\ne poi li divora.",
                "main-type": "grass",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/69.png",
                "url": "https://pokeapi.co/api/v2/pokemon/69/"
            },
            {
                "id": 70,
                "name": "Weepinbell",
                "description": "Quando è affamato divora qualsiasi cosa\\ngli capiti a tiro e la scioglie con i suoi\\npotenti acidi.",
                "main-type": "grass",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/70.png",
                "url": "https://pokeapi.co/api/v2/pokemon/70/"
            },
            {
                "id": 71,
                "name": "Victreebel",
                "description": "Attira le prede con il dolce aroma del miele,\\nle inghiotte e nel giro di un giorno le scioglie\\ncompletamente, ossa incluse.",
                "main-type": "grass",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/71.png",
                "url": "https://pokeapi.co/api/v2/pokemon/71/"
            },
            {
                "id": 72,
                "name": "Tentacool",
                "description": "A volte lo si può trovare tutto rinsecchito\\nsulla spiaggia, ma basta gettarlo in mare\\ne si riprende all’istante.",
                "main-type": "water",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/72.png",
                "url": "https://pokeapi.co/api/v2/pokemon/72/"
            },
            {
                "id": 73,
                "name": "Tentacruel",
                "description": "Usa gli 80 tentacoli, che può allungare\\ne ritrarre a piacimento, per avvolgere la\\npreda e indebolirla con il veleno.",
                "main-type": "water",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/73.png",
                "url": "https://pokeapi.co/api/v2/pokemon/73/"
            },
            {
                "id": 74,
                "name": "Geodude",
                "description": "Lo si può trovare vicino ai sentieri di montagna.\\nBisogna fare attenzione a non calpestarlo per\\nsbaglio, altrimenti diventa furioso.",
                "main-type": "rock",
                "other-types": [
                    "ground"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/74.png",
                "url": "https://pokeapi.co/api/v2/pokemon/74/"
            },
            {
                "id": 75,
                "name": "Graveler",
                "description": "Spesso viene visto rotolare giù per i sentieri di\\nmontagna, travolgendo tutto ciò che incontra.",
                "main-type": "rock",
                "other-types": [
                    "ground"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/75.png",
                "url": "https://pokeapi.co/api/v2/pokemon/75/"
            },
            {
                "id": 76,
                "name": "Golem",
                "description": "Subito dopo la muta il suo corpo è bianco\\ne morbido, ma al contatto con l’aria si trasforma\\nimmediatamente in una dura corazza.",
                "main-type": "rock",
                "other-types": [
                    "ground"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/76.png",
                "url": "https://pokeapi.co/api/v2/pokemon/76/"
            },
            {
                "id": 77,
                "name": "Ponyta",
                "description": "È capace di salti altissimi. Quando tocca\\nterra, attutisce l’impatto grazie agli zoccoli\\ne alle zampe muscolose.",
                "main-type": "fire",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/77.png",
                "url": "https://pokeapi.co/api/v2/pokemon/77/"
            },
            {
                "id": 78,
                "name": "Rapidash",
                "description": "Ama correre, e quando incontra qualcuno\\npiù veloce si mette a inseguirlo con tutte\\nle sue forze.",
                "main-type": "fire",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/78.png",
                "url": "https://pokeapi.co/api/v2/pokemon/78/"
            },
            {
                "id": 79,
                "name": "Slowpoke",
                "description": "Non è molto sveglio ed è lento nei movimenti.\\nDorme e poltrisce tutto il giorno, incurante\\ndel tempo che passa.",
                "main-type": "water",
                "other-types": [
                    "psychic"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/79.png",
                "url": "https://pokeapi.co/api/v2/pokemon/79/"
            },
            {
                "id": 80,
                "name": "Slowbro",
                "description": "Vive tranquillo vicino al mare. Se per caso\\nlo Shellder che ha sulla coda si stacca,\\ntorna ad essere uno Slowpoke.",
                "main-type": "water",
                "other-types": [
                    "psychic"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/80.png",
                "url": "https://pokeapi.co/api/v2/pokemon/80/"
            },
            {
                "id": 81,
                "name": "Magnemite",
                "description": "Ha l’innata capacità di contrastare la forza di\\ngravità emettendo onde elettromagnetiche che\\ngli permettono di spostarsi fluttuando in aria.",
                "main-type": "electric",
                "other-types": [
                    "steel"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/81.png",
                "url": "https://pokeapi.co/api/v2/pokemon/81/"
            },
            {
                "id": 82,
                "name": "Magneton",
                "description": "Emette strane onde radio che fanno aumentare\\nla temperatura atmosferica di 2 ºC nel raggio\\ndi 1 km.",
                "main-type": "electric",
                "other-types": [
                    "steel"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/82.png",
                "url": "https://pokeapi.co/api/v2/pokemon/82/"
            },
            {
                "id": 83,
                "name": "Farfetch’d",
                "description": "Vivono nei canneti, un tipo di habitat che sta\\ndiventando sempre più raro. Per questo si pensa\\nche anche il numero di Farfetch’d sia diminuito.",
                "main-type": "normal",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/83.png",
                "url": "https://pokeapi.co/api/v2/pokemon/83/"
            },
            {
                "id": 84,
                "name": "Doduo",
                "description": "Le cortissime ali non gli permettono di volare.\\nPuò tuttavia correre velocissimo grazie alle\\nzampe ben sviluppate.",
                "main-type": "normal",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/84.png",
                "url": "https://pokeapi.co/api/v2/pokemon/84/"
            },
            {
                "id": 85,
                "name": "Dodrio",
                "description": "Un Doduo si evolve in Dodrio quando una\\ndelle due teste si divide. Lo si vede sfrecciare\\nper le praterie a 60 km/h.",
                "main-type": "normal",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/85.png",
                "url": "https://pokeapi.co/api/v2/pokemon/85/"
            },
            {
                "id": 86,
                "name": "Seel",
                "description": "Adora gli ambienti gelidi. Nuota con piacere\\nnell’acqua a temperature di circa -10 ºC.",
                "main-type": "water",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/86.png",
                "url": "https://pokeapi.co/api/v2/pokemon/86/"
            },
            {
                "id": 87,
                "name": "Dewgong",
                "description": "Il suo corpo è bianco come la neve. Non soffre\\nil freddo e nuota senza problemi anche in acque\\ngelide.",
                "main-type": "water",
                "other-types": [
                    "ice"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/87.png",
                "url": "https://pokeapi.co/api/v2/pokemon/87/"
            },
            {
                "id": 88,
                "name": "Grimer",
                "description": "Formato da fanghi tossici solidificati, emana\\nun tanfo nauseabondo ed è impossibile toccarlo.\\nDove passa lui non cresce più nemmeno l’erba.",
                "main-type": "poison",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/88.png",
                "url": "https://pokeapi.co/api/v2/pokemon/88/"
            },
            {
                "id": 89,
                "name": "Muk",
                "description": "Emette un tanfo così terribile da far svenire,\\nma non sente alcun odore perché ormai\\nil suo naso si è atrofizzato.",
                "main-type": "poison",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/89.png",
                "url": "https://pokeapi.co/api/v2/pokemon/89/"
            },
            {
                "id": 90,
                "name": "Shellder",
                "description": "La sua conchiglia è capace di resistere a\\nqualsiasi attacco, ma quando si apre\\nil Pokémon diventa molto vulnerabile.",
                "main-type": "water",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/90.png",
                "url": "https://pokeapi.co/api/v2/pokemon/90/"
            },
            {
                "id": 91,
                "name": "Cloyster",
                "description": "Usa la sua conchiglia dura come il diamante\\nper proteggersi e può anche scagliare gli\\naculei di cui è dotata per attaccare.",
                "main-type": "water",
                "other-types": [
                    "ice"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/91.png",
                "url": "https://pokeapi.co/api/v2/pokemon/91/"
            },
            {
                "id": 92,
                "name": "Gastly",
                "description": "Si dice che appaia nelle case diroccate\\ne abbandonate. Il suo corpo sembra fatto\\ndi gas e non ha una forma definita.",
                "main-type": "ghost",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/92.png",
                "url": "https://pokeapi.co/api/v2/pokemon/92/"
            },
            {
                "id": 93,
                "name": "Haunter",
                "description": "Lecca la preda per assorbirne l’energia vitale.\\nSi dice che la vittima venga colta da tremori\\nincontrollabili e spiri entro breve.",
                "main-type": "ghost",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/93.png",
                "url": "https://pokeapi.co/api/v2/pokemon/93/"
            },
            {
                "id": 94,
                "name": "Gengar",
                "description": "Un brivido di freddo improvviso significa che\\nGengar è vicino. Meglio stare attenti, perché\\nsi rischia di essere colpiti da una maledizione.",
                "main-type": "ghost",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/94.png",
                "url": "https://pokeapi.co/api/v2/pokemon/94/"
            },
            {
                "id": 95,
                "name": "Onix",
                "description": "Scava nel terreno con incredibile vigore in cerca\\ndi cibo, creando cunicoli usati poi come tana\\ndai Diglett.",
                "main-type": "rock",
                "other-types": [
                    "ground"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/95.png",
                "url": "https://pokeapi.co/api/v2/pokemon/95/"
            },
            {
                "id": 96,
                "name": "Drowzee",
                "description": "Se si dorme sempre vicino a un Drowzee,\\npuò capitare di sognare uno dei sogni che\\nquesto Pokémon ha mangiato in passato.",
                "main-type": "psychic",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/96.png",
                "url": "https://pokeapi.co/api/v2/pokemon/96/"
            },
            {
                "id": 97,
                "name": "Hypno",
                "description": "Quando se ne incontra uno, è meglio distogliere\\nlo sguardo, altrimenti si rischia di essere\\nipnotizzati dal suo pendolo.",
                "main-type": "psychic",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/97.png",
                "url": "https://pokeapi.co/api/v2/pokemon/97/"
            },
            {
                "id": 98,
                "name": "Krabby",
                "description": "Le sue chele sono armi formidabili. A volte\\nsi staccano durante la lotta, ma ricrescono\\nimmediatamente.",
                "main-type": "water",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/98.png",
                "url": "https://pokeapi.co/api/v2/pokemon/98/"
            },
            {
                "id": 99,
                "name": "Kingler",
                "description": "Una delle sue chele è cresciuta a dismisura\\ned è dura come l’acciaio. Può sprigionare\\nuna potenza di 10.000 CV, ma è pesantissima.",
                "main-type": "water",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/99.png",
                "url": "https://pokeapi.co/api/v2/pokemon/99/"
            },
            {
                "id": 100,
                "name": "Voltorb",
                "description": "Si dice che abbia un aspetto simile a una\\nPoké Ball per passare inosservato. Tende\\nad autodistruggersi al minimo stimolo.",
                "main-type": "electric",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/100.png",
                "url": "https://pokeapi.co/api/v2/pokemon/100/"
            },
            {
                "id": 101,
                "name": "Electrode",
                "description": "L’energia elettrica accumulata nel suo corpo\\npuò provocare un’esplosione al minimo urto.",
                "main-type": "electric",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/101.png",
                "url": "https://pokeapi.co/api/v2/pokemon/101/"
            },
            {
                "id": 102,
                "name": "Exeggcute",
                "description": "Le teste si attraggono a vicenda, creando un\\nmovimento circolare. Riescono a stabilizzarsi\\nsolo se sono in sei.",
                "main-type": "grass",
                "other-types": [
                    "psychic"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/102.png",
                "url": "https://pokeapi.co/api/v2/pokemon/102/"
            },
            {
                "id": 103,
                "name": "Exeggutor",
                "description": "Il suo verso chiassoso è dovuto alla confusione\\ncreata dalle tre teste che pensano ognuna per\\nconto proprio.",
                "main-type": "grass",
                "other-types": [
                    "psychic"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/103.png",
                "url": "https://pokeapi.co/api/v2/pokemon/103/"
            },
            {
                "id": 104,
                "name": "Cubone",
                "description": "Indossa il teschio di sua madre come elmo.\\nIl suo verso riecheggia all’interno del teschio\\nproducendo una triste melodia.",
                "main-type": "ground",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/104.png",
                "url": "https://pokeapi.co/api/v2/pokemon/104/"
            },
            {
                "id": 105,
                "name": "Marowak",
                "description": "Questo Pokémon era piccolo e debole, ma\\nsi è fatto aggressivo e ha imparato a usare\\nabilmente il suo osso nella lotta.",
                "main-type": "ground",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/105.png",
                "url": "https://pokeapi.co/api/v2/pokemon/105/"
            },
            {
                "id": 106,
                "name": "Hitmonlee",
                "description": "Nel momento in cui il suo calcio colpisce,\\nla pianta del piede si fa dura come il diamante\\nproducendo un impatto devastante.",
                "main-type": "fighting",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/106.png",
                "url": "https://pokeapi.co/api/v2/pokemon/106/"
            },
            {
                "id": 107,
                "name": "Hitmonchan",
                "description": "Attacca facendo ruotare i pugni come un\\ntrapano. Grazie ad essi, è in grado di perforare\\npersino un muro di cemento.",
                "main-type": "fighting",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/107.png",
                "url": "https://pokeapi.co/api/v2/pokemon/107/"
            },
            {
                "id": 108,
                "name": "Lickitung",
                "description": "Ha una lingua lunga circa 2 m, che può muovere\\ncon più scioltezza rispetto alle sue zampe\\nanteriori. Le sue leccate paralizzano.",
                "main-type": "normal",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/108.png",
                "url": "https://pokeapi.co/api/v2/pokemon/108/"
            },
            {
                "id": 109,
                "name": "Koffing",
                "description": "Nei luoghi caldi i suoi gas interni rischiano di\\nespandersi fino a farlo scoppiare, quindi bisogna\\nfare attenzione.",
                "main-type": "poison",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/109.png",
                "url": "https://pokeapi.co/api/v2/pokemon/109/"
            },
            {
                "id": 110,
                "name": "Weezing",
                "description": "Vive assorbendo i gas tossici, i germi\\ne la polvere che si trovano nei rifiuti.",
                "main-type": "poison",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/110.png",
                "url": "https://pokeapi.co/api/v2/pokemon/110/"
            },
            {
                "id": 111,
                "name": "Rhyhorn",
                "description": "Ha una mente molto semplice e riesce a\\nconcentrarsi solo su una cosa alla volta. Quando\\nparte alla carica, si ferma solo se si addormenta.",
                "main-type": "ground",
                "other-types": [
                    "rock"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/111.png",
                "url": "https://pokeapi.co/api/v2/pokemon/111/"
            },
            {
                "id": 112,
                "name": "Rhydon",
                "description": "Ha imparato a camminare in posizione eretta\\ne il suo cervello si è evoluto. La sua pelle simile\\na un’armatura può resistere anche al magma.",
                "main-type": "ground",
                "other-types": [
                    "rock"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/112.png",
                "url": "https://pokeapi.co/api/v2/pokemon/112/"
            },
            {
                "id": 113,
                "name": "Chansey",
                "description": "Un Pokémon gentile e generoso, sempre pronto\\na condividere le sue uova nutrienti con chi si\\ntrova in difficoltà.",
                "main-type": "normal",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/113.png",
                "url": "https://pokeapi.co/api/v2/pokemon/113/"
            },
            {
                "id": 114,
                "name": "Tangela",
                "description": "È coperto da una massa di liane blu che non\\nsmettono mai di crescere. Nessuno sa quale\\nsia il suo vero aspetto.",
                "main-type": "grass",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/114.png",
                "url": "https://pokeapi.co/api/v2/pokemon/114/"
            },
            {
                "id": 115,
                "name": "Kangaskhan",
                "description": "Cresce il suo cucciolo dentro al marsupio.\\nÈ pronto a qualsiasi lotta pur di proteggerlo.",
                "main-type": "normal",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/115.png",
                "url": "https://pokeapi.co/api/v2/pokemon/115/"
            },
            {
                "id": 116,
                "name": "Horsea",
                "description": "Se si sente minacciato, sputa dalla bocca\\nun inchiostro speciale o un potente\\ngetto d’acqua per difendersi.",
                "main-type": "water",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/116.png",
                "url": "https://pokeapi.co/api/v2/pokemon/116/"
            },
            {
                "id": 117,
                "name": "Seadra",
                "description": "Il contatto con la sua pinna dorsale causa\\nstordimento. Dorme con la coda avvolta intorno\\nal corallo per non farsi portare via dalla corrente.",
                "main-type": "water",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/117.png",
                "url": "https://pokeapi.co/api/v2/pokemon/117/"
            },
            {
                "id": 118,
                "name": "Goldeen",
                "description": "Nel periodo in cui i Goldeen depongono\\nle Uova, se ne possono vedere a banchi\\nmentre risalgono fiumi e cascate.",
                "main-type": "water",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/118.png",
                "url": "https://pokeapi.co/api/v2/pokemon/118/"
            },
            {
                "id": 119,
                "name": "Seaking",
                "description": "Il maschio di Seaking usa il corno che ha\\nsulla testa per scavare il nido nelle rocce\\nche si trovano sul letto dei fiumi.",
                "main-type": "water",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/119.png",
                "url": "https://pokeapi.co/api/v2/pokemon/119/"
            },
            {
                "id": 120,
                "name": "Staryu",
                "description": "Si dice che Staryu possa rigenerarsi anche dopo\\nessere stato fatto a pezzetti, purché il suo centro\\nsia rimasto intatto.",
                "main-type": "water",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/120.png",
                "url": "https://pokeapi.co/api/v2/pokemon/120/"
            },
            {
                "id": 121,
                "name": "Starmie",
                "description": "La parte centrale, chiamata nucleo, riluce dei\\nsette colori dell’arcobaleno. Si dice che lo usi\\nper comunicare.",
                "main-type": "water",
                "other-types": [
                    "psychic"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/121.png",
                "url": "https://pokeapi.co/api/v2/pokemon/121/"
            },
            {
                "id": 122,
                "name": "Mr. Mime",
                "description": "È molto abile nella mimica e si esercita\\nin continuazione. Chi lo osserva crede\\ndi vedere cose che in realtà non esistono.",
                "main-type": "psychic",
                "other-types": [
                    "fairy"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/122.png",
                "url": "https://pokeapi.co/api/v2/pokemon/122/"
            },
            {
                "id": 123,
                "name": "Scyther",
                "description": "Salta fuori all’improvviso dall’erba alta per fare\\na fettine le prede con le sue falci affilate.\\nI suoi movimenti ricordano quelli di un ninja.",
                "main-type": "bug",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/123.png",
                "url": "https://pokeapi.co/api/v2/pokemon/123/"
            },
            {
                "id": 124,
                "name": "Jynx",
                "description": "Si muove in modo leggiadro, come se\\ndanzasse seguendo un ritmo tutto suo.\\nCammina ancheggiando.",
                "main-type": "ice",
                "other-types": [
                    "psychic"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/124.png",
                "url": "https://pokeapi.co/api/v2/pokemon/124/"
            },
            {
                "id": 125,
                "name": "Electabuzz",
                "description": "Quando si verifica un grosso blackout,\\nsignifica che questo Pokémon si è intrufolato\\nin una centrale per cibarsi di elettricità.",
                "main-type": "electric",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/125.png",
                "url": "https://pokeapi.co/api/v2/pokemon/125/"
            },
            {
                "id": 126,
                "name": "Magmar",
                "description": "È nato nel cratere di un vulcano.\\nIl suo corpo interamente coperto\\ndi fiamme sembra una palla di fuoco.",
                "main-type": "fire",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/126.png",
                "url": "https://pokeapi.co/api/v2/pokemon/126/"
            },
            {
                "id": 127,
                "name": "Pinsir",
                "description": "Afferra la preda tra le corna, stritolandola\\ncon tutte le sue forze. Vive in ambienti caldi\\npoiché il freddo lo immobilizza.",
                "main-type": "bug",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/127.png",
                "url": "https://pokeapi.co/api/v2/pokemon/127/"
            },
            {
                "id": 128,
                "name": "Tauros",
                "description": "È un Pokémon energico e impetuoso.\\nQuando comincia a correre non si ferma finché\\nnon va a cozzare contro qualcosa.",
                "main-type": "normal",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/128.png",
                "url": "https://pokeapi.co/api/v2/pokemon/128/"
            },
            {
                "id": 129,
                "name": "Magikarp",
                "description": "È famoso per la sua debolezza. Lo si vede\\ncomunemente nuotare nel mare, nei fiumi,\\nnei laghi e in qualsiasi altra pozza d’acqua.",
                "main-type": "water",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/129.png",
                "url": "https://pokeapi.co/api/v2/pokemon/129/"
            },
            {
                "id": 130,
                "name": "Gyarados",
                "description": "Pokémon brutale e feroce, è famoso per aver\\nridotto in cenere intere città nel passato.",
                "main-type": "water",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/130.png",
                "url": "https://pokeapi.co/api/v2/pokemon/130/"
            },
            {
                "id": 131,
                "name": "Lapras",
                "description": "Possiede un animo gentile e capisce il linguaggio\\ndegli esseri umani. Trasporta le persone per\\nmare sul suo dorso.",
                "main-type": "water",
                "other-types": [
                    "ice"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/131.png",
                "url": "https://pokeapi.co/api/v2/pokemon/131/"
            },
            {
                "id": 132,
                "name": "Ditto",
                "description": "Quando incontra un nemico è capace di\\ntrasformarsi in un baleno in una sua copia\\nquasi perfetta.",
                "main-type": "normal",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/132.png",
                "url": "https://pokeapi.co/api/v2/pokemon/132/"
            },
            {
                "id": 133,
                "name": "Eevee",
                "description": "Eevee può evolversi in diverse specie.\\nIl suo corredo genetico è la chiave per fare luce\\nsul mistero dell’evoluzione.",
                "main-type": "normal",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/133.png",
                "url": "https://pokeapi.co/api/v2/pokemon/133/"
            },
            {
                "id": 134,
                "name": "Vaporeon",
                "description": "La sua struttura cellulare è simile a quella\\ndelle molecole dell’acqua. Quando si immerge\\ndiventa invisibile.",
                "main-type": "water",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/134.png",
                "url": "https://pokeapi.co/api/v2/pokemon/134/"
            },
            {
                "id": 135,
                "name": "Jolteon",
                "description": "Passa dalla tristezza all’ira in un soffio.\\nOgni volta che ha uno sbalzo di umore\\nsi carica di elettricità.",
                "main-type": "electric",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/135.png",
                "url": "https://pokeapi.co/api/v2/pokemon/135/"
            },
            {
                "id": 136,
                "name": "Flareon",
                "description": "Nel corpo ha una sacca ardente con cui\\ntrasforma l’aria che respira in fiamme e le emette\\ndalla bocca alla temperatura di 1.700 ºC.",
                "main-type": "fire",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/136.png",
                "url": "https://pokeapi.co/api/v2/pokemon/136/"
            },
            {
                "id": 137,
                "name": "Porygon",
                "description": "Si ritiene che sia l’unico Pokémon in grado\\ndi volare fino allo spazio, ma ad oggi non è\\nancora successo.",
                "main-type": "normal",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/137.png",
                "url": "https://pokeapi.co/api/v2/pokemon/137/"
            },
            {
                "id": 138,
                "name": "Omanyte",
                "description": "Pokémon preistorico rigenerato da un fossile.\\nNuotava nei mari primordiali agitando con\\nmaestria i suoi dieci tentacoli.",
                "main-type": "rock",
                "other-types": [
                    "water"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/138.png",
                "url": "https://pokeapi.co/api/v2/pokemon/138/"
            },
            {
                "id": 139,
                "name": "Omastar",
                "description": "È dotato di denti affilati. Sembra che si sia\\nestinto a causa della conchiglia troppo grande,\\nche lo ostacolava nei movimenti.",
                "main-type": "rock",
                "other-types": [
                    "water"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/139.png",
                "url": "https://pokeapi.co/api/v2/pokemon/139/"
            },
            {
                "id": 140,
                "name": "Kabuto",
                "description": "Pokémon rigenerato da un fossile. Quando\\nsi nasconde sul fondo del mare usa gli occhi\\nche ha sul dorso per guardarsi intorno.",
                "main-type": "rock",
                "other-types": [
                    "water"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/140.png",
                "url": "https://pokeapi.co/api/v2/pokemon/140/"
            },
            {
                "id": 141,
                "name": "Kabutops",
                "description": "È un perfetto nuotatore. Taglia la preda\\ncon le sue falci e ne succhia il sangue.",
                "main-type": "rock",
                "other-types": [
                    "water"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/141.png",
                "url": "https://pokeapi.co/api/v2/pokemon/141/"
            },
            {
                "id": 142,
                "name": "Aerodactyl",
                "description": "Estinto già nell’antichità, questo feroce Pokémon\\npreistorico è stato rigenerato usando del DNA\\nestratto da un pezzo d’ambra.",
                "main-type": "rock",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/142.png",
                "url": "https://pokeapi.co/api/v2/pokemon/142/"
            },
            {
                "id": 143,
                "name": "Snorlax",
                "description": "Mangia qualsiasi cosa gli capiti a tiro, anche\\nse ammuffita, senza mai soffrire di mal di pancia.",
                "main-type": "normal",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/143.png",
                "url": "https://pokeapi.co/api/v2/pokemon/143/"
            },
            {
                "id": 144,
                "name": "Articuno",
                "description": "Questo Pokémon alato leggendario congela\\nl’umidità contenuta nell’aria invernale e fa\\ncadere la neve.",
                "main-type": "ice",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/144.png",
                "url": "https://pokeapi.co/api/v2/pokemon/144/"
            },
            {
                "id": 145,
                "name": "Zapdos",
                "description": "Si dice che questo Pokémon alato leggendario\\nappaia quando il cielo si oscura e i fulmini\\nlacerano l’aria senza sosta.",
                "main-type": "electric",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/145.png",
                "url": "https://pokeapi.co/api/v2/pokemon/145/"
            },
            {
                "id": 146,
                "name": "Moltres",
                "description": "Quando questo Pokémon alato leggendario\\nsbatte le ali di fuoco, anche il cielo notturno\\nsi tinge di rosso.",
                "main-type": "fire",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/146.png",
                "url": "https://pokeapi.co/api/v2/pokemon/146/"
            },
            {
                "id": 147,
                "name": "Dratini",
                "description": "L’esistenza di questo sfuggente Pokémon è stata\\naccertata recentemente, quando qualcuno ne ha\\npescato un esemplare.",
                "main-type": "dragon",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/147.png",
                "url": "https://pokeapi.co/api/v2/pokemon/147/"
            },
            {
                "id": 148,
                "name": "Dragonair",
                "description": "Chi lo ha incontrato racconta che questo\\nPokémon è circondato da un’aura misteriosa.",
                "main-type": "dragon",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/148.png",
                "url": "https://pokeapi.co/api/v2/pokemon/148/"
            },
            {
                "id": 149,
                "name": "Dragonite",
                "description": "Si racconta che questo Pokémon viva\\nda qualche parte nel mare e che si sposti\\nvolando, ma in realtà non si sa nulla di certo.",
                "main-type": "dragon",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/149.png",
                "url": "https://pokeapi.co/api/v2/pokemon/149/"
            },
            {
                "id": 150,
                "name": "Mewtwo",
                "description": "Il suo DNA è quasi uguale a quello di Mew.\\nCiò nonostante, sono agli antipodi per\\ndimensioni e carattere.",
                "main-type": "psychic",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/150.png",
                "url": "https://pokeapi.co/api/v2/pokemon/150/"
            }
        ]
    ''';

    await Future.delayed(const Duration(seconds: _kFakeDelay));

    final map = jsonDecode(json) as List;
    return map.map((item) => PokemonDTO.fromJson(item as Map<String, dynamic>)).toList();
  }
}
