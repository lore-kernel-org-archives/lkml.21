Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067866;
	b=hTcd5X6ZxFsS61ujYz+4phPUssnUf+a58SjYpXOD+YXw2Nn6hHnB6uljS8PBMLGDU69I
	 V4dyOFRPvSldrokzTFiuXDIrMxxqXn0qAhgnMckv8wCORQ70yYIbu7uVkMfXcMN53hmBw
	 l9h1o0rTahz6Q+MuXhROYwA09HXTWGtsaM9HCiOkn8+y9LdIl+EAWE5b07q3CQJVBwDQe
	 Fr9pIhw+D/3ewbaoO+jfMqs8//cx3r8zRwlQmqmiBZjxAhyjww0nySasTSQgJO/Q/gp0H
	 PNphOD1Suc0R7BBe+WpEhxzIR6Rz7xoDL85Vz6ieNHH3SN2ec7HHxexPOiAxNXmmlug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9Uxw3rLhifWc1Jc5KxHA1RVURbGtASCpOsmekIH9l7c=;
	b=jZ6KY9Pq0Vufbo73fkENxtHbjnm/MlaZvozVxMIx42pFnEA/PlfOYx/u7XuS73si4tFZ
	 oicglBmSqh4qJV5VEooEeupmdu5Oygnx4vhUVdKyYWpO9oVQnId/noPS578gZL4kergxq
	 eBuauEgFQ1dRxVWAeFwohA/eTTVLm6+a2nvLvtWVFpbGIds+4lz6z+4YlamySF+1ZBriA
	 GtYzlz8LlhkfcYFuLRY7I+b2nYddpCqBLiWOFGebxeczjYfM473YdCyukfH8vd4T8ZoHX
	 aAMYVEZxsHnXrUmSZxlAeZviA8Mn4xzTsbeoLh1cxlsmAf6zl849ryHih5gUVtilCPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=edN4lkzL;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BF1606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36BF1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=edN4lkzL
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2efd659464aso7626255ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795067865; x=1795672665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Uxw3rLhifWc1Jc5KxHA1RVURbGtASCpOsmekIH9l7c=;
        b=edN4lkzLoerGnOUz+XU+d/BCZNqPHs8kMn5ctqctnN5ihldL6Tovx6KDoeSBRs0yik
         YXHiEoaqoGjI3ugZXaw+bBuBzzh8lGouLKku5VIyWIP2WsSLQVooTbIgfjpbkRXPQCMa
         13HS2f7KdvE7aX1VGcXIjZOKVWkLSGp9vVO2GJHOMKL8cRAVdEttghi5tbgVzASucta8
         HF53S0aZlzey2K4/Gsax/g1q0O73EZAbCjpNX7qiSF4/q5Ali6kOcq+K/PModinNYsul
         s+jYH7ZZpPWTw9ezWHLWPaWoNWDuV2I97ocSTRXXfwXU9bcR7GM9I1VNlZArFRezGYO0
         F7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067865; x=1795672665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Uxw3rLhifWc1Jc5KxHA1RVURbGtASCpOsmekIH9l7c=;
        b=MWFKxPFDKb++cUnouO6PbYMwIVXNBxVBBYsyN59sJf5NX0SQR2CEfMVs6hovTo3xnh
         lDDAt0al04Jvcjt99uE+dp6NuT2Zo2jiq3f+b2KhYXrlVC+Y9DrRzyJeNPeqsUdydA2e
         5H50dayY/xz2MnkgyeKPT/Gk9X6XD4LRu8U2HQYG+fB8FqsFpMUokB54AGh7IqBeqqBq
         Dup4Ab1rCVFE2t88Il1x87IKrAO3rMcW+qLo4+4r59RdQZWrPjZ1e6pdYY+IqPpCHOUX
         0CUhWfHGESRbbkV1WqNZOb9Rr4T9Daq8UAZQw2FGhw8pwoUnvut1ZUGkXiOm/ydUAFAb
         77Wg==
X-Forwarded-Encrypted: i=1; AL+hErFqvSVezmT4RrkZpZqKqJUo7zpPp29V7nIR6aI1nujvPXu2D+YEvgPgKtd8Iniwfgj+tGQM33ZJyVwUG6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+M/9ZMbXSwsbv6zfQRwWGKQ8lMKkUw/LniDsHhIeFePpAhI3h3
	bdTCpHnbjLSIEBVeos6kjpC5my4Egu17pLu4mrBzAVSR4Qna3Lb1G8Hx
X-Gm-Gg: AZFdTZdeVNiNLAO3Q9YJ0VtFUzPlnVzZMWMmOmefziEByGmakDb3gMUXMwXKsWRNUGQ
	fLgRLzXlnafJN4DOezKLIslhONIkGn3T8yi/P/8u7o9mKVwT8HzOM4P0KOJ9uwd8TBWkDX8ItdL
	shnyf+YHvaemci+n81mFpdWwQjHgTbiZmSfYK3bmtz2Dam+iIDmfisnYt8qXj1jRH8DhVF5ML8I
	8Jc5di4JF5j6xoUvVcZTpaEr1LQDU+EPHGF7wsQ6AjG47MDu8rSavOTfkuRo5LtxjpJxUJyGHPy
	skBmpHH7JPifuPVS+3vxwf4vZ98U+yg0xfA2M7Sekt9tiBOE8Fm8J8+OIq2dQacubiCqBX/7JNg
	iiiyjbJdiEYyLARZNrJ6A5G0ESCRly3rvJmIHE+F2vmLRu+mXpviV8fNN0MGjvGQf5O1h8Fo3xh
	BHj4qSH+ixauyJxh3bdiYJ99h2ricNz3Ar1wYEa/U8vZYCnGn9fM4x8JdhQ1S/UOWTcyeQlHylX
	60ReiGuKU8E17zcOXWTZZKqcYJYDC7jyB28N2Qs2fXecO68aXVZGxRpT51oevdjeB/GemwAciva
	WmyFdwwBM2gi55wEF63vWn3Tz2hih3aZNDZy3KkoBhXDYFbzsA==
X-Received: by 2002:a17:902:f605:b0:2dd:ad73:5b6d with SMTP id d9443c01a7336-2eff740ef49mr46440545ad.29.1795067865468;
        Wed, 18 Nov 2026 21:57:45 -0800 (PST)
Received: from localhost.localdomain ([155.69.167.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm24522945ad.76.2026.11.18.21.57.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 21:57:45 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: jjohnson@kernel.org
Cc: lcy8047@gmail.com,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH ath-current] wifi: ath10k: Do not free the caller's skb when HL TX expands the headroom
Date: Thu, 19 Nov 2026 13:57:40 +0800
Message-ID: <20261119055740.55934-1-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
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

When the skb has too little headroom, ath10k_htt_tx_hl() copies it with
skb_realloc_headroom() and frees the original. If the copy fails, or a
later step fails, the function returns an error and
ath10k_mac_tx_submit() frees the original skb again with
ieee80211_free_txskb().

Expand the headroom of the same skb with pskb_expand_head() instead, so
the caller still owns it on every error path.

Fixes: a2097d6444c3 ("ath10k: htt: High latency TX support")
Cc: stable@vger.kernel.org
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---

Notes:
    Bug was found by kbound, an internal static analysis prototype.
    The fix was written with the help of Claude Opus 5.5.
    
    Compile-tested only (x86_64 and arm64 allmodconfig, W=1, sparse): I do
    not have an SDIO or USB ath10k device.

 drivers/net/wireless/ath/ath10k/htt_tx.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index efaea150025b..7b759f506f80 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1276,7 +1276,6 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 	struct htt_cmd_hdr *cmd_hdr;
 	struct htt_data_tx_desc *tx_desc;
 	struct ath10k_skb_cb *skb_cb = ATH10K_SKB_CB(msdu);
-	struct sk_buff *tmp_skb;
 	bool is_eth = (txmode == ATH10K_HW_TXRX_ETHERNET);
 	u8 vdev_id = ath10k_htt_tx_get_vdev_id(ar, msdu);
 	u8 tid = ath10k_htt_tx_get_tid(msdu, is_eth);
@@ -1330,16 +1329,14 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 	 * and realloc the skb if it does not have enough headroom.
 	 */
 	if (skb_headroom(msdu) < HTT_TX_HL_NEEDED_HEADROOM) {
-		tmp_skb = msdu;
-
 		ath10k_dbg(htt->ar, ATH10K_DBG_HTT,
 			   "Not enough headroom in skb. Current headroom: %u, needed: %u. Reallocating...\n",
 			   skb_headroom(msdu), HTT_TX_HL_NEEDED_HEADROOM);
-		msdu = skb_realloc_headroom(msdu, HTT_TX_HL_NEEDED_HEADROOM);
-		kfree_skb(tmp_skb);
-		if (!msdu) {
+		res = pskb_expand_head(msdu,
+				       HTT_TX_HL_NEEDED_HEADROOM - skb_headroom(msdu),
+				       0, GFP_ATOMIC);
+		if (res) {
 			ath10k_warn(htt->ar, "htt hl tx: Unable to realloc skb!\n");
-			res = -ENOMEM;
 			goto out;
 		}
 	}

base-commit: b1ed5a45b994a6473ca1cf34f35a1bf87f1d8e2a
-- 
2.53.0

