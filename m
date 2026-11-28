Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795866656;
	b=WObBi/ea9+HhCkzpGaQs1aPBe0+61BN6Y1MQbLkJ3Eh89rsTRvZ6U6T7NYw9AtYrN1rA
	 +ymBMDhakFzOQm90/5i//K/ETljhDcK6JxcQAe4gw1PU8a0hkm8s1J1mqaO6/6ijJixPt
	 km13kM58bBQfzFTIp5ZaM63nt2Q2YZtTRGaudUctVk559zxKztJnGLE4mOhl1l8JcPEn4
	 /mpsnA8uwmFetlypggo9zHFZ/4+g6uwBafs5hNl0cs3wgE5rQjWfPynCz8B8Ehcr53YI2
	 /SPgN8yNNBKWOsizUJOjn40GfX/bQwT4lp8p+DUg9VQlQgVec+JsrnCJdFcfKAJxFzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795866656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LZ8hFklFj23uso66AQMaU2wGtHVr+hqP0S/37cpp9so=;
	b=2NJvu62wDji5yZd9nwW7gMZ1MCq6eHBPjo7fVojEdu9a63sqlMMRuy+dw34HntgO02Xe
	 e+qKYFbpcooSXaKyc182bmv58OZVKvdNbKz8oEuzIqRayUCee9VDxftSqGNmr/fDN40d6
	 2zNz6vprSVRPA+wR/ISrsdgAfnC6wkKzdCNXmGXBB376eMTg3rZSU7PoxAou2dbYGIvzA
	 pf1SJ7mHHTbZ0xSG9zxmHkUcKuo57pcNyBsP/yjsQb3lkIITRE7oU3FUuZJSbbPqO41Ll
	 pnq0r7YESUqvMxvtWmi5QQ1MnygdG5wF5HeK7vh5ve74dzmxTi/HpH831TE05xFTE1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rioHM3Sw;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89100606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89100606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rioHM3Sw
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so7591561f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795866655; x=1796471455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZ8hFklFj23uso66AQMaU2wGtHVr+hqP0S/37cpp9so=;
        b=rioHM3SwpsVmglOILidKE8szcWuHURkEJkwLd3rft+M/+KgV5oZLggNHOPBL0EYKXr
         CdPcgn4+gMb2tyaBxUe+tvHR21lcrKV41DJzZHQuu1g6I9cDgbi/noZp8yfQI0ou0hH/
         r7LC3HlNZNsHZ9D/PVMKBP8i5/WQdHuU+rJMZ/D+gUqdSMC07wNoxOgoo6TBaQDTIPL0
         bsLoWChcqlelLlIjOeH7w9CXdAwpvbYcEyrRUY5df6xlREkHx1Hy77CVRCb2Sd2axagl
         BJDLZN6DNgLGoxNcEU1LBpzMuTMC+EG+EIq7aQg02lWXLstzc21EqANQv7ueQrtEbf6B
         3P1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866655; x=1796471455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZ8hFklFj23uso66AQMaU2wGtHVr+hqP0S/37cpp9so=;
        b=CU+t2tBMENMyOzCfGuqUFFwd0EyJx+x9BvQKIW/thBctS8ZQIuc142gixb0CRp/yj2
         vgffc2B94NanpHIHjPJPU7JMWAMGt5hcQ239C+1RbqqJHBddm+57nuE/nCkl+yBusFne
         1aSYChLFjicASmTAjmUJ2SKMeKinveVxQz1HW5FKt4RwlGHP9r7a5HlqNT6yNGvTaTKZ
         qHb+JxIXmVkf8x0f7yWPdnleDw5M6R9S3dJ7rQP2U9xFvln6oI3IaxOYukMFEbPCuhJa
         RljpzN4PZH5/6zdu4sJzl8uZ4v3aQEL/VWE13zOfECXTKRdJjE1J5extnbdwX5kbM/dZ
         xb2w==
X-Forwarded-Encrypted: i=1; AL+hErEE8WM/dcBC+IEXtZbT/gnhRnY24OPIC19wI5KmOOFLyPrxfBSdB8hkJ3V+b2zuOBEDVHQNMduFhmn6Hlc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BBVz/jQz5XIDTJq3t+9/sw1o0otTsIug+SF1FRIjiFKxVk/Ue
	VUeKyZUgjUxIaWz3/K6VMxwfIeodfhvOh22r2jMnuRydgFGi3amQJWsm
X-Gm-Gg: AZFdTZdI+5ttX+GZmOeISQNNRT2jvpZOLmJniUJnBpVXPf39gTpDz7UZboM4zQ7uwyh
	Xnuyc7H6UjClKGMh3BKX6HJJFWjUB1plj3ExFv/62l9kWlq3eGSbfQW1p50xUvQ0ORE/F6ODWtX
	vRnDEAmqKKv/Q7dsbeAUaZn0WuCN8XtgZB5xOE5sK4ez/XtIGj6WgfNN4iSJy3J3XC7tvRBy6zw
	UGgrastBhI9qcv782anqY64yPH/CR2I88Fowh/mUhgBiXeMR/ADQ02flh/PfX6MKoM7jDUp8DZW
	8/T/JBhPMH2OktVG0KSIS0H1UtN5ERvst/r5W7fCfi6pS3NOqhm0oVX2S3S80gRefUWYDkuQoWO
	0LsU5kWs3/e4WtcTASAd1eMcwBXTwSarjBo5ZKd+QYzyzH6p0O13cBSaU+jRVqPtTEi+o3WqSnz
	zINXj4Pbddf9pG7oRp9P1LHLsc72xx11CRsztKZ/PGRb3Q2R0zBTdYyowZA5EBh2cMoG5SI1nvP
	BLtzfnvUuhNBdbbZhLK1VKL5T5+6eJvwqhDUTAeYzKclSD+d6RRt0qiCe5urK0zpuNb9A9FWVos
	/S8obW8me50JQhBaqIv9V/E8j9N/N/jrifMgzVs=
X-Received: by 2002:a05:6000:470c:b0:4a7:557:fc0 with SMTP id ffacd0b85a97d-4abb225fb4bmr52266863f8f.32.1795866654635;
        Sat, 28 Nov 2026 03:50:54 -0800 (PST)
Received: from DebianTestingKDE-VM ([213.16.57.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm51953284f8f.37.2026.11.28.03.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:50:54 -0800 (PST)
From: Valentin Berezhnoy <dreyksmail@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Valentin Berezhnoy <dreyksmail@gmail.com>
Subject: [PATCH mt76] wifi: mt76: reorder RX frames when WED does not handle RX
Date: Sat, 28 Nov 2026 13:50:48 +0200
Message-ID: <20261128115048.84165-1-dreyksmail@gmail.com>
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

mt76_rx_poll_complete() skips mt76_rx_aggr_reorder() whenever
mtk_wed_device_active() is true. MT7622 WED v1 offloads TX only:
mtk_wed_get_rx_capa() is false, the RX rings stay with the host and
mt7915 does not set up WED RX offload. So on MT7622 + MT7915 with
mt7915e wed_enable=1, nothing reorders the frames of an RX Block Ack
session.

Out-of-order frames then reach mt76_check_ccmp_pn() first, and those
with a lower packet number are marked as replays. Since commit
1c5ed3eb68a9 ("wifi: mt76: free a replayed 802.3 frame with all
its subframes") drops such 802.3 frames, 5 GHz uploads from a client
fell from 814-840 Mbit/s to 378-593 Mbit/s, with 5031-7630 TCP
retransmissions per run instead of 583-822. Debug counters marked
2171 single and 5661 A-MSDU 802.3 frames out of 228603.

Check mtk_wed_get_rx_capa() as well before bypassing the reordering.
The bypass stays where WED handles RX (MT7986 WED v2 with WO,
MT7988/MT7996 WED v3 with HWRRO), and the NPU path is unchanged. With
this change, at most 16 single and no A-MSDU frames out of 757567
were marked, as with WED detached, and uploads reached 826-859 Mbit/s
with 66-157 retransmissions per run.

Fixes: 4f831d18d12d ("wifi: mt76: mt7915: enable WED RX support")
Assisted-by: LLM
Signed-off-by: Valentin Berezhnoy <dreyksmail@gmail.com>
---
Measured on an MT7622 + MT7915 router with OpenWrt 25.12.

This patch was prepared with the help of an AI assistant and reviewed
by the submitter.

 drivers/net/wireless/mediatek/mt76/mac80211.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 33f2bd5..4e56de3 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1751,7 +1751,8 @@ void mt76_rx_poll_complete(struct mt76_dev *dev, enum mt76_rxq_id q,
 
 	while ((skb = __skb_dequeue(&dev->rx_skb[q])) != NULL) {
 		mt76_check_sta(dev, skb);
-		if (mtk_wed_device_active(&dev->mmio.wed) ||
+		if ((mtk_wed_device_active(&dev->mmio.wed) &&
+		     mtk_wed_get_rx_capa(&dev->mmio.wed)) ||
 		    mt76_npu_device_active(dev))
 			__skb_queue_tail(&frames, skb);
 		else
-- 
2.53.0

