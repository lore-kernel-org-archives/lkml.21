Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881819;
	b=hNVQKYJiXd8Adp3hFzTXNJlWo5zsKvPBbxPy4sQi3sOpe+HU10RqQhoGJ6WOJ/hcMp1j
	 5MXb6rTyAkuq12KZZEWZ9bWD2oWlFMScAf2D+KioK9xjzYqx4eiC8kpBacsUjSTQHT2pA
	 v/SNaI387rP6DJMWj82T6ZZkkb3EOLH+i4g3DkMjpco4BgX2N2KYyB59736mm822OnTi2
	 HqPWpFMW1SnAld4+dAAoz86axLFUu8JzQZQXkZCtmkig3KFAJLlxX+WJ73PfqtA+POELn
	 h+NVY4cLur171zjb+yWl7ycCfdPoVzitXZDcbRZ4Fv9VOhUVSR0wBo+Dz0lbg4aGDVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WDnHtIqvlcKh+KT2fInLEGWX50aw9RAoLdBVSUbUWiE=;
	b=hqsrO/4OC9PKNd3hops08g3Kdp4JVo4ARsq87Xe/8nmkiiYYzN+f9L6ZZrT632zCxnJD
	 +kg/Th41OvCGedqidkj9XQqvth2fMVj3TpJx9O5v4CA9P6f7RD692W4ctOslp4CRGnho7
	 utic/HhlORtV+jyvYvECVzgEXr3vfhMYB58PywoSSSKot9yxsNgvTGvI19k9cHgeY5Wok
	 D6hc41+GJltHe7N2+mQ4iZBmghgtc5HC2on+7m6MSZzNGUo+GvneF260Njj/yDdS8Z83U
	 4eMNOdggxSAeXxqYZ0+3mSWFarKaCYM/u0EF7per7xCXyHk/2PUVOJRfXF2FnIvhoLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=F3Jmn6+I;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94F160A2601
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C94F160A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=F3Jmn6+I
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c51a14bd405so521909366b.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881817; x=1796486617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WDnHtIqvlcKh+KT2fInLEGWX50aw9RAoLdBVSUbUWiE=;
        b=F3Jmn6+IP84x1zhxgZogKB5f7so+jHX2SIy/B6Z5JuVC3jgHuUFgoxceGJF72dH3fY
         QblGIBbfQkfU8iSleTivQGsJ+wkRxXGGn9P1LpZYQ7/IQ3uDqZbncApBJUskHg6kQvm1
         8lbCP0gna1W2Gg7NM0CT4Puigm3zfT9g6hmou8IdvtTJ6n1vwacXvYGWAIuhoTCrCvMU
         Afoeq/pcQ5je87sKoLum7ndpII8qU3L6rDfncTwlVafmO1fUhFlq8U5YvS6Ea8I9amAa
         8Q6Ui+I3fwQE9VMyfiFFITEeagGOKHpXytMyLNyKJeSZcEKH9G4gHst5U3pqb4eHsx2C
         +cOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881817; x=1796486617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WDnHtIqvlcKh+KT2fInLEGWX50aw9RAoLdBVSUbUWiE=;
        b=C0bgJF0fPCHmVmRIt0yDb7itGiFRdI6BmTcfKDHkHEdax+BGJwWLfAwYjdQ+xdpngM
         MNHm0uETnyx2w1mpmkcV+/o5gJPr1GGeFkTb2RjG39QkxaOS6oMj8Hqa6asmGPxyr6zt
         r3Bi0qO/qRcOVDXoZYg+EGSf2T3bv6RPqg7CEgXcnm9ubfqX9v4MOhImsjhlUlnAXDR1
         WG+/kqD6rNPp+PF8+PBzxmqclSashCmlrHL5L+yl3p5sC2jG3//DNAjVlOfxO6uX8YgN
         Xb/sB3c6MM/x/PacnkI1gPrFEFMwUy53eqST8HN6aEIUlJXTzZdw2gM4Emyw9n2e4FQh
         JAMw==
X-Forwarded-Encrypted: i=1; AL+hErHTgVkBo/ivfxrHqlal5YpVEbjAmeqtd23G0BGRLoflZe25KwKdL7l0C6OmmB8XP+mgbdjOTFhDrIW2P30=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tG9tu0iEsJ/zafSB2bALke6ugrBHLdZ1sYpVWH2tJEQ6CWblH
	e+8W666/eh9Ch0ytzf+y9tAamSu8xacLCabZMUmhUpYxjnnH6K/+Bz0xWrk4crArqQ==
X-Gm-Gg: AZFdTZdJ9/XNkdEkATH3OhJYzPhxXmNo1YfisRcdlsPnEeLgBiV3EsiRRmS8emzjDBP
	HsWyqoc+C5TecGeI6Z71R7z1qKFmL2tY11HiszLdMeoppdoUMxwTCPSN0esNm7HDvRemhKBB+8y
	Tf3VSwnM+nqHpdlJrH0DeeJY53/DnkxCmzsGq826iKQiNnxj6Un1VpREXbm5oFV/8u4rckmM+uO
	WqNVOzDyde7PzgCMxhanzE0xsem3yq/lYUlyxKezABALME9M8ibR5D/GlQVtu8OU38ywCQxbLtR
	EpEjPkPhoE4ioVMqo4Mh9Ivkl9Q+i/vF64JS3byyrwB/jo3xN7NzGDCdtItLnr3oRzjwPZHI2vF
	B+20pvhMEmqkWNiKrZB1W0SGc7ZE7jT0GCqCzz7X/SGRGBU3846Mea0g2YXWpJdaF929trF9a+W
	zTi6qskzlNqkcFdHit6N740qYjRxIw+QRz1YA2qMhhDPqr89gLOhseBvKGjXY48KI7XPLterVHh
	4ImTNFBFUqYOZdyrOVEN0iUeUhSsvUXCf+Bdp9hOqxTHJnx21xiAnDKwytzhGI9/rGvcbPf41qs
	zoeAB7eSAFui81WPIl6OMocbsccW9OMJWniN3RTw9JMN2MBzhtyctefAYS+BF8aCu+A+PY4LhCN
	sR0tjQKt+t1C5GtbNPZHtyMLo1ljKCjU1a/d6ylt8rMwai/YU1xU2Xohcowq7eq0PTmzUMC84Fq
	glGASiX0LNfUyBn3qNkNT2WwHNfaWtR4mRzSZYAm4ToHera44ikWrgjOPFxDq7UDiR5QsWdoizR
	FrRwe0lPo6sdeFPc1i/j67lA8q3AxrCihKVD1XWoDiZdgyzAyUnRrmi+FXlO+2fv+fFVddpwHE/
	cN/elu008W66K2Y=
X-Received: by 2002:a17:906:1255:b0:c2e:378c:8ceb with SMTP id a640c23a62f3a-c513ab2f292mr1758991266b.36.1795881817055;
        Sat, 28 Nov 2026 08:03:37 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:03:36 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 5/7] wifi: mac80211: take the TID of an 802.3 frame from the driver
Date: Sat, 28 Nov 2026 17:03:33 +0100
Message-ID: <20261128160335.1815537-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128160335.1815537-1-julius@bairaktaris.de>
References: <20261128160335.1815537-1-julius@bairaktaris.de>
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

__ieee80211_rx_handle_8023() clears struct ieee80211_rx_data and never
sets seqno_idx, so ieee80211_rx_8023() counts every frame received with
RX_FLAG_8023 in rx_stats.msdu[0], whatever its TID. The native path
takes the TID from the QoS header, which an 802.3 frame no longer has.

Add a tid field to struct ieee80211_rx_status for the driver to fill,
and use it as seqno_idx on the 802.3 path. A driver that does not set it
leaves it 0, which counts the frame on TID 0 as before.

Fixes: 80a915ec4427 ("mac80211: add rx decapsulation offload support")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- No change.

 include/net/mac80211.h | 4 ++++
 net/mac80211/rx.c      | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 58a0a387d86c..0d0aa613c280 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -1770,6 +1770,9 @@ enum mac80211_rx_encoding {
  * @ampdu_reference: A-MPDU reference number, must be a different value for
  *	each A-MPDU but the same for each subframe within one A-MPDU
  * @zero_length_psdu_type: radiotap type of the 0-length PSDU
+ * @tid: the TID of a frame received in 802.3 format (%RX_FLAG_8023), or
+ *	%IEEE80211_NUM_TIDS if it has none; counts the frame in the per-TID
+ *	statistics of its station. Not read for other frames.
  * @link_id: id of the link used to receive the packet. Set and used by
  *	mac80211 internally, it uses @freq set by the driver to identify the
  *	correct link per vif. Set to %IEEE80211_LINK_UNSPECIFIED for non-MLD
@@ -1813,6 +1816,7 @@ struct ieee80211_rx_status {
 	u8 chains;
 	s8 chain_signal[IEEE80211_MAX_CHAINS];
 	u8 zero_length_psdu_type;
+	u8 tid;
 	u8 link_id:4;
 };
 
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index a2356cd17691..9fabc9b5a976 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -5303,6 +5303,7 @@ static void __ieee80211_rx_handle_8023(struct ieee80211_hw *hw,
 				       struct sk_buff *skb,
 				       struct list_head *list)
 {
+	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
 	struct ieee80211_local *local = hw_to_local(hw);
 	struct ieee80211_fast_rx *fast_rx;
 	struct ieee80211_rx_data rx;
@@ -5313,6 +5314,8 @@ static void __ieee80211_rx_handle_8023(struct ieee80211_hw *hw,
 	rx.skb = skb;
 	rx.local = local;
 	rx.list = list;
+	/* the MSDU count of the station is kept per TID */
+	rx.seqno_idx = min_t(u8, status->tid, IEEE80211_NUM_TIDS);
 
 	I802_DEBUG_INC(local->dot11ReceivedFragmentCount);
 
-- 
2.53.0

