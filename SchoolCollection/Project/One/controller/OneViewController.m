//
//  OneViewController.m
//  DataCollection
//
//  Created by 紫薇大舅 on 2017/3/6.
//  Copyright © 2017年 ziweidajiu. All rights reserved.
//

#import "OneViewController.h"
#import "UINavigationBar+Awesome.h"
#import "HeaderView.h"

@interface OneViewController () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong)HeaderView *view1;

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)NSMutableArray *marr;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationView];
    [self createData];
    [self createView];
}

#pragma -mark 设置navigation
-(void)setNavigationView{
    self.navigationItem.title = @"我的Student ID";
    UIColor * color = [UIColor whiteColor];
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"background_1.png"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"one_left"] style:UIBarButtonItemStyleDone target:self action:@selector(onClick0:)];
    self.navigationItem.leftBarButtonItem = btn1;
    
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"one_right"] style:UIBarButtonItemStyleDone target:self action:@selector(onClick1:)];
    self.navigationItem.rightBarButtonItem = btn2;
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

-(void)onClick0:(UIButton *)btn{
    NSLog(@"%@", @"哈哈");
}

-(void)onClick1:(UIButton *)btn{
    
}

-(void)createData{
    self.marr = [[NSMutableArray alloc] init];
    for (int i=0; i<10; i++) {
        [self.marr addObject:[NSString stringWithFormat:@"%d", i]];
    }
    [self createTableView];
}

-(void)createTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, HEIGH/4, WIDTH, HEIGH) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.bounces = YES;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    RefeshBase *base = [[RefeshBase alloc] init];

    self.tableView.mj_header = [base createRefresh];
    
    self.tableView.mj_footer = [base createLoad];
    
    __weak typeof(self) weakSelf = self;
    base.block1 = ^(){
        [weakSelf loadNewData];
    };
    base.block2 = ^(){
        [weakSelf loadLastData];
    };
}

-(void)loadLastData{
    for (int i=10; i<20; i++) {
        [self.marr addObject:[NSString stringWithFormat:@"%d", i]];
    }
    __weak UITableView *tableView = self.tableView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [tableView reloadData];
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [tableView.mj_footer endRefreshing];
    });
}

-(void)loadNewData{
    self.marr = [[NSMutableArray alloc] init];
    for (int i=10; i<20; i++) {
        [self.marr addObject:[NSString stringWithFormat:@"%d", i]];
    }
    __weak UITableView *tableView = self.tableView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [tableView reloadData];
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [tableView.mj_header endRefreshing];
    });
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.marr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.marr[indexPath.row];
    return cell;
}

-(void)createView{
    self.view1 = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGH/4)];
    [self.view addSubview:self.view1];
    self.view1.backgroundColor = COLOR;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    float num = self.view1.frame.origin.y;
    float num1 = self.tableView.frame.origin.y;
    if (scrollView.contentOffset.y > 0) {
        if (num1 <= 0) {
            self.view1.frame = CGRectMake(0, -HEIGH/4, WIDTH, HEIGH/4);
            self.tableView.frame = CGRectMake(0, 0, WIDTH, HEIGH);
            return;
        }
        self.view1.frame = CGRectMake(0, num-self.tableView.contentOffset.y/7, WIDTH, HEIGH/4);
        self.tableView.frame = CGRectMake(0, num1-self.tableView.contentOffset.y/7, WIDTH, HEIGH);
    } else {
        if (num1 >= HEIGH/4) {
            self.view1.frame = CGRectMake(0, 0, WIDTH, HEIGH/4);
            self.tableView.frame = CGRectMake(0, HEIGH/4, WIDTH, HEIGH);
            return;
        }
        self.view1.frame = CGRectMake(0, num-self.tableView.contentOffset.y*2, WIDTH, HEIGH/4);
        self.tableView.frame = CGRectMake(0, num1-self.tableView.contentOffset.y*2, WIDTH, HEIGH);
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
