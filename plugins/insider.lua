do
function run(msg, matches)
  local answers = {'Insider: eben\nerschaffen/hauptsächlich verwendet von: pegelf\nWo eingesetzt?: sehr oft in Sätzen\nBemerkung: Ein Markenzeichen von ihm, nach Mr.DaBus Meinung.',
				   'Insider: ebenD\nerschaffen/hauptsächlich verwendet von: Andi919\nWo eingesetzt?: immer statt dem Wort "eben"\nBemerkung: das D wird absichtlich groß geschrieben',
				   'Insider: Lol\nerschaffen/hauptsächlich verwendet von: Akamaru\nWo eingesetzt?: wenn am Mobilgerät geschrieben, meistens bei Telegram\nBemerkung: Die Autokorrektur schreibt Anfangsbuchstaben immer groß, Mr.DaBu hasst diese Schreibweise aber',
				   'Insider: lawl\nerschaffen/hauptsächlich verwendet von: Centzilius\nWo eingesetzt?: immer anstelle von "lol"\nBemerkung: eines seiner Markenzeichen',
				   'Insider: xd\nerschaffen/hauptsächlich verwendet von: Plueschopath\nWo eingesetzt?: Telegram\nBemerkung: eines seiner Markenzeichen',
				   'Insider: nya\nerschaffen/hauptsächlich verwendet von: Plueschopath\nWo eingesetzt?: Telegram\nBemerkung: Alternative zu naja',
				   'Insider: TM\nerschaffen/hauptsächlich verwendet von: Mr.DaBu\nWo eingesetzt?: am Ende von Insidern\nBemerkung: am Ende von Insidern',
				   'Insider: joa\nerschaffen/hauptsächlich verwendet von: Akamaru\nWo eingesetzt?: oft bei ja/nein-Fragen\nBemerkung: ---',
				   'Insider: [...] lol\nerschaffen/hauptsächlich verwendet von: Sammy\nWo eingesetzt?: Am Ende eines Satzes\nBemerkung: Dieser Insider ist nur dann gemeint, wenn "lol" am Ende des Satzes steht!',
				   'Insider: wat\nerschaffen/hauptsächlich verwendet von: Sammy\nWo eingesetzt?: bei Unklarheit\nBemerkung: wird auch von anderen verwendet, aber bei ihm am meisten',
				   'Insider: Pff\nerschaffen/hauptsächlich verwendet von: pegelf\nWo eingesetzt?: Als Ablehnung\nBemerkung: meistens, wenn die Idee einer anderen Person überflüssig ist',
				   'Insider: lOl\nerschaffen/hauptsächlich verwendet von: Mr.DaBu\nWo eingesetzt?: wenn "lol" falsch geschrieben wurde (meistens Lol)\nBemerkung: meistens mit Zusatzinfo: lOl = Teller mit Besteck',
				   'Insider: yo\nerschaffen/hauptsächlich verwendet von: Brawl\nWo eingesetzt?: Als Begrüßung\nBemerkung: ---',
				   'Insider: yow\nerschaffen/hauptsächlich verwendet von: DefenderX\nWo eingesetzt?: Als Begrüßung\nBemerkung: ---',
				   'Insider: ._.\nerschaffen/hauptsächlich verwendet von: Brawl\nWo eingesetzt?: Bei jeder Gelegenheit\nBemerkung: ---',
				   'Insider: <.<\nerschaffen/hauptsächlich verwendet von: Brawl\nWo eingesetzt?: Wenn jemand etwas nicht kapiert oder was nicht richtig geht\nBemerkung: Meistens auch als >.<, >.>, <_<, >_< oder >_>',
				   'Insider: möp\nerschaffen/hauptsächlich verwendet von: Akamaru\nWo eingesetzt?: meistens aus Langeweile, wenn Stille herrscht\nBemerkung: danach folgt meistens von jemand anderem "se" um ein Wort zu bilden...',
				   'Insider: *Stille*\nerschaffen/hauptsächlich verwendet von: Mr.DaBu, Akamaru uvm.\nWo eingesetzt?: Wenn als letzte Nachricht eine Frage oder Aussage geschrieben wurde und nichts mehr folgt\nBemerkung: Meistens geht es danach wieder weiter',
				   'Insider: Certzilius\nerschaffen/hauptsächlich verwendet von: Mr.DaBu\nWo eingesetzt?: bei Gelegenheit in Chats als Nickname für Centzilius\nBemerkung: erfunden in Telegram, da Centzilius die SSL-Zertifikate (engl. abk.: "cert") verwaltet und oft welche für pegelf erstellen oder erneuern muss.',
				   'Insider: Brswl\nerschaffen/hauptsächlich verwendet von: Akamaru\nWo eingesetzt?: als Anrede für Brawl\nBemerkung: absichtlicher Tippfehler',
				   'Insider: Brawl-imoutochan\nerschaffen/hauptsächlich verwendet von: Akamaru\nWo eingesetzt?: als Anrede für Brawl\nBemerkung: "imoutochan" ist japanisch für "kleine Schwester"',
				   'Insider: re\nerschaffen/hauptsächlich verwendet von: Centzilius\nWo eingesetzt?: anstelle von "wd"\nBemerkung: ---',
				   'Insider: Anders\nerschaffen/hauptsächlich verwendet von: Simon\nWo eingesetzt?: Telegram-Zweitgruppe\nBemerkung: seit er da ist, sehr oft; anfangs durch ein Missverständnis mit dem Namen "cent" entstanden. Jetzt verwendet er es als Spitzname für Andreas/Brawl (worauf dann meist von Brawl folgt: "Ich bin Anders")',
				   'Insider: PDF\nerschaffen/hauptsächlich verwendet von: Mr.DaBu\nWo eingesetzt?: anstelle von "pff"\nBemerkung: Mr.DaBu wollte mal "Pff" schreiben, aber seine Autokorrektur hat "PDF" daraus gemacht.',
				   'Insider: ay\nerschaffen/hauptsächlich verwendet von: Brawl\nWo eingesetzt?: anstelle von "ja"\nBemerkung: ---',
				   'Insider: denn\nerschaffen/hauptsächlich verwendet von: Henrik\nWo eingesetzt?: Telegram\nBemerkung: anstelle von "dann"',
				   'Insider: DaBui\nerschaffen/hauptsächlich verwendet von: Akamaru\nWo eingesetzt?: Telegram\nBemerkung: anstelle von "DaBu"; meist wenn Mr.DaBu schlafen geht',
				   'Insider: :\\\nerschaffen/hauptsächlich verwendet von: nino\nWo eingesetzt?: mehrbedeutend: nachdenklich, zweifelnd, traurig usw.\nBemerkung: eines seiner Markenzeichen',
				   'Insider: MeeeeeeeM\nerschaffen/hauptsächlich verwendet von: Brawl, nino\nWo eingesetzt?: FiiiiiiiiiiiiiiiiiF\nBemerkung: SooooooooooooooooS',
				   'Insider: DJ mP\nerschaffen/hauptsächlich verwendet von: Brawl\nWo eingesetzt?: Telegram\nBemerkung: als Kurzname für masterP',
				   'Insider: Satya Nutella\nerschaffen/hauptsächlich verwendet von: Brawl\nWo eingesetzt?: Telegram\nBemerkung: Anstelle von "Satya Nadella"'}
  return answers[math.random(#answers)]
end

return {
  description = "Die pegelf Insider!",
  usage = {"/Insider","/insider"},
  patterns = {"^/Insider$","^/insider$"},
  run = run
}
end
--by Akamaru
--'Insider: \nerschaffen/hauptsächlich verwendet von: \nWo eingesetzt?: \nBemerkung: '
--all insider from https://wiki.pegelf.de/Insiderliste