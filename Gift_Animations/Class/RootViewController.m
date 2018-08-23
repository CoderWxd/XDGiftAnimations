//
//  RootViewController.m
//  飞升上神
//
//  Created by 王晓栋 on 2018/1/25.
//  Copyright © 2018年 com.qinqin.www. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"
#import "AnimationsViewController.h"
#import "CATransitionViewController.h"
@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"GIF_Demo";
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.dataSource = [NSMutableArray arrayWithObjects:
                       @"礼物动画",
                       @"转场动画",
                       nil];
    [self.tableView reloadData];
    [self testUrl];
    
}
- (void)testUrl {
    NSString *path = @"https://www.baidu.com/";
    NSString *path2 = @"http://fanyi.baidu.com/translate?query=#auto/zh/";
    NSString *path3 = @"http://fanyi.baidu.com/translate?query=#zh/en/测试";
    //    NSString *_path3 = [path3 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //    NSString *charactersToEscape = @"?!@#$^&%*+,:;='\"`<>()[]{}/\\| ";
    //    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:charactersToEscape];
    //  path3 =  [path3 stringByAddingPercentEncodingWithAllowedCharacters:set];
    NSURL *url = [NSURL URLWithString:path];
    NSURL *url2 = [NSURL URLWithString:path2];
    NSURL *url3 = [NSURL URLWithString:path3];
    
    NSLog(@"%@", url);
    NSLog(@"%@", url2);
    NSLog(@"%@", url3);
    
    path3= @"https://www.jianshu.com/p/bdad15c367ca";
    NSCharacterSet *allowedCharacters = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *encodedUrl = [path3 stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
    NSLog(@"\n%@\n%@",url3,encodedUrl);
    
}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [self.dataSource objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *text = [self.dataSource objectAtIndex:indexPath.row];
    if ([text isEqualToString:@"礼物动画"]) {
        AnimationsViewController *openCellVc = [[AnimationsViewController alloc] init];
        [self.navigationController pushViewController:openCellVc animated:YES];
    }else if ([text isEqualToString:@"转场动画"]){
        CATransitionViewController *cATransitionVc = [[CATransitionViewController alloc] init];
        [self.navigationController pushViewController:cATransitionVc animated:YES];
    }
    
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
