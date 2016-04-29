# DynamicUITableViewController
This Swift subclass of the iOS UITableViewController makes it easy to hide rows and/or sections in a static grouped UITableViewController.

All you have to do is derive your TableViewController from DynamicUITableViewController and then in your subclass override the methods shouldHideSection(section: Int) and/or shouldHideRow(section: Int, row: Int).

If you wish to hide a complete section you will return true from shouldHideSection(), if you wish to only hide a row you will return true from shouldHideRow().
