# @TEST-DOC: Test Zeek parsing a trace file made with bulk-created SET commands
#
# @TEST-EXEC: zeek -Cr ${TRACES}/bulk-loading.trace ${PACKAGE} %INPUT >output
# @TEST-EXEC: btest-diff output

# The bulk-loading functionality just sends the serialized form from some ruby
# code directly to the server, but it's useful to see if that trace might come
# up with something different. See:
# https://redis.io/docs/latest/develop/use/patterns/bulk-loading/
event RESP::set_command(c: connection, is_orig: bool, command: RESP::SetCommand)
    {
    print fmt("SET: %s %s", command$key, command$value);
    }
