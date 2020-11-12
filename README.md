# BMThrottleDebounce

ThrottleDebounce

[![Platform](https://img.shields.io/cocoapods/p/BMThrottleDebounce.svg?style=flat)](https://github.com/BMThrottleDebounce/BMThrottleDebounce)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/BMThrottleDebounce.svg)](https://cocoapods.org/pods/BMThrottleDebounce)


* Easy to use.
* Keep your code clear
* Thread safe

## debounce/throttle demo

[Demo](http://demo.nimius.net/debounce_throttle/)

## Example

BMThrottle

```objc
BMThrottle *throttle = [[BMThrottle alloc] init];
throttle.threshold = 1;

[throttle doAction:^{
    NSLog(@"throttle: %@", NSDate.date);
}];
```

BMDebounce

```objc
BMDebounce *debounce = [[BMDebounce alloc] init];
debounce.threshold = 1;

[debounce doAction:^{
    NSLog(@"debounce: %@", NSDate.date);
}];
