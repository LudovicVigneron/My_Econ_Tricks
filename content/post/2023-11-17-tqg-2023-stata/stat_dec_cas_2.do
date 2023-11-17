/// Tableau statistiques descriptives

clear all

cd "\Users\L.Vigneron\Documents\Cours données\TD_TQG\programmes stata"

/// import des données

use "data\caschool.dta"

/// mise en forme des données

label variable str "Student to teacher ratio"
label variable testscr "test score"
label variable el_pct "% non anglophone"

// créer 20 et + / moins de 20

generate byte taille_bin_20 = str < 20, after(str)
label variable taille_bin_20 "var binaire 1 si moins de 20 enfants/classe 0 dans le cas contraire"
label define vingt_e_tplus_moins20 1 "moins de 20 par classe" 0 "20 ou plus enfants par classe"
label values taille_bin_20 vingt_e_tplus_moins20


/// traitement des données

// statistiques descriptives

table (var) () (), nototals statistic(mean  testscr str) ///
                            statistic(sd  testscr str) ///
                            statistic(skewness  testscr str) ///
                            statistic(kurtosis testscr str) ///
                            statistic(p10 testscr str) ///
                            statistic(p25 testscr str) ///
                            statistic(p40 testscr str) ///
                            statistic(p50 testscr str) ///
                            statistic(p60 testscr str) ///
                            statistic(p75 testscr str) ///
                            statistic(p90 testscr str) ///
							nformat(%9,5g)
collect title "Statistiques descriptives"
collect export "tableaux\table_1_caschool.docx", as(docx) replace

// testes différence de moyenne

ttest testscr, by(taille_bin_20) unequal welch

// regressions 

twoway (scatter testscr str) (lfit testscr str)

regress testscr str
estat hettest

regress testscr str,vce(robust)
estimates store reg1
predict reg1
generate res_reg1 = testscr-reg1

etable, column(dvlabel) keep(_cons str) ///
        cstat(_r_b, nformat(%6.0g)) ///
        cstat(_r_se, nformat(%9,3g)) ///
		mstat(N, nformat(%9.0g)) ///
		mstat(r2, nformat(%9.0g)) ///
		mstat(F, nformat(%9.0g)) ///
		title(Table 2 : régression) ///
		export("reg_1", as(docx) replace)

// reg mult

regress testscr str  el_pct,vce(robust)
estimates store reg2

etable, estimates(reg1 reg2) keep(_cons str el_pct) ///
        column(estimates)  ///
		stars( 0.1 `"*"' 0.05 `"**"' 0.01 `"***"' ) ///
        mstat(F, nformat(%9.5g)) ///
		mstat(r2, nformat(%9.5g))  ///
		mstat(N, nformat(%9.5g)) ///	
		title(Table 3: régression) 
		
//

regress str el_pct,vce(robust)
estimates store rega
predict rega
generate res_rega = str-rega


regress testscr el_pct,vce(robust)
estimates store regb
predict regb
generate res_regb = testscr-regb

regress res_regb res_rega, noconstant









