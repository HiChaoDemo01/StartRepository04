//
//  BaseVC.m
//  HiChaoDemo01
//
//  Created by Mac on 16/7/6.
//  Copyright © 2016年 surker. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC ()

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.hidden = YES    ;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createView];
    
    
    
    
}

- (void)createView {
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, 60)];
    bgView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:bgView];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(20,18, 15, 30);
    [leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"bottom_head_sort"] forState:UIControlStateNormal];
    [bgView addSubview:leftBtn];
    
    UILabel *leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 45, 40, 15)];
    leftLabel.text = @"分类";
    leftLabel.font = [UIFont systemFontOfSize:10];
    leftLabel.textColor = [UIColor grayColor];
    [bgView addSubview:leftLabel];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(350, 18, 15, 30);
    [rightBtn addTarget:self action:@selector(rightBtnclick:) forControlEvents:UIControlStateNormal];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"button_head_massage"] forState:UIControlStateNormal];
    [bgView addSubview:rightBtn];
    
    UILabel *rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(350, 45, 40, 15)];
    rightLabel.text = @"消息";
    rightLabel.font = [UIFont systemFontOfSize:10];
    rightLabel.textColor = [UIColor grayColor];
    [bgView addSubview:rightLabel];
       
}

- (void)leftBtnClick:(UIButton *)sender {
    
    
    
    
    
}


- (void)rightBtnclick:(UIButton *)sender {
    
    
    
    
    
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
