# Save a .Renviron file in home directory. NOTE: keep it away from Version Control
# Use Sys.getenv() to retrieve info

# Example .Renviron
# uid = "username"
# pwd = "password"
# srv = "servername"
# db = "database"

library(DBE)
library(odbc)

connect_db <- function() {
  dbConnect(
    odbc::odbc(),
    server = Sys.getenv("srv"),
    driver = "{ODBC Driver 13 for SQL Server}",
    database = Sys.getenv("db"),
    uid = Sys.getenv("uid"),
    pwd = Sys.getenv("pwd")
  )
}

dbWriteTable(connect_db(),
             "TABLE_X",
             dataset,
             append = TRUE,
             row.names = FALSE)
