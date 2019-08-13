library(readxl)
library(ggplot2)
cbPalette = c("#0072B2", "#56B4E9", "#E69F00", "#009E73", "#CC79A7", "#D55E00") #"#F0E442"

setwd("/Users/mckena01/Dropbox/bpf/bp_papers/perfusion/figs/")

approach = read_excel("approach_data.xlsx")

approach = approach[!approach$`Number of perfusion-fixed brains` == "NR", ]
approach = approach[!approach$Approach == "Unclear", ]
approach$Number_brains = as.numeric(approach$`Number of perfusion-fixed brains`)

approach_plot = ggplot(approach, aes(x=Year, y= Number_brains, size = sqrt(Number_brains), color = Approach)) + geom_point(alpha = 0.66) + scale_size_continuous(name = "Number of brains", range=c(2.5,25), breaks = sqrt(c(1, 5, 10, 50, 125)), labels =  c(1, 5, 10, 50, 125), limits = c(1, 125))  + scale_colour_manual(values = cbPalette) + ylab("Number of perfusion fixed brains") + theme_bw()  + xlab("Year published") + scale_x_continuous(breaks  = scales::pretty_breaks(n = 6))
