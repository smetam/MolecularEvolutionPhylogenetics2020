library(ape)
library(httr)
library(ggtree)
library(treeio)

# Load and read tree
r <- GET("https://www.jasondavies.com/tree-of-life/life.txt")
tree1 <- read.tree(text = content(r))


# Draw the phylogram and save as Png
png("images/phylo_tree1_default.png")
plot(tree1, type = "phylogram")

# Draw the radial tree and save as pdf
pdf("images/phylo_tree1_default.pdf")
plot(tree1, type = "radial")

# Draw second tree
tree2 <- read.tree(text = "(((A, B), (C, D)), E);")
pdf("images/phylo_tree2.pdf")
plot(tree2, type = "phylogram")

# Draw second tree as unrooted
png("images/phylo_tree2.png", units = "px")
plot(tree2, type = "unrooted")

# Draw the phylogram and save as Png in readable format
png("images/phylo_tree1.png", width = 2160, height = 3840, units = "px")
plot(tree1, type = "phylogram", cex=1)

# Draw the radial tree and save as pdf in readable format
pdf("images/phylo_tree1.pdf")
plot(tree1, type = "radial", cex=0.3)

# Use ggtree to draw the tree
t <- ggtree(tree1) + theme_tree2() + geom_tiplab()
png("images/ggplot_tree1.png", width = 1800, height = 3840, units = "px")
plot(t, type = "phylogram")

