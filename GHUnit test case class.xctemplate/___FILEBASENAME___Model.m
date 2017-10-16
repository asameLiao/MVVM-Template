//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAME___.h"

@implementation ___FILEBASENAME___

+(___FILEBASENAME___ *)initWithImageName:(NSString *)name
                              andText:(NSString *)text{
    ___FILEBASENAME___ *model = [[___FILEBASENAMEASIDENTIFIER___ alloc] init];
    model.imageName = name;
    model.text = text;
    return model;
}
@end
