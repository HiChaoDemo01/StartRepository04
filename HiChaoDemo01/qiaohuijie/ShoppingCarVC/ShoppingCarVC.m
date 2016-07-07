//
//  ShoppingCarVC.m
//  HiChaoDemo01
//
//  Created by Mac on 16/7/2.
//  Copyright © 2016年 surker. All rights reserved.
//

#import "ShoppingCarVC.h"

@interface ShoppingCarVC ()

@end

@implementation ShoppingCarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cusTitleLab.text=@"我的购物车";
    [self.editOrCameraBtn setTitle:@"编辑" forState:0];
}


@end
