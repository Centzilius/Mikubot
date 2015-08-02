do

local function run(msg, matches)
  local receiver = get_receiver(msg)
  local url = matches[1]
  local ext = matches[2]

  local file = download_to_file(url)
  local cb_extra = {file_path=file}
  
  local mime_type = mimetype.get_content_type_no_sub(ext)

  if ext == 'gif' then
    print('Sende Datei')
    send_document(receiver, file, rmtmp_cb, cb_extra)

  elseif mime_type == 'text' then
    print('Sende Document')
    send_document(receiver, file, rmtmp_cb, cb_extra)

  elseif mime_type == 'application' then
    print('Sende Document')
    send_document(receiver, file, rmtmp_cb, cb_extra)
  
  elseif mime_type == 'image' then
    print('Sende Foto')
    send_photo(receiver, file, rmtmp_cb, cb_extra)
  
  elseif mime_type == 'audio' then
    print('Sende Audio')
    send_audio(receiver, file, rmtmp_cb, cb_extra)

  elseif mime_type == 'video' then
    print('Sende Video')
    send_video(receiver, file, rmtmp_cb, cb_extra)
  
  else
    print('Sende Datei')
    send_document(receiver, file, rmtmp_cb, cb_extra)
  end
  
end

return {
    description = "Wenn ein User eine Medien-Datei sendet (gif, mp4, pdf, etc.), wird es gedownloadet und gesendet.", 
    usage = {""},
    patterns = {
    	"^(https?://[%w-_%.%?%.:/%+=&]+%.(gif))$",
    	"^(https?://[%w-_%.%?%.:/%+=&]+%.(mp4))$",
    	"^(https?://[%w-_%.%?%.:/%+=&]+%.(pdf))$",
    	"^(https?://[%w-_%.%?%.:/%+=&]+%.(ogg))$",
    	"^(https?://[%w-_%.%?%.:/%+=&]+%.(zip))$",
        "^(https?://[%w-_%.%?%.:/%+=&]+%.(tar.gz))$",
        "^(https?://[%w-_%.%?%.:/%+=&]+%.(7z))$",
    	"^(https?://[%w-_%.%?%.:/%+=&]+%.(mp3))$",
    	"^(https?://[%w-_%.%?%.:/%+=&]+%.(rar))$",
    	"^(https?://[%w-_%.%?%.:/%+=&]+%.(wmv))$",
    	"^(https?://[%w-_%.%?%.:/%+=&]+%.(doc))$",
    	"^(https?://[%w-_%.%?%.:/%+=&]+%.(avi))$",
		"^(https?://[%w-_%.%?%.:/%+=&]+%.(wav))$",
		"^(https?://[%w-_%.%?%.:/%+=&]+%.(apk))$",
		"^(https?://[%w-_%.%?%.:/%+=&]+%.(webm))$",
		"^(https?://[%w-_%.%?%.:/%+=&]+%.(ogv))$",
		"^(https?://[%w-_%.%?%.:/%+=&]+%.(webp))$"
    }, 
    run = run 
}

end