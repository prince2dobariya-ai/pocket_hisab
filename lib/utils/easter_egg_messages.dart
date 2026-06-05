import 'dart:math';

// ─── Context-aware Easter Egg Picker ────────────────────────────────────────

String getContextualEasterEgg({
  required double salaryLeft,
  required double latestSalary,
  required double walletBalance,
  required double savings,
  required double totalEmi,
  required int expenseCount,
  required int daysRemaining,
}) {
  final random = Random();
  final hour = DateTime.now().hour;
  final salaryPercent = latestSalary > 0 ? (salaryLeft / latestSalary) : 1.0;

  // ── Build a weighted pool based on actual data ───────────────────────────
  final List<String> pool = [];

  // 1. Salary almost gone (< 20%)
  if (salaryPercent < 0.2 && latestSalary > 0) {
    pool.addAll(_salaryAlmostGoneMessages);
  }

  // 2. Salary is healthy (> 70%)
  if (salaryPercent > 0.7 && latestSalary > 0) {
    pool.addAll(_salaryHealthyMessages);
  }

  // 3. Mid-range salary (20–70%)
  if (salaryPercent >= 0.2 && salaryPercent <= 0.7 && latestSalary > 0) {
    pool.addAll(_salaryMidMessages);
  }

  // 4. Wallet empty
  if (walletBalance <= 0) {
    pool.addAll(_walletEmptyMessages);
  }

  // 5. Wallet loaded
  if (walletBalance > 5000) {
    pool.addAll(_walletLoadedMessages);
  }

  // 6. Good savings
  if (savings > 10000) {
    pool.addAll(_goodSavingsMessages);
  }

  // 7. No savings
  if (savings == 0) {
    pool.addAll(_noSavingsMessages);
  }

  // 8. Heavy EMI burden (EMI > 40% of salary)
  if (latestSalary > 0 && totalEmi / latestSalary > 0.4) {
    pool.addAll(_heavyEmiMessages);
  }

  // 9. Lots of expenses this month
  if (expenseCount > 20) {
    pool.addAll(_manyExpensesMessages);
  }

  // 10. Few days left in cycle
  if (daysRemaining <= 5) {
    pool.addAll(_endOfCycleMessages);
  }

  // 11. Start of cycle
  if (daysRemaining > 25) {
    pool.addAll(_startOfCycleMessages);
  }

  // 12. Late night spending check
  if (hour >= 22 || hour < 4) {
    pool.addAll(_lateNightMessages);
  }

  // 13. Morning motivation
  if (hour >= 5 && hour < 10) {
    pool.addAll(_morningMessages);
  }

  // 14. Always add generic funny messages as filler
  pool.addAll(_genericFunnyMessages);

  return pool[random.nextInt(pool.length)];
}

// ─── Fallback list (original style, kept for compatibility) ─────────────────
final home_scroll_messages = _genericFunnyMessages;

// ─── Message Pools ───────────────────────────────────────────────────────────

const _salaryAlmostGoneMessages = [
  "🚨 Bhai salary toh almost pati gayi che.",
  "💀 Mahino baki che pan paisa almost khatam.",
  "😬 Wallet kahe che: bas kar have.",
  "🪙 Last thoda rupees j bachela che.",
  "🍜 Have toh Maggi budget partner che.",
  "📉 Salary no graph niche j jai raho che.",
  "🛑 Shopping app kholta pela 2 vaar vichar.",
  "😵 Salary kya gayi eni inquiry chalu che.",
];

const _salaryHealthyMessages = [
  "🎉 Salary strong hai! Thoda save karo, thoda enjoy.",
  "💚 Badhiya! Salary healthy che. Saving bhulo nahi.",
  "🤑 Wallet full! Invest karo, mattress ma nahi.",
  "😎 Financial hero! Keep this energy all month.",
  "📈 70%+ salary left — investor mindset activate!",
  "🏦 Itni salary bachi? Bank mein dalo, party baad mein.",
  "🚀 You're crushing it! SIP start karo aaj j.",
  "💪 Salary safe hai. Ab savings goal set karo.",
];

const _salaryMidMessages = [
  "⚖️ Budget balanced! Not bad, not great.",
  "🤔 50-50 situation. Kharcho sambhalo, bhai.",
  "🧮 Mid-month check: on track? Keep going!",
  "👀 Half salary spent. Doosri half wisely use karo.",
  "🌓 Halftime! Kya goal pura karo ge?",
  "📊 Average spending detected. Up your saving game!",
  "🎯 Still in the game. Finish month strong!",
];

const _walletEmptyMessages = [
  "👛 Wallet officially khali che.",
  "💸 Wallet ma hava full speed ma fari rahi che.",
  "😶 UPI pan ignore kari rahyu hoy evu lage che.",
  "☠️ Wallet balance ne shraddhanjali.",
  "🏠 Ghar nu jamvanu = smart financial decision.",
  "📴 Broke level dangerous zone ma che.",
];

const _walletLoadedMessages = [
  "💰 Aaje wallet VIP mood ma che.",
  "🤑 Paisa joi ne Zomato excited thai gayu.",
  "👑 Rich vibes... thodi vaar mate 😄",
  "🎩 Wallet mota bhai mode ma che.",
  "🛡️ Sale season thi savdhan rehjo.",
];

const _goodSavingsMessages = [
  "🏦 Savings looking great! Future you is proud.",
  "🌱 Savings growing nicely. Invest karne ka soch!",
  "✨ Solid savings! Emergency fund almost ready.",
  "🎓 Savings = Freedom. You're getting there!",
  "💎 10K+ savings! Next goal: mutual funds?",
  "🙌 Saving champion! Keep the streak alive.",
  "📦 Savings stockpiled! Rainy day = covered.",
];

const _noSavingsMessages = [
  "🪣 Savings: ₹0. Let's fix that today.",
  "💡 Tip: Even ₹100/day = ₹3000/month saved!",
  "😬 No savings yet. Start small, start now.",
  "🌧️ Rainy day fund = ₹0. Umbrella kidhar hai?",
  "⚠️ Zero savings is a red flag. Time to act!",
  "🐣 Saving ka pehla kadam ek rupiya se bhi hota hai.",
  "📵 Netflix se zyada savings important hai.",
];

const _heavyEmiMessages = [
  "🏋️ Heavy EMI load bhai! 40%+ salary gone in EMIs.",
  "🔗 Chained to EMIs! Clear them ASAP.",
  "😮‍💨 EMI season is rough. Hang in there.",
  "💳 Too many EMIs? Time to rethink purchases.",
  "📅 EMI life is hard life. But you got this.",
  "🛒 Credit card khush, wallet dukhi. Balance karo.",
  "⚡ EMI power consuming 40% salary. Reduce load!",
];

const _manyExpensesMessages = [
  "🧾 20+ expenses this month. You okay bhai?",
  "📝 Expense list longer than Amazon wishlist!",
  "🛒 Bahut kharcha! Kuch cheez zarurat thi?",
  "🤯 Expenses pe expenses. Control karo bhai!",
  "📋 Transaction history looks like a grocery novel.",
  "💸 Paise ude ja rahe hain. Kuch cut karo.",
  "🧨 Spending spree detected! Time to pause.",
];

const _endOfCycleMessages = [
  "⏰ 5 days left! Kya bachao ge?",
  "🏁 Last stretch of the month. Hold tight!",
  "🚂 Month almost done. Budget train arriving.",
  "😤 End of cycle! Survive these last days.",
  "🕐 Almost month-end. Emergency mode activated?",
  "🎯 Last few days — make them count!",
  "🛡️ Defend the budget! Month almost over.",
];

const _startOfCycleMessages = [
  "🌅 Fresh month, fresh budget! Plan wisely.",
  "🎉 New cycle started! Set your goals now.",
  "📋 Month just started. Make a budget plan!",
  "🚀 New month, new financial goals. Go!",
  "✨ Clean slate! Don't repeat last month's mistakes.",
  "🗓️ Month 1 day in. How's the plan looking?",
  "💡 Early month = best time to budget.",
];

const _lateNightMessages = [
  "🌙 2 AM shopping = savare regret.",
  "🛍️ Rate budget weak thai jaye che.",
  "😴 Su ja bhai, Amazon bandh kar.",
  "🍕 Midnight cravings wallet ne hurt kare che.",
  "🦉 Late night online shopping dangerous che.",
];

const _morningMessages = [
  "☀️ Good morning! Plan today's budget first.",
  "🌄 Subah ho gayi! Aaj kharcha kam karna hai.",
  "☕ Morning chai budget ma fit hoti hai. Good start!",
  "🌞 New day! Track every rupee today.",
  "🐓 Rise and save! Morning budgeting = evening peace.",
  "🎯 Start the day with a financial goal in mind.",
];

const _genericFunnyMessages = [
  "💸 Paisa gaya pan memories bani 😄",
  "📈 SIP karo nahi toh bas reels j jovani.",
  "🛒 Cart ma add karvu free hoy che 😌",
  "☕ Daily coffee quietly paisa khai rahi che.",
  "🔥 EMI entered the chat.",
  "🎭 Budget banavyu hatu... follow kon kare?",
  "🧠 Financial discipline > motivational reels.",
  "🐢 Slow savings pan savings hoy che.",
  "🎯 Goal: Paisa bachavva. Reality: Swiggy.",
  "📱 Screen time high, savings low.",
  "🌮 Bahar nu food tasty, ghar nu food budget-friendly.",
  "🪙 Rupee rupee thi future build thay che.",
  "😅 Salary aavi ane instantly invisible thai gayi.",
  "👀 Weekend ma thodu vadhu kharch thai gayu ne?",
  "🏦 Future vala tame current vala tame ne judge kari rahya che.",
  "💡 Offer joi ne badhu jaruri nathi bani jatu.",
  "🧾 Transaction history joi ne bank pan confuse che.",
];
