CGPA_10 <- function(x)

{
  CGPA <- x
  if(3.5 <= CGPA & CGPA <= 4.333)
    CGPA10 <- 91 + (CGPA - 3.5)*10.8434
  else if(2.3 <= CGPA & CGPA < 3.5)
    CGPA10 <- 60 + (CGPA - 2.3)*25.8334
  else if(2 <= CGPA & CGPA < 2.3)
    CGPA10 <- 50 + (CGPA - 2)*33.3334
  else if(1<= CGPA & CGPA < 2)
    CGPA10 <- 20 + (CGPA - 1)*30
  else if(0<= CGPA & CGPA < 1)
    CGPA10 <- 0
  else
  {
    cat(
      "\033[32mThis was created by Devansh Gohil, IPM 24 Batch!!\033[0m\n",
      "\033[32mIf you need any help please email me at i24devanshg@iimidr.ac.in\033[0m\n",
      sep = "")
    stop("Please enter a valid CGPA!")
  }
  
  CGPA10 <- CGPA10/10
  CGPA10 <- round(CGPA10, 3)
  cat(
    "\033[32mThis was created by Devansh Gohil, IPM 24 Batch!!\033[0m\n",
    "\033[32mIf you need any help please email me at i24devanshg@iimidr.ac.in\033[0m\n",
    "Your CGPA on a scale of 10 = ", CGPA10, "\n",
    sep = "")
}