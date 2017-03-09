//
//  RefeshBase.h
//  SchoolCollection
//
//  Created by 紫薇大舅 on 2017/3/9.
//  Copyright © 2017年 ziweidajiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RefeshBase : NSObject

@property (copy) void(^block1)();

@property (copy) void(^block2)();

-(MJChiBaoZiHeader *)createRefresh;

-(MJRefreshAutoNormalFooter *)createLoad;

@end
