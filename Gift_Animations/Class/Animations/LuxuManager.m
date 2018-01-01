//
//  LuxuManager.m
//  飞升上神
//
//  Created by 王晓栋 on 2018/1/9.
//  Copyright © 2018年 com.qinqin.www. All rights reserved.
//

#import "LuxuManager.h"
#import "SoaringGodOnAnimation.h"
#import "AnimationRingView.h"
#import "AnimationChestnutView.h"
#import "AnimationCreamView.h"
#import "AnimationCottonCaView.h"
#import "AnimationFerrisWheelView.h"
#import "AnimationNecklaceView.h"
#import "AnimationLoveLollView.h"
#import "AnimationPerfumeView.h"

#import "PerfumeView.h"
#import "CottonCaView.h"
#import "NecklaceView.h"

#import "AnimationBalloonView.h"
#import "AnimationMapWoView.h"
#import "AnimationFlyWingView.h"
#import "AnimationBeautFaeryView.h"
#import "AnimationCrystalBallView.h"
#import "AnimationMeteorView.h"
#import "AnimationBlueLoveView.h"
#import "AnimationMerryChristmasView.h"
#import "AnimationAngelView.h"
#import "AnimationBoatView.h"
#import "AnimationCrownView.h"
#import "AnimationCrystalShoesView.h"
#import "AnimationDressView.h"
#import "AnimationFireworksView.h"
#import "AnimationFlowerView.h"
#import "AnimationCastleView.h"
#import "HappyYearView.h"

@implementation LuxuManager

static id _manager;
+(instancetype)sharedManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[[self class] alloc] init];
    });
    return _manager;
}
- (void)setLuxuryDict:(NSDictionary *)luxuryDict{
    _luxuryDict = luxuryDict;
    
    if (!_luxuryArray) {
        _luxuryArray = [NSMutableArray array];
    }
    [_luxuryArray addObject:luxuryDict];
    [self showLuxuryAnimation];
}
- (void)showLuxuryAnimation{
    if (_isShowAnimation) {
        return;
    }
    
    if ([LuxuManager sharedManager].luxuryArray && [LuxuManager sharedManager].luxuryArray.count > 0) {
        _isShowAnimation = YES;
        NSDictionary *luxuDict  = [[LuxuManager sharedManager].luxuryArray objectAtIndex:0];
        [[LuxuManager sharedManager].luxuryArray removeObjectAtIndex:0];

        NSString *gif_id = [luxuDict valueForKey:@"gif_id"];
        
        if ([gif_id intValue] == SoaringGod_gif) {
            //飞升上神
            SoaringGodOnAnimation *soaringGodOnAnimation = [[SoaringGodOnAnimation alloc]initWithFrame:[UIScreen mainScreen].bounds];
            [_livingView addSubview:soaringGodOnAnimation];
            [_livingView insertSubview:soaringGodOnAnimation atIndex:0];
            
        }else if ([gif_id intValue] == Ring_gif){
            //戒指
            AnimationRingView *ringView = [[AnimationRingView alloc]initWithFrame:[UIScreen mainScreen].bounds];
            [_livingView addSubview:ringView];
        }
        else if ([gif_id intValue] == Chestnu_gif){
            //栗子
            AnimationChestnutView *ringView = [[AnimationChestnutView alloc]initWithFrame:[UIScreen mainScreen].bounds];
            [_livingView addSubview:ringView];
        }else if ([gif_id intValue] == CottonCa_gif){
            //棉花糖
                        AnimationCottonCaView *cottonCaView = [[AnimationCottonCaView alloc]initWithFrame:[UIScreen mainScreen].bounds];
                        [_livingView addSubview:cottonCaView];

            
        }else if ([gif_id intValue] == FerrisWheel_gif){
            // 摩天轮
                    AnimationFerrisWheelView *ferrisWheelView = [[AnimationFerrisWheelView alloc]initWithFrame:[UIScreen mainScreen].bounds];
                    [_livingView addSubview:ferrisWheelView];
            
            
        }else if ([gif_id intValue] == Cream_gif){
            
            //冰淇淋
                                AnimationCreamView *creamView = [[AnimationCreamView alloc]initWithFrame:[UIScreen mainScreen].bounds];
                                [_livingView addSubview:creamView];

            
        }else if ([gif_id intValue] == ME_Necklace_gif){
            // 项链
            
                    AnimationNecklaceView *creamView = [[AnimationNecklaceView alloc]initWithFrame:[UIScreen mainScreen].bounds];
                    [_livingView addSubview:creamView];

            
        }else if ([gif_id intValue] == LoveLoll_gif){
            
            //  爱心棒棒糖
                AnimationLoveLollView *creamView = [[AnimationLoveLollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
                [_livingView addSubview:creamView];

            
        }else if ([gif_id intValue] == Perfume_gif){
            //  香水 Perfume_gif
                    AnimationPerfumeView *creamView = [[AnimationPerfumeView alloc]initWithFrame:[UIScreen mainScreen].bounds];
                    [_livingView addSubview:creamView];

        }else if ([gif_id intValue] == ME_Chestnut_gif){
            //栗子
                    AnimationChestnutView *ringView = [[AnimationChestnutView alloc]initWithFrame:[UIScreen mainScreen].bounds];
                    [_livingView addSubview:ringView];

            
        }else if ([gif_id intValue] == ME_Perfume_gif){
            //  香水
                PerfumeView *creamView = [[PerfumeView alloc]initWithFrame:[UIScreen mainScreen].bounds];
                [_livingView addSubview:creamView];
            
        }else if ([gif_id intValue] == ME_CottonCaV_gif){
            //棉花糖
                CottonCaView *cottonCaView = [[CottonCaView alloc]initWithFrame:[UIScreen mainScreen].bounds];
                [_livingView addSubview:cottonCaView];

        }else if ([gif_id intValue] == Necklace_gif){
            //项链
                    NecklaceView *cottonCaView = [[NecklaceView alloc]initWithFrame:[UIScreen mainScreen].bounds];
                    [_livingView addSubview:cottonCaView];
        }else if ([gif_id intValue] == Balloon_gif){
            //气球 520
                AnimationBalloonView *balloonView = [[AnimationBalloonView alloc]initWithFrame:[UIScreen mainScreen].bounds];
                [_livingView addSubview:balloonView];
            
        }else if ([gif_id intValue] == MapWo_gif){
            
            //枫林晚
                    AnimationMapWoView *mapWoView = [[AnimationMapWoView alloc]initWithFrame:[UIScreen mainScreen].bounds];
                    [_livingView addSubview:mapWoView];
            
        }else if ([gif_id intValue] == FlyWing_gif){
            //比翼双飞
                AnimationFlyWingView *flyWingView = [[AnimationFlyWingView alloc]initWithFrame:[UIScreen mainScreen].bounds];
                [_livingView addSubview:flyWingView];
            
        }else if ([gif_id intValue] == BeautFaery_gif){
            //  花仙子礼服 
                AnimationBeautFaeryView *beautFaeryView = [[AnimationBeautFaeryView alloc]initWithFrame:[UIScreen mainScreen].bounds];
                [_livingView addSubview:beautFaeryView];

            
        }else if ([gif_id intValue] == CrystalBall_gif){
            //  梦幻水晶球
                AnimationCrystalBallView *crystalBallView = [[AnimationCrystalBallView alloc]initWithFrame:[UIScreen mainScreen].bounds];
                [_livingView addSubview:crystalBallView];
        }else if ([gif_id intValue] == Meteor_gif){
            //流星雨
                AnimationMeteorView *meteorView = [[AnimationMeteorView alloc]initWithFrame:[UIScreen mainScreen].bounds];
                [_livingView addSubview:meteorView];
            
        }else if ([gif_id intValue] == BlueLove_gif){
      
            //蓝色之恋
                AnimationBlueLoveView *blueLoveView = [[AnimationBlueLoveView alloc]initWithFrame:[UIScreen mainScreen].bounds];
                [_livingView addSubview:blueLoveView];
        }
        else if ([gif_id intValue] == MerryChristmas_gif){
            //圣诞礼物
                AnimationMerryChristmasView *merryChristmasView = [[AnimationMerryChristmasView alloc]initWithFrame:[UIScreen mainScreen].bounds];
                [_livingView addSubview:merryChristmasView];
        } else if ([gif_id intValue] == Angel_gif){
            //浮空岛
            AnimationAngelView *angelView = [[AnimationAngelView alloc]initWithFrame:[UIScreen mainScreen].bounds];
            [_livingView addSubview:angelView];
        }
        else if ([gif_id intValue] == BoatView_gif){
            //游艇
            AnimationBoatView *angelView = [[AnimationBoatView alloc]initWithFrame:[UIScreen mainScreen].bounds];
            [_livingView addSubview:angelView];
        }else if ([gif_id intValue] == CastleView_gif){
            //城堡
            AnimationCastleView *angelView = [[AnimationCastleView alloc]initWithFrame:[UIScreen mainScreen].bounds];
            [_livingView addSubview:angelView];
        }
        
        else if ([gif_id intValue] == CrownView_gif){
            //冠
            AnimationCrownView *angelView = [[AnimationCrownView alloc]initWithFrame:[UIScreen mainScreen].bounds];
            [_livingView addSubview:angelView];
        }else if ([gif_id intValue] == CrystalShoesView_gif){
            //水晶鞋
            AnimationCrystalShoesView *angelView = [[AnimationCrystalShoesView alloc]initWithFrame:[UIScreen mainScreen].bounds];
            [_livingView addSubview:angelView];
        }else if ([gif_id intValue] == DressView_gif){
            //婚纱
            AnimationDressView *angelView = [[AnimationDressView alloc]initWithFrame:[UIScreen mainScreen].bounds];
            [_livingView addSubview:angelView];
        }else if ([gif_id intValue] == FireworksView_gif){
            //烟花
            AnimationFireworksView* fireworksView = [[AnimationFireworksView alloc] initWithFrame:CGRectMake(ScreenWidth / 2 - const_fireworks_height / 2, ScreenHeight * (1 - 1.0 / 5) - const_fireworks_height , const_fireworks_height, const_fireworks_height)];
            [_livingView addSubview:fireworksView];
        }else if ([gif_id intValue] == FlowerView_gif){
            //花
            AnimationFlowerView *angelView = [[AnimationFlowerView alloc]initWithFrame:[UIScreen mainScreen].bounds];
            [_livingView addSubview:angelView];
        }else if ([gif_id intValue] == HappyYear_gif){
            //新年快乐
            HappyYearView *angelView = [[HappyYearView alloc]initWithFrame:[UIScreen mainScreen].bounds];
            [_livingView addSubview:angelView];
        }else{

            _isShowAnimation = NO;
        }
        }else{
        _isShowAnimation = NO;
        
    }
}
@end
