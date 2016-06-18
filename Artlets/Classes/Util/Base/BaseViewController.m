//
//  BaseViewController.m
//  Bistone
//
//  Created by lyk on 15/5/25.
//  Copyright (c) 2015年 lyk. All rights reserved.
//

#import "BaseViewController.h"
#define kDevice ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? 20 : 0)
@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = kCVBackgroundColor;
    topbj_View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, topBarheight)];
    topbj_View.backgroundColor = kNavigationBgColor;
    topbj_View.hidden = NO;
    [self.view addSubview:topbj_View];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, topBarheight-0.5, kWidth, 0.5)];
    line.backgroundColor = Rgb(197, 197, 197, 1.0);
    [topbj_View addSubview:line];

    backImage = [[UIImageView alloc]initWithFrame:CGRectMake(15, kDevice+15, 10, 17)];
    backImage.image = [UIImage imageNamed:@"goBack"];
    backImage.userInteractionEnabled = YES;
    [topbj_View addSubview:backImage];
    
    back_bt = [UIButton buttonWithType:UIButtonTypeCustom];
    back_bt.frame = CGRectMake(5, kDevice + 5, 40, 40);
    [back_bt addTarget:self action:@selector(back_Action) forControlEvents:UIControlEventTouchUpInside];
    [topbj_View addSubview:back_bt];

    base_label = [[UILabel alloc] initWithFrame:CGRectMake((kWidth-240)/2, kDevice + 13, 240, 20)];
    base_label.textColor =Rgb(255, 0, 0, 1.0);
    base_label.font = [UIFont boldSystemFontOfSize:18];//[UIFont systemFontOfSize:[Util myFontSize:18]];
    base_label.textAlignment = NSTextAlignmentCenter;
    base_label.backgroundColor = [UIColor clearColor];
    base_label.userInteractionEnabled = YES;
    [topbj_View addSubview:base_label];
    
    if (self.navigationController.viewControllers.count >1) {
        
        back_bt.hidden = NO;
        base_label.hidden = NO;
        
    }
//    if ([[NSUserDefaults standardUserDefaults] boolForKey:Night]) {
//        self.view.backgroundColor = [UIColor blackColor];
//        topbj_View.backgroundColor =  [UIColor colorWithRed:27/255.0 green:28/255.0 blue:32/255.0 alpha:1];
//        
//        base_label.textColor = [UIColor grayColor];
//        
//    }else{
//        self.view.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
//        topbj_View.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0];
//        base_label.textColor = [UIColor blackColor];
//        
//    }
//    backView1 = [[UIView alloc]initWithFrame:CGRectMake(0, kDevice+kNavigationBar, kDeviceWidth, kDeviceHeight-kDevice-kNavigationBar)];
//    backView1.backgroundColor = BACKGROUND_COLOR;
//    [self.view addSubview:backView1];
}

- (void)back_Action
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark - View Appear
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //隐藏返回按钮
    if (self.navigationController.viewControllers.count <= 1) {
        
        back_bt.hidden = YES;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark - HUD Methods
- (void)timerFireMethod:(NSTimer*)theTimer
{
    UIView *promptAlert = (UIView*)[theTimer userInfo];
    [UIView animateWithDuration:0.3 animations:^{
        promptAlert.alpha = 0;
    } completion:^(BOOL finished) {
        [promptAlert removeFromSuperview];
    }];
    
    promptAlert =NULL;
}
#pragma mark -
#pragma mark - HUD Methods
//显示提示
//- (void)showHUD:(NSString *)title {
//    _hud = [MBProgressHUD showHUDAddedTo:self.view.window animated:YES];
//    self.hud.mode = MBProgressHUDModeIndeterminate;
//    _hud.labelText = title;
//    _hud.dimBackground = YES;
//}
////显示 自动隐藏提示语
//-(void)showHUDMsg:(NSString*)promptStr
//{
//    
//    _hud = [MBProgressHUD showHUDAddedTo:self.view.window animated:YES];
//    self.hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
//    self.hud.mode = MBProgressHUDModeCustomView;
//    _hud.labelText = promptStr;
//    _hud.dimBackground = YES;
//    
//    //延迟隐藏
//    [self.hud hide:YES afterDelay:1.0f];
//}
////隐藏提示
//- (void)hideHUD {
//    
//    [self.hud hide:YES];
//}
- (void)showMessage:(NSString *)message
{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = [UIColor blackColor];
    showview.frame = CGRectMake(1, 1, 1, 1);
    showview.alpha = 1.0f;
    showview.layer.cornerRadius = 10.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];
    
    UILabel *label = [[UILabel alloc]init];
    CGSize LabelSize = [message sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(290, 9000)];
    label.frame = CGRectMake(10, 15, LabelSize.width, LabelSize.height);
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:13];
    [showview addSubview:label];
    showview.frame = CGRectMake((kWidth-(LabelSize.width+20))/2, (kHeight-(LabelSize.height+30))/2, LabelSize.width+20, LabelSize.height+30);

    [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self
                                   selector:@selector(timerFireMethod:)
                                   userInfo:showview
                                    repeats:NO];
    
    
}
//操作完成的提示
//- (void)hideHUDWithComplete:(NSString *)title  //隐藏之前显示操作完成的提示
//{
//    self.hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
//    //显示模式为自定义视图模式
//    self.hud.mode = MBProgressHUDModeCustomView;
//    self.hud.labelText = title;
//    
//    //延迟隐藏
//    [self.hud hide:YES afterDelay:0.5f];
//}
////数据请求错误提示
//- (void)hideHUDFaild:(NSString *)title
//{
//    self.hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"colse.png"]];
//    //显示模式为自定义视图模式
//    self.hud.mode = MBProgressHUDModeCustomView;
//    self.hud.labelText = title;
//    
//    //延迟隐藏
//    [self.hud hide:YES afterDelay:0.5f];
//}
//提示信息
//- (void)hideMessage:(NSString *)message
//{
//    self.hud.customView = [[UIImageView alloc] init];
//    //显示模式为自定义视图模式
//    self.hud.mode = MBProgressHUDModeCustomView;
//    self.hud.labelText = message;
//    [self.hud show:YES];
//    //延迟隐藏
//    [self.hud hide:YES afterDelay:0.8f];
//}
- (void)showAlertView:(NSString *)alertTitle
{
    UIAlertView * alertV = [[UIAlertView alloc]initWithTitle:@"提示" message:alertTitle delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertV show];
}
//隐藏tabBar
- (void)hideTabBar {
    if (self.tabBarController.tabBar.hidden == YES) {
        return;
    }
    UIView *contentView;
    if ( [[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    else
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x,  contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height + self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = YES;
    
}
//显示tabBar
- (void)showTabBar

{
    if (self.tabBarController.tabBar.hidden == NO)
    {
        return;
    }
    UIView *contentView;
    if ([[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]])
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    
    else
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x, contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height - self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = NO;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
