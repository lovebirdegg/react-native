//
//  HYSheetView.h
//  CustomSheet
//
//  Created by liuchao on 2017/2/23.
//  Copyright © 2017年 72.iJF4Ever. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HYSheetViewDelegate <NSObject>

- (void)actionSheetDidSelect:(NSInteger)index;
- (void)slidertDidChanged:(UISlider*)slider;

@end

@interface HYSheetView : UIView{
    CGSize textSize;
}

@property (nonatomic,weak) id<HYSheetViewDelegate>delegate;

- (HYSheetView*)initWithCancelTitle:(NSString *)title;
- (HYSheetView*)initWithImages:(NSArray *)imagesName;
- (void)show;
@end
