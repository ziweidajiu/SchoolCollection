//
//  MyUILabel.h
//  SchoolCollection
//
//  Created by 紫薇大舅 on 2017/3/8.
//  Copyright © 2017年 ziweidajiu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;
@interface MyUILabel : UILabel
{
@private VerticalAlignment _verticalAlignment;
}
@property (nonatomic) VerticalAlignment verticalAlignment;

@end
