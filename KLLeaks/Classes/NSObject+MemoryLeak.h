//
//  Copy by MLeaksFinder
//
//  Created by Kalanhall@163.com on 07/17/2019.
//  Copyright (c) 2019 Kalanhall@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MLCheck(TARGET) [self willReleaseObject:(TARGET) relationship:@#TARGET];

@interface NSObject (MemoryLeak)

- (BOOL)willDealloc;
- (void)willReleaseObject:(id)object relationship:(NSString *)relationship;

- (void)willReleaseChild:(id)child;
- (void)willReleaseChildren:(NSArray *)children;

- (NSArray *)viewStack;

+ (void)addClassNamesToWhitelist:(NSArray *)classNames;

+ (void)swizzleSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL;

@end
