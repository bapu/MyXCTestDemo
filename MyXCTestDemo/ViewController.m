//
//  ViewController.m
//  MyXCTestDemo
//
//  Created by Baidyanath on 2/8/15.
//  Copyright (c) 2015 Baidyanath. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *)stringReversal:(NSString *)addStringToReverse
{
    NSMutableString *reversedStr = [NSMutableString stringWithCapacity:[addStringToReverse length]];
    
    [addStringToReverse enumerateSubstringsInRange:NSMakeRange(0,[addStringToReverse length])
                                        options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences)
                                     usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                         [reversedStr appendString:substring];
                                     }];
    return reversedStr;
}

- (void)implUsingSimpleCompletionBlock:(void (^)(NSString *result))completionVal
{
    dispatch_queue_t myQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(myQ, ^{
        [NSThread sleepForTimeInterval:3.0f];
        dispatch_sync(dispatch_get_main_queue(), ^{
            completionVal(@"result is");
        });
    });
}
@end
