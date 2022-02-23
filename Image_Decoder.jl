# Image_Decoder.jl
# 20220222--20220223

using PyCall
OS = pyimport("os") # stat, utime

os_id = "_os_id_"
wx_id = "_wx_id_"
path = "C:/Users/$os_id/Documents/WeChat Files/$wx_id/FileStorage/Image"

mask(key::UInt8, stream::Vector{UInt8}) = xor.(key, stream)

get_heads(path::AbstractString) = 
	unique([read(f, 2) for f = readdir(path, join=true) if endswith(f, ".dat")])

function get_key(path::AbstractString)
	heads = get_heads(path)
	std = Set([[0xff, 0xd8], [0x89, 0x50]]) # JPG, PNG
	keyz = [k for k = 0x00:0xFF if all(in.(std, [mask.(k, heads)]))]
	@assert length(keyz) == 1
	first(keyz)
end

function decode!(key::UInt8, path::AbstractString)
	suffixes = Dict(0xff=>".jpg", 0x89=>".png")
	println(path)
	for file = readdir(path, join=true)
		name, ext = splitext(file)
		access_time = OS.stat(file)[8]
		modify_time = mtime(file)
		ext == ".dat" || continue
		print('-')
		stream = mask(key, read(file))
		write(file, stream)
		OS.utime(file, (access_time, modify_time))
		mv(file, name * get(suffixes, stream[1], ".data"))
	end
	println()
end

function decode_all!(path::AbstractString)
	regex = r"\d{4}-\d\d$"
	key = nothing
	for folder = readdir(path, join=true)
		isnothing(match(regex, folder)) && continue
		isnothing(key) && (key = get_key(folder))
		decode!(key, folder)
	end
	key
end
