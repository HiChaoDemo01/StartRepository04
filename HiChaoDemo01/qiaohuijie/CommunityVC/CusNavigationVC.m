//
//  CusNavigationVC.m
//  HiChaoDemo01
//
//  Created by Mac on 16/7/6.
//  Copyright © 2016年 surker. All rights reserved.
//

#import "CusNavigationVC.h"

@interface CusNavigationVC ()

@end

@implementation CusNavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    [self createView];
    
}
-(void)createView
{
    UIView *topView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, 64)];
    topView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:topView];
    
    UILabel *titleLab=[UILabel new];
    titleLab.bounds=CGRectMake(0, 0, 100, 44);
    titleLab.center=CGPointMake(kMainBoundsW/2, topView.center.y+10);
    titleLab.textAlignment=NSTextAlignmentCenter;
    [topView addSubview:titleLab];
    _cusTitleLab=titleLab;
    
    _editOrCameraBtn=[UIButton buttonWithType:0];
    _editOrCameraBtn.bounds=CGRectMake(0, 0, 30, 25);
    _editOrCameraBtn.center=CGPointMake(kMainBoundsW-85, titleLab.center.y);
    [_editOrCameraBtn setTitleColor:[UIColor grayColor] forState:0];
    _editOrCameraBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [topView addSubview:_editOrCameraBtn];
    
    UIButton *messageBtn=[UIButton buttonWithType:0];
    messageBtn.bounds=CGRectMake(0, 0, 25, 25);
    messageBtn.center=CGPointMake(kMainBoundsW-35, _editOrCameraBtn.center.y);
    [messageBtn setBackgroundImage:[UIImage imageNamed:@"button_head_massage"] forState:UIControlStateNormal];
    [topView addSubview:messageBtn];
    
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
