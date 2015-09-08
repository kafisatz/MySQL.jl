## initializes the MYSQL object
function mysql_init(mysqlptr::Ptr{Cuchar})
    return ccall((:mysql_init, mysql_lib),
                 Ptr{Void},
                 (Ptr{Cuchar}, ),
                 mysqlptr)
end

## performs the real connect to the db
function mysql_real_connect(mysqlptr::Ptr{Cuchar},
                            host::String,
                            user::String,
                            passwd::String,
                            db::String,
                            port::Cint,
                            unix_socket::Any,
                            client_flag::Uint64)

    reconnect_flag::Cuint = MySQL.MYSQL_OPTION.MYSQL_OPT_RECONNECT
    reconnect_option::Cuchar = 0
    retVal = MySQL.mysql_options(mysqlptr, reconnect_flag, reinterpret(Ptr{None},
                                   pointer_from_objref(reconnect_option)))
    if(retVal != 0)
        println("WARNING:::Options not set !!! The retVal is :: $retVal")
    end

    return ccall((:mysql_real_connect, mysql_lib),
                 Ptr{Cuchar},
                 (Ptr{Cuchar},
                  Ptr{Cuchar},
                  Ptr{Cuchar},
                  Ptr{Cuchar},
                  Ptr{Cuchar},
                  Cuint,
                  Ptr{Cuchar},
                  Uint64),
                 mysqlptr,
                 host,
                 user,
                 passwd,
                 db,
                 port,
                 unix_socket,
                 client_flag)
end

function mysql_options(mysqlptr::Ptr{Cuchar},
                       option_type::Cuint,
                       option::Ptr{None})
    return ccall((:mysql_options, mysql_lib),
                 Cint,
                 (Ptr{Cuchar},
                  Cint,
                  Ptr{Cuchar}),
                 mysqlptr,
                 option_type,
                 option)
end

function mysql_close(mysqlptr::Ptr{Cuchar})
    return ccall((:mysql_close, mysql_lib),
                 Void,
                 (Ptr{Cuchar}, ),
                 mysqlptr)
end

# Returns the error number of the last API call
function mysql_errno(mysqlptr::Ptr{Cuchar})
    return ccall((:mysql_errno, mysql_lib),
                 Cuint,
                 (Ptr{Cuchar}, ),
                 mysqlptr)
end

# Returns the error string
function mysql_error(mysqlptr::Ptr{Cuchar})
    return ccall((:mysql_error, mysql_lib),
                 Ptr{Cuchar},
                 (Ptr{Cuchar}, ),
                 mysqlptr)
end

# executes the prepared query associated with the statement handle
function mysql_stmt_execute(stmtptr::Ptr{Cuchar})
    return ccall((:mysql_stmt_execute, mysql_lib),
                 Cint,
                 (Ptr{Cuchar}, ),
                 stmtptr)
end

# closes the prepared statement
function mysql_stmt_close(stmtptr::Ptr{Cuchar})
    return ccall((:mysql_stmt_close, mysql_lib),
                 Cchar,
                 (Ptr{Cuchar}, ),
                 stmtptr)
end

# returns the value generated by auto increment column by the previous
# insert / update statement
function mysql_insert_id(mysqlptr::Ptr{Cuchar})
    return ccall((:mysql_insert_id, mysql_lib),
                 Culong,
                 (Ptr{Cuchar}, ),
                 mysqlptr)
end

# creates the sql string where the special chars are escaped
## TODO ::: Check the data types here !!!
function mysql_real_escape_string(mysqlptr::Ptr{Cuchar},
                                  to::Vector{Uint8},
                                  from::String,
                                  length::Uint32)
    return ccall((:mysql_real_escape_string, mysql_lib),
                 Uint32,
                 (Ptr{Cuchar},
                  Ptr{Uint8},
                  Ptr{Uint8},
                  Uint32), # TODO: Confirm proper type to use here
                 mysqlptr,
                 to,
                 from,
                 length)
end

#= in query.jl
function mysql_query(mysqlptr::Ptr{Cuchar}, sql::String)
    return ccall((:mysql_query, mysql_lib),
                 Cint, # TODO: Confirm proper type here
                 (Ptr{Cuchar}, Ptr{Uint8}),
                 mysqlptr,
                 sql)
end
=#

# Creates a mysql_stmt handle. Should be closed with mysql_close_stmt
function mysql_stmt_init(dbptr::Ptr{Cuchar})
    return ccall((:mysql_stmt_init, mysql_lib),
                 Ptr{Cuchar},
                 (Ptr{Cuchar}, ),
                 dbptr)
end

# Creates the prepared statement. There should be only 1 statement
function mysql_stmt_prepare(stmtptr::Ptr{Cuchar}, sql::String)
    s = utf8(sql)
    return ccall((:mysql_stmt_prepare, mysql_lib),
                 Cint, # TODO: Confirm proper type to use here
                 (Ptr{Cuchar}, Ptr{Uint8}, Uint64),
                 stmtptr,
                 s, # TODO: Confirm proper type to use here
                 length(s)) # TODO: Confirm proper type to use here
end

# Returns the error message for the recently invoked statement API
function mysql_stmt_error(stmtptr::Ptr{Cuchar})
    return ccall((:mysql_stmt_error, mysql_lib),
                 Ptr{Cuchar},
                 (Ptr{Cuchar}, ),
                 stmtptr)
end

function mysql_stmt_store_result(stmtptr::Ptr{Cuchar})
    return ccall((:mysql_stmt_store_result, mysql_lib),
                 Cint,
                 (Ptr{Cuchar}, ),
                 stmtptr)
end

function mysql_stmt_result_metadata(stmtptr::Ptr{Cuchar})
    return ccall((:mysql_stmt_result_metadata, mysql_lib),
                 Ptr{Cuchar},
                 (Ptr{Cuchar}, ),
                 stmtptr)
end

function mysql_stmt_num_rows(stmtptr::Ptr{Cuchar})
    return ccall((:mysql_stmt_num_rows, mysql_lib),
                 Culonglong,
                 (Ptr{Cuchar}, ),
                 stmtptr)
end

function mysql_stmt_fetch_row(stmtptr::Ptr{Cuchar})
    return ccall((:mysql_stmt_fetch, mysql_lib),
                 Cint,
                 (Ptr{Cuchar}, ),
                 stmtptr)
end

function mysql_stmt_bind_result(stmtptr::Ptr{Uint8}, bind::Ptr{Cuchar})
    return ccall((:mysql_stmt_bind_result, mysql_lib),
                 Cchar,
                 (Ptr{Uint8}, Ptr{Cuchar}),
                 stmtptr,
                 bind)
end

## Executes the query and returns the status of the same
function mysql_query(mysqlptr::Ptr{Cuchar}, sql::String)

# Code snippet to escape sql query string.
#=
    sqlEscaped = zeros(Array(Cuchar, 2*length(sql)))
    ccall((:mysql_real_escape_string, mysql_lib),
          Void,
          (Ptr{Cuchar}, Ptr{Cuchar}, Ptr{Cuchar}, Culong),
          mysqlptr,
          sqlEscaped,
          sql,
          length(sql)) 
=#
    return ccall((:mysql_query, mysql_lib),
                 Int8,
                 (Ptr{Cuchar}, Ptr{Cuchar}),
                 mysqlptr,
                 sql)
end

## Stores the result in to an object
function mysql_store_result(results::Ptr{Cuchar})
    return ccall((:mysql_store_result, mysql_lib),
                 Ptr{Cuchar},
                 (Ptr{Cuchar},),
                 results)
end

## Returns the field metadata  
function mysql_fetch_fields(results::Ptr{Cuchar})
    return ccall((:mysql_fetch_fields, mysql_lib),
                 Ptr{MYSQL_FIELD},
                 (Ptr{Cuchar},),
                 results)
end


## Returns the row from the result set
function mysql_fetch_row(results::Ptr{Cuchar})
    return ccall((:mysql_fetch_row, mysql_lib),
                 MYSQL_ROW,
                 (Ptr{Cuchar},),
                 results)
end

## Frees the result set
function mysql_free_result(results::Ptr{Cuchar})
    return ccall((:mysql_free_result, mysql_lib),
                 Ptr{Cuchar},
                 (Ptr{Cuchar},),
                 results)
end

## returns the number of fields in the result set
function mysql_num_fields(results::Ptr{Cuchar})
    return ccall((:mysql_num_fields, mysql_lib),
                 Int8,
                 (Ptr{Cuchar},),
                 results)
end

## returns the number of records from the result set
function mysql_num_rows(results::Ptr{Cuchar})
    return ccall((:mysql_num_rows, mysql_lib),
                 Int64,
                 (Ptr{Cuchar},),
                 results)
end

## returns the # of affected rows in case of insert / update / delete
function mysql_affected_rows(results::Ptr{Cuchar})
    return ccall((:mysql_affected_rows, mysql_lib),
                 Uint64,
                 (Ptr{Cuchar},),
                 results)
end