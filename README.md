# Active Noise Control

## Overview
Acoustic noise creates a major problem in industrial equipment and automobiles. The passive techniques to control noise have proven to be expensive, take up a lot of space and are ineffective at low frequencies. This brings us to Active Noise Control. Active noise control involves use of electroacoustic or electromechanical systems to cancel unwanted noise based on the principle of superposition. ANC fixes most of the shortcomings of the passive techniques. ANC systems are also cheaper and a lot less bulky. ANC systems must be adaptive in order to cope with variations in the noise. This idea of this project is to examine such ANC systems and analyse their implementations.

## Objectives

1. Learn about adaptive filtering: Develop a decent understanding of adaptive signal processing and common methods of adaptive filtering.
2. Examine common adaptive filtering algorithms used for ANC: Understanding and analyzing the working of LMS and filtered-X LMS algorithms.
3. Implement some of the algorithms and test their working: Implement the LMS and filtered-X LMS algorithms from scratch.

Please check the [final report](https://github.com/adithyasunil26/Active-Noise-Control/blob/main/Final%20Report.pdf) for more more detailed information about the project.

The contents of this repository are as follows

```bash

├── Code
│   ├── Basic_LMS.m
│   ├── Basic_NLMS.m
│   ├── Filtered_X_LMS.m
│   ├── Filtered_X_NLMS.m
│   ├── anc.wav
│   ├── filtered\ signal.wav
│   ├── filtered\ signal1.wav
│   ├── moonlight_sonata_bethoven.wav
│   ├── noisysignal.wav
│   ├── noisysignal1.wav
│   ├── readme.md
│   └── realnoise.m
├── Final\ Report.pdf
├── Initial\ Report.pdf
├── README.md
└── Result
    ├── Audio\ files
    │   ├── anc.wav
    │   ├── filtered\ signal.wav
    │   ├── filtered\ signal1.wav
    │   ├── moonlight_sonata_bethoven.wav
    │   ├── noisysignal.wav
    │   └── noisysignal1.wav
    ├── Basic_LMS
    │   ├── u=0.01.jpg
    │   ├── u=0.05.jpg
    │   ├── u=0.1.jpg
    │   └── u=0.2.jpg
    ├── Basic_NLMS
    │   ├── u=0.1.jpg
    │   ├── u=0.2.jpg
    │   ├── u=0.3.jpg
    │   ├── u=0.4.jpg
    │   ├── u=0.5.jpg
    │   └── u=1.jpg
    ├── Filtered_X_LMS
    │   ├── u=0.001.jpg
    │   ├── u=0.005.jpg
    │   └── u=0.01.jpg
    ├── Filtered_X_NLMS
    │   ├── u=0.0001.jpg
    │   ├── u=0.0025.jpg
    │   ├── u=0.005.jpg
    │   └── u=0.01.jpg
    └── readme.md
```

The `Code` directory consists of all the MATLAB scripts written for the implementations of various ANC algorithms. The `Result` directory consists of the obtained results sorted by algorithm.


## References
1. [Active Noise Control: A Tutorial Review by Sen M Kuo and Dennis R Morgan](https://ieeexplore.ieee.org/document/763310)

2. [Adaptive Filtering based on LMS Algorithm by Sireesha N, K Chithra and Tata Sudhakar](https://ieeexplore.ieee.org/document/6701910) 

3. Adaptive Filter Theory (5th edition) by Simon Haykin
