fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios test_pods_unit
```
fastlane ios test_pods_unit
```
Cocoapods integration with unit tests
### ios test_pods_unit_static
```
fastlane ios test_pods_unit_static
```
Cocoapods integration with unit tests as Static library
### ios test_pods_prototyping
```
fastlane ios test_pods_prototyping
```
Cocoapods integration as main app prototyping library
### ios test_carthage_unit
```
fastlane ios test_carthage_unit
```
Carthage integration with unit tests
### ios test_carthage_prototyping
```
fastlane ios test_carthage_prototyping
```
Carthage integration as main app prototyping library

----

## tvos
### tvos test_carthage_unit
```
fastlane tvos test_carthage_unit
```
Carthage integration with unit tests

----

## spm
### spm test
```
fastlane spm test
```

### spm test_xcode_unit
```
fastlane spm test_xcode_unit
```

### spm test_xcode_prototyping
```
fastlane spm test_xcode_prototyping
```


----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
