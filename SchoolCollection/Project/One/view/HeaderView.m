//
//  HeaderView.m
//  SchoolCollection
//
//  Created by 紫薇大舅 on 2017/3/8.
//  Copyright © 2017年 ziweidajiu. All rights reserved.
//

#import "HeaderView.h"
#import <Masonry/Masonry.h>
#import "MyUILabel.h"
#import <sys/utsname.h>

@implementation HeaderView
{
    int padding;
    int padding1;
    float witdh;
    float height;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        witdh = self.bounds.size.width;
        height = self.bounds.size.height;
        padding = height/9;
        padding1 = height/18;
        [self createView];
    }
    return self;
}

//创建头部view
-(void)createView{
    UIView *view1 = [UIView new];
    [self addSubview:view1];
    
    UIView *view2 = [UIView new];
    UIColor *color = [UIColor colorWithRed:0.45 green:0.53 blue:0.84 alpha:1];
    view2.backgroundColor = color;
    [self addSubview:view2];
    
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top).offset(padding);
        make.size.mas_equalTo(CGSizeMake(height/2, height-padding*2));
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(padding);
        make.right.equalTo(self.mas_right);
        make.size.mas_equalTo(CGSizeMake(witdh-height/2, height-padding*2));
    }];
    
    [self createLeftView:view1];
    [self createRightView:view2];
}

-(void)createLeftView:(UIView *)view1{
    UIImageView *imageView = [UIImageView new];
    [view1 addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"shenme"];
    UILabel *label = [UILabel new];
    [view1 addSubview:label];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view1.mas_top).with.offset(padding1);
        make.left.equalTo(view1.mas_left).with.offset(padding1);
        make.size.mas_equalTo(CGSizeMake(height/2-padding, height/2-padding));
    }];
    
    imageView.layer.cornerRadius = (height/2-padding)/2;
    imageView.layer.masksToBounds = YES;
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(padding);
        make.left.equalTo(view1.mas_left);
        make.right.equalTo(view1.mas_right);
        make.height.mas_equalTo(padding1);
    }];
    
    label.text = @"周芷若";
    label.textColor = [UIColor whiteColor];
    if (witdh <= 320) {
        label.font = [UIFont boldSystemFontOfSize:14];
    } else {
        label.font = [UIFont boldSystemFontOfSize:16];
    }
    label.textAlignment = NSTextAlignmentCenter;
}

-(void)createRightView:(UIView *)view2{
    NSArray *arr = [NSArray arrayWithObjects:@"xuehao", @"banji", @"xuexiao",nil];
    NSArray *arr1 = [NSArray arrayWithObjects:@"学号:9527", @"班级:高古3班", @"学校:上海科技管理学校", nil];
    for (int i=0; i<arr.count; i++) {
        UIView *view = [UIView new];
        [view2 addSubview:view];
        if (i == 0) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(view2.mas_top).with.offset(padding1);
                make.left.equalTo(view2.mas_left).with.offset(padding1);
                make.size.mas_equalTo(CGSizeMake((witdh-height/2)/2, (height-padding*4)/3));
            }];
        } else {
            UIView *image = (UIView *)[self viewWithTag:i];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(image.mas_bottom).with.offset(padding1);
                make.left.equalTo(view2.mas_left).with.offset(padding1);
                make.size.mas_equalTo(CGSizeMake((witdh-height/2)/2, (height-padding*4)/3));
            }];
        }
        view.tag = i+1;
        
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view.mas_top).with.offset(6);
            make.left.equalTo(view.mas_left).offset(-3);
            make.size.mas_equalTo(CGSizeMake((height-padding*4)/3-12, (height-padding*4)/3-12));
        }];
        imageView.image = [UIImage imageNamed:arr[i]];
        
        UILabel *label = [UILabel new];
        [view addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view.mas_top).with.offset(6);
            make.left.equalTo(imageView.mas_right).with.offset(padding1);
            make.size.mas_equalTo(CGSizeMake((witdh-height/2)*2/3-(height-padding*4)/3, (height-padding*4)/3-12));
        }];
        label.text = arr1[i];
        if (witdh <= 320) {
            label.font = [UIFont boldSystemFontOfSize:10];
        } else {
            label.font = [UIFont boldSystemFontOfSize:12];
        }
        label.textColor = [UIColor whiteColor];
    }
    
    UIImageView *imageView1 = [UIImageView new];
    [view2 addSubview:imageView1];
    
    [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view2.mas_top).with.offset(padding1+6);
        make.right.equalTo(view2.mas_right).with.offset(-6);
        make.size.mas_equalTo(CGSizeMake((height-padding*4)/3-12, (height-padding*4)/3-12));
    }];
    imageView1.image = [UIImage imageNamed:@"youjiantou"];
    
    UIView *view3 = [UIView new];
    [view2 addSubview:view3];
    
    UIView *image = (UIView *)[self viewWithTag:3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(view2.mas_right);
        make.bottom.equalTo(view2.mas_bottom);
        make.left.equalTo(image.mas_right);
        make.top.equalTo(imageView1.mas_bottom);
    }];
    
    MyUILabel *label1 = [MyUILabel new];
    [view3 addSubview:label1];
    MyUILabel *label2 = [MyUILabel new];
    [view3 addSubview:label2];
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view3.mas_left);
        make.right.equalTo(label2.mas_left);
        make.bottom.equalTo(view3.mas_bottom).offset(-padding+5);
        make.height.mas_equalTo(((height-padding*4)/3-12)*2);
    }];
    
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label1.mas_right);
        make.right.equalTo(view3.mas_right).offset(-6);
        make.bottom.equalTo(view3.mas_bottom).offset(-padding);
        make.height.mas_equalTo((height-padding*4)/3-12);
    }];
    
    label1.text = @"38.0";
    if (witdh <= 320) {
        label1.font = [UIFont boldSystemFontOfSize:26];
    } else {
        label1.font = [UIFont boldSystemFontOfSize:30];
    }
    label1.textColor = [UIColor whiteColor];
    label1.textAlignment = NSTextAlignmentRight;
    [label1 setVerticalAlignment:VerticalAlignmentBottom];
    label2.text = @"余额";
    if (witdh <= 320) {
        label2.font = [UIFont boldSystemFontOfSize:10];
    } else {
        label2.font = [UIFont boldSystemFontOfSize:12];
    }
    label2.textColor = [UIColor whiteColor];
    [label2 setVerticalAlignment:VerticalAlignmentBottom];
}

@end
