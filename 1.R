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
  



######The a #######
 cyto.id   lymphs     macs     neuts eos    other
1  17-090558 29.72973 58.10811 12.162162   0 0.000000
2  17-090421 47.72727 52.27273  0.000000   0 0.000000
3  17-083478 32.00000 32.00000 36.000000   0 0.000000
4  17-074248 60.00000 37.00000  3.000000   0 0.000000
5  17-049722 25.00000 65.00000  6.666667   0 3.333333
6  17-047722 37.00000 38.00000 25.000000   0 0.000000

######The d#######
      cyto.id   cell.type     value     name2
1   16-094131 Macrophages 14.000000 16-094131
2   17-096162 Macrophages 24.000000 17-096162
3   17-032882 Macrophages 18.000000 17-032882
4   17-001531 Macrophages 35.000000 17-001531
5   17-096240 Macrophages  0.000000 17-096240
6   17-102543 Macrophages 24.000000 17-102543
7   17-074248 Macrophages 37.000000 17-074248
8   16-088089 Macrophages 39.000000 16-088089
