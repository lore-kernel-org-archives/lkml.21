Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795359944;
	b=2bABG89Uq1o7YbRQqGqHQLIvcLnu9IbqImz5lKUWeNh7gwWnSlATZRVgGi1Omxeekjd2
	 zOd71mt/VIBVYRruKQ057m02kSR52GBAcyLT5Jzo5Ve5fykB1dvvlgjqwb7JZ0fQRdClg
	 c+BRYKuiiQdSaNn6tdo1yCmwgEZ+u4DtRmpXaI1qS1g21aEbkNHpZ60ufEmGV46MGBO4T
	 Huc7oO6qUEMqbRTDeKIPHIXiFWv/wZpuP41y7a8uSiJM19/hjPjlRYEIizMxkDOd6yfQS
	 l9x5AOgVVDM40yZB3ndiO3alAWaE0je25gD+TwQkIBk+nQK6kHhjo9X53rQIr/zHlaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b1vslv/xd6g0N7/NwwLfMy8odTd6iLnLaTF0qZefTCM=;
	b=ueOOvekdPi3ZTOxWwokuthAauVHf8F3DDurdYK9FQgW6ayB965qNskxCT5WrQLdSX3jZ
	 t7G+lIbm4rKeEosVLXstF+U4tmP6Zl3304RR1Fbz80WwSJcpci59pPAbXWNa1MrA49elM
	 lVKe0h/leK77SyUqt+F/DyrB0T2pvM+fcZjsvRzmA8wcmZWFqtbPizvwFREb0jsvAyCMU
	 +Uv8j+o2O2MDGVxqF7blA7ecLPuHC0lc55B1nqpCE3hR/mXoeSRhZX306Sr6D8gn1xmAU
	 gxg82w9YOsaASlqH/fUu2JK99BI3/yWvjo3M+zB0Txe6m4Go4leLgwXXJSpiK1b8nSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=lBHpmyfs;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B901606A339
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B901606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=lBHpmyfs
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c511c0e2826so289722366b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795359940; x=1795964740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1vslv/xd6g0N7/NwwLfMy8odTd6iLnLaTF0qZefTCM=;
        b=lBHpmyfss0Te/LtmWO63+2BBcEuCAts5z0mXA3nbqDcci6oC+zJGiYcoT2u1dThrf+
         /DLGykdY80C5dlesEQ52s5If6vrdwiCvux3woEzz1Ucmq2P7eIB+XegDKpA2z6URm7P0
         ERhtOj0DpD9j1mVFLQrfMD/pUWgfyzg99eHTcUkMXqUasA9ZKvUmCgSFiJEqx9fAtbhl
         YKA0sMhmThBIwgcK004oQLzHi062dIutqrfFnRKgL5498MHzEyWrZAQ9xPsqFSBir1Vj
         RvtkQJTHataOefQLcWrTZ0HKYYqaMAKP4tZBCnUkrUWPBR3v8dSzDh7xMLEtJQ77BmSh
         aGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795359940; x=1795964740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1vslv/xd6g0N7/NwwLfMy8odTd6iLnLaTF0qZefTCM=;
        b=VIYBSpkcozTWdMQ+E+r/NHKBD8ro/jbD7zhqKkurexWIZY8vZ/CVlXVW5w9HemGxs0
         AIstReD7dvr9WA23w+UzgcTnPqQzOk0kXjhJ+WHEmDqWxjFCBWyvJ9nXUU16bRhDpnHZ
         TB4vJU46VySTpUIENlKBrmnguzOYUsxm9ac4RsZlW3FJ7JJqB+qoHP68hN/enu5dJ5Ag
         BjHmGLXTdl0Wgd+qq+skh4Y2Jr/8nYAStn1Fx3vHRCdyvBGxrv5px/9/n0QFlGALlSnI
         /tqKIpfuXO9SAW3Zb2EvC9wq387kDyBFwHPjOKbh1nEuDTil39bst/rOJffb7x0IGNNk
         Warw==
X-Forwarded-Encrypted: i=1; AL+hErHkzP28BpboKUhmpng2/xo+US1okk6Qo10IgpTU5e2n4eAKNY2Qos6TIE7X0Ztsr8uuu939VpZBF50JxOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yvZOrWXbRnjJ7V3pex/NQTP+tEbgMlNlvGpDxDWiFZrFJBI/o
	dDEQ9wB99wYdBZ+kddQZwswB1s7nQBgFkh7JWcJhDPefmhRJbfgX1lsI/KVIIr/KFw==
X-Gm-Gg: AZFdTZcTwt3+IC2SMKNQYsYvKGf1QnZoHwpewifekeleygrx+NF3+mSFztl2NNbNh5Q
	f9XcAk457U4+2uSoHuMXbotfOK/kFxbuGwFx3TQOUdzroAC7jEqfNoo2FpVi5OBah5qxxmORwYJ
	jSPwmLRSviisphE32SY2ahn0Z7DQSxfgqhPEuzpYl8DOkN7iwsUV5UYYQKg0t3wuudeB8laIUDy
	u1vVBOOwFRaTFHeo2IHpzygq5Sh2dGObQLFKmjtoRRrHEnGwEup1U1UJ1NnuECQIJdjQjNrAMBt
	oK/8Cm7V2lVa6YD8wgeZoq2m4mm9S6AHRk7mjpfn3E8X0uTtuyKDNzhFlBQH+IrgoJD2TUBm/Qs
	Of22ppbXbC2bVp4mqUbJjWHTODfbGiBUzRm4TIM6rkQPPdILkvjFMh58Is9BQZGR7ZrUb45iBBL
	JrF6PbVM9HMablarT0gfEqBhvc+hdz97ajKWIaailvNeQiXeg3sycMVAA0Pj5+yEfqzUTJOlaif
	uLOD4g7N9GTMOrruGA9+M1MgkrKnvbjciSC5qkBTKC8xRy3sy5gRKQsiOCD4Er1KHHLkORU5Fm5
	dvtNlGPbqtTfBY2IeIuKhS5fqWMqTH9kBGdVu9Pi6GQRQiAlrAnF44jUVNVywnnWu/HgO3cTJOy
	dRcaFxa3g5kwJZkW95hzXphqzUwF9ffpIyy0vUZyfUKNVLy1sX2OXS6NnXcXbqAFvO2a4G0lcXc
	lywSbiun1+nMCveMoXhdf+9jYkyMGiy3STKzrFJLTPxNj86ksKNe7KVdQ/YLhKCnIRjhbD0FKXN
	SqzDUQi35kkvgnQzXMeP7cXEZde/f7gy3tqtgVAnkr9Zd2Z2bgHs0gdmPiVbez3DLWmptdYIZp5
	mS1cYLDEn/pTVG8hwxUrcbw4VQU3S7m9e4xv6jJed5IZKL7p528UA9IhMWw9dEOg6SFMXQbm0U/
	X+4yosAiLe8vM4qy1n7Q=
X-Received: by 2002:a17:907:a890:b0:c2d:c739:30e1 with SMTP id a640c23a62f3a-c513ab14a58mr789493566b.32.1795359940505;
        Sun, 22 Nov 2026 07:05:40 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247132f00a1bce02c0b4f040c.dip0.t-ipconnect.de. [2003:f2:4713:2f00:a1bc:e02c:b4f:40c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae65965sm326009466b.23.2026.11.22.07.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:05:40 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: [PATCH wireless-next] wifi: mac80211: find the station of a freed 802.3 frame for AQL
Date: Sun, 22 Nov 2026 16:05:41 +0100
Message-ID: <20261122150541.3117507-1-julius@bairaktaris.de>
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

ieee80211_report_used_skb() returns a frame's pending airtime to the
station found from the 802.11 header. An encap offloaded frame starts
with its 802.3 header instead, so the lookup finds no station, the
station keeps the charge, and once its leaked airtime exceeds its limit
ieee80211_txq_airtime_check() stops scheduling it until it reassociates.
Drivers with AQL and encap offload reach this through
ieee80211_free_txskb() wherever they drop a frame without knowing its
station, for example when firmware recovery returns the frames it held.

Look up an encap offloaded frame's station with
ieee80211_lookup_ra_sta(), as ieee80211_subif_start_xmit_8023() did on
transmit.

Fixes: 50ff477a8639 ("mac80211: add 802.11 encapsulation offloading support")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
I used Claude (Anthropic) to help write these patches.
I have reviewed the commit message myself and edited it where needed.

 net/mac80211/ieee80211_i.h |  3 +++
 net/mac80211/status.c      | 17 +++++++++++++++--
 net/mac80211/tx.c          |  6 +++---
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index a74b1e711733..88f342742e14 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -2313,6 +2313,9 @@ netdev_tx_t ieee80211_subif_start_xmit(struct sk_buff *skb,
 				       struct net_device *dev);
 netdev_tx_t ieee80211_subif_start_xmit_8023(struct sk_buff *skb,
 					    struct net_device *dev);
+int ieee80211_lookup_ra_sta(struct ieee80211_sub_if_data *sdata,
+			    struct sk_buff *skb, struct sta_info **sta_out,
+			    bool bss);
 void __ieee80211_subif_start_xmit(struct sk_buff *skb,
 				  struct net_device *dev,
 				  u32 info_flags,
diff --git a/net/mac80211/status.c b/net/mac80211/status.c
index 5d1807ab46ef..cde6f0cfa0ed 100644
--- a/net/mac80211/status.c
+++ b/net/mac80211/status.c
@@ -769,11 +769,24 @@ static void ieee80211_report_used_skb(struct ieee80211_local *local,
 		acked = false;
 
 	if (tx_time_est) {
-		struct sta_info *sta;
+		struct ieee80211_sub_if_data *sdata;
+		struct sta_info *sta = NULL;
 
 		rcu_read_lock();
 
-		sta = sta_info_get_by_addrs(local, hdr->addr1, hdr->addr2);
+		/* An encap offloaded frame still starts with its 802.3
+		 * header; find its station as the transmit path did.
+		 */
+		if (!(info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP)) {
+			sta = sta_info_get_by_addrs(local, hdr->addr1,
+						    hdr->addr2);
+		} else {
+			sdata = ieee80211_sdata_from_skb(local, skb);
+			if (!sdata ||
+			    ieee80211_lookup_ra_sta(sdata, skb, &sta, false) ||
+			    IS_ERR(sta))
+				sta = NULL;
+		}
 		ieee80211_sta_update_pending_airtime(local, sta,
 						     skb_get_queue_mapping(skb),
 						     tx_time_est,
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index cb9ecac25a9c..7b1fcf3dea7d 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -2626,9 +2626,9 @@ static inline bool ieee80211_is_tdls_setup(struct sk_buff *skb)
  *  - NULL: frame will be unicast to a yet unknown station
  *  - ERR_PTR(-ENOENT): frame will be group addressed
  */
-static int ieee80211_lookup_ra_sta(struct ieee80211_sub_if_data *sdata,
-				   struct sk_buff *skb,
-				   struct sta_info **sta_out, bool bss)
+int ieee80211_lookup_ra_sta(struct ieee80211_sub_if_data *sdata,
+			    struct sk_buff *skb, struct sta_info **sta_out,
+			    bool bss)
 {
 	struct sta_info *sta;
 

base-commit: e1dd8486807c1acf9551250b7f81e116a21e6ad6
-- 
2.53.0

