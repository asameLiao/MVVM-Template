//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import <Foundation/Foundation.h>

@interface ___FILEBASENAME___ : NSObject
@property(nonatomic, copy) NSString *imageName;
@property(nonatomic, copy) NSString *text;

+(___FILEBASENAME___ *)initWithImageName:(NSString *)name
                              andText:(NSString *)text;
@end
