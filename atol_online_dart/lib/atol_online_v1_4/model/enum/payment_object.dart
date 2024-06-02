enum PaymentObject {
  commodity,
  excise,
  job,
  service,
  gamblingBet,
  gamblingPrize,
  lottery,
  lotteryPrize,
  intellectualActivity,
  payment,
  agentCommission,
  composite,
  another,
}

extension PaymentObjectExtension on PaymentObject {
  String get name {
    switch (this) {
      case PaymentObject.commodity:
        return 'commodity';
      case PaymentObject.excise:
        return 'excise';
      case PaymentObject.job:
        return 'job';
      case PaymentObject.service:
        return 'service';
      case PaymentObject.gamblingBet:
        return 'gambling_bet';
      case PaymentObject.gamblingPrize:
        return 'gambling_prize';
      case PaymentObject.lottery:
        return 'lottery';
      case PaymentObject.lotteryPrize:
        return 'lottery_prize';
      case PaymentObject.intellectualActivity:
        return 'intellectual_activity';
      case PaymentObject.payment:
        return 'payment';
      case PaymentObject.agentCommission:
        return 'agent_commission';
      case PaymentObject.composite:
        return 'composite';
      case PaymentObject.another:
        return 'another';
    }
  }

  static PaymentObject? fromString(String value) {
    switch (value) {
      case 'commodity':
        return PaymentObject.commodity;
      case 'excise':
        return PaymentObject.excise;
      case 'job':
        return PaymentObject.job;
      case 'service':
        return PaymentObject.service;
      case 'gambling_bet':
        return PaymentObject.gamblingBet;
      case 'gambling_prize':
        return PaymentObject.gamblingPrize;
      case 'lottery':
        return PaymentObject.lottery;
      case 'lottery_prize':
        return PaymentObject.lotteryPrize;
      case 'intellectual_activity':
        return PaymentObject.intellectualActivity;
      case 'payment':
        return PaymentObject.payment;
      case 'agent_commission':
        return PaymentObject.agentCommission;
      case 'composite':
        return PaymentObject.composite;
      case 'another':
        return PaymentObject.another;
      default:
        return null;
    }
  }
}
