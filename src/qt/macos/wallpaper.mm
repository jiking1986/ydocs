// LIBS += -framework Foundation -framework AppKit

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

int setDesktopWindowPropety(QWidget *w)
{
    NSWindow *window = [w->winId() window];
    //window.backgroundColor = [NSColor clearColor];
    //[NSMenu setMenuBarVisible:NO];
    //NSRect frame = [NSScreen mainScreen].frame;
    //[window setFrame:frame display:NO];
    //window.titleVisibility = NSWindowTitleHidden;
    //window.titlebarAppearsTransparent = YES;
    //window.styleMask = NSWindowStyleMaskDocModalWindow;
    [window setCollectionBehavior:(NSWindowCollectionBehaviorCanJoinAllSpaces |
    NSWindowCollectionBehaviorStationary |
    NSWindowCollectionBehaviorIgnoresCycle|NSWindowCollectionBehaviorFullScreenPrimary)];
}

int setDesktopWindowLevel(QWidget *w)
{
    if (!w)
        return -1;
    NSLog (@"%s(%d): winId = %ud", __FUNCTION__, __LINE__, w->winId());
    NSWindow *window = [w->winId() window];
    [[w->winId() window] setLevel:kCGDesktopWindowLevel];
    setDesktopWindowPropety(w);
    return 0;
}

void hideOtherApplications()
{
    [[NSWorkspace sharedWorkspace] hideOtherApplications];
}
