//
//  BannerView.h
//  Enterprise_LYK
//
//  Created by lyk on 16/3/4.
//  Copyright © 2016年 lyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMPageControl.h"

@interface BannerView : UIView<UIScrollViewDelegate>
{
    //滚动视图
    UIScrollView *bannerScrollView;
    
    //PageControl
    SMPageControl *spacePageControl;

    //自动轮播计时器
    NSTimer *shuffTimer;
    
    //图片个数
    NSInteger imageCount;
}
@property(nonatomic,copy) void(^clickedBannerAction)(int index);
/**
 初始化scrollView上的视图
 */
-(void)loadBannerImage:(NSArray*)dataArray;
/**
 初始化scrollView上的文本视图
 */
-(void)loadBannerContent:(NSArray*)dataArray;

@end
