#Automatic REM detector
###v0.1
This repository contains the MATLAB code for the Automatic REM Detector (For LOC and ROC) developed by Yetton et al.
DOI: 10.1016/j.jneumeth.2015.11.015
 
It is suggested to read the publication before beginning, specifically sections 2.1 and 4.0 to understand data setup and limitations before using these algorithms. 
Please use the GitHub page for all feature suggestions, comments and bug reporting. This is pre-release code and to be used at your own risk. It�s a good idea to validate this software on your own data before using it blindly. See the validation section below.
 
## Contents
* Code to run algorithms
* Code to generate REM statistics (Coming soon!)
 
#### Algorithms:
Yetton Et Al:  
* Yetton Et Al's Machine Learning algorithm (```YettonEtAl_MachineLearning```)
* Yetton Et Al's Best Single Feature (```YettonEtAl_SingleFeature```)
* Yetton Et Al's Threshold algorithm (```YettonEtAl_Threshhold```)
 
The following methods from previous liturature were implmented:  
* Minard Et Al (```MinardEtAl```)
* Agarwal Et Al (```AgarwalEtAl```)
* Hatzilabrou Et Al (```HatzilabrouEtAl```)
* Smith Et Al (```SmithEtAl```)
* Doman Et Al (```DomanEtAl```)
 
##User Guide
###Running the Detector
 
1. Download this file through Git or use the download as zip button (on GitHub), or OSF files panel (on OSF)
2. Open MATLAB and navigate to the unzipped detector folder
3. Your EEG data must be in edf format, and sampled at 256Hz, with channel 1 and 2 as LOC and ROC respectively (referenced to contralateral mastoids). Plans are to generalize the detector to other sample rates, but for now, please down-sample if need be.
4. To run all detectors (except the McPartland detector - performance is too low) enter 'runDetector' in the command line.
If you would like to run each detector individually, then enter a cell array of detector names (see detector names above) e.g. to run Yetton et al's Machine Learning and Thresholding algorithms:
```matlab 
runDetector({'YettonEtAl_MachineLearning','YettonEtAl_Thresholding'})
```
 
5. A dialog will appear, please select all your EEG files (in .edf) format, they will then be converted to .mat files for further processing. Note that if there is a .mat file of the same name as the .edf file in the chosen directory, then that .mat file will be used instead and no conversion will take place.
6. A second dialog will appear and ask for a .csv file containing the time (in samples) of the start and end of REM sleep (See REM start and end file below for format). If no file is selected, all the record will be assumed to be REM sleep.
7. Sit back and relax, and the detector starts detecting REM's. Depending on your computer spec's this may take a long time. It�s best to leave the detectors to run overnight. See the output file below for information on the format of data returned.   
 
###REM start and end file
Usually the edf file will contain other stage data. This detector was not developed to handle other stages, and will not work on epochs containing NREM sleep. You may defined the 'periods' of REM sleep in each EDF file by adding the start and end (in samples) of each REM detector period. There may be multiple periods in a single .edf record. These will be output separately. Notice in the example .csv file below that the first file "FileOne.edf" has 3 REM periods, and the second file "FileTwo.edf" has only one
 
| Name                      | REMperiod | StartREM | EndREM  |
|---------------------------|-----------|----------|---------|
| FileOne.edf               | 1         | 1551360  | 1566719 |
| FileOne.edf               | 2         | 1582080  | 1620479 |
| FileOne.edf               | 3         | 1635840  | 1758719 |
| FileTwo.edf               | 1         | 1497120  | 1804799 |
 
Note:
-The Name column MUST matche the name of the EDF files
-If you are using a Mac, the file format must be saved as a 'windows csv'
See the example rem start and end file (remStartAndEndExample.csv) for more information on how to format the .csv file
 
Two helper scripts can format these .csv files for you from scoring program output files:
-REMChunkFinder_Grass.m if parsing data from Grass Excel export files; 
-REMChunkFinder_Hume.m if parsing data from Hume Matlab files.
If you would like to make your own parsing functions, these files are a good place to start.
 
###Output Data
Output (in the same file as the EDF's) will be a simple .csv file containing each detectors measurement of REM density as well as a .mat file
The .mat file has remDensity measurements, labels (NoREM, 1REM, 2REM for each 1 second window) and REM locations in samples (when applicable).
 
###Training the detector
If the you believe your REM are significantly different from the REMs in Yetton Et Al then retraining of algorithms is desirable. It is advised to have at least as much data as Yetton Et Al used for training. See Yetton et al for details.
Based on how popular this algorithm is, we will provide details of how to retrain the algorithm. Please email bdyetton(AT)gmail(DOT)com for more information.
 
###Validation
Some of the algorithms here may produce better or worse results on your dataset. Your definition of a REM may be different from Yetton Et Al's, or your PSG channel placement may be slightly different. You can test the validity of this algorithm by marking REM's in your data and then comparing to detected REM's OR by calculating various descriptive statistics of REM and comparing to those in Yetton Et Al.
Code to compare can be found in calREMValidity.m (which gives reliability statistics) and calREMStats.m (which plots distributions of REM statistics for comparison to Yetton Et Al). #TODO
