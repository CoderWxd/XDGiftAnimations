//
//  CATransitionViewController.m
//  飞升上神
//
//  Created by 王晓栋 on 2018/1/25.
//  Copyright © 2018年 com.qinqin.www. All rights reserved.
//

#import "CATransitionViewController.h"

@interface CATransitionViewController ()

@end

@implementation CATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        UIViewController *detailViewController = [[UIViewController alloc] init];
        detailViewController.view.backgroundColor = [UIColor yellowColor];
        
        
        CATransition *animation = [CATransition animation];
        animation.duration = 2.5;
        animation.timingFunction = UIViewAnimationCurveEaseInOut;
        animation.type =  @"oglFlip";
        // animation.subtype = kCATransitionFromBottom;
        //animation.subtype = kCATransitionFromLeft;
        animation.subtype = kCATransitionFromRight;
        [self.view.window.layer addAnimation:animation forKey:nil];
        [self presentViewController:detailViewController animated:NO completion:nil];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [detailViewController dismissViewControllerAnimated:YES completion:nil];
            
        });
    });

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
