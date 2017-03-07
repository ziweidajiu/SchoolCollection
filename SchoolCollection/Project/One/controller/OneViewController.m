//
//  OneViewController.m
//  DataCollection
//
//  Created by 紫薇大舅 on 2017/3/6.
//  Copyright © 2017年 ziweidajiu. All rights reserved.
//

#import "OneViewController.h"
#import "UINavigationBar+Awesome.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationView];
    [self createView];
}

#pragma -mark 设置navigation
-(void)setNavigationView{
    self.navigationItem.title = @"我的Student ID";
    UIColor * color = [UIColor whiteColor];
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"background_1.png"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"one_left"] style:UIBarButtonItemStyleDone target:self action:@selector(onClick0:)];
    self.navigationItem.leftBarButtonItem = btn1;
    
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"one_right"] style:UIBarButtonItemStyleDone target:self action:@selector(onClick1:)];
    self.navigationItem.rightBarButtonItem = btn2;
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

-(void)onClick0:(UIButton *)btn{
    
}

-(void)onClick1:(UIButton *)btn{
    
}

-(void)createView{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
