import os 

os.system("mkdir CSC-455-PROJECT")

os.chdir("CSC-455-PROJECT")

os.system("touch index.html")


# Make subdirectories 
os.system("mkdir descriptions")
os.system("mkdir diagrams")
os.system("mkdir php")
os.system("mkdir populate_tables")
os.system("mkdir sql")


#Go into descriptions 
os.chdir("descriptions")

os.system("touch ERD_description.txt")
os.system("touch schema_description.txt")

#Leave descriptions
os.chdir("..")


#Go into descriptions 
os.chdir("php")

os.system("touch employees_and_operates.php")
os.system("touch employee_pairs.php")
os.system("touch employees_operates_flight.php")

#Leave php
os.chdir("..")



#Go into descriptions 
os.chdir("populate_tables")

os.system("")

#Leave 
os.chdir("..")



#Go into descriptions 
os.chdir("sql")

os.system("touch queries.sql")
os.system("mkdir setup")

#Go into setup directory 
os.chdir("setup")

#Create tables 
os.system("touch create_tables.sql")

#Leave setup 
os.chdir("..")

#Leave sql
os.chdir("..")

























