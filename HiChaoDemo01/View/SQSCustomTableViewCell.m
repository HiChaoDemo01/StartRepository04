//
//  SQSCustomTableViewCell.m
//  HiChaoDemo01
//
//  Created by Mac on 16/7/6.
//  Copyright © 2016年 surker. All rights reserved.
//

#import "SQSCustomTableViewCell.h"
#define LABELTAG 100
#define  KMainW  ([UIScreen mainScreen].bounds.size.width)/6


@interface SQSCustomTableViewCell ()

{
    UIView *_bgView;
    UILabel *_titleLabel;
    UILabel *_dateLabel;
    UILabel *_classLabel;
    UIImageView *_imageView;
}

@end
@implementation SQSCustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self createView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
    
}


- (void)createView {
    UIView *bgView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, kMainBoundsH/2)];
   
    
    [self.contentView addSubview:bgView];
    
    _bgView = bgView;
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, kMainBoundsW/2, 30)];
    [bgView addSubview:titleLabel];
    _titleLabel = titleLabel;
    
    UILabel *dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(titleLabel.frame), 100, 20)];
    dateLabel.font = [UIFont systemFontOfSize:14];
    [bgView addSubview:dateLabel];
    _dateLabel = dateLabel;
    
    UILabel *classLabel = [[UILabel alloc]initWithFrame:CGRectMake(kMainBoundsW - 80, 10, 80, 40)];
    [bgView addSubview:classLabel];
    _classLabel = classLabel;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(dateLabel.frame), kMainBoundsW, kMainBoundsW*2 / 3)];
    [bgView addSubview:imageView];
    _imageView = imageView;
    
    for (NSInteger i = 0; i < 3; i ++) {
        UIImageView *image = [[UIImageView alloc]init];
        image.frame = CGRectMake(KMainW + (KMainW +20) * i, CGRectGetMaxY(imageView.frame), 30, 30);
        image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",i]];
        [bgView addSubview:image];
        
        UILabel *label = [[UILabel alloc]init];
        label.frame = CGRectMake(CGRectGetMaxX(image.frame), CGRectGetMaxY(imageView.frame), 60, 30);
        label.tag = LABELTAG + i;
        
        [bgView addSubview:label];
        
        
        UIButton *likeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        likeBtn.frame = CGRectMake(250, 333, 150, 28);
        likeBtn.backgroundColor = [UIColor redColor];
        [likeBtn addTarget:self action:@selector(likeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:likeBtn];

        
        
    }
    
//    UIButton *detailBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    detailBtn.frame = CGRectMake(0, 500, kMainBoundsW / (2 / 3), 30);
//    detailBtn.backgroundColor = [UIColor redColor];
//    [detailBtn addTarget:self action:@selector(detailBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [bgView addSubview:detailBtn];
    
    
    
    
}
- (void)solveReuseCell {
    
    [_bgView removeFromSuperview];
    _bgView = nil;
    [self createView];
    
    
    
}


//- (void)detailBtnClick:(UIButton *)sender {
//    
//    
//    
//}

- (void)likeBtnClick:(UIButton *)sender {
    
    NSLog(@"131313");
    
}

- (void)setSpecialModle:(SQSSpeciaComponent *)specialModle {
    
    if (_specialModle != specialModle) {
        
        _specialModle = specialModle;
        
        _titleLabel.text = specialModle.title;
        _dateLabel.text =[NSString stringWithFormat:@"%@.%@.%@",specialModle.year,specialModle.month,specialModle.day];
        _classLabel.text = [NSString stringWithFormat:@"#%@#",specialModle.category];
        
        NSString *picUrl = [[specialModle.picUrl componentsSeparatedByString:@"?"] firstObject];
        [_imageView sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:picUrl] placeholderImage:[UIImage imageNamed:@"AppIcon29x29"] options:SDWebImageRetryFailed progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
        }];
        
        UILabel *leftLabel = [_bgView viewWithTag:LABELTAG];
        leftLabel.text =specialModle.commentCount;
        
        UILabel *midLabel = [_bgView viewWithTag:LABELTAG + 1];
        midLabel.text = specialModle.v;
        
        UILabel *rightLabel = [_bgView viewWithTag:LABELTAG +2];
        rightLabel.text =specialModle.collectionCount;
              
    }
  
    
}


@end
