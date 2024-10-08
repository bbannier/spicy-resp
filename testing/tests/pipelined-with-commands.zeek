# @TEST-DOC: Test Zeek parsing "pipelined" data responses
#
# @TEST-EXEC: zeek -Cr ${TRACES}/pipeline-with-commands.trace ${PACKAGE} %INPUT >output
# @TEST-EXEC: btest-diff output
# @TEST-EXEC: btest-diff resp.log

# Sometimes commands aren't serialized, like when pipelining. This still works! So we
# should handle this. This particular example has a few commands, amongst them a SET and
# a GET.
event RESP::set_command(c: connection, is_orig: bool, command: RESP::SetCommand)
    {
    print fmt("SET: %s", command);
    }

event RESP::get_command(c: connection, is_orig: bool, command: RESP::GetCommand)
    {
    print fmt("GET: %s", command);
    }
