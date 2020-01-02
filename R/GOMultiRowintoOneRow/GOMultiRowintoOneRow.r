#    ______                   ________  __                                     __        
#   /      \                 /        |/  |                                   /  |       
#  /$$$$$$  |  ______        $$$$$$$$/ $$ |____    ______   _______    ______ $$/_______ 
#  $$ |__$$ | /      \           /$$/  $$      \  /      \ /       \  /      \$//       |
#  $$    $$ |/$$$$$$  |         /$$/   $$$$$$$  | $$$$$$  |$$$$$$$  |/$$$$$$  |/$$$$$$$/ 
#  $$$$$$$$ |$$ |  $$ |        /$$/    $$ |  $$ | /    $$ |$$ |  $$ |$$ |  $$ |$$      \ 
#  $$ |  $$ |$$ \__$$ |       /$$/____ $$ |  $$ |/$$$$$$$ |$$ |  $$ |$$ \__$$ | $$$$$$  |
#  $$ |  $$ |$$    $$/       /$$      |$$ |  $$ |$$    $$ |$$ |  $$ |$$    $$ |/     $$/ 
#  $$/   $$/  $$$$$$/        $$$$$$$$/ $$/   $$/  $$$$$$$/ $$/   $$/  $$$$$$$ |$$$$$$$/  
#                                                                    /  \__$$ |          
#                                                                    $$    $$/           
#                                                                     $$$$$$/            
#   ________                   __ 
#  /        |                 /  |
#  $$$$$$$$/______    ______  $$ |              Tool name: GOMultiRowintoOneRow.r
#     $$ | /      \  /      \ $$ |
#     $$ |/$$$$$$  |/$$$$$$  |$$ |              Updated: 01/02/2020
#     $$ |$$ |  $$ |$$ |  $$ |$$ |
#     $$ |$$ \__$$ |$$ \__$$ |$$ |              Website: datahold.cn
#     $$ |$$    $$/ $$    $$/ $$ |
#     $$/  $$$$$$/   $$$$$$/  $$/ 
#                                 


rm(list=ls())
# set workspace
setwd("C:/Users/zhang/Desktop/test")
fn <- file.choose()
bn <- basename(fn)
nameOutput <- paste0(bn,"_transform.csv")

# read a CSV file to be converted
# The format of CSV file:
# RGZM2G010871	GO:0003700
#           		GO:0003701
#               GO:0003702
#               GO:0003703
#               GO:0003704
#               GO:0003705
#               GO:0003706
#RGZM2G010872	  GO:0003707
#               GO:0003708
#               GO:0003709
#RGZM2G010873	  GO:0003710
#               GO:0003711
#               GO:0003712
#               GO:0003713
test <- read.csv(bn,header=F)

# Complement the fist column
for (i in 1:nrow(test)){
  if(test$V1[i]==""){
    test$V1[i] <- test$V1[i-1]
  }
}

# Initialize the data frame of result
dataF <- data.frame(names=as.character(unique(test$V1)),value=NA)
dataF$names <- as.character(dataF$names)

for (j in 1:nrow(dataF)){
  
  dataF$value[j] <- paste(test$V2[which(test$V1==dataF$names[j])],collapse = ",")
}

print("  ______                   ________  __                                     __        ")
print(" /      \                 /        |/  |                                   /  |       ")
print("/$$$$$$  |  ______        $$$$$$$$/ $$ |____    ______   _______    ______ $$/_______ ")
print("$$ |__$$ | /      \           /$$/  $$      \  /      \ /       \  /      \\A//       |")
print("$$    $$ |/$$$$$$  |         /$$/   $$$$$$$  | $$$$$$  |$$$$$$$  |/$$$$$$  |/$$$$$$$/ ")
print("$$$$$$$$ |$$ |  $$ |        /$$/    $$ |  $$ | /    $$ |$$ |  $$ |$$ |  $$ |$$      \ ")
print("$$ |  $$ |$$ \\__$$ |       /$$/____ $$ |  $$ |/$$$$$$$ |$$ |  $$ |$$ \\__$$ | $$$$$$  |")
print("$$ |  $$ |$$    $$/       /$$      |$$ |  $$ |$$    $$ |$$ |  $$ |$$    $$ |/     $$/ ")
print("$$/   $$/  $$$$$$/        $$$$$$$$/ $$/   $$/  $$$$$$$/ $$/   $$/  $$$$$$$ |$$$$$$$/  ")
print("                                                                  /  \\__$$ |          ")
print("                                                                  $$    $$/           ")
print("                                                                   $$$$$$/            ")
print(" ________                   __ ")
print("/        |                 /  |                                                       ")
print("$$$$$$$$/______    ______  $$ |              Tool name: GOMultiRowintoOneRow.r")
print("   $$ | /      \  /      \ $$ |")
print("   $$ |/$$$$$$  |/$$$$$$  |$$ |              Updated: 01/02/2020")
print("   $$ |$$ |  $$ |$$ |  $$ |$$ |")
print("   $$ |$$ \\__$$ |$$ \\__$$ |$$ |              Website: datahold.cn")
print("   $$ |$$    $$/ $$    $$/ $$ |")
print("   $$/  $$$$$$/   $$$$$$/  $$/ ")
  

# Output file
write.table(dataF,nameOutput,row.names = F,col.names = F,sep = ",")
cat(paste("File directory:\n"),getwd(),"\n","File name:\n",nameOutput,"\n")