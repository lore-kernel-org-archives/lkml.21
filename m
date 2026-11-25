Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640516;
	b=dA4SS6ekL0UoBXqLmUtDYtBOCkU1j87oQqEKMCM+fUMtRxgX2KdlObBpPlVmbiWRAu6h
	 O2RddaNpHA1BIejHuInsGEdPUw334EWpzZA/bFT7HhhnYUQYx4qLEjU0yN8NJFIfDoP3v
	 aaPz5PMikgRG9DgfTGuFjGpf/xXhWyKwzhAZkgHEVm0wnMUlizpXyRpBxszJ2IB40nEqx
	 sS10wbd4UqrClJhyhBFMhjvfpmTqMWRvqjM4BQZIC73g7l6T4PePxhOS3HZuUNKTs0SLE
	 M+oQgCTo5jmhOipGx/Dm1XTgWDuw/RYFXjUjC3nHdNFivVpPs9BJR0pnKrQFyw8+ejg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=0XXWYJBR6k87H5cikH0sP2tdrFWPZl3Z6YSh/gr4s90=;
	b=rl6gzY6Ab8ZdDQEaQVWRsHgiiHZRuBzAOGLhxIGvu2yhd1ygLg6ddXUSPPMbKw+9gq6B
	 3lhJbGIvuCTzUa54CTv0vCmd471GETrXKUc6i6pdk298IrMxl36XWkwVk6CYXr4GfqjSt
	 xSbsdvusfKqZcYA0ncV0eW/kn9CnI2T5gOW42AfPUuZQYKHyLPq9b8Gq0/7OnlTvrw1Y3
	 o3D5a3NB6Wp8yclvhNN4gMJDC/+c6vRo2s3XK5gtUpTsFMjI7rMJwy9ooL0QCSa83SnEa
	 q4Y7WRjBMurtMW0wKsQgTmz24znH09NngXb7FifN3HKZ7VPzgzZpuEM5GY9y/HU6xpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZjgrQBFO;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B854606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B854606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZjgrQBFO
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so3567480c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795640514; x=1796245314; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0XXWYJBR6k87H5cikH0sP2tdrFWPZl3Z6YSh/gr4s90=;
        b=ZjgrQBFOqFqPbNIdl6RnJl/EBSHkorvsi6ww+mywK3uzDxNVRR6TQhRFQoQOBB6amF
         cS4Ip2KKMLFtdjAGv2erqlXspedo4FRUuLZiIwGOKrLXdh2WVvQ6BZEyDe+hu4RVZHs7
         8tB99CPjMIKJfdq0kZjb5eJeAckogRm010oQE3sbeBNWp8+UJKTnhbvZUUThHlNDEs7z
         JMtJuGB/YAil7KFsyYox73vy9nNqef2ubSPPVT/Sz9shTpo0Ohp+GmAa9HnCz3dJwpwX
         ssjOvm8n16sz8esNujKWrED3aXiNoYq2Bju2Yf8bnSXfARpYeK7hcE0POt8h/lE3Rrj0
         AmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640514; x=1796245314;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0XXWYJBR6k87H5cikH0sP2tdrFWPZl3Z6YSh/gr4s90=;
        b=0BK9ItKqDPudLrPt9fwfVTGLjeRTHEoFEbjJSJ8WJqjoB7kooxTnxRM0fnDlR9mnuO
         OURwg/j6UO6OzDRbzl6lCfG7jJcOqWBYyUIw5D1Nj2cy52loliApaozXA7qOfqNsozc9
         aJ3kywjQ4zR2F2f/gYD2GqjewKssEByvEkw4Cv5ZmxATEKicTftTbeIpxflXYlreZh9p
         R5z6ECVERvqsDEaaxtfzc8HfZmQPnb1eYErdKJwGd6LIAOG29weK4b+jzIVSQI+Csjcz
         p0250j+K2y4DMm5nnh3HT8nfkd1FnSHBCT6t5Cw5XNbegPP8vNMkZh2sKbEe2EudB4gy
         /9oA==
X-Forwarded-Encrypted: i=1; AL+hErE3Cj7MMrJML9/HQKqX2mBwXqhNgJLamnU2/3Nhqhdmj8+BtJfkc4A5cAhK/5bfM2AJGBROeYTOqYdl+bs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/n4A3MYez6Fws02jVctidjI8/0tMGTg/JBGflm9BpFpjYaIOMJ
	g1xn5jDjseSVlEKX87gqIILO9/Mf9QM2Py9XaZc2Cq7rbp0tSmQRbr0KAZ9bU4eXuK46mI7Lrjg
	IlQ==
X-Received: from dlbuu1.prod.google.com ([2002:a05:7022:7e81:b0:1b2:6c20:7e86])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:45a7:b0:1b5:4eec:14e5
 with SMTP id a92af1059eb24-1b55687f18fmr26708145c88.6.1795640514079; Wed, 25
 Nov 2026 13:01:54 -0800 (PST)
Date: Wed, 25 Nov 2026 21:00:36 +0000
In-Reply-To: <20261125210038.1277960-1-elkin@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125210038.1277960-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125210038.1277960-2-elkin@google.com>
Subject: [PATCH wireless 1/3] wifi: mwifiex: fix UAF after skb_realloc_headroom()
 in bridged RX
From: Elkin Cruz <elkin@google.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Francesco Dolcini <francesco@dolcini.it>, linux-wireless@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In mwifiex_uap_queue_bridged_pkt(), uap_rx_pd and rx_pkt_hdr point into
the initial skb->data buffer. When skb_headroom(skb) is smaller than
MWIFIEX_MIN_DATA_HEADER_LEN, skb_realloc_headroom() allocates a new skb,
kfree_skb() frees the original skb, and skb is updated to new_skb,
leaving uap_rx_pd and rx_pkt_hdr dangling. Subsequent reads of
rx_pkt_hdr->eth803_hdr.h_source, uap_rx_pd->rx_rate, uap_rx_pd->ht_info,
and rx_pkt_hdr->eth803_hdr.h_dest dereference the freed skb (and in the
RFC1042/SNAP conversion branch, rx_pkt_hdr->eth803_hdr.h_source was also
partially overwritten in-place when constructing the Ethernet II header).

Save rx_rate and ht_info from uap_rx_pd after the packet length check
and re-derive p_ethhdr from the live skb->data after any headroom
reallocation, since skb_pull() already positioned skb->data at the
Ethernet header in both header-conversion branches.

Fixes: f7b598532f3d ("mwifiex: update statistics for bridged packets on AP interface")
Fixes: 442f6f9b49c8 ("mwifiex: maintain station statistic in uap mode")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/net/wireless/marvell/mwifiex/uap_txrx.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/uap_txrx.c b/drivers/net/wireless/marvell/mwifiex/uap_txrx.c
index 318bd4ed8399..d2512b985014 100644
--- a/drivers/net/wireless/marvell/mwifiex/uap_txrx.c
+++ b/drivers/net/wireless/marvell/mwifiex/uap_txrx.c
@@ -89,6 +89,7 @@ static void mwifiex_uap_queue_bridged_pkt(struct mwifiex_private *priv,
 	int hdr_chop;
 	struct ethhdr *p_ethhdr;
 	struct mwifiex_sta_node *src_node;
+	u8 rx_rate, ht_info;
 	int index;
 
 	uap_rx_pd = (struct uap_rxpd *)(skb->data);
@@ -113,6 +114,9 @@ static void mwifiex_uap_queue_bridged_pkt(struct mwifiex_private *priv,
 		return;
 	}
 
+	rx_rate = uap_rx_pd->rx_rate;
+	ht_info = uap_rx_pd->ht_info;
+
 	if ((!memcmp(&rx_pkt_hdr->rfc1042_hdr, bridge_tunnel_header,
 		     sizeof(bridge_tunnel_header))) ||
 	    (!memcmp(&rx_pkt_hdr->rfc1042_hdr, rfc1042_header,
@@ -183,16 +187,17 @@ static void mwifiex_uap_queue_bridged_pkt(struct mwifiex_private *priv,
 	tx_info->bss_type = priv->bss_type;
 	tx_info->flags |= MWIFIEX_BUF_FLAG_BRIDGED_PKT;
 
-	src_node = mwifiex_get_sta_entry(priv, rx_pkt_hdr->eth803_hdr.h_source);
+	p_ethhdr = (void *)skb->data;
+	src_node = mwifiex_get_sta_entry(priv, p_ethhdr->h_source);
 	if (src_node) {
 		src_node->stats.last_rx = jiffies;
 		src_node->stats.rx_bytes += skb->len;
 		src_node->stats.rx_packets++;
-		src_node->stats.last_tx_rate = uap_rx_pd->rx_rate;
-		src_node->stats.last_tx_htinfo = uap_rx_pd->ht_info;
+		src_node->stats.last_tx_rate = rx_rate;
+		src_node->stats.last_tx_htinfo = ht_info;
 	}
 
-	if (is_unicast_ether_addr(rx_pkt_hdr->eth803_hdr.h_dest)) {
+	if (is_unicast_ether_addr(p_ethhdr->h_dest)) {
 		/* Update bridge packet statistics as the
 		 * packet is not going to kernel/upper layer.
 		 */
-- 
2.56.1.839.g22a8290db9-goog

