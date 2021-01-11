#include "miniaturize.h"

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

// LIBS += -framework Foundation -framework AppKit

void miniaturize(QWidget *w)
{
    NSView* view = (NSView*)w->winId();
    NSWindow* wnd = [view window];
    [wnd miniaturize:nil];
}
