use t::TestConfig;
use utf8;
binmode(STDIN , ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");
use Data::Dumper;
no warnings;

plan tests => 53;
    
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
  chapitre_mots: (?:voir aussi|voir|\\(|voir chapitre|\\bde\\b|dans les chapitres|des chap\.)
  verset_mots: (?:vv?\.|voir aussi v\.|voir chapitre|dans les versets|les versets|au verset)
YAML

my $c  = new Religion::Bible::Regex::Config($yaml); 
my $b  = new Religion::Bible::Regex::Builder($c);
my $rl = new Religion::Bible::Regex::Lexer($c, $b);	

sub extract_references {
   return $rl->parse(shift)->references;
}

run {
    my $block = shift;
    my $line = $block->string;

    print "==================================================\n$line\n";    
    
    while($line =~ m/($b->{'reference_biblique_list'})/g) {
	my $refs = $1;
#        is(extract_references($1), $block->expect, $block->name);
	foreach my $ref (@{extract_references($refs)}) {
	    print "     " . $ref->normalize ."\n";
	} 
    }
};

#=== Jér 46 - 51
#--- string chomp
#Jér 46 - 51
#--- expect chomp
#\\#Jér 46$-51$\\

# === 
# --- string chomp

# --- expect chomp
__END__
=== 
--- string chomp
au tabernacle était de 2000 coudées
--- expect chomp
au tabernacle était de 2000 coudées

=== 
--- string chomp
Par exemple, voici ce que l’Esprit dit au verset 11 : 
--- expect chomp
Par exemple, voici ce que l’Esprit dit au verset \\#11\\ : 
=== 
--- string chomp
Dieu avait demandé à Josué d’apprendre cette leçon dès le début de l’exercice de son leadership (Josué 1:6-9). 
--- expect chomp
Dieu avait demandé à Josué d’apprendre cette leçon dès le début de l’exercice de son leadership (\\#Josué 1:6-9\\). 

=== (les sept Églises des chap. 2 et 3 ; même s'il s'agit d'Églises historiques 
--- string chomp
(les sept Églises des chap. 2 et 3 ; même s'il s'agit d'Églises historiques
--- expect chomp
(les sept Églises des chap. \\#2; 3\\ ; même s'il s'agit d'Églises historiques

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


=== parse Ez 20:33-44 ; 25 - 32
--- string chomp
Ez 20:33-44 ; 25 - 32
--- expect chomp
\\#Ez 20:33-44; 25$-32$\\

=== parse 1Jn 2:12 et 1Jn 2:13
--- string chomp
1Jn 2:12 et 1Jn 2:13
--- expect chomp
\\#1Jn 2:12, 13\\


=== parse (voir Ge 6-8; De 28:15-68; Esa 1; 3; 5; 13-23; Jér 2-9; 46-51; Ez 20:33-44; 25-32; Joe 3:12-16; Za 12:2, 9; 14:2; Mal 3:2-6; Mt 12:36; 25:31-46; Lu 12:48; Ro 14:10-12; 1Co 3:12-15; 5:5; 2Co 5:10; Ga 6:7; Col 3:24, 25; Ap 6-20)
--- string chomp
(voir Ge 6-8; De 28:15-68; Esa 1; 3; 5; 13-23; Jér 2-9; 46-51; Ez 20:33-44; 25-32; Joe 3:12-16; Za 12:2, 9; 14:2; Mal 3:2-6; Mt 12:36; 25:31-46; Lu 12:48; Ro 14:10-12; 1Co 3:12-15; 5:5; 2Co 5:10; Ga 6:7; Col 3:24, 25; Ap 6-20)
--- expect chomp
(voir \\#Ge 6$-8$; De 28:15-68; Esa 1; 3; 5; 13$-23$; Jér 2$-9$; 46$-51$; Ez 20:33-44; 25$-32$; Joe 3:12-16; Za 12:2, 9; 14:2; Mal 3:2-6; Mt 12:36; 25:31-46; Lu 12:48; Ro 14:10-12; 1Co 3:12-15; 5:5; 2Co 5:10; Ga 6:7; Col 3:24, 25; Ap 6$-20$\\)

=== parse 2 Jn 5,6)
--- string chomp
2 Jn 5,6)
--- expect chomp
\\#2Jn 1:5, 6\\)

=== parse Psaume 41.9 prédit qu'il allait être trahi par un ami intime, Psaume 22 donne les détails de sa crucifixion, Ésaïe 53 explique la signification théologique de sa mort et Psaume 16 prédit sa résurrection.
--- string chomp 
Psaume 41:9 prédit qu'il allait être trahi par un ami intime, Psaume 22 donne les détails de sa crucifixion, Ésaïe 53 explique la signification théologique de sa mort et Psaume 16 prédit sa résurrection.
--- expect chomp
\\#Psaume 41:9\\ prédit qu'il allait être trahi par un ami intime, \\#Psaume 22\\ donne les détails de sa crucifixion, \\#Esaïe 53\\ explique la signification théologique de sa mort et \\#Psaume 16\\ prédit sa résurrection.


=== parse (voir mes remarques au sujet de 1 Jean 2.3-6 et de 5.2,3 dans les chapitres 5 et 16 du présent volume)
--- string chomp 
(voir mes remarques au sujet de 1 Jean 2.3-6 et de 5.2,3 dans les chapitres 5 et 16 du présent volume)
--- expect chomp
(voir mes remarques au sujet de \\#1Jean 2.3-6\\; de \\#1Jean 5.2, 3\\ dans les chapitres \\#5; 16\\ du présent volume)

=== parse (Ab 14; És 2:10-21; 13:6-22; Joë 1 - 2; Am 5; Ab 15; So 1:7-18; Za 14; Ma 4)
--- string chomp 
(Ab 14; És 2:10-21; 13:6-22; Joë 1 - 2; Am 5; Ab 15; So 1:7-18; Za 14; Ma 4)
--- expect chomp
(\\#Ab 1:14; Esa 2:10-21; 13:6-22; Joe 1$-2$; Am 5; Ab 1:15; Sop 1:7-18; Za 14; Mal 4\\)

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
\\#Jér 46$-51$\\

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
\\#Ge 1$-2$\\
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
voir \\#1-2:5\\
=== parse CC - 1-2
--- string chomp
voir 1-2
--- expect chomp
voir \\#1$-2$\\
=== parse C - 2
--- string chomp
voir 1
--- expect chomp
voir \\#1\\
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



