Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881819;
	b=oRWZsAifqCCVG+MctE6ClG8vfEVl2bUul9CwdweOMQR1cbS07g7x8XnhUmnB14i0Fb0v
	 84B3P6eAGbE2AhL9KtNdPqtFRK3mMcvRZRRsP/zK5MpDUwuO3tKl0X8HY8tWixMZRgp+1
	 7LLGGcmP3HTLgA0ctaS3FnMkaBE7IQR/Z6pGZopUZp6zqT3vQA03vwAsdfagjzsqqeob2
	 PixE/Q02QtcuLGCVDMokw6SBCeFVsmIIKK41fnLBcaKQS6MtxrJyexHZgkTxcl2z9PKM6
	 t2PYme/DXp8Z+nbtHE33iUD+hxKhXkSLXr7Bnkij+In8yaJNP2e4WbK4RlnxFyf0PGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4ZlGoxzkJ56obQ814E/Ir1w79qAWdvvGnANYyfIPvJU=;
	b=Dm2t3HOZOpqhhIlEdJwd3hXNyzWaz113pgx7YUmUH0IdQ9z+xrgAYKHiHvehkOjeSRGH
	 2rQ4hpD8wjvGOpMZN9z1iQfYjwgGS/sWR3fTTMXzaInYDoT8/p/C4yGyegqUqqN7S2/bV
	 pzUHVY/OULt+GQWg7kNTS4rEuzzR1ao+puX3+q7x/KLOU7/oPOrpCT5Ed0R7JuK2/IRh9
	 CL5o1DNcKo2lCJvFhoE457L1GQIldyWC/mzFW/Zbbi/yWzljFM1ugh2uxUX/Ov8gH90Zk
	 odUAUe3pGlv07iNE1ykkjPfcQZCiLI8XewJs+iLz4nGPusQ0qPTfPn5+LzvZa34pEsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=rnt85EsU;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253F8606A6B3
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 253F8606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=rnt85EsU
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c516a192844so999779666b.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881816; x=1796486616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZlGoxzkJ56obQ814E/Ir1w79qAWdvvGnANYyfIPvJU=;
        b=rnt85EsUZ8LvFa3Y7C4h9LLqUkXjoO4VwgOxQ4efPVrq+BIpSHO1rRfc8KO4b4PQN+
         fU6EckdhWK4HyBJ41CrXoLDoEvbapu6rf1xhSxUXenUM9NaDwLATXls3Gn+zaAYWP5KV
         u2S6pGz3ri5X4D+fTwDJoD1iN7Ndf7EX2XckV8fHK2qrt5sTNtj7YkmwibCgaweU2Oa2
         6+fbmXVFMbfmMADxmToXZFAST5ox79Jth7UG+za1hznY9bA8AUL9iKx6Ay5waXXweoWE
         AAyAAj0KI4cTFL6GtLEAupEoL2Bt/WljJcFg6Y0WfiLFtbbSJ0idbCPGfWunxWIf8jBm
         etqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881816; x=1796486616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ZlGoxzkJ56obQ814E/Ir1w79qAWdvvGnANYyfIPvJU=;
        b=z57IXkTXdSS3DOSXhfoA56J5tYpAa2F3/A4BGl9dpZUdMenqL5m/vPY5y7G/JenWJf
         FgAyYAm9hR8YshcyCTraE8Q4F6+TF/IUib4YDZZVMLYQA8wO229jg0GjW4N1/eATjvWj
         49jC3aF6iXVDYJJ+MiYxw1Ttn65VoLk5iex14L+uK7G9e37bPeAlnApvQ5EvxYdRCAJs
         yGTWDB4JMg7hTrYwjfKdr7miLujr/qBT4waDQTTfjcbZaKV+OlBWTnUYyXXeARfhnwA2
         ZETvn5fC6UAxfTEmNBwPURLx1CAYF8TEqYE9wyIeTVUPDNGSvqtVBUjkHmM+efqf00vJ
         0s4w==
X-Forwarded-Encrypted: i=1; AL+hErEjbIRcu+R8hOitaznl3aG3+Ro3K0gnh9Tr22bE2nl/t7YM5JdDoLY8N/pt2dAIIGkXHbCkINkzQpLXz1s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zq+ZR1WJhPfL1SA8nivHbqoUhhitXrb5ns4S3UnH3kYlU5xjD
	NogvR39MHj6c544GJ8m7kn8yOKHbj014IpD/fcooQvFM4ZA6zXEHPjApRVbHGairsg==
X-Gm-Gg: AZFdTZcDRvLa1Y3r07H8jnZLsDiA3R3DU9E7gAbRmJ1msrFwsd9V08P5LJhD+xVXlnK
	6A9DfBcOLwYZ3ou4wOk6n19xFN9zXbRNgcfj215hEd0/PrK+CPwMJv1Roe+kZbyre8Fa0TZCWD3
	7x6OJUFTtdVIQWHxr+slqYsn0rWUt5lef+Q9BPxfme8m2+hVVEHk4+ETvsPy68XWPeE5vApUNXe
	74N6mItf88OglWvrG+buLy2JK9wK/qdarlBKbW3LIn2iTyb/Z4YKKFWEnzUnDmTPutFAeb0Svp+
	FKoQkp3hthdhrD/IrKkuVK48wr7o03f2GpWq7hi6C3jerYmx3zX30Bgg/Yad/mg504AvYj5spMZ
	ZpbsY1+YQCIXUTSUpi90Bf9uF4HqSuiCGmzOWzTOzh5gg0QIF3dmX0HxLVMkejmHqwSmD7JuFL8
	F2ybdbuHPOMWdhLxFe8iLmUL9Jsoj6wMe9G3bNfVRaoCWurSypfO5eEM0LEdePWFk0L/M221N8q
	/m/uS8shEmLu29qU8waSQWvrBPBWPV2bu0xj+oq89dZTdocoTDIrGay31OLDoc+RQma7Ta9Br/j
	KdRYAEUpBrvYxIQMBtPTvjzhgiluWhTINflWqez47xGnA/1yS8dndaTTfHkd5jp67qmuuavwlIh
	jG5ifm0wwYEebrS0+kj0aH7S/7qt489cBOFOlZFLctEu5QUJvGw3dtcq2Qg+xtZE63JmCbivw6t
	wXMUY4Fu1TC7yKH6NI473kCzJA7zevco03DbRMD6hrKO4GDdDi/kcvNLT0Ae7m05O00hp+dE7pm
	GqRTHqvhG/aDJHzvdgyg3zR3S85ObvRMvFwGDeM4MahzbOcVa4tUEajS+dl6614ryAJArjwKtA5
	mxi5v7pJ5Ul+uA==
X-Received: by 2002:a17:907:3f1b:b0:c51:5547:1771 with SMTP id a640c23a62f3a-c5155471892mr2060807566b.13.1795881816381;
        Sat, 28 Nov 2026 08:03:36 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.35
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
Subject: [PATCH wireless-next v2 4/7] wifi: mac80211: advertise TSO and SG for encap offloaded frames
Date: Sat, 28 Nov 2026 17:03:32 +0100
Message-ID: <20261128160335.1815537-5-julius@bairaktaris.de>
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

A driver whose hardware segments TCP frames and takes frames with
fragments on its 802.3 encap path cannot say so. hw->netdev_features
applies to every netdev of the hw, so a feature set there also reaches
the frames that go out through the 802.11 path.

Add hw->encap_netdev_features and hw->encap_gso_max_segs. When the hw
supports encap offload, mac80211 sets the features on each netdev it
creates, and ieee80211_8023_xmit() passes them to
ieee80211_tx_skb_fixup(), so a GSO frame reaches the driver whole.

Whether a netdev sends with encap offload changes with its type, 4addr
mode, fragmentation threshold and monitor interfaces, and mac80211
switches its netdev ops when it does. The ops of the 802.11 and monitor
paths get an ndo_features_check that drops the encap features, so the
stack segments, linearizes and resolves the checksum first.

AQL charges a frame by tx_time_est, which ieee80211_info_set_tx_time_est()
caps at 4095 us. A whole GSO frame to a slow station, or to one whose
rate mac80211 does not know yet, would be charged less than its
airtime. Segment such a frame in software instead; the segments keep
scatter-gather. The check uses the rate of the station when the frame
is queued.

The tx statistics count a TCP GSO frame as gso_segs packets, with the
headers of every segment in its length.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- Take the encap features away per frame in ndo_features_check of the
  non-encap ops, instead of setting them by interface type when the
  netdev is created. v1 left them on a netdev changed to mesh point,
  whose fast path then warned in skb_checksum_help(), and never set
  them on P2P netdevs. Found by the hosted Sashiko review of v1.
- The AQL fallback clears only the GSO bits and keeps SG. Found by the
  hosted Sashiko review of v1.
- Segment a GSO frame for a station with no usable rate, which AQL
  charges as 4 us. Found by an LLM review (Claude).
- Say in the kernel-doc that an encap_gso_max_segs of 0 keeps the
  default of the netdev. Found by an LLM review (Claude).

 include/net/mac80211.h | 15 ++++++++++
 net/mac80211/iface.c   | 28 ++++++++++++++++++
 net/mac80211/main.c    |  3 +-
 net/mac80211/tx.c      | 65 ++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 108 insertions(+), 3 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index ba16096fea3a..58a0a387d86c 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -3271,6 +3271,19 @@ enum ieee80211_hw_flags {
  * @netdev_features: netdev features to be set in each netdev created
  *	from this HW. Note that not all features are usable with mac80211,
  *	other features will be rejected during HW registration.
+ * @encap_netdev_features: netdev features, in addition to @netdev_features,
+ *	set in each netdev created from this HW when it supports 802.3
+ *	encapsulation offload, for the frames that are sent with it (see
+ *	%IEEE80211_OFFLOAD_ENCAP_ENABLED). A driver sets scatter-gather and
+ *	segmentation offload here when the hardware takes such frames whole.
+ *	mac80211 hands a driver a frame with these features only with
+ *	%IEEE80211_TX_CTL_HW_80211_ENCAP, and segments or linearizes it in
+ *	software on every other path, and for a station when the airtime
+ *	estimate of the whole frame is more than AQL can account to one frame.
+ *	Such a frame starts with its 802.3 header.
+ * @encap_gso_max_segs: the most segments of a GSO frame the driver takes
+ *	whole, when @encap_netdev_features has a segmentation offload; 0
+ *	keeps the default limit of the netdev.
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
index b6ed6541bc42..85c96da3391c 100644
--- a/net/mac80211/iface.c
+++ b/net/mac80211/iface.c
@@ -13,6 +13,7 @@
 #include <linux/slab.h>
 #include <linux/kernel.h>
 #include <linux/if_arp.h>
+#include <linux/if_vlan.h>
 #include <linux/netdevice.h>
 #include <linux/rtnetlink.h>
 #include <linux/kcov.h>
@@ -960,11 +961,28 @@ static int ieee80211_netdev_setup_tc(struct net_device *dev,
 	return drv_net_setup_tc(local, sdata, dev, type, type_data);
 }
 
+/* For the netdev ops that send without the 802.3 encap offload: the frame
+ * is built into an 802.11 frame here, which cannot take what only the encap
+ * offload path takes, so the stack segments or linearizes it first.
+ */
+static netdev_features_t
+ieee80211_netdev_features_check(struct sk_buff *skb, struct net_device *dev,
+				netdev_features_t features)
+{
+	struct ieee80211_sub_if_data *sdata = IEEE80211_DEV_TO_SUB_IF(dev);
+	struct ieee80211_hw *hw = &sdata->local->hw;
+
+	features &= ~(hw->encap_netdev_features & ~hw->netdev_features);
+
+	return vlan_features_check(skb, features);
+}
+
 static const struct net_device_ops ieee80211_dataif_ops = {
 	.ndo_open		= ieee80211_open,
 	.ndo_stop		= ieee80211_stop,
 	.ndo_uninit		= ieee80211_uninit,
 	.ndo_start_xmit		= ieee80211_subif_start_xmit,
+	.ndo_features_check	= ieee80211_netdev_features_check,
 	.ndo_set_rx_mode	= ieee80211_set_multicast_list,
 	.ndo_set_mac_address 	= ieee80211_change_mac,
 	.ndo_setup_tc		= ieee80211_netdev_setup_tc,
@@ -1003,6 +1021,7 @@ static const struct net_device_ops ieee80211_monitorif_ops = {
 	.ndo_stop		= ieee80211_stop,
 	.ndo_uninit		= ieee80211_uninit,
 	.ndo_start_xmit		= ieee80211_monitor_start_xmit,
+	.ndo_features_check	= ieee80211_netdev_features_check,
 	.ndo_set_rx_mode	= ieee80211_set_multicast_list,
 	.ndo_set_mac_address 	= ieee80211_change_mac,
 	.ndo_select_queue	= ieee80211_monitor_select_queue,
@@ -2407,6 +2426,15 @@ int ieee80211_if_add(struct ieee80211_local *local, const char *name,
 			sdata->u.mgd.use_4addr = params->use_4addr;
 
 		ndev->features |= local->hw.netdev_features;
+		/* ieee80211_netdev_features_check() takes the encap features
+		 * away from every frame sent without the encap offload
+		 */
+		if (ieee80211_hw_check(&local->hw, SUPPORTS_TX_ENCAP_OFFLOAD)) {
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
index cb9ecac25a9c..91ddd282f08d 100644
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
@@ -4797,6 +4798,47 @@ static bool ieee80211_tx_8023(struct ieee80211_sub_if_data *sdata,
 	return ret;
 }
 
+/* A frame's airtime estimate has 10 bits, in units of 4 us. A GSO frame whose
+ * estimate would not fit, or that has no estimate because the rate of the
+ * station is not known, is charged less than it takes, so it is segmented in
+ * software instead.
+ */
+#define IEEE80211_TX_GSO_AIRTIME_MAX	4092
+
+static bool ieee80211_8023_gso_fits(struct ieee80211_sub_if_data *sdata,
+				    struct sta_info *sta, struct sk_buff *skb,
+				    u16 queue)
+{
+	struct ieee80211_local *local = sdata->local;
+	struct ieee80211_chanctx_conf *conf;
+	u32 airtime;
+	u8 band = 0;
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
+	/* the estimate of ieee80211_calc_expected_tx_airtime(), which charges
+	 * 4 us when it has no rate to estimate with
+	 */
+	conf = rcu_dereference(sdata->vif.bss_conf.chanctx_conf);
+	if (conf)
+		band = conf->def.chan->band;
+
+	airtime = ieee80211_rate_expected_tx_airtime(&local->hw,
+						     &sta->deflink.tx_stats.last_rate,
+						     &sta->deflink.tx_stats.last_rate_info,
+						     band, queue != IEEE80211_AC_VO,
+						     skb->len + 38);
+
+	return airtime && airtime / 1024 <= IEEE80211_TX_GSO_AIRTIME_MAX;
+}
+
 static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
 				struct net_device *dev, struct sta_info *sta,
 				struct ieee80211_key *key, struct sk_buff *skb)
@@ -4807,6 +4849,7 @@ static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
 	struct tid_ampdu_tx *tid_tx = NULL;
 	struct sk_buff *seg, *next;
 	unsigned int skbs = 0, len = 0;
+	netdev_features_t features;
 	u16 queue;
 	u8 tid;
 
@@ -4835,7 +4878,12 @@ static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
 			tid_tx->last_tx = jiffies;
 	}
 
-	skb = ieee80211_tx_skb_fixup(skb, ieee80211_sdata_netdev_features(sdata));
+	features = ieee80211_sdata_netdev_features(sdata) |
+		   local->hw.encap_netdev_features;
+	if (skb_is_gso(skb) && !ieee80211_8023_gso_fits(sdata, sta, skb, queue))
+		features &= ~NETIF_F_GSO_MASK;
+
+	skb = ieee80211_tx_skb_fixup(skb, features);
 	if (!skb)
 		return;
 
@@ -4865,8 +4913,21 @@ static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
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

