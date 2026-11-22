Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795360094;
	b=rDkFxfPyttJb8MJ3mOGJUyMsui0nrYp/+GWRufPMLajpeyRI11iLrvf5RH84M23c1I6P
	 gtTl1C9kyhft09hq2wAwYofeCp+vVB+ioa8mrcnrXdPw0EdJf09iRkRDzCQQ1uCr1zdOu
	 jVON1bs/vV0TVjj2F0/ExCNTqEld2o+BorA2gW9oa64JlBe65D8naGRgv1RUXQy9h/LuH
	 88buK9yCXNZRkdnwK2KhXSOSeIazfCa2K7N+VMbhHmt7AGYh6zqPwGOIsPvCzmGD9Atxy
	 AfLuCZW2xQwV/yXGI4epT2L9p0obXlXtmVN5sTd81urJBYhyq/XU7O6qRLhSOapuMuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795360094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z5aYDtbjooX6OdgNuNX1vYLxnENxkXdoT7fGCkr+rps=;
	b=B7MODAbK53VvYOsafk1PEx3qzfKYJZ7a42O78Bcj3cHnRzdIlR2DQmK6u85mH2MhFXR5
	 arWgKomn+6V1q/Pg6ouzoUew5IW+pt2nVdnt8xfO7LLh3UEqLYLV2x5lSttQBHjfEJ6M1
	 nGQU6Vg3GrVzB4ngDFl1cQJSVaSrcI/wKcLrhp8CKIpAa9mAIpnrIro2g/KjxadVkWYji
	 DsBGGV0zl/qB0W50hhR1sYl7fYDfe7Q1/Wx5XHefYS7WjwvL3z91bT/lTqVp9M9p4cpJt
	 pKwWRC11GlUkJ1IKZchQ790PYvFmfPS2lJwhO+cwejVCJgOgDnpuGpx6RM75PXTCIjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xIfQV2tC;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E828C606A680
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E828C606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xIfQV2tC
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c513a854320so417619366b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795360092; x=1795964892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5aYDtbjooX6OdgNuNX1vYLxnENxkXdoT7fGCkr+rps=;
        b=xIfQV2tCPRfEYIKd5yOsFfUktNOpidvo+eQqCG5LAnNkYJTn15fwtOj8Xhv7D3o5EA
         5nN+P2YUmm+fLGocWHqB+WN/BV0wdCtVR81gpHwOfh8Tc0lcQVAyRPYWIEh2h5TTQvwd
         Wvh3HQ6uudCg80Gdw3AvRmKpwE1Mmp+A3Gb8B0nfi4SMjxiO18yAj6vswi6Nn4//2I9L
         S3uZX8KxCXjkB2r+TtNP5hkZ8Ate4FzFTPlRHNow84McuTJyMXndHRAhhLolyEfyv7UV
         35VmjVHIBS37a7fyoKgYkUeXPDE+KyKl3e/x+qv1l/ATzkYn9adntjfUJfERqZ73pESW
         OH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795360092; x=1795964892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5aYDtbjooX6OdgNuNX1vYLxnENxkXdoT7fGCkr+rps=;
        b=0zzGwp3Tyh9AkoqYakGM90Yz9xIrKyDt8VR3d1Bah68zcTQBxNZIcIx7Cz9L+jw+tJ
         uFwS1xRLAczla5a9vby96Hk0voxqZ48/rc1GlPbzhtsrDtpg5ja8F2Yuv5AZyn1OWMdA
         Y6sh1tdKRaMPWFCAezmvrjjxxLjdl5jRoY0zdLdmmrVBj838XcU7C/yJWab4dmigDA1b
         ucfofxJuqMXZSdz8drw1Upft0BFQvTUGEnbkQyXkE0TLzx15EFm8K2wy2A7fz3f1GEhA
         kOCtnP0sKVay1Cz9ZjgF7KhkEnMneFAsGG0BUqgQ/lr3Dkwz0cBpd0BvrC0mTdGzCKzh
         iJEQ==
X-Forwarded-Encrypted: i=1; AL+hErH/PAPUhdlFzUXr4czWucZOkIHmXyCtoboeADVZAjp4Xk+AlKdONks1ocoItzcmjMAGAsgn4LLxJNp18bk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wI+psXlQgSxGkeuxabjUN4NyesGjmkuKIoZSH5U7o0F8SMD6x
	1u4Oi3J/QfZ7slYKJ39h+f8RGhnxDmraf3o2Pk0fAsk4QxEN6OKAI+4Tq3Ntc2tOqQ==
X-Gm-Gg: AZFdTZdNArKF++md0taJ0QYqX1klf99Rra3dCsBhU0q42L3yh3WPRsI/C9v4XQvc0zM
	Y9iGHtwF9G/O+42xEv7kIXBevKgJogX6uKCEd3YRoU5Y3rbpOgyLFo/CcxfpIBuuOBi3y8Sm2pZ
	yQKf85pR3fi6sMteuHL4PoY4YUQdG9Tz7e5kq5i2XOtJ5gpdbehcn0Jo43M4jQJOlujVLcvvBDk
	YLBYeWv9YBvT/8W8bnU/QIiqOc46z1/meXpBs2gqEqjRedFeNqdDuxtDGnArkKHThx0pMHZdqdB
	NK+OD+pzemQ3dZDFCyOlpIJDaX/CWp5MuD+HRtxKgxT8o6YkmCkBlOUgB+IGDOwPzRzfTqzZq/x
	Uh3/XVwiTqK1rXqMho0GRb/egtE117FKNPOsuuwovPDDyWyhbL0nO/vcbek6PzSIH6WFMFGWcho
	/FfCHoGoLHZzsWCFcbHwACmPtxsKTvUKIpyiVP8+HfsS895SEMB4wW2nyZjuUoiL3sztWCsDhSj
	UtbbVelWw8i1ec8T4Hz/fTTlXbjqfYwPqvGkzJ3xw03xZjvKI9VLGxJXkaHMyI7P07gsAdWaByV
	9o2UGjG5xYdRtwU47wtf1PVEVHK2Y6nuEKtq8OEUk6jtExdhbft9Dcn2AVgQo2T8oFyoWWl20XX
	e9HDa2xT91DVAiheBGJmCPTVDZdp6VmIu7vVIU8XE54R4Y1ekVU1JpiePGNdQ/7k+76Cr2YZYZ2
	EqU+vItPX4RMAwhKof3H14zy9d/UQ4zjhvK4wg5CmoCHxNn57XoDyjNiXtjGJPW+bUXiQ+vjC8k
	b1y6FL2fsf0sOdD1xj2gzodQLVqQ1XF/HUbdBKvt1l3hlFHAuLoq5QRdEWPw3hXasxKDwEWapjP
	5YqHqSJrTSI=
X-Received: by 2002:a17:906:1955:b0:c40:4848:f7fa with SMTP id a640c23a62f3a-c513ab1dc62mr553994466b.44.1795360092258;
        Sun, 22 Nov 2026 07:08:12 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.181.130.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68887sm324618466b.20.2026.11.22.07.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:08:11 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sven Eckelmann <sven@narfation.org>,
	John Crispin <john@phrozen.org>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH ath-next v3 1/2] wifi: ath11k: forget a key the firmware failed to remove
Date: Sun, 22 Nov 2026 16:08:10 +0100
Message-ID: <20261122150811.3135445-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122150811.3135445-1-julius@bairaktaris.de>
References: <20261122150811.3135445-1-julius@bairaktaris.de>
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

mac80211 frees a key after set_key() with DISABLE_KEY whatever the
driver returns. When the WMI command to remove the key fails, ath11k
returns before it clears peer->keys[], so the peer keeps a pointer to
the freed key. While the firmware is down, removing a station frees its
keys this way, and the following ASSOC -> AUTH transition passes the
freed keys to ath11k_install_key() from ath11k_clear_peer_keys().

Clear the host reference to a disabled key also when the firmware
command fails, and still return the first error to mac80211.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Changes in v3: return the ath11k_install_key() error for DISABLE_KEY;
the PN replay result no longer overwrites it (Sashiko review of v2).

Changes in v2: new patch.

 drivers/net/wireless/ath/ath11k/mac.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d1..48795c72d2982 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4521,6 +4521,7 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	bool is_ap_with_no_sta;
 	const u8 *peer_addr;
 	int ret = 0;
+	int pn_ret;
 	u32 flags = 0;
 
 	/* BIP needs to be done in software */
@@ -4615,17 +4616,25 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	is_ap_with_no_sta = (vif->type == NL80211_IFTYPE_AP &&
 			     !arvif->num_stations);
 	if (flags == WMI_KEY_PAIRWISE || cmd == SET_KEY || is_ap_with_no_sta) {
+		/*
+		 * mac80211 frees a disabled key whatever this returns, so
+		 * forget it below even if the firmware did not remove it.
+		 */
 		ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
 		if (ret) {
 			ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
-			goto exit;
+			if (cmd == SET_KEY)
+				goto exit;
 		}
 
-		ret = ath11k_dp_peer_rx_pn_replay_config(arvif, peer_addr, cmd, key);
-		if (ret) {
+		pn_ret = ath11k_dp_peer_rx_pn_replay_config(arvif, peer_addr, cmd, key);
+		if (pn_ret) {
 			ath11k_warn(ab, "failed to offload PN replay detection %d\n",
-				    ret);
-			goto exit;
+				    pn_ret);
+			if (!ret)
+				ret = pn_ret;
+			if (cmd == SET_KEY)
+				goto exit;
 		}
 
 		if (flags == WMI_KEY_GROUP && cmd == SET_KEY && is_ap_with_no_sta)
-- 
2.53.0

