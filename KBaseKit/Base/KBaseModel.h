//
//  KBaseModel.h
//  KBaseLib
//
//  Created by KangC  on 2016. 4. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KBaseModel : NSObject

/*! 프로퍼티 변수들의 값을 딕셔너리 형태로 변환해 반환한다. */
- (NSDictionary *)convertDictionary;

/*! 프로퍼티 변수들의 값을 로그로 출력한다 */
- (void)printPropertys;

@end
