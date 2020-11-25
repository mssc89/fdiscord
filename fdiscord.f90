module fdiscord
    use iso_c_binding
    implicit none

    type, public :: Discord
        private
        character(len=:), allocatable :: token
        
        contains
            procedure :: setToken => Discord_setToken
            procedure :: startClient => Discord_startClient
            procedure :: sendMessage => Discord_sendMessage
    end type Discord

    interface Discord
        procedure :: newDiscord
    end interface

    contains

    type(Discord) function newDiscord(token)
        implicit none
        character(len=*) :: token

        call newDiscord%setToken(token)
    end function

    subroutine Discord_setToken(this, token)
        implicit none
        class(Discord), intent(inout) :: this
        character(len=*) :: token

        this%token = token
    end subroutine

    subroutine Discord_startClient(this)
        implicit none
        class(Discord), intent(inout) :: this

        call Discord_startClient_c()
    end subroutine
    
    subroutine Discord_startClient_c() bind(c, name='startClient')
        
    end subroutine

    subroutine Discord_sendMessage(this, message, channel)
        implicit none
        class(Discord), intent(inout) :: this
        character(len=*) :: message
        character(len=*) :: channel

        call Discord_sendMessage_c(message, channel)
    end subroutine

    subroutine Discord_sendMessage_c(message, channel) bind(c, name='sendMessage')
        implicit none
        character(kind=C_CHAR), intent(in) :: message(*)
        character(kind=C_CHAR), intent(in) :: channel(*)
    end subroutine
end module fdiscord