class ArticlePolicy < ApplicationPolicy
    def index?
        true
    end

    def create?
        member_email = user.email if user.present?

        response = EhProtobuf::EmploymentHero::Client.check_member_is_exist(
            email: member_email
        )

        if response.success?
            puts response.result
            puts "User_id: #{response.result.member_id}"
            puts "Is_member_existed: #{response.result.is_member_existed}"
        else
            puts response.errors
        end

        response.success?
    end

    def update?
        true if user.present? && user == article.user
    end

    def destroy?
        true if user.present? && user == article.user
    end

    private
    def article
        record
    end
end