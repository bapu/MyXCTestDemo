//
//  MyXCTestDemoTests.m
//  MyXCTestDemoTests
//
//  Created by Baidyanath on 2/8/15.
//  Copyright (c) 2015 Baidyanath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface MyXCTestDemoTests : XCTestCase
@property (nonatomic) ViewController *testView;

@end


@implementation MyXCTestDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.testView = [[ViewController alloc]init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testStringReversal
{
    NSString *myString = @"HelloTest";
    NSString *reversedString = [self.testView stringReversal:myString];
    NSString *expectedReversedString = @"tseTolleH";
    XCTAssertEqualObjects(expectedReversedString, reversedString, @"The reversed string did not match the expected reverse");
}

- (void)testPerformanceStringReversal
{
    NSString *originalString = @"HelloTest";
    [self measureBlock:^{
        [self.testView stringReversal:originalString];
    }];
}

- (void)testTimeConsuming
{
    XCTestExpectation *cmplException= [self expectationWithDescription:@"Long Method Testing"];
    [self.testView implUsingSimpleCompletionBlock:^(NSString *result) {
        XCTAssertEqualObjects(@"result", result, @"Result was not correct!");
        [cmplException fulfill];
    }];
    [self waitForExpectationsWithTimeout:6.0 handler:nil];
}


@end
