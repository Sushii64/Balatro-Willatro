WLTUTIL = {}

function WLTUTIL.load_folder(path)
	local items = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. path)
	for _, item in ipairs(items) do
		assert(SMODS.load_file(path .. "/" .. item))()
	end
end

function WLTUTIL.load_folders(paths)
	for _, path in ipairs(paths) do
		WLTUTIL.load_folder(path)
	end
end