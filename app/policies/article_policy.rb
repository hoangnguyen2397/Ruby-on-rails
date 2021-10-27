class ArticlePolicy < ApplicationPolicy
    def index?
        true
    end

    def create?
        member_email = user.email if user.present?
        response = EhProtobuf::EmploymentHero::Client.check_member_is_exist(
            email: member_email
        )
        JSON.parse(response.to_json)['rpc_response'].blank?
        # puts JSON.parse(response.to_json)
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