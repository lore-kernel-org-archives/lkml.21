Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354951;
	b=0m/+AQ0rjV9xX0RcE9OPMroW2ZOwxwyyQZPzt3Kbnbbw33O5sPF9nByRCx1/2eUN5DHr
	 uk3W1jjpfVNNoKcNSGduWZOfbmTBebOm32hJrOEnlUoFphvDtrTNR/Z0vOBkjRkqB5eu3
	 HJZdOdsaliHe3Ne/BHL7Fq+2k6C/JIFSfrZupIeqrpZ5omr1Q7c14aL6xI1gcM9NX0zOr
	 vYhZb/vhlhJjq0N3S/ormOWV9WCpc6T1D/6iw2uOTfvwECFcWuve55JHE7ENd1SXZe78+
	 LLtEoEM61Rm0hGZlBFZM9Wcf9sJiIPsGJxbNNFPDP5x/Q6I0yuj05/8pKjeAI/oQBhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nfBVe7oeliVCYRMEEI0YTZZ5kge0cS6jQivTz9dt6BY=;
	b=mF3NIC1x7LqRYyFsV8ReouKKa+JGJEK6fPclzHgQVZhzAj7ZL+fRKpiEIpQ7AqZ8s0Rc
	 TUYRFN2uBsVGUGRclUKNoACY5n1zIYahEVlJVa+gcrx1MGqayPr/w+Bj8LmAmH1r0iVo3
	 drA4XniacvZeu6ZFfMOaUEhwH7GT6HICiafAJSYNOvUYQQG4m60VV+G2aNnAIW+EjhGrA
	 sZlJ7Gubjxi0kzo4WK6/GYrUhAtsEBF7Ikw3sgy9fdawQG/nowk6FRpW/XIFbbKT4PzXn
	 7/fD6srMGKFJ9EnohEfDrPQRB3mMF9JtePPpfpyfE4qh4eQIFs22akVIUMgvc+kl6ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="p/b++qCi";
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31629606A687
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31629606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=p/b++qCi
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d21051042so404136966b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 05:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795354949; x=1795959749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfBVe7oeliVCYRMEEI0YTZZ5kge0cS6jQivTz9dt6BY=;
        b=p/b++qCi0Doz41tIuveRiF91Kc9PFXgN+6ZOtxLSuSEA/7aDo7NLSFZtHVFtEMi96M
         jsbUv92aBIGMQuj3VJJJr5yPizDLEmerUmPXQDZirAMKoDISumIQ2hr55cv+RZNxGuUI
         wI+2L1enKdlXu8N8nSQwzWrbK51ljJ4Hg73v1LZ1Fp2aJYIDLPTvkS7tJDlx3yz1ydP7
         sEzZ8gmuwuG0yJQeXHomPumRM7xm/SI3lbJwg63HHmXSvsYLYRfTywV9ZR3o+DVtohQM
         F1kRL5FJFWet41t44QaJ8AatZl/rRWTbVkOXSMV94bcuNlLKx3U5n2wTHc7W3cLNTG2f
         UY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354949; x=1795959749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nfBVe7oeliVCYRMEEI0YTZZ5kge0cS6jQivTz9dt6BY=;
        b=xzfR554Olvvvd+paLRkKGQLgX6Uhu6oMpo1tp56rcGLpKTBSYWH3cgXKQekBPkWH6K
         rSKSlpPBHZ+y0wNKnLf4djobYWJo4wkoR9hoZy+wOWu+Ngn3IfDQX7/iq49P41KIG2S3
         RyxMM9qCswJMJtDMMiVf4Gf8ItODjsAIdZJgQOf4SviZTqa0pU8mJ7euscNMmudcO0gI
         kHicD4F1Her4yOCy/e2bMv+wybWSqjOw3eZZCjkyRkd5dkwcCYQTWCCAh+gZjdZN9kCF
         CJgUq9JJd/3vHfva4Aza1ZoDoV/gVQNwMhUJIGzrelQGEb2npXUEypFsYObx7riTAmZR
         wmyw==
X-Forwarded-Encrypted: i=1; AL+hErEsyQWPxpgSnlVz9ZSFq7eYajCskq/WL1bpFR+IJz93yYO8cxiTbkY2YeItUp2hpBB7BnasNz+2f1+KdZA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LbfJN2Zs1gGxQThDJ2ROCwrH3Vios3M/naewVAbtMRVDM8OCQ
	vCAXxGdqYukEklSWOhelOLMfcOgPdW/wiQCyMBiKWoCDUmHEO7F/e/6FpZqEkoaLkw==
X-Gm-Gg: AZFdTZc6DC75ZVe1bXW+xCjsGzFj43JgNV7S07153fRFbJftlN6TtT0J+osIwQtzwwO
	5OLMCRWRj9eFbjFec+A6xKX18uCbJjuHQaVUxewyXTzdxIiYryuR9MMhGjVhiWSfHR+1JTN9I2T
	mOj7iBeQ7SLHpGxZkWgtzkIWz6f7rIGv20Vlr5AsBNQhI0RnNAjJ2VOYh2QHktU65e9Yy8mYHkb
	URy+hiSXIxODPdzOmHIa95wYSz6JtczfOKLxlfW87m0dufSGGJ7xGLA4fLcM0E3p3AD9ceHhSBn
	fzO5+gBpt0ropja62Ke95q/shAcvarC53lF39a2JSwrVY1HZC9Pfdz5SKMPyjZ67yQnwC2qXXSu
	VtIzPNuFQvU7THmKeXUyEoSpz88FPt1ByW4HG9wZfyRbAo+noB7TPzmRIPkL7mFjiPUr0xt7POU
	Wk4B29kg1zI1M9bFxdYappPcD4+pBNYZ35fNR4741FEDcD9PHH3rvWsf2/YKz8hFo36ooVhVPTa
	UC8yeQr8sNDs9zpafu9GAwF0+c2fxGOFlixXVQlotjnoOuR/osW0NTZiTzTo+ocDctXxjZ+7P2v
	wq2y6wDo3YE5SEjdOYnixoevwF6WbuXGN88vv7t7Kt9KtoSAzFP6M3MNMxfR9hXqDt6EjQT9GnS
	3UDAg34pHoGLQH7OOr8PO98ZRvhhRYYBNhmNdjA+xaKN8iN061zS1MSbdaJfS2HSJPTKL9+arm7
	UvFkcsPQJgO/OTs8YxlbzA0Rm1zQVKdKeG1eLjyapYeYwjYqKtT2a4x7k4g51Z782oAIi+qJcua
	VqNCf8wUP/qmTc4Cie9y5qq7SpCMWxIwfjZsDTzBgIIxo44Oa6u0yHQNGs1aMuxW0tqV5mC4ove
	m8CasKQ4WSu+sDbWO0fAi6ehe0GaQvvIqRvLH4JoOSjvDVW95s20xDY=
X-Received: by 2002:a17:907:2d13:b0:c50:ca93:19a0 with SMTP id a640c23a62f3a-c513aab9bcemr746699366b.40.1795354949578;
        Sun, 22 Nov 2026 05:42:29 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24712e3000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4712:e300::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010bcsm326020566b.1.2026.11.22.05.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:42:29 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 2/4] wifi: mac80211: take the TID of an 802.3 frame from the driver
Date: Sun, 22 Nov 2026 14:42:26 +0100
Message-ID: <20261122134228.956044-3-julius@bairaktaris.de>
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
 include/net/mac80211.h | 4 ++++
 net/mac80211/rx.c      | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 8eac4d50d06c..d601070810fb 100644
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

