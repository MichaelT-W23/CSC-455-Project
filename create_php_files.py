import os

path = "php"

files_list = [f for f in os.listdir(path) if os.path.isfile(os.path.join(path, f))]

for file in files_list:
    print(f'os.system("touch {file}")')
    #print(f'os.system("type nul > {file}")')


# import os 
# import platform

# def make_folder_on_mac():
#     os.system("mkdir CSC-455-Project")
#     os.system("touch index.html")


# def make_folder_on_windows():
#     os.system("mkdir CSC-455-Project")
#     os.system("type nul > index.html")



# system = platform.system()

# if system == "Darwin":
#     make_folder_on_mac()
# elif system == "Windows":
#     make_folder_on_windows()
# else:
#     print("\33[31mUnsupported operating system\033[0m")



