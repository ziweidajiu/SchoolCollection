//
//  RefeshBase.m
//  SchoolCollection
//
//  Created by 紫薇大舅 on 2017/3/9.
//  Copyright © 2017年 ziweidajiu. All rights reserved.
//

#import "RefeshBase.h"

@implementation RefeshBase

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(MJChiBaoZiHeader *)createRefresh{
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingBlock:^{
        self.block1();
    }];
    
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // 隐藏状态
    header.stateLabel.hidden = YES;
    
    // 马上进入刷新状态
    //    [header beginRefreshing];
    
    // 设置header
    return header;
}

-(MJRefreshAutoNormalFooter *)createLoad{
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        self.block2();
    }];
    
    // 设置文字
    [footer setTitle:@"加载更多数据" forState:MJRefreshStateIdle];
    [footer setTitle:@"拼命加载中..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"没有更多数据" forState:MJRefreshStateNoMoreData];
    
    // 设置字体
    footer.stateLabel.font = [UIFont systemFontOfSize:14];
    
    // 设置颜色
    footer.stateLabel.textColor = [UIColor lightGrayColor];
    
    return footer;
    
    //    self.tableView.mj_footer = [MJChiBaoZiFooter2 footerWithRefreshingTarget:self refreshingAction:@selector(loadLastData)];
    //    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}

@end
