//
//  Copy by MLeaksFinder
//
//  Created by Kalanhall@163.com on 07/17/2019.
//  Copyright (c) 2019 Kalanhall@163.com. All rights reserved.
//

#import "UITouch+MemoryLeak.h"
#import <objc/runtime.h>

#if _INTERNAL_MLF_ENABLED

extern const void *const kLatestSenderKey;

@implementation UITouch (MemoryLeak)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleSEL:@selector(setView:) withSEL:@selector(swizzled_setView:)];
    });
}

- (void)swizzled_setView:(UIView *)view {
    [self swizzled_setView:view];
    
    if (view) {
        objc_setAssociatedObject([UIApplication sharedApplication],
                                 kLatestSenderKey,
                                 @((uintptr_t)view),
                                 OBJC_ASSOCIATION_RETAIN);
    }
}

@end

#endif
