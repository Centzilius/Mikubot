function run(msg, matches)
local receiver = get_receiver(msg)
local url = 'https://porndoge.herokuapp.com/'
local file = download_to_file(url)
local cb_extra = {file_path=file}
    send_photo(receiver, file, ok_cb, false)
end

return {
    description = "",
    usage = {""},
    patterns = {"^/pdoge$"}, 
    run = run
}
--by Akamaru [https://ponywave.de]