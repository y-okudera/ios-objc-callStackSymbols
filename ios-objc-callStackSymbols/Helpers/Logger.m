//
//  Logger.m
//  ios-objc-callStackSymbols
//
//  Created by YukiOkudera on 2018/07/01.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "Logger.h"

@implementation Logger

+ (NSArray <NSString *> *)callStackSymbols {

    // コールスタックを得る
    NSArray<NSString *> *callStackSymbols = [NSThread callStackSymbols].copy;

    NSString *caller = @"";
    NSString *twoPrevious = @"";
    NSString *threePrevious = @"";
    NSString *fourPrevious = @"";

    if (callStackSymbols.count >= 5) {

        caller = callStackSymbols[1];
        twoPrevious = callStackSymbols[2];
        threePrevious = callStackSymbols[3];
        fourPrevious = callStackSymbols[4];

    } else if (callStackSymbols.count >= 4) {

        caller = callStackSymbols[1];
        twoPrevious = callStackSymbols[2];
        threePrevious = callStackSymbols[3];

    } else if (callStackSymbols.count >= 3) {

        caller = callStackSymbols[1];
        twoPrevious = callStackSymbols[2];

    } else if (callStackSymbols.count >= 2) {

        caller = callStackSymbols[1];
    }

    return [self formatLogWithCallStackSymbols:@[caller, twoPrevious, threePrevious, fourPrevious]
                                  separatorSet:[NSCharacterSet characterSetWithCharactersInString:@" -[]+?.,"]];
}

+ (NSArray <NSString *> *)formatLogWithCallStackSymbols:(NSArray <NSString *> *)callStackSymbols
                                           separatorSet:(NSCharacterSet *)separatorSet {

    NSMutableArray <NSString *> *logs = [@[] mutableCopy];

    for (NSString *callStack in callStackSymbols) {

        // セパレータを使用してスタックの文字列を分解
        NSMutableArray *components = [NSMutableArray arrayWithArray:[callStack componentsSeparatedByCharactersInSet:separatorSet]];
        // 空文字を排除
        [components removeObject:@""];

        [logs addObject:[NSString stringWithFormat:@"[%@ %@]",  components[components.count - 3], components[components.count - 2]]];
    }
    return logs;
}

@end
