# Rank Predictor(IPM, IIM Indore) by Devansh Gohil

**RankPredictorbyDevanshGohil** is an R package developed by Devansh Gohil for predicting academic ranks based on CGPA and term/year. The tool provides insights into rank estimation, percentile, CGPA conversion, and more, making it a comprehensive tool for academic performance analysis. This tool is built specifically for IPM students of IIM Indore based on the data available on IPM Intranet as of 21st December, 2024.

---

## Installation

To install the package from GitHub, use the `remotes` package:

```R
# Install the remotes package if you don't have it
install.packages("remotes")

# Install RankPredictor from GitHub
remotes::install_github("devanshgohil07/RankPredictorbyDevanshGohil")
```

---

## Usage

### Predicting Ranks

The primary function of the package is `Predict_Rank`, which calculates academic ranks based on input CGPA and the specified term/year.

#### Syntax:
```R
Predict_Rank(CGPA, "Term/Year")
```

#### Parameters:
- **`x`**: A numeric value representing CGPA (e.g., `3.1`).
- **`y`**: A string specifying the term or year (e.g., `"Year 1"`, `"Term 2"`, or `"Aggregate"`). Defaults to `"Aggregate"`.

#### Example:
```R
library(RankPredictor)

# Predict rank for CGPA 3.1 in Year 1
Predict_Rank(3.1, "Year 1")
```

#### Output:
The function outputs the following details:
- Predicted Rank (by 2 Methods)
- Minimum and Maximum Rank
- CGPA on a 10-point scale
- Percentile within a batch of 155 students

---

## Features

- **Rank Prediction**: Provides ranks using two methods.
- **Percentile Calculation**: Displays percentile in the batch.
- **CGPA Conversion**: Converts CGPA to a 10-point scale.
- **Customizable**: Supports multiple terms and aggregate ranks.

---

## Error Handling

- **Invalid CGPA**: Ensure the input CGPA is a numeric value between `0` and `4.333`.
- **Invalid Term/Year**: Use valid inputs for terms or years, such as `"Term 1"`, `"Year 1"`, or `"Aggregate"`. Invalid inputs will trigger an error message.
---

## Contact

This package was developed by **Devansh Gohil, IPM '24 Batch**.  
For assistance, email: [i24devanshg@iimidr.ac.in](mailto:i24devanshg@iimidr.ac.in).
Also, check out my LinkedIn: https://www.linkedin.com/in/devansh-gohil-2369b4314/.
