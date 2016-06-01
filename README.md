# SwiftCircularIconButtonWithProgressBar

[![CI Status](http://img.shields.io/travis/Alankar Misra/SwiftCircularIconButtonWithProgressBar.svg?style=flat)](https://travis-ci.org/Alankar Misra/SwiftCircularIconButtonWithProgressBar)
[![Version](https://img.shields.io/cocoapods/v/SwiftCircularIconButtonWithProgressBar.svg?style=flat)](http://cocoapods.org/pods/SwiftCircularIconButtonWithProgressBar)
[![License](https://img.shields.io/cocoapods/l/SwiftCircularIconButtonWithProgressBar.svg?style=flat)](http://cocoapods.org/pods/SwiftCircularIconButtonWithProgressBar)
[![Platform](https://img.shields.io/cocoapods/p/SwiftCircularIconButtonWithProgressBar.svg?style=flat)](http://cocoapods.org/pods/SwiftCircularIconButtonWithProgressBar)

## Description
A lightweight, fast, highly-customizable, well-documented circular button with an animated progress bar, and a settable icon with subtle transitions when the icon is changed. Perfect for download buttons, audio player buttons and the customary "much much more!". Written in pure Swift. Uses IBDesignable and IBInspectable so you can customize the button from within Interface Builder and watch it update live. 

![Sample](http://i.imgur.com/qkjHBCf.gif)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first. 
*The Example uses icons created by lastspark and useiconic.com from the Noun Project.*

## Installation

SwiftCircularIconButtonWithProgressBar is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following lines to your Podfile:

```ruby
use_frameworks!
pod "SwiftCircularIconButtonWithProgressBar"
```

## Usage

Once you've installed the cocoapod, drop a button on your view controller, and set it to a *square* size. *If the height and the width differ, the control will draw within a square with sides equal to the smaller side.* Set the custom class of the button to *SwiftCircularIconButtonWithProgressBar*. If the button doesn't draw at this point, make sure the module is correctly set. Play around with the custom properties and see the button update within Interface Builder. See the Example project for usage patterns. Feel free to write in to me if you have issues using the control. 

## Author

Alankar Misra, alankarmisra@gmail.com

## License

SwiftCircularIconButtonWithProgressBar is available under the MIT license. See the LICENSE file for more info.
