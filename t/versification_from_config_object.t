use t::TestConfig;
use utf8;
binmode(STDIN , ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");
use Data::Dumper;
no warnings;

plan tests => 52;

my $yaml = <<"YAML";
books:
  1: 
    Match:
      Book: ['Genèse', 'Genese']
      Abbreviation: ['Ge']
    Normalized: 
      Book: Genèse
      Abbreviation: Ge
  2: 
    Match:
      Book: ['Exode']
      Abbreviation: ['Ex']
    Normalized: 
      Book: Exode
      Abbreviation: Ex
  3: 
    Match:
      Book: ['Lévitique', 'Levitique']
      Abbreviation: ['Lé']
    Normalized: 
      Book: Lévitique
      Abbreviation: Lé
  4: 
    Match:
      Book: ['Nombres']
      Abbreviation: ['No']
    Normalized: 
      Book: Nombres
      Abbreviation: No
  5: 
    Match:
      Book: ['Deutéronome', 'Deuteronome']
      Abbreviation: ['De', 'Dt']
    Normalized: 
      Book: Deutéronome
      Abbreviation: De
  6: 
    Match:
      Book: ['Josué', 'Josue']
      Abbreviation: ['Jos']
    Normalized: 
      Book: Josué
      Abbreviation: Jos
  7: 
    Match:
      Book: ['Juges']
      Abbreviation: ['Jug', 'Jg']
    Normalized: 
      Book: Juges
      Abbreviation: Jug
  8: 
    Match:
      Book: ['Ruth']
      Abbreviation: ['Ru']
    Normalized: 
      Book: Ruth
      Abbreviation: Ru
  9: 
    Match:
      Book: ['1Samuel', '1 Samuel', '1 Samuel']
      Abbreviation: ['1S', '1 S', '1 S']
    Normalized: 
      Book: 1Samuel
      Abbreviation: 1S
  10: 
    Match:
      Book: ['2Samuel', '2 Samuel', '2 Samuel']
      Abbreviation: ['2S', '2 S', '2 S']
    Normalized: 
      Book: 2Samuel
      Abbreviation: 2S
  11: 
    Match:
      Book: ['1Rois', '1 Rois', '1 Rois']
      Abbreviation: ['1R', '1 R', '1 R']
    Normalized: 
      Book: 1Rois
      Abbreviation: 1R
  12: 
    Match:
      Book: ['2Rois', '2 Rois', '2 Rois']
      Abbreviation: ['2R', '2 R', '2 R']
    Normalized: 
      Book: 2Rois
      Abbreviation: 2R
  13: 
    Match:
      Book: ['1Chroniques', '1 Chroniques', '1 Chroniques']
      Abbreviation: ['1Ch', '1 Ch', '1 Ch']
    Normalized: 
      Book: 1Chroniques
      Abbreviation: 1Ch
  14: 
    Match:
      Book: ['2Chroniques', '2 Chroniques', '2 Chroniques']
      Abbreviation: ['2Ch', '2 Ch', '2 Ch']
    Normalized: 
      Book: 2Chroniques
      Abbreviation: 2Ch
  15: 
    Match:
      Book: ['Esdras']
      Abbreviation: ['Esd']
    Normalized: 
      Book: Esdras
      Abbreviation: Esd
  16: 
    Match:
      Book: ['Néhémie', 'Nehemie']
      Abbreviation: ['Né']
    Normalized: 
      Book: Néhémie
      Abbreviation: Né
  17: 
    Match:
      Book: ['Esther']
      Abbreviation: ['Est']
    Normalized: 
      Book: Esther
      Abbreviation: Est
  18: 
    Match:
      Book: ['Job']
      Abbreviation: ['Job']
    Normalized: 
      Book: Job
      Abbreviation: Job
  19: 
    Match:
      Book: ['Psaumes', 'Psaume', 'psaumes', 'psaume']
      Abbreviation: ['Ps']
    Normalized: 
      Book: Psaume
      Abbreviation: Ps
  20: 
    Match:
      Book: ['Proverbes']
      Abbreviation: ['Pr']
    Normalized: 
      Book: Proverbes
      Abbreviation: Pr
  21: 
    Match:
      Book: ['Ecclésiaste', 'Ecclesiaste']
      Abbreviation: ['Ec']
    Normalized: 
      Book: Ecclésiaste
      Abbreviation: Ec
  22: 
    Match:
      Book: ['Cantique', 'Cantique des Cantiques', 'Cantique des cantiques']
      Abbreviation: ['Ca']
    Normalized: 
      Book: Cantique
      Abbreviation: Ca
  23: 
    Match:
      Book: ['Esaïe', 'Esaie', 'Ésaïe','Ésaie']
      Abbreviation: ['És', 'Esa']
    Normalized: 
      Book: Esaïe
      Abbreviation: Esa
  24: 
    Match:
      Book: ['Jérémie', 'Jeremie']
      Abbreviation: ['Jér', 'Jer', 'Jé']
    Normalized: 
      Book: Jérémie
      Abbreviation: Jér
  25: 
    Match:
      Book: ['Lamentations']
      Abbreviation: ['La']
    Normalized: 
      Book: Lamentations
      Abbreviation: La
  26: 
    Match:
      Book: ['Ezékiel', 'Ezekiel', 'Ézekiel', 'Ézékiel', 'Ezéchiel', 'Ezechiel', 'Ézechiel', 'Ézéchiel']
      Abbreviation: ['Ez', 'Éz']
    Normalized: 
      Book: Ezékiel
      Abbreviation: Ez
  27: 
    Match:
      Book: ['Daniel']
      Abbreviation: ['Da', 'Dan']
    Normalized: 
      Book: Daniel
      Abbreviation: Da
  28: 
    Match:
      Book: ['Osée', 'Osee']
      Abbreviation: ['Os']
    Normalized: 
      Book: Osée
      Abbreviation: Os
  29: 
    Match:
      Book: ['Joël', 'Joel']
      Abbreviation: ['Joe', 'Joë']
    Normalized: 
      Book: Joël
      Abbreviation: Joe
  30: 
    Match:
      Book: ['Amos']
      Abbreviation: ['Am']
    Normalized: 
      Book: Amos
      Abbreviation: Am
  31: 
    Match:
      Book: ['Abdias']
      Abbreviation: ['Ab']
    Normalized: 
      Book: Abdias
      Abbreviation: Ab
  32: 
    Match:
      Book: ['Jonas']
      Abbreviation: ['Jon']
    Normalized: 
      Book: Jonas
      Abbreviation: Jon
  33: 
    Match:
      Book: ['Michée', 'Michee']
      Abbreviation: ['Mic', 'Mi']
    Normalized: 
      Book: Michée
      Abbreviation: Mi
  34: 
    Match:
      Book: ['Nahum']
      Abbreviation: ['Na']
    Normalized: 
      Book: Nahum
      Abbreviation: Na
  35: 
    Match:
      Book: ['Habakuk']
      Abbreviation: ['Ha']
    Normalized: 
      Book: Habakuk
      Abbreviation: Ha
  36: 
    Match:
      Book: ['Sophonie']
      Abbreviation: ['Sop', 'So']
    Normalized: 
      Book: Sophonie
      Abbreviation: Sop
  37: 
    Match:
      Book: ['Aggée', 'Aggee']
      Abbreviation: ['Ag']
    Normalized: 
      Book: Aggée
      Abbreviation: Ag
  38: 
    Match:
      Book: ['Zacharie']
      Abbreviation: ['Za']
    Normalized: 
      Book: Zacharie
      Abbreviation: Za
  39: 
    Match:
      Book: ['Malachie']
      Abbreviation: ['Mal', 'Ma']
    Normalized: 
      Book: Malachie
      Abbreviation: Mal
  40: 
    Match:
      Book: ['Matthieu']
      Abbreviation: ['Mt']
    Normalized: 
      Book: Matthieu
      Abbreviation: Mt
  41: 
    Match:
      Book: ['Marc']
      Abbreviation: ['Mc', 'Mr']
    Normalized: 
      Book: Marc
      Abbreviation: Mr
  42: 
    Match:
      Book: ['Luc']
      Abbreviation: ['Lu']
    Normalized: 
      Book: Luc
      Abbreviation: Lu
  43: 
    Match:
      Book: ['Jean']
      Abbreviation: ['Jn']
    Normalized: 
      Book: Jean
      Abbreviation: Jn
  44: 
    Match:
      Book: ['Actes']
      Abbreviation: ['Ac']
    Normalized: 
      Book: Actes
      Abbreviation: Ac
  45: 
    Match:
      Book: ['Romains']
      Abbreviation: ['Ro']
    Normalized: 
      Book: Romains
      Abbreviation: Ro
  46: 
    Match:
      Book: ['1Corinthiens', '1 Corinthiens', '1 Corinthiens']
      Abbreviation: ['1Co', '1 Co', '1 Co']
    Normalized: 
      Book: 1Corinthiens
      Abbreviation: 1Co
  47: 
    Match:
      Book: ['2Corinthiens', '2 Corinthiens', '2 Corinthiens']
      Abbreviation: ['2Co', '2 Co', '2 Co']
    Normalized: 
      Book: 2Corinthiens
      Abbreviation: 2Co
  48: 
    Match:
      Book: ['Galates']
      Abbreviation: ['Ga']
    Normalized: 
      Book: Galates
      Abbreviation: Ga
  49: 
    Match:
      Book: ['Ephésiens', 'Ephesiens', 'Éphésiens', 'Éphesiens']
      Abbreviation: ['Ép','Ep']
    Normalized: 
      Book: Ephésiens
      Abbreviation: Ep
  50: 
    Match:
      Book: ['Philippiens']
      Abbreviation: ['Ph']
    Normalized: 
      Book: Philippiens
      Abbreviation: Ph
  51: 
    Match:
      Book: ['Colossiens']
      Abbreviation: ['Col']
    Normalized: 
      Book: Colossiens
      Abbreviation: Col
  52: 
    Match:
      Book: ['1Thessaloniciens', '1 Thessaloniciens', '1 Thessaloniciens']
      Abbreviation: ['1Th', '1 Th', '1 Th']
    Normalized: 
      Book: 1Th
      Abbreviation: 1Th
  53: 
    Match:
      Book: ['2Thessaloniciens', '2 Thessaloniciens', '2 Thessaloniciens']
      Abbreviation: ['2Th', '2 Th', '2 Th']
    Normalized: 
      Book: 2Th
      Abbreviation: 2Th
  54: 
    Match:
      Book: ['1Timothée', '1 Timothée', '1Timothee', '1 Timothee', '1 Timothée', '1Timothee', '1 Timothee']
      Abbreviation: ['1Ti', '1 Ti', '1 Ti']
    Normalized: 
      Book: 1Timothée
      Abbreviation: 1Ti
  55: 
    Match:
      Book: ['2Timothée', '2 Timothée', '2Timothee', '2 Timothee', '2 Timothée', '2Timothee', '2 Timothee']
      Abbreviation: ['2Ti', '2 Ti', '2 Ti']
    Normalized: 
      Book: 2Timothée
      Abbreviation: 2Ti
  56: 
    Match:
      Book: ['Tite']
      Abbreviation: ['Tit', 'Ti']
    Normalized: 
      Book: Tite
      Abbreviation: Tit
  57: 
    Match:
      Book: ['Philémon', 'Philemon']
      Abbreviation: ['Phm']
    Normalized: 
      Book: Philémon
      Abbreviation: Phm
  58: 
    Match:
      Book: ['Hébreux', 'Hebreux']
      Abbreviation: ['Hé']
    Normalized: 
      Book: Hébreux
      Abbreviation: Hé
  59: 
    Match:
      Book: ['Jacques']
      Abbreviation: ['Ja']
    Normalized: 
      Book: Jacques
      Abbreviation: Ja
  60: 
    Match:
      Book: ['1Pierre', '1 Pierre', '1 Pierre']
      Abbreviation: ['1P', '1 P', '1Pi', '1 Pi', '1 P', '1Pi', '1 Pi']
    Normalized: 
      Book: 1Pierre
      Abbreviation: 1P
  61: 
    Match:
      Book: ['2Pierre', '2 Pierre', '2 Pierre']
      Abbreviation: ['2P', '2 P', '2Pi', '2 Pi', '2 P', '2Pi', '2 Pi']
    Normalized: 
      Book: 2Pierre
      Abbreviation: 2P
  62: 
    Match:
      Book: ['1Jean', '1 Jean', '1 Jean']
      Abbreviation: ['1Jn', '1 Jn', '1 Jn']
    Normalized: 
      Book: 1Jean
      Abbreviation: 1Jn
  63: 
    Match:
      Book: ['2Jean', '2 Jean', '2 Jean']
      Abbreviation: ['2Jn', '2 Jn', '2 Jn']
    Normalized: 
      Book: 2Jean
      Abbreviation: 2Jn
  64: 
    Match:
      Book: ['3Jean', '3 Jean', '3 Jean']
      Abbreviation: ['3Jn', '3 Jn', '3 Jn']
    Normalized: 
      Book: 3Jean
      Abbreviation: 3Jn
  65: 
    Match:
      Book: ['Jude']
      Abbreviation: ['Jude', 'Jud']
    Normalized: 
      Book: Jude
      Abbreviation: Jude
  66: 
    Match:
      Book: ['Apocalypse']
      Abbreviation: ['Ap']
    Normalized: 
      Book: Apocalypse
      Abbreviation: Ap
  67: 
    Match:
      Book: ['1Esdras', '1 Esdras', '1 Esdras']
      Abbreviation: ['1Es', '1 Es', '1 Es']
    Normalized: 
      Book: 1Esdras
      Abbreviation: 1Es
  68: 
    Match:
      Book: ['2Esdras', '2 Esdras', '2 Esdras']
      Abbreviation: ['2Es', '2 Es', '2 Es']
    Normalized: 
      Book: 2Esdras
      Abbreviation: 2Es
  69: 
    Match:
      Book: ['Tobit']
      Abbreviation: ['Tob']
    Normalized: 
      Book: Tobit
      Abbreviation: Tob
  70: 
    Match:
      Book: ['Judith']
      Abbreviation: ['Jdt']
    Normalized: 
      Book: Judith
      Abbreviation: Jdt
  71: 
    Match:
      Book: ['EstherG']
      Abbreviation: ['EstG']
    Normalized: 
      Book: EstherG
      Abbreviation: EstG
  72: 
    Match:
      Book: ['Wisdom']
      Abbreviation: ['Sag']
    Normalized: 
      Book: Wisdom
      Abbreviation: Sag
  73: 
    Match:
      Book: ['Sirach']
      Abbreviation: ['Sir']
    Normalized: 
      Book: Sirach
      Abbreviation: Sir
  74: 
    Match:
      Book: ['Baruch']
      Abbreviation: ['Bar']
    Normalized: 
      Book: Baruch
      Abbreviation: Bar
  75: 
    Match:
      Book: ['Azariah']
      Abbreviation: ['Aza']
    Normalized: 
      Book: Azariah
      Abbreviation: Aza
  76: 
    Match:
      Book: ['Susanna']
      Abbreviation: ['Sus']
    Normalized: 
      Book: Susanna
      Abbreviation: Sus
  77: 
    Match:
      Book: ['Bel']
      Abbreviation: ['Bel']
    Normalized: 
      Book: Bel
      Abbreviation: Bel
  78: 
    Match:
      Book: ['Manasses']
      Abbreviation: ['Man']
    Normalized: 
      Book: Manasses
      Abbreviation: Man
  79: 
    Match:
      Book: ['1Maccabees', '1 Maccabees', '1 Maccabees']
      Abbreviation: ['1Ma', '1 Ma', '1 Ma']
    Normalized: 
      Book: 1Maccabees
      Abbreviation: 1Ma
  80: 
    Match:
      Book: ['2Maccabees', '2 Maccabees', '2 Maccabees']
      Abbreviation: ['2Ma', '2 Ma', '2 Ma']
    Normalized: 
      Book: 2Maccabees
      Abbreviation: 2Ma
  81: 
    Match:
      Book: ['3Maccabees', '3 Maccabees', '3 Maccabees']
      Abbreviation: ['3Ma', '3 Ma', '3 Ma']
    Normalized: 
      Book: 3Maccabees
      Abbreviation: 3Ma
  82: 
    Match:
      Book: ['4Maccabees', '4 Maccabees', '4 Maccabees']
      Abbreviation: ['4Ma', '4 Ma', '4 Ma']
    Normalized: 
      Book: 4Maccabees
      Abbreviation: 4Ma
  83: 
    Match:
      Book: ['2Psalm', '2 Psalm', '2 Psalm']
      Abbreviation: ['2Ps', '2 Ps', '2 Ps']
    Normalized: 
      Book: 2Psalm
      Abbreviation: 2Ps

reference:
  intervale: -

regex:
  intervale: (?:-|–|−|à)
  chapitre_mots: (?:voir aussi|voir|a|ab|\\(|voir chapitre|\\bde\\b|dans les chapitres|des chap\.)
  verset_mots: (?:vv?\.|voir aussi v\.|voir chapitre|dans les versets|les versets|au verset)

versification:
  Ps 1:3: Ps 1:2
  No 17:3: No 16:38
  Éz 17:3: Éz 16:38
  Ps 1:5: Ps 1:6
  Jn 10:41: Jn 10:42
  Ac 7:59: Ac 7:60
  Ac 19:40: Ac 19:41
  2Co 13:12: 2Co 13:13
  2Co 13:13: 2Co 13:14
  3Jn 1:15: 3Jn 1:14
  Ap 12:18: Ap 12:17
  No 17:1: No 16:36
  No 17:2: No 16:37
  No 17:3: No 16:38
  No 17:4: No 16:39
  No 17:5: No 16:40
  No 17:6: No 16:41
  No 17:7: No 16:42
  No 17:8: No 16:43
  No 17:9: No 16:44
  No 17:10: No 16:45
  No 17:11: No 16:46
  No 17:12: No 16:47
  No 17:13: No 16:48
  No 17:14: No 16:49
  No 17:15: No 16:50
  No 17:16: No 17:1
  No 17:17: No 17:2
  No 17:18: No 17:3
  No 17:19: No 17:4
  No 17:20: No 17:5
  No 17:21: No 17:6
  No 17:22: No 17:7
  No 17:23: No 17:8
  No 17:24: No 17:9
  No 17:25: No 17:10
  No 17:26: No 17:11
  No 17:27: No 17:12
  No 17:28: No 17:13
  Jn 10:41: Jn 10:42
  Ac 7:59: Ac 7:60
  Ac 19:40: Ac 19:41
  2Co 13:12: 2Co 13:13
  2Co 13:13: 2Co 13:14
  3Jn 1:15: 3Jn 1:14
  Ap 12:18: Ap 12:17
  No 17:1: No 16:36
  No 17:2: No 16:37
  No 17:3: No 16:38
  No 17:4: No 16:39
  No 17:5: No 16:40
  No 17:6: No 16:41
  No 17:7: No 16:42
  No 17:8: No 16:43
  No 17:9: No 16:44
  No 17:10: No 16:45
  No 17:11: No 16:46
  No 17:12: No 16:47
  No 17:13: No 16:48
  No 17:14: No 16:49
  No 17:15: No 16:50
  No 17:16: No 17:1
  No 17:17: No 17:2
  No 17:18: No 17:3
  No 17:19: No 17:4
  No 17:20: No 17:5
  No 17:21: No 17:6
  No 17:22: No 17:7
  No 17:23: No 17:8
  No 17:24: No 17:9
  No 17:25: No 17:10
  No 17:26: No 17:11
  No 17:27: No 17:12
  No 17:28: No 17:13
  No 25:19: No 26:1
  No 30:1: No 29:40
  No 30:2: No 30:1
  No 30:3: No 30:2
  No 30:4: No 30:3
  No 30:5: No 30:4
  No 30:6: No 30:5
  No 30:7: No 30:6
  No 30:8: No 30:7
  No 30:9: No 30:8
  No 30:10: No 30:9
  No 30:11: No 30:10
  No 30:12: No 30:11
  No 30:13: No 30:12
  No 30:14: No 30:13
  No 30:15: No 30:14
  No 30:16: No 30:15
  No 30:17: No 30:16
  Ge 32:1: Ge 31:55
  Ge 32:2: Ge 32:1
  Ge 32:3: Ge 32:2
  Ge 32:4: Ge 32:3
  Ge 32:5: Ge 32:4
  Ge 32:6: Ge 32:5
  Ge 32:7: Ge 32:8
  Ge 32:8: Ge 32:9
  Ge 32:9: Ge 32:10
  Ge 32:10: Ge 32:11
  Ge 32:11: Ge 32:12
  Ge 32:12: Ge 32:13
  Ge 32:13: Ge 32:14
  Ge 32:14: Ge 32:15
  Ge 32:15: Ge 32:16
  Ge 32:16: Ge 32:17
  Ge 32:17: Ge 32:18
  Ge 32:18: Ge 32:19
  Ge 32:19: Ge 32:20
  Ge 32:20: Ge 32:21
  Ge 32:21: Ge 32:22
  Ge 32:22: Ge 32:23
  Ge 32:23: Ge 32:24
  Ge 32:24: Ge 32:25
  Ge 32:25: Ge 32:26
  Ge 32:26: Ge 32:27
  Ge 32:27: Ge 32:28
  Ge 32:28: Ge 32:29
  Ge 32:29: Ge 32:30
  Ge 32:30: Ge 32:31
  Ge 32:31: Ge 32:32
  Ge 32:32: Ge 32:33
  Ge 32:33: Ge 32:32
  De 13:1: De 12:32
  De 13:2: De 13:1
  De 13:3: De 13:2
  De 13:4: De 13:3
  De 13:5: De 13:4
  De 13:6: De 13:5
  De 13:7: De 13:6
  De 13:8: De 13:7
  De 13:9: De 13:8
  De 13:10: De 13:9
  De 13:11: De 13:10
  De 13:12: De 13:11
  De 13:13: De 13:12
  De 13:14: De 13:13
  De 13:15: De 13:14
  De 13:16: De 13:15
  De 13:17: De 13:16
  De 13:18: De 13:17
  De 13:19: De 13:18
  De 23:1: De 22:30
  De 23:2: De 23:1
  De 23:3: De 23:2
  De 23:4: De 23:3
  De 23:5: De 23:4
  De 23:6: De 23:5
  De 23:7: De 23:6
  De 23:8: De 23:7
  De 23:9: De 23:8
  De 23:10: De 23:9
  De 23:11: De 23:10
  De 23:12: De 23:11
  De 23:13: De 23:12
  De 23:14: De 23:13
  De 23:15: De 23:14
  De 23:16: De 23:15
  De 23:17: De 23:16
  De 23:18: De 23:17
  De 23:19: De 23:18
  De 23:20: De 23:19
  De 23:21: De 23:20
  De 23:22: De 23:21
  De 23:23: De 23:22
  De 23:24: De 23:23
  De 23:25: De 23:24
  De 23:26: De 23:25
  De 28:69: De 29:1
  De 29:1: De 29:2
  De 29:2: De 29:3
  De 29:3: De 29:4
  De 29:4: De 29:5
  De 29:5: De 29:6
  De 29:6: De 29:7
  De 29:7: De 29:8
  De 29:8: De 29:9
  De 29:9: De 29:10
  De 29:10: De 29:11
  De 29:11: De 29:12
  De 29:12: De 29:13
  De 29:13: De 29:14
  De 29:14: De 29:15
  De 29:15: De 29:16
  De 29:16: De 29:17
  De 29:17: De 29:18
  De 29:18: De 29:19
  De 29:19: De 29:20
  De 29:20: De 29:21
  De 29:21: De 29:22
  De 29:22: De 29:23
  De 29:23: De 29:24
  De 29:24: De 29:25
  De 29:25: De 29:26
  De 29:26: De 29:27
  De 29:27: De 29:28
  De 29:28: De 29:29
  1S 21:16: 1S 21:15
  2S 19:1: 2S 18:33
  2S 19:2: 2S 19:1
  2S 19:3: 2S 19:2
  2S 19:4: 2S 19:3
  2S 19:5: 2S 19:4
  2S 19:6: 2S 19:5
  2S 19:7: 2S 19:6
  2S 19:8: 2S 19:7
  2S 19:9: 2S 19:8
  2S 19:10: 2S 19:9
  2S 19:11: 2S 19:10
  2S 19:12: 2S 19:11
  2S 19:13: 2S 19:12
  2S 19:14: 2S 19:13
  2S 19:15: 2S 19:14
  2S 19:16: 2S 19:15
  2S 19:17: 2S 19:16
  2S 19:18: 2S 19:17
  2S 19:19: 2S 19:18
  2S 19:20: 2S 19:19
  2S 19:21: 2S 19:20
  2S 19:22: 2S 19:21
  2S 19:23: 2S 19:22
  2S 19:24: 2S 19:23
  2S 19:25: 2S 19:24
  2S 19:26: 2S 19:25
  2S 19:27: 2S 19:26
  2S 19:28: 2S 19:27
  2S 19:29: 2S 19:28
  2S 19:30: 2S 19:29
  2S 19:31: 2S 19:30
  2S 19:32: 2S 19:31
  2S 19:33: 2S 19:32
  2S 19:34: 2S 19:33
  2S 19:35: 2S 19:34
  2S 19:36: 2S 19:35
  2S 19:37: 2S 19:36
  2S 19:38: 2S 19:37
  2S 19:39: 2S 19:38
  2S 19:40: 2S 19:39
  2S 19:41: 2S 19:40
  2S 19:42: 2S 19:41
  2S 19:43: 2S 19:42
  2S 19:44: 2S 19:43
  1R 5:1: 1R 4:21
  1R 5:2: 1R 4:22
  1R 5:3: 1R 4:23
  1R 5:4: 1R 4:24
  1R 5:5: 1R 4:25
  1R 5:6: 1R 4:26
  1R 5:7: 1R 4:27
  1R 5:8: 1R 4:28
  1R 5:9: 1R 4:29
  1R 5:10: 1R 4:30
  1R 5:11: 1R 4:31
  1R 5:12: 1R 4:32
  1R 5:13: 1R 4:33
  1R 5:14: 1R 4:34
  1R 5:15: 1R 5:1
  1R 5:16: 1R 5:2
  1R 5:17: 1R 5:3
  1R 5:18: 1R 5:4
  1R 5:19: 1R 5:5
  1R 5:20: 1R 5:6
  1R 5:21: 1R 5:7
  1R 5:22: 1R 5:8
  1R 5:23: 1R 5:9
  1R 5:24: 1R 5:10
  1R 5:25: 1R 5:11
  1R 5:26: 1R 5:12
  1R 5:27: 1R 5:13
  1R 5:28: 1R 5:14
  1R 5:29: 1R 5:15
  1R 5:30: 1R 5:16
  1R 5:30: 1R 5:17
  1R 5:32: 1R 5:18
  1R 22:54: 1R 22:53
  2R 12:1: 2R 11:21
  2R 12:2: 2R 12:1
  2R 12:3: 2R 12:2
  2R 12:4: 2R 12:3
  2R 12:5: 2R 12:4
  2R 12:6: 2R 12:5
  2R 12:7: 2R 12:6
  2R 12:8: 2R 12:7
  2R 12:9: 2R 12:8
  2R 12:10: 2R 12:9
  2R 12:11: 2R 12:10
  2R 12:12: 2R 12:11
  2R 12:13: 2R 12:12
  2R 12:14: 2R 12:13
  2R 12:15: 2R 12:14
  2R 12:16: 2R 12:15
  2R 12:17: 2R 12:16
  2R 12:18: 2R 12:17
  2R 12:19: 2R 12:18
  2R 12:20: 2R 12:19
  2R 12:21: 2R 12:20
  2R 12:22: 2R 12:21
  1S 24:1: 1S 23:29
  1S 24:10: 1S 24:9
  1S 24:11: 1S 24:10
  1S 24:12: 1S 24:11
  1S 24:13: 1S 24:12
  1S 24:14: 1S 24:13
  1S 24:15: 1S 24:14
  1S 24:16: 1S 24:15
  1S 24:17: 1S 24:16
  1S 24:18: 1S 24:17
  1S 24:19: 1S 24:18
  1S 24:2: 1S 24:1
  1S 24:20: 1S 24:19
  1S 24:21: 1S 24:20
  1S 24:22: 1S 24:21
  1S 24:23: 1S 24:22
  1S 24:3: 1S 24:2
  1S 24:4: 1S 24:3
  1S 24:5: 1S 24:4
  1S 24:6: 1S 24:5
  1S 24:7: 1S 24:6
  1S 24:8: 1S 24:7
  1S 24:9: 1S 24:8
  1Ch 5:27: 1Ch 6:1
  1Ch 5:28: 1Ch 6:2
  1Ch 5:29: 1Ch 6:3
  1Ch 5:30: 1Ch 6:4
  1Ch 5:31: 1Ch 6:5
  1Ch 5:32: 1Ch 6:6
  1Ch 5:33: 1Ch 6:7
  1Ch 5:34: 1Ch 6:8
  1Ch 5:35: 1Ch 6:9
  1Ch 5:36: 1Ch 6:10
  1Ch 5:37: 1Ch 6:11
  1Ch 5:38: 1Ch 6:12
  1Ch 5:39: 1Ch 6:13
  1Ch 5:40: 1Ch 6:14
  1Ch 5:41: 1Ch 6:15
  1Ch 6:1: 1Ch 6:16
  1Ch 6:2: 1Ch 6:17
  1Ch 6:3: 1Ch 6:18
  1Ch 6:4: 1Ch 6:19
  1Ch 6:5: 1Ch 6:20
  1Ch 6:6: 1Ch 6:21
  1Ch 6:7: 1Ch 6:22
  1Ch 6:8: 1Ch 6:23
  1Ch 6:9: 1Ch 6:24
  1Ch 6:10: 1Ch 6:25
  1Ch 6:11: 1Ch 6:26
  1Ch 6:12: 1Ch 6:27
  1Ch 6:13: 1Ch 6:28
  1Ch 6:14: 1Ch 6:29
  1Ch 6:15: 1Ch 6:30
  1Ch 6:16: 1Ch 6:31
  1Ch 6:17: 1Ch 6:32
  1Ch 6:18: 1Ch 6:33
  1Ch 6:19: 1Ch 6:34
  1Ch 6:20: 1Ch 6:35
  1Ch 6:21: 1Ch 6:36
  1Ch 6:22: 1Ch 6:37
  1Ch 6:23: 1Ch 6:38
  1Ch 6:24: 1Ch 6:39
  1Ch 6:25: 1Ch 6:40
  1Ch 6:26: 1Ch 6:41
  1Ch 6:27: 1Ch 6:42
  1Ch 6:28: 1Ch 6:43
  1Ch 6:29: 1Ch 6:44
  1Ch 6:30: 1Ch 6:45
  1Ch 6:31: 1Ch 6:46
  1Ch 6:32: 1Ch 6:47
  1Ch 6:33: 1Ch 6:48
  1Ch 6:34: 1Ch 6:49
  1Ch 6:35: 1Ch 6:50
  1Ch 6:36: 1Ch 6:51
  1Ch 6:37: 1Ch 6:52
  1Ch 6:38: 1Ch 6:53
  1Ch 6:39: 1Ch 6:54
  1Ch 6:40: 1Ch 6:55
  1Ch 6:41: 1Ch 6:56
  1Ch 6:42: 1Ch 6:57
  1Ch 6:43: 1Ch 6:58
  1Ch 6:44: 1Ch 6:59
  1Ch 6:45: 1Ch 6:60
  1Ch 6:46: 1Ch 6:61
  1Ch 6:47: 1Ch 6:62
  1Ch 6:48: 1Ch 6:63
  1Ch 6:49: 1Ch 6:64
  1Ch 6:50: 1Ch 6:65
  1Ch 6:51: 1Ch 6:66
  1Ch 6:52: 1Ch 6:67
  1Ch 6:53: 1Ch 6:68
  1Ch 6:54: 1Ch 6:69
  1Ch 6:55: 1Ch 6:70
  1Ch 6:56: 1Ch 6:71
  1Ch 6:57: 1Ch 6:72
  1Ch 6:58: 1Ch 6:73
  1Ch 6:59: 1Ch 6:74
  1Ch 6:60: 1Ch 6:75
  1Ch 6:61: 1Ch 6:76
  1Ch 6:62: 1Ch 6:77
  1Ch 6:63: 1Ch 6:78
  1Ch 6:64: 1Ch 6:79
  1Ch 6:65: 1Ch 6:80
  1Ch 6:66: 1Ch 6:81
  1Ch 12:41: 1Ch 12:40
  2Ch 1:18: 2Ch 2:1
  2Ch 2:1: 2Ch 2:2
  2Ch 2:2: 2Ch 2:3
  2Ch 2:3: 2Ch 2:4
  2Ch 2:4: 2Ch 2:5
  2Ch 2:5: 2Ch 2:6
  2Ch 2:6: 2Ch 2:7
  2Ch 2:7: 2Ch 2:8
  2Ch 2:8: 2Ch 2:9
  2Ch 2:9: 2Ch 2:10
  2Ch 2:10: 2Ch 2:11
  2Ch 2:11: 2Ch 2:12
  2Ch 2:12: 2Ch 2:13
  2Ch 2:13: 2Ch 2:14
  2Ch 2:14: 2Ch 2:15
  2Ch 2:15: 2Ch 2:16
  2Ch 2:16: 2Ch 2:17
  2Ch 2:17: 2Ch 2:18
  2Ch 13:23: 2Ch 14:1
  2Ch 14:1: 2Ch 14:2
  2Ch 14:10: 2Ch 14:11
  2Ch 14:11: 2Ch 14:12
  2Ch 14:12: 2Ch 14:13
  2Ch 14:13: 2Ch 14:14
  2Ch 14:14: 2Ch 14:15
  2Ch 14:2: 2Ch 14:3
  2Ch 14:3: 2Ch 14:4
  2Ch 14:4: 2Ch 14:5
  2Ch 14:5: 2Ch 14:6
  2Ch 14:6: 2Ch 14:7
  2Ch 14:7: 2Ch 14:8
  2Ch 14:8: 2Ch 14:9
  2Ch 14:9: 2Ch 14:10
  Ca 7:1: Ca 6:13
  Ca 7:10: Ca 7:9
  Ca 7:11: Ca 7:10
  Ca 7:12: Ca 7:11
  Ca 7:13: Ca 7:12
  Ca 7:14: Ca 7:13
  Ca 7:2: Ca 7:1
  Ca 7:3: Ca 7:2
  Ca 7:4: Ca 7:3
  Ca 7:5: Ca 7:4
  Ca 7:6: Ca 7:5
  Ca 7:7: Ca 7:6
  Ca 7:8: Ca 7:7
  Ca 7:9: Ca 7:8
  Da 3:31: Da 4:1
  Da 3:32: Da 4:2
  Da 3:33: Da 4:3
  Da 4:1: Da 4:4
  Da 4:2: Da 4:5
  Da 4:3: Da 4:6
  Da 4:4: Da 4:7
  Da 4:5: Da 4:8
  Da 4:6: Da 4:9
  Da 4:7: Da 4:10
  Da 4:8: Da 4:11
  Da 4:9: Da 4:12
  Da 4:10: Da 4:13
  Da 4:11: Da 4:14
  Da 4:12: Da 4:15
  Da 4:13: Da 4:16
  Da 4:14: Da 4:17
  Da 4:15: Da 4:18
  Da 4:16: Da 4:19
  Da 4:17: Da 4:20
  Da 4:18: Da 4:21
  Da 4:19: Da 4:22
  Da 4:20: Da 4:23
  Da 4:21: Da 4:24
  Da 4:22: Da 4:25
  Da 4:23: Da 4:26
  Da 4:24: Da 4:27
  Da 4:25: Da 4:28
  Da 4:26: Da 4:29
  Da 4:27: Da 4:30
  Da 4:28: Da 4:31
  Da 4:29: Da 4:32
  Da 4:30: Da 4:33
  Da 4:31: Da 4:34
  Da 4:32: Da 4:35
  Da 4:33: Da 4:36
  Da 4:34: Da 4:37
  Da 6:1: Da 5:31
  Da 6:2: Da 6:1
  Da 6:3: Da 6:2
  Da 6:4: Da 6:3
  Da 6:5: Da 6:4
  Da 6:6: Da 6:5
  Da 6:7: Da 6:6
  Da 6:8: Da 6:7
  Da 6:9: Da 6:8
  Da 6:10: Da 6:9
  Da 6:11: Da 6:10
  Da 6:12: Da 6:11
  Da 6:13: Da 6:12
  Da 6:14: Da 6:13
  Da 6:15: Da 6:14
  Da 6:16: Da 6:15
  Da 6:17: Da 6:16
  Da 6:18: Da 6:17
  Da 6:19: Da 6:18
  Da 6:20: Da 6:19
  Da 6:21: Da 6:20
  Da 6:22: Da 6:21
  Da 6:23: Da 6:22
  Da 6:24: Da 6:23
  Da 6:25: Da 6:24
  Da 6:26: Da 6:25
  Da 6:27: Da 6:26
  Da 6:28: Da 6:27
  Da 6:29: Da 6:28
  Ec 4:17: Ec 5:1
  Ec 5:1: Ec 5:2
  Ec 5:10: Ec 5:11
  Ec 5:11: Ec 5:12
  Ec 5:12: Ec 5:13
  Ec 5:13: Ec 5:14
  Ec 5:14: Ec 5:15
  Ec 5:15: Ec 5:16
  Ec 5:16: Ec 5:17
  Ec 5:17: Ec 5:18
  Ec 5:18: Ec 5:19
  Ec 5:19: Ec 5:20
  Ec 5:2: Ec 5:3
  Ec 5:3: Ec 5:4
  Ec 5:4: Ec 5:5
  Ec 5:5: Ec 5:6
  Ec 5:6: Ec 5:7
  Ec 5:7: Ec 5:8
  Ec 5:8: Ec 5:9
  Ec 5:9: Ec 5:10
  Esa 64:1: Esa 64:2
  Esa 64:10: Esa 64:11
  Esa 64:11: Esa 64:12
  Esa 64:2: Esa 64:3
  Esa 64:3: Esa 64:4
  Esa 64:4: Esa 64:5
  Esa 64:5: Esa 64:6
  Esa 64:6: Esa 64:7
  Esa 64:7: Esa 64:8
  Esa 64:8: Esa 64:9
  Esa 64:9: Esa 64:10
  Esa 8:23: Esa 9:1
  Esa 9:1: Esa 9:2
  Esa 9:10: Esa 9:11
  Esa 9:11: Esa 9:12
  Esa 9:12: Esa 9:13
  Esa 9:13: Esa 9:14
  Esa 9:14: Esa 9:15
  Esa 9:15: Esa 9:16
  Esa 9:16: Esa 9:17
  Esa 9:17: Esa 9:18
  Esa 9:18: Esa 9:19
  Esa 9:19: Esa 9:20
  Esa 9:2: Esa 9:3
  Esa 9:20: Esa 9:21
  Esa 9:3: Esa 9:4
  Esa 9:4: Esa 9:5
  Esa 9:5: Esa 9:6
  Esa 9:6: Esa 9:7
  Esa 9:7: Esa 9:8
  Esa 9:8: Esa 9:9
  Esa 9:9: Esa 9:10
  Ex 7:26: Ex 8:1
  Ex 7:27: Ex 8:2
  Ex 7:28: Ex 8:3
  Ex 7:29: Ex 8:4
  Ex 8:1: Ex 8:5
  Ex 8:10: Ex 8:14
  Ex 8:11: Ex 8:15
  Ex 8:12: Ex 8:16
  Ex 8:13: Ex 8:17
  Ex 8:14: Ex 8:18
  Ex 8:15: Ex 8:19
  Ex 8:16: Ex 8:20
  Ex 8:17: Ex 8:21
  Ex 8:18: Ex 8:22
  Ex 8:19: Ex 8:23
  Ex 8:2: Ex 8:6
  Ex 8:20: Ex 8:24
  Ex 8:21: Ex 8:25
  Ex 8:22: Ex 8:26
  Ex 8:23: Ex 8:27
  Ex 8:24: Ex 8:28
  Ex 8:25: Ex 8:29
  Ex 8:26: Ex 8:30
  Ex 8:27: Ex 8:31
  Ex 8:28: Ex 8:32
  Ex 8:3: Ex 8:7
  Ex 8:4: Ex 8:8
  Ex 8:5: Ex 8:9
  Ex 8:6: Ex 8:10
  Ex 8:7: Ex 8:11
  Ex 8:8: Ex 8:12
  Ex 8:9: Ex 8:13
  Ex 21:37: Ex 22:1
  Ex 22:1: Ex 22:2
  Ex 22:2: Ex 22:3
  Ex 22:3: Ex 22:4
  Ex 22:4: Ex 22:5
  Ex 22:5: Ex 22:6
  Ex 22:6: Ex 22:7
  Ex 22:7: Ex 22:8
  Ex 22:8: Ex 22:9
  Ex 22:9: Ex 22:10
  Ex 22:10: Ex 22:11
  Ex 22:11: Ex 22:12
  Ex 22:12: Ex 22:13
  Ex 22:13: Ex 22:14
  Ex 22:14: Ex 22:15
  Ex 22:15: Ex 22:16
  Ex 22:16: Ex 22:17
  Ex 22:17: Ex 22:18
  Ex 22:18: Ex 22:19
  Ex 22:19: Ex 22:20
  Ex 22:20: Ex 22:21
  Ex 22:21: Ex 22:22
  Ex 22:22: Ex 22:23
  Ex 22:23: Ex 22:24
  Ex 22:24: Ex 22:25
  Ex 22:25: Ex 22:26
  Ex 22:26: Ex 22:27
  Ex 22:27: Ex 22:28
  Ex 22:28: Ex 22:29
  Ex 22:29: Ex 22:30
  Ex 22:30: Ex 22:31
  Ez 21:1: Ez 20:45
  Ez 21:10: Ez 21:5
  Ez 21:11: Ez 21:6
  Ez 21:12: Ez 21:7
  Ez 21:13: Ez 21:8
  Ez 21:14: Ez 21:9
  Ez 21:15: Ez 21:10
  Ez 21:16: Ez 21:11
  Ez 21:17: Ez 21:12
  Ez 21:18: Ez 21:13
  Ez 21:19: Ez 21:14
  Ez 21:2: Ez 20:46
  Ez 21:20: Ez 21:15
  Ez 21:21: Ez 21:16
  Ez 21:22: Ez 21:17
  Ez 21:23: Ez 21:18
  Ez 21:24: Ez 21:19
  Ez 21:25: Ez 21:20
  Ez 21:26: Ez 21:21
  Ez 21:27: Ez 21:22
  Ez 21:28: Ez 21:23
  Ez 21:29: Ez 21:24
  Ez 21:3: Ez 20:47
  Ez 21:30: Ez 21:25
  Ez 21:31: Ez 21:26
  Ez 21:32: Ez 21:27
  Ez 21:33: Ez 21:28
  Ez 21:34: Ez 21:29
  Ez 21:35: Ez 21:30
  Ez 21:36: Ez 21:31
  Ez 21:37: Ez 21:32
  Ez 21:4: Ez 20:48
  Ez 21:5: Ez 20:49
  Ez 21:6: Ez 21:1
  Ez 21:7: Ez 21:2
  Ez 21:8: Ez 21:3
  Ez 21:9: Ez 21:4
  Jér 8:23: Jér 9:1
  Jér 9:1: Jér 9:2
  Jér 9:2: Jér 9:3
  Jér 9:3: Jér 9:4
  Jér 9:4: Jér 9:5
  Jér 9:5: Jér 9:6
  Jér 9:6: Jér 9:7
  Jér 9:7: Jér 9:8
  Jér 9:8: Jér 9:9
  Jér 9:9: Jér 9:10
  Jér 9:10: Jér 9:11
  Jér 9:11: Jér 9:12
  Jér 9:12: Jér 9:13
  Jér 9:13: Jér 9:14
  Jér 9:14: Jér 9:15
  Jér 9:15: Jér 9:16
  Jér 9:16: Jér 9:17
  Jér 9:17: Jér 9:18
  Jér 9:18: Jér 9:19
  Jér 9:19: Jér 9:20
  Jér 9:20: Jér 9:21
  Jér 9:21: Jér 9:22
  Jér 9:22: Jér 9:23
  Jér 9:23: Jér 9:24
  Jér 9:24: Jér 9:25
  Jér 9:25: Jér 9:26
  Job 40:25: Job 41:1
  Job 40:26: Job 41:2
  Job 40:27: Job 41:3
  Job 40:28: Job 41:4
  Job 40:29: Job 41:5
  Job 40:30: Job 41:6
  Job 40:31: Job 41:7
  Job 40:32: Job 41:8
  Job 41:1: Job 41:9
  Job 41:2: Job 41:10
  Job 41:3: Job 41:11
  Job 41:4: Job 41:12
  Job 41:5: Job 41:13
  Job 41:6: Job 41:14
  Job 41:7: Job 41:15
  Job 41:8: Job 41:16
  Job 41:9: Job 41:17
  Job 41:10: Job 41:18
  Job 41:11: Job 41:19
  Job 41:12: Job 41:20
  Job 41:13: Job 41:21
  Job 41:14: Job 41:22
  Job 41:15: Job 41:23
  Job 41:16: Job 41:24
  Job 41:17: Job 41:25
  Job 41:18: Job 41:26
  Job 41:19: Job 41:27
  Job 41:20: Job 41:28
  Job 41:21: Job 41:29
  Job 41:22: Job 41:30
  Job 41:23: Job 41:31
  Job 41:24: Job 41:32
  Job 41:25: Job 41:33
  Job 41:26: Job 41:34
  Joe 3:1: Joe 2:28
  Joe 3:2: Joe 2:29
  Joe 3:3: Joe 2:30
  Joe 3:4: Joe 2:31
  Joe 3:5: Joe 2:32
  Joe 4:1: Joe 3:1
  Joe 4:2: Joe 3:2
  Joe 4:3: Joe 3:3
  Joe 4:4: Joe 3:4
  Joe 4:5: Joe 3:5
  Joe 4:6: Joe 3:6
  Joe 4:7: Joe 3:7
  Joe 4:8: Joe 3:8
  Joe 4:9: Joe 3:9
  Joe 4:10: Joe 3:10
  Joe 4:11: Joe 3:11
  Joe 4:12: Joe 3:12
  Joe 4:13: Joe 3:13
  Joe 4:14: Joe 3:14
  Joe 4:15: Joe 3:15
  Joe 4:16: Joe 3:16
  Joe 4:17: Joe 3:17
  Joe 4:18: Joe 3:18
  Joe 4:19: Joe 3:19
  Joe 4:20: Joe 3:20
  Joe 4:21: Joe 3:21
  Jon 2:1: Jon 1:17
  Jon 2:10: Jon 2:9
  Jon 2:11: Jon 2:10
  Jon 2:2: Jon 2:1
  Jon 2:3: Jon 2:2
  Jon 2:4: Jon 2:3
  Jon 2:5: Jon 2:4
  Jon 2:6: Jon 2:5
  Jon 2:7: Jon 2:6
  Jon 2:8: Jon 2:7
  Jon 2:9: Jon 2:8
  Lé 5:20: Lé 6:1
  Lé 5:21: Lé 6:2
  Lé 5:22: Lé 6:3
  Lé 5:23: Lé 6:4
  Lé 5:24: Lé 6:5
  Lé 5:25: Lé 6:6
  Lé 5:26: Lé 6:7
  Lé 6:1: Lé 6:8
  Lé 6:10: Lé 6:17
  Lé 6:11: Lé 6:18
  Lé 6:12: Lé 6:19
  Lé 6:13: Lé 6:20
  Lé 6:14: Lé 6:21
  Lé 6:15: Lé 6:22
  Lé 6:16: Lé 6:23
  Lé 6:17: Lé 6:24
  Lé 6:18: Lé 6:25
  Lé 6:19: Lé 6:26
  Lé 6:2: Lé 6:9
  Lé 6:20: Lé 6:27
  Lé 6:21: Lé 6:28
  Lé 6:22: Lé 6:29
  Lé 6:23: Lé 6:30
  Lé 6:3: Lé 6:10
  Lé 6:4: Lé 6:11
  Lé 6:5: Lé 6:12
  Lé 6:6: Lé 6:13
  Lé 6:7: Lé 6:14
  Lé 6:8: Lé 6:15
  Lé 6:9: Lé 6:16
  Mal 3:19: Mal 4:1
  Mal 3:20: Mal 4:2
  Mal 3:21: Mal 4:3
  Mal 3:22: Mal 4:4
  Mal 3:23: Mal 4:5
  Mal 3:24: Mal 4:6
  Mr 1:45: Mr 1:44
  Mr 1:46: Mr 1:45
  Mr 9:51: Mr 9:50
  Mi 4:14: Mi 5:1
  Mi 5:1: Mi 5:2
  Mi 5:10: Mi 5:11
  Mi 5:11: Mi 5:12
  Mi 5:12: Mi 5:13
  Mi 5:13: Mi 5:14
  Mi 5:14: Mi 5:15
  Mi 5:2: Mi 5:3
  Mi 5:3: Mi 5:4
  Mi 5:4: Mi 5:5
  Mi 5:5: Mi 5:6
  Mi 5:6: Mi 5:7
  Mi 5:7: Mi 5:8
  Mi 5:8: Mi 5:9
  Mi 5:9: Mi 5:10
  Né 3:33: Né 4:1
  Né 3:34: Né 4:2
  Né 3:35: Né 4:3
  Né 3:36: Né 4:4
  Né 3:37: Né 4:5
  Né 3:38: Né 4:6
  Né 4:1: Né 4:7
  Né 4:2: Né 4:8
  Né 4:3: Né 4:9
  Né 4:4: Né 4:10
  Né 4:5: Né 4:11
  Né 4:6: Né 4:12
  Né 4:7: Né 4:13
  Né 4:8: Né 4:14
  Né 4:9: Né 4:15
  Né 4:10: Né 4:16
  Né 4:11: Né 4:17
  Né 4:12: Né 4:18
  Né 4:13: Né 4:19
  Né 4:14: Né 4:20
  Né 4:15: Né 4:21
  Né 4:16: Né 4:22
  Né 4:17: Né 4:23
  Né 10:1: Né 9:38
  Né 10:2: Né 10:1
  Né 10:3: Né 10:2
  Né 10:4: Né 10:3
  Né 10:5: Né 10:4
  Né 10:6: Né 10:5
  Né 10:7: Né 10:6
  Né 10:8: Né 10:7
  Né 10:9: Né 10:8
  Né 10:10: Né 10:9
  Né 10:11: Né 10:10
  Né 10:12: Né 10:11
  Né 10:13: Né 10:12
  Né 10:14: Né 10:13
  Né 10:15: Né 10:14
  Né 10:16: Né 10:15
  Né 10:17: Né 10:16
  Né 10:18: Né 10:17
  Né 10:19: Né 10:18
  Né 10:20: Né 10:19
  Né 10:21: Né 10:20
  Né 10:22: Né 10:21
  Né 10:23: Né 10:22
  Né 10:24: Né 10:23
  Né 10:25: Né 10:24
  Né 10:26: Né 10:25
  Né 10:27: Né 10:26
  Né 10:28: Né 10:27
  Né 10:29: Né 10:28
  Né 10:30: Né 10:29
  Né 10:31: Né 10:30
  Né 10:32: Né 10:31
  Né 10:33: Né 10:32
  Né 10:34: Né 10:33
  Né 10:35: Né 10:34
  Né 10:36: Né 10:35
  Né 10:37: Né 10:36
  Né 10:38: Né 10:37
  Né 10:39: Né 10:38
  Né 10:40: Né 10:39
  Na 2:1: Na 1:15
  Na 2:10: Na 2:9
  Na 2:11: Na 2:10
  Na 2:12: Na 2:11
  Na 2:13: Na 2:12
  Na 2:14: Na 2:13
  Na 2:2: Na 2:1
  Na 2:3: Na 2:2
  Na 2:4: Na 2:3
  Na 2:5: Na 2:4
  Na 2:6: Na 2:5
  Na 2:7: Na 2:6
  Na 2:8: Na 2:7
  Na 2:9: Na 2:8
  Os 12:1: Os 11:12
  Os 12:10: Os 12:9
  Os 12:11: Os 12:10
  Os 12:12: Os 12:11
  Os 12:13: Os 12:12
  Os 12:14: Os 12:13
  Os 12:15: Os 12:14
  Os 12:2: Os 12:1
  Os 12:3: Os 12:2
  Os 12:4: Os 12:3
  Os 12:5: Os 12:4
  Os 12:6: Os 12:5
  Os 12:7: Os 12:6
  Os 12:8: Os 12:7
  Os 12:9: Os 12:8
  Os 2:1: Os 1:10
  Os 2:10: Os 2:8
  Os 2:11: Os 2:9
  Os 2:12: Os 2:10
  Os 2:13: Os 2:11
  Os 2:14: Os 2:12
  Os 2:15: Os 2:13
  Os 2:16: Os 2:14
  Os 2:17: Os 2:15
  Os 2:18: Os 2:16
  Os 2:19: Os 2:17
  Os 2:2: Os 1:11
  Os 2:20: Os 2:18
  Os 2:21: Os 2:19
  Os 2:22: Os 2:20
  Os 2:23: Os 2:21
  Os 2:24: Os 2:22
  Os 2:25: Os 2:23
  Os 2:3: Os 2:1
  Os 2:4: Os 2:2
  Os 2:5: Os 2:3
  Os 2:6: Os 2:4
  Os 2:7: Os 2:5
  Os 2:8: Os 2:6
  Os 2:9: Os 2:7
  Os 14:1: Os 13:16
  Os 14:2: Os 14:1
  Os 14:3: Os 14:2
  Os 14:4: Os 14:3
  Os 14:5: Os 14:4
  Os 14:6: Os 14:5
  Os 14:7: Os 14:6
  Os 14:8: Os 14:7
  Os 14:9: Os 14:8
  Os 14:10: Os 14:9
  Za 2:1: Za 1:18
  Za 2:2: Za 1:19
  Za 2:3: Za 1:20
  Za 2:4: Za 1:21
  Za 2:5: Za 2:1
  Za 2:6: Za 2:2
  Za 2:7: Za 2:3
  Za 2:8: Za 2:4
  Za 2:9: Za 2:5
  Za 2:10: Za 2:6
  Za 2:11: Za 2:7
  Za 2:12: Za 2:8
  Za 2:13: Za 2:9
  Za 2:14: Za 2:10
  Za 2:15: Za 2:11
  Za 2:16: Za 2:12
  Za 2:17: Za 2:13
  Ps 102:2: Ps 102:1
  Ps 102:10: Ps 102:9
  Ps 102:11: Ps 102:10
  Ps 102:12: Ps 102:11
  Ps 102:13: Ps 102:12
  Ps 102:14: Ps 102:13
  Ps 102:15: Ps 102:14
  Ps 102:16: Ps 102:15
  Ps 102:17: Ps 102:16
  Ps 102:18: Ps 102:17
  Ps 102:19: Ps 102:18
  Ps 102:20: Ps 102:19
  Ps 102:21: Ps 102:20
  Ps 102:22: Ps 102:21
  Ps 102:23: Ps 102:22
  Ps 102:24: Ps 102:23
  Ps 102:25: Ps 102:24
  Ps 102:26: Ps 102:25
  Ps 102:27: Ps 102:26
  Ps 102:28: Ps 102:27
  Ps 102:29: Ps 102:28
  Ps 102:3: Ps 102:2
  Ps 102:4: Ps 102:3
  Ps 102:5: Ps 102:4
  Ps 102:6: Ps 102:5
  Ps 102:7: Ps 102:6
  Ps 102:8: Ps 102:7
  Ps 102:9: Ps 102:8
  Ps 108:2: Ps 108:1
  Ps 108:10: Ps 108:9
  Ps 108:11: Ps 108:10
  Ps 108:12: Ps 108:11
  Ps 108:13: Ps 108:12
  Ps 108:14: Ps 108:13
  Ps 108:3: Ps 108:2
  Ps 108:4: Ps 108:3
  Ps 108:5: Ps 108:4
  Ps 108:6: Ps 108:5
  Ps 108:7: Ps 108:6
  Ps 108:8: Ps 108:7
  Ps 108:9: Ps 108:8
  Ps 12:2: Ps 12:1
  Ps 12:3: Ps 12:2
  Ps 12:4: Ps 12:3
  Ps 12:5: Ps 12:4
  Ps 12:6: Ps 12:5
  Ps 12:7: Ps 12:6
  Ps 12:8: Ps 12:7
  Ps 12:9: Ps 12:8
  Ps 140:2: Ps 140:1
  Ps 140:10: Ps 140:9
  Ps 140:11: Ps 140:10
  Ps 140:12: Ps 140:11
  Ps 140:13: Ps 140:12
  Ps 140:14: Ps 140:13
  Ps 140:3: Ps 140:2
  Ps 140:4: Ps 140:3
  Ps 140:5: Ps 140:4
  Ps 140:6: Ps 140:5
  Ps 140:7: Ps 140:6
  Ps 140:8: Ps 140:7
  Ps 140:9: Ps 140:8
  Ps 142:2: Ps 142:1
  Ps 142:3: Ps 142:2
  Ps 142:4: Ps 142:3
  Ps 142:5: Ps 142:4
  Ps 142:6: Ps 142:5
  Ps 142:7: Ps 142:6
  Ps 142:8: Ps 142:7
  Ps 18:2: Ps 18:1
  Ps 18:10: Ps 18:9
  Ps 18:11: Ps 18:10
  Ps 18:12: Ps 18:11
  Ps 18:13: Ps 18:12
  Ps 18:14: Ps 18:13
  Ps 18:15: Ps 18:14
  Ps 18:16: Ps 18:15
  Ps 18:17: Ps 18:16
  Ps 18:18: Ps 18:17
  Ps 18:19: Ps 18:18
  Ps 18:20: Ps 18:19
  Ps 18:21: Ps 18:20
  Ps 18:22: Ps 18:21
  Ps 18:23: Ps 18:22
  Ps 18:24: Ps 18:23
  Ps 18:25: Ps 18:24
  Ps 18:26: Ps 18:25
  Ps 18:27: Ps 18:26
  Ps 18:28: Ps 18:27
  Ps 18:29: Ps 18:28
  Ps 18:3: Ps 18:2
  Ps 18:30: Ps 18:29
  Ps 18:31: Ps 18:30
  Ps 18:32: Ps 18:31
  Ps 18:33: Ps 18:32
  Ps 18:34: Ps 18:33
  Ps 18:35: Ps 18:34
  Ps 18:36: Ps 18:35
  Ps 18:37: Ps 18:36
  Ps 18:38: Ps 18:37
  Ps 18:39: Ps 18:38
  Ps 18:4: Ps 18:3
  Ps 18:40: Ps 18:39
  Ps 18:41: Ps 18:40
  Ps 18:42: Ps 18:41
  Ps 18:43: Ps 18:42
  Ps 18:44: Ps 18:43
  Ps 18:45: Ps 18:44
  Ps 18:46: Ps 18:45
  Ps 18:47: Ps 18:46
  Ps 18:48: Ps 18:47
  Ps 18:49: Ps 18:48
  Ps 18:5: Ps 18:4
  Ps 18:50: Ps 18:49
  Ps 18:51: Ps 18:50
  Ps 18:6: Ps 18:5
  Ps 18:7: Ps 18:6
  Ps 18:8: Ps 18:7
  Ps 18:9: Ps 18:8
  Ps 19:2: Ps 19:1
  Ps 19:10: Ps 19:9
  Ps 19:11: Ps 19:10
  Ps 19:12: Ps 19:11
  Ps 19:13: Ps 19:12
  Ps 19:14: Ps 19:13
  Ps 19:15: Ps 19:14
  Ps 19:3: Ps 19:2
  Ps 19:4: Ps 19:3
  Ps 19:5: Ps 19:4
  Ps 19:6: Ps 19:5
  Ps 19:7: Ps 19:6
  Ps 19:8: Ps 19:7
  Ps 19:9: Ps 19:8
  Ps 20:2: Ps 20:1
  Ps 20:10: Ps 20:9
  Ps 20:3: Ps 20:2
  Ps 20:4: Ps 20:3
  Ps 20:5: Ps 20:4
  Ps 20:6: Ps 20:5
  Ps 20:7: Ps 20:6
  Ps 20:8: Ps 20:7
  Ps 20:9: Ps 20:8
  Ps 21:2: Ps 21:1
  Ps 21:10: Ps 21:9
  Ps 21:11: Ps 21:10
  Ps 21:12: Ps 21:11
  Ps 21:13: Ps 21:12
  Ps 21:14: Ps 21:13
  Ps 21:3: Ps 21:2
  Ps 21:4: Ps 21:3
  Ps 21:5: Ps 21:4
  Ps 21:6: Ps 21:5
  Ps 21:7: Ps 21:6
  Ps 21:8: Ps 21:7
  Ps 21:9: Ps 21:8
  Ps 22:2: Ps 22:1
  Ps 22:10: Ps 22:9
  Ps 22:11: Ps 22:10
  Ps 22:12: Ps 22:11
  Ps 22:13: Ps 22:12
  Ps 22:14: Ps 22:13
  Ps 22:15: Ps 22:14
  Ps 22:16: Ps 22:15
  Ps 22:17: Ps 22:16
  Ps 22:18: Ps 22:17
  Ps 22:19: Ps 22:18
  Ps 22:20: Ps 22:19
  Ps 22:21: Ps 22:20
  Ps 22:22: Ps 22:21
  Ps 22:23: Ps 22:22
  Ps 22:24: Ps 22:23
  Ps 22:25: Ps 22:24
  Ps 22:26: Ps 22:25
  Ps 22:27: Ps 22:26
  Ps 22:28: Ps 22:27
  Ps 22:29: Ps 22:28
  Ps 22:3: Ps 22:2
  Ps 22:30: Ps 22:29
  Ps 22:31: Ps 22:30
  Ps 22:32: Ps 22:31
  Ps 22:4: Ps 22:3
  Ps 22:5: Ps 22:4
  Ps 22:6: Ps 22:5
  Ps 22:7: Ps 22:6
  Ps 22:8: Ps 22:7
  Ps 22:9: Ps 22:8
  Ps 3:2: Ps 3:1
  Ps 3:3: Ps 3:2
  Ps 3:4: Ps 3:3
  Ps 3:5: Ps 3:4
  Ps 3:6: Ps 3:5
  Ps 3:7: Ps 3:6
  Ps 3:8: Ps 3:7
  Ps 3:9: Ps 3:8
  Ps 30:2: Ps 30:1
  Ps 30:10: Ps 30:9
  Ps 30:11: Ps 30:10
  Ps 30:12: Ps 30:11
  Ps 30:13: Ps 30:12
  Ps 30:3: Ps 30:2
  Ps 30:4: Ps 30:3
  Ps 30:5: Ps 30:4
  Ps 30:6: Ps 30:5
  Ps 30:7: Ps 30:6
  Ps 30:8: Ps 30:7
  Ps 30:9: Ps 30:8
  Ps 31:2: Ps 31:1
  Ps 31:10: Ps 31:9
  Ps 31:11: Ps 31:10
  Ps 31:12: Ps 31:11
  Ps 31:13: Ps 31:12
  Ps 31:14: Ps 31:13
  Ps 31:15: Ps 31:14
  Ps 31:16: Ps 31:15
  Ps 31:17: Ps 31:16
  Ps 31:18: Ps 31:17
  Ps 31:19: Ps 31:18
  Ps 31:20: Ps 31:19
  Ps 31:21: Ps 31:20
  Ps 31:22: Ps 31:21
  Ps 31:23: Ps 31:22
  Ps 31:24: Ps 31:23
  Ps 31:25: Ps 31:24
  Ps 31:3: Ps 31:2
  Ps 31:4: Ps 31:3
  Ps 31:5: Ps 31:4
  Ps 31:6: Ps 31:5
  Ps 31:7: Ps 31:6
  Ps 31:8: Ps 31:7
  Ps 31:9: Ps 31:8
  Ps 34:2: Ps 34:1
  Ps 34:10: Ps 34:9
  Ps 34:11: Ps 34:10
  Ps 34:12: Ps 34:11
  Ps 34:13: Ps 34:12
  Ps 34:14: Ps 34:13
  Ps 34:15: Ps 34:14
  Ps 34:16: Ps 34:15
  Ps 34:17: Ps 34:16
  Ps 34:18: Ps 34:17
  Ps 34:19: Ps 34:18
  Ps 34:20: Ps 34:19
  Ps 34:21: Ps 34:20
  Ps 34:22: Ps 34:21
  Ps 34:23: Ps 34:22
  Ps 34:3: Ps 34:2
  Ps 34:4: Ps 34:3
  Ps 34:5: Ps 34:4
  Ps 34:6: Ps 34:5
  Ps 34:7: Ps 34:6
  Ps 34:8: Ps 34:7
  Ps 34:9: Ps 34:8
  Ps 36:2: Ps 36:1
  Ps 36:10: Ps 36:9
  Ps 36:11: Ps 36:10
  Ps 36:12: Ps 36:11
  Ps 36:13: Ps 36:12
  Ps 36:3: Ps 36:2
  Ps 36:4: Ps 36:3
  Ps 36:5: Ps 36:4
  Ps 36:6: Ps 36:5
  Ps 36:7: Ps 36:6
  Ps 36:8: Ps 36:7
  Ps 36:9: Ps 36:8
  Ps 38:2: Ps 38:1
  Ps 38:10: Ps 38:9
  Ps 38:11: Ps 38:10
  Ps 38:12: Ps 38:11
  Ps 38:13: Ps 38:12
  Ps 38:14: Ps 38:13
  Ps 38:15: Ps 38:14
  Ps 38:16: Ps 38:15
  Ps 38:17: Ps 38:16
  Ps 38:18: Ps 38:17
  Ps 38:19: Ps 38:18
  Ps 38:20: Ps 38:19
  Ps 38:21: Ps 38:20
  Ps 38:22: Ps 38:21
  Ps 38:23: Ps 38:22
  Ps 38:3: Ps 38:2
  Ps 38:4: Ps 38:3
  Ps 38:5: Ps 38:4
  Ps 38:6: Ps 38:5
  Ps 38:7: Ps 38:6
  Ps 38:8: Ps 38:7
  Ps 38:9: Ps 38:8
  Ps 39:2: Ps 39:1
  Ps 39:10: Ps 39:9
  Ps 39:11: Ps 39:10
  Ps 39:12: Ps 39:11
  Ps 39:13: Ps 39:12
  Ps 39:14: Ps 39:13
  Ps 39:3: Ps 39:2
  Ps 39:4: Ps 39:3
  Ps 39:5: Ps 39:4
  Ps 39:6: Ps 39:5
  Ps 39:7: Ps 39:6
  Ps 39:8: Ps 39:7
  Ps 39:9: Ps 39:8
  Ps 4:2: Ps 4:1
  Ps 4:3: Ps 4:2
  Ps 4:4: Ps 4:3
  Ps 4:5: Ps 4:4
  Ps 4:6: Ps 4:5
  Ps 4:7: Ps 4:6
  Ps 4:8: Ps 4:7
  Ps 4:9: Ps 4:8
  Ps 40:2: Ps 40:1
  Ps 40:10: Ps 40:9
  Ps 40:11: Ps 40:10
  Ps 40:12: Ps 40:11
  Ps 40:13: Ps 40:12
  Ps 40:14: Ps 40:13
  Ps 40:15: Ps 40:14
  Ps 40:16: Ps 40:15
  Ps 40:17: Ps 40:16
  Ps 40:18: Ps 40:17
  Ps 40:3: Ps 40:2
  Ps 40:4: Ps 40:3
  Ps 40:5: Ps 40:4
  Ps 40:6: Ps 40:5
  Ps 40:7: Ps 40:6
  Ps 40:8: Ps 40:7
  Ps 40:9: Ps 40:8
  Ps 41:2: Ps 41:1
  Ps 41:10: Ps 41:9
  Ps 41:11: Ps 41:10
  Ps 41:12: Ps 41:11
  Ps 41:13: Ps 41:12
  Ps 41:14: Ps 41:13
  Ps 41:3: Ps 41:2
  Ps 41:4: Ps 41:3
  Ps 41:5: Ps 41:4
  Ps 41:6: Ps 41:5
  Ps 41:7: Ps 41:6
  Ps 41:8: Ps 41:7
  Ps 41:9: Ps 41:8
  Ps 42:2: Ps 42:1
  Ps 42:10: Ps 42:9
  Ps 42:11: Ps 42:10
  Ps 42:12: Ps 42:11
  Ps 42:3: Ps 42:2
  Ps 42:4: Ps 42:3
  Ps 42:5: Ps 42:4
  Ps 42:6: Ps 42:5
  Ps 42:7: Ps 42:6
  Ps 42:8: Ps 42:7
  Ps 42:9: Ps 42:8
  Ps 44:2: Ps 44:1
  Ps 44:10: Ps 44:9
  Ps 44:11: Ps 44:10
  Ps 44:12: Ps 44:11
  Ps 44:13: Ps 44:12
  Ps 44:14: Ps 44:13
  Ps 44:15: Ps 44:14
  Ps 44:16: Ps 44:15
  Ps 44:17: Ps 44:16
  Ps 44:18: Ps 44:17
  Ps 44:19: Ps 44:18
  Ps 44:20: Ps 44:19
  Ps 44:21: Ps 44:20
  Ps 44:22: Ps 44:21
  Ps 44:23: Ps 44:22
  Ps 44:24: Ps 44:23
  Ps 44:25: Ps 44:24
  Ps 44:26: Ps 44:25
  Ps 44:27: Ps 44:26
  Ps 44:3: Ps 44:2
  Ps 44:4: Ps 44:3
  Ps 44:5: Ps 44:4
  Ps 44:6: Ps 44:5
  Ps 44:7: Ps 44:6
  Ps 44:8: Ps 44:7
  Ps 44:9: Ps 44:8
  Ps 45:2: Ps 45:1
  Ps 45:10: Ps 45:9
  Ps 45:11: Ps 45:10
  Ps 45:12: Ps 45:11
  Ps 45:13: Ps 45:12
  Ps 45:14: Ps 45:13
  Ps 45:15: Ps 45:14
  Ps 45:16: Ps 45:15
  Ps 45:17: Ps 45:16
  Ps 45:18: Ps 45:17
  Ps 45:3: Ps 45:2
  Ps 45:4: Ps 45:3
  Ps 45:5: Ps 45:4
  Ps 45:6: Ps 45:5
  Ps 45:7: Ps 45:6
  Ps 45:8: Ps 45:7
  Ps 45:9: Ps 45:8
  Ps 46:2: Ps 46:1
  Ps 46:10: Ps 46:9
  Ps 46:11: Ps 46:10
  Ps 46:12: Ps 46:11
  Ps 46:3: Ps 46:2
  Ps 46:4: Ps 46:3
  Ps 46:5: Ps 46:4
  Ps 46:6: Ps 46:5
  Ps 46:7: Ps 46:6
  Ps 46:8: Ps 46:7
  Ps 46:9: Ps 46:8
  Ps 47:2: Ps 47:1
  Ps 47:10: Ps 47:9
  Ps 47:3: Ps 47:2
  Ps 47:4: Ps 47:3
  Ps 47:5: Ps 47:4
  Ps 47:6: Ps 47:5
  Ps 47:7: Ps 47:6
  Ps 47:8: Ps 47:7
  Ps 47:9: Ps 47:8
  Ps 48:2: Ps 48:1
  Ps 48:10: Ps 48:9
  Ps 48:11: Ps 48:10
  Ps 48:12: Ps 48:11
  Ps 48:13: Ps 48:12
  Ps 48:14: Ps 48:13
  Ps 48:15: Ps 48:14
  Ps 48:3: Ps 48:2
  Ps 48:4: Ps 48:3
  Ps 48:5: Ps 48:4
  Ps 48:6: Ps 48:5
  Ps 48:7: Ps 48:6
  Ps 48:8: Ps 48:7
  Ps 48:9: Ps 48:8
  Ps 49:2: Ps 49:1
  Ps 49:10: Ps 49:9
  Ps 49:11: Ps 49:10
  Ps 49:12: Ps 49:11
  Ps 49:13: Ps 49:12
  Ps 49:14: Ps 49:13
  Ps 49:15: Ps 49:14
  Ps 49:16: Ps 49:15
  Ps 49:17: Ps 49:16
  Ps 49:18: Ps 49:17
  Ps 49:19: Ps 49:18
  Ps 49:20: Ps 49:19
  Ps 49:21: Ps 49:20
  Ps 49:3: Ps 49:2
  Ps 49:4: Ps 49:3
  Ps 49:5: Ps 49:4
  Ps 49:6: Ps 49:5
  Ps 49:7: Ps 49:6
  Ps 49:8: Ps 49:7
  Ps 49:9: Ps 49:8
  Ps 5:10: Ps 5:9
  Ps 5:11: Ps 5:10
  Ps 5:12: Ps 5:11
  Ps 5:13: Ps 5:12
  Ps 5:2: Ps 5:1
  Ps 5:3: Ps 5:2
  Ps 5:4: Ps 5:3
  Ps 5:5: Ps 5:4
  Ps 5:6: Ps 5:5
  Ps 5:7: Ps 5:6
  Ps 5:8: Ps 5:7
  Ps 5:9: Ps 5:8
  Ps 51:2: Ps 51:1
  Ps 51:3: Ps 51:2
  Ps 51:4: Ps 51:3
  Ps 51:5: Ps 51:3
  Ps 51:6: Ps 51:4
  Ps 51:7: Ps 51:5
  Ps 51:8: Ps 51:6
  Ps 51:9: Ps 51:7
  Ps 51:10: Ps 51:8
  Ps 51:11: Ps 51:9
  Ps 51:12: Ps 51:10
  Ps 51:13: Ps 51:11
  Ps 51:14: Ps 51:12
  Ps 51:15: Ps 51:13
  Ps 51:16: Ps 51:14
  Ps 51:17: Ps 51:15
  Ps 51:18: Ps 51:16
  Ps 51:19: Ps 51:17
  Ps 51:20: Ps 51:18
  Ps 51:21: Ps 51:19
  Ps 52:2: Ps 52:1
  Ps 52:3: Ps 52:1
  Ps 52:10: Ps 52:8
  Ps 52:11: Ps 52:9
  Ps 52:4: Ps 52:2
  Ps 52:5: Ps 52:3
  Ps 52:6: Ps 52:4
  Ps 52:7: Ps 52:5
  Ps 52:8: Ps 52:6
  Ps 52:9: Ps 52:7
  Ps 53:2: Ps 53:1
  Ps 53:3: Ps 53:2
  Ps 53:4: Ps 53:3
  Ps 53:5: Ps 53:4
  Ps 53:6: Ps 53:5
  Ps 53:7: Ps 53:6
  Ps 54:2: Ps 54:1
  Ps 54:3: Ps 54:1
  Ps 54:4: Ps 54:2
  Ps 54:5: Ps 54:3
  Ps 54:6: Ps 54:4
  Ps 54:7: Ps 54:5
  Ps 54:8: Ps 54:6
  Ps 54:9: Ps 54:7
  Ps 55:2: Ps 55:1
  Ps 55:10: Ps 55:9
  Ps 55:11: Ps 55:10
  Ps 55:12: Ps 55:11
  Ps 55:13: Ps 55:12
  Ps 55:14: Ps 55:13
  Ps 55:15: Ps 55:14
  Ps 55:16: Ps 55:15
  Ps 55:17: Ps 55:16
  Ps 55:18: Ps 55:17
  Ps 55:19: Ps 55:18
  Ps 55:20: Ps 55:19
  Ps 55:21: Ps 55:20
  Ps 55:22: Ps 55:21
  Ps 55:23: Ps 55:22
  Ps 55:24: Ps 55:23
  Ps 55:3: Ps 55:2
  Ps 55:4: Ps 55:3
  Ps 55:5: Ps 55:4
  Ps 55:6: Ps 55:5
  Ps 55:7: Ps 55:6
  Ps 55:8: Ps 55:7
  Ps 55:9: Ps 55:8
  Ps 56:2: Ps 56:1
  Ps 56:10: Ps 56:9
  Ps 56:11: Ps 56:10
  Ps 56:12: Ps 56:11
  Ps 56:13: Ps 56:12
  Ps 56:14: Ps 56:13
  Ps 56:3: Ps 56:2
  Ps 56:4: Ps 56:3
  Ps 56:5: Ps 56:4
  Ps 56:6: Ps 56:5
  Ps 56:7: Ps 56:6
  Ps 56:8: Ps 56:7
  Ps 56:9: Ps 56:8
  Ps 57:2: Ps 57:1
  Ps 57:10: Ps 57:9
  Ps 57:11: Ps 57:10
  Ps 57:12: Ps 57:11
  Ps 57:3: Ps 57:2
  Ps 57:4: Ps 57:3
  Ps 57:5: Ps 57:4
  Ps 57:6: Ps 57:5
  Ps 57:7: Ps 57:6
  Ps 57:8: Ps 57:7
  Ps 57:9: Ps 57:8
  Ps 58:2: Ps 58:1
  Ps 58:10: Ps 58:9
  Ps 58:11: Ps 58:10
  Ps 58:12: Ps 58:11
  Ps 58:3: Ps 58:2
  Ps 58:4: Ps 58:3
  Ps 58:5: Ps 58:4
  Ps 58:6: Ps 58:5
  Ps 58:7: Ps 58:6
  Ps 58:8: Ps 58:7
  Ps 58:9: Ps 58:8
  Ps 59:2: Ps 59:1
  Ps 59:10: Ps 59:9
  Ps 59:11: Ps 59:10
  Ps 59:12: Ps 59:11
  Ps 59:13: Ps 59:12
  Ps 59:14: Ps 59:13
  Ps 59:15: Ps 59:14
  Ps 59:16: Ps 59:15
  Ps 59:17: Ps 59:16
  Ps 59:18: Ps 59:17
  Ps 59:3: Ps 59:2
  Ps 59:4: Ps 59:3
  Ps 59:5: Ps 59:4
  Ps 59:6: Ps 59:5
  Ps 59:7: Ps 59:6
  Ps 59:8: Ps 59:7
  Ps 59:9: Ps 59:8
  Ps 6:10: Ps 6:9
  Ps 6:11: Ps 6:10
  Ps 6:2: Ps 6:1
  Ps 6:3: Ps 6:2
  Ps 6:4: Ps 6:3
  Ps 6:5: Ps 6:4
  Ps 6:6: Ps 6:5
  Ps 6:7: Ps 6:6
  Ps 6:8: Ps 6:7
  Ps 6:9: Ps 6:8
  Ps 60:2: Ps 60:1
  Ps 60:3: Ps 60:1
  Ps 60:10: Ps 60:8
  Ps 60:11: Ps 60:9
  Ps 60:12: Ps 60:10
  Ps 60:13: Ps 60:11
  Ps 60:14: Ps 60:12
  Ps 60:4: Ps 60:2
  Ps 60:5: Ps 60:3
  Ps 60:6: Ps 60:4
  Ps 60:7: Ps 60:5
  Ps 60:8: Ps 60:6
  Ps 60:9: Ps 60:7
  Ps 61:2: Ps 61:1
  Ps 61:3: Ps 61:2
  Ps 61:4: Ps 61:3
  Ps 61:5: Ps 61:4
  Ps 61:6: Ps 61:5
  Ps 61:7: Ps 61:6
  Ps 61:8: Ps 61:7
  Ps 61:9: Ps 61:8
  Ps 62:2: Ps 62:1
  Ps 62:10: Ps 62:9
  Ps 62:11: Ps 62:10
  Ps 62:12: Ps 62:11
  Ps 62:13: Ps 62:12
  Ps 62:3: Ps 62:2
  Ps 62:4: Ps 62:3
  Ps 62:5: Ps 62:4
  Ps 62:6: Ps 62:5
  Ps 62:7: Ps 62:6
  Ps 62:8: Ps 62:7
  Ps 62:9: Ps 62:8
  Ps 63:2: Ps 63:1
  Ps 63:10: Ps 63:9
  Ps 63:11: Ps 63:10
  Ps 63:12: Ps 63:11
  Ps 63:3: Ps 63:2
  Ps 63:4: Ps 63:3
  Ps 63:5: Ps 63:4
  Ps 63:6: Ps 63:5
  Ps 63:7: Ps 63:6
  Ps 63:8: Ps 63:7
  Ps 63:9: Ps 63:8
  Ps 64:2: Ps 64:1
  Ps 64:10: Ps 64:9
  Ps 64:11: Ps 64:10
  Ps 64:3: Ps 64:2
  Ps 64:4: Ps 64:3
  Ps 64:5: Ps 64:4
  Ps 64:6: Ps 64:5
  Ps 64:7: Ps 64:6
  Ps 64:8: Ps 64:7
  Ps 64:9: Ps 64:8
  Ps 65:2: Ps 65:1
  Ps 65:10: Ps 65:9
  Ps 65:11: Ps 65:10
  Ps 65:12: Ps 65:11
  Ps 65:13: Ps 65:12
  Ps 65:14: Ps 65:13
  Ps 65:3: Ps 65:2
  Ps 65:4: Ps 65:3
  Ps 65:5: Ps 65:4
  Ps 65:6: Ps 65:5
  Ps 65:7: Ps 65:6
  Ps 65:8: Ps 65:7
  Ps 65:9: Ps 65:8
  Ps 67:2: Ps 67:1
  Ps 67:3: Ps 67:2
  Ps 67:4: Ps 67:3
  Ps 67:5: Ps 67:4
  Ps 67:6: Ps 67:5
  Ps 67:7: Ps 67:6
  Ps 67:8: Ps 67:7
  Ps 68:2: Ps 68:1
  Ps 68:10: Ps 68:9
  Ps 68:11: Ps 68:10
  Ps 68:12: Ps 68:11
  Ps 68:13: Ps 68:12
  Ps 68:14: Ps 68:13
  Ps 68:15: Ps 68:14
  Ps 68:16: Ps 68:15
  Ps 68:17: Ps 68:16
  Ps 68:18: Ps 68:17
  Ps 68:19: Ps 68:18
  Ps 68:20: Ps 68:19
  Ps 68:21: Ps 68:20
  Ps 68:22: Ps 68:21
  Ps 68:23: Ps 68:22
  Ps 68:24: Ps 68:23
  Ps 68:25: Ps 68:24
  Ps 68:26: Ps 68:25
  Ps 68:27: Ps 68:26
  Ps 68:28: Ps 68:27
  Ps 68:29: Ps 68:28
  Ps 68:3: Ps 68:2
  Ps 68:30: Ps 68:29
  Ps 68:31: Ps 68:30
  Ps 68:32: Ps 68:31
  Ps 68:33: Ps 68:32
  Ps 68:34: Ps 68:33
  Ps 68:35: Ps 68:34
  Ps 68:36: Ps 68:35
  Ps 68:4: Ps 68:3
  Ps 68:5: Ps 68:4
  Ps 68:6: Ps 68:5
  Ps 68:7: Ps 68:6
  Ps 68:8: Ps 68:7
  Ps 68:9: Ps 68:8
  Ps 69:2: Ps 69:1
  Ps 69:10: Ps 69:9
  Ps 69:11: Ps 69:10
  Ps 69:12: Ps 69:11
  Ps 69:13: Ps 69:12
  Ps 69:14: Ps 69:13
  Ps 69:15: Ps 69:14
  Ps 69:16: Ps 69:15
  Ps 69:17: Ps 69:16
  Ps 69:18: Ps 69:17
  Ps 69:19: Ps 69:18
  Ps 69:20: Ps 69:19
  Ps 69:21: Ps 69:20
  Ps 69:22: Ps 69:21
  Ps 69:23: Ps 69:22
  Ps 69:24: Ps 69:23
  Ps 69:25: Ps 69:24
  Ps 69:26: Ps 69:25
  Ps 69:27: Ps 69:26
  Ps 69:28: Ps 69:27
  Ps 69:29: Ps 69:28
  Ps 69:3: Ps 69:2
  Ps 69:30: Ps 69:29
  Ps 69:31: Ps 69:30
  Ps 69:32: Ps 69:31
  Ps 69:33: Ps 69:32
  Ps 69:34: Ps 69:33
  Ps 69:35: Ps 69:34
  Ps 69:36: Ps 69:35
  Ps 69:37: Ps 69:36
  Ps 69:4: Ps 69:3
  Ps 69:5: Ps 69:4
  Ps 69:6: Ps 69:5
  Ps 69:7: Ps 69:6
  Ps 69:8: Ps 69:7
  Ps 69:9: Ps 69:8
  Ps 7:10: Ps 7:9
  Ps 7:11: Ps 7:10
  Ps 7:12: Ps 7:11
  Ps 7:13: Ps 7:12
  Ps 7:14: Ps 7:13
  Ps 7:15: Ps 7:14
  Ps 7:16: Ps 7:15
  Ps 7:17: Ps 7:16
  Ps 7:18: Ps 7:17
  Ps 7:2: Ps 7:1
  Ps 7:3: Ps 7:2
  Ps 7:4: Ps 7:3
  Ps 7:5: Ps 7:4
  Ps 7:6: Ps 7:5
  Ps 7:7: Ps 7:6
  Ps 7:8: Ps 7:7
  Ps 7:9: Ps 7:8
  Ps 70:2: Ps 70:1
  Ps 70:3: Ps 70:2
  Ps 70:4: Ps 70:3
  Ps 70:5: Ps 70:4
  Ps 70:6: Ps 70:5
  Ps 75:2: Ps 75:1
  Ps 75:10: Ps 75:9
  Ps 75:11: Ps 75:10
  Ps 75:3: Ps 75:2
  Ps 75:4: Ps 75:3
  Ps 75:5: Ps 75:4
  Ps 75:6: Ps 75:5
  Ps 75:7: Ps 75:6
  Ps 75:8: Ps 75:7
  Ps 75:9: Ps 75:8
  Ps 76:2: Ps 76:1
  Ps 76:10: Ps 76:9
  Ps 76:11: Ps 76:10
  Ps 76:12: Ps 76:11
  Ps 76:13: Ps 76:12
  Ps 76:3: Ps 76:2
  Ps 76:4: Ps 76:3
  Ps 76:5: Ps 76:4
  Ps 76:6: Ps 76:5
  Ps 76:7: Ps 76:6
  Ps 76:8: Ps 76:7
  Ps 76:9: Ps 76:8
  Ps 77:2: Ps 77:1
  Ps 77:10: Ps 77:9
  Ps 77:11: Ps 77:10
  Ps 77:12: Ps 77:11
  Ps 77:13: Ps 77:12
  Ps 77:14: Ps 77:13
  Ps 77:15: Ps 77:14
  Ps 77:16: Ps 77:15
  Ps 77:17: Ps 77:16
  Ps 77:18: Ps 77:17
  Ps 77:19: Ps 77:18
  Ps 77:20: Ps 77:19
  Ps 77:21: Ps 77:20
  Ps 77:3: Ps 77:2
  Ps 77:4: Ps 77:3
  Ps 77:5: Ps 77:4
  Ps 77:6: Ps 77:5
  Ps 77:7: Ps 77:6
  Ps 77:8: Ps 77:7
  Ps 77:9: Ps 77:8
  Ps 8:10: Ps 8:9
  Ps 8:2: Ps 8:1
  Ps 8:3: Ps 8:2
  Ps 8:4: Ps 8:3
  Ps 8:5: Ps 8:4
  Ps 8:6: Ps 8:5
  Ps 8:7: Ps 8:6
  Ps 8:8: Ps 8:7
  Ps 8:9: Ps 8:8
  Ps 80:2: Ps 80:1
  Ps 80:10: Ps 80:9
  Ps 80:11: Ps 80:10
  Ps 80:12: Ps 80:11
  Ps 80:13: Ps 80:12
  Ps 80:14: Ps 80:13
  Ps 80:15: Ps 80:14
  Ps 80:16: Ps 80:15
  Ps 80:17: Ps 80:16
  Ps 80:18: Ps 80:17
  Ps 80:19: Ps 80:18
  Ps 80:20: Ps 80:19
  Ps 80:3: Ps 80:2
  Ps 80:4: Ps 80:3
  Ps 80:5: Ps 80:4
  Ps 80:6: Ps 80:5
  Ps 80:7: Ps 80:6
  Ps 80:8: Ps 80:7
  Ps 80:9: Ps 80:8
  Ps 81:2: Ps 81:1
  Ps 81:10: Ps 81:9
  Ps 81:11: Ps 81:10
  Ps 81:12: Ps 81:11
  Ps 81:13: Ps 81:12
  Ps 81:14: Ps 81:13
  Ps 81:15: Ps 81:14
  Ps 81:16: Ps 81:15
  Ps 81:17: Ps 81:16
  Ps 81:3: Ps 81:2
  Ps 81:4: Ps 81:3
  Ps 81:5: Ps 81:4
  Ps 81:6: Ps 81:5
  Ps 81:7: Ps 81:6
  Ps 81:8: Ps 81:7
  Ps 81:9: Ps 81:8
  Ps 83:2: Ps 83:1
  Ps 83:10: Ps 83:9
  Ps 83:11: Ps 83:10
  Ps 83:12: Ps 83:11
  Ps 83:13: Ps 83:12
  Ps 83:14: Ps 83:13
  Ps 83:15: Ps 83:14
  Ps 83:16: Ps 83:15
  Ps 83:17: Ps 83:16
  Ps 83:18: Ps 83:17
  Ps 83:19: Ps 83:18
  Ps 83:3: Ps 83:2
  Ps 83:4: Ps 83:3
  Ps 83:5: Ps 83:4
  Ps 83:6: Ps 83:5
  Ps 83:7: Ps 83:6
  Ps 83:8: Ps 83:7
  Ps 83:9: Ps 83:8
  Ps 84:2: Ps 84:1
  Ps 84:10: Ps 84:9
  Ps 84:11: Ps 84:10
  Ps 84:12: Ps 84:11
  Ps 84:13: Ps 84:12
  Ps 84:3: Ps 84:2
  Ps 84:4: Ps 84:3
  Ps 84:5: Ps 84:4
  Ps 84:6: Ps 84:5
  Ps 84:7: Ps 84:6
  Ps 84:8: Ps 84:7
  Ps 84:9: Ps 84:8
  Ps 85:2: Ps 85:1
  Ps 85:10: Ps 85:9
  Ps 85:11: Ps 85:10
  Ps 85:12: Ps 85:11
  Ps 85:13: Ps 85:12
  Ps 85:14: Ps 85:13
  Ps 85:3: Ps 85:2
  Ps 85:4: Ps 85:3
  Ps 85:5: Ps 85:4
  Ps 85:6: Ps 85:5
  Ps 85:7: Ps 85:6
  Ps 85:8: Ps 85:7
  Ps 85:9: Ps 85:8
  Ps 88:2: Ps 88:1
  Ps 88:10: Ps 88:9
  Ps 88:11: Ps 88:10
  Ps 88:12: Ps 88:11
  Ps 88:13: Ps 88:12
  Ps 88:14: Ps 88:13
  Ps 88:15: Ps 88:14
  Ps 88:16: Ps 88:15
  Ps 88:17: Ps 88:16
  Ps 88:18: Ps 88:17
  Ps 88:19: Ps 88:18
  Ps 88:3: Ps 88:2
  Ps 88:4: Ps 88:3
  Ps 88:5: Ps 88:4
  Ps 88:6: Ps 88:5
  Ps 88:7: Ps 88:6
  Ps 88:8: Ps 88:7
  Ps 88:9: Ps 88:8
  Ps 89:10: Ps 89:9
  Ps 89:2: Ps 89:1
  Ps 89:11: Ps 89:10
  Ps 89:12: Ps 89:11
  Ps 89:13: Ps 89:12
  Ps 89:14: Ps 89:13
  Ps 89:15: Ps 89:14
  Ps 89:16: Ps 89:15
  Ps 89:17: Ps 89:16
  Ps 89:18: Ps 89:17
  Ps 89:19: Ps 89:18
  Ps 89:20: Ps 89:19
  Ps 89:21: Ps 89:20
  Ps 89:22: Ps 89:21
  Ps 89:23: Ps 89:22
  Ps 89:24: Ps 89:23
  Ps 89:25: Ps 89:24
  Ps 89:26: Ps 89:25
  Ps 89:27: Ps 89:26
  Ps 89:28: Ps 89:27
  Ps 89:29: Ps 89:28
  Ps 89:3: Ps 89:2
  Ps 89:30: Ps 89:29
  Ps 89:31: Ps 89:30
  Ps 89:32: Ps 89:31
  Ps 89:33: Ps 89:32
  Ps 89:34: Ps 89:33
  Ps 89:35: Ps 89:34
  Ps 89:36: Ps 89:35
  Ps 89:37: Ps 89:36
  Ps 89:38: Ps 89:37
  Ps 89:39: Ps 89:38
  Ps 89:4: Ps 89:3
  Ps 89:40: Ps 89:39
  Ps 89:41: Ps 89:40
  Ps 89:42: Ps 89:41
  Ps 89:43: Ps 89:42
  Ps 89:44: Ps 89:43
  Ps 89:45: Ps 89:44
  Ps 89:46: Ps 89:45
  Ps 89:47: Ps 89:46
  Ps 89:48: Ps 89:47
  Ps 89:49: Ps 89:48
  Ps 89:5: Ps 89:4
  Ps 89:50: Ps 89:49
  Ps 89:51: Ps 89:50
  Ps 89:52: Ps 89:51
  Ps 89:53: Ps 89:52
  Ps 89:6: Ps 89:5
  Ps 89:7: Ps 89:6
  Ps 89:8: Ps 89:7
  Ps 89:9: Ps 89:8
  Ps 9:10: Ps 9:9
  Ps 9:11: Ps 9:10
  Ps 9:12: Ps 9:11
  Ps 9:13: Ps 9:12
  Ps 9:14: Ps 9:13
  Ps 9:15: Ps 9:14
  Ps 9:16: Ps 9:15
  Ps 9:17: Ps 9:16
  Ps 9:18: Ps 9:17
  Ps 9:19: Ps 9:18
  Ps 9:20: Ps 9:19
  Ps 9:21: Ps 9:20
  Ps 9:2: Ps 9:1
  Ps 9:3: Ps 9:2
  Ps 9:4: Ps 9:3
  Ps 9:5: Ps 9:4
  Ps 9:6: Ps 9:5
  Ps 9:7: Ps 9:6
  Ps 9:8: Ps 9:7
  Ps 9:9: Ps 9:8
  Ps 92:2: Ps 92:1
  Ps 92:10: Ps 92:9
  Ps 92:11: Ps 92:10
  Ps 92:12: Ps 92:11
  Ps 92:13: Ps 92:12
  Ps 92:14: Ps 92:13
  Ps 92:15: Ps 92:14
  Ps 92:16: Ps 92:15
  Ps 92:3: Ps 92:2
  Ps 92:4: Ps 92:3
  Ps 92:5: Ps 92:4
  Ps 92:6: Ps 92:5
  Ps 92:7: Ps 92:6
  Ps 92:8: Ps 92:7
  Ps 92:9: Ps 92:8
YAML

my $c  = new Religion::Bible::Regex::Config($yaml); 
my $b  = new Religion::Bible::Regex::Builder($c);
my $v  = new Religion::Bible::Regex::Versification($c, $b);
my $rl = new Religion::Bible::Regex::Lexer($c, $b, $v);

sub do_parse {
    my $ref = shift;
    $rl->parse($ref);
    return $rl->format('bol');
}

run {
    my $block = shift;
    my $line = $block->string;
    
    $line =~ s/$b->{'reference_biblique_list'}/@{[do_parse($&)]}/xg;

    is($line, $block->expect, $block->name);
};

#=== Jér 46 - 51
#--- string chomp
#Jér 46 - 51
#--- expect chomp
#\\#Jér 46-51\\

# === 
# --- string chomp

# --- expect chomp

__END__
=== 
--- string chomp
De 32:15; Ps 3:9; 27:1; Esa 55:1, 2, 6, 7; Jon 2:10
--- expect chomp
\\#De 32:15; Ps 3:8; 27:1; Esa 55:1, 2, 6, 7; Jon 2:9\\

=== 
--- string chomp
Le bref récit de Nombres 17:16-28 conclut
--- expect chomp
Le bref récit de \\#Nombres 17:1-13\\ conclut

=== (les sept Églises des chap. 2 et 3 ; même s'il s'agit d'Églises historiques 
--- string chomp
(les sept Églises des chap. 2 et 3 ; même s'il s'agit d'Églises historiques
--- expect chomp
(les sept Églises des chap. \\#2$; 3$\\ ; même s'il s'agit d'Églises historiques

=== Mais dans les derniers versets (Cantique des cantiques 8.5-14), il n'est plus question de ces cycles. 
--- string chomp
Mais dans les derniers versets (Cantique des cantiques 8.5-14), il n'est plus question de ces cycles.
--- expect chomp
Mais dans les derniers versets (\\#Cantique 8.5-14\\), il n'est plus question de ces cycles.

=== (Mt 18.21,22 ; voir aussi v. 23-25 ;
--- string chomp
(Mt 18.21,22 ; voir aussi v. 23-25 ;
--- expect chomp
(\\#Mt 18.21, 22\\; voir aussi v. \\#Mt 18.23-25\\ ;

=== (Ac 17.4 ; voir aussi 28.24) 
--- string chomp
(Ac 17.4 ; voir aussi 28.24)
--- expect chomp
(\\#Ac 17.4\\; voir aussi \\#Ac 28.24\\)

=== Par exemple, voici ce que l'Esprit dit au verset 11
--- string chomp
Par exemple, voici ce que l'Esprit dit au verset 11
--- expect chomp
Par exemple, voici ce que l'Esprit dit au verset \\#11\\

=== les versets 5 à 10 comme des preuves  
--- string chomp
les versets 5 à 10 comme des preuves
--- expect chomp
les versets \\#5-10\\ comme des preuves

=== dans les versets 3 et 4.
--- string chomp
dans les versets 3 et 4.
--- expect chomp
dans les versets \\#3, 4\\.

=== (2:1)
--- string chomp
(2:1)
--- expect chomp
(\\#2:1\\)

=== (voir 2:14)
--- string chomp
(voir 2:14)
--- expect chomp
(voir \\#2:14\\)

=== (Ap 2:10b,11)
--- string chomp
(Ap 2:10b,11)
--- expect chomp
(\\#Ap 2:10, 11\\)

=== (voir Da 7:7s; 9:26,27; 11:36-39;
--- string chomp
(voir Da 7:7s; 9:26,27; 11:36-39;
--- expect chomp
(voir \\#Da 7:7; 9:26, 27; 11:36-39\\;

=== (Ph 3:20,Ph 3:21; 1Jn 3:2; 1Jn 3:3; voir aussi Ti 1:2; Ja 1:12; 1Jn 2:25; Ap 2:10b,11)
--- string chomp
(Ph 3:20,Ph 3:21; 1Jn 3:2; 1Jn 3:3; voir aussi Ti 1:2; Ja 1:12; 1Jn 2:25; Ap 2:10b,11)
--- expect chomp
(\\#Ph 3:20, 21; 1Jn 3:2, 3\\; voir aussi \\#Tit 1:2; Ja 1:12; 1Jn 2:25; Ap 2:10, 11\\)

=== Da 7:7s;
--- string chomp
Da 7:7s;
--- expect chomp
\\#Da 7:7\\;

=== (1P 2:11 ;
--- string chomp
(1P 2:11 ;
--- expect chomp
(\\#1P 2:11\\ ;

=== (Ap 20:1 - 21:1)
--- string chomp
(Ap 20:1 - 21:1)
--- expect chomp
(\\#Ap 20:1-21:1\\)

=== (Né 8:8)
--- string chomp
(Né 8:8)
--- expect chomp
(\\#Né 8:8\\)

=== rival possible (Jg 9:1-6)
--- string chomp
rival possible (Jg 9:1-6)
--- expect chomp
rival possible (\\#Jug 9:1-6\\)

=== (voir 3 Jn 9,10)
--- string chomp
(voir 3 Jn 9,10)
--- expect chomp
(voir \\#3Jn 1:9, 10\\)

=== (Jn 6:37,44,45,64,65; 15:16; Ro 8:31-39; Ph 1:6; 1 Th 1:4,5; 2 Th 2:13,14; 2 Ti 1:9; Jud 24,25)
--- string chomp
(Jn 6:37,44,45,64,65; 15:16; Ro 8:31-39; Ph 1:6; 1 Th 1:4,5; 2 Th 2:13,14; 2 Ti 1:9; Jud 24,25)
--- expect chomp
(\\#Jn 6:37, 44, 45, 64, 65; 15:16; Ro 8:31-39; Ph 1:6; 1Th 1:4, 5; 2Th 2:13, 14; 2Ti 1:9; Jude 1:24, 25\\)

=== (voir Ro 12:1 - 13:10; 1 Co 3:5-23; Ga 5:1-6; Ép 4:11-16)
--- string chomp
(voir Ro 12:1 - 13:10; 1 Co 3:5-23; Ga 5:1-6; Ép 4:11-16)
--- expect chomp
(voir \\#Ro 12:1-13:10; 1Co 3:5-23; Ga 5:1-6; Ep 4:11-16\\)


=== absents de 1 Pierre (5:1 ; voir 5:2 et Jn 21:16 ; 1 Pi 5:5 et Jn 13:3-5):
--- string chomp
absents de 1 Pierre (5:1 ; voir 5:2 et Jn 21:16 ; 1 Pi 5:5 et Jn 13:3-5):
--- expect chomp
absents de 1 Pierre (\\#5:1\\; voir \\#5:2; Jn 21:16; 1P 5:5; Jn 13:3-5\\):


=== (Ps 7 ; 35 ; 40 ; 55 ; 58 ; 59 ; 69 ; 79 ; 109 ; 137 ; 139 ; 144)
--- string chomp
(Ps 7 ; 35 ; 40 ; 55 ; 58 ; 59 ; 69 ; 79 ; 109 ; 137 ; 139 ; 144)
--- expect chomp
(\\#Ps 7; 35; 40; 55; 58; 59; 69; 79; 109; 137; 139; 144\\)

=== (voir 2.12 ; 4.1 ; Ép 4.1, 17 ; Ph 1.27 ; Col 1.10)
--- string chomp
(voir 2.12 ; 4.1 ; Ép 4.1, 17 ; Ph 1.27 ; Col 1.10)
--- expect chomp
(voir \\#2.12; 4.1; Ep 4.1, 17; Ph 1.27; Col 1.10\\)

=== des sept Eglises dans Apocalypose 2 et 3, jusau'à aujourd'hui
--- string chomp
des sept Eglises dans Apocalypose 2 et 3, jusau'à aujourd'hui
--- expect chomp
des sept Eglises dans Apocalypose 2 et 3, jusau'à aujourd'hui

=== parse Dans 1 Corinthiens 1:18 à 2:15
--- string chomp
voir 1 Corinthiens 1:18 à 2.15
--- expect chomp
voir \\#1Corinthiens 1:18-2:15\\


=== parse Éz 20:33-44 ; 25 - 32
--- string chomp
Éz 20:33-44 ; 25 - 32
--- expect chomp
\\#Ez 20:33-44; 25-32\\

=== parse 1Jn 2:12 et 1Jn 2:13
--- string chomp
1Jn 2:12 et 1Jn 2:13
--- expect chomp
\\#1Jn 2:12, 13\\


=== parse (voir Ge 6-8; De 28:15-68; Esa 1; 3; 5; 13-23; Jér 2-9; 46-51; Ez 20:33-44; 25-32; Joe 3:12-16; Za 12:2, 9; 14:2; Mal 3:2-6; Mt 12:36; 25:31-46; Lu 12:48; Ro 14:10-12; 1Co 3:12-15; 5:5; 2Co 5:10; Ga 6:7; Col 3:24, 25; Ap 6-20)
--- string chomp
(voir Ge 6-8; De 28:15-68; Esa 1; 3; 5; 13-23; Jér 2-9; 46-51; Ez 20:33-44; 25-32; Joe 3:12-16; Za 12:2, 9; 14:2; Mal 3:2-6; Mt 12:36; 25:31-46; Lu 12:48; Ro 14:10-12; 1Co 3:12-15; 5:5; 2Co 5:10; Ga 6:7; Col 3:24, 25; Ap 6-20)
--- expect chomp
(voir \\#Ge 6-8; De 28:15-68; Esa 1; 3; 5; 13-23; Jér 2-9; 46-51; Ez 20:33-44; 25-32; Joe 3:12-16; Za 12:2, 9; 14:2; Mal 3:2-6; Mt 12:36; 25:31-46; Lu 12:48; Ro 14:10-12; 1Co 3:12-15; 5:5; 2Co 5:10; Ga 6:7; Col 3:24, 25; Ap 6-20\\)

=== parse 2 Jn 5,6)
--- string chomp
2 Jn 5,6)
--- expect chomp
\\#2Jn 1:5, 6\\)

=== parse Psaume 41.9 prédit qu'il allait être trahi par un ami intime, Psaume 22 donne les détails de sa crucifixion, Ésaïe 53 explique la signification théologique de sa mort et Psaume 16 prédit sa résurrection.
--- string chomp 
Psaume 41:9 prédit qu'il allait être trahi par un ami intime, Psaume 22 donne les détails de sa crucifixion, Ésaïe 53 explique la signification théologique de sa mort et Psaume 16 prédit sa résurrection.
--- expect chomp
\\#Psaume 41:8\\ prédit qu'il allait être trahi par un ami intime, \\#Psaume 22\\ donne les détails de sa crucifixion, \\#Esaïe 53\\ explique la signification théologique de sa mort et \\#Psaume 16\\ prédit sa résurrection.


=== parse (voir mes remarques au sujet de 1 Jean 2.3-6 et de 5.2,3 dans les chapitres 5 et 16 du présent volume)
--- string chomp 
(voir mes remarques au sujet de 1 Jean 2.3-6 et de 5.2,3 dans les chapitres 5 et 16 du présent volume)
--- expect chomp
(voir mes remarques au sujet de \\#1Jean 2.3-6\\; de \\#1Jean 5.2, 3\\ dans les chapitres \\#5$; 16$\\ du présent volume)

=== parse (Ab 14; És 2:10-21; 13:6-22; Joë 1 - 2; Am 5; Ab 15; So 1:7-18; Za 14; Ma 4)
--- string chomp 
(Ab 14; És 2:10-21; 13:6-22; Joë 1 - 2; Am 5; Ab 15; So 1:7-18; Za 14; Ma 4)
--- expect chomp
(\\#Ab 1:14; Esa 2:10-21; 13:6-22; Joe 1-2; Am 5; Ab 1:15; Sop 1:7-18; Za 14; Mal 4\\)

=== parse (voir 3 Jn 9,10)
--- string chomp 
(voir 3 Jn 9,10)
--- expect chomp
(voir \\#3Jn 1:9, 10\\)

=== parse (Jn 6:37,44,45,64,65; 15:16; Ro 8:31-39; Ph 1:6; 1 Th 1:4,5; 2 Th 2:13,14; 2 Ti 1:9; Jud 24,25)
--- string chomp 
(Jn 6:37,44,45,64,65; 15:16; Ro 8:31-39; Ph 1:6; 1 Th 1:4,5; 2 Th 2:13,14; 2 Ti 1:9; Jud 24,25)
--- expect chomp
(\\#Jn 6:37, 44, 45, 64, 65; 15:16; Ro 8:31-39; Ph 1:6; 1Th 1:4, 5; 2Th 2:13, 14; 2Ti 1:9; Jude 1:24, 25\\)

=== parse (voir Ro 12:1 - 13:10; 1 Co 3:5-23; Ga 5:1-6; Ép 4:11-16)
--- string chomp
(voir Ro 12:1 - 13:10; 1 Co 3:5-23; Ga 5:1-6; Ép 4:11-16)
--- expect chomp
(voir \\#Ro 12:1-13:10; 1Co 3:5-23; Ga 5:1-6; Ep 4:11-16\\)

=== parse Jér 46 - 51
--- string chomp
Jér 46 - 51
--- expect chomp
\\#Jér 46-51\\

=== parse (2 Pi 2.10; voir 2.18; 
--- string chomp
(2 Pi 2:10; voir 2:18;
--- expect chomp
(\\#2P 2:10\\; voir \\#2P 2:18\\;

=== parse Mt 1:1, 2
--- string chomp
Mt 1:1, 2
--- expect chomp
\\#Mt 1:1, 2\\
=== parse LC - Ge 1
--- string chomp
Ge 1
--- expect chomp
\\#Ge 1\\
=== parse LCVCV - Ge 1:1-2:5
--- string chomp
Ge 1:1-2:5
--- expect chomp
\\#Ge 1:1-2:5\\
=== parse LCCV - Ge 1-2:5
--- string chomp
Ge 1-2:5
--- expect chomp 
\\#Ge 1-2:5\\
=== parse LCC - Ge 1-2
--- string chomp
Ge 1-2
--- expect chomp
\\#Ge 1-2\\
=== parse LC - Ge 1
--- string chomp
Ge 1
--- expect chomp
\\#Ge 1\\
=== parse CVCV - 1:1-2:5
--- string chomp
voir 1:1-2:5
--- expect chomp
voir \\#1:1-2:5\\
=== parse CCV - 1-2:5
--- string chomp
voir 1-2:5
--- expect chomp
voir \\#1$-2:5\\
=== parse CC - 1-2
--- string chomp
voir 1-2
--- expect chomp
voir \\#1$-2$\\
=== parse C - 2
--- string chomp
voir 1
--- expect chomp
voir \\#1$\\
=== parse VV - 1-2
--- string chomp
vv. 1-2
--- expect chomp
vv. \\#1-2\\
=== parse V - 2
--- string chomp
v. 1
--- expect chomp
v. \\#1\\
=== parse a book that has only one chapter - Jude 4
--- string chomp
Jude 4
--- state chomp
VERSE
--- expect chomp
\\#Jude 1:4\\



