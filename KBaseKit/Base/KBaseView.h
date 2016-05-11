//
//  KBaseView.h
//  KBaseLib
//
//  Created by KangC  on 2016. 4. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+KAdditional.h"

@interface KBaseView : UIView

+ (instancetype)loadNib;
+ (instancetype)loadNibWithIndex:(NSInteger)index;

@end
