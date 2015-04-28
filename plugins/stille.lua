do

function run(msg, matches)
  local answers = {'Ja, es ist sehr ruhig hier','Wenn es dir zu still ist, kannst du gerne mit mir reden',
  		     '*SCHREI*','Dann mach doch etwas dagegen!','Möpse?','Vermutlich schlafen alle',
                  'Stört dich die Stille?','Nein, es ist nicht still','Nyu?','Besser als Spam','Stille ist schön',
                  'Mein Name ist Mikubot','Spiel doch etwas http://curvefever.com/',
                  'Stille sagt manchmal mehr als tausend Worte',
                  'Stille und Nacht sind untrennbar verwoben. Die Nacht ist die Stille unter den Sternen.'}
  return answers[math.random(#answers)]
end

return {
  description = "Es ist so still hier",
  usage = {"Stille","stille","*stille*","*Stille*"},
  patterns = {"^Stille","^stille","^*stille*","^*Stille*"},
  run = run
}
end
--by Akamaru