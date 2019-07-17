//
//  Copy by MLeaksFinder
//
//  Created by Kalanhall@163.com on 07/17/2019.
//  Copyright (c) 2019 Kalanhall@163.com. All rights reserved.
//

#import "UIView+MemoryLeak.h"
#import "NSObject+MemoryLeak.h"

#if _INTERNAL_MLF_ENABLED

@implementation UIView (MemoryLeak)

- (BOOL)willDealloc {
    if (![super willDealloc]) {
        return NO;
    }
    
    [self willReleaseChildren:self.subviews];
    
    return YES;
}

@end

#endif
