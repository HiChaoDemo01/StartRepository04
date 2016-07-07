//
//  QHJCusTableViewCell.m
//  HiChaoDemo01
//
//  Created by Mac on 16/7/5.
//  Copyright © 2016年 surker. All rights reserved.
//

#import "QHJCusTableViewCell.h"

@interface QHJCusTableViewCell ()<UIScrollViewDelegate>
{
    CGFloat cellHeight;
    CGFloat scrollOffset;
}
@property(strong,nonatomic)UIView *bgView;
@property(strong,nonatomic)UIScrollView *picsScroll,*starImgScroll;
@property(strong,nonatomic)UIPageControl *pageControl;
@end

@implementation QHJCusTableViewCell

-(void)createView
{
    cellHeight=0.0f;
    scrollOffset=0.0f;
    //cell上的背景view和用户头像
    _bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, self.contentView.height-10)];
    [self.contentView addSubview:_bgView];
if (self.model.pics) {
    
    UIImageView *userPic=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 34, 34)];
    userPic.layer.cornerRadius=17;
    userPic.layer.masksToBounds=YES;
    [userPic sd_setImageWithURL:[NSURL URLWithString:self.model.avatarModel.userAvatar]];
    [_bgView addSubview:userPic];
    //用户名lab
    UILabel *nameLab=[[UILabel alloc]initWithFrame:CGRectMake(50, 10, 80, 20)];
    nameLab.text=self.model.userName;
    nameLab.font=[UIFont systemFontOfSize:12];
    [_bgView addSubview:nameLab];
    //发布时间lab
    UILabel *timeLab=[[UILabel alloc]initWithFrame:CGRectMake(50, 30, 80, 15)];
    timeLab.textColor=[UIColor grayColor];
    timeLab.font=[UIFont systemFontOfSize:10];
    timeLab.text=self.model.datatime;
    [_bgView addSubview:timeLab];
    //关注button
    UIButton *attentionBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    attentionBtn.center=CGPointMake(kMainBoundsW-10-35, userPic.center.y);
    attentionBtn.bounds=CGRectMake(0, 0, 70, 30);
    attentionBtn.backgroundColor=[UIColor colorWithRed:1 green:0 blue:102/255.0 alpha:1];
    [attentionBtn setTitle:@"+关注" forState:UIControlStateNormal];
    attentionBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    attentionBtn.layer.cornerRadius=5;
    attentionBtn.layer.masksToBounds=YES;
    [_bgView addSubview:attentionBtn];
    
    UIScrollView *picsScroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, attentionBtn.frame.origin.y+attentionBtn.size.height+10, kMainBoundsW, 400)];
    for (int i=0; i<self.model.pics.count; i++) {
        UIImageView *scrollImg=[UIImageView new];
        [scrollImg sd_setImageWithURL:[NSURL URLWithString:self.model.pics[i]]];
        scrollImg.frame=CGRectMake(kMainBoundsW*i, 0, kMainBoundsW, 400);
        [picsScroll addSubview:scrollImg];
    }
    picsScroll.contentSize=CGSizeMake(kMainBoundsW*self.model.pics.count, 400);
    picsScroll.pagingEnabled=YES;
    picsScroll.delegate=self;
    [_bgView addSubview:picsScroll];
    _picsScroll=picsScroll;
    
    if (self.model.pics.count>1) {
        UIPageControl *pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(picsScroll.frame.origin.x+picsScroll.size.width-50, picsScroll.frame.origin.y+picsScroll.frame.size.height-40, 50, 40)];
        pageControl.numberOfPages=self.model.pics.count;
        pageControl.currentPageIndicatorTintColor=[UIColor redColor];
        [_bgView addSubview:pageControl];
        _pageControl=pageControl;
    }
    
    UIButton *supportBtn=[UIButton buttonWithType:0];
    supportBtn.center=CGPointMake(_picsScroll.center.x, _picsScroll.frame.origin.y+_picsScroll.size.height-2);
    supportBtn.bounds=CGRectMake(0, 0, 50, 50);
    supportBtn.layer.cornerRadius=25;
    supportBtn.clipsToBounds=YES;
    supportBtn.backgroundColor=[UIColor whiteColor];
    [supportBtn addTarget:self action:@selector(supportBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [supportBtn setBackgroundImage:[UIImage imageNamed:@"bottom_like_button"] forState:UIControlStateNormal];
    [supportBtn setBackgroundImage:[UIImage imageNamed:@"bottom_like_button_on"] forState:UIControlStateSelected];
    [_bgView addSubview:supportBtn];
    
    UILabel *contentLab=[UILabel new];
    contentLab.numberOfLines=0;
    contentLab.text=self.model.content;
    contentLab.font=[UIFont systemFontOfSize:15];
    CGSize size=[contentLab sizeThatFits:CGSizeMake(kMainBoundsW, 0)];
    if (size.height<=100) {
        contentLab.frame=CGRectMake(10, picsScroll.frame.origin.y+picsScroll.size.height+10, kMainBoundsW, size.height);
    }
    else
    {
        contentLab.frame=CGRectMake(10, picsScroll.frame.origin.y+picsScroll.size.height+10, kMainBoundsW, 100);
    }
    [_bgView addSubview:contentLab];
    
    UILabel *tagLab=[[UILabel alloc]initWithFrame:CGRectMake(10, contentLab.frame.origin.y+contentLab.size.height+5, 30, 20)];
    tagLab.text=@"标签";
    tagLab.textColor=[UIColor grayColor];
    tagLab.font=[UIFont systemFontOfSize:13];
    [_bgView addSubview:tagLab];
    
    UILabel *tag=[[UILabel alloc]initWithFrame:CGRectMake(40, tagLab.frame.origin.y, kMainBoundsW-50, 20)];
    NSMutableString *tagsStr=[NSMutableString new];
    for (int i=0; i<self.model.tags.count; i++) {
        CommunityTagsModel *tagsModel=self.model.tags[i];
        [tagsStr appendString:[NSString stringWithFormat:@"    #%@",tagsModel.category]];
    }
    tag.text=tagsStr;
    [_bgView addSubview:tag];
    tag.font=[UIFont systemFontOfSize:13];
    tag.textColor=[UIColor colorWithRed:1 green:0 blue:102/255.0 alpha:1];
    cellHeight=tag.frame.origin.y+tag.size.height;
    
    if (self.model.users.count>0) {
        for (int i=0; i<self.model.users.count; i++) {
            CommunityHeadPicModel *headerPicModel=self.model.users[i];
            UIImageView *usersImg=[[UIImageView alloc]initWithFrame:CGRectMake(10+(34+8)*i, tag.frame.origin.y+tag.size.height+10, 34, 34)];
            [usersImg sd_setImageWithURL:[NSURL URLWithString:headerPicModel.userAvatar]];
            usersImg.layer.cornerRadius=17;
            usersImg.clipsToBounds=YES;
            [_bgView addSubview:usersImg];
            cellHeight=usersImg.frame.origin.y+34;
        }
    }
    
    /***********评论******/
    for (int i=0; i<self.model.comments.count; i++) {
        CommunityCommentsModel *commentsModel=self.model.comments[i];
        NSMutableAttributedString *str=[[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@:%@",commentsModel.username,commentsModel.content]];
        [str setAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} range:NSMakeRange(0, commentsModel.username.length+1)];
        UILabel *commentLab=[UILabel new];
        commentLab.font=[UIFont systemFontOfSize:13];
        commentLab.numberOfLines=0;
        commentLab.attributedText=str;
        CGSize size=[commentLab sizeThatFits:CGSizeMake(kMainBoundsW-20, 20)];
        commentLab.frame=CGRectMake(10, cellHeight+10, kMainBoundsW-20, size.height);
        cellHeight=commentLab.frame.origin.y+commentLab.size.height;
        [_bgView addSubview:commentLab];
        if (i==2) {
            UILabel *checkMoreLab=[[UILabel alloc]initWithFrame:CGRectMake(10, cellHeight+10, 100, 20)];
            checkMoreLab.font=[UIFont systemFontOfSize:14];
            checkMoreLab.textColor=[UIColor grayColor];
            checkMoreLab.text=@"查看更多评论";
            [_bgView addSubview:checkMoreLab];
            cellHeight=checkMoreLab.frame.origin.y+checkMoreLab.size.height;
        }
    }
    UIView *separateLine=[[UIView alloc]initWithFrame:CGRectMake(10, cellHeight+15, kMainBoundsW-20, 1)];
    separateLine.backgroundColor=[UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:1];
    [_bgView addSubview:separateLine];
    UIView *verticalSeparateLine=[[UIView alloc]initWithFrame:CGRectMake(kMainBoundsW/2, cellHeight+23, 1, 25)];
    verticalSeparateLine.backgroundColor=[UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:1];
    [_bgView addSubview:verticalSeparateLine];
        
    UIImageView *commentIcon=[[UIImageView alloc]initWithFrame:CGRectMake(kMainBoundsW/4-18, cellHeight+25, 15, 15)];
    commentIcon.image=[UIImage imageNamed:@"icon_bbs_titlebar"];
    [_bgView addSubview:commentIcon];
    UILabel *commentCountLab=[UILabel new];
    
    commentCountLab.center=CGPointMake(commentIcon.center.x+33, commentIcon.center.y);
    commentCountLab.font=[UIFont systemFontOfSize:14];
    commentCountLab.textColor=[UIColor grayColor];
    commentCountLab.bounds=CGRectMake(0, 0, 40, 20);
    commentCountLab.text=self.model.commentCount;
    [_bgView addSubview:commentCountLab];
    
    UIButton *shareBtn=[UIButton buttonWithType:0];
    shareBtn.bounds=CGRectMake(0, 0, kMainBoundsW/2, 40);
    shareBtn.center=CGPointMake(kMainBoundsW/4*3, commentCountLab.center.y);
    [shareBtn setTitle:@"分享" forState:UIControlStateNormal];
    shareBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [shareBtn setTitleColor:[UIColor grayColor] forState:0];
    [_bgView addSubview:shareBtn];
    
    cellHeight=verticalSeparateLine.frame.origin.y+verticalSeparateLine.size.height+8;
}
    
    if ([self.model.componentType isEqualToString:@"ForumFocusUserCell"]) {
        UIScrollView *starImgScroll=[[UIScrollView alloc]init];
        starImgScroll.center=CGPointMake(kMainBoundsW/2, 75);
        starImgScroll.bounds=CGRectMake(0, 0, kMainBoundsW, 150);
        starImgScroll.clipsToBounds=NO;
        starImgScroll.showsHorizontalScrollIndicator=NO;
        starImgScroll.contentSize=CGSizeMake(kMainBoundsW/2*(self.model.focus_users.count+1), 150);
        starImgScroll.delegate=self;
        starImgScroll.pagingEnabled=YES;
        _starImgScroll=starImgScroll;
        cellHeight=starImgScroll.size.height;
        [_bgView addSubview:starImgScroll];
        
        UIScrollView *starDesriptionScroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, cellHeight, kMainBoundsW, 100)];
        [_bgView addSubview:starDesriptionScroll];
        starDesriptionScroll.contentSize=CGSizeMake(kMainBoundsW*self.model.focus_users.count, 100);
        starDesriptionScroll.showsHorizontalScrollIndicator=NO;
        starDesriptionScroll.pagingEnabled=YES;
        cellHeight=starDesriptionScroll.frame.origin.y+starDesriptionScroll.size.height;
        for (int i=0; i<self.model.focus_users.count; i++) {
            UIImageView *starImg=[[UIImageView alloc]init];
            starImg.center=CGPointMake(kMainBoundsW/2*(i+1), 80);
            starImg.bounds=CGRectMake(0, 0, 100, 100);
            starImg.layer.cornerRadius=50;
            starImg.clipsToBounds=YES;
            StarModel *starModel=self.model.focus_users[i];
            [starImg sd_setImageWithURL:[NSURL URLWithString:starModel.picUrl]];
            [starImgScroll addSubview:starImg];
            
            UILabel *starNameLab=[[UILabel alloc]init];
            starNameLab.center=CGPointMake(kMainBoundsW/2+kMainBoundsW*i, 20);
            starNameLab.bounds=CGRectMake(0, 0, 100, 30);
            starNameLab.text=starModel.title;
            starNameLab.textAlignment=NSTextAlignmentCenter;
            starNameLab.font=[UIFont systemFontOfSize:15];
            [starDesriptionScroll addSubview:starNameLab];
            
            UILabel *starDescriptionLab=[[UILabel alloc]init];
            starDescriptionLab.font=[UIFont systemFontOfSize:14];
            starDescriptionLab.textColor=[UIColor grayColor];
            starDescriptionLab.numberOfLines=0;
            starDescriptionLab.textAlignment=NSTextAlignmentCenter;
            starDescriptionLab.text=starModel.starDescription;
            CGSize size=[starDescriptionLab sizeThatFits:CGSizeMake(200, 0)];
            starDescriptionLab.frame=CGRectMake(kMainBoundsW/2+kMainBoundsW*i-100, 30, 200, size.height);
            [starDesriptionScroll addSubview:starDescriptionLab];
            
        }
        UIButton *attentionBtn=[UIButton buttonWithType:0];
        attentionBtn.center=CGPointMake(kMainBoundsW/2,130);
        attentionBtn.bounds=CGRectMake(0, 0, 80, 30);
        [attentionBtn setBackgroundColor:[UIColor colorWithRed:1 green:0 blue:102/255.0 alpha:1]];
        [attentionBtn setTitle:@"+关注" forState:0];
        attentionBtn.titleLabel.font=[UIFont systemFontOfSize:14];
        attentionBtn.layer.cornerRadius=15;
        attentionBtn.clipsToBounds=YES;
        [_bgView addSubview:attentionBtn];                    

    }
    if ([self.model.componentType isEqualToString:@"ForumStarUserCell"]) {

        UIScrollView *favouriteScroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, 180)];
        favouriteScroll.showsHorizontalScrollIndicator=NO;
        favouriteScroll.pagingEnabled=YES;
        [_bgView addSubview:favouriteScroll];
        for (int i =0; i<self.model.focus_users.count; i++) {
            StarModel *starModel=self.model.focus_users[i];
            UIImageView *favouriteImg=[[UIImageView alloc]initWithFrame:CGRectMake(30+(30+100)*i, 20, 100, 100)];
            [favouriteImg sd_setImageWithURL:[NSURL URLWithString:starModel.picUrl]];
            favouriteImg.layer.cornerRadius=50;
            favouriteImg.layer.masksToBounds=YES;
            [favouriteScroll addSubview:favouriteImg];
            
            UILabel *nameLab=[[UILabel alloc]init];
            nameLab.center=CGPointMake(favouriteImg.center.x, favouriteImg.frame.origin.y+favouriteImg.size.height+15);
            nameLab.bounds=CGRectMake(0, 0, 100, 20);
            nameLab.font=[UIFont systemFontOfSize:15];
            nameLab.textAlignment=NSTextAlignmentCenter;
            [favouriteScroll addSubview:nameLab];
            nameLab.text=starModel.title;
            
            UILabel *focusCountLab=[[UILabel alloc]init];
            focusCountLab.center=CGPointMake(nameLab.center.x, nameLab.frame.origin.y+nameLab.size.height+10);
            focusCountLab.bounds=CGRectMake(0, 0, 100, 20);
            focusCountLab.textAlignment=NSTextAlignmentCenter;
            focusCountLab.font=[UIFont systemFontOfSize:11];
            focusCountLab.textColor=[UIColor grayColor];
            focusCountLab.text=[NSString stringWithFormat:@"粉丝数：%@",starModel.focusCount];
            [favouriteScroll addSubview:focusCountLab];
        }
        favouriteScroll.contentSize=CGSizeMake(30+self.model.focus_users.count*130, 180);
//        cellHeight=favouriteScroll.size.height;
        UIButton *checkMoreBtn=[UIButton buttonWithType:0];
        checkMoreBtn.center=CGPointMake(kMainBoundsW/2, favouriteScroll.size.height+15);
        checkMoreBtn.bounds=CGRectMake(0, 0, 100, 30);
        checkMoreBtn.backgroundColor=[UIColor colorWithRed:1 green:0 blue:102/255.0 alpha:1];
        [checkMoreBtn setTitle:@"查看更多" forState:0];
        checkMoreBtn.titleLabel.font=[UIFont systemFontOfSize:13];
        checkMoreBtn.layer.cornerRadius=5;
        checkMoreBtn.clipsToBounds=YES;
        [checkMoreBtn addTarget:self action:@selector(checkMoreFavouriter) forControlEvents:UIControlEventTouchUpInside];
        [_bgView addSubview:checkMoreBtn];
        cellHeight=checkMoreBtn.frame.origin.y+checkMoreBtn.size.height+10;
            }
    
    self.rowHeight=cellHeight;
}
-(void)setModel:(CommunityTableDataModel *)model
{
    _model=model;
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    [_bgView removeFromSuperview];
    [self createView];
}
#pragma mark--点赞
-(void)supportBtnClick:(UIButton *)sender
{
    sender.selected=!sender.selected;
}
#pragma mark--移除cell上的所有子视图，再创建新的子视图
-(void)removeView
{
    [_bgView removeFromSuperview];
    _bgView=nil;
    [self createView];
}
#pragma mark--查看更多按钮点击事件
-(void)checkMoreFavouriter
{

}
#pragma mark--scroll和pageControl的联动
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView==_picsScroll) {
        _pageControl.currentPage=scrollView.contentOffset.x/kMainBoundsW;

    }
//        if (scrollView==_starImgScroll) {
//            if (scrollOffset==) {
//                <#statements#>
//            }
//        scrollView.contentOffset=CGPointMake(scrollOffset+kMainBoundsW/2, 0);
//        scrollOffset=scrollView.contentOffset.x;
//    }
}
@end
