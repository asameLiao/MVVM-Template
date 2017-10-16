//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAME___.h"

@interface ___FILEBASENAMEASIDENTIFIER___ ()

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

- (void)loadFetchData {
    NSMutableArray  *dataSource = [NSMutableArray array];
    NSObject *model1 = [[___FILEBASENAME___Model alloc] init];
    NSObject *model2 = [[___FILEBASENAME___Model alloc] init];
    NSObject *model3 = [[___FILEBASENAME___Model alloc] init];
    NSArray *modelArray = @[model1,model2,model3];
    
    NSMutableArray *sectionArray = [NSMutableArray array];
    for (NSInteger i = 0; i< modelArray.count; i++) {
        LDSTableViewCellViewModel *cellviewModel = [LDSTableViewCellViewModel modelCellWithClass:[___FILEBASENAME___TableCell class] model:modelArray[i]  tag:i];
        cellviewModel.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cellviewModel.tableViewCellStyle = UITableViewCellStyleSubtitle;
        [sectionArray addObject:cellviewModel];
    }
    [dataSource addObject:sectionArray];
    self.fetchDataSource = dataSource;
    [self setUpDataSource];
}

- (void)setUpDataSource {
    if (self.fetchDataSource) {
        self.dataSource = self.fetchDataSource;
        if ([self.delegate respondsToSelector:@selector(lds_didReceiveDataWithDataSource:andSectionDataSource:)]) {
            [self.delegate lds_didReceiveDataWithDataSource:[self.dataSource copy]
                                       andSectionDataSource:[self.sectionDataSource copy]];
        }
    }
    
}

@end
