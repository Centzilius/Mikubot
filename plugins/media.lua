do

function run(msg, matches)
  local receiver = get_receiver(msg)
  local file = download_to_file(matches[1])
  send_document(get_receiver(msg), file, ok_cb, false)
end

return {
  description = "Wenn ein Link zu einer Datei gesendet wird, läd und sendet der Bot die Datei.", 
  usage = "Link zur Datei",
  patterns = {
    "(https?://[%w-_%.%?%.:/%+=&]+%.gif)$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.mp4)$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.pdf)$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.ogg)$",
	"(https?://[%w-_%.%?%.:/%+=&]+%.ogv)$",
	"(https?://[%w-_%.%?%.:/%+=&]+%.oga)$",
	"(https?://[%w-_%.%?%.:/%+=&]+%.ogx)$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.zip)$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.mp3)$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.rar)$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.wmv)$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.wma)$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.doc)$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.tar.gz)$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.dlc)$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.txt)$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.deb)$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.webm)$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.avi)$",
	"(https?://[%w-_%.%?%.:/%+=&]+%.wav)$",
	"(https?://[%w-_%.%?%.:/%+=&]+%.exe)$",
	"(https?://[%w-_%.%?%.:/%+=&]+%.rpm)$",
	"(https?://[%w-_%.%?%.:/%+=&]+%.dmg)$",
	"(https?://[%w-_%.%?%.:/%+=&]+%.apk)$",
	"(https?://[%w-_%.%?%.:/%+=&]+%.ipa)$",
	"(https?://[%w-_%.%?%.:/%+=&]+%.webp)$"
  }, 
  run = run 
}

end