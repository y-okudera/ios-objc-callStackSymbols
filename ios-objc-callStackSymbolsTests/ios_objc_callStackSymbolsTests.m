//
//  ios_objc_callStackSymbolsTests.m
//  ios-objc-callStackSymbolsTests
//
//  Created by YukiOkudera on 2018/07/01.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Logger.h"

@interface ios_objc_callStackSymbolsTests : XCTestCase

@end

@implementation ios_objc_callStackSymbolsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCallStackSymbols {
    [self sample1];
}

- (void)sample1 {
    [self sample2];
}

- (void)sample2 {
    [self sample3];
}

- (void)sample3 {

    NSArray <NSString *> *callStackSymbols = [Logger callStackSymbols].copy;
    XCTAssertEqual(callStackSymbols.count, 4);
    XCTAssertEqualObjects(callStackSymbols[0], @"[ios_objc_callStackSymbolsTests sample3]");
    XCTAssertEqualObjects(callStackSymbols[1], @"[ios_objc_callStackSymbolsTests sample2]");
    XCTAssertEqualObjects(callStackSymbols[2], @"[ios_objc_callStackSymbolsTests sample1]");
    XCTAssertEqualObjects(callStackSymbols[3], @"[ios_objc_callStackSymbolsTests testCallStackSymbols]");
}

@end
