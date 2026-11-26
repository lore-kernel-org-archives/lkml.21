Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795715615;
	b=dIC9PnCjbru3+ISjtnf8LXu0gcmHXkHHKxtDUsOJDg+Ijf8Kvk1H7M5ppZjM/4KjnLuW
	 Hr2qALHOxeb2sObCyKcewHVRfsVLvUp89DGtw7DYg1eb3FGGUobmXXmrJakFeI036ChHF
	 xrf63/nBIDxwZCCuU2xYNi3zl6fPZ+3qwUMBwfPdaQPxwS2j3ls1WUgox0zmc7O4Eox4Z
	 pin4j+qLMz5s1EmWUezulMksYtRcNvtWg+eBGLOWuCb9Xeb93MFii1u8QQ5RqaFFwHCeO
	 1hWWTgV2LJZilDzI2+sDUlSZD5cgcPcBcxslWZD0cGvpBnCa1yvf3bagZJqEQNqsdkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795715615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0pQ9GEAcc8EGQNOQeS3VNOfksRTSnbgTKVbMBryXtAQ=;
	b=oqXAijDsZ1pbTaR9qt9ILYdvgqi9V/73lRPyWBd0V1lbO2Nnj7wa2pYCcXginTOpzPY0
	 vKZQFI6r1f7mbs4k29fL7GG5r3uBO5g7hEOtxpfr/tGBJxiSyRfwJjp1UBsqCmh+p1voT
	 OE6KuONtyX48comaAlM+5fog5I5Bg9LJAP/6DCG9IgdSSrJ7ayTZTsF2sGo4w/a0lipyu
	 Z5rnUQA2KE/ZmhoJnqEdk29XKIHi/SsZIwAaRButRpL/6SG0YfBwhVyQtevpgMslE74sL
	 ftAFvupextYnD0CkNiJ3s2NYR0CKLXmPuxonJSsOpxoZQMePKgtP16mGTmcpPtFHbWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UpHC8wJb;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F74B606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F74B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UpHC8wJb
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso73496175e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795715613; x=1796320413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0pQ9GEAcc8EGQNOQeS3VNOfksRTSnbgTKVbMBryXtAQ=;
        b=UpHC8wJb50bq0qZ2YFO8xWsMUEQX58CwzJ37600UltwuGNQsEzBvIVCZH08puwAY5n
         9MmDny7QWhBhhnT97QaZF4t6r3d4RwnSp2JUBIy+ZogsF2PeEN1JITlPS7K8pPME7nQu
         aPsGrla3Yo+o3m2ETseb26VJpaCX939F25/UW/1HMTMuyLbJZlw1TK9bCNOvtEIQ8ujd
         VSPBpjwMjTq4B9R4HBHLEu8ypRlVnJeFWJRzcIeHzPocwKqhoVw//B4HVjv/uDWsglSn
         iTU0UP0ksnAU1UWuzpNCMmlAQb05jm75A8qpM9n/AlIX9lW6Telp8o5vqDrHrZ0WNFdP
         mAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795715613; x=1796320413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pQ9GEAcc8EGQNOQeS3VNOfksRTSnbgTKVbMBryXtAQ=;
        b=JBYFZsUWu8k7vqkOQE3XRIG3MNGnWLrxETSb1QG/wLENvAlqJ8klBkiECY3ExL7oKp
         StHIY0pAJs8rTPgAqI9aiYoY+/L2n8XtbHcVXegQI4WA47Df3C3Wj9H6by/RDEuY1vQj
         ldkhw3j8YCCK9R3nIu4UW94oAUS6kuVh/Nvv5kK8u8YZbIUucQe9R11Gmn2/1jXS/0EY
         uOfj3HWGyNZmHAoBWWVDMBroxHje2K/r9ppqhc2EFu98aQ6SHXQz1gEG14Ldr/gFDVXL
         xD+3VCSz1u9meX8NmLF6nV0kkSMeDuLKT7ljLRzPkjix6pK4iHjBSxEr8FdPe92HPQz9
         5VIw==
X-Forwarded-Encrypted: i=1; AL+hErFZvlB4LLSeKGBRATo33Ec4r+DDLXbHjBKj/bUodTWGZcMy/gT/7tdq/eaJTHXcIWJPyRhA5r73y/3+2zk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ev0MQeDsuLUX6TLNng5Mw9KUl8/yhOAqdN/ho5MLWd3Iuk9aR
	2UbDMHhWyRGg3Vfaxbz8nVacO08m4PzbOOC2BwczUCIJ6VMdclyygBbU4oMQdw==
X-Gm-Gg: AZFdTZfG1MsKmVXxzxRwvaW81mkfZ8bn1cr5MZZaAJi2pYomQkAMT8PLWUoA5jwW4ji
	iaHl1t2Yo5h9zhYUcYOXTY4UD9CmVgT2tOizcoIIrTZkLl01KrELlZKy3BPCj9gUz2qtFKr5m9V
	df3+bxxXwuQmA7vzMzbdeGdEKCv0ce/OSAHm+KDKQ7au7cVvA1zRvZQmU8WDjMchYJUXEUbbQdT
	hclxcxDrQZWYF1RLinQ1OWJV6rUP9OE+eTi9wzzJTVbTaa+g0BnJBH1kmD3YR/2/Ce+Dz0Qv63P
	InxCo73OXlhfFBUYSGix+dPIqllLBEE8bAkZ2Zn00XpVtf8Gg6GIRrxN1zTXtRv11KzF16P2EsV
	FUk+Pi2Qfy5POCYKFWMRbsgCuOZSAWUYPFlhYsN03HaJ2MIoVaSrkLZyHVAsCc/7ZC/xLsoNQaC
	+IOP7qDv2JFPzfE2EcIE1/eThmHj1a9sZsfFX7wRzU44xE5DFYmSsngQGqtrzboFPqQ5IViZTag
	jQm7p/PxPzfO8TCMFBCN1dQHt4c/REiq+1jRSJ82ENBbAsW5Ugl1/5P27jFB1R8Yy3ucTRdVjJ6
	Gq4/dMw6P3YVrFq77+NiW+9B2ZLOijBC6kQ7eggzkd/q9CYvz32O2yerbQ==
X-Received: by 2002:a05:600c:a088:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4bb8880ac02mr414371695e9.6.1795715613194;
        Thu, 26 Nov 2026 09:53:33 -0800 (PST)
Received: from vitor-21h1cto1ww (dsl-30-199.bl27.telepac.pt. [176.79.30.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm564366045e9.9.2026.11.26.09.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:53:32 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	stable@vger.kernel.org
Subject: [PATCH ath-current v2] wifi: ath12k: report TX status for broadcast and multicast frames
Date: Thu, 26 Nov 2026 17:53:23 +0000
Message-ID: <20261126175323.2390231-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Vitor Soares <vitor.soares@toradex.com>

In AP mode, once a station is associated, broadcast and multicast frames
sent by the AP log:

  ath12k_wifi7_pci 0003:01:00.0: dp_tx: failed to find the peer with peer_id 2

These frames complete against the AP's own peer. That peer has no
station, and since commit 981050b918fc ("wifi: ath12k: Fix TX status
reporting to mac80211 when offload is enabled") a missing station is
treated as a missing peer: the frame is dropped and an error is logged.
Before that commit, the TX status of these frames was reported without a
station.

Report the TX status without a station when the peer has none, and add
rate information only when a station is present. Only drop the frame
when the peer is not found.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 981050b918fc ("wifi: ath12k: Fix TX status reporting to mac80211 when offload is enabled")
Cc: stable@vger.kernel.org
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Changes in v2:
- Keep ath12k_err() for the peer-not-found case (Rameshkumar)
- Link to v1: https://lore.kernel.org/all/20261116230250.369383-2-ivitro@gmail.com/

This conflicts with c752394249f8 ("wifi: ath12k: store station pointer
only in dp_peer") in ath-next; the resolution uses
ath12k_dp_link_peer_get_sta(peer) in place of peer->sta.
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 21 +++++++++++--------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index 41abf1865702..3c2a008ba185 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -856,7 +856,7 @@ static void ath12k_wifi7_dp_tx_complete_msdu(struct ath12k_pdev_dp *dp_pdev,
 	ath12k_wifi7_dp_tx_update_txcompl(dp_pdev, ts);
 
 	peer = ath12k_dp_link_peer_find_by_peerid(dp_pdev, ts->peer_id);
-	if (!peer || !peer->sta) {
+	if (!peer) {
 		ath12k_err(ab,
 			   "dp_tx: failed to find the peer with peer_id %d\n",
 			   ts->peer_id);
@@ -864,16 +864,19 @@ static void ath12k_wifi7_dp_tx_complete_msdu(struct ath12k_pdev_dp *dp_pdev,
 		goto exit;
 	}
 
-	status.sta = peer->sta;
-	status.info = info;
-	status.skb = msdu;
-	rate = peer->last_txrate;
+	if (peer->sta) {
+		status.sta = peer->sta;
+		rate = peer->last_txrate;
 
-	status_rate.rate_idx = rate;
-	status_rate.try_count = 1;
+		status_rate.rate_idx = rate;
+		status_rate.try_count = 1;
 
-	status.rates = &status_rate;
-	status.n_rates = 1;
+		status.rates = &status_rate;
+		status.n_rates = 1;
+	}
+
+	status.info = info;
+	status.skb = msdu;
 	ieee80211_tx_status_ext(ath12k_pdev_dp_to_hw(dp_pdev), &status);
 
 exit:
-- 
2.53.0

