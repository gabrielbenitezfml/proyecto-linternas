library(RMySQL)
library(DBI)
con_sql <- dbConnect(MySQL(),user="gabriel",password="perrito",dbname="proyecto",host="127.0.0.1",port=3306)
?dbConnect

dbListTables(con_sql)
dbListFields(con_sql,"cb_ipos")
ipos <- dbSendQuery(con_sql,"select * from cb_ipos")
relaciones <- dbSendQuery(con_sql,"select * from cb_relationships")
acquisitions <- dbSendQuery(con_sql,"select * from cb_acquisitions")
data_acquisitions <- fetch(acquisitions,n=-1)
data_relaciones <- fetch(relaciones, n = -1)
data_ipos <- fetch(ipos,n=-1)
degrees <-dbSendQuery(con_sql,"select * from cb_degrees")
data_degrees <- fetch(degrees, n = -1)
funding_rounds <- dbSendQuery(con_sql,"select * from cb_funding_rounds") 
data_funding_rounds <- fetch(funding_rounds,n = -1)
funds <- dbSendQuery(con_sql,"select * from cb_funds")
data_funds <- fetch(funds, n = -1)
investments <- dbSendQuery(con_sql,"select * from cb_investments")
data_investments <-fetch(investments, n = -1)
milestones <- dbSendQuery(con_sql,"select * from cb_milestones")
data_milestones <- fetch(milestones, n = - 1)
objects1 <- dbSendQuery(con_sql,"select * from cb_objects")
data_objects <- fetch(objects1, n = - 1)
offices <- dbSendQuery(con_sql,"select * from cb_offices")
data_offices <- fetch(offices, n = - 1)

summary(data_ipos)
dbListFields(con_sql,"cb_acquisitions")
##random forest, SVM, k-means, yamaha, gradient boosting, redes neuronales
##regresion lgistica


nombres <- list(data_acquisitions=data_acquisitions,data_degrees=data_degrees,data_funding_rounds=data_funding_rounds, data_funds=data_funds,
                data_investments=data_investments,data_ipos=data_ipos,data_milestones=data_milestones,data_objects=data_objects, data_offices=data_offices,
                data_relaciones=data_relaciones)

for (i in 1:10) {
  write.csv(nombres[[i]], file= paste(names(nombres)[i],".csv"))
  
}
write.csv(data_acquisitions, file= "acquisitions.csv")
write.csv(data_degrees, file= "degrees.csv")
write.csv(data_funding_rounds, file= "funding_rounds.csv")
write.csv(data_funds, file= "funds.csv")
write.csv(data_investments, file= "investments.csv")
write.csv(data_ipos, file= "ipos.csv")
write.csv(data_milestones, file= "milestones.csv")
write.csv(data_objects, file= "objects.csv")
write.csv(data_offices, file= "offices.csv")
write.csv(data_relaciones, file= "relaciones.csv")
