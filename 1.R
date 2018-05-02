a<-read.csv("cells.csv")
######Rearrange the table and make the one you wanna sort at the end#######
a3<-data.frame(a$cyto.id,a$macs,a$neuts,a$eos,a$other,a$lymphs)
colnames(a3)<-c("cyto.id","Macrophages","Neutrophils","Eosinophils","Other","Lymphocytes")
#######Sort as a decending order############
a2<-a3[order(a3$Lymphocytes,decreasing=T),]
require(reshape2)
########Melt the table########
d=melt(a2,id=c("cyto.id"))
colnames(d)<-c("cyto.id","cell.type","value")
#########Design the fill you wanna sort#########
vals = d[ d$cell.type == 'Lymphocytes', ]
xvals = vals[with(vals, order(value,decreasing = T)), ]$cyto.id
#########New name based on new level##############
d$name2 <- factor(d$cyto.id, levels = xvals)
ggplot(d, aes(x = name2, y = value, fill = cell.type)) + geom_bar(stat = "identity", position = "fill") + 
  xlab("Submission ID")+ ylab("Percentage of cell type") + ggtitle("Cell differential") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
  
