//
//  KBaseViewController.h
//  KBaseLib
//
//  Created by KangC  on 2016. 4. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KBaseView.h"

@interface KBaseViewController : UIViewController

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (nonatomic, strong) KBaseView *view;
#pragma clang diagnostic pop

@property (nonatomic) BOOL isFirstLuanch;

@end
