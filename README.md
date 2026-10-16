# iOS_CW

PlantCare/
├── App/
│   ├── PlantCareApp.swift
│   └── MainTabView.swift
├── Models/
│   ├── Plant.swift
│   └── CareTask.swift
├── Views/
│   ├── Auth/
│   │   ├── WelcomeView.swift
│   │   └── SignInView.swift
│   ├── Dashboard/
│   │   └── DashboardView.swift
│   └── Components/
│       └── CustomColors.swift
├── ViewModels/
│   ├── AuthViewModel.swift
│   └── DashboardViewModel.swift
└── Services/
    └── (We will add Firebase, CoreML, etc. here later)
Colors:
Primary Green: #4CAF50 (approx)
Dark Green: #2E7D32
Light Green bg: #E8F5E9

DataSet=  PlantVillage Dataset on kaggle.

Vision is the framework that handles image processing.
Core ML is the framework that runs your trained machine learning model on the device.    
The Flow: Camera frame ➡️ Vision (VNCoreMLRequest) ➡️ Core ML Model ➡️ Prediction (e.g., "Leaf Spot, 87%").
