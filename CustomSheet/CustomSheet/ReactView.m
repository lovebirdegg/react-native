//
//  ReactView.m
//  CustomSheet
//
//  Created by liuchao on 2017/3/1.
//  Copyright © 2017年 72.iJF4Ever. All rights reserved.
//

#import "ReactView.h"
#import <React/RCTRootView.h>

@implementation ReactView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        NSURL *jsCodeLocation = [NSURL
                                 URLWithString:@"http://localhost:8081/index.ios.bundle?platform=ios"];
//        NSURL *jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"bundle"];
        RCTRootView *rootView =
        [[RCTRootView alloc] initWithBundleURL : jsCodeLocation
                             moduleName        : @"RNHighScores"
                             initialProperties :
         @{
           @"scores" : @[
                   @{
                       @"name" : @"Alex",
                       @"value": @"42"
                       },
                   @{
                       @"name" : @"Joel",
                       @"value": @"10"
                       }
                   ]
           }
                              launchOptions    : nil];
        [self addSubview:rootView];
        rootView.frame = self.bounds;
    }
    return self;
}

@end
