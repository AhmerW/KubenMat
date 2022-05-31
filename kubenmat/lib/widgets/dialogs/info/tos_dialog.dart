import 'package:flutter/material.dart';

Map<String, String> tosInfo = {
  "Generelt": """
  Kubenmat er en tjeneste som leveres over tid og levering av varer og tjenester fra vår egen
nettside. Sammen med din bestilling, utgjør disse betingelsene det samlede avtalegrunnlaget
for kjøp.
På Kubenmat ber vi alle som ønsker å handle om å logge inn med sitt telefon nummer som
blir lagret i en brukerprofil. Den informasjonen vi spør om er nødvendig for å levere varene.
Hvordan vi behandler disse brukeropplysningene kan du lese mer om i vår
personvernerklæring.
Den som har logget inn hos Kubenmat er ansvarlig for betaling av de ytelser Kubenmat leverer
i henhold til nærværende vilkår. Ansvaret omfatter også andres bruk av kundenes tilgang,
herunder uvedkommendes bruk, så fremt det ikke kan påvises at uvedkommende bruk er
muliggjort gjennom uaktsomhet fra brukerens side.
En brukerkonto kan kun gjelde for én (1) person eller bedrift med tilhørende personalia og
brukerinformasjon.
  """,
  "Definisjon av parter": """
  Denne part, selger er: Kubenmat og blir i det følgende benevnt «Kubenmat», «selger», «vi»,
«oss», «vår» eller «vårt». Vårt telefonnummer er 40 09 09 17.

Kjøper er: en bruker som har gjennomført et kjøp. Den personen som er kjøper blir i det
følgende benevnt «kjøper», «bruker», «assistert bruker», «du», «deg», «din», eller «ditt».
  """,
  "Bestillingsprosess": """
  Din bestilling er bindende når bestillingen er registrert på vår server. Når vi har registrert din
bestilling, vil vi bekrefte denne gjennom å sende deg en bestillingsbekreftelse. Dersom ett
eller flere produkter i bestillingen er utsolgt forbeholder vi oss retten til å kansellere din
bestilling eller deler av denne. Ved utsolgtsituasjoner vil du få melding om dette.
  """,
  "Priser og betaling": """
  Alle priser er inkludert merverdiavgift med mindre prisen har et annet tilfelle. Den totale
kjøpesummen inkluderer alle kostnader forbundet med kjøpet, inkludert frakt, utlevering,
pant, poser m.m. På små bestillinger vil leveringspris kunne tilkomme. Disse er spesifisert i
våre prislister og i tilknytning til informasjon om total leveringspris.

Våre priser er i stadig forandring og vi tar derfor forbehold om prisendring som følge av
endrede priser. Vi forbeholder oss retten til leveringsnekt på samtlige varer som har en
lagersituasjon. Dette tilsier da at hvis varen er utsolgt, vil ikke vi levere.
  """,
  "Levering og forsinkelse": """
  Levering skjer på den adressen Kuben Videregående Skole ligger på. Kubenmat leverer til hvor
du sa du vil ha bestillingen til. Kubenmat har risikoen for varene inntil du har fått varene i din
besittelse. Dersom leveringen av varene blir forsinket, vil vi gi deg informasjon så fort vi har
kunnskap om det, sammen med informasjon om når levering kan skje.
Kubenmat forbeholder seg rett til leveringsnekt til enkeltpersoner dersom kunden ikke har
gjennomført handelen på en anstendig og sivilisert måte. Dersom personell som utfører
tjenester for KubenMat uttrykker ubehag eller oppfatter noen del av vår varelevering som støtende
eller truende, enten for seg selv eller andre, kan kundeforholdet avsluttes umiddelbart og
uten erstatning.
  """,
  "Bestillinger som ikke kunne leveres": """
  Kubenmat tar ikke ansvar for forringet eller redusert kvalitet og/eller holdbarhet på varer som
ikke blir tatt imot til den opprinnelig bestilte leveringstidspunktet.
Dersom vi ikke får tak i deg vil varene bli mistet på din risiko. Vi vil putte varene du bestilte
der du sa du ville ha de, og hvis ingen er der til å ta imot varene når vi kommer vil vi ringe deg.
Hvis kunden ikke svarer når vi ringer, vil vi sette fra oss varen på avtalt sted og dra. Da er det
ditt ansvar.
  """,
  "Angrerett": """
  Kubenmat forholder seg til de til enhver tid gjeldene regler i Angrerettloven som gir en
generell rett på angrefrist helt frem til varen er kjøpt og betalt for. Dersom du angrer kjøp av
varer, vil vi unngå å kjøpe varene. Vi foretar tilbakebetalingen med samme betalingsmiddel
som du benyttet ved den opprinnelige transaksjonen, med mindre du uttrykkelig har avtalt
noe annet med oss. I alle tilfeller vil du ikke bli pålagt noe gebyr som følge av
tilbakebetalingen.
  """,
  "Brukerens plikter": """
  Som registrert bruker er du selv ansvarlig for at alle opplysningene er riktig og for sikkerheten
til din profil. Du er også ansvarlig for alle aktiviteter som skjer i tilknytning til din brukerkonto
og du forplikter deg å

• Ikke dele ditt telefon nummer
• Melde fra til oss hvis du tror din brukerkonto kan være misbrukt
• Følge disse vilkårene og godta vår personvernerklæring
  """
};

Map<int, String> tosOrder = tosInfo.keys.toList().asMap();

class TOSDialog extends StatelessWidget {
  const TOSDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Vilkår & Betingelser"),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: tosOrder.length,
          itemBuilder: (context, index) {
            String header = tosOrder[index]!;
            String content = tosInfo[header]!;
            return Column(
              children: [
                Text(
                  header,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  content,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
