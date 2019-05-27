library(readxl)
sheet1 <- excel_sheets("Sample-Sales-Data.xlsx")

print(sheet1)

df <- read_excel('Sample-Sales-Data.xlsx', sheet1)

print(head(df))

print(sum(df$Value))

print(summary(df))

entire.workbook <- lapply(excel_sheets("Sample-Sales-Data.xlsx"), read_excel,
                          path="Sample-Sales-Data.xlsx")

print(entire.workbook)



