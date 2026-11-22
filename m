Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354950;
	b=cKNEqcvCtD6UiMXJwG/x3Y6TYnXINgftP7HMmkCoCEOcLYzwdk235Gg+CJNPWIN8bPHA
	 Lfa2yFxYJ9+JdFKDnMYwpEqhmMf27jyMYX+kB3A618D4tHryLOYGHr5U6Hjf+tylXYHJ2
	 WoNfH2MHbFsky8QbBEtUzp7mN40u5yF3y7JNj7czIrhLOmdG5fNgrNBJgJMlaHk7PNK0/
	 QAvpwSnfTnto/jj/gXFZBjVmXWGV4oSiiE2WyL3wr/16gi1h3jAEN9agV3cFujA2VEBLw
	 FdnSW3aEdTRmluCUoXx869//OaTfOEV8lV/qhFVwE9xnLA4VKImn/HGVUJTVPHvHLVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0mrNNw5RU1jw35bxblvVtq/MtklTGf4DFTf79gjLB0E=;
	b=OkgZnF6Fa/dlWD8j9JsEBoBowCzGSG5QLvDrC2msQkaR4NGvvs9pWwy86llCrkqn7GUn
	 +bi5HKKqKcs6TJJVFnxOLhW/C5AWIQi9/CbueadABCa/UDBNm60u5qS2kveTjJu7lNjVQ
	 7jEJWb2X0ZfigG8j3BLsHUwucJaGhSBXe6qyhlt3CpiQ939mV82t+SBYBc3OsMcGX/Yx5
	 kTgvZTzhpcDLiAR/Jd6rHR2WaXuuAoAYzKyUkwAN18psrojuOaZcQKmeYm5tlsqWJrA47
	 EB40zU9PY7tsmhoXLxP3vEXuBTHzc0L1NIYTivD7jLZBKIaPJyaq5B95V/g3CmVd0Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=RH2ztgDB;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DC8606A339
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83DC8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=RH2ztgDB
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c51373ae637so367552766b.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 05:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795354949; x=1795959749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0mrNNw5RU1jw35bxblvVtq/MtklTGf4DFTf79gjLB0E=;
        b=RH2ztgDBI+urZLZcKq8VYe/kFL91X/f45cDCHgn1Egf6hgkU4G1GVqtvS6Hbe9YeUT
         ubNB3JWsKeuADLOX18qjgEjN+FL98czqsiaFC+Iwc8murRKFlQ+Y5t75YQkHy+mjgjtD
         WAeiEhHACRM3Ms/KDgqf36sETyx58Te2P44B+GRIGcHHBY2vz35PeI9jd9ydbxkouPOy
         RiRLPBEvtvOK8orTrEfxsj0zoX9gatH4E1HVPF5sYo4R71WdekDOuIvcp4VMd/17+TrF
         421b28QjECZ6alnYUT+ORvfjgT6sPHQTt/2cFY4BGGDQVEKBL31ZZ5IpBMd3X5Vwk7CW
         Pdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354949; x=1795959749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0mrNNw5RU1jw35bxblvVtq/MtklTGf4DFTf79gjLB0E=;
        b=Xc2VhNdbzF6NBQU9tx56QZY/BqM3GL35pO/g30EJt2EahLmtbJxR0N7wYoHyaEIWmK
         4VnrEUE8zd6Rzm7lZcjVv9zaxWE3K7IsBc5FVHkvkVyxbcBdvQxgLBdG7+Hsd2zD+pZ7
         mKdXs8mp/LjjCehcaDv79LLZC7bHkPnhdvEJ+EGWsENnjnzTZtQSp6nHzf67cS/LnQ23
         bAHd9EDNhjNHdJDExDgqW2GNXhZitciWBCLfyNS3ptRhhNRHF6v9I8JHhxD2FrLZgnQ0
         JEVa18X+6vLEeenIfWhG8zTHoriHRUJXGjU+76Dp2yCV2l4SekeuPvB8HI3p8f6EPaJp
         cOVQ==
X-Forwarded-Encrypted: i=1; AL+hErEBQZi23YkmzT9Kl5Lk6PNiuN4MlSTM7QAFt4XeDP67lYm97N1M7kJXtEYGar7qACKCiuQSXwbIL7TwJsc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kXGYRfiR/jeQsmTXFgNdPhkie+yaRH3/fovdwSyaKHstg1vqm
	jah1rmRB3R33P/FPT8lphKnpZWx8q0wlCUUjp6P2a3aLrVLO5FXGBVRUMbmVNokwBg==
X-Gm-Gg: AZFdTZfobjHpxaynS15j8b4b5awM4m3eINwfwKlUugCg9rKnNeipZBUMT1CCcb9XCvV
	WP98DWHaN/9veGECsgVJ3vIHVg3gCmcl46VfrdDBML9CrkWuH4l94FvgFyHaszGcpJWft3Eg1Ji
	K664je5F6EDcuMfgXEu9mKRiVD1SGJR2wif316p/Yq9unrQ5HEAwJDeXLeBOWjt5DNS3XkbPcZC
	zfGSojNZ1kbo2BjGPhZ7PC/HGYqcrnjlu7xt/+VCRunbfMPnzPZa9jMMyOo0gePvM3r3RsblF08
	akO9Wfn1rqpquMlXVlkDjd1qQnWSy1lSiFZ57/ZumKEkkHg41SgUcHKTboWTqbEBNiqjda6b6SV
	A5sPIFS6gjxbdk7OD0J5x9/7cQOVokCGG4jRub2NI2NrkIadx1lIkYw2UCd/mG9EJUtdguzlxqn
	7rJN6IB8h4/d7+wETeROcgrJTnO11IP0I8f0o6WLSynJz0Swtjy+FdAQbxLPP1nfYwiAeALU+ig
	Ld+B1qeqw71vYo6jbjYO58VJDCxmFkCoSst46C3fVfLws634Rjt49cUrMSAAWuxrysqyRICc3bf
	BFVWjBHCUExs02yALJuOmcpwGGRNGU52UYWvX7vOiRiMvMvEphaS2tGMslnpBlhFu0wXiB8/7fB
	iQGDpbwQWN7Oib4TEVH7zHWQI3zVd8wOPbR69yzGsKcKXGI+YopHSKrTznefI2g7fuIX+0buM93
	AlfuDOcZqQI+SowIObWW2dP4FEHQFJsjbfuKE5Rznx1EXJrHpLpVOtwPezubKXkIwto+s/KQh/K
	Zd9hwocjiWZ7/SQd55XQEiHwoLYCg9ZPTmDOL/ehK2HoAPKw2tms1VJwsfiiYKVlq7dyf3rbW8Z
	nQaa41AZe1duEDwWzKt1Duet+6mEa0CaXTOUl2lzBMDZN0QPtE2yUY4=
X-Received: by 2002:a17:907:bb48:b0:c2d:c98f:4824 with SMTP id a640c23a62f3a-c513a9af930mr640165866b.30.1795354948816;
        Sun, 22 Nov 2026 05:42:28 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24712e3000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4712:e300::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010bcsm326020566b.1.2026.11.22.05.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:42:27 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 1/4] wifi: mac80211: advertise TSO and SG for encap offloaded frames
Date: Sun, 22 Nov 2026 14:42:25 +0100
Message-ID: <20261122134228.956044-2-julius@bairaktaris.de>
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

A driver whose hardware segments TCP frames and takes frames with
fragments on its 802.3 encap path cannot say so. hw->netdev_features
applies to every netdev of the hw, so a feature set there also reaches
the frames that go out through the 802.11 path.

Add hw->encap_netdev_features and hw->encap_gso_max_segs. mac80211 sets
the features on the AP, AP_VLAN and station netdevs when the hw supports
encap offload, and ieee80211_8023_xmit() passes them to
ieee80211_tx_skb_fixup(), so a GSO frame reaches the driver whole. The
802.11 path keeps using the features of the vif, which do not include
them, and segments such a frame in software as before.

AQL charges a frame by tx_time_est, which ieee80211_info_set_tx_time_est()
caps at 4095 us. A whole GSO frame to a slow station can take longer and
would be charged less than its airtime. Segment such a frame in software
instead.

The tx statistics count a TCP GSO frame as gso_segs packets, with the
headers of every segment in its length.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 include/net/mac80211.h | 15 ++++++++++++
 net/mac80211/iface.c   | 14 +++++++++++
 net/mac80211/main.c    |  3 ++-
 net/mac80211/tx.c      | 53 ++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 82 insertions(+), 3 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index f768ef9184eb..8eac4d50d06c 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -3271,6 +3271,19 @@ enum ieee80211_hw_flags {
  * @netdev_features: netdev features to be set in each netdev created
  *	from this HW. Note that not all features are usable with mac80211,
  *	other features will be rejected during HW registration.
+ * @encap_netdev_features: netdev features, in addition to @netdev_features,
+ *	set in each AP, AP VLAN and station netdev created from this HW, for
+ *	the frames that are sent with 802.3 encapsulation offload (see
+ *	%IEEE80211_OFFLOAD_ENCAP_ENABLED). A driver sets scatter-gather and
+ *	segmentation offload here when the hardware takes such frames whole.
+ *	mac80211 hands a driver a frame with these features only with
+ *	%IEEE80211_TX_CTL_HW_80211_ENCAP, and segments or linearizes it in
+ *	software on every other path, and for a station when the airtime
+ *	estimate of the whole frame is more than AQL can account to one frame.
+ *	Such a frame starts with its 802.3 header; a GSO frame has at most
+ *	@encap_gso_max_segs segments.
+ * @encap_gso_max_segs: the most segments of a GSO frame the driver takes
+ *	whole, when @encap_netdev_features has a segmentation offload.
  *
  * @uapsd_queues: This bitmap is included in (re)association frame to indicate
  *	for each access category if it is uAPSD trigger-enabled and delivery-
@@ -3330,6 +3343,8 @@ struct ieee80211_hw {
 		s16 accuracy;
 	} radiotap_timestamp;
 	netdev_features_t netdev_features;
+	netdev_features_t encap_netdev_features;
+	u16 encap_gso_max_segs;
 	u8 uapsd_queues;
 	u8 uapsd_max_sp_len;
 	u8 max_nan_de_entries;
diff --git a/net/mac80211/iface.c b/net/mac80211/iface.c
index b6ed6541bc42..c3869dbfdab7 100644
--- a/net/mac80211/iface.c
+++ b/net/mac80211/iface.c
@@ -2407,6 +2407,20 @@ int ieee80211_if_add(struct ieee80211_local *local, const char *name,
 			sdata->u.mgd.use_4addr = params->use_4addr;
 
 		ndev->features |= local->hw.netdev_features;
+		/* Only the netdevs that can use the encap offload offer its
+		 * features: every other path segments in software, with the
+		 * features of the vif.
+		 */
+		if (ieee80211_hw_check(&local->hw, SUPPORTS_TX_ENCAP_OFFLOAD) &&
+		    local->hw.encap_netdev_features &&
+		    (type == NL80211_IFTYPE_AP ||
+		     type == NL80211_IFTYPE_AP_VLAN ||
+		     type == NL80211_IFTYPE_STATION)) {
+			ndev->features |= local->hw.encap_netdev_features;
+			if (local->hw.encap_gso_max_segs)
+				netif_set_tso_max_segs(ndev,
+						       local->hw.encap_gso_max_segs);
+		}
 		ndev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
 		ndev->hw_features |= ndev->features &
 					MAC80211_SUPPORTED_FEATURES_TX;
diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index e03c2dbf4fb8..2a49fe7ed367 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -1243,7 +1243,8 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
 	}
 
 	/* Only HW csum features are currently compatible with mac80211 */
-	if (WARN_ON(hw->netdev_features & ~MAC80211_SUPPORTED_FEATURES))
+	if (WARN_ON((hw->netdev_features | hw->encap_netdev_features) &
+		    ~MAC80211_SUPPORTED_FEATURES))
 		return -EINVAL;
 
 	if (hw->max_report_rates == 0)
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index cb9ecac25a9c..faf3e6b9e4f8 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/skbuff.h>
 #include <linux/if_vlan.h>
+#include <linux/tcp.h>
 #include <linux/etherdevice.h>
 #include <linux/bitmap.h>
 #include <linux/rcupdate.h>
@@ -4797,6 +4798,35 @@ static bool ieee80211_tx_8023(struct ieee80211_sub_if_data *sdata,
 	return ret;
 }
 
+/* A frame's airtime estimate has 10 bits, in units of 4 us. A GSO frame whose
+ * estimate would not fit is charged less than it takes and stays in the AQL
+ * limits for as long as it takes, so it is segmented in software instead.
+ */
+#define IEEE80211_TX_GSO_AIRTIME_MAX	4092
+
+static bool ieee80211_8023_gso_fits(struct ieee80211_sub_if_data *sdata,
+				    struct sta_info *sta, struct sk_buff *skb,
+				    u16 queue)
+{
+	struct ieee80211_local *local = sdata->local;
+	u32 airtime;
+
+	if (!sta || !wiphy_ext_feature_isset(local->hw.wiphy,
+					     NL80211_EXT_FEATURE_AQL))
+		return true;
+
+	/* AQL charges the vif of the AP, as ieee80211_tx_dequeue() does */
+	if (sdata->vif.type == NL80211_IFTYPE_AP_VLAN)
+		sdata = container_of(sdata->bss, struct ieee80211_sub_if_data,
+				     u.ap);
+
+	airtime = ieee80211_calc_expected_tx_airtime(&local->hw, &sdata->vif,
+						     &sta->sta, skb->len,
+						     queue != IEEE80211_AC_VO);
+
+	return airtime <= IEEE80211_TX_GSO_AIRTIME_MAX;
+}
+
 static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
 				struct net_device *dev, struct sta_info *sta,
 				struct ieee80211_key *key, struct sk_buff *skb)
@@ -4807,6 +4837,7 @@ static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
 	struct tid_ampdu_tx *tid_tx = NULL;
 	struct sk_buff *seg, *next;
 	unsigned int skbs = 0, len = 0;
+	netdev_features_t features;
 	u16 queue;
 	u8 tid;
 
@@ -4835,7 +4866,12 @@ static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
 			tid_tx->last_tx = jiffies;
 	}
 
-	skb = ieee80211_tx_skb_fixup(skb, ieee80211_sdata_netdev_features(sdata));
+	features = ieee80211_sdata_netdev_features(sdata) |
+		   local->hw.encap_netdev_features;
+	if (skb_is_gso(skb) && !ieee80211_8023_gso_fits(sdata, sta, skb, queue))
+		features &= ~(NETIF_F_ALL_TSO | NETIF_F_SG);
+
+	skb = ieee80211_tx_skb_fixup(skb, features);
 	if (!skb)
 		return;
 
@@ -4865,8 +4901,21 @@ static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
 		info->control.hw_key = &key->conf;
 
 	skb_list_walk_safe(skb, seg, next) {
-		skbs++;
+		unsigned int segs = 1;
+
 		len += seg->len;
+		/* a GSO frame is one frame of the queues and of the airtime
+		 * estimate, and as many packets of the counters as it has
+		 * segments
+		 */
+		if (skb_is_gso(seg) &&
+		    (skb_shinfo(seg)->gso_type &
+		     (SKB_GSO_TCPV4 | SKB_GSO_TCPV6))) {
+			segs = max_t(unsigned int, skb_shinfo(seg)->gso_segs, 1);
+			len += (segs - 1) * (skb_transport_offset(seg) +
+					     tcp_hdrlen(seg));
+		}
+		skbs += segs;
 		if (seg != skb)
 			memcpy(IEEE80211_SKB_CB(seg), info, sizeof(*info));
 	}
-- 
2.53.0

