/// tableau de statistiques descriptives

clear all
cd "C:\Users\L.Vigneron\Documents\Cours données\TD_TQG\programmes stata"

/// import des données

use "data\portf_size.dta"

/// mise en forme

label variable Lo10 "Small"
label variable Hi10 "big"

/// traitement des données

/// tab des simple + skweness et Kurtosis

tabstat Lo10 Hi10, statistics( mean sd skewness kurtosis p10 p25 p50 p75 p90 ) columns(statistics)


