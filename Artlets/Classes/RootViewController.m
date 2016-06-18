//
//  RootViewController.m
//  Artlets
//
//  Created by lyk on 16/6/18.
//  Copyright © 2016年 lyk. All rights reserved.
//

#import "RootViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "BannerView.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadSubViewInVedio];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 初始化视频上的所有子视图
//初始化所有视图
-(void)loadSubViewInVedio
{
    //整个子视图的背景
    UIView *subBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    subBg.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:subBg];
    //跳过按钮
    UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(kWidth -[Util myXOrWidth:53] , 30, [Util myXOrWidth:40], [Util myYOrHeight:20])];
    
    [bt setTitle:@"跳过" forState:UIControlStateNormal];
    bt.titleLabel.font = [UIFont systemFontOfSize:14];
    [bt addTarget:self action:@selector(jumpAction) forControlEvents:UIControlEventTouchUpInside];
    bt.layer.cornerRadius = 2;
    bt.layer.borderColor = [UIColor whiteColor].CGColor;
    bt.layer.borderWidth = 0.5;
    bt.layer.masksToBounds = YES;
    [subBg addSubview:bt];
    //初始化滚动文字
    BannerView *bannerView = [[BannerView alloc] initWithFrame:CGRectMake(0, kHeight-120, kWidth, 45)];
    [bannerView loadBannerContent:@[@"规范你的训练过程",@"陪伴你迈出跑步第一步",@"分享汗水后你的性感",@"全程记录你的健身数据"]];
    [subBg addSubview:bannerView];
    //初始化注册登录按钮
    [self loadBt:subBg];
    
}
//跳过的触发事件
-(void)jumpAction
{
    
}
//初始化登录 注册按钮视图
-(void)loadBt:(UIView*)subBg
{
    float btleft = [Util myXOrWidth:15];
    float btW = (kWidth-btleft*3)/2;
    float btH = 50;
    UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(btleft, kHeight - 65, btW, btH)];
    [bt setBackgroundImage:[[UIImage imageNamed:@"registerbg"] stretchableImageWithLeftCapWidth:10 topCapHeight:20] forState:UIControlStateNormal];
    [bt setTitle:@"注册" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(clickedBt:) forControlEvents:UIControlEventTouchUpInside];
    bt.tag = 1;
    [subBg addSubview:bt];
    
    bt = [[UIButton alloc] initWithFrame:CGRectMake(btleft+bt.right, bt.top, bt.width, bt.height)];
    [bt setBackgroundImage:[[UIImage imageNamed:@"loginbg"] stretchableImageWithLeftCapWidth:10 topCapHeight:20] forState:UIControlStateNormal];
    [bt setTitle:@"登录" forState:UIControlStateNormal];
    [bt setTitleColor:Rgb(0, 37, 114, 1.0) forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(clickedBt:) forControlEvents:UIControlEventTouchUpInside];
    bt.tag = 2;
    [subBg addSubview:bt];
}
//点击注册登录点击事件
-(void)clickedBt:(UIButton*)sender
{
    if (sender.tag ==1) {
        NSLog(@"注册");
        RegisterViewController *registerVC = [[RegisterViewController alloc] init];
        [self.navigationController pushViewController:registerVC animated:YES];
    }else
    {
        NSLog(@"登录");
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:loginVC animated:YES];
    }
}
@end
