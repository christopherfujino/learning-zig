const std = @import("std");
const print = std.debug.print;

/// If multiple defer statements are specified, they will be executed in
/// the reverse order they were run.
fn deferUnwindExample() void {
    print("\n", .{});

    defer {
        print("1 ", .{});
    }
    defer {
        print("2 ", .{});
    }
    if (false) {
        // defers are not run if they are never executed.
        defer {
            print("3 ", .{});
        }
    }
}

test "defer unwinding" {
    deferUnwindExample();
    print("End\n", .{});
}
