//TODO: env load

@Deprecated('NO used plize')
class TestModelSettings {
    final CmsParams cmsParams;

    TestModelSettings({
        required this.cmsParams,
    });

    TestModelSettings copyWith({
        CmsParams? cmsParams,
    }) => 
        TestModelSettings(
            cmsParams: cmsParams ?? this.cmsParams,
        );
}

class CmsParams {
    final List<Shop> shop;
    final String kpp;
    final String inn;
    final String company;

    CmsParams({
        required this.shop,
        required this.kpp,
        required this.inn,
        required this.company,
    });

    CmsParams copyWith({
        List<Shop>? shop,
        String? kpp,
        String? inn,
        String? company,
    }) => 
        CmsParams(
            shop: shop ?? this.shop,
            kpp: kpp ?? this.kpp,
            inn: inn ?? this.inn,
            company: company ?? this.company,
        );
}

class Shop {
    final Access access;
    final String hostname;

    Shop({
        required this.access,
        required this.hostname,
    });

    Shop copyWith({
        Access? access,
        String? hostname,
    }) => 
        Shop(
            access: access ?? this.access,
            hostname: hostname ?? this.hostname,
        );
}

class Access {
    final String groupCode;
    final String password;
    final String login;

    Access({
        required this.groupCode,
        required this.password,
        required this.login,
    });

    Access copyWith({
        String? groupCode,
        String? password,
        String? login,
    }) => 
        Access(
            groupCode: groupCode ?? this.groupCode,
            password: password ?? this.password,
            login: login ?? this.login,
        );
}
