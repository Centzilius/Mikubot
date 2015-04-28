-- Checks if bot was disabled on specific chat
local function is_channel_disabled( receiver )
	if not _config.disabled_channels then
		return false
	end

	if _config.disabled_channels[receiver] == nil then
		return false
	end

  return _config.disabled_channels[receiver]
end

local function enable_channel(receiver)
	if not _config.disabled_channels then
		_config.disabled_channels = {}
	end

	if _config.disabled_channels[receiver] == nil then
		return 'Channel ist nicht deaktiviert!'
	end
	
	_config.disabled_channels[receiver] = false

	save_config()
	return "Channel wieder aktiviert!"
end

local function disable_channel( receiver )
	if not _config.disabled_channels then
		_config.disabled_channels = {}
	end
	
	_config.disabled_channels[receiver] = true

	save_config()
	return "Channel deaktiviert!"
end

local function pre_process(msg)
	local receiver = get_receiver(msg)
	
	-- If is sudo can reeanble the channel
	if is_sudo(msg) then
	  if msg.text == "/channel enable" then
	    enable_channel(receiver)
	  end
	end

  if is_channel_disabled(receiver) then
  	msg.text = ""
  end

	return msg
end

local function run(msg, matches)
	local receiver = get_receiver(msg)
	-- Enable a channel
	if matches[1] == 'enable' then
		return enable_channel(receiver)
	end
	-- Disable a channel
	if matches[1] == 'disable' then
		return disable_channel(receiver)
	end
end

return {
	description = "", 
	usage = {"Das kann nur Akamaru"},
	patterns = {"^/channel? (enable)","^/channel? (disable)" }, 
	run = run,
	privileged = true,
	pre_process = pre_process
}