//
//  ANTabBarController.m
//  DataCollection
//
//  Created by 紫薇大舅 on 2017/3/6.
//  Copyright © 2017年 ziweidajiu. All rights reserved.
//

#import "ANTabBarController.h"
#import "ANTabBarItem.h"

@interface ANTabBarController ()

@end

@implementation ANTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTabbarView];
}

- (void)setTabbarView {
    //设置背景色
//    [[UITabBar appearance] setBarTintColor:[UIColor lightGrayColor]];
    //改变标题字体颜色和大小
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:12.0f], NSForegroundColorAttributeName : [UIColor redColor]} forState:UIControlStateNormal];
//    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor greenColor]} forState:UIControlStateSelected];
    //设置选中item背景色
//    CGSize indicatorImageSize = CGSizeMake(self.tabBar.bounds.size.width / self.tabBar.items.count, self.tabBar.bounds.size.height);
//    
//    self.tabBar.selectionIndicatorImage = [self drawTabBarItemBackgroundImageWithSize:indicatorImageSize];
}

- (UIImage *)drawTabBarItemBackgroundImageWithSize:(CGSize)size
{
    // 准备绘图环境
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(ctx, 124.0 / 255, 124.0 / 255, 151.0 / 255, 1);
    CGContextFillRect(ctx, CGRectMake(0, 0, size.width, size.height));
    
    // 获取该绘图中的图片
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束绘图
    UIGraphicsEndImageContext();
    
    /*
     // 获取当前应用路径中Documents目录下指定文件名对应的文件路径
     NSString *path = [[NSHomeDirectory() stringByAppendingString:@"/Documents"] stringByAppendingString:@"/tabBarBackgroundImage.png"];
     NSLog(@"path:%@", path);
     // 保存PNG图片
     [UIImagePNGRepresentation(img) writeToFile:path atomically:YES];
     */
    return img;
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
