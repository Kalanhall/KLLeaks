//
//  Copy by MLeaksFinder
//
//  Created by Kalanhall@163.com on 07/17/2019.
//  Copyright (c) 2019 Kalanhall@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KLLeakedObjectProxy : NSObject

+ (BOOL)isAnyObjectLeakedAtPtrs:(NSSet *)ptrs;
+ (void)addLeakedObject:(id)object;

@end
