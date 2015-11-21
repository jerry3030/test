## Data types
### Atomic vectors
x <- c(2.1, 4.2, 3.3, 5.4)
x[c(3,1)]
x[order(x)]
x[c(1,1)]
x[c(2.1, 2.9)]
x[-c(3,1)]
x[c(-1,2)]
x[c(TRUE, TRUE, FALSE, FALSE)]
x[x>3]
x[c(TRUE, FALSE)]
x[c(TRUE, FALSE, TRUE, FALSE)]
x[]
x[0]

a <- matrix(1:9, nrow = 3)
a
head(iris)
tail(iris)
colnames(a) <- c("A", "B", "C")
a
a[1:2,]
a[c(T,F,T), c("B", "A")]
a[0, -2]

# multi matrix
vals <- outer(1:5, 1:5, FUN = "paste", sep = ",")
vals
vals[c(4,15)]

select <- matrix(ncol = 2, byrow = TRUE, c(
  1,1,
  3,1,
  2,4
))
select
vals[select]
df <- data.frame(x = 1.3, y=3:1, z=letters[1:3])
df
df[2,3]
df[df$x ==2,]
df1 <- data.frame(x=1:10, y = 20:11, z = letters[1:10])
df1
df[df$y > 15,]
df[, c("y", "z")]
str(df[, c("y", "z")])
df[c("y", "z")]
str(df[c("y", "z")])

str(df["x"])
str(df[,"x"])

### Exercises
head(mtcars)
mtcars[mtcars$cyl = 4,]  # Error
mtcars[mtcars$cyl == 4,]

mtcars[c(-1:4),] # Error
mtcars[c(1:4),]

mtcars[mtcars$cyl <=5] # Error
mtcars[mtcars$cyl <=5]

mtcars[mtcars$cyl ==4 |6,] # 4,6, colums 
mtcars[mtcars$cyl ==4 | mtcars$cyl==6,]

x <- outer(1:5, 1:5, FUN = "*")
x [upper.tri(x)]
x [lower.tri(x)]
x[diag(x)]
diag(x)

# Ordering
x <- c("b", "c", "a")
x
order(x)
x <- c(1,5,4,3,2)
order(x)
x[order(x)]
x[c(1,5,3,2,4)]
sort(x)
sort(x, dec = T)

### Random samples / bootstrop
df <- data.frame(x=rep(1:3, each=2), y =6:1, z = letters[1:6])
df
df[sample(nrow(df)),]
set.seed(10)
df[sample(nrow(df)),]
df[sample(nrow(df),3),]
df[sample(nrow(df),6,rep =T),]

df2 <- df[sample(nrow(df)), 3:1]
df2
df2[order(df2$x),]
df2[, order(names(df2))]

# Applications
### Lookup tables
x <- c("m", "f", "u", "f", "f", "m", "m")
lookup <- c(m="Male", f="Female", u=NA)
lookup[x]
unname(lookup[x])

# Matching and merging by hand
grades <- c(1,2,2,3,1)
info <- data.frame(
  grade = 3:1,
  desc = c("Excellent", "Good", "Poor"),
  fail = c(F,F,T)
)
info
id <- match(grades, info$grade)
id
rownames(info) <- info$grade
info[as.character(grades),]

### Selecting rows based on a condition
mtcars[mtcars$gear ==5,]
mtcars[mtcars$gear ==5 & mtcars$cyl ==4,]
mtcars[mtcars$gear ==5 | mtcars$cyl ==4,]
subset(mtcars, gear ==5)
subset(mtcars, gear ==5 & cyl ==4)
subset(mtcars, gear ==5 | cyl ==4)

# Removing columns from data frames
df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df$z <- NULL

ls() # existing memory list
rm(a)
ls()

#paste
paste("Hi","everyone", sep=" ")

x <- c("F","M","M","F")
x
x <- as.factor(x)
x
x <- as.numeric(x)
x

