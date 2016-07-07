//
//  MatchBaseVC.m
//  HiChaoDemo01
//
//  Created by Mac on 16/7/6.
//  Copyright © 2016年 surker. All rights reserved.
//

#import "MatchBaseVC.h"

@interface MatchBaseVC ()
{
    UILabel *_label;
    UIButton *_matchBtn;
    UIButton *_specialBtn;
}

@end

@implementation MatchBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.hidden = YES    ;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createView];
    
       
    
}

- (void)createView {
    UIView *bgView = [[UIView alloc]init];
    bgView.frame = CGRectMake(0, 0, kMainBoundsW, 60);
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    UIButton *matchBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    matchBtn.frame =CGRectMake(120, 15, 40, 30);

    [matchBtn setTitle:@"搭配" forState:UIControlStateNormal];
    [matchBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [matchBtn addTarget:self action:@selector(matchBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:matchBtn];
    _matchBtn = matchBtn;
    
    UIButton *specialBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    specialBtn.frame =CGRectMake(260, 15, 40, 30);
    
    [specialBtn setTitle:@"专题" forState:UIControlStateNormal];
    [specialBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [specialBtn addTarget:self action:@selector(specialBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:specialBtn];
    _specialBtn = specialBtn;

    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 50, 60, 5)];
    label.backgroundColor = [UIColor redColor];
    [bgView addSubview:label];
    _label = label;
    
    UIButton *messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    messageBtn.frame = CGRectMake(380, 20, 25, 25);
    [messageBtn setBackgroundImage:[UIImage imageNamed:@"button_head_massage"] forState:UIControlStateNormal];
    [messageBtn addTarget:self action:@selector(messageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [bgView addSubview:messageBtn];
    
    
}

- (void)matchBtnClick:(UIButton *)sender {
    [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_specialBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    _label.center = CGPointMake(sender.center.x, 52.5);
    
    if (self.matchCallBack) {
        self.matchCallBack();
    }
    
    
    
}


- (void)specialBtnClick:(UIButton *)sender {
    [_matchBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _label.center = CGPointMake(sender.center.x, 52.5);
    
    if (self.specialCallBack) {
        self.specialCallBack();
    }
  
    
}




- (void)messageBtnClick:(UIButton *)sender {
    
    
    
    
    
}



- (void)matchCallBackBtnClick:(matchBlock)callBack
{
   
    self.matchCallBack = callBack;
    
    
    
}
- (void)specialCallBackBtnClick:(specialBlock)callBack {
    
   
    
    self.specialCallBack = callBack;
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
