//
//  ViewController.m
//  BMThrottleDebounce
//
//  Created by bomo on 2020/11/12.
//

#import "ViewController.h"
#import "BMThrottle.h"
#import "BMDebounce.h"

@interface ViewController ()

@property (nonatomic, strong) BMThrottle *throttle;
@property (nonatomic, strong) BMDebounce *debounce;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.throttle = [[BMThrottle alloc] init];
    self.throttle.threshold = 1;
    
    self.debounce = [[BMDebounce alloc] init];
    self.debounce.threshold = 1;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.throttle doAction:^{
        NSLog(@"throttle: %@", NSDate.date);
    }];
    
    [self.debounce doAction:^{
        NSLog(@"debounce: %@", NSDate.date);
    }];
}

@end
