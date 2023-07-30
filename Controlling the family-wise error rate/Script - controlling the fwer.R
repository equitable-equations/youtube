# Correcting for multiple testing
?p.adjust

p <- c(0.005, 0.011, 0.025, 0.035, .045)

p.adjust(p, method = "bonferroni")
p.adjust(p, method = "holm")

