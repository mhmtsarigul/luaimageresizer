require 'image'

dirname = '.'
dirs = io.popen('ls ' .. dirname)
for dir in dirs:lines() do
	
	print(dir)
	files = io.popen('ls ' .. dir)

	os.execute("mkdir " .. dir.."/resized")
	for file in files:lines() do
print(dir.."/"..file)
if(string.sub(file,-3)=="jpg") then

local img = image.load(dir.."/"..file):mul(255)
		local dim = 221
   		local img_scale = image.scale(img, '^'..dim)
   		local h = math.ceil((img_scale:size(2) - dim)/2)
   		local w = math.ceil((img_scale:size(3) - dim)/2)
   		img = image.crop(img_scale, w, h, w + dim, h + dim):floor()
   		img = img:div(255)
   		image.save(dir.."/resized/"..string.sub(file,0,-5).."_resized.jpg",img)
   	end 
	end  

end
