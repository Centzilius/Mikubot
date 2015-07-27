function run(msg, matches)
local receiver = get_receiver(msg)
local url = matches[1]
local file = download_to_file(url)
local cb_extra = {file_path=file}
    chat_set_photo(receiver, file, ok_cb, false)
end

return {
    description = "",
    usage = {""},
    patterns = {"^/pic (.*)$"}, 
    run = run
}