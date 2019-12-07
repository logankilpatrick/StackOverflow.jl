using StackOverflow
using Test


qHolder = getrecentquestionsfortag()
@test_nowarn qHolder[1].answer_count

@test_nowarn getrecentbadgerecipients()

siteinfoholder = getsiteinfo()
@test_nowarn dump(siteinfoholder)