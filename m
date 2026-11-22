Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354953;
	b=fj4tl9jrWld6k22KN0v32uGoOAQ/okChLAMhn61Oi3jYqECR+JbPDG62A5DzcrRx49Hv
	 DfYs3K8oXyA7UPdDZO/ePOWK1EWeVsyqbV260K9uDXTlFx2N8Ze941q85c0nW3DNVSumF
	 0wUk7WSVexiWj0K4Micvr+5uHqmJX1mDEzRXKZ/gh+orQZDDuWLu2vN0c6cRW+6QYWktk
	 o3zrXUQHiR8+QZMtAnI+ykOxMu1AAQM1c2DjKdbRq4yigzfQIYPrRwr2EHHYB5EzGEqyf
	 QVLKcE+q8/p+Ai4o8xqTiRmerD6TjQzCDdVG8Zw43avwxWu7ke3tLcLO2fcu46II/Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gsbux4xB1cx2A5qfbVry4VrITyTzzyacDp3E10MmRsQ=;
	b=DRDYrBTe06wb5PLTAeM2Uj1VEvRidajVJHm/wpYMgd8fxWmYq6gM/kJZVe2CLLNbyC+O
	 xeFNtQ+gBiUQ1eQM0qT2AWh8CpRLjW/BrIhTsbGDqS4lhA33Qe5LgcAUv9QdVydlbkiqk
	 mF8RToUr9RBqunPupYWno3k63uXU9szrvfle/09NtxxyWyfRoyDNMrCniG3qRnaCQZcLq
	 Aeu6HEwYs1Ubh5Fga/BNAuufYY3f3uxV3ffOu40NuvUsHDufOURKBlDI0OyyQyoN2VgAW
	 9gqbGuDoKWK3CksvV9dFIFHwfUc6sMo5UMKXAesO4bUKl1+olqkowLn4JdJ5TvKCsUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xuoFMD0s;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CCB606A682
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55CCB606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xuoFMD0s
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so3653953a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 05:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795354952; x=1795959752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsbux4xB1cx2A5qfbVry4VrITyTzzyacDp3E10MmRsQ=;
        b=xuoFMD0s6RPjtA3eyT71Zkm+IFUP8NLNBiQQLa4ZjpoNtg3uWI6JA1FUQtVH4xOnrH
         o9SXWjXqg5xBKaDQ04/Kk0pDrSgkfPWrl7/wjpQneZ/L5YwtrX10kvRUHQd4wEo+0X/s
         3PwxgvZjXch7Xv1MIIwxApBXoAGA/xcbTAr7bV0r9mxs7ZokeNilfVNCxcAPOxUJodz9
         BGFDCm7bycovpS80QtDtrup9DZT9DBnLwHg9neiCbwmNn28vo+ya4F7WLk9YsO2dVZRY
         NWh8IbW+2LDnRxS+RDaoCY2eN89E8Q0yiLDyfkGA7hqh5GoxyWCBjHOAGvpt+sEGSRoR
         tAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354952; x=1795959752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gsbux4xB1cx2A5qfbVry4VrITyTzzyacDp3E10MmRsQ=;
        b=IgCk/eF2GPkF9uZ4HcYljJTVqi5pk+jWdSJDhpqQHzTxeq3aiXHoxtzv4ntSwsUBnZ
         OLQKV2eC5kJmXUoE/2jGc5R0+pdnOY0ORxjWc7qBnIKrLASt+QnPUqGZFq4lSclvx9lj
         BW/wB0n/C1J8NwV68bFdijIOE8wDbV4aBzrujIODeYi5VHVWETJ2zwdpjeWS78ew0YHK
         pzMmrsIOIblegO4VjYpvIfu4YkdX6FWpBTnmuuID6vgzZ7MdkN2m6ZymEHQ+bU0Ieuf5
         g4gRHgkWF0GlROnAg968Tn7gfEhtqEQftBxLdMhyadntN8SCLWEYA7jwdqvgDo048qmr
         Q8Tg==
X-Forwarded-Encrypted: i=1; AL+hErHBeoVaAG9Vb1VHGV19szvixkU8xwecR3P0h/fkeT6O9T5r7z++PC99H2gHzK9TJCMFfgIshzoTvJiqFjM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gdZVkvhC16zEaljvWxji7e8KaH29q8A2s2HIfUBf062Nc37yQ
	ZWrC1fgr0MShO0qOOtPBHhgzh5fj5IlmgN+Am77d/JD0SWDMSYBUbWZFs2enbQxoJw==
X-Gm-Gg: AZFdTZc/26cc3EEGs/oAwbUuPIf2Az8Eb3B+wLD9vMFizTuftTTwVi1h0pYj97QvWUa
	48bRMtRn1s3/JEh58yozCSmN09IiMS4ybxnH06q8Ld34HJeKXP+rTr3J2IwUU40iOYQsmpmO3LW
	6v2bFikdT3YMwKsKkqa9QJL4OkrHnAWEnunCUDiOrj/XJzTsT90SlDr8tANdhD+f6gH5llr0W18
	MaJS+2Ko2C5NRNsEBVIWhIdcSynAzForYHJTPMAabSi/mUr2yjDe8bnT434cOHmPQbOMk3yCBG9
	xjj+JHAL4kGsKxudRogtmz/rsyqdGDhKJavfS5uUxyy4iJCYE8Mx2h/NR2+xl51OT1IKqvBr9/c
	yX6SLcyJM9lqUDzhue/n1K4HHlLL4psP7bqtZaDr63JB2glrc8Y7pJTBcykITGZYuvo9qBc1COK
	V44uDXqB8kZgdHYc4dA8g195yc9/gGvz0LI461fACKf01RgbOimc5oaL5jV3RjsdgYP43xw0V7d
	7y6JtjteK7imwPhwUSEHS0KjfBL2Gbs6Tk9+OBC8mNa4JLzUnn43XHsM/g6JK+LjSTUCKFDBNMg
	wI4h7i7AsKCkafBUDbc0f+5MOAIl/3HDHS82WNNqY+XyUWQz2raopsNlGbr+Kj6STHo5vrNRroE
	XjN6enbbKvXG4opgn2A8FWSK44w3lxfXp+QI/Qqc7kgd38qIOQ4sEWBj/sw2UJffijjuTCsrv/0
	JppAp2CCUUfpFlcm2IMgIQS8t8q7EkBWfbWI5pBKiOAqzWV2V/CSJkwZoDdQA91CA5ByzDF635E
	k/CqSRg4K2gwv9PIV5VnVjRQVIs5FEU9D/tRFEW6Qfkge1WYzwspkWMHAx4NnnUMRSFCQuxYMUO
	OV61etzNkF56MrNAC0vyeh7rgenmBJMCNFhYEsdUT9DzQBKwBnUOHYQ=
X-Received: by 2002:a05:6402:2745:b0:6ba:9d0c:cca4 with SMTP id 4fb4d7f45d1cf-6ba9d0cced2mr898964a12.33.1795354951690;
        Sun, 22 Nov 2026 05:42:31 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24712e3000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4712:e300::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010bcsm326020566b.1.2026.11.22.05.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:42:31 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 4/4] wifi: ath12k: pass the TID of a received 802.3 frame to mac80211
Date: Sun, 22 Nov 2026 14:42:28 +0100
Message-ID: <20261122134228.956044-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122134228.956044-1-julius@bairaktaris.de>
References: <20261122134228.956044-1-julius@bairaktaris.de>
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

ath12k_dp_rx_deliver_msdu() delivers frames with Ethernet decap as
RX_FLAG_8023, and mac80211 counted all of them on TID 0. Pass the TID
the driver already took from the receive descriptor into rxcb->tid.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 36be543b7c50..fc381945d163 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1413,6 +1413,7 @@ void ath12k_dp_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev, struct napi_struc
 
 	rx_status = IEEE80211_SKB_RXCB(msdu);
 	*rx_status = *status;
+	rx_status->tid = min_t(u8, rxcb->tid, IEEE80211_NUM_TIDS);
 
 	/* TODO: trace rx packet */
 
-- 
2.53.0

