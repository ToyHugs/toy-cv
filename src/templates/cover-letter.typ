#import "../lib.typ": *

#show : cover-letter.with(
  recipient-name: "John Doe",
  recipient-description: "Hiring Manager",
  sender-name: "Jane Smith",
  sender-description: "123 Main St, Springfield, USA",
  city: "Springfield",
  i18n: "en",
  date: datetime.today(),
  subject: "Application for Software Engineer Position",
)

testd wdw