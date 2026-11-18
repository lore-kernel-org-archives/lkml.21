Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998865;
	b=xVp1+WfPyFVpzqJ/OkVh8iTBBkYABXwRbV0w8fLmFwtHWkt0ZTTfE23JEiWC5csB5eKI
	 Gt/v+mrHWMAxDRNbXHFIxOOV+dzrr+XtIG0yt7sjjHNg5rfHobChghcDxfK/sRrw2gE9P
	 LmirFc82ZdaAjxHjo9pdn/OK91vB4gHo+wYP1Lj7mculkmRa/W8v2/Ss7SkjN23/0rgMJ
	 pINNa8OZf0pjBDGneMiLDzUjj9Ps7ZZroq3PSjBbrPg8f8PGtkV/fSyVmNhazxIj+A2XB
	 4ZbJ41DmcF+fcLwbpr0VN/TdC30iDkCOkdCvJgZrW1YqOf94/ert03lJZYYl8W7M2Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dmM67f7dnvS7ekX0wLU4p/nyag0ug9oC2PUG6KXqhxE=;
	b=nUrHbhitxm8A6C+4DDHi7FFexTQzI7S01OR4PoHghVkRJaywuzIm0ArCXkauiJl18Jnv
	 PFQFnHbKFfAGes6u60CgFODQ/ripdtdkZYXWSmPajBuwjWXzv4qnSFp7Qb26uyTpsSqOU
	 oyLIa99hnzs3BA8RDRe5NiI0qeTeFQrR7x1fqXAcKI46AjwshaadLbb7yrONW8pMBDNEY
	 ufdJhzUurkdI3HGgXn1crlNDDSGdmrEusBFxyvnVwfYfq0Si1Fp6N6+qnBdhx+gjJ4XLo
	 yXZmwSptyNO+xgRRk0F7mfLZHhg9DsW5dCx1M2JaxlziBMOyj1cez4CCzuPLymNe6Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z3M22g9p;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3CF60A2604
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E3CF60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z3M22g9p
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so649928f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998860; x=1795603660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dmM67f7dnvS7ekX0wLU4p/nyag0ug9oC2PUG6KXqhxE=;
        b=Z3M22g9pOSAMlNQI2lPr36Rxmq/Al037EkxtL4M2qfFlxT/8fn/LSpjL5vjjVM8SHZ
         yOLiRiSWbEDs7iVphhsQcYC7nkiPP8f3bu6KYK+N//+JVbwz6yO6UJpN5U9NAn1HWy6u
         oMn9Vb/q5EU6sZq1rUQMRDmRAQPQreTfpC6Xpd1KKyCEtK/VffGtgnZFccYhkuiOw8WU
         LjGrMUZ0kvp60q2D9Qg+h4Muy153d1qdQ9nWhC4WrTcWDk3pw/aCrmYMzsG0uQDEbWB4
         r78Flcv3cCSzthuldKMRu4hTtzB1WURYWfzFqYZ0uTBZ2R7HpmVMqyaDP/3sGXWTgrRk
         UYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998860; x=1795603660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dmM67f7dnvS7ekX0wLU4p/nyag0ug9oC2PUG6KXqhxE=;
        b=JU8mTLufpx5zfjlhBYuaMKkFBFk3iS2yFUoCmfNoWky0KqgXaEsMxPf3ZVv9w9O8ZZ
         Id2gu9JOJY3wUZLoRJdYJgK/PB8rPXh93ZRxrWyQ+ThEaUrVTXAKx7Yb6c8NlED+RwpO
         1zyZ7UAnME5sgixMqt1wIH9w6zSs8diwnVtDY2xHl+YgZqgfkueKwfnwmDrLJVqwFQp4
         9kmFZ0ZTozixgaasP4CDcyUT/QtsdIYUVpigPS9ItfuSGSbLYSqcAIvtv+bBGn5e5Klq
         NFzNpU/4PS1RJj2yOQcP5DHGqjrQPmtLfdKw8crp9TalQuB6tj6O+BHiFXx1KYkoXqDY
         h3kQ==
X-Forwarded-Encrypted: i=1; AL+hErGTIqO75KWuhtcSAZBAYa2W0ClUiuoQ5noA2BTqLLWY46P+/xMNalHx7AFDCKO90BiXuqCK3PFntcjdUZw=@vger.kernel.org
X-Gm-Message-State: APuU4Z97FlcrJz+JyJoOBjUQqMnHrP9LTKZ60NPq8oljmIgnE2B2IVWW
	3qzqjI39bAJEG+MCjCN0l68XWaK7Uy8Bc0P1OqB2XdqtCPe0YjyNKTlCY57mX7LD
X-Gm-Gg: AZFdTZd0st2OPWw3/ImeLOGSmPGlbghQu5Zj3S7klgGRtJQ7zHomj1ZrUCB7HMszWlv
	OEmufzbvbbfmMwt0qmEAw4Y5+oDQc5KJ9/ly2lfbH1eS34q2M+PdCNIn9shCjOslrylNVqzp7B8
	eQ3omkOBI9PfVtF9h0YwRYEtSWpspDPAVKpNLHp6FeDVDhU3GJG0To9y0fxLwGpo+97fjrCl9u7
	EKlejxth6/cM8h+Z7pyA9l90CT1xoUC1DlDb5WUMjYL3Aj8xsl1xqMb2dXXiylufQmRlOMS+y2u
	f+J97GOMyuipIDWChrWQGd0M0DLm392EDcl4/wkx2pKc+ZzwGFXtSoVe2Xb1N8Rq4wRc0EjqaRy
	EizumVMhJzixdRD+uuTiqj++SFCLjQy2wpyXpK8VfdbDnR5BGdLeqZyZkriPuiCx9DLa4AHC8SP
	03nJ06F/T0R1FQIuoG+50y2cdWqvp3fsAIlIi4qwBXUwUBIlFpugsNj+QLHd9WFVsy9Co3H7fPx
	xnNnQ7o/GuUyPS+TKidbir7uitypAbeTiaKjEvBvW3IA704SkcPDfwXdaLPBg8xF/cmGTyaen9y
	EOwhn6jfCa9sStPMnljSPQ7oXnpjtrRee7mkxRlVFQX+vIqv/omIwjBr
X-Received: by 2002:a05:6000:299c:20b0:49c:9e8a:31ad with SMTP id ffacd0b85a97d-4a63ab743f8mr3210519f8f.42.1794998860278;
        Wed, 18 Nov 2026 02:47:40 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c11643sm3883554f8f.49.2026.11.18.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:47:39 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Po-Hao Huang <phhuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next] wifi: rtw88: find an associated station without allocating
Date: Wed, 18 Nov 2026 11:47:38 +0100
Message-ID: <20261118104738.2020747-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
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

rtw_core_check_sta_active() collects the interfaces with
rtw_iterate_vifs(), which allocates an entry per interface with
GFP_ATOMIC and skips the interface when that fails. A station skipped
this way counts as not active: on BSS_CHANGED_BSSID and in
rtw_ops_stop_ap() rtw_clear_op_chan() then drops the operating channel
saved for it, and a later hardware scan no longer goes back to that
channel between the channels it scans.

Both callers hold the wiphy mutex. Walk the active interfaces with
for_each_active_interface(), which does not allocate.

Fixes: 96fbb84de4ff ("wifi: rtw88: handle station mode concurrent scan with AP mode")
Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-wireless/9BC4FC13-5723-4711-9798-11E3C285C7F1@linux.dev/
Suggested-by: Ping-Ke Shih <pkshih@realtek.com>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Tested on rtw-next with a test build that fails one entry allocation of
    rtw_iterate_vifs() inside rtw_core_check_sta_active(): on an RTL8822CE
    and an RTL8822CU with a station interface associated and an AP started
    next to it and stopped, the saved operating channel was cleared in 6 of
    6 stops without the patch and in none of 6 with it. AP, association,
    firmware recovery and scan on an RTL8822BU and the RTL8822CE on 2.4 and
    5 GHz gave no lockdep report.

 drivers/net/wireless/realtek/rtw88/main.c | 30 +++++++++++------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index 2a38a6828e3a..826e1bc37243 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -2448,28 +2448,26 @@ void rtw_core_port_switch(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
 	rtw_iterate_vifs(rtwdev, rtw_port_switch_iter, &iter_data);
 }
 
-static void rtw_check_sta_active_iter(void *data, struct ieee80211_vif *vif)
+bool rtw_core_check_sta_active(struct rtw_dev *rtwdev)
 {
-	struct rtw_vif *rtwvif = (struct rtw_vif *)vif->drv_priv;
-	bool *active = data;
-
-	if (*active)
-		return;
+	struct ieee80211_vif *vif;
+	struct rtw_vif *rtwvif;
 
-	if (vif->type != NL80211_IFTYPE_STATION)
-		return;
+	lockdep_assert_wiphy(rtwdev->hw->wiphy);
 
-	if (vif->cfg.assoc || !is_zero_ether_addr(rtwvif->bssid))
-		*active = true;
-}
+	if (rtwdev->ap_active)
+		return true;
 
-bool rtw_core_check_sta_active(struct rtw_dev *rtwdev)
-{
-	bool sta_active = false;
+	for_each_active_interface(vif, rtwdev->hw) {
+		if (vif->type != NL80211_IFTYPE_STATION)
+			continue;
 
-	rtw_iterate_vifs(rtwdev, rtw_check_sta_active_iter, &sta_active);
+		rtwvif = (struct rtw_vif *)vif->drv_priv;
+		if (vif->cfg.assoc || !is_zero_ether_addr(rtwvif->bssid))
+			return true;
+	}
 
-	return rtwdev->ap_active || sta_active;
+	return false;
 }
 
 void rtw_core_enable_beacon(struct rtw_dev *rtwdev, bool enable)

base-commit: 0bdc579dbfc251a6b6838ee9459b6771b948c617
-- 
2.56.0

