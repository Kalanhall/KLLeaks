//
//  Copy by MLeaksFinder
//
//  Created by Kalanhall@163.com on 07/17/2019.
//  Copyright (c) 2019 Kalanhall@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KLLeaksMessenger : NSObject

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message;
+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
              delegate:(id<UIAlertViewDelegate>)delegate
 additionalButtonTitle:(NSString *)additionalButtonTitle;

@end
