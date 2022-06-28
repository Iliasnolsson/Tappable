# Tappable

Used to quickly create views with tap effects for use in both iOS & Mac. Aims to resolve issue of restricted styling of UIButton when used in Mac Catalyst. Use TitledTappableView instead of UIButton, further classes and functionality will be added to match that of the existing UIButton in iOS environment 


```swift
import Tappable
var continueTappableView = TitledTappableView() 
continueTappableView.effect = BounceTappableEffect()
continueTappableView.titleLabel.text = "Continue"
continueTappableView.delegate = self
```
