//
//  Config.h
//  Artlets
//
//  Created by lyk on 16/6/18.
//  Copyright © 2016年 lyk. All rights reserved.
//

#ifndef Config_h
#define Config_h

#endif /* Config_h */
#import "BaseViewController.h"
#import "Util.h"
#import "UIViewExt.h"


//状态条的高度
#define kDevice ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? 20 : 0)
//设备屏宽
#define kWidth [UIScreen mainScreen].bounds.size.width
//设备高度
#define kHeight [UIScreen mainScreen].bounds.size.height

//各种设备的判断
#define kIphone4  [UIScreen mainScreen].bounds.size.height == 480
#define kIphone5  [UIScreen mainScreen].bounds.size.height == 568
#define kIphone6  [UIScreen mainScreen].bounds.size.height == 667
#define kIphone6plus [UIScreen mainScreen].bounds.size.height == 736
//设备系统版本
#define kDeviceVersion [[[UIDevice currentDevice] systemVersion] floatValue]
//适配5s 6 6plus的比例
#define autoSizeScaleX kIphone6?1.171875:(kIphone6plus?1.29375:1)
#define autoSizeScaleY kIphone6?1.17429577:(kIphone6plus?1.2957:1)
//导航条高度
#define topBarheight      ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0?64:44)

//颜色
#define Rgb(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
//导航栏颜色
#define kNavigationBgColor [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0]
//界面的统一颜色
#define kCVBackgroundColor [UIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1.0]

//是否登录的标志
#define kLoginOrExit @"LoginOrExit"