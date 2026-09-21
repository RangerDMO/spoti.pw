// The Animated lock screen row, put on the Lock screen widget page by Shared/Player/PlayerSettings.m.
#import "Core/SGCore.h"
#import "Settings/SGModPage.h"
#import "Settings/SGPageStyle.h"
#import "LockScreenArtwork.h"

static void sayWhatIsMissing(void) {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Animated lock screen"
        message:[NSString stringWithFormat:@"Animated artwork is the lock screen's own, and iOS takes one only from 26 on. This phone runs iOS %@, where the cover stays still.", UIDevice.currentDevice.systemVersion]
        preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
    [SGTopController() presentViewController:alert animated:YES completion:nil];
}

SGModRow *SGAnimatedArtworkRow(void) {
    if (!SGAnimatedArtworkAvailable())
        return SGStatActionRow(@"Animated lock screen", nil, ^NSString *{ return @"Needs iOS 26"; }, ^{ sayWhatIsMissing(); });
    return SGSwitchRow(@"Animated lock screen", @"A track with a Canvas plays it behind the lock screen's controls", SGKeyLockScreenArtwork);
}
