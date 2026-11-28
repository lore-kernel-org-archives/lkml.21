Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850344;
	b=K/wpQWAuIwhb9PNL2kq7K0EzflyVque63CqK9Js9MjvUemG1u1L9UdD1v4ZJ6Iir6Mkn
	 +EdbC5JPo9YmaGCEzBba49kby/MMjaDy6Wxqhq3DyPfOE89eDJom1v9c2AqheqPbyKQId
	 d2f93KDcLYcjenWP9sA5ZmLunjNLafoNaQb+I0L2scJ8DVweelPAzXMX62Wn8O+/1zkCv
	 6hUhuet8EHgU/pc66ee+10FUlp5bDOJq0OToAItgEG3HCRUp9xvffjsezRoGCxRENLkUT
	 STy1Z+he3dDRN7mBS4XQWrQmbdAzg7OSCXLzDmBhnRCX8WN9iTNUsfjX9wOZgZ9oQ5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nCeZwu1EsC28FUrfWqDF7xROMEaLbrgj6c/iuYM6R5s=;
	b=5cUYCwRYYXJckeM8Bfek2jPU2Xw4vc1k6ianMRPd16WHu7oSpZ9/Rs7MBjawi2hpNf+k
	 1C/JDFJyycrCRpNz0OBNXTHI+wJ4oiz6Cfh4MXSX8pkI10CYWiYZAQWOTE7FoTQjiE4DM
	 w3gwlV97+5io9WIletnsOqoy2yp4P6eWu+ghYEkAsCU1P0Lh9Ms+xBcAQRhZk7nZTfxB/
	 /AAIqmvJi/4PuZnHQptblVEfCuQPosfbhAn8vCqRQYX/bmcCaise6ly57eA3sbuiE3zRP
	 JPhzhc1W/wRD9WydBVYKkbGKUm1FHiASpg1h9Rcug4G0RBOBauZfPdgt8y0abrlioug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uoeKyNz7;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD791606A335
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD791606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uoeKyNz7
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so72042545e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795850342; x=1796455142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nCeZwu1EsC28FUrfWqDF7xROMEaLbrgj6c/iuYM6R5s=;
        b=uoeKyNz7Ewf256AmZoVh+usaiWSwxVKujfjZ4FyxtxR/s+K4GcRmSBR3Kf3EvLOrHK
         nfV/wmzxbLmjWjQYtJoaN3R6o+MO9XtQeutggA8epeNs3ga785bhKP+qoxhatK8dzrzu
         6fJa4DpxA7RzwfMx81RHUwl7hdCxjCiqpJ2uRKFdzfUeGswQsb0WEkmphJwbErhhyte2
         T42f0psumSmO61rDPwL9J080HWUH27J1iLAiDlikq/BO6avABEr6hWYyJSm740fHGSrt
         kZUMVyxribZ4NZ8ugBeLgpRxB/ceiXv+xrAJV3wE2dCYsI91y4l9uFEiCh3cJrr5Bulh
         Mrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850342; x=1796455142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nCeZwu1EsC28FUrfWqDF7xROMEaLbrgj6c/iuYM6R5s=;
        b=l0IfZXtfPbvNZR1Zw5tkHfng+1XbBjlXfLRFfk2OACyBXESBKOT4IPKMTnzjn/qkDq
         e4nwqB2Q1wGMBcn9g4gozGjlhFOv9kDCUpyMXLa88/Hedt+HL5EDQfn5DZym//K+66/K
         HYpkm/3s+IpCUrNbePNUmA6IgS0LIK1nkwSMkAsiduqLjmPjEhLHnjXvq64Ca+dnOoqd
         +m3eqtm1PA8cGh4T/VHNZk9/rLFehOj2zjiPbI+mFJDuIBLVaBUBTLBsNGmuWYjGQREa
         WXYqD3s0AlfwhE/df7dEik3sMIk8L+lEmnEO5uxJK8sKzqO9VxU5i3gKtqn9nkt9oDAw
         VfJA==
X-Forwarded-Encrypted: i=1; AL+hErERpFvFgjMxWP4BbSVlABdDx1XJ93AwUXWG6Bfjm3IZ1sQLtWHaInbw4Nusx2+AQ+QLSXuJtI22QXB32pM=@vger.kernel.org
X-Gm-Message-State: APuU4Z83NA7xY6eaI3c4GGTvVjumOaZwK7XE85jMhtm0/Cvbk6HMVSa5
	MedgC/BEtMMiKokLusezlT9j32DNAu4fPkVJEsB9f9D2FU+FHjvq7/h0
X-Gm-Gg: AZFdTZdJHhgqqk2TV5DDwm6U08B7si9mm3SBsCx4kzL8pb2dkSa0Wi8vYjOcdtqBvH3
	kpV/nBjgVC/Vabv2zEq3suEqiD18yqlDhueAZtuvzkKMD+sMn8aAza+U2QzyrPQD7ZraU45sg8j
	1r9Qhwcf/8cEw0S4BD+qXjzgVwL6VndyxCkuVpvOCxd08r0bwW4sAPq5v6K7bMAaIcvrguy4yZd
	b/h1smDMKrkttbCfqa89CaBubJiuoMQlnhOZSJkh64wao2Uk1fhCrNFcE/cs2cqty7FXc4+5wR4
	Q99LBZoprHIYZicT5jJ4KytKo7pCObMu5tbPoBIEMYJLfRa0PDin/qPFCjERAaAQZ3JoA7kWzQz
	Bil821xHSozwrvfQFT1ggPnrjkRy8zOrw1rMAkZYjOZX55xGiHyp3hCuB1WasTfa4j6INyJnkG3
	fW3AXfXg0mdIph+K2D34XeHFICTQ1tbRWAR3RMOX2otRzdEXlBsCk5zguQ0vbozYD4Bvkg8qfKB
	oh3ek3OXemsDQzxomLP9TpErn1wVsDl73NEyi6tNU+i8glQXQVd3z4v47vSV+a3oW836U6s9Jw8
	SthvjG0K4KzATx2c3z97I9ndT6yrmkp69oc=
X-Received: by 2002:a05:600d:4:b0:4bb:abe2:bbd4 with SMTP id 5b1f17b1804b1-4bbabe2bcfdmr146925165e9.19.1795850342080;
        Fri, 27 Nov 2026 23:19:02 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm748649545e9.10.2026.11.27.23.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:19:01 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v15 2/3] wifi: rtw88: support channel switch in AP mode
Date: Sat, 28 Nov 2026 08:18:57 +0100
Message-ID: <20261128071858.42275-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261128071858.42275-1-mehmet.fide@gmail.com>
References: <20261128071858.42275-1-mehmet.fide@gmail.com>
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

The driver does not set WIPHY_FLAG_HAS_CHANNEL_SWITCH, so hostapd's
CHAN_SWITCH is refused and an rtw88 AP can only change its channel by
restarting.

The firmware repeats the beacon of the first reserved page, so the
driver has to step the countdown. Set the flag, and when
BSS_CHANGED_BEACON brings a beacon with CSA, start a delayed work that
advances the count with ieee80211_beacon_update_cntdwn() and downloads
the page once per beacon interval. It calls ieee80211_csa_finish() one
interval after the count of 1 was downloaded, and repeats a failed
download with the same count. IBSS uses the same page and work.

The countdown stops when the AP stops, the interface is removed,
beaconing is disabled, on WoWLAN suspend and in rtw_core_stop(). It
starts again when beaconing is enabled and when a hardware restart
replays the beacon. The CSA state and work are under the driver mutex,
and only the stop paths clear csa.vif.

During a countdown the page beacon is fetched with
ieee80211_beacon_get_template(), which leaves the count alone, so any
other download carries the current count. The TIM update, the PG backup
and the download on association are left to the next step. An AP that
stops with a station interface left downloads the page once more.
Scans are refused, as they would take the AP off its channel.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    v15: the CSA state is in struct rtw_csa (Ping-Ke); the countdown no
    longer starts again after a WoWLAN resume, csa_wow_vif is gone
    (Ping-Ke)

 drivers/net/wireless/realtek/rtw88/fw.c       | 97 ++++++++++++++++++-
 drivers/net/wireless/realtek/rtw88/fw.h       |  5 +
 drivers/net/wireless/realtek/rtw88/mac80211.c | 37 +++++--
 drivers/net/wireless/realtek/rtw88/main.c     |  9 +-
 drivers/net/wireless/realtek/rtw88/main.h     |  9 ++
 5 files changed, 146 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 4575073d0149..d85364cdedaa 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -1226,6 +1226,7 @@ static struct sk_buff *rtw_lps_pg_info_get(struct ieee80211_hw *hw)
 static struct sk_buff *rtw_get_rsvd_page_skb(struct ieee80211_hw *hw,
 					     struct rtw_rsvd_page *rsvd_pkt)
 {
+	struct ieee80211_mutable_offsets offs = {};
 	struct ieee80211_vif *vif;
 	struct rtw_vif *rtwvif;
 	struct sk_buff *skb_new;
@@ -1249,7 +1250,14 @@ static struct sk_buff *rtw_get_rsvd_page_skb(struct ieee80211_hw *hw,
 
 	switch (rsvd_pkt->type) {
 	case RSVD_BEACON:
-		skb_new = ieee80211_beacon_get_tim(hw, vif, &tim_offset, NULL, 0);
+		if (vif->bss_conf.csa_active) {
+			skb_new = ieee80211_beacon_get_template(hw, vif, &offs,
+								0);
+			tim_offset = offs.tim_offset;
+		} else {
+			skb_new = ieee80211_beacon_get_tim(hw, vif, &tim_offset,
+							   NULL, 0);
+		}
 		rsvd_pkt->tim_offset = tim_offset;
 		break;
 	case RSVD_PS_POLL:
@@ -1800,14 +1808,97 @@ int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev)
 	return ret;
 }
 
+bool rtw_fw_csa_active(struct rtw_dev *rtwdev)
+{
+	lockdep_assert_held(&rtwdev->mutex);
+
+	return !!rtwdev->csa.vif;
+}
+
+static void rtw_fw_csa_queue(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
+{
+	u32 interval = ieee80211_tu_to_usec(vif->bss_conf.beacon_int);
+	s64 delay;
+
+	rtwdev->csa.due = ktime_add_us(rtwdev->csa.due, interval);
+	delay = ktime_us_delta(rtwdev->csa.due, ktime_get());
+	ieee80211_queue_delayed_work(rtwdev->hw, &rtwdev->csa.beacon_work,
+				     usecs_to_jiffies(max(delay, 0)));
+}
+
+void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
+		      bool retry)
+{
+	lockdep_assert_held(&rtwdev->mutex);
+
+	if (rtwdev->csa.vif == vif ||
+	    !test_bit(RTW_FLAG_RUNNING, rtwdev->flags))
+		return;
+
+	rtwdev->csa.vif = vif;
+	rtwdev->csa.retry = retry;
+	rtwdev->csa.count = ieee80211_beacon_cntdwn_is_complete(vif, 0) ? 1 : 0;
+	rtwdev->csa.due = ktime_get();
+	rtw_fw_csa_queue(rtwdev, vif);
+}
+
+void rtw_fw_csa_stop(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
+{
+	lockdep_assert_held(&rtwdev->mutex);
+
+	if (!vif || rtwdev->csa.vif != vif)
+		return;
+
+	rtwdev->csa.vif = NULL;
+	cancel_delayed_work(&rtwdev->csa.beacon_work);
+}
+
 void rtw_fw_update_beacon_work(struct work_struct *work)
 {
 	struct rtw_dev *rtwdev = container_of(work, struct rtw_dev,
 					      update_beacon_work);
 
 	mutex_lock(&rtwdev->mutex);
-	rtw_fw_download_rsvd_page(rtwdev);
-	rtw_send_rsvd_page_h2c(rtwdev);
+
+	if (!rtw_fw_csa_active(rtwdev)) {
+		rtw_fw_download_rsvd_page(rtwdev);
+		rtw_send_rsvd_page_h2c(rtwdev);
+	}
+
+	mutex_unlock(&rtwdev->mutex);
+}
+
+void rtw_fw_csa_beacon_work(struct work_struct *work)
+{
+	struct rtw_dev *rtwdev = container_of(work, struct rtw_dev,
+					      csa.beacon_work.work);
+	struct ieee80211_vif *vif;
+	u8 count;
+
+	mutex_lock(&rtwdev->mutex);
+
+	vif = rtwdev->csa.vif;
+	if (!vif || !vif->bss_conf.csa_active)
+		goto out;
+
+	if (!rtwdev->csa.retry) {
+		if (rtwdev->csa.count == 1) {
+			ieee80211_csa_finish(vif, 0);
+			goto out;
+		}
+
+		count = ieee80211_beacon_update_cntdwn(vif, 0);
+		if (!count)
+			goto out;
+		rtwdev->csa.count = count;
+	}
+
+	rtwdev->csa.retry = !!rtw_fw_download_rsvd_page(rtwdev);
+	if (!rtwdev->csa.retry)
+		rtw_send_rsvd_page_h2c(rtwdev);
+	rtw_fw_csa_queue(rtwdev, vif);
+
+out:
 	mutex_unlock(&rtwdev->mutex);
 }
 
diff --git a/drivers/net/wireless/realtek/rtw88/fw.h b/drivers/net/wireless/realtek/rtw88/fw.h
index 48ad9ceab6ea..14bcddbd786d 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.h
+++ b/drivers/net/wireless/realtek/rtw88/fw.h
@@ -863,7 +863,12 @@ void rtw_add_rsvd_page_pno(struct rtw_dev *rtwdev,
 void rtw_add_rsvd_page_sta(struct rtw_dev *rtwdev,
 			   struct rtw_vif *rtwvif);
 int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev);
+bool rtw_fw_csa_active(struct rtw_dev *rtwdev);
+void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
+		      bool retry);
+void rtw_fw_csa_stop(struct rtw_dev *rtwdev, struct ieee80211_vif *vif);
 void rtw_fw_update_beacon_work(struct work_struct *work);
+void rtw_fw_csa_beacon_work(struct work_struct *work);
 void rtw_send_rsvd_page_h2c(struct rtw_dev *rtwdev);
 int rtw_dump_drv_rsvd_page(struct rtw_dev *rtwdev,
 			   u32 offset, u32 size, u32 *buf);
diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index b14d7fffb98f..8a578ef26e15 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -246,6 +246,8 @@ static void rtw_ops_remove_interface(struct ieee80211_hw *hw,
 
 	mutex_lock(&rtwdev->mutex);
 
+	rtw_fw_csa_stop(rtwdev, vif);
+
 	rtw_leave_lps_deep(rtwdev);
 
 	rtw_txq_cleanup(rtwdev, vif->txq);
@@ -394,6 +396,7 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 	struct rtw_coex *coex = &rtwdev->coex;
 	struct rtw_coex_stat *coex_stat = &coex->stat;
 	u32 config = 0;
+	int ret;
 
 	mutex_lock(&rtwdev->mutex);
 
@@ -404,8 +407,10 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 		if (vif->cfg.assoc) {
 			rtw_coex_connect_notify(rtwdev, COEX_ASSOCIATE_FINISH);
 
-			rtw_fw_download_rsvd_page(rtwdev);
-			rtw_send_rsvd_page_h2c(rtwdev);
+			if (!rtw_fw_csa_active(rtwdev)) {
+				rtw_fw_download_rsvd_page(rtwdev);
+				rtw_send_rsvd_page_h2c(rtwdev);
+			}
 			rtw_fw_default_port(rtwdev, rtwvif);
 			rtw_coex_media_status_notify(rtwdev, vif->cfg.assoc);
 			if (rtw_bf_support)
@@ -450,8 +455,12 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_BEACON) {
 		rtw_set_dtim_period(rtwdev, conf->dtim_period);
-		rtw_fw_download_rsvd_page(rtwdev);
+		ret = rtw_fw_download_rsvd_page(rtwdev);
 		rtw_send_rsvd_page_h2c(rtwdev);
+		if (conf->csa_active)
+			rtw_fw_csa_start(rtwdev, vif, !!ret);
+		else
+			rtw_fw_csa_stop(rtwdev, vif);
 	}
 
 	if (changed & BSS_CHANGED_BEACON_ENABLED) {
@@ -461,6 +470,10 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 		else
 			rtw_write32_clr(rtwdev, REG_FWHW_TXQ_CTRL,
 					BIT_EN_BCNQ_DL);
+		if (!conf->enable_beacon)
+			rtw_fw_csa_stop(rtwdev, vif);
+		else if (conf->csa_active)
+			rtw_fw_csa_start(rtwdev, vif, rtwdev->csa.retry);
 	}
 	if (changed & BSS_CHANGED_CQM)
 		rtw_fw_beacon_filter_config(rtwdev, true, vif);
@@ -504,11 +517,16 @@ static void rtw_ops_stop_ap(struct ieee80211_hw *hw,
 	struct rtw_dev *rtwdev = hw->priv;
 
 	mutex_lock(&rtwdev->mutex);
+	rtw_fw_csa_stop(rtwdev, vif);
 	rtw_write32_clr(rtwdev, REG_TCR, BIT_TCR_UPDATE_HGQMD);
 	rtw_write16(rtwdev, REG_ATIMWND, ATIMWND_DEFAULT);
 	rtwdev->ap_active = false;
-	if (!rtw_core_check_sta_active(rtwdev))
+	if (!rtw_core_check_sta_active(rtwdev)) {
 		rtw_clear_op_chan(rtwdev);
+	} else {
+		rtw_fw_download_rsvd_page(rtwdev);
+		rtw_send_rsvd_page_h2c(rtwdev);
+	}
 	mutex_unlock(&rtwdev->mutex);
 }
 
@@ -640,7 +658,8 @@ static int rtw_ops_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	}
 
 	/* download new cam settings for PG to backup */
-	if (rtw_get_lps_deep_mode(rtwdev) == LPS_DEEP_MODE_PG)
+	if (rtw_get_lps_deep_mode(rtwdev) == LPS_DEEP_MODE_PG &&
+	    !rtw_fw_csa_active(rtwdev))
 		rtw_fw_download_rsvd_page(rtwdev);
 
 out:
@@ -860,6 +879,7 @@ static int rtw_ops_suspend(struct ieee80211_hw *hw,
 	int ret;
 
 	mutex_lock(&rtwdev->mutex);
+	rtw_fw_csa_stop(rtwdev, rtwdev->csa.vif);
 	ret = rtw_wow_suspend(rtwdev, wowlan);
 	if (ret)
 		rtw_err(rtwdev, "failed to suspend for wow %d\n", ret);
@@ -907,20 +927,23 @@ static int rtw_ops_hw_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	struct rtw_dev *rtwdev = hw->priv;
 	int ret;
 
+	guard(mutex)(&rtwdev->mutex);
+
+	if (rtw_fw_csa_active(rtwdev))
+		return -EBUSY;
+
 	if (!rtw_fw_feature_check(&rtwdev->fw, FW_FEATURE_SCAN_OFFLOAD))
 		return 1;
 
 	if (test_bit(RTW_FLAG_SCANNING, rtwdev->flags))
 		return -EBUSY;
 
-	mutex_lock(&rtwdev->mutex);
 	rtw_hw_scan_start(rtwdev, vif, req);
 	ret = rtw_hw_scan_offload(rtwdev, vif, true);
 	if (ret) {
 		rtw_hw_scan_abort(rtwdev);
 		rtw_err(rtwdev, "HW scan failed with status: %d\n", ret);
 	}
-	mutex_unlock(&rtwdev->mutex);
 
 	return ret;
 }
diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index 19b5c6f55daa..d9fbfebf5d43 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1556,11 +1556,13 @@ void rtw_core_stop(struct rtw_dev *rtwdev)
 
 	clear_bit(RTW_FLAG_RUNNING, rtwdev->flags);
 	clear_bit(RTW_FLAG_FW_RUNNING, rtwdev->flags);
+	rtwdev->csa.vif = NULL;
 
 	mutex_unlock(&rtwdev->mutex);
 
 	cancel_work_sync(&rtwdev->c2h_work);
 	cancel_work_sync(&rtwdev->update_beacon_work);
+	cancel_delayed_work_sync(&rtwdev->csa.beacon_work);
 	cancel_delayed_work_sync(&rtwdev->watch_dog_work);
 	cancel_delayed_work_sync(&coex->bt_relink_work);
 	cancel_delayed_work_sync(&coex->bt_reenable_work);
@@ -1573,6 +1575,9 @@ void rtw_core_stop(struct rtw_dev *rtwdev)
 
 	mutex_lock(&rtwdev->mutex);
 
+	rtwdev->csa.vif = NULL;
+	cancel_delayed_work(&rtwdev->csa.beacon_work);
+
 	rtwdev->chip->ops->power_off(rtwdev);
 }
 
@@ -2176,6 +2181,7 @@ int rtw_core_init(struct rtw_dev *rtwdev)
 	INIT_WORK(&rtwdev->ips_work, rtw_ips_work);
 	INIT_WORK(&rtwdev->fw_recovery_work, rtw_fw_recovery_work);
 	INIT_WORK(&rtwdev->update_beacon_work, rtw_fw_update_beacon_work);
+	INIT_DELAYED_WORK(&rtwdev->csa.beacon_work, rtw_fw_csa_beacon_work);
 	INIT_WORK(&rtwdev->ba_work, rtw_txq_ba_work);
 	skb_queue_head_init(&rtwdev->c2h_queue);
 	skb_queue_head_init(&rtwdev->coex.queue);
@@ -2299,7 +2305,8 @@ int rtw_register_hw(struct rtw_dev *rtwdev, struct ieee80211_hw *hw)
 	hw->wiphy->available_antennas_rx = hal->antenna_rx;
 
 	hw->wiphy->flags |= WIPHY_FLAG_SUPPORTS_TDLS |
-			    WIPHY_FLAG_TDLS_EXTERNAL_SETUP;
+			    WIPHY_FLAG_TDLS_EXTERNAL_SETUP |
+			    WIPHY_FLAG_HAS_CHANNEL_SWITCH;
 
 	hw->wiphy->features |= NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
 	hw->wiphy->max_scan_ssids = RTW_SCAN_MAX_SSIDS;
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index 1401eff4397c..73184e55c614 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -2061,6 +2061,14 @@ struct rtw_hw_scan_info {
 	u8 op_bw;
 };
 
+struct rtw_csa {
+	struct delayed_work beacon_work;
+	struct ieee80211_vif *vif;
+	ktime_t due;
+	u8 count;
+	bool retry;
+};
+
 struct rtw_dev {
 	struct ieee80211_hw *hw;
 	struct device *dev;
@@ -2096,6 +2104,7 @@ struct rtw_dev {
 	struct work_struct ips_work;
 	struct work_struct fw_recovery_work;
 	struct work_struct update_beacon_work;
+	struct rtw_csa csa;
 
 	/* used to protect txqs list */
 	spinlock_t txq_lock;
-- 
2.56.0

