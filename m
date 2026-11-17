Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957991;
	b=2awVaXCUaVSw+yaBAK1+H7hldtbHZTj9mhfA+Qo75y6pwXvINRPZBnKr/W5dsry/gbDd
	 g5UU+w+ZFZO04FrMDwJIQLtYfunSbEfUzeazmxwbqOYrlutT8aC3BZ39NaM6cHpq33Lbt
	 /zThuj1bY99A68ybePWYfWGXId/j/VVD6g93lPsh32+EtVMzSU0MlIJQxi1CzpXDVfQVe
	 ySYI6phP98n5Q4wWiGsaNK6lb8EX/A+8eCWPnT3aCRCzv08b7OKc0YCRgSJaasprekodw
	 FuykftCNvdV/uPRt+PeBk3kH5OUq6SjiYwIXcOkyXW+euDRYIaPrw6zSz94y2AIdekg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xwRqgCt3CcHiMP0Wio9FutBC6C7E82wdVGDZ8D6AQjU=;
	b=ZhLC/ssO/s9Uag6F0EjLdSMe4VvQqGn1HJZtWXKL4y7rYwMKYD7VLLmXFIdJwoNJzOHr
	 AU3y419mocoTz2oB58l1dP5GnUxFine8U6suaGcK5tde0HA/YGBp+BL644H7R+uihjEyB
	 b8IpMlx0U+OcLC3xXOXi6nWiXsJoXL3hLbfktV9eHI6qOEuRjHn354rkbJMIRVjc2Ko6p
	 ChsEDRZR5Mn8KXs0aYL54zBEEOc4O4kK69rdWvfbcMJ+4oxtCrUEWozkJLTW//D+RJR8L
	 RWxHev0WXEA5MEdC2ZCPBIzupA+9gxvt5lm3a/ly4S8vVy4Hp0OqPLZUAxsI6jtvg0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzQB8tj1;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E59606A897
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70E59606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzQB8tj1
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so2926615e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794957989; x=1795562789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwRqgCt3CcHiMP0Wio9FutBC6C7E82wdVGDZ8D6AQjU=;
        b=bzQB8tj1zLLF4LBlQOYUMJzPbtQ/Wxv2SA0eB2pYZlAIniaE/yGVzCHNq7GKZJP4g2
         y8ZuIfNu2UtS1LydjnrT5fVuHv9GKkPZUU+U2wGN46QC9kPPXXT0+2uze3VafdRIDH9W
         1aTSaNmUbGG3MbaiWoaORt6H052/tjjzLfiRaLwdE/Zi0VHVWX8FShxvCviJDkhel3Mq
         Yp1CEtHGj08AybdhTMHoob7FjtH9qt60sE35nySmZyL6ym+lB4yP1sPRE1INHvE59Rt/
         JDqYNRWitSJuedcOkiw+6Rdhz4UD31e/+EKiza47ArLIdYrkL55LyQM9/YgjVk27Adhz
         tfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794957989; x=1795562789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwRqgCt3CcHiMP0Wio9FutBC6C7E82wdVGDZ8D6AQjU=;
        b=EeWSHGlA2DtEdVm5CpOy6ZMRfSAMflecL/mS8kinF24uTRCQT6yUffaHOcAPsbLZHF
         9CBOa3L7zRILXOOPlOmKvVPV1uGaawVR7ChjgFz/BfBc0U2HknLsMw7tRPRBswEF59a5
         h/b8koCZX+39cA55Nj6Ic+BgNqH2PdhiT5f8K6Iuc+cbYXb2IDkTOnI8neOf2dGO0fiU
         GxvYjH+OuzCSf4kVvFK3454NC13XDPiZF+meruo0v1b6llL6ZISYZoTtMhTC8aFTiG/g
         LAlTVwMa1DlgJ8Vn6Iqzw5EyoETzcn50TaZ/Yd7Fy5gwoFjel9rVwhhfBndhiuonVA1y
         Sb5w==
X-Forwarded-Encrypted: i=1; AL+hErGbYCVEXZFdHOIDiWZmqeyxH6QQjh1bPxyvjQhRXH4bY9vIOJTGsU4lDEu5rrPmwmSVEAIyVi//+6wEvAQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AzwYBkZ0ekpD28Od5flf0qNVgycRU+NzdLyS71ikq84TuTetZ
	GNJWSs9wh4rnNR/D58mcMgWFbU/03G4sNabtB7IxZCCfdVvGO42dUsEc
X-Gm-Gg: AYBFou25yysL7UhL64qcU+KZdLryCIL+QdEahh3Zxk8lLFQK8aV++fqcKNi7gOF20bO
	59Ngx2yks/UaDamf0DlGEcUHIRYy8zBGcvNpyN5r6ukJUSxohq342s2KWCvf3lszU7WloJ4c9sq
	H/jBgaSa5MXkeukUZlinHipK6L2hJvMP4T+F8BgkPq+CojRDs54+YjBnJqpm8Q7VcjHXttzns8z
	r3Lh/ywfE3L8gdv+zbNwYZrUmy1JuPR419EKZT2x2HDAug+Q4BmnWWW5Yz39PVBoa4rOCvXBwKa
	dx98OMMZPubW1XedNpluYM69TYONWuXc8Y8l9EhaLq9lhQghR2JHGFY3EKml4+L4plmTai5nCmN
	cUCAnae19WFLHvsi/xOLaqxdO6Gvz6o4UcEaypD1iPdyQ/KAWi7ujvXyLUKERA/bQuKIAPqXM8o
	DZNMp+N+3itQievBUwJfDmulQfBtrecVLvyWtjFknSlrbwm4AHmY5Q1YKrp/pYUbbPLSZBztQ6o
	v38l6tCAy/RAnqZnC9pePVTBrWxEfKGFNLvCFxbUMxoeUPguS7gYbHdkOKSYuoAp9agMWDbmuw6
	eiIRqptFPaNoK6W/qVXIgxcOUS1Sej3f6lDK
X-Received: by 2002:a05:600c:a07:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4bb7d57770fmr15849105e9.0.1794957988643;
        Tue, 17 Nov 2026 15:26:28 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b979bsm20013915e9.11.2026.11.17.15.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:26:28 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v12 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Wed, 18 Nov 2026 00:26:24 +0100
Message-ID: <20261117232624.1956815-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117232624.1956815-1-mehmet.fide@gmail.com>
References: <20261117232624.1956815-1-mehmet.fide@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The countdown downloads are queued one beacon interval apart, with no
relation to the TBTT. A download that runs late past the next TBTT
leaves a count out of the air.

Read the TSF after each download and queue the next step 10 ms after the
first TBTT that is at least 10 ms away. Every count that was downloaded,
the first one too, then has a TBTT to go out at; a download that runs
late delays the switch by a beacon interval instead of taking a count
off the air, and stations that took the time of the switch from an
earlier count then switch up to that interval before the AP. As with a
driver that fetches each beacon with ieee80211_beacon_get(), the first
CSA beacon carries the count after the first step.

The first count is downloaded the same way, not when mac80211 changes
the beacon: a download close to a TBTT keeps beacons off the air. On an
RTL8821CU and an RTL8822CU a TBTT during the download sent no beacon or
the old one. On an RTL8822CE a TBTT up to about 100 us before the
download sent none and the next beacon stayed out too, and with a count
of 2 no CSA beacon went out. A step, the one that finishes the switch
too, that would run less than 5 ms after a TBTT or less than 10 ms
before one waits until 10 ms after that TBTT instead; with a beacon
interval of 20 ms or less there is no room for that and the steps are
not held. The switch completes up to one beacon interval later. The
replay after a hardware restart still downloads at once.

The USB chips raise no TBTT interrupt, so the TSF register is read. The
beaconing interface is always on port 0: rtw_core_port_switch() moves
an AP there, an IBSS runs alone.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/net/wireless/realtek/rtw88/fw.c       | 70 ++++++++++++++++---
 drivers/net/wireless/realtek/rtw88/mac80211.c |  9 ++-
 drivers/net/wireless/realtek/rtw88/main.h     |  1 -
 drivers/net/wireless/realtek/rtw88/reg.h      |  1 +
 4 files changed, 66 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 0910a9c7d7bc..755c35747559 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -3,6 +3,7 @@
  */
 
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 
 #include "main.h"
 #include "coex.h"
@@ -1824,16 +1825,54 @@ bool rtw_fw_csa_active(struct rtw_dev *rtwdev)
 	return !!rtwdev->csa_vif;
 }
 
-/* paced from the first download: a late one does not delay the next */
+#define RTW_CSA_TBTT_MARGIN_US	10000
+
+static u64 rtw_fw_read_tsf(struct rtw_dev *rtwdev)
+{
+	u32 hi, lo, tmp;
+
+	hi = rtw_read32(rtwdev, REG_TSFTR + 4);
+	lo = rtw_read32(rtwdev, REG_TSFTR);
+	tmp = rtw_read32(rtwdev, REG_TSFTR + 4);
+	if (tmp != hi) {
+		hi = tmp;
+		lo = rtw_read32(rtwdev, REG_TSFTR);
+	}
+
+	return ((u64)hi << 32) | lo;
+}
+
+/* how long to wait so that a step does not run next to a TBTT */
+static u32 rtw_fw_csa_hold(struct rtw_dev *rtwdev, u32 interval)
+{
+	u32 rem;
+
+	if (interval <= 2 * RTW_CSA_TBTT_MARGIN_US)
+		return 0;
+
+	div_u64_rem(rtw_fw_read_tsf(rtwdev), interval, &rem);
+	if (rem < RTW_CSA_TBTT_MARGIN_US / 2)
+		return RTW_CSA_TBTT_MARGIN_US - rem;
+	if (interval - rem < RTW_CSA_TBTT_MARGIN_US)
+		return interval - rem + RTW_CSA_TBTT_MARGIN_US;
+
+	return 0;
+}
+
+/* after the first TBTT that can send what was downloaded last */
 static void rtw_fw_csa_queue(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
 {
 	u32 interval = ieee80211_tu_to_usec(vif->bss_conf.beacon_int);
-	s64 delay;
+	u32 delay, rem;
+
+	div_u64_rem(rtw_fw_read_tsf(rtwdev), interval, &rem);
+	delay = interval - rem;
+	if (delay < RTW_CSA_TBTT_MARGIN_US)
+		delay += interval;
 
-	rtwdev->csa_due = ktime_add_us(rtwdev->csa_due, interval);
-	delay = ktime_us_delta(rtwdev->csa_due, ktime_get());
 	ieee80211_queue_delayed_work(rtwdev->hw, &rtwdev->csa_beacon_work,
-				     usecs_to_jiffies(max(delay, 0)));
+				     usecs_to_jiffies(delay +
+						      RTW_CSA_TBTT_MARGIN_US));
 }
 
 void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
@@ -1848,7 +1887,6 @@ void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
 	rtwdev->csa_vif = vif;
 	rtwdev->csa_retry = retry;
 	rtwdev->csa_count = ieee80211_beacon_cntdwn_is_complete(vif, 0) ? 1 : 0;
-	rtwdev->csa_due = ktime_get();
 	rtw_fw_csa_queue(rtwdev, vif);
 }
 
@@ -1884,6 +1922,7 @@ void rtw_fw_csa_beacon_work(struct work_struct *work)
 	struct rtw_dev *rtwdev = container_of(work, struct rtw_dev,
 					      csa_beacon_work.work);
 	struct ieee80211_vif *vif;
+	u32 hold;
 	u8 count;
 
 	mutex_lock(&rtwdev->mutex);
@@ -1892,12 +1931,21 @@ void rtw_fw_csa_beacon_work(struct work_struct *work)
 	if (!vif || !vif->bss_conf.csa_active)
 		goto out;
 
-	if (!rtwdev->csa_retry) {
-		if (rtwdev->csa_count == 1) {
-			ieee80211_csa_finish(vif, 0);
-			goto out;
-		}
+	hold = rtw_fw_csa_hold(rtwdev,
+			       ieee80211_tu_to_usec(vif->bss_conf.beacon_int));
+	if (hold) {
+		ieee80211_queue_delayed_work(rtwdev->hw,
+					     &rtwdev->csa_beacon_work,
+					     usecs_to_jiffies(hold));
+		goto out;
+	}
+
+	if (!rtwdev->csa_retry && rtwdev->csa_count == 1) {
+		ieee80211_csa_finish(vif, 0);
+		goto out;
+	}
 
+	if (!rtwdev->csa_retry) {
 		count = ieee80211_beacon_update_cntdwn(vif, 0);
 		if (!count)
 			goto out;
diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 20969dd689df..b918e7041abe 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -392,7 +392,7 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 	struct rtw_coex *coex = &rtwdev->coex;
 	struct rtw_coex_stat *coex_stat = &coex->stat;
 	u32 config = 0;
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&rtwdev->mutex);
 
@@ -447,8 +447,11 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_BEACON) {
 		rtw_set_dtim_period(rtwdev, conf->dtim_period);
-		ret = rtw_fw_download_rsvd_page(rtwdev);
-		rtw_send_rsvd_page_h2c(rtwdev);
+		/* the countdown downloads its beacons after a TBTT */
+		if (!conf->csa_active || changed & BSS_CHANGED_BEACON_ENABLED) {
+			ret = rtw_fw_download_rsvd_page(rtwdev);
+			rtw_send_rsvd_page_h2c(rtwdev);
+		}
 		/*
 		 * A beacon with CSA starts the countdown, also when a restart
 		 * replays it. A beacon without CSA ends it.
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index 0444fd46028e..dc3f6d05ac44 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -2098,7 +2098,6 @@ struct rtw_dev {
 	struct delayed_work csa_beacon_work;
 	struct ieee80211_vif *csa_vif;
 	struct ieee80211_vif *csa_wow_vif;
-	ktime_t csa_due;
 	u8 csa_count;
 	bool csa_retry;
 
diff --git a/drivers/net/wireless/realtek/rtw88/reg.h b/drivers/net/wireless/realtek/rtw88/reg.h
index afcdb66fdb9a..3ff4ae0885ef 100644
--- a/drivers/net/wireless/realtek/rtw88/reg.h
+++ b/drivers/net/wireless/realtek/rtw88/reg.h
@@ -506,6 +506,7 @@
 #define REG_USTIME_TSF		0x055C
 #define REG_BCN_MAX_ERR		0x055D
 #define REG_RXTSF_OFFSET_CCK	0x055E
+#define REG_TSFTR		0x0560
 #define REG_MISC_CTRL		0x0577
 #define BIT_EN_FREE_CNT		BIT(3)
 #define BIT_DIS_SECOND_CCA	(BIT(0) | BIT(1))
-- 
2.56.0

