plot_random_penguins <- function(n = 30, label_col = "blue") {
  data <- na.omit(penguins)
  numeric_vars <- names(data)[sapply(data, is.numeric)]
  if (length(numeric_vars) < 2) stop("Need at least two numeric columns.")
  vars <- sample(numeric_vars, 2)
  idx <- sample(seq_len(nrow(data)), size = min(n, nrow(data)))
  df <- data[idx, vars]
  plot(
    df[[1]], df[[2]], 
    xlab = vars[1], ylab = vars[2], 
    main = paste("Scatter plot of", vars[1], "vs", vars[2])
  )
  text(
    df[[1]], df[[2]], 
    labels = row.names(df), 
    pos = 3, col = label_col, cex = 0.7
  )
}
