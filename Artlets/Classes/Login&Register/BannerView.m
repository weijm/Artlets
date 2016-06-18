//
//  BannerView.m
//  Enterprise_LYK
//
//  Created by lyk on 16/3/4.
//  Copyright © 2016年 lyk. All rights reserved.
//

#import "BannerView.h"

@implementation BannerView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect frame1 = CGRectMake(0, 0, kWidth, frame.size.height - [Util myYOrHeight:20]);
        bannerScrollView = [[UIScrollView alloc] initWithFrame:frame1];
        bannerScrollView.delegate = self;
        bannerScrollView.showsHorizontalScrollIndicator = NO;
        bannerScrollView.pagingEnabled = YES;
        [self addSubview:bannerScrollView];
        frame1 = CGRectMake(0, frame.size.height - [Util myYOrHeight:20], kWidth, [Util myYOrHeight:20]);
        spacePageControl = [[SMPageControl alloc] initWithFrame:frame1];
        spacePageControl.currentPage = 0;
        [spacePageControl addTarget:self action:@selector(spacePageControl:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:spacePageControl];
    }
    return self;
}
-(void)loadBannerContent:(NSArray*)dataArray
{
    imageCount = dataArray.count;
    int scrollAnchor = -kWidth;
    for (int i =0; i < imageCount; i++) {
        scrollAnchor += kWidth;
        
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(scrollAnchor, 0, kWidth, self.frame.size.height-[Util myYOrHeight:20])];
        lab.text = [dataArray objectAtIndex:i];
        lab.font = [UIFont systemFontOfSize:22];
        lab.textColor = [UIColor whiteColor];
        lab.textAlignment = NSTextAlignmentCenter;
        [bannerScrollView addSubview:lab];
        //添加自动轮播的效果
        if (i==imageCount-1) {
            [self shufflingTimer];
        }
    }
    bannerScrollView.contentSize = CGSizeMake(scrollAnchor+kWidth, self.frame.size.height);
    
    spacePageControl.numberOfPages = dataArray.count;
    [spacePageControl setPageIndicatorImage:[UIImage imageNamed:@"banner_select"]];
    [spacePageControl setCurrentPageIndicatorImage:[UIImage imageNamed:@"banner_selected_highted"]];
    spacePageControl.currentPage = 0;
    [spacePageControl addTarget:self action:@selector(spacePageControl:) forControlEvents:UIControlEventValueChanged];
    
    
}
#pragma mark - 初始化scrollView上的视图
-(void)loadBannerImage:(NSArray*)dataArray
{
    imageCount = dataArray.count;
    int scrollAnchor = -kWidth;
    for (int i =0; i < imageCount; i++) {
        //        NSDictionary *dic = [dataArray objectAtIndex:i];
        //        NSLog(@"img dic == %@",dic);
        scrollAnchor += kWidth;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(scrollAnchor, 0, kWidth, self.frame.size.height)];
        //        [imageView sd_setImageWithURL:[NSURL URLWithString:[Util getCorrectString:[dic objectForKey:@"img_url"]]]];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.image = [UIImage imageNamed:@"home_banner"];
        imageView.clipsToBounds = NO;
        imageView.tag = i;
        [bannerScrollView addSubview:imageView];
        //添加自动轮播的效果
        if (i==imageCount-1) {
            [self shufflingTimer];
        }
    }
    bannerScrollView.contentSize = CGSizeMake(scrollAnchor+kWidth, self.frame.size.height);
    
    spacePageControl.numberOfPages = dataArray.count;
    [spacePageControl setPageIndicatorImage:[UIImage imageNamed:@"homepage_banner_select"]];
    [spacePageControl setCurrentPageIndicatorImage:[UIImage imageNamed:@"homepage_banner_selected_highted"]];
    spacePageControl.currentPage = 0;
    [spacePageControl addTarget:self action:@selector(spacePageControl:) forControlEvents:UIControlEventValueChanged];
    
    //点击bannerImage的触发事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchImageInScrollView:)];
    [bannerScrollView addGestureRecognizer:tap];

}
#pragma mark - 自动轮播
-(void)shufflingTimer
{
    if (shuffTimer) {
        [self stopShuffling];
    }
    shuffTimer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(startShuffling) userInfo:nil repeats:YES];
}
-(void)startShuffling
{
    NSInteger curIndex = 0;
    if (spacePageControl.currentPage == imageCount-1) {
        curIndex = 0;
    }else
    {
        curIndex = spacePageControl.currentPage+1;
    }
    spacePageControl.currentPage = curIndex;
    CGPoint offset = CGPointMake(bannerScrollView.frame.size.width * curIndex, 0);
    [bannerScrollView setContentOffset:offset animated:YES];
}
-(void)stopShuffling
{
    if (shuffTimer) {
        //终止计时器
        [shuffTimer invalidate];
        shuffTimer = nil;
    }
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    float wid ;
    wid = _scrollView.contentOffset.x;
    spacePageControl.currentPage = round(wid/kWidth);
    
}
#pragma mark - 点击bannerView的触发事件
-(void)touchImageInScrollView:(UITapGestureRecognizer*)sender
{
    CGPoint point = [sender locationInView:bannerScrollView];
    float pointX = point.x;
    int pageIndex = pointX/kWidth;
    self.clickedBannerAction(pageIndex);
}
- (void)spacePageControl:(SMPageControl *)sender
{
    CGPoint offset = CGPointMake(bannerScrollView.frame.size.width * sender.currentPage, 0);
    [bannerScrollView setContentOffset:offset animated:YES];
}


@end
