//
//  CommunityVC.m
//  HiChaoDemo01
//
//  Created by Mac on 16/7/2.
//  Copyright © 2016年 surker. All rights reserved.
//

typedef enum : NSUInteger {
    topScrollImage_firstImage,
    topScrollImage_secondImage,
    topScrollImage_threeImage,
} topScrollImage;

typedef enum : NSUInteger {
    chooseBtn_trend,
    chooseBtn_attention,/**关注**/
    chooseBtn_favourite,/**红人**/
} chooseBtn;

#import "CommunityVC.h"
#import "QHJCusTableViewCell.h"
@interface CommunityVC ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    int offset;
    NSInteger whichBtn;
    BOOL chooseBtnState[3];
    CGFloat rowHeight;
    CGRect sildeTwigFrame;
}
@property(strong,nonatomic)UIScrollView *bgScroll;
@property(nonatomic,strong)NSMutableArray *scrollDataArr;
@property(strong,nonatomic)UIScrollView *topScroll;
@property(strong,nonatomic)UIPageControl *pageControl;
@property(strong,nonatomic)NSTimer *timer;
@property(strong,nonatomic)UITableView *tableView;
@property(strong,nonatomic)NSMutableArray *tableDataArr;
@property(strong,nonatomic)UIView *sildeTwig;
@end

@implementation CommunityVC
#pragma mark--视图将要出现时开启定时器
-(void)viewWillAppear:(BOOL)animated
{
    [_timer setFireDate:[NSDate distantPast]];
}
#pragma mark--视图消失时关闭定时器
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [_timer setFireDate:[NSDate distantFuture]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    sildeTwigFrame=CGRectMake(0, 42, kMainBoundsW/3, 3);
    chooseBtnState[0]=YES;
    self.cusTitleLab.text=@"社区";
    [self.editOrCameraBtn setBackgroundImage:[UIImage imageNamed:@"button_head_camera"] forState:UIControlStateNormal];
    
    [self createBGScroll];
    [self getData];

    
}
#pragma mark--创建背景scrollView
-(void)createBGScroll
{
    _bgScroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, kMainBoundsW, kMainBoundsH-64)];
    _bgScroll.backgroundColor=[UIColor orangeColor];
    _bgScroll.delegate=self;
    [self.view addSubview:_bgScroll];
    
}
#pragma mark - 创建顶部scrollView
-(void)createScrollView
{

    UIScrollView *topScroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, 220)];
    for (int i=0; i<self.scrollDataArr.count+1; i++) {
       
        UIButton *scrollImageBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        scrollImageBtn.frame=CGRectMake(kMainBoundsW*i, 0, kMainBoundsW, 220);
        if (i==self.scrollDataArr.count) {
            CommunityScrollDataModel *model=self.scrollDataArr[0];
            [scrollImageBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:model.picUrl] forState:UIControlStateNormal];
            [scrollImageBtn addTarget:self action:@selector(chooseScrollImage:) forControlEvents:UIControlEventTouchUpInside];
            [topScroll addSubview:scrollImageBtn];
            scrollImageBtn.tag=topScrollImage_firstImage;
            break;
        }
        CommunityScrollDataModel *model=self.scrollDataArr[i];
        [scrollImageBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:model.picUrl] forState:UIControlStateNormal];
        [scrollImageBtn addTarget:self action:@selector(chooseScrollImage:) forControlEvents:UIControlEventTouchUpInside];
        scrollImageBtn.tag=topScrollImage_firstImage+i;
        [topScroll addSubview:scrollImageBtn];
    }
    topScroll.delegate=self;
    topScroll.backgroundColor=[UIColor grayColor];
    topScroll.contentSize=CGSizeMake(kMainBoundsW*(self.scrollDataArr.count+1), 220);
    topScroll.pagingEnabled=YES;
    topScroll.showsHorizontalScrollIndicator=NO;
    [_bgScroll addSubview:topScroll];
    _topScroll=topScroll;
    UIPageControl *pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(0, _topScroll.frame.origin.y+topScroll.size.height-40, kMainBoundsW, 40)];
    pageControl.numberOfPages=self.scrollDataArr.count;
    pageControl.currentPageIndicatorTintColor=[UIColor redColor];
    [_bgScroll addSubview:pageControl];
    _pageControl=pageControl;
}

#pragma mark--创建tableView
-(void)createTableView
{

    UITableView *table=[[UITableView alloc]initWithFrame:CGRectMake(0, _topScroll.frame.origin.y+_topScroll.size.height, kMainBoundsW, 5000) style:UITableViewStylePlain];
    table.showsVerticalScrollIndicator=NO;
    table.backgroundColor=[UIColor grayColor];
    [_bgScroll addSubview:table];
    table.delegate=self;
    table.dataSource=self;
    _tableView=table;
    _tableView.scrollEnabled=NO;
    [_tableView registerClass:[QHJCusTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    _bgScroll.contentSize=CGSizeMake(kMainBoundsW, 5000);
    _bgScroll.showsVerticalScrollIndicator=NO;
    
}
#pragma mark--获取数据
-(void)getData
{
    if (!_scrollDataArr) {
        _scrollDataArr=[NSMutableArray new];
    }
    [_scrollDataArr removeAllObjects];
    [QHJRequestDataTools requestDataWithUrl:@"http://api-v2.mall.hichao.com/forum/banner?gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=282DC040-8A37-4D6D-92A1-55AC237988B1&gs=640x1136&gos=8.4&access_token=" andWith:^(NSArray *returnValue) {
        [_scrollDataArr addObjectsFromArray:returnValue];
        [self createScrollView];
        _timer=[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeScrollImg) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
        }];
    if (!_tableDataArr) {
        _tableDataArr=[NSMutableArray new];
    }
    [_tableDataArr removeAllObjects];
    [QHJRequestDataTools requestTableViewDataWithUrl:@"http://api-v2.mall.hichao.com/forum/timeline?nav_id=5&nav_name=%E7%83%AD%E9%97%A8&flag=&user_id=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=282DC040-8A37-4D6D-92A1-55AC237988B1&gs=640x1136&gos=8.4&access_token=" andWith:^(NSMutableArray *returnValue) {
        [_tableDataArr addObjectsFromArray:returnValue];
        [self createTableView];
    }];
    
}
#pragma mark
-(void)chooseCategory:(UIButton *)sender
{
    chooseBtnState[whichBtn]=NO;
    chooseBtnState[sender.tag]=YES;
    whichBtn=sender.tag;
    [self.tableDataArr removeAllObjects];
    
    [UIView animateWithDuration:0.3 animations:^{
        _sildeTwig.center=CGPointMake(sender.center.x, _sildeTwig.center.y);
        
    } completion:^(BOOL finished) {
        if(sender.tag==chooseBtn_attention)
        {
            [_tableView reloadData];
            [QHJRequestDataTools requestTableViewDataWithUrl:@"http://api-v2.mall.hichao.com/forum/timeline?nav_id=6&nav_name=%E5%85%B3%E6%B3%A8&flag=&user_id=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=282DC040-8A37-4D6D-92A1-55AC237988B1&gs=640x1136&gos=8.4&access_token=" andWith:^(NSMutableArray *returnValue) {
                [self.tableDataArr addObjectsFromArray:returnValue];
                [_tableView reloadData];
            }];
        }
        if (sender.tag==chooseBtn_trend) {
            [_tableView reloadData];
            [QHJRequestDataTools requestTableViewDataWithUrl:@"http://api-v2.mall.hichao.com/forum/timeline?nav_id=5&nav_name=%E7%83%AD%E9%97%A8&flag=&user_id=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=282DC040-8A37-4D6D-92A1-55AC237988B1&gs=640x1136&gos=8.4&access_token=" andWith:^(NSMutableArray *returnValue) {
                [self.tableDataArr addObjectsFromArray:returnValue];
                [_tableView reloadData];
            }];

        }
        if (sender.tag==chooseBtn_favourite) {
            [_tableView reloadData];
            [QHJRequestDataTools requestTableViewDataWithUrl:@"http://api-v2.mall.hichao.com/forum/timeline?nav_id=2&nav_name=%E7%BA%A2%E4%BA%BA&flag=&user_id=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=282DC040-8A37-4D6D-92A1-55AC237988B1&gs=640x1136&gos=8.4&access_token=" andWith:^(NSMutableArray *returnValue) {
                [self.tableDataArr addObjectsFromArray:returnValue];
                [_tableView reloadData];
            }];

        }

    }];
    sildeTwigFrame=_sildeTwig.frame;

    
    
}
#pragma mark--tableView的区头设置
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, 45)];
    headerView.backgroundColor=[UIColor whiteColor];
        NSArray *btnTitle=@[@"热门",@"关注",@"红人"];
        for (int i=0; i<3; i++) {
            UIButton *chooseBtn=[UIButton buttonWithType:0];
            chooseBtn.tag=chooseBtn_trend+i;
            [chooseBtn setTitle:btnTitle[i] forState:UIControlStateNormal];
            chooseBtn.frame=CGRectMake(kMainBoundsW/3*i, 5, kMainBoundsW/3, 35);
            
            [chooseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            if (chooseBtnState[i]) {
                [chooseBtn setTitleColor:[UIColor colorWithRed:1 green:0 blue:102/255.0 alpha:1] forState:UIControlStateNormal];
            }
            chooseBtn.titleLabel.font=[UIFont systemFontOfSize:15];
            
            [chooseBtn addTarget:self action:@selector(chooseCategory:) forControlEvents:UIControlEventTouchUpInside];
            [headerView addSubview:chooseBtn];
        }
    UIView *slideTwig=[[UIView alloc]initWithFrame:sildeTwigFrame];
    slideTwig.backgroundColor=[UIColor colorWithRed:1 green:0 blue:102/255.0 alpha:1];
    [headerView addSubview:slideTwig];
    _sildeTwig=slideTwig;
    return headerView;
    
}

#pragma mark--tableView的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableDataArr.count;
}
#pragma mark--设置区头高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}
#pragma mark--设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return rowHeight;
}
#pragma mark--设置cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QHJCusTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.model=self.tableDataArr[indexPath.row];
    cell.whichClickBtn=whichBtn;
    rowHeight=cell.rowHeight;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"选择cell");
}
#pragma mark--选择scrollView上的image
-(void)chooseScrollImage:(UIButton *)sender
{
   
}
#pragma mark--topScrollView的代理方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControl.currentPage=scrollView.contentOffset.x/kMainBoundsW;
    if (scrollView.contentOffset.x==kMainBoundsW*self.scrollDataArr.count) {
        scrollView.contentOffset=CGPointMake(0, 0);
        _pageControl.currentPage=0;
    }
}
#pragma mark--背景scrollView的代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
 
}
#pragma mark--定时器
-(void)changeScrollImg
{
    
    if (offset==self.scrollDataArr.count) {
        _topScroll.contentOffset=CGPointMake(0, 0);
        offset=0;
        _pageControl.currentPage=0;
    }
    offset+=1;
    [_topScroll setContentOffset:CGPointMake(kMainBoundsW*offset, 0) animated:YES];
    _pageControl.currentPage=offset;
    
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
