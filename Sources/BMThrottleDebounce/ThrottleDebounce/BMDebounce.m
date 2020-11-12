//
//  BMDebounce.m
//  BMThrottleDebounce
//
//  Created by bomo on 2020/11/12.
//

#import "BMDebounce.h"

@interface BMDebounce ()

/// 防抖触发的事件
@property (nonatomic, copy) void(^action)(void);

/// 上一次触发的时间（不是执行的时间）
@property (nonatomic, assign) NSTimeInterval fireDate;

/// 线程安全队列
@property (nonatomic, strong) dispatch_queue_t syncQueue;

/// GCD Timer
@property (nonatomic, strong) dispatch_source_t timer;



@end

@implementation BMDebounce

- (instancetype)init {
    self = [super init];
    if (self) {
        self.threshold = 0.2;
        self.queue = dispatch_get_main_queue();
        
        const char *label = [NSString stringWithFormat:@"GCDThrottle_%p", self].UTF8String;
        self.syncQueue = dispatch_queue_create(label, DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)doAction:(void(^)(void))block {
    dispatch_async(self.syncQueue, ^{
        // 比限制的时间超过多少
        NSTimeInterval span = NSDate.date.timeIntervalSince1970 - self.fireDate - self.threshold;
        self.fireDate = NSDate.date.timeIntervalSince1970;
        
        if (span >= 0) {
            // 超过，可以直接触发
            self.action = block;
            [self fire];
        } else {
            // cancel原来的timer
            if (self.timer) {
                // 如果有则取消
                dispatch_source_cancel(self.timer);
                self.timer = nil;
            }
            
            self.action = block;
            // 创建新的timer，误差设置为0.5，提高性能
            self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, self.syncQueue);
            dispatch_time_t startTime = dispatch_time(DISPATCH_TIME_NOW, ABS(span) * NSEC_PER_SEC);
            dispatch_source_set_timer(self.timer, startTime, DISPATCH_TIME_FOREVER, 0.5 * NSEC_PER_SEC);
            dispatch_source_set_event_handler(self.timer, ^{
                [self fire];
            });
            dispatch_resume(self.timer);
        }
    });
}

- (void)fire {
    if (self.timer) {
        dispatch_source_cancel(self.timer);
        self.timer = nil;
    }
    dispatch_async(self.syncQueue, ^{
        if (self.action) {
            // 执行队列，默认为主线程
            void(^action)(void) = self.action;
            // 取出action抛给指定队列执行
            dispatch_async(self.queue, ^{
                action();
            });
            // 触发完成后清空
            self.action = nil;
        }
    });
}

@end
