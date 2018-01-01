//
//  AnimationNecklaceView.m
// 项链
//
//  Created by 王晓栋 on 2017/6/27.
//  Copyright © 2017年 Jack. All rights reserved.
//

#import "AnimationNecklaceView.h"
#import "UIView+ESShortcut.h"
#import "AnimationModel.h"


@interface AnimationNecklaceView()

@property(nonatomic,strong)AnimationModel *animationModel;

@property(nonatomic,strong)UIImageView *cottonCandyImV;


@end
@implementation AnimationNecklaceView

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
- (void)setMNickName:(NSString *)mNickName {
    UILabel* nameLabel = [[UILabel alloc] init];
    nameLabel.text = mNickName;
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.shadowColor = [UIColor yellowColor];
    [nameLabel sizeToFit];
    nameLabel.center = CGPointMake(self.width / 2, self.height / 2 - 100);
    [self addSubview:nameLabel];
}

- (void)customInit{
    self.userInteractionEnabled = NO;
//    UIImage *image = [[AnimationImageCache shareInstance] getImageWithName:@"loveloll1"];
    UIImage *image = [UIImage imageNamed:@"necklace1"];
    _cottonCandyImV = [[UIImageView alloc]initWithFrame:self.bounds];
    _cottonCandyImV.image = image;
    [self addSubview:_cottonCandyImV];
    ESWeakSelf;
    self.cottonCandyImV.alpha = 0.0;
    [UIView animateWithDuration:1.2 animations:^{
        ESStrongSelf;
        _self.cottonCandyImV.alpha = 1.0;
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        ESStrongSelf;
        _self.animationModel = [[AnimationModel alloc]init];
        _self.animationModel.duration = 3.29;
        _self.animationModel.nameEnd = 90;
        _self.animationModel.imageName = @"necklace";
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

#pragma mark - end
- (void)callBackManager {
    [LuxuManager sharedManager].isShowAnimation = NO;
    [[LuxuManager sharedManager] showLuxuryAnimation];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
