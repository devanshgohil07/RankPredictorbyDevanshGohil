Percentile <- function(x)
{
  Percentile <- ((155 - x)/155)*100
  Percentile <- round(Percentile, 3)
  cat(
    "\033[32mThis was created by Devansh Gohil, IPM 24 Batch!!\033[0m\n",
    "\033[32mIf you need any help please email me at i24devanshg@iimidr.ac.in\033[0m\n",
    "Percentile on a batch of 155 = ", Percentile, "%\n",
      sep = "")
}


