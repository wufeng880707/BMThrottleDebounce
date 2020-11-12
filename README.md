# BMThrottleDebounce

ThrottleDebounce

* Easy to use.
* Keep your code clear
* Thread safe

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
