//
//  LuxuManager.h
//  飞升上神
//
//  Created by 王晓栋 on 2018/1/9.
//  Copyright © 2018年 com.qinqin.www. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LuxuManager : NSObject

+(instancetype)sharedManager;

@property(nonatomic,assign)BOOL isShowAnimation;

@property (nonatomic, strong)NSDictionary    *luxuryDict;

@property (nonatomic, strong)NSMutableArray  *luxuryArray;

@property (nonatomic, strong)UIView          *livingView;

- (void) showLuxuryAnimation;

@end
