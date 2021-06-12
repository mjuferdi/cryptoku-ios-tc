# cryptoku-ios-tc

## Requirements
*  OS 11.0+
*  Swift 5.0
*  Xcode 12.4

## Installation
1. Open your terminal
2. Installing [xcodegen](https://github.com/yonaskolb/XcodeGen) (in case not installed). Make sure Xcode 11 is installed first. 
3. `git clone https://github.com/mjuferdi/cryptoku-ios-tc.git` 
4. `cd cryptoku-ios-tc`
5.  `chmod +x pregencommand.sh` to enable execution script
6. `xcodegen` oder `xcodegen generate`

## Features
- ✅ Display a list of at least 50 tickers
- ✅ Display news related to the currency
- ☑️ Show live price updates using Web Socket

## Architecture
Template iOS App using Clean Architecture and MVVR base on [kudoleh](https://github.com/kudoleh/iOS-Clean-Architecture-MVVM)

🖼️ MMVM Diagram:

![MVVM_Diagram](https://user-images.githubusercontent.com/19746283/121790487-0de85000-cc0a-11eb-867b-6014e62a3968.png)


## Built With

*  Alamofire 4.9.1 => Network Layer
*  SnapKit 5.0.0 => Auto Layout
*  SwiftyJSON
*  SwiftMessages => Custom Alert Message

## Authors

* **Mario MJ** - [mjuferdi](https://github.com/mjuferdi)



