//
//  ViewController.h
//  MyXCTestDemo
//
//  Created by Baidyanath on 2/8/15.
//  Copyright (c) 2015 Baidyanath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


- (NSString *)stringReversal:(NSString *)addStringToReverse;
- (void)implUsingSimpleCompletionBlock:(void (^)(NSString *result))completionVal;
@end

