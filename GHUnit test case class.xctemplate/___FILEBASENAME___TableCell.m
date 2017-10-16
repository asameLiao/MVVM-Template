//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAME___.h"
#import "___FILEBASENAME___Model.h"
@implementation ___FILEBASENAMEASIDENTIFIER___

- (void)viewSetup {
    
}

- (void)frameSetup {
    
}

- (void)setModel:(___FILEBASENAME___Model *)model
{
    [super setModel:model];
    if (model) {
        //将model 的数值 传递给 cell
        self.textLabel.text = model.text;
        self.imageView.image = [UIImage imageNamed:model.imageName];
    }
}

+ (CGFloat)height {
    return 55.0f;
}
@end
