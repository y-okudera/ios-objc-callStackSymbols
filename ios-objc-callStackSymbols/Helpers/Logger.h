//
//  Logger.h
//  ios-objc-callStackSymbols
//
//  Created by YukiOkudera on 2018/07/01.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Logger : NSObject

+ (NSArray <NSString *> *)callStackSymbols;
@end

NS_ASSUME_NONNULL_END
