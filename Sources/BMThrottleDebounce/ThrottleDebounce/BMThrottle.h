//
//  BMThrottle.h
//  BMThrottleDebounce
//
//  Created by bomo on 2020/11/12.
//

#import <Foundation/Foundation.h>

/// 节流控制器，用户避免短时间内频繁触发事件，通过threshold隔开
@interface BMThrottle : NSObject

/// 节流间隔时间（默认为0.2s）
@property (nonatomic, assign) NSTimeInterval threshold;

/// 执行队列（默认为主线程）
@property (nonatomic, strong, nonnull) dispatch_queue_t queue;

/// 触发事件（内部会进行节流控制）
- (void)doAction:(void(^_Nonnull)(void))action;

@end
