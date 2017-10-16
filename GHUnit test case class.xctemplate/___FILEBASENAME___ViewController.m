//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAME___.h"
#import "___FILEBASENAME___ViewModel.h"
#import "___VARIABLE_cutClass:identifier___TableViewModel.h"
@interface ___FILEBASENAMEASIDENTIFIER___ ()

@property(nonatomic, strong) ___FILEBASENAME___ViewModel *vcViewModel;//必须子类化
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UIView *headView;
@property(nonatomic, strong) LDSTableViewModel *tableViewModel;//选择性子类化
@property(nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation ___FILEBASENAMEASIDENTIFIER___

#pragma mark - lazy init
- (___FILEBASENAME___ViewModel *)vcViewModel {
    if (_vcViewModel == nil) {
        _vcViewModel = [[___FILEBASENAME___ViewModel alloc] init];
        _vcViewModel.delegate = (id<LDSViewControllerViewModelDelegate>)self;
    }
    return _vcViewModel;
}

- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds  style:UITableViewStyleGrouped];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return _tableView;
}

- (LDSTableViewModel *)tableViewModel {
    if (_tableViewModel == nil) {
        _tableViewModel = [[LDSTableViewModel alloc] init];
        _tableViewModel.delegate = (id<LDSTableViewModelDelegate>)self;
        //tableViewModel接管tableView
        [_tableViewModel handleWithTable:self.tableView];
    }
    return _tableViewModel;
}

- (NSString *)barItemTitle {
    return @"";
}

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    //tableViewModel接管dataSource 数据源
    [self.tableViewModel handleWithDataSource:self.dataSource];
    [self.view addSubview:self.tableView];
    [self.vcViewModel loadFetchData];
}

#pragma mark - LDSTableViewModelDelegate
- (void)lds_tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

#pragma mark - LDSViewControllerViewModelDelegate
- (void)lds_didReceiveDataWithDataSource:(NSArray *)dataSource andSectionDataSource:(NSArray *)sectionDataSource {
    self.dataSource = [dataSource mutableCopy];
    [self.tableViewModel handleWithDataSource:self.dataSource];
    [self.tableView reloadData];
}

@end
