Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441814;
	b=E1TXc70bYUDac/ZqP5+MnxI04M7SHkR/dL4rtsMSIGgUHsxvEKCzh8syyhbZ9Nydc68X
	 ZG8dy8xtuBq/cY2UCLO+VKzCkBT34zIb3YAfgq+SPuSL9EtTUxW5q4Us/6GxIkC3IplUM
	 ap2rS+DC6mum9gn8ebEcCne09ivoK8NmfrStAwjfL890LJK4Vv8si3AxfEHEDjA8Ld4Rs
	 o2sHB7bd56oqFKUQkWAY10ORLPYzFkTB+eW8WGHlS3IRqiPABUHiowDuh2QEBCMBiT5hd
	 f2e5vZwxYgufGK+YS/L876kYiQx9YZxpa289I9a2/kP7dBTb3+hDJ8hLMHR9KXpG6tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=57ma+zgU22rM4nTYnM4SGAl9X+VUD738fpDOy0Jctx4=;
	b=FlwqChhjVueyGNc+pYEJSE2D7oY/JetkbTMs73RGzKqwBWDb1bAMD4X8XnZdg3Kkn7QQ
	 DDAJITzMAUYyD7pQx0apHy3rGvSIdtlD95JNam6SErXh/Q2XptBwTO8tRGHzvkFEQg3Ym
	 YsJl/mi8dTyOxSUKDKSm3TjOabqMK0RaCdT0Ns0iruSmteKAt8NF1/WlQ2KXUSBPIvjfQ
	 hgptqnsM4mwRRh8L5LfllA9eLHgHH2Vs4P0KqAATBKohpWUGj+UrDs+oI576vvL4ktvi8
	 WovmneE+xSRH5/8ULcAlRuX0nWKYOzl0qpI8jmGUyHivFpGbwqm7K6ydPuHr+zYhnzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=aZOHhFjX;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D355606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D355606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=aZOHhFjX
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so5303384a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441813; x=1796046613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=57ma+zgU22rM4nTYnM4SGAl9X+VUD738fpDOy0Jctx4=;
        b=aZOHhFjXZWNwRqnUVxI2nhrrYCC/i5aaVPKAv8dyEM1i5IDLYn8oeRRxQewjsk2j+K
         eV/ZCALfeLY7Fy7phfAiNjXjVyaX85FasxnFuxHQc1pVYRPuVo8viI4nc5U37ZfPJXZk
         cYNn/QOAV+qIVTxMKxXwhsIQBFRshz57VlSga2APMHgugSBrpQAp7m9VUfsl6gjNzqt+
         TzGJZMut1ZWYl/T45wMKjpCuwvHAT8fqjSMi+vkde3BUmzzhioVXB6GFvN1wMqpS6NUE
         /8eHAGoULDcVgY6PSoyLhM2gB7tGuXZnu/4fAGMn4G4aY6BDMB150LFlmtGHLIukBbWU
         fBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441813; x=1796046613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=57ma+zgU22rM4nTYnM4SGAl9X+VUD738fpDOy0Jctx4=;
        b=t2gToxNA3TVWEpU6EvKnupZTlikg/0oIUq9QCTx0GvtGkesGgmDDDtnyS/VJA9Ymah
         oWb7di+FHLJ4Snka63xXxyK6OLtksKj3wEEu7LGCo88IKkYqW7rRjeE7tzFkiA4vXFnZ
         5EoH7BU03WGqVzhVTVmp74s7i6iFRPsYoVM+VjJGyyuZFQZeZkAmdLMtjV/HzUIkAhm0
         Gw7dTAjlXu7+tnsh4gQnsk4yXcHHCRKo0z4jkpgqNzxXJAjlhKIefDtDgMEwR224tDlk
         +SvWH6RmorQyHoRBJzYb5TCEcEdsIKEmdDYLdBgI+k4Ldvu+ClC7O9htcwrXgC38vJd0
         G0jg==
X-Forwarded-Encrypted: i=1; AL+hErHrqLls+31QFpURgSh3CxpNVWgWWDJf9O9MRdvzH9Ga+VZwSfKXiRRFZgr+GLzOaVsdKL1vOOF0caw/Ic8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+G+kjq00gtttTXZOrrqT0pkopVzc3I78I/o7Yh6rPG8RlVhBAi
	boB7fREOoH3vVv6gAJoRzix9GxSm85phqrIXs/wsfzghVM3s1pHnNFumd2lyRP+l1g==
X-Gm-Gg: AZFdTZdX9ufwlC2v/Qdv0sWZelDOWw+9+NSlsWguvWcT7V/Fjj8Ef8xeXIW7tTrD/dr
	wZCghU2lTNi5DCLzDZ3/yV2CkIFshLI4g6hEDaIH8nwTMZIjBJ0OgkAW4wDqFJjB9BXaYQl3FdG
	T7JpotRCdrEXpnyff4rIBB0SUL/s9ZRRh2/T7aa8rPf8WFYGrQkWag2r65dtRbC9vtU1mqJivI0
	aAKiwO8IQI3/CdwN/4rfDRbUo4MhmTpxnr5UB7qE1B5i7b0YalAkMG55b1N3MYMO+lseK8qQXki
	t+Eivt+5ALXMfEs96VQ+dydJLg+meNd7za+wIooe04ihKNlEQ4bI+pfxgMIWKEUBJB7yVlOtbue
	WbSPLIrZuApTLgBGVTpDYMdvoexBffVd45Efs1AdcIiDx6P5LRZq1wOTiGcX5v/0DfxJTFPruXf
	3t1DG3NjeeNFRsDCBnYMQIwqMhnQpbJTCZX/N6ggTki9TqVMKmDQqPDqr6o4Ei8j1C8u/dRZi01
	1GebavBL0FwyP6DMY21mbMiBuUIbI90l5kk7huZ/QY3D/Vh3WwlLoSBghr+n3gkFjZKD/VHUabr
	OvMUoA8OAQPgSZ4anIcnnG5Qb5jTBst7lHhI7zekocSIt26XoPcStbGyIDgE6HrR7vFuYRNO9fq
	0PszCI9z7ZytBAjssSoKgbpAUhg9SxtW1VxhNZNR9nTeBzXGksV5zUQBI/0GTi/OICl+uKXscai
	GKhVvCFvj9YV6p8ptVgYgwWpHUCH5VD6A232xm35QBrhn1S0CMw7uS4Bw7/81s9vvRdRhWBgfr/
	Xofnq0tuOq/66QPqhRAkm0fAGpGsvWqMnqZiiJ+kEHX6OaX3vOscOIdxixdPoZN3SFrcsCr2kqk
	X9AcU1Ki9DRaKpWyAehZrfNhsy/RzgwsuJ5VqvkIKD7ERv1GNunS5TzOUevz6EjM1mCsDdaLrRg
	=
X-Received: by 2002:a05:6402:4416:b0:6ba:c87b:b53f with SMTP id 4fb4d7f45d1cf-6bac87bbebamr1384351a12.22.1795441812759;
        Mon, 23 Nov 2026 05:50:12 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8a4sm5357732a12.21.2026.11.23.05.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:50:12 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	John Crispin <john@phrozen.org>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [RFC PATCH ath-next 1/3] wifi: mac80211: count the segments of a received GSO frame
Date: Mon, 23 Nov 2026 14:50:08 +0100
Message-ID: <20261123135010.721107-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123135010.721107-1-julius@bairaktaris.de>
References: <20261123135010.721107-1-julius@bairaktaris.de>
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

A driver with rx decap offload may merge consecutive in-order TCP frames
of one station into a GSO frame before it hands it over, as GRO would
on the netdev. ieee80211_rx_8023() counts every frame it takes as one:
one packet, fragment and MSDU of the station, one packet of the netdev,
and the bytes of the merged frame, which carries the headers of its
first segment only. The counters then report fewer frames and bytes
than the station sent.

Count a TCP GSO frame as its gso_segs frames, and its bytes as those of
the frames it was merged from: its length plus the headers, up to the
end of the TCP header, of every segment after the first. Any other
frame counts as before.

A merged frame to another station of the same interface takes the
internal forward of ieee80211_rx_8023(), which sets ETH_P_802_3 as the
protocol and the network header on the MAC header. The segmentation of
the frame on the way out then fails: skb_mac_gso_segment() finds no
handler for the protocol, and a driver that segments in hardware reads
the IP header at offset 0. Give a GSO frame the protocol of its
Ethernet header and its network header behind it; any other frame is
forwarded as before.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/mac80211/rx.c | 61 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 54 insertions(+), 7 deletions(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 905fd70491ce..fd7dbd4b0611 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -19,6 +19,7 @@
 #include <linux/export.h>
 #include <linux/kcov.h>
 #include <linux/bitops.h>
+#include <linux/tcp.h>
 #include <kunit/visibility.h>
 #include <net/mac80211.h>
 #include <net/ieee80211_radiotap.h>
@@ -4915,6 +4916,33 @@ void ieee80211_check_fast_rx_iface(struct ieee80211_sub_if_data *sdata)
 	__ieee80211_check_fast_rx_iface(sdata);
 }
 
+/*
+ * The frames a received 802.3 frame stands for: one, or the segments of a TCP
+ * GSO frame that the driver merged from consecutive frames of a stream, each
+ * of which carried the headers the merged one has. @extra is set to the bytes
+ * of those headers the merged frame no longer carries.
+ */
+static unsigned int ieee80211_rx_8023_segs(struct sk_buff *skb,
+					   unsigned int *extra)
+{
+	unsigned int segs, hdrlen;
+
+	*extra = 0;
+	if (!skb_is_gso(skb) || !skb_is_gso_tcp(skb) ||
+	    !skb_transport_header_was_set(skb))
+		return 1;
+
+	hdrlen = skb_transport_offset(skb) + sizeof(struct tcphdr);
+	if (skb_headlen(skb) < hdrlen)
+		return 1;
+
+	segs = max_t(unsigned int, skb_shinfo(skb)->gso_segs, 1);
+	hdrlen += tcp_hdrlen(skb) - sizeof(struct tcphdr);
+	*extra = (segs - 1) * hdrlen;
+
+	return segs;
+}
+
 static void ieee80211_rx_8023(struct ieee80211_rx_data *rx,
 			      struct ieee80211_fast_rx *fast_rx,
 			      int orig_len)
@@ -4925,6 +4953,8 @@ static void ieee80211_rx_8023(struct ieee80211_rx_data *rx,
 	struct sk_buff *skb = rx->skb;
 	void *sa = skb->data + ETH_ALEN;
 	void *da = skb->data;
+	struct pcpu_sw_netstats *tstats;
+	unsigned int segs, extra;
 
 	if (WARN_ON_ONCE(!link_sta)) {
 		dev_kfree_skb(rx->skb);
@@ -4964,12 +4994,17 @@ static void ieee80211_rx_8023(struct ieee80211_rx_data *rx,
 	stats->last_rx = jiffies;
 	stats->last_rate = sta_stats_encode_rate(status);
 
-	stats->fragments++;
-	stats->packets++;
+	segs = ieee80211_rx_8023_segs(skb, &extra);
+	stats->fragments += segs;
+	stats->packets += segs;
 
 	skb->dev = fast_rx->dev;
 
-	dev_sw_netstats_rx_add(fast_rx->dev, skb->len);
+	tstats = this_cpu_ptr(fast_rx->dev->tstats);
+	u64_stats_update_begin(&tstats->syncp);
+	u64_stats_add(&tstats->rx_packets, segs);
+	u64_stats_add(&tstats->rx_bytes, skb->len + extra);
+	u64_stats_update_end(&tstats->syncp);
 
 	/* The seqno index has the same property as needed
 	 * for the rx_msdu field, i.e. it is IEEE80211_NUM_TIDS
@@ -4977,8 +5012,8 @@ static void ieee80211_rx_8023(struct ieee80211_rx_data *rx,
 	 * frame, so count MSDUs.
 	 */
 	u64_stats_update_begin(&stats->syncp);
-	u64_stats_inc(&stats->msdu[rx->seqno_idx]);
-	u64_stats_add(&stats->bytes, orig_len);
+	u64_stats_add(&stats->msdu[rx->seqno_idx], segs);
+	u64_stats_add(&stats->bytes, orig_len + extra);
 	u64_stats_update_end(&stats->syncp);
 
 	if (fast_rx->internal_forward) {
@@ -4998,9 +5033,21 @@ static void ieee80211_rx_8023(struct ieee80211_rx_data *rx,
 			 * reclassifying the frame (see cfg80211_classify8021d).
 			 */
 			xmit_skb->priority += 256;
-			xmit_skb->protocol = htons(ETH_P_802_3);
-			skb_reset_network_header(xmit_skb);
 			skb_reset_mac_header(xmit_skb);
+			/*
+			 * A GSO frame is cut into its segments on the way
+			 * out, which needs the protocol and network header
+			 * it was merged with: with ETH_P_802_3 and the
+			 * network header on the MAC header, the segmentation
+			 * finds no IP header.
+			 */
+			if (skb_is_gso(xmit_skb)) {
+				xmit_skb->protocol = eth_hdr(xmit_skb)->h_proto;
+				skb_set_network_header(xmit_skb, ETH_HLEN);
+			} else {
+				xmit_skb->protocol = htons(ETH_P_802_3);
+				skb_reset_network_header(xmit_skb);
+			}
 			dev_queue_xmit(xmit_skb);
 		}
 
-- 
2.53.0

