---
  title: "Scanned File Conversion"
author: "Shahan"
date: "2025-07-25"
output: pdf_document
---
  
  
  ```{r}
#install.packages("pdftools")
#install.packages("magick")
#install.packages("exifr")
#install.packages("readr")
#install.packages("stringr")

library(stringr)
library(pdftools)
library(tesseract)
library(magick)
library(jsonlite)
```
#Set Working Directory
```{r}
#Set Working Directory
setwd("S:/get_OCR_AWS")
getwd()
```



```{r}
input_dir <- "input"
output_dir <- "converted"
output_jsonl <- file.path(output_dir, "ocr_all_data.jsonl")

# Create output folder if it doesn't exist
if (!dir.exists(output_dir)) dir.create(output_dir)

# Function to detect file type
detect_file_type <- function(file_path) {
  con <- file(file_path, "rb")
  header <- readBin(con, what = "raw", n = 10)
  close(con)
  hex <- paste(toupper(as.character(header)), collapse = " ")
  
  if (grepl("^49 49 2A 00", hex) || grepl("^4D 4D 00 2A", hex)) return("tiff")
  return("unknown")
}

# Collect JSONL lines
jsonl_lines <- c()

file_list <- list.files(input_dir)
for (file_name in file_list) {
  file_path <- file.path(input_dir, file_name)
  file_type <- detect_file_type(file_path)
  
  if (file_type == "tiff") {
    message("OCR'ing: ", file_name)
    img <- image_read(file_path)
    ocr_text <- ocr(img)
    
    json_line <- toJSON(list(
      file_name = file_name,
      ocr_text = ocr_text,
      label = NA  # Replace later if you have known labels
    ), auto_unbox = TRUE)
    
    jsonl_lines <- c(jsonl_lines, json_line)
  }
}

# Save to JSONL in the output folder
writeLines(jsonl_lines, output_jsonl)
cat("✅ All OCR data written to:", output_jsonl, "\n")

```





