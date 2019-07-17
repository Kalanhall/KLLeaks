//
//  Copy by MLeaksFinder
//
//  Created by Kalanhall@163.com on 07/17/2019.
//  Copyright (c) 2019 Kalanhall@163.com. All rights reserved.
//

#import "UIApplication+MemoryLeak.h"
#import "NSObject+MemoryLeak.h"
#import <objc/runtime.h>

#if _INTERNAL_MLF_ENABLED

extern const void *const kLatestSenderKey;

@implementation UIApplication (MemoryLeak)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleSEL:@selector(sendAction:to:from:forEvent:) withSEL:@selector(swizzled_sendAction:to:from:forEvent:)];
    });
}

- (BOOL)swizzled_sendAction:(SEL)action to:(id)target from:(id)sender forEvent:(UIEvent *)event {
    objc_setAssociatedObject(self, kLatestSenderKey, @((uintptr_t)sender), OBJC_ASSOCIATION_RETAIN);
    
    return [self swizzled_sendAction:action to:target from:sender forEvent:event];
}

@end

#endif
