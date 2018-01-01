//
//  AnimationPerfumeView.m
//  飞升上神
//
//  Created by 王晓栋 on 2017/6/28.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "AnimationPerfumeView.h"
#import "UIView+ESShortcut.h"
#import "AnimationModel.h"

@interface AnimationPerfumeView()

@property(nonatomic,strong)AnimationModel *animationModel;

@property(nonatomic,strong)UIImageView *cottonCandyImV;
@end

@implementation AnimationPerfumeView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self customInit];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self customInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self customInit];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"dealloc");
}

- (void)customInit{
    self.userInteractionEnabled = NO;
    
    UIImage *image = [UIImage imageNamed:@"perfume1"];
    _cottonCandyImV = [[UIImageView alloc]initWithFrame:self.bounds];
    _cottonCandyImV.image = image;
    [self addSubview:_cottonCandyImV];
    ESWeakSelf;
    self.cottonCandyImV.alpha = 0.0;
    [UIView animateWithDuration:1.2 animations:^{
        ESStrongSelf;
        _self.cottonCandyImV.alpha = 1.0;
    }completion:^(BOOL finished) {
        ESStrongSelf;
        _self.cottonCandyImV.alpha =0.0;

    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        ESStrongSelf;
        _self.animationModel = [[AnimationModel alloc]init];
        _self.animationModel.duration = 3.29;
        _self.animationModel.nameEnd = 86;
        _self.animationModel.imageName = @"perfume";
        _self.animationModel.delayDuration = 0;
        _self.animationModel.animationFrame = [UIScreen mainScreen].bounds;
        _self.animationModel.superView = _self;
        [_self.animationModel runQueue];
        _self.animationModel.animationStopBlock = ^(AnimationModel *model){
            model.animationView.alpha = 1.0;
            [UIView animateWithDuration:2.0 animations:^{
                ESStrongSelf;
                model.animationView.alpha = 0.0;
                _self.cottonCandyImV.alpha = 0.0;
            } completion:^(BOOL finished) {
                ESStrongSelf
                model.animationView.image = nil;
                [model.animationView removeFromSuperview];
                [model.superView removeFromSuperview];
                model.superView = nil;
                [_self.cottonCandyImV removeFromSuperview];
                _self.cottonCandyImV = nil;
                [_self callBackManager];
                [_self removeFromSuperview];
                _self = nil;
            }];
            
        };
    });
    
}
- (void)callBackManager {
    [LuxuManager sharedManager].isShowAnimation = NO;
    [[LuxuManager sharedManager] showLuxuryAnimation];
}
@end
