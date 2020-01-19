using StackOverflow
using Test


qHolder = getrecentquestionsfortag()
@test_nowarn qHolder[1].answer_count

@test_nowarn getrecentbadgerecipients()
@test_nowarn geterrors()

siteinfoholder = getsiteinfo()
@test_nowarn dump(siteinfoholder)

@test_nowarn searchtag("julia")
@test_nowarn getusers()
@test_nowarn getcomments()
@test_nowarn getsuggested_edits()
