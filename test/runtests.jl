using Test
using StackOverflow

qHolder = getrecentquestionsfortag()
@test_nowarn qHolder[1].answer_count

@test_nowarn getrecentbadgerecipients()

siteinfoholder = getsiteinfo()
@test_nowarn dump(siteinfoholder)

@test_nowarn searchtag("julia")

aHolder = getanswers()
@test_nowarn StackOverflow.searcherror()

@test typeof(aHolder[1].question_id) == Int


@test_nowarn StackOverflow.getanswerforquestion(qHolder[1])
@test_nowarn StackOverflow.getquestionfromanswer(aHolder[1])
