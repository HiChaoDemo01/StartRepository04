//
//  MatchVC.m
//  HiChaoDemo01
//
//  Created by Mac on 16/7/2.
//  Copyright © 2016年 surker. All rights reserved.
//

#import "MatchVC.h"

@interface MatchVC ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UITableView *_tableView;
    UIView *_matchBGVIew;
    UIView *_TopBgView;
    UICollectionView *_matchCollectionView;
    UIView *_specialBGView;
    UIView *_customView;
    UILabel *_titLelabel;
}
@property (nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic,strong)NSMutableArray *myClassArr;
@property (nonatomic,strong)NSMutableArray *AddClassArr;
@end

@implementation MatchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
      //自定义导航条上的button回调
    [self NAVBtnsClick];
    [self createMatchVCView];
    
}


#pragma mark-----懒加载初始化数组
- (NSMutableArray *)dataArr {
    
    
    if (!_dataArr) {
        
        _dataArr =[NSMutableArray array];
    }
    return _dataArr;
}

- (NSMutableArray *)myClassArr {
    
    if (!_myClassArr) {
        _myClassArr = [NSMutableArray array];
    }
    return _myClassArr;
}

- (NSMutableArray *)AddClassArr {
    
    if (_AddClassArr) {
        
        _AddClassArr =[NSMutableArray array];
    }
    return _AddClassArr;
}


- (void)createMatchVCView {
    
    
    UIView *specialBGView = [[UIView alloc]initWithFrame:CGRectMake(0, 60, kMainBoundsW, kMainBoundsH-80)];
    specialBGView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:specialBGView];
    _specialBGView =specialBGView;
    
    
    UIView *matchBGVIew = [[UIView alloc]initWithFrame:CGRectMake(0, 60, kMainBoundsW, kMainBoundsH-80)];
        matchBGVIew.backgroundColor = [UIColor redColor];
        _matchBGVIew =matchBGVIew;
    [self.view addSubview:matchBGVIew];
   
    
    UIView *TopBgView = [[UIView alloc]init];
    TopBgView.frame = CGRectMake(0, 0, kMainBoundsW, 60);
    TopBgView.backgroundColor = [UIColor whiteColor];
    [matchBGVIew addSubview:TopBgView];
    _TopBgView =TopBgView;
    
    UIButton *changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    changeBtn.frame = CGRectMake(kMainBoundsW - 50, 10, 30, 30);
    changeBtn.layer.cornerRadius = 15;
    changeBtn.layer.masksToBounds =YES;
    changeBtn.layer.borderWidth = 3;
    changeBtn.layer.borderColor = [UIColor grayColor].CGColor;
    [changeBtn setBackgroundImage:[UIImage imageNamed:@"3BB9ED0CEB83639EEFB748D13D122A5B.jpg"] forState:UIControlStateNormal];
   [changeBtn setBackgroundImage:[UIImage imageNamed:@"252C2B34203073F0922AFE3F2C859E77.jpg"] forState:UIControlStateSelected];
    [changeBtn addTarget: self action:@selector(changeBtnCilck:) forControlEvents:UIControlEventTouchUpInside];
    
    [TopBgView addSubview:changeBtn];
    
    
    
    
    
    
    
    UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(0, 60, kMainBoundsW, kMainBoundsH)];
    customView.backgroundColor =[UIColor yellowColor];
    
       _customView = customView;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(150, 10, 80, 40)];
    label.text =@"频道定制";
    label.font = [UIFont systemFontOfSize:20];
   
    _titLelabel = label;
    
    [SQSRequest sendRequestFroSpecialVCData:^(NSArray *dataArr) {
        
        
        [self.dataArr addObjectsFromArray:dataArr];
        
        [_tableView reloadData];
        
        
    }];
    
    
    
    //创建tableV
    UITableView *tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, kMainBoundsH) style:UITableViewStyleGrouped];
    tableView.delegate =self;
    tableView.dataSource =self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [specialBGView addSubview:tableView];
    [tableView registerClass:[SQSCustomTableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableView =tableView;

    
    
    
}

//自定义的导航上面的按钮，回调的block

- (void)NAVBtnsClick {
    
    [self matchCallBackBtnClick:^{
        
         [self.view bringSubviewToFront:_matchBGVIew];
    }];
    
    [self specialCallBackBtnClick:^{
        
        [self.view bringSubviewToFront:_specialBGView];
        
        
    }];
    
    
}

#pragma mark-----changeBtnClick的点击方法
- (void)changeBtnCilck:(UIButton *)sender {
    
    sender.selected = !sender.selected;

    
    if (sender.selected) {
        
         [_matchBGVIew addSubview:_customView];
         [_TopBgView addSubview:_titLelabel];
        
        [self createcollectionView];
        
    }else{
        
        
        [_titLelabel removeFromSuperview];
        [_customView removeFromSuperview];
        
        
        
    }
    
    
    
    
}
#pragma mark----创建collectionView
- (void)createcollectionView {
   
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    UICollectionView *matchCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, kMainBoundsH) collectionViewLayout:layout];
    matchCollectionView.delegate =self;
    matchCollectionView.dataSource =self;
    matchCollectionView.backgroundColor = [UIColor whiteColor];
    [matchCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"coll"];
    [matchCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    [_customView addSubview:matchCollectionView];
    
    _matchCollectionView = matchCollectionView;
    
    
    
}


#pragma mark-----collectionView的代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 15;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 2;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"coll" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    return cell;
    
    
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    
       UIView *bgView = [[UIView alloc]init];
    [view addSubview:bgView];
    
    
    if (indexPath.section ==0) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 80, 30)];
        label.text = @"我的分类";
        label.textColor = [UIColor lightGrayColor];
        [bgView addSubview:label];
        
        UIButton *editBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [editBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [editBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        [bgView addSubview:editBtn];
        
        editBtn.sd_layout
        .topSpaceToView(bgView,5)
        .widthIs(60)
        .heightIs(30)
        .leftSpaceToView(label,250);
        
        
        return view;
        
        
        
    }else {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 120, 30)];
        label.text = @"点击添加分类";
        label.textColor = [UIColor lightGrayColor];
        [bgView addSubview:label];
        return view;
        
    }
    
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    
    
    return CGSizeMake(kMainBoundsW, 80);
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return CGSizeMake(60, 30);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
}






#pragma mark---tableView的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.dataArr.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SQSCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell solveReuseCell];
    
    SQSSpeciaComponent *modle = self.dataArr[indexPath.row];
    cell.specialModle = modle;
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    return kMainBoundsH/2;
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
