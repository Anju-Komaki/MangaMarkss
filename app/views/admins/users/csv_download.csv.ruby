require 'csv'

columns = %w(
    ID
	登録日
	ユーザー名
	メールアドレス
	出身国
)

CSV.generate(encoding: Encoding::SJIS, row_sep: "\r\n", force_quotes: true) do |csv|
 csv << columns
 @users.each_with_index do |user, number|
   csv << [
    number + 1,
    user.created_at,
    user.username,
    user.email,
    user.country
    ]
 end
end