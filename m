Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371110;
	b=h0q3NpBoeyg8Y89FolK+bBljTVm4nV48gs7nCnGpLzdMo82t6TIIw/GELX1xrxzwcnr1
	 sog1Cue08Xw+nYCQkHHhyEid+I003zQe2zn5CKxS71qL6rBCNF5/CJkQsjJ2HWRUFipsU
	 00XRNVWiEn2lRwj4MbeXfL+FicFDmnr8CEFnruAgdM2kpecwqUncLaIUvxcSzeh7zC+Yx
	 0TQgDQAJgOAyoxTFwo1QnBr4wGlGEJH0dto7dESU4ADVYVoaz+nKS/83VV5ksJgcfYi2r
	 llm/siITMNeOL1BiSNXi6zhcHOLmaPgsCisEzCW+cUlBQ+nVlpsWkxzArG3Xi5KV1FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tHmt/1DGc6z6bOlU+pcZZ2IuvF/j7mYPG2xCczPpUEo=;
	b=lH4CQrprfw2b2zURJnYF2dBDUxuKI8V0HpuX7iispgN0hpV24D/n/0gKpyK12QRxH4O7
	 tqmQHo9HfaDFYbJY6Pt3OoznU6SQcx9rFP9U1EIbox0SkiYD7c1prLL8o5Cnxnlws+RaU
	 rHq9/v5nxmA2UCSsnTxQzmkhS+0chb3o7fv8W5gFKGBM+8es7cZf12kAyh/59x5GoXN7E
	 uOrHA+GyqjFM+rugUjwNBq6z128yxwcSNr+Cx4JgFnMAycfWkYeaiX1SpVawUFNdpV8Cj
	 nXrBDJ93EnM8wJPWq916B+77jL4PxI4fIbncO2W2xkrhmPg5BZhXCTlEzEgQVSzQYfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=W3S7r0ZL;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE03606A6BA
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EE03606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=W3S7r0ZL
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c50a4a2132cso355402966b.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371108; x=1795975908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHmt/1DGc6z6bOlU+pcZZ2IuvF/j7mYPG2xCczPpUEo=;
        b=W3S7r0ZL9dqoJ9GdxjtfUkgrLFyhI2d1ijPq4lFDYz7vE7lZTPG9E0eXWmbK0oBR7D
         lt/KFbJRtDxGFk9IY3HKWdf+NVvro+4CK4ZOjjL0CHMzOI2vfHdpMV5kU/2U2lBcmY5t
         /09rPEu84COQxAJh+JSzZUo9DHxtFZGPyFJcwASghsnA9wX7lOzcjhIAe2W83z81fZDM
         ZsObyz5jhynHuNQFNQQKVK2ys46iNT+FHNcf5tdMHto4LYNPb48P2ArO/TMfrZSUSOEI
         hDSnlBcudvMpGQOGQKHgrpKS5hGVB9dhTE3CRAypSre3Dq+BLAXhgnL3Yedsma4P0VYh
         U21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371108; x=1795975908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tHmt/1DGc6z6bOlU+pcZZ2IuvF/j7mYPG2xCczPpUEo=;
        b=o4xHOVywpClS1fPQOU5e9dbnotX1bSAlucfIp6Vrp2kqamIzQl7aXiG966Neg5gdxq
         vtLYNui3Cq4pSNborLMys+FQOmWXTb1D8tjyDtIOTaMCIvS9JKmdPrR3P+NYp/cbUau4
         cQ3uNSImzxXT3uMCT3PTWoiHWdoaZtGNw/MG1mlYmgmsIBGuwrmsgDT7+nWkaZOLKcvj
         uzBhC7WsMyFHwG8iGPaXeZe7X8MPda38W2DskotveMMOcrA7TtMo59hxak7CN3VKnQYj
         PS6xmq4dWg5kG43Ww5T3J/gAXPb6lE041t9tZiWv0ug8HUS/vrY6053rekyh3HlCEHmC
         r4Ww==
X-Forwarded-Encrypted: i=1; AL+hErEYmFBINUA7mEe6waTT/BUMTaImFDNHs84KmKY6q3ykbogiJBkGX+JGzZxciQ1gJQmP47/E14U0PriGuUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Hb1uh1JGSv+A8gSwNWTVXM13/orHNXMim6cb3iTp+viJ6Get/
	ycSQ1h3fS9aM6+neQ9EoURW1OKoiwrGWC/tEAJ7X1nD1w81SUeeohcs9AbGb+fR5Dg==
X-Gm-Gg: AZFdTZcWMDERJsfbLD5WfqJDrZatHvfIz+vooKHST8RNqi8WI6PXntiwJgO8xUP9alL
	XYS8kbSNCmlsoVs4f3LKn1fCbmkKyYE8oPLToLbUyCjHIYA1+KKvVDLa38g++sGm2Jsbmx+heXb
	cDtf9wYnWmgxsAf3T8gZEsEZ1Nbcm7HRdqkEcBwzZu8V9DjJX1qFYeSP4oBb/Bby1DXgznpYEiB
	s+v3TPy+1Bc5DvMVryyuFL384vgzhDF5lnxSBiQhpGiRorll6Gmrp301gbJ6s20KTUoRN+po/Qz
	37+eQ+z68XN3WyYVY/zqSg2hN7JKEq/BCMEXsuM7Icsvjp6yJeKuIQIjpdsLW8VKfIFk15lC5aF
	b1MaxM3yuBAYWJRIv5+8HXSP2A1L1xncACxaHI2TeOSCELoyvFP4Tc/eQk5VnD09hsuTiBEEgEr
	K/kFv3c3BZozAeh9t83L4G/jkcl40Yi1ITN0kN/+RdDqtnhdkzlOnM/WxAa6Vuk7+Y9rPa2CaZD
	UdwIK4YR0jnPzckjZLZvjnRzpDdV/I/8ZysVIiEcPpBNTaOVp7XvJEcBDKUvJCevtYTTe9P2Xp/
	GRmGMdC9B5sXBUX4MzoAtno6WlDv0cpxrBIrut74Yh6ZiZe1crctvLeTmot9arzuWnQPC92Yf/p
	NU8YS1I/AetIPZJkk0i8fOcq8/FlAFgJBDMQALsXREzvPyoQLD0HeQQvSydu2qBW7yikkA6SJV7
	t5BdlHUgh3jjK7siYKQDY6r68lEi+29EwPcnPXvs+S3IjD1cWlVIGbcuYgav4IXgYByy6D6o13y
	k7gLD1iy+xN4cf8PBc/CMJn8aaY1xybBwaoCO1CIpkiNecMzfI/qWStr/J6u6HxRaGnj8x2TyX5
	Txc38bOnb4VibXT/MyPmA64z38m9YMLwW5IWszim7hg9v/XU4NrlgWzrnAZQ0H7Coccz1v7s
X-Received: by 2002:a17:907:ea8e:b0:c49:a235:8e0c with SMTP id a640c23a62f3a-c513aadb22dmr721786766b.22.1795371107843;
        Sun, 22 Nov 2026 10:11:47 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:47 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk,
	Christopher Griffin <christophergriffin05@gmail.com>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH ath-next v6 5/9] wifi: ath11k: schedule TXQs from the driver
Date: Sun, 22 Nov 2026 19:11:41 +0100
Message-ID: <20261122181145.1015729-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181145.1015729-1-julius@bairaktaris.de>
References: <20261122181145.1015729-1-julius@bairaktaris.de>
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

The wake_tx_queue handler serves only the txq mac80211 passes it, so
there is no deficit round robin between stations. Run the round in the
driver: walk the access category's active txqs with
ieee80211_next_txq() and drain each through the TCL ring check until the
airtime queue limit binds or the queue empties. A full ring ends the
round, since all txqs of a round share it. Each round holds a
per-category lock, as in ath10k, because mac80211 forbids concurrent
rounds on one category and the next patch also starts rounds from tx
completion. The design was proposed for ath11k in [1].

Link: https://lore.kernel.org/all/20230501130725.7171-1-quic_tamizhr@quicinc.com/ [1]

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h |  5 +++
 drivers/net/wireless/ath/ath11k/mac.c  | 44 +++++++++++++++++++++++---
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef24..40895d276de5f 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -709,6 +709,11 @@ struct ath11k {
 	 */
 	spinlock_t data_lock;
 
+	/* serialises one scheduling round per access category against the
+	 * other contexts that drive it
+	 */
+	spinlock_t txq_lock[IEEE80211_NUM_ACS];
+
 	struct list_head arvifs;
 	/* should never be NULL; needed for regular htt rx */
 	struct ieee80211_channel *rx_channel;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index eca16a151d068..226e1417ffe74 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10078,13 +10078,12 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 	return ret;
 }
 
-static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
-					struct ieee80211_txq *txq)
+static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 {
 	struct ieee80211_tx_control control = {
 		.sta = txq->sta,
 	};
-	struct ath11k *ar = hw->priv;
+	struct ieee80211_hw *hw = ar->hw;
 	struct dp_tx_ring *tx_ring;
 	struct hal_srng *tcl_ring;
 	struct sk_buff *skb;
@@ -10097,6 +10096,10 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 	tx_ring = &ar->ab->dp.tx_ring[ring_id];
 	tcl_ring = &ar->ab->hal.srng_list[tx_ring->tcl_data_ring.ring_id];
 
+	/* ieee80211_tx_dequeue() applies the airtime queue limit, so a
+	 * selection ends where that limit binds or the queue empties. A full
+	 * TCL ring ends the whole round.
+	 */
 	while (1) {
 		if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH,
 				      &ar->ab->dev_flags)))
@@ -10110,7 +10113,7 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 
 		if (num_free == 0) {
 			spin_unlock_bh(&tx_ring->wake_tx_lock);
-			break;
+			return -ENOSPC;
 		}
 
 		skb = ieee80211_tx_dequeue(hw, txq);
@@ -10123,6 +10126,34 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 
 		spin_unlock_bh(&tx_ring->wake_tx_lock);
 	}
+
+	return 0;
+}
+
+static void ath11k_mac_schedule_txq(struct ath11k *ar, u8 ac)
+{
+	struct ieee80211_hw *hw = ar->hw;
+	struct ieee80211_txq *txq;
+
+	spin_lock_bh(&ar->txq_lock[ac]);
+
+	ieee80211_txq_schedule_start(hw, ac);
+	while ((txq = ieee80211_next_txq(hw, ac))) {
+		int ret = ath11k_mac_tx_push_txq(ar, txq);
+
+		ieee80211_return_txq(hw, txq, false);
+		if (unlikely(ret))
+			break;
+	}
+	ieee80211_txq_schedule_end(hw, ac);
+
+	spin_unlock_bh(&ar->txq_lock[ac]);
+}
+
+static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
+					struct ieee80211_txq *txq)
+{
+	ath11k_mac_schedule_txq(hw->priv, txq->ac);
 }
 
 static const struct ieee80211_ops ath11k_ops = {
@@ -10817,7 +10848,7 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 	struct ath11k *ar;
 	struct ath11k_pdev *pdev;
 	int ret;
-	int i;
+	int i, j;
 
 	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
 		return 0;
@@ -10851,6 +10882,9 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 
 		pdev->ar = ar;
 		spin_lock_init(&ar->data_lock);
+
+		for (j = 0; j < IEEE80211_NUM_ACS; j++)
+			spin_lock_init(&ar->txq_lock[j]);
 		INIT_LIST_HEAD(&ar->arvifs);
 		INIT_LIST_HEAD(&ar->ppdu_stats_info);
 		mutex_init(&ar->conf_mutex);
-- 
2.53.0

