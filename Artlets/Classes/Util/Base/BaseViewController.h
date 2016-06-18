//
//  BaseViewController.h
//  Bistone
//
//  Created by lyk on 15/5/25.
//  Copyright (c) 2015年 lyk. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "MBProgressHUD.h"
@interface BaseViewController : UIViewController
{
    UIView   *topbj_View;
    UIButton *back_bt;
    UILabel  *base_label;
    UIImageView * backImage;
//    UIView * backView1;
}
//@property (nonatomic, readonly) MBProgressHUD *hud;
- (void)showMessage:(NSString *)message;

//显示hud加载提示
- (void)showHUD:(NSString *)title;
/**
 只显示提示语
 */
-(void)showHUDMsg:(NSString*)promptStr;
//两种隐藏hud的方式
- (void)hideHUD;  //直接隐藏
- (void)hideHUDWithComplete:(NSString *)title;  //隐藏之前显示操作完成的提示
//数据请求错误提示
- (void)hideHUDFaild:(NSString *)title;
//提示信息
- (void)hideMessage:(NSString *)message;

- (void)showAlertView:(NSString *)alertTitle;
//隐藏tabBar
- (void)hideTabBar;
//显示tabBar
- (void)showTabBar;

@end
