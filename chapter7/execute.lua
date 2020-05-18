os.execute('mkdir sample_directory')
os.execute('rmdir sample_directory')

local file = io.popen('dir', 'r')
for entry in file:lines() do
    print(entry)
end