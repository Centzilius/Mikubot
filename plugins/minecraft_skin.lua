local function run(msg, matches)
	local receiver = get_receiver(msg)
	local url = 'http://www.minecraft-skin-viewer.net/3d.php?layers=true&aa=true&a=0&w=330&wt=10&abg=330&abd=40&ajg=340&ajd=20&ratio=13&format=png&login='..matches[1]..'&headOnly=false&displayHairs=true&randomness=341.png'
		print("Bild URL: "..url)
		send_photo_from_url(receiver, url)
end

return {
  description = "Sendet einen 3D Minecraft Skin", 
  usage = {"/skin [Name]"},
  patterns = {"^/skin (.*)$",}, 
  run = run 
}
--by Akamaru [https://ponywave.de]