//
//  HYSheetView.m
//  CustomSheet
//
//  Created by liuchao on 2017/2/23.
//  Copyright © 2017年 72.iJF4Ever. All rights reserved.
//

#import "HYSheetView.h"
#define SCREEN_BOUNDS   [UIScreen mainScreen].bounds
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width


@interface HYSheetView()
@property (nonatomic,strong) UIView * contentView;
@end

@implementation HYSheetView

static NSArray * imageNames = nil;
static float heigh4View = 0;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (HYSheetView*)initWithCancelTitle:(NSString *)title{
    HYSheetView *sheet = [[HYSheetView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    return  sheet;
}

- (HYSheetView*)initWithImages:(NSArray *)imagesName{
    imageNames =imagesName;
    heigh4View =  51*imagesName.count + 57;
    HYSheetView *sheet = [[HYSheetView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    return  sheet;
}

- (void)show{
    [UIView animateWithDuration:0.5 animations:^{
        _contentView.frame = CGRectMake(0, SCREEN_HEIGHT-heigh4View, SCREEN_WIDTH, heigh4View);
    }];
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        bgView.backgroundColor = [UIColor colorWithRed:0.61 green:0.61 blue:0.61 alpha:0.3];
        [self addSubview:bgView];
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT,  SCREEN_WIDTH,heigh4View)];
        _contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_contentView];

        for (int i=0; i<imageNames.count; i++) {
            
           
            UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(20+30,50*i+10,SCREEN_WIDTH-100,30)];
            [slider setMinimumValueImage:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
            slider.tag = i;
            [slider addTarget:self action:@selector(slidertDidChanged:) forControlEvents:UIControlEventValueChanged];
            [_contentView addSubview:slider];
            
            UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 50*(i+1), [UIScreen mainScreen].bounds.size.width, 1)];
            line.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1.0];
            [_contentView addSubview:line];

        }
        UIButton *bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 51*imageNames.count+6, SCREEN_WIDTH, 51)];
        bottomBtn.tag = 72;
        [bottomBtn setTitle:@"Cancel" forState:UIControlStateNormal];
        bottomBtn.backgroundColor = [UIColor whiteColor];
        [bottomBtn setTitleColor:[UIColor colorWithRed:0.20 green:0.20 blue:0.20 alpha:1.00] forState:UIControlStateNormal];
        [bottomBtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:bottomBtn];
    }
    return self;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self removeFromSuperview];
}
-(void)clickButton:(UIButton*)button{
    [self.delegate  actionSheetDidSelect:button.tag];
    [self removeFromSuperview];
}
- (void)slidertDidChanged:(UISlider*)slider{
    [self.delegate slidertDidChanged:slider];
}

- (float)getLeft4Title{
    float x = (SCREEN_WIDTH-textSize.width)/2;
    return x;
}

@end
