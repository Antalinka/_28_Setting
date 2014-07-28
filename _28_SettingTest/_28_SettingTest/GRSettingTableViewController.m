//
//  GRSettingTableViewController.m
//  _28_SettingTest
//
//  Created by Exo-terminal on 6/11/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRSettingTableViewController.h"

@interface GRSettingTableViewController ()

@end
static NSString* kSettingsLogin         = @"login";
static NSString* kSettingsPassword      = @"password";
static NSString* kSettingsLevel         = @"level";
static NSString* kSettingsShadows       = @"shadows";
static NSString* kSettingsDetalization  = @"detalization";
static NSString* kSettingsSound         = @"sound";
static NSString* kSettingsMusic         = @"music";

@implementation GRSettingTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadSettings];
    
    
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(notificationKeyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [nc addObserver:self selector:@selector(notificationUIKeyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark - Notification
-(void)notificationKeyboardWillShowNotification:(NSNotification*)notification{
    
    NSLog(@"notificationKeyboardWillShowNotification \n %@", notification.userInfo);
}

-(void)notificationUIKeyboardWillHideNotification:(NSNotification*)notification{
    
     NSLog(@"notificationUIKeyboardWillHideNotification \n %@", notification.userInfo);
    
}

#pragma mark - Save and Load

-(void) saveSettings{
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:self.loginField.text forKey:kSettingsLogin];
    [userDefaults setObject:self.passwordField.text forKey:kSettingsPassword];
    [userDefaults setInteger:self.levelControl.selectedSegmentIndex forKey:kSettingsLevel];
    [userDefaults setBool:self.shadowsSwitch.isOn forKey:kSettingsShadows];
    [userDefaults setInteger:self.detalizationControl.selectedSegmentIndex forKey:kSettingsDetalization];
    
    [userDefaults setDouble:self.soundSlider.value forKey:kSettingsSound];
    [userDefaults setDouble:self.musicSlider.value forKey:kSettingsMusic];
    
    [userDefaults synchronize];

}
-(void)loadSettings{
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    self.loginField.text = [userDefaults objectForKey:kSettingsLogin];
    self.passwordField.text = [userDefaults objectForKey:kSettingsPassword];
    self.levelControl.selectedSegmentIndex = [userDefaults integerForKey:kSettingsLevel];
    
    self.shadowsSwitch.on = [userDefaults boolForKey:kSettingsShadows];
    self.detalizationControl.selectedSegmentIndex = [userDefaults integerForKey:kSettingsDetalization];
    
    self.soundSlider.value = [userDefaults doubleForKey:kSettingsSound];
    self.musicSlider.value = [userDefaults doubleForKey:kSettingsMusic];
    

}

#pragma mark - Actions

- (IBAction)actionTextChanged:(UITextField *)sender {
    
    [self saveSettings];
}

- (IBAction)actionValueChanged:(id)sender {
    [self saveSettings];

}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if ([textField isEqual:self.loginField]) {
        [self.passwordField becomeFirstResponder];
    }else{
        [textField resignFirstResponder];
    }
    
    return YES;
}

@end
