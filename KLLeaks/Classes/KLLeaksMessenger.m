//
//  Copy by MLeaksFinder
//
//  Created by Kalanhall@163.com on 07/17/2019.
//  Copyright (c) 2019 Kalanhall@163.com. All rights reserved.
//

#import "KLLeaksMessenger.h"

static __weak UIAlertView *alertView;

@implementation KLLeaksMessenger

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message {
    [self alertWithTitle:title message:message delegate:nil additionalButtonTitle:nil];
}

+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
              delegate:(id<UIAlertViewDelegate>)delegate
 additionalButtonTitle:(NSString *)additionalButtonTitle {
    [alertView dismissWithClickedButtonIndex:0 animated:NO];
    UIAlertView *alertViewTemp = [[UIAlertView alloc] initWithTitle:title
                                                            message:message
                                                           delegate:delegate
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:additionalButtonTitle, nil];
    [alertViewTemp show];
    alertView = alertViewTemp;
    
    NSLog(@"%@: %@", title, message);
}

@end
