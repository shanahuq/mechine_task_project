
class WalletModel {
    Data? data;

    WalletModel({this.data});

    WalletModel.fromJson(Map<String, dynamic> json) {
        data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        return _data;
    }
}

class Data {
    WalletSummary? walletSummary;
    WalletTransactions? walletTransactions;

    Data({this.walletSummary, this.walletTransactions});

    Data.fromJson(Map<String, dynamic> json) {
        walletSummary = json["wallet_summary"] == null ? null : WalletSummary.fromJson(json["wallet_summary"]);
        walletTransactions = json["wallet_transactions"] == null ? null : WalletTransactions.fromJson(json["wallet_transactions"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(walletSummary != null) {
            _data["wallet_summary"] = walletSummary?.toJson();
        }
        if(walletTransactions != null) {
            _data["wallet_transactions"] = walletTransactions?.toJson();
        }
        return _data;
    }
}

class WalletTransactions {
    int? currentPage;
    List<Data1>? data;
    String? firstPageUrl;
    int? from;
    int? lastPage;
    String? lastPageUrl;
    List<Links>? links;
    dynamic nextPageUrl;
    String? path;
    int? perPage;
    dynamic prevPageUrl;
    int? to;
    int? total;

    WalletTransactions({this.currentPage, this.data, this.firstPageUrl, this.from, this.lastPage, this.lastPageUrl, this.links, this.nextPageUrl, this.path, this.perPage, this.prevPageUrl, this.to, this.total});

    WalletTransactions.fromJson(Map<String, dynamic> json) {
        currentPage = json["current_page"];
        data = json["data"] == null ? null : (json["data"] as List).map((e) => Data1.fromJson(e)).toList();
        firstPageUrl = json["first_page_url"];
        from = json["from"];
        lastPage = json["last_page"];
        lastPageUrl = json["last_page_url"];
        links = json["links"] == null ? null : (json["links"] as List).map((e) => Links.fromJson(e)).toList();
        nextPageUrl = json["next_page_url"];
        path = json["path"];
        perPage = json["per_page"];
        prevPageUrl = json["prev_page_url"];
        to = json["to"];
        total = json["total"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["current_page"] = currentPage;
        if(data != null) {
            _data["data"] = data?.map((e) => e.toJson()).toList();
        }
        _data["first_page_url"] = firstPageUrl;
        _data["from"] = from;
        _data["last_page"] = lastPage;
        _data["last_page_url"] = lastPageUrl;
        if(links != null) {
            _data["links"] = links?.map((e) => e.toJson()).toList();
        }
        _data["next_page_url"] = nextPageUrl;
        _data["path"] = path;
        _data["per_page"] = perPage;
        _data["prev_page_url"] = prevPageUrl;
        _data["to"] = to;
        _data["total"] = total;
        return _data;
    }
}

class Links {
    dynamic url;
    String? label;
    bool? active;

    Links({this.url, this.label, this.active});

    Links.fromJson(Map<String, dynamic> json) {
        url = json["url"];
        label = json["label"];
        active = json["active"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["url"] = url;
        _data["label"] = label;
        _data["active"] = active;
        return _data;
    }
}

class Data1 {
    String? amount;
    dynamic grossAmount;
    dynamic commission;
    String? type;
    String? paymentMethod;
    String? createdAt;

    Data1({this.amount, this.grossAmount, this.commission, this.type, this.paymentMethod, this.createdAt});

    Data1.fromJson(Map<String, dynamic> json) {
        amount = json["amount"];
        grossAmount = json["gross_amount"];
        commission = json["commission"];
        type = json["type"];
        paymentMethod = json["payment_method"];
        createdAt = json["created_at"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["amount"] = amount;
        _data["gross_amount"] = grossAmount;
        _data["commission"] = commission;
        _data["type"] = type;
        _data["payment_method"] = paymentMethod;
        _data["created_at"] = createdAt;
        return _data;
    }
}

class WalletSummary {
    String? usedAmount;
    String? totalOut;
    String? balance;
    String? totalRecharge;
    String? totalGrossRecharge;
    String? totalCommission;
    String? totalCollected;
    String? currentOutStanding;

    WalletSummary({this.usedAmount, this.totalOut, this.balance, this.totalRecharge, this.totalGrossRecharge, this.totalCommission, this.totalCollected, this.currentOutStanding});

    WalletSummary.fromJson(Map<String, dynamic> json) {
        usedAmount = json["usedAmount"];
        totalOut = json["totalOut"];
        balance = json["balance"];
        totalRecharge = json["totalRecharge"];
        totalGrossRecharge = json["totalGrossRecharge"];
        totalCommission = json["totalCommission"];
        totalCollected = json["totalCollected"];
        currentOutStanding = json["currentOutStanding"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["usedAmount"] = usedAmount;
        _data["totalOut"] = totalOut;
        _data["balance"] = balance;
        _data["totalRecharge"] = totalRecharge;
        _data["totalGrossRecharge"] = totalGrossRecharge;
        _data["totalCommission"] = totalCommission;
        _data["totalCollected"] = totalCollected;
        _data["currentOutStanding"] = currentOutStanding;
        return _data;
    }
}