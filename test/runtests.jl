using StackOverflow
using Test


qHolder = getrecentquestionsfortag()
@test_nowarn qHolder[1].answer_count

@test_nowarn getrecentbadgerecipients()

siteinfoholder = getsiteinfo()
@test_nowarn dump(siteinfoholder)

@test_nowarn StackOverflow.searchtag("julia")

aHolder = StackOverflow.getanswers()
qeHolder = StackOverflow.searcherror()
@test typeof(aHolder[1].question_id) == Int
@test typeof(aHolder[1].score) == Int
@test typeof(qeHolder[1].score) == Int
