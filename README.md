# Wearable Fall Detection Device

## Problem Statement
Develop a wearable device that can accurately detect and predict falls in elderly individuals and alert caregivers or family members.

## Key Features
- Real-time fall detection
- Fall prediction based on movement patterns
- Alert system for immediate notification

## Required Core Components

### 1. Microcontroller (ESP32)
- **Functions:**
  - Acts as the brain of the device
  - Processes data from various sensors
  - Runs different algorithms
  - Communicates with external devices
- **Advantages:**
  - High processing power and connectivity options (e.g., Wi-Fi)
  - Suitable for complex calculations and internet connectivity
- **Working in Fall Detection:**
  - **Initialization:** Boots up and initializes the accelerometer and gyroscope.
  - **Data Collection:** Sensors continuously send data to the ESP32.
  - **Analysis:** Processes data using thresholds or machine learning algorithms.
  - **Communication:** Sends alerts via Bluetooth to a smartphone app if a fall is detected.
  - **Power Management:** Enters sleep mode to conserve energy when not processing data.
- **Estimated Price:** 500 RS

### 2. Accelerometer + Gyroscope (MPU6050)
- **Functions:**
  - **Accelerometer:** Measures linear acceleration along x, y, and z axes.
  - **Gyroscope:** Measures the rate of rotation around x, y, and z axes.
- **Normal Movement (e.g., Walking):**
  - **Accelerometer Data:** Small, periodic changes in acceleration.
  - **Gyroscope Data:** Slight rotational changes.
  - **Combined Analysis:** Data within expected ranges for normal movement.
- **Sudden Fall Detection:**
  - **Accelerometer Data:** Sudden spike in acceleration, especially in the z-axis, followed by a drop to near-zero.
  - **Gyroscope Data:** Rapid rotation around one or more axes.
  - **Combined Analysis:** Combination of sudden acceleration and rapid rotation indicates a fall.
- **Example Readings:**
  - **Accelerometer (m/s²):**
    - Walking: x-axis: 0.5 - 1.0, y-axis: 0.5 - 1.0, z-axis: 9.5 - 10.5
    - Fall: x-axis: 2.0 - 3.0, y-axis: 2.0 - 3.0, z-axis: Spike to 15.0 followed by a drop to near 0
  - **Gyroscope (degrees/second):**
    - Walking: x-axis: 2.0 - 3.0, y-axis: 2.0 - 3.0, z-axis: 1.0 - 2.0
    - Fall: x-axis: Rapid increase to 30.0 - 50.0, y-axis: Rapid increase to 30.0 - 50.0, z-axis: Slight rotation or none
- **Estimated Price:** 300 RS

### 3. Barometer (BMP280) - Optional
- **Functions:**
  - Measures atmospheric pressure to estimate altitude.
  - Helps detect falls involving a sudden change in height.
- **Fall Detection Example:**
  - **Initial Stage:** Stable pressure reading (e.g., 101325 Pa).
  - **Descent Phase:** Increase in pressure due to rapid decrease in altitude.
  - **Impact Phase:** Pressure stabilizes at ground level.
- **Estimated Price:** 200 RS

### 4. Heart Rate Monitor (MAX 30102) - Optional
- **Functions:**
  - Monitors heart rate and SpO2 levels.
  - Provides additional health data to differentiate between fall and other movements.
- **Heart Rate Changes During Fall:**
  - May spike or drop due to shock or loss of consciousness.
- **Estimated Price:** 400 RS

### 5. Li-Po (Lithium Polymer) Battery
- **Functions:**
  - Provides power to the wearable device.
  - Rechargeable, lightweight, and suitable for continuous use.
- **Estimated Price:** 500 RS

### 6. PCB (Printed Circuit Board)
- **Functions:**
  - Houses all components in a compact form factor.
  - Provides necessary connections.
- **Estimated Price:** 500 RS

### 7. Enclosure
- **Functions:**
  - Protects electronics and ensures user comfort.
  - Can be designed as a wristband, pendant, etc.
- **Estimated Price:** 300 RS
