#' This was created by Devansh Gohil, IPM '24 Batch
#' If you need help, please email me on i24devanshg@iimidr.ac.in

#' Predict Academic Ranks Based on CGPA and Term
#' @param x A numeric value representing CGPA (e.g., 3.1).
#' @param y A string specifying the term/year (e.g., "Year 1").
#' @return A list containing predicted ranks, percentile, CGPA on a scale of 10, and other metrics.
#' @examples
#' Predict_Rank(3.1, "Year 1")

Predict_Rank <- function(x, y = "Aggregate") {

  predict_rank <- c(x, y)

  x <- predict_rank[1]
  x <- as.numeric(x)

  if (0 < x & x < 4.334) {
    CGPA <- x
    y <- ifelse(!exists("y"), "Aggregate", y)

    if (length(predict_rank) >= 2 && !is.null(predict_rank[2])) {
      y <- predict_rank[2]
    }

    if (y %in% c("Term 1", "Term 2", "Term 3", "Term 4", "Term 5",
                 "Term 6", "Term 7", "Term 8", "Term 9",
                 "Year 1", "Year 2", "Year 3", "Aggregate")) {

      Parent_dir <- getwd()

      # Load CSV files
      IPM19_Y1 <- read.csv(system.file("extdata", "IPM19_Y1.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM19_Y1 <- c(IPM19_Y1, rep(0, 155 - length(IPM19_Y1)))

      IPM19_Y2 <- read.csv(system.file("extdata", "IPM19_Y2.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM19_Y2 <- c(IPM19_Y2, rep(0, 155 - length(IPM19_Y2)))

      IPM19_Y3 <- read.csv(system.file("extdata", "IPM19_Y3.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM19_Y3 <- c(IPM19_Y3, rep(0, 155 - length(IPM19_Y3)))

      IPM19_AG <- read.csv(system.file("extdata", "IPM19_AG.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM19_AG <- c(IPM19_AG, rep(0, 155 - length(IPM19_AG)))

      IPM20_Y1 <- read.csv(system.file("extdata", "IPM20_Y1.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM20_Y1 <- c(IPM20_Y1, rep(0, 155 - length(IPM20_Y1)))

      IPM20_Y2 <- read.csv(system.file("extdata", "IPM20_Y2.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM20_Y2 <- c(IPM20_Y2, rep(0, 155 - length(IPM20_Y2)))

      IPM20_Y3 <- read.csv(system.file("extdata", "IPM20_Y3.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM20_Y3 <- c(IPM20_Y3, rep(0, 155 - length(IPM20_Y3)))

      IPM20_AG <- read.csv(system.file("extdata", "IPM20_AG.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM20_AG <- c(IPM20_AG, rep(0, 155 - length(IPM20_AG)))

      IPM21_T7 <- read.csv(system.file("extdata", "IPM21_T7.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM21_T7 <- c(IPM21_T7, rep(0, 155 - length(IPM21_T7)))

      IPM21_T8 <- read.csv(system.file("extdata", "IPM21_T8.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM21_T8 <- c(IPM21_T8, rep(0, 155 - length(IPM21_T8)))

      IPM21_T9 <- read.csv(system.file("extdata", "IPM21_T9.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM21_T9 <- c(IPM21_T9, rep(0, 155 - length(IPM21_T9)))

      IPM21_Y3 <- read.csv(system.file("extdata", "IPM21_Y3.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM21_Y3 <- c(IPM21_Y3, rep(0, 155 - length(IPM21_Y3)))

      IPM22_T1 <- read.csv(system.file("extdata", "IPM22_T1.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM22_T1 <- c(IPM22_T1, rep(0, 155 - length(IPM22_T1)))

      IPM22_T2 <- read.csv(system.file("extdata", "IPM22_T2.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM22_T2 <- c(IPM22_T2, rep(0, 155 - length(IPM22_T2)))

      IPM22_T3 <- read.csv(system.file("extdata", "IPM22_T3.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM22_T3 <- c(IPM22_T3, rep(0, 155 - length(IPM22_T3)))

      IPM22_T4 <- read.csv(system.file("extdata", "IPM22_T4.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM22_T4 <- c(IPM22_T4, rep(0, 155 - length(IPM22_T4)))

      IPM22_T5 <- read.csv(system.file("extdata", "IPM22_T5.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM22_T5 <- c(IPM22_T5, rep(0, 155 - length(IPM22_T5)))

      IPM22_T6 <- read.csv(system.file("extdata", "IPM22_T6.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM22_T6 <- c(IPM22_T6, rep(0, 155 - length(IPM22_T6)))

      IPM22_T7 <- read.csv(system.file("extdata", "IPM22_T7.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM22_T7 <- c(IPM22_T7, rep(0, 155 - length(IPM22_T7)))

      IPM22_Y1 <- read.csv(system.file("extdata", "IPM22_Y1.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM22_Y1 <- c(IPM22_Y1, rep(0, 155 - length(IPM22_Y1)))

      IPM22_Y2 <- read.csv(system.file("extdata", "IPM22_Y2.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM22_Y2 <- c(IPM22_Y2, rep(0, 155 - length(IPM22_Y2)));

      IPM23_T1 <- read.csv(system.file("extdata", "IPM23_T1.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM23_T1 <- c(IPM23_T1, rep(0, 155 - length(IPM23_T1)));

      IPM23_T2 <- read.csv(system.file("extdata", "IPM23_T2.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM23_T2 <- c(IPM23_T2, rep(0, 155 - length(IPM23_T2)));

      IPM23_T3 <- read.csv(system.file("extdata", "IPM23_T3.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM23_T3 <- c(IPM23_T3, rep(0, 155 - length(IPM23_T3)));

      IPM23_T4 <- read.csv(system.file("extdata", "IPM23_T4.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM23_T4 <- c(IPM23_T4, rep(0, 155 - length(IPM23_T4)));

      IPM23_Y1 <- read.csv(system.file("extdata", "IPM23_Y1.csv", package = "RankPredictorbyDevanshGohil"))[,1]
      IPM23_Y1 <- c(IPM23_Y1, rep(0, 155 - length(IPM23_Y1)));
    }
    Rank<-rep(0, 155)
    Closest_Rank<-rep(0, 155)

    Closest_Rank.1<-rep(0, 155)
    Closest_Rank.2<-rep(0, 155)
    Closest_Rank.3<-rep(0, 155)
    Closest_Rank.4<-rep(0, 155)
    Closest_Rank.5<-rep(0, 155)
    Closest_Rank.6<-rep(0, 155)

    Range <- rep(0, 6)

    for(i in 1:155) {
      if (CGPA > 0 & CGPA < 4.334) {
        if(y == "Term 1") {
          Rank[i] <- mean(c(IPM19_Y1[i], IPM20_Y1[i], IPM22_T1[i], IPM23_T1[i])[c(IPM19_Y1[i], IPM20_Y1[i], IPM22_T1[i], IPM23_T1[i]) != 0])
          Closest_Rank[i] <- ((CGPA - Rank[i])^2)
          Closest_Rank.1[i] <- ((CGPA - IPM19_Y1[i])^2)
          Closest_Rank.2[i] <- ((CGPA - IPM20_Y1[i])^2)
          Closest_Rank.3[i] <- ((CGPA - IPM22_T1[i])^2)
          Closest_Rank.4[i] <- ((CGPA - IPM23_T1[i])^2)
        }
        else if(y == "Term 2") {
          Rank[i] <- mean(c(IPM19_Y1[i], IPM20_Y1[i], IPM22_T2[i], IPM23_T2[i])[c(IPM19_Y1[i], IPM20_Y1[i], IPM22_T2[i], IPM23_T2[i]) != 0])
          Closest_Rank[i] <- ((CGPA - Rank[i])^2)
          Closest_Rank.1[i] <- ((CGPA - IPM19_Y1[i])^2)
          Closest_Rank.2[i] <- ((CGPA - IPM20_Y1[i])^2)
          Closest_Rank.3[i] <- ((CGPA - IPM22_T2[i])^2)
          Closest_Rank.4[i] <- ((CGPA - IPM23_T2[i])^2)
        }
        else if(y == "Term 3") {
          Rank[i] <- mean(c(IPM19_Y1[i], IPM20_Y1[i], IPM22_T3[i], IPM23_T3[i])[c(IPM19_Y1[i], IPM20_Y1[i], IPM22_T3[i], IPM23_T3[i]) != 0])
          Closest_Rank[i] <- ((CGPA - Rank[i])^2)
          Closest_Rank.1[i] <- ((CGPA - IPM19_Y1[i])^2)
          Closest_Rank.2[i] <- ((CGPA - IPM20_Y1[i])^2)
          Closest_Rank.3[i] <- ((CGPA - IPM22_T3[i])^2)
          Closest_Rank.4[i] <- ((CGPA - IPM23_T3[i])^2)
        }
        else if(y == "Term 4") {
          Rank[i] <- mean(c(IPM19_Y2[i], IPM20_Y2[i], IPM22_T4[i], IPM23_T4[i])[c(IPM19_Y2[i], IPM20_Y2[i], IPM22_T4[i], IPM23_T4[i]) != 0])
          Closest_Rank[i] <- ((CGPA - Rank[i])^2)
          Closest_Rank.1[i] <- ((CGPA - IPM19_Y2[i])^2)
          Closest_Rank.2[i] <- ((CGPA - IPM20_Y2[i])^2)
          Closest_Rank.3[i] <- ((CGPA - IPM22_T4[i])^2)
          Closest_Rank.4[i] <- ((CGPA - IPM23_T4[i])^2)
        }
        else if(y == "Term 5") {
          Rank[i] <- mean(c(IPM19_Y2[i], IPM20_Y2[i], IPM22_T5[i])[c(IPM19_Y2[i], IPM20_Y2[i], IPM22_T5[i]) != 0])
          Closest_Rank[i] <- ((CGPA - Rank[i])^2)
          Closest_Rank.1[i] <- ((CGPA - IPM19_Y2[i])^2)
          Closest_Rank.2[i] <- ((CGPA - IPM20_Y2[i])^2)
          Closest_Rank.3[i] <- ((CGPA - IPM22_T5[i])^2)
        }
        else if(y == "Term 6") {
          Rank[i] <- mean(c(IPM19_Y2[i], IPM20_Y2[i], IPM22_T6[i])[c(IPM19_Y2[i], IPM20_Y2[i], IPM22_T6[i]) != 0])
          Closest_Rank[i] <- ((CGPA - Rank[i])^2)
          Closest_Rank.1[i] <- ((CGPA - IPM19_Y2[i])^2)
          Closest_Rank.2[i] <- ((CGPA - IPM20_Y2[i])^2)
          Closest_Rank.3[i] <- ((CGPA - IPM22_T6[i])^2)
        }
        else if(y == "Term 7") {
          Rank[i] <- mean(c(IPM19_Y3[i], IPM20_Y3[i], IPM21_T7[i], IPM22_T7[i])[c(IPM19_Y3[i], IPM20_Y3[i], IPM21_T7[i], IPM22_T7[i]) != 0])
          Closest_Rank[i] <- ((CGPA - Rank[i])^2)
          Closest_Rank.1[i] <- ((CGPA - IPM19_Y3[i])^2)
          Closest_Rank.2[i] <- ((CGPA - IPM20_Y3[i])^2)
          Closest_Rank.3[i] <- ((CGPA - IPM21_T7[i])^2)
          Closest_Rank.4[i] <- ((CGPA - IPM22_T7[i])^2)
        }
        else if(y == "Term 8") {
          Rank[i] <- mean(c(IPM19_Y3[i], IPM20_Y3[i], IPM21_T8[i])[c(IPM19_Y3[i], IPM20_Y3[i], IPM21_T8[i]) != 0])
          Closest_Rank[i] <- ((CGPA - Rank[i])^2)
          Closest_Rank.1[i] <- ((CGPA - IPM19_Y3[i])^2)
          Closest_Rank.2[i] <- ((CGPA - IPM20_Y3[i])^2)
          Closest_Rank.3[i] <- ((CGPA - IPM21_T8[i])^2)
        }
        else if(y == "Term 9") {
          Rank[i] <- mean(c(IPM19_Y3[i], IPM20_Y3[i], IPM21_T9[i])[c(IPM19_Y3[i], IPM20_Y3[i], IPM21_T9[i]) != 0])
          Closest_Rank[i] <- ((CGPA - Rank[i])^2)
          Closest_Rank.1[i] <- ((CGPA - IPM19_Y3[i])^2)
          Closest_Rank.2[i] <- ((CGPA - IPM20_Y3[i])^2)
          Closest_Rank.3[i] <- ((CGPA - IPM21_T9[i])^2)
        }
        else if(y == "Year 1") {
          Rank[i] <- mean(c(IPM19_Y1[i], IPM20_Y1[i], IPM22_Y1[i], IPM23_Y1[i])[c(IPM19_Y1[i], IPM20_Y1[i], IPM22_Y1[i], IPM23_Y1[i]) != 0])
          Closest_Rank[i] <- ((CGPA - Rank[i])^2)
          Closest_Rank.1[i] <- ((CGPA - IPM19_Y1[i])^2)
          Closest_Rank.2[i] <- ((CGPA - IPM20_Y1[i])^2)
          Closest_Rank.3[i] <- ((CGPA - IPM22_Y1[i])^2)
          Closest_Rank.4[i] <- ((CGPA - IPM23_Y1[i])^2)
        }
        else if(y == "Year 2") {
          Rank[i] <- mean(c(IPM19_Y2[i], IPM20_Y2[i], IPM22_Y2[i])[c(IPM19_Y2[i], IPM20_Y2[i], IPM22_Y2[i]) != 0])
          Closest_Rank[i] <- ((CGPA - Rank[i])^2)
          Closest_Rank.1[i] <- ((CGPA - IPM19_Y2[i])^2)
          Closest_Rank.2[i] <- ((CGPA - IPM20_Y2[i])^2)
          Closest_Rank.3[i] <- ((CGPA - IPM22_Y2[i])^2)
        }
        else if(y == "Year 3") {
          Rank[i] <- mean(c(IPM19_Y3[i], IPM20_Y3[i], IPM21_Y3[i])[c(IPM19_Y3[i], IPM20_Y3[i], IPM21_Y3[i]) != 0])
          Closest_Rank[i] <- ((CGPA - Rank[i])^2)
          Closest_Rank.1[i] <- ((CGPA - IPM19_Y3[i])^2)
          Closest_Rank.2[i] <- ((CGPA - IPM20_Y3[i])^2)
          Closest_Rank.3[i] <- ((CGPA - IPM21_Y3[i])^2)
        }
        else if(y == "Aggregate") {
          Rank[i] <- mean(c(IPM19_AG[i], IPM20_AG[i], IPM21_Y3[i], IPM22_Y1[i], IPM22_Y2[i], IPM23_Y1[i])[c(IPM19_AG[i], IPM20_AG[i], IPM21_Y3[i], IPM22_Y1[i], IPM22_Y2[i], IPM23_Y1[i]) != 0])
          Closest_Rank[i] <- ((CGPA - Rank[i])^2)
          Closest_Rank.1[i] <- ((CGPA - IPM19_AG[i])^2)
          Closest_Rank.2[i] <- ((CGPA - IPM20_AG[i])^2)
          Closest_Rank.3[i] <- ((CGPA - IPM21_Y3[i])^2)
          Closest_Rank.4[i] <- ((CGPA - IPM22_Y1[i])^2)
          Closest_Rank.5[i] <- ((CGPA - IPM22_Y2[i])^2)
          Closest_Rank.6[i] <- ((CGPA - IPM23_Y1[i])^2)
        }
        else {
          cat("\033[32mThis was created by Devansh Gohil, IPM 24 Batch!!\033[0m\n")
          cat("\033[32mIf you need any help please email me at i24devanshg@iimidr.ac.in\033[0m\n")
          stop("Please enter a valid Term or Year!")
        }
      }
    }

    Closest_Rank <- Closest_Rank[!is.na(Closest_Rank)]
    Closest_Rank <- Closest_Rank[1:(length(Closest_Rank) - sum(rev(Closest_Rank != 0) == 0) + 1)]

    Closest_Rank.1 <- Closest_Rank.1[!is.na(Closest_Rank.1)]
    Closest_Rank.1 <- Closest_Rank.1[1:(length(Closest_Rank.1) - sum(rev(Closest_Rank.1 != 0) == 0) + 1)]

    Closest_Rank.2 <- Closest_Rank.2[!is.na(Closest_Rank.2)]
    Closest_Rank.2 <- Closest_Rank.2[1:(length(Closest_Rank.2) - sum(rev(Closest_Rank.2 != 0) == 0) + 1)]

    Closest_Rank.3 <- Closest_Rank.3[!is.na(Closest_Rank.3)]
    Closest_Rank.3 <- Closest_Rank.3[1:(length(Closest_Rank.3) - sum(rev(Closest_Rank.3 != 0) == 0) + 1)]

    Closest_Rank.4 <- Closest_Rank.4[!is.na(Closest_Rank.4)]
    Closest_Rank.4 <- Closest_Rank.4[1:(length(Closest_Rank.4) - sum(rev(Closest_Rank.4 != 0) == 0) + 1)]

    Closest_Rank.5 <- Closest_Rank.5[!is.na(Closest_Rank.5)]
    Closest_Rank.5 <- Closest_Rank.5[1:(length(Closest_Rank.5) - sum(rev(Closest_Rank.5 != 0) == 0) + 1)]

    Closest_Rank.6 <- Closest_Rank.6[!is.na(Closest_Rank.6)]
    Closest_Rank.6 <- Closest_Rank.6[1:(length(Closest_Rank.6) - sum(rev(Closest_Rank.6 != 0) == 0) + 1)]

    PR1 <- which.min(Closest_Rank)

    {
      if (any(Closest_Rank.1 != 0) ) {
        Range[1] <- which.min(Closest_Rank.1[Closest_Rank.1 != 0])
      } else {
        Range[1] <- 0
      }
    }

    for (i in 2:6) {
      if (any(get(paste0("Closest_Rank.", i)) != 0)) {
        Range[i] <- which.min(get(paste0("Closest_Rank.", i))[get(paste0("Closest_Rank.", i)) != 0])
      } else {
        Range[i] <- 0;
      }
    }

    PR2 <- mean(Range[Range != 0])
    PR2 <- round(PR2, 2)

    {
      if(3.5 <= CGPA & CGPA <= 4.333)
        CGPA.10 <- 91 + (CGPA - 3.5)*10.8434
      else if(2.3 <= CGPA & CGPA < 3.5)
        CGPA.10 <- 60 + (CGPA - 2.3)*25.8334
      else if(2 <= CGPA & CGPA < 2.3)
        CGPA.10 <- 50 + (CGPA - 2)*33.3334
      else if(1<= CGPA & CGPA < 2)
        CGPA.10 <- 20 + (CGPA - 1)*30
      else
        CGPA.10 <- 0
    }

    CGPA.10 <- CGPA.10/10
    CGPA.10 <- round(CGPA.10, 4)

    Percentile <- mean(PR1, PR2)
    Percentile <- ((155 - Percentile)/155)*100
    Percentile <- round(Percentile, 3)

    {
      cat(
        "\033[32mThis was created by Devansh Gohil, IPM 24 Batch!!\033[0m\n",
        "\033[32mIf you need any help please email me at i24devanshg@iimidr.ac.in\033[0m\n",
        "Your Predicted Rank for ", y, "\n",
        "Predicted Rank by method 1 = ", PR1, "\n",
        "Predicted Rank by method 2 = ", PR2, "\n",
        "Minimum Rank = ", min(Range[Range != 0]), " & Maximum Rank = ", max(Range[Range != 0]), "\n",
        "CGPA on a scale of 10 = ", CGPA.10, "\n",
        "Percentile on a batch of 155 = ", Percentile, "%\n",
        sep = "")
    }
  } else {
    cat(
      "\033[32mThis was created by Devansh Gohil, IPM 24 Batch!!\033[0m\n",
      "\033[32mIf you need any help please email me at i24devanshg@iimidr.ac.in\033[0m\n",
      "Please enter a valid CGPA!",
      sep = "")
  }

  rm(list = ls())

}
