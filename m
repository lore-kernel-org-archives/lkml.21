Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289813;
	b=SXydb+s8Vq8FuWUb6rkHGXD4vh7Zh1X/ijUFa1wOfhll26/tM7UauKy10mzm3kamCR0k
	 UomJSvrg7KYt6wuIq0bEFUQloz4EkQ8q707go0zmKVy8eTEKZtWwRNz6EJ8gjMVyNQy3Y
	 Rz5dppjKR1kVAhHGzqAbjR6f4iRKR5O/FdhLNn/d+B1PTdCdAYLKS0O5zCEbmS5dse6jq
	 vK1BISDRKKAN64aqXf2e6otCkVdXAxCToL6VRgm8VkP4+Jxnq3FNgoyiIsBbF4GyRFuHL
	 +9Qze07C+x2xIzeSX/kjpCJ6HhvjY4fsABgIQHtSsNGt8vFcZ21zPJ9zLrKu5jBQwCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6AAGWFnUnmtne/xBpwCek8lY/qOJ5UPyZmOfCh8cYXY=;
	b=2B3D542T3VOQR0qD9fI7ICuA6Kk3H5/QiFSmDP5LoCQqbWLqEm2Ssxfu3OLcy1zkdVoS
	 6d0EDXfZC0estIYcG+qfTLRo/wjOTZe3FBgf5xLEdKICUtGt/zsrfkla/R9GLKPEB5skF
	 1qLXfwv/KX0N4wvj+UcMRdrHHn0rDzsXY3egSFlE4Q6YvE8LTaFO+/h+u4WrbSIwEBreH
	 vf0M6RyR+A8FlIrU/U0s8/glqtlz5RCUuoynJhxw+c0nopNB1FGkAtjVOMNXYQvXYUVy3
	 4QiB4+RWMocb42Oeogj2EhXwbaKyoqZYS4kPuzs4M/Q1UWPko/AsHfnRUzRpaB5BB4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fyRJwLlJ;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3476B606A331
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3476B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fyRJwLlJ
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f269e335eso261062585a.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795289812; x=1795894612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6AAGWFnUnmtne/xBpwCek8lY/qOJ5UPyZmOfCh8cYXY=;
        b=fyRJwLlJrv37XPyARKP2qXwcSHNOu3doC6kjxvnhWBDkCGlBTw0mTpBTh5zx9lGpJE
         mzvBuNgWmkbLCOBP1HnC04hIELtD/RHHBGDqIrPAkImMbq51OpOhrWyeIKROHzVygpmc
         P06nKCSWWWGRBLi02aFTfV6z56CoH98jTMQV9zIZGPwGLskriz6totpUmNbDpOTbgC0E
         L9JeYiHFxPla5or9qty67OTxlxvTEVILip6V7N+jN7ZGqwpVArgM9Ul9xtW61OW3Ys49
         GfZV+mYT71rk58hXm0qosGZTHCV9DCWVaJEBAxNkEvdJTiCjCO0Cc/cBlU7n7gOZ5fH0
         71mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795289812; x=1795894612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6AAGWFnUnmtne/xBpwCek8lY/qOJ5UPyZmOfCh8cYXY=;
        b=0QsprmOiesvAVBD3bJLvVKmddGL0/99F0QOlauVNea3Bd3NJv0BV6pOF+w7Xv8M08U
         5x9hQ5/YdEsW/UPEcuXvdRhwJ2oMbL0fyuGmREkFEIbRXwqmpK0UBQSxjDtm0y1GbcKS
         0zwc3E3IREEKGYg4OClvCGVZWEfo2ItNcrY9kGJ9mc3iR8mjQCyCPQ+I3sjendOGK0yK
         hh8qTdq6byNc8R0v7AptPeZBFWvt3BKKdQ+F/j9kUTe8w2rYFry7u0ZUmzzCKJH8WT7a
         VIGAn5EnJuO/nF6e+3mK1Px3/Gir85zH/pl0ah3zSOGCtuncPDY7DKDRTbFgPVVZhOAl
         Y8+A==
X-Forwarded-Encrypted: i=1; AL+hErF56qubUXYxs7SlGIGILF9X2sMV78YKi8s2t/6o4rniCFGYM+W0Ym/7RWp33K/K4h9fHqsbO0T6GNtO25s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OUakZP6lXGrQq1eH4vH/xtnXr3ybOPfZK7LKOFuT/1kviKhEp
	57AAiGVzWZDwlZPgqVFdbq5A/9akZVvZTfx5ia1gay0CNrUdSq+dnkjc
X-Gm-Gg: AZFdTZeVruc07HPzYSgh9hR4OR578PvvZM45l8JxuDiw9KMCKyhkpYwv6Vlqqf/jg0E
	zHSQ3oqU8637o9nA+7ZCmWpoGy/ypLfDWHQw9Crzq4WsRiAROcJQZqC8uRGWVTXgFba8QM2AF2U
	BoCEu2Z2w6YQSfj2kC5IQRpRhKDJ2nhBGhu7eb/THEnR391LD7zMTFoRUDkn0oepxXuTpuN0caa
	ZtItmn9OD4QxR/XIJfz+fWGO5TdikodopUfPvqoHfXHXRP+fgJRmAkB8akOns+4/aVjtWMUpqWq
	kxK0BwScxlDQl870GgJXYOo0n1GInwMRFl3dS0xC9HhPpcbWfGYklsU3/liZw9DEbwZkgRmitpi
	5eYM2rch+lLd5YALhmzYY40EGl2M1I3hOoqkHilBQfkaunjY5C2ZQVCgt4RYZfuvSzW+E+JHSVH
	m8NojVgLh4MJg3mVscj1ngqeGiDdqh9+KYwlA32Qk9ofk7vsAbv1/igJ4bTQJ7R9S9DecYj5eaw
	74jd+zRPf8Hht8h0bP3KDRoBkZQBEWjP1+XxKECgxykbIiMx7LLFCrOGPZDJb+7UjxOgetiON9W
	vsGGTg2U2ILxHqYYK+0o4TUq6JGIdvVUu8a2
X-Received: by 2002:a05:620a:448e:b0:949:6fd4:353b with SMTP id af79cd13be357-949ba848065mr1196917785a.10.1795289812102;
        Sat, 21 Nov 2026 11:36:52 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb427388sm466931785a.42.2026.11.21.11.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:36:51 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v14 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Sat, 21 Nov 2026 20:36:44 +0100
Message-ID: <20261121193644.603289-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121193644.603289-1-mehmet.fide@gmail.com>
References: <20261121193644.603289-1-mehmet.fide@gmail.com>
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

The countdown steps run one beacon interval apart with no relation to
the TBTT, and a download close to a TBTT keeps beacons off the air. On
an RTL8821CU and an RTL8822CU a TBTT during the download sent no beacon
or the old one. On an RTL8822CE a TBTT up to about 100 us before the
download also kept the next beacon out, so with a count of 2 no CSA
beacon went out.

Read the TSF and queue each step min(10 ms, interval / 4), but at least
5 ms, after the first TBTT that is at least min(10 ms, interval / 4)
away. A step that runs less than 5 ms after a TBTT, or less than that
margin before one, waits until after the TBTT. The first count is now
downloaded by the work too, not when mac80211 changes the beacon, so
the first CSA beacon carries the count after the first step, as with
drivers that fetch every beacon with ieee80211_beacon_get(). The replay
after a hardware restart still downloads at once.

A late download delays the switch by a beacon interval instead of
taking a count off the air; stations that took the switch time from an
earlier count then switch up to that interval before the AP. At short
intervals a USB download, 6 to 17 ms, can run past the next TBTT, and
the USB chips then send a count more than once.

The USB chips raise no TBTT interrupt, hence the TSF read. The beaconing
interface is always on port 0: rtw_core_port_switch() moves an AP
there, and an IBSS runs alone.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/net/wireless/realtek/rtw88/fw.c       | 75 ++++++++++++++++---
 drivers/net/wireless/realtek/rtw88/mac80211.c |  8 +-
 drivers/net/wireless/realtek/rtw88/main.h     |  1 -
 drivers/net/wireless/realtek/rtw88/reg.h      |  1 +
 4 files changed, 71 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 059fe04014de..47f99e0b4a50 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -3,6 +3,7 @@
  */
 
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 
 #include "main.h"
 #include "coex.h"
@@ -1815,15 +1816,60 @@ bool rtw_fw_csa_active(struct rtw_dev *rtwdev)
 	return !!rtwdev->csa_vif;
 }
 
+#define RTW_CSA_TBTT_MARGIN_US	10000
+#define RTW_CSA_TBTT_AFTER_US	5000
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
+static u32 rtw_fw_csa_margin(u32 interval)
+{
+	return min_t(u32, RTW_CSA_TBTT_MARGIN_US, interval / 4);
+}
+
+static u32 rtw_fw_csa_after(u32 interval)
+{
+	return max_t(u32, rtw_fw_csa_margin(interval), RTW_CSA_TBTT_AFTER_US);
+}
+
+static u32 rtw_fw_csa_hold(struct rtw_dev *rtwdev, u32 interval)
+{
+	u32 rem;
+
+	div_u64_rem(rtw_fw_read_tsf(rtwdev), interval, &rem);
+	if (rem < RTW_CSA_TBTT_AFTER_US)
+		return rtw_fw_csa_after(interval) - rem;
+	if (interval - rem < rtw_fw_csa_margin(interval))
+		return interval - rem + rtw_fw_csa_after(interval);
+
+	return 0;
+}
+
 static void rtw_fw_csa_queue(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
 {
 	u32 interval = ieee80211_tu_to_usec(vif->bss_conf.beacon_int);
-	s64 delay;
+	u32 delay, rem;
+
+	div_u64_rem(rtw_fw_read_tsf(rtwdev), interval, &rem);
+	delay = interval - rem;
+	if (delay < rtw_fw_csa_margin(interval))
+		delay += interval;
+	delay += rtw_fw_csa_after(interval);
 
-	rtwdev->csa_due = ktime_add_us(rtwdev->csa_due, interval);
-	delay = ktime_us_delta(rtwdev->csa_due, ktime_get());
 	ieee80211_queue_delayed_work(rtwdev->hw, &rtwdev->csa_beacon_work,
-				     usecs_to_jiffies(max(delay, 0)));
+				     usecs_to_jiffies(delay));
 }
 
 void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
@@ -1838,7 +1884,6 @@ void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
 	rtwdev->csa_vif = vif;
 	rtwdev->csa_retry = retry;
 	rtwdev->csa_count = ieee80211_beacon_cntdwn_is_complete(vif, 0) ? 1 : 0;
-	rtwdev->csa_due = ktime_get();
 	rtw_fw_csa_queue(rtwdev, vif);
 }
 
@@ -1873,6 +1918,7 @@ void rtw_fw_csa_beacon_work(struct work_struct *work)
 	struct rtw_dev *rtwdev = container_of(work, struct rtw_dev,
 					      csa_beacon_work.work);
 	struct ieee80211_vif *vif;
+	u32 hold;
 	u8 count;
 
 	mutex_lock(&rtwdev->mutex);
@@ -1881,12 +1927,21 @@ void rtw_fw_csa_beacon_work(struct work_struct *work)
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
 
+	if (!rtwdev->csa_retry && rtwdev->csa_count == 1) {
+		ieee80211_csa_finish(vif, 0);
+		goto out;
+	}
+
+	if (!rtwdev->csa_retry) {
 		count = ieee80211_beacon_update_cntdwn(vif, 0);
 		if (!count)
 			goto out;
diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 5b6aaa41bac8..46636b190dc3 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -398,7 +398,7 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 	struct rtw_coex *coex = &rtwdev->coex;
 	struct rtw_coex_stat *coex_stat = &coex->stat;
 	u32 config = 0;
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&rtwdev->mutex);
 
@@ -457,8 +457,10 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_BEACON) {
 		rtw_set_dtim_period(rtwdev, conf->dtim_period);
-		ret = rtw_fw_download_rsvd_page(rtwdev);
-		rtw_send_rsvd_page_h2c(rtwdev);
+		if (!conf->csa_active || changed & BSS_CHANGED_BEACON_ENABLED) {
+			ret = rtw_fw_download_rsvd_page(rtwdev);
+			rtw_send_rsvd_page_h2c(rtwdev);
+		}
 		if (conf->csa_active)
 			rtw_fw_csa_start(rtwdev, vif, !!ret);
 		else
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index 3db76133d7ab..b369a299bc3f 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -2099,7 +2099,6 @@ struct rtw_dev {
 	struct delayed_work csa_beacon_work;
 	struct ieee80211_vif *csa_vif;
 	struct ieee80211_vif *csa_wow_vif;
-	ktime_t csa_due;
 	u8 csa_count;
 	bool csa_retry;
 
diff --git a/drivers/net/wireless/realtek/rtw88/reg.h b/drivers/net/wireless/realtek/rtw88/reg.h
index 877b82640e91..3a2255422d78 100644
--- a/drivers/net/wireless/realtek/rtw88/reg.h
+++ b/drivers/net/wireless/realtek/rtw88/reg.h
@@ -507,6 +507,7 @@
 #define REG_USTIME_TSF		0x055C
 #define REG_BCN_MAX_ERR		0x055D
 #define REG_RXTSF_OFFSET_CCK	0x055E
+#define REG_TSFTR		0x0560
 #define REG_MISC_CTRL		0x0577
 #define BIT_EN_FREE_CNT		BIT(3)
 #define BIT_DIS_SECOND_CCA	(BIT(0) | BIT(1))
-- 
2.56.0

