using Test
using StackOverflow

qHolder = getrecentquestionsfortag()
@test_nowarn qHolder[1].answer_count

@test_nowarn getrecentbadgerecipients()

siteinfoholder = getsiteinfo()
@test_nowarn dump(siteinfoholder)

@test_nowarn searchtag("julia")

@test_nowarn StackOverflow.searcherror()

aHolder = getanswers()
@test typeof(aHolder[1].question_id) == Int


@test_nowarn StackOverflow.getanswerfromquestion(qHolder[1])
@test_nowarn StackOverflow.getquestionfromanswer(aHolder[1])
