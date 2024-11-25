# CodeBook for Human Activity Recognition Dataset

## Data Source
The original data represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Data Collection
- Data was collected from 30 subjects performing six different activities
- Subjects wore a smartphone (Samsung Galaxy S II) on their waist
- 3-axial linear acceleration and 3-axial angular velocity were captured using the phone's embedded accelerometer and gyroscope

## Processing Steps
1. Training and test sets were merged to create one dataset
2. Only measurements on mean and standard deviation were extracted
3. Activity names were used to name the activities in the dataset
4. Variables were labeled with descriptive names
5. Final dataset contains average of each variable for each activity and subject

## Variables in the Tidy Dataset

### Identifiers
- `subject`: Test subject ID (1-30)
- `activity`: Activity being performed
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING

### Measurements
All measurements are floating-point values, normalized and bounded within [-1,1].
The measurements are classified in two domains:

Time-domain signals (prefixed by 'Time'), resulting from the accelerometer and gyroscope raw signals:

- TimeBodyAccelerometer-XYZ
- TimeGravityAccelerometer-XYZ
- TimeBodyAccelerometerJerk-XYZ
- TimeBodyGyroscope-XYZ
- TimeBodyGyroscopeJerk-XYZ
- TimeBodyAccelerometerMagnitude
- TimeGravityAccelerometerMagnitude
- TimeBodyAccelerometerJerkMagnitude
- TimeBodyGyroscopeMagnitude
- TimeBodyGyroscopeJerkMagnitude

Frequency-domain signals (prefixed by 'Frequency'), resulting from applying Fast Fourier Transform (FFT):

- FrequencyBodyAccelerometer-XYZ
- FrequencyBodyAccelerometerJerk-XYZ
- FrequencyBodyGyroscope-XYZ
- FrequencyBodyAccelerometerMagnitude
- FrequencyBodyAccelerometerJerkMagnitude
- FrequencyBodyGyroscopeMagnitude
- FrequencyBodyGyroscopeJerkMagnitude

For each measurement, the following variables are provided:
- mean(): Mean value
- std(): Standard deviation

### Variable Naming Convention
- Prefix 'Time' denotes time-domain signals
- Prefix 'Frequency' denotes frequency-domain signals
- 'Accelerometer' indicates accelerometer measurements
- 'Gyroscope' indicates gyroscope measurements
- 'Body' indicates body acceleration signals
- 'Gravity' indicates gravity acceleration signals
- 'Jerk' indicates derived signals for body linear acceleration and angular velocity
- 'Magnitude' indicates magnitude calculated using the Euclidean norm
- '-XYZ' denotes 3-axial signals in X, Y, and Z directions

## Transformations
1. Training and test datasets were merged
2. Only columns containing mean() or std() were kept
3. Activity IDs were replaced with activity names
4. Variable names were expanded to be more descriptive:
   - t -> Time
   - f -> Frequency
   - Acc -> Accelerometer
   - Gyro -> Gyroscope
   - Mag -> Magnitude
   - BodyBody -> Body
5. Data was grouped by subject and activity, and measurements were averaged

## Units
- Activities are factor variables
- Subject is an integer ranging from 1 to 30
- All measurements are normalized and bounded within [-1,1]
