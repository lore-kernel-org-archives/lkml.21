Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288534;
	b=c3hCbQSDCz99+tSfrkIt7SXCyUGX3VrNzQtUZ4JWXZnuTgFA8++Wd4+LhqcEA95iurbh
	 llgkM2dC6c/FmN27NcKP1sKkY315ReU0P6wPPwcRfP45cZYvbIFmDXg1fO+CwnB7vt70U
	 enOZT5DVRK0fOKnji19ICtVoxfxVjdCoKXGoOp0ZQnkh/o/wiysRIxx/oC5QOOLdPRNaI
	 Y4NjRyVvEpEOLo8Ix7HB7CMyq+kppUZSKplq/bpfA5CD3H+QZxmEh/RdpKtysmHTGk6jZ
	 mXIEBFMBXIHr0f3OiL92ORyBvxO0KMspi6MBNeIZAHHfHCXN7eqoXxXh9S/I/zN5Dlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LsJpttozs3yuwMCl6tnQ3XuoTUQVsQjXfpzR8Fi44Q8=;
	b=2DsokvY0u4a/G6mYDjfZTTBFtVFAgSKoaO79nSQFfArKGfirgcJUFJMZpMHy6MTx6sn8
	 Rrc+/VTeRJY1OajIKWkmWvbPkA37NYp1KOU1u5lI2SVYQvwamv9Xe5NGXynHzu2tDZ4X6
	 N5vZNEDnivEaBInPBDsE8RzI1Hezyz/sXFrYDmSs02Vf9TCCmXuF9tQdw1X3zuXm7T5qK
	 5oBGrSD+WBvEXhxisgLdp3hPxxvH8YoLBlNGYtM+fg5PgrCT2RTUG6FoS5DkEBuPM2TYf
	 el83UVjkC+awxmDi6cZ94q3mVN2zcP5HuXmCrTqdDseoA4djtQ60GnF2Hu7Nx+joWcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vQMj9t2b;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DBA606A684
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68DBA606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vQMj9t2b
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso19075335e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795288533; x=1795893333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LsJpttozs3yuwMCl6tnQ3XuoTUQVsQjXfpzR8Fi44Q8=;
        b=vQMj9t2b01I0d2jqIgm4kQJO9p7STyfO+DAGul7bsguEh5DkLDi4obdoDeb8EgXwUc
         1vBliKWtEuK8rPRTmqXJp6fcegxmA0Kf9+826z9kdfpwcdmmbHDlxla4IsDyHrTwnat7
         oWFWGxHtIfFhnAGJLgodyeUjaffoxUe7cCLgR41mym09NTglfYdnSqL/7d7axkhjfVuh
         hmqYalaVMB9nGNW/mEwMrdEi4qlPqbDkanAd8IQ33NT4qH3NyRAzQ9AvsNRVt4c9JqGj
         d9334PkQSKcgIQjRaGVvoieHne6QRmBvLcXz6GjS2tot069QAKoboR9D2zvJ9fWvc/K3
         7PzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288533; x=1795893333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LsJpttozs3yuwMCl6tnQ3XuoTUQVsQjXfpzR8Fi44Q8=;
        b=k9jC+L9/Cx2iQYnnptEMi1qc0Bt14bQWaq6XlclAuwlvvWUtUToKDxkStLB7f1bPwl
         rypjebxxMScbnbrfkjaNe4ZAZ3Khjd7lKp4WqJbW7qzFpWjT7mW4xr7RZikffTgaxvRD
         PRpSknDAROw7+/DBizJh4Hr4prKNdv7wW7+wg3uNyeqNd00WkdZIR7I11RXtW2tGvxrf
         LRzkld/s7dyCm8QbbfyqL0/19iqN9CCsZ0pUubfp3WJUCikTQFui8UxA7JPuDAYJWVAL
         h9owu1pE7ndkUla+0/+FcV5puElGT19woLqzr6udQ47x7HWukDi94G+e8o+qdez7LTgN
         dm3Q==
X-Forwarded-Encrypted: i=1; AL+hErHwf1AEIstGc/WUn+hFxhCtUFEJ3J/GovsTbj8qRhaYHHnRO5T37VoBxVXzGYTKfO2A07+eNz+3fw1tHrw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+L+9EF6Nm/GAVc+06vwPMUOyHg9Tq3VmI3HgYNhM75syQQ/LPM
	UfuvK0ZSUv7ID2ruti7TYvztz0MGMl8Pp9Ys7HR2dYJR+idtuHuknuP1
X-Gm-Gg: AZFdTZfwknUT7CNWkHiTTAZP268L4pb3kV1TFad/sPLCyfl7/OxvCD2DDb2pXT+syVT
	Y4IBNIRgCB4op9CWXl06ZwERu161KBF0xdh5WiTWs49isCsyzyTvOdGCxFVbL3qTANevAi19brF
	aQBJ93Gm/59Ku88uSpVzia+MOQDkzTSrrkJDdADux1Yodl++uFE192OajYd8EB4Zq7jcphbzSAU
	3rg0Q2V+6lYaQtjGwUV52Bh9wdsPLqS9QH97iFBT/hP6EL78ykPYWac8MzUdnziGmSO2uytAirI
	VOC/tqwBkjW/X7xHCt/6SPR+l+iM/gorLo75Pr6ey6ut7fvmcmTalSv0f+liIeFem1kJrtmNEO7
	nQSL0l41jiobnEL4zFT952w9zLChcvly71DkI16So9jGV4Pb9/OnZRpEi1hXk/jPcxIwaqBGusY
	WozA69W5V3qhIQSF+vUMR7t8JZxGYjioeWnTF1rWhDDlkQKXUDOHt5r++d7/8QI+M9HjZeNZSOT
	dy9t+qd2XyJ5nhjBqfFJw+6XDvz3mp5UZ/5PIUGGfFYTuZiuYU2A9YQwtw86wzPd2JbCevxePwl
	o3veliVRQ5sBZjBnC0dT3GCvbgFRhHDoomnR
X-Received: by 2002:a05:600c:820c:b0:4bb:7987:fbbc with SMTP id 5b1f17b1804b1-4bb887c29b4mr139418425e9.1.1795288532720;
        Sat, 21 Nov 2026 11:15:32 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm194929325e9.7.2026.11.21.11.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:15:32 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v4 2/4] wifi: rtw88: report the frames purged from the TX report queue
Date: Sat, 21 Nov 2026 20:15:26 +0100
Message-ID: <20261121191528.591334-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121191528.591334-1-mehmet.fide@gmail.com>
References: <20261121191528.591334-1-mehmet.fide@gmail.com>
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

Frames waiting for a TX report of the firmware are freed with
skb_queue_purge() when the report times out and in rtw_core_deinit().
mac80211 gets no TX status for them, and the frames it keeps for the
TX status of user space stay pending until ieee80211_free_hw() warns.
On an RTL8822CE, after a firmware crash and an unbind:

rtw88_8822ce 0000:01:00.0: failed to get tx report from firmware
[...]
Have pending ack frames!
WARNING: net/mac80211/main.c:1761 at ieee80211_free_ack_frame+0x4c/0x70 [mac80211], CPU#1: sh/24725
Call trace:
 ieee80211_free_ack_frame+0x4c/0x70 [mac80211] (P)
 idr_for_each+0x6c/0xf4
 ieee80211_free_hw+0x30/0x8c [mac80211]
 rtw_pci_remove+0xd8/0xf0 [rtw88_pci]

Free them with ieee80211_purge_tx_queue() instead, which reports them
as dropped. Clear the TX status of a frame when it is queued, as
rtw_tx_report_handle() does, so that a purged frame does not report
its leftover TX control data as status flags and link ID.

Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    v4: clear the TX status when a frame is queued (Luka Gejak);
        Reviewed-by dropped for that change
    v3: no change
    v2: Reviewed-by Luka Gejak, no change

 drivers/net/wireless/realtek/rtw88/main.c |  5 +----
 drivers/net/wireless/realtek/rtw88/tx.c   | 25 ++++++++++++++++++-----
 drivers/net/wireless/realtek/rtw88/tx.h   |  1 +
 3 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index 2a38a6828e3a..564cddf0bfed 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -2232,7 +2232,6 @@ void rtw_core_deinit(struct rtw_dev *rtwdev)
 	struct rtw_fw_state *fw = &rtwdev->fw;
 	struct rtw_fw_state *wow_fw = &rtwdev->wow_fw;
 	struct rtw_rsvd_page *rsvd_pkt, *tmp;
-	unsigned long flags;
 
 	rtw_wait_firmware_completion(rtwdev);
 
@@ -2244,9 +2243,7 @@ void rtw_core_deinit(struct rtw_dev *rtwdev)
 
 	destroy_workqueue(rtwdev->tx_wq);
 	timer_delete_sync(&rtwdev->tx_report.purge_timer);
-	spin_lock_irqsave(&rtwdev->tx_report.q_lock, flags);
-	skb_queue_purge(&rtwdev->tx_report.queue);
-	spin_unlock_irqrestore(&rtwdev->tx_report.q_lock, flags);
+	rtw_tx_report_purge(rtwdev);
 	skb_queue_purge(&rtwdev->coex.queue);
 	skb_queue_purge(&rtwdev->c2h_queue);
 
diff --git a/drivers/net/wireless/realtek/rtw88/tx.c b/drivers/net/wireless/realtek/rtw88/tx.c
index 701ed7c4f3f7..280292a41402 100644
--- a/drivers/net/wireless/realtek/rtw88/tx.c
+++ b/drivers/net/wireless/realtek/rtw88/tx.c
@@ -176,32 +176,47 @@ static void rtw_tx_report_enable(struct rtw_dev *rtwdev,
 	pkt_info->report = true;
 }
 
+void rtw_tx_report_purge(struct rtw_dev *rtwdev)
+{
+	struct rtw_tx_report *tx_report = &rtwdev->tx_report;
+	struct sk_buff_head purge;
+	unsigned long flags;
+
+	__skb_queue_head_init(&purge);
+
+	spin_lock_irqsave(&tx_report->q_lock, flags);
+	skb_queue_splice_init(&tx_report->queue, &purge);
+	spin_unlock_irqrestore(&tx_report->q_lock, flags);
+
+	ieee80211_purge_tx_queue(rtwdev->hw, &purge);
+}
+
 void rtw_tx_report_purge_timer(struct timer_list *t)
 {
 	struct rtw_dev *rtwdev = timer_container_of(rtwdev, t,
 						    tx_report.purge_timer);
 	struct rtw_tx_report *tx_report = &rtwdev->tx_report;
-	unsigned long flags;
 
 	if (skb_queue_len(&tx_report->queue) == 0)
 		return;
 
 	rtw_warn(rtwdev, "failed to get tx report from firmware\n");
 
-	spin_lock_irqsave(&tx_report->q_lock, flags);
-	skb_queue_purge(&tx_report->queue);
-	spin_unlock_irqrestore(&tx_report->q_lock, flags);
+	rtw_tx_report_purge(rtwdev);
 }
 
 void rtw_tx_report_enqueue(struct rtw_dev *rtwdev, struct sk_buff *skb, u8 sn)
 {
+	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct rtw_tx_report *tx_report = &rtwdev->tx_report;
 	unsigned long timeout;
 	unsigned long flags;
 	u8 *drv_data;
 
+	ieee80211_tx_info_clear_status(info);
+
 	/* pass sn to tx report handler through driver data */
-	drv_data = (u8 *)IEEE80211_SKB_CB(skb)->status.status_driver_data;
+	drv_data = (u8 *)info->status.status_driver_data;
 	*drv_data = sn;
 
 	spin_lock_irqsave(&tx_report->q_lock, flags);
diff --git a/drivers/net/wireless/realtek/rtw88/tx.h b/drivers/net/wireless/realtek/rtw88/tx.h
index 168f48e87853..363f63525965 100644
--- a/drivers/net/wireless/realtek/rtw88/tx.h
+++ b/drivers/net/wireless/realtek/rtw88/tx.h
@@ -98,6 +98,7 @@ void rtw_tx_pkt_info_update(struct rtw_dev *rtwdev,
 			    struct sk_buff *skb);
 void rtw_tx_fill_tx_desc(struct rtw_dev *rtwdev,
 			 struct rtw_tx_pkt_info *pkt_info, struct sk_buff *skb);
+void rtw_tx_report_purge(struct rtw_dev *rtwdev);
 void rtw_tx_report_enqueue(struct rtw_dev *rtwdev, struct sk_buff *skb, u8 sn);
 void rtw_tx_report_handle(struct rtw_dev *rtwdev, struct sk_buff *skb, int src);
 void rtw_tx_rsvd_page_pkt_info_update(struct rtw_dev *rtwdev,
-- 
2.56.0

