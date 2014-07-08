

readDataForPlot <- function() {
  
  dtStart <- as.Date("2007/02/01")
  dtEnd <- as.Date("2007/02/02")
  
  con <- file('household_power_consumption.txt')
  open(con)
  
  # read header, keep names
  cn <- unlist(strsplit(readLines(con, n = 1, warn = FALSE), ";"))
  
  lineno <- 1 # current line number
  start  <- 0 # line number which correspond to 2007/02/01
  end    <- 0 # line number which correspond to 2007/02/02

  # read file extract dates for identifying start/end
  while(TRUE) {
    line <- readLines(con, n = 1, warn = FALSE)
    if(length(line) <= 0) {
      # no more data
      break
    }
    
    lineno <- lineno + 1
    
    # extract 'Date' from the current row
    dt <- as.Date(unlist(strsplit(line, ";"))[1], "%d/%m/%Y")
    
    if(dt >= dtStart && start == 0) {
      start <- lineno
    }
    
    if(dt > dtEnd) {
      end <- lineno
      # we've found all what we need
      break
    }
  }
  close(con)
  
  # read into dataframe
  df <- read.csv2('household_power_consumption.txt', header = FALSE, 
                  skip = start - 1, nrows = end - start, dec = ".",
                  stringsAsFactors = FALSE, na.strings = "?")
  colnames(df) <- cn
  
  df$Date <- as.Date(df$Date, "%d/%m/%Y")
  df
}

