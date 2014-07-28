//
//  GRViewController.m
//  _28_TextFielFormatTest
//
//  Created by Exo-terminal on 6/6/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRViewController.h"

@interface GRViewController ()

@end

@implementation GRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITextFieldDelegate -


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    
    /*NSCharacterSet* validationSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray* componets = [string componentsSeparatedByCharactersInSet:validationSet];
    
    if ([componets count] > 1) {
        return NO;
    }
    
    NSString* newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSLog(@"newString = %@",newString);
    
    NSArray* validComponents = [newString componentsSeparatedByCharactersInSet:validationSet];
    newString = [validComponents componentsJoinedByString:@""];
    
    
    
    static const int localNumberMaxLenght = 7;
    static const int areaCodeMaxLenght = 3;
    static const int coutryCodeMaxLenght = 3;
    
    
    if ([newString length] > localNumberMaxLenght + areaCodeMaxLenght + coutryCodeMaxLenght) {
        return NO;
    }

    NSMutableString* resultString = [NSMutableString string];

    NSInteger localNumberLenght = MIN([newString length], localNumberMaxLenght);
    
    if (localNumberLenght > 0) {
        NSString* number = [newString substringFromIndex:(int)[newString length] - localNumberLenght];
        [resultString appendString:number];
        
        if ([resultString length] > 3) {
            [resultString insertString:@"-" atIndex:3];
        }
    }
    
    if ([newString length] > localNumberMaxLenght) {
        
        NSInteger areaCodeLenght = MIN((int)[newString length] - localNumberMaxLenght, areaCodeMaxLenght);
        NSRange areaRange = NSMakeRange((int)[newString length] - localNumberMaxLenght - areaCodeLenght, areaCodeLenght);
        NSString* area = [newString substringWithRange:areaRange];
        
        area = [NSString stringWithFormat:@"(%@) ", area];
        [resultString insertString:area atIndex:0];
    }
    if ([newString length] > localNumberMaxLenght + coutryCodeMaxLenght) {
        
        NSInteger coutryCodeLenght = MIN((int)[newString length] - localNumberMaxLenght - coutryCodeMaxLenght, coutryCodeMaxLenght);
        NSRange countryCodeRange = NSMakeRange(0,coutryCodeLenght);
        NSString* countryCode = [newString substringWithRange:countryCodeRange];
        
        countryCode = [NSString stringWithFormat:@"+%@ ", countryCode];
        [resultString insertString:countryCode atIndex:0];
    }
    
    textField.text = resultString;
    
    return NO;*/

    
    NSLog(@"Text field = %@", textField);
    NSLog(@"shouldChangeCharactersInRange = %@",NSStringFromRange(range));
    NSLog(@"replacementString = %@",string);
    
    NSString* newString = [textField.text stringByReplacingCharactersInRange:range withString:string];

    
    NSLog(@"resultString = %@",newString);
    
    NSCharacterSet* set = [NSCharacterSet characterSetWithCharactersInString:@" ,"];
//    NSCharacterSet* set = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    
    NSArray* words = [newString componentsSeparatedByCharactersInSet:set];
//    NSLog(@"words = %@",words);

    return [newString length] <=10;
}

@end
