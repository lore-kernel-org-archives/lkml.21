Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371148;
	b=kwa7tNACpaXZPe3tmwkWdl2GwVeQdcmYAKoWP2nPCcHVjVnZaf7jVBOcbx8x/C3F7+np
	 5ZPpWyXvCD2ziD47PUfw27ivAgX3s5dWHOpiW5dD+EyH043UGgmRTLQVzJeK4F/si6e7U
	 7gdpHaNSJ+S5fhtzs8lVVOQBMOPRmkS1ckPKuBf93xm9PItXKSNYr1gRplSJumx6+RLmY
	 8f34AI30H7a65v4TIOhM8Nemu3Gx/f8qK/wpOZqilAYmD6MbvXSLhIJ0CpMBjtORJb8HJ
	 CVBTbKwuYC7UqbD4M2Nbq7eYoRc17NcIeFW+11c9nQuF56ufheqbK4DkEje56YwdbHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nnRymrH/K7oTLw9QYuTYFYeqI9p+TNSIh3hf9Y1fVeo=;
	b=kyRW5zxHGNgCyIHYOopXSEOsQw+4IzGAd7uDY0rni6ilfdis5PPXdRsk1INZ6LQYLqhA
	 DN93mK7qXpWT3UcwO6YkSpTJlFtexOMS28I6qIl4h0oQrzIrde1l91FPmh4UU7UiwH0Ey
	 wnzSvW0x7t1fZHfzi6yFFR1lJXelqy3naDYsnzb81r/CCW6i+97Of2MrIs2c/9wQywoUl
	 Gbh8ued2LAvxAQAugzaa1x1Jtstj5UZOu7b7JIECNGh+HkQ2/BMlVhnSCGqJeZBHS8VLQ
	 h3Fljs+K/zT8EEdjfcmer3rkJTsKJ0iINGE9/wJdmLbiHG8+jGxMq2O4MzyyipYFv0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=kKiByMsr;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91024606A339
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91024606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=kKiByMsr
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b894d9a075so2719390a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371147; x=1795975947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnRymrH/K7oTLw9QYuTYFYeqI9p+TNSIh3hf9Y1fVeo=;
        b=kKiByMsrkjNwXuTk56h5FqDM7S7N0uard4jVBuyv4NZQmL+UrNItMDadSUx6uqM7sL
         z8wT8XLpQNaioghpmaYhMBcgoclYK5i82Y/1r/i5no7aK+qIoB6YNWTF0llbL6282Yj8
         DSYMwhKlnCjm+lGjcRiUnOGV+VASs9Tbd+1+FbEBkLRybZvnabKRtCeFR7PHoypty4qO
         5tmoqARpxxP2y26rKLiIwpkoHNapZpaO1qLaclf/rO4DNKguyJ5vLNLdRctP5KZEpohU
         +fpCS49+Jyj62F6V3jNmxawGOEjWwH9ik24zG3J7dXmCKpszZ865VlnfdFKrKJuMXgPX
         MCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371147; x=1795975947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nnRymrH/K7oTLw9QYuTYFYeqI9p+TNSIh3hf9Y1fVeo=;
        b=C9/uL5Wqb+mS3S0Aj0enU6tFHVfmkHAht+RIRDTWasnYXaZRv0aCw+mRFAlKVYE8Iq
         VQs9ij33WOpUBTN1ENrGwp7FrUnF7bDfYEkx7gsYKxoja6+ifXxHeJo4unGZNo5mHwpC
         mCysD6ggVatZ1Rnbew0g0p/K/Bt9QQhSpyEntlpXoMfnLk3boApn2PqO/Shq0EBeI0k1
         +QR/5/tfhWdDs904ZaqBjbyS57AXNvNIu51TEVGL4bqxjuMEfTLRL6Hz1ErHllF5OOj1
         GRsGX2NzHDgR7a9VclS5lMDkP53DPIbwfG7ZP+wZtgngjui91VOse9Mih21kPyOaCW9k
         yBhA==
X-Forwarded-Encrypted: i=1; AL+hErGlmy9bEurjfol/cLqAL26QdeJgyOOvH/sl+Dhy26ZJSQ5Qtkv2g6Qn05fMpgzpRs19/KG7hKHgEJg67LQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Eh317NFhR8+mVLY52jQt0dfeAfCtj+6NAjcVESHeYl8D760f4
	t0Rjy5cD9tBfiZlwRQcXMF5X8QZwr9BVkhJp+SscayWl8nbWS/KSuyisLLKNJu94zHlld2CGPt0
	l6vbGIMe4
X-Gm-Gg: AZFdTZe6zI2I5MBwUNbXkCzRMVMPTpI4DufCJFw4Zp1bHUf+IQ9OlM7H2K1cB6AA6ft
	SBkd/nO5dNGwA+6T4nSDab5yU5kwYo9SFioyhUp65FTrtdXQV3WCPmlIcxVNo0lFO8UYxP87JxT
	vYuzUdXQh+Np6S19bGYU5QtB8vD3fpmUN2PxLwzsrh4ToPLNYANsBlVrbGvbdLi7xzeRTxcWBs0
	fu1g5r9PldPniycz6LfP/ZCwG2ohJHV+zDW4JXtqcn+HsAQjJX4BJQWoy3NyiDAbZ9BtP0yIFFc
	oask9KBEfY4NhO8NvMY+TYHxlgW/crkg3Me316gRfQz8Iinm0RzWikB2rfEdp0K5b8w/JYRPqhn
	scOf/oBUhZD9E/wK9zmpjDq52ZeI+imrXkaqydVKiiNROh5aJVc2rkkHP7A+YtXLLZONH7UMQdx
	Q0rVI33yXhdB+pGZYFtPzjSowvm8+P7BP8rK2vdc8ho71W7PP4hPuXMfyD71TY99Z8cJpbAHIoL
	UwxnVPkHzg+CH8LAetJ1fIJnmnaAMW4cs9Ms2UgVClOGxGEj0EZarIAQf7bAMv3dR7hjzkVGz2i
	SmpoXQSz6hrWxVULYdvoPWHB9KjsoRxY7WLPDs/tyiUqwB9rkverfGsF2QKdCHd3AGtOTSpMyvf
	tX3GakAEznxNrVTdMZMdMGAFY7DNgNgUNmIWCx7v3za8owlWnnnOmQGSrsxG3yo8U+5FV6jPwa7
	19CTYmNEGlLBh68Z0epROFKbWzDb/1eAHsjDb3zoKmt0N7kXHC0llFC/vI2PgN9FSCx08f4DXWV
	w16cSu447YOqc0at2dO71DYXu5QNInBGy1t5hiJpiB/6eG86jMUK0VAZB/Zd0OjGMZ1AzDYXaJ8
	8peNYqlizaeYe5+AZbrnkqpIr5eaOnA6eZcoRIPJ4tURErXcpdcoNjWbN/H/d8HSynSdR9l0
X-Received: by 2002:aa7:d287:0:b0:6b8:818d:520c with SMTP id 4fb4d7f45d1cf-6ba37c7ba50mr4620662a12.5.1795371146993;
        Sun, 22 Nov 2026 10:12:26 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4052567a12.13.2026.11.22.10.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:12:26 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH ath-next 7/9] wifi: ath11k: take TCP batches as long as GRO builds them
Date: Sun, 22 Nov 2026 19:12:11 +0100
Message-ID: <20261122181213.1016590-8-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181213.1016590-1-julius@bairaktaris.de>
References: <20261122181213.1016590-1-julius@bairaktaris.de>
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

The netdevs offer ATH11K_DP_TX_TSO_MAX_SEGS (16) as their gso_max_segs,
but a bridge or router hands them what GRO built on the ingress port: up
to 64 KB (the default gro_max_size), and for a frame list up to 64
segments, where tcp_gro_receive() ends it. At an MSS of 1448 that is 45
segments. gso_features_check() clears the GSO features of every frame
with more segments than gso_max_segs, so validate_xmit_skb() cut each
such batch into one frame per segment before mac80211, and forwarded TCP
downlink reached the TCL one segment at a time under load, when GRO
batches are longest.

The 16 is no limit of the TCL: each segment of a batch is a ring entry and
an MSDU extension descriptor of its own, and a ring has 2048 descriptors.
Raise the bound to 64. The transmit loop then takes a frame while 64 of
the 512 TCL ring entries are free, and a batch keeps 256 bytes of ids and
descriptor slots on the stack. A batch whose airtime does not fit the
estimate is still cut by mac80211 before it is queued.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index a923ba792e4b..1bdf2f564dac 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -81,10 +81,13 @@ struct dp_rxdma_ring {
 #define ATH11K_TX_COMPL_NEXT(x)	(((x) + 1) % DP_TX_COMP_RING_SIZE)
 
 /*
- * The most segments of a TCP batch the TCL takes whole, and the payload
- * pieces of one segment past the headers
+ * The most segments of a TCP batch the TCL takes whole: each segment is a
+ * ring entry and an extension descriptor of its own, so the bound is what the
+ * stack builds, the 64 segments at which TCP GRO ends a frame list aggregate
+ * and more than the 64 KB of any other GRO aggregate hold at an MSS of 1024
+ * or more.
  */
-#define ATH11K_DP_TX_TSO_MAX_SEGS	16
+#define ATH11K_DP_TX_TSO_MAX_SEGS	64
 #define ATH11K_DP_TX_NO_EXT		0xffff
 
 struct ath11k_dp_tx_ext_map {
-- 
2.53.0

