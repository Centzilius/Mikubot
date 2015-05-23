function run(msg, matches)
	return 'Name: Naira\nLink: https://telegram.me/addstickers/Naira\n\nName: Naira2\nLink: https://telegram.me/addstickers/Naira2\n\nName: Miku Hatsune\nLink: https://telegram.me/addstickers/MikuHatsune\n\nName: Pinkie Pie\nLink: https://telegram.me/addstickers/PinkiePie\n'
end

return {
  description = "Sticker Pack Liste", 
  usage = {'/stickers','/Stickers'},
  patterns = {'^/stickers$','^/Stickers$'}, 
  run = run 
}
--by Akamaru [https://ponywave.de]