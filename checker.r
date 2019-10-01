#Set up the table
ip<-read.csv("C:\\Users\\Sam\\Desktop\\ip.csv", stringsAsFactors = F)
colnames(ip)<-c("Region", "Zone", "Type", "Language", "Address")
ip$Time <- rep(NA,nrow(ip))
ip$RandNum <- rep(NA, nrow(ip))
# My IP address
my_ip <- "70.175.164.122"
for(row in 1:nrow(ip))
{
  x <- try(curl_fetch_memory(url=ip[row,"Address"]))
  if(inherits(x, "try-error"))
  {
    next
  }
  ip[row,"RandNum"] <- strtoi(trimws(rawToChar(x$content)))
  ip[row,"Time"] <- unname(x$times[6])
}
ip<-ip[order(ip$Region),]
lines <- c()
for(row in 1:nrow(ip))
{
  if(is.na(ip[row,"RandNum"])){
    next
  }
  lines<-c(lines,paste(sep="",my_ip,":",ip[row,"Region"],"_",ip[row,"Zone"],"_",ip[row,"Type"],"_",ip[row,"Language"],"@",ip[row,"Address"]," ",ip[row,"Time"],"s ",ip[row,"RandNum"]))
}
kable(x=lines, caption="Resources and response times, excepting non-numeric and missing")
rows <- na.omit(ip[,c(3,4,6)])
means <- aggregate(.~Type+Language, rows, mean)
ggplot(means, aes(x=Type, y=Time, fill=factor(Language))) + geom_bar(stat="identity", pos="dodge") + scale_fill_discrete(name="Language")+ylab("Time (s)")+ggtitle("Language/Implementation vs. Average Time")