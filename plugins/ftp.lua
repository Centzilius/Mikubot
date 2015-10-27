do

local function send_ftp_data (text_file, receiver)
  local BASE_URL = cred_data.ftp_site
  local username = cred_data.ftp_username
  local password = cred_data.ftp_password
  local url = "ftp://"..username..":"..password.."@"..BASE_URL.."/"..text_file..".txt"
  local data = ftp.get(url)
  if data == nil then
    send_msg(receiver, 'Ich konnte die Datei "'..text_file..'.txt" nicht auf dem Server finden!', ok_cb, false)
  else
    send_msg(receiver, data, ok_cb, false)
  end
end

local function run(msg, matches)
  if not ftp then
    print('ftp Library wird zum ersten Mal geladen...')
    ftp = (loadfile "./libs/ftp.lua")()
  end
  local text_file = matches[1]
  local receiver = get_receiver(msg)
  send_ftp_data(text_file, receiver)
end

return {
  description = "Sendet FTP-Textdatei.", 
  usage = "/ftp [Dateiname-ohne-txt]: Sendet eine txt von einem FTP.",
  patterns = {"^/ftp (.*)$"},
  run = run 
}

end