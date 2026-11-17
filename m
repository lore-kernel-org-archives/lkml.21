Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950347;
	b=ju7Te8BcOE5IHmCanuD2seOs0f3Ke/k+LdXfQ7F7GYnwEzZn/0ml9WL68UycKlBOJTf5
	 j4EyAZqS1vQI3BtZPidqXZDUlHXiN1iMh95NdwGUqd4x9theSXn5HZm+V48B8y8wyN3UC
	 4gfZzAUOAvE/FEhKWVLe8RGXIamuALIT3f5V7CJ4ZiNwZIz1w7Cwegg4/l/dGpHSN9Rco
	 iXjDHzNHYWaODGsIOprTVHiDh9ZVakhwtJukDDzET9eS1bUGgdFjj18oO7yHMBkH9mDG+
	 yy9XzndEHZKU+TI5nFN88oINNU5s7LK4wgDVLV0v2BWC68LMDz7qzKmYQzog/bVH45g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QpBv608H3XEfpJHdsjwsSH4N/B/3iVDaSkCb5gSRQ/c=;
	b=weA/aXhTD0wwMlMcPhWEKbyF0e5LMFBRYl+o6Ar5j6qSjUPLaGea+UzXiD7sIwcQ+TCz
	 Y5PXmVRNWjTyppzeHbfV0hVp+Ehbt/4OPZuRQ7GQaAgVs4YL/JcNTo9glmu8d5JL5FSKC
	 PhEEkbkYHnjJ667tYS8+vnttyx7k3u3cy75O7iPhpJX89oo0wvRuJXIBqScDHqCDTOz+m
	 HnsJ8UWartQvOXq0tJ11hb5RxP1WQQoB9NBvTtbkMi/Zk6cGWyfZRf8MmOubPwPykrRIb
	 w/OlRx0atr3JUt6oaOnKRPUhQ9GrOoba12/ZHrNgcHkHKpHm+Ej0deDUNq0lOLhNm2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x70zuvrW;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2378606A8B3
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2378606A8B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x70zuvrW
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c1a3374400so154428e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794950345; x=1795555145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpBv608H3XEfpJHdsjwsSH4N/B/3iVDaSkCb5gSRQ/c=;
        b=x70zuvrWu2YcL7Uvryld218JKOJf976KEfRf0poI4WS9h8dn9Pfes2aU7/+fM/edbT
         KQ6dq9zGd122xLysO9AMy91aWdfHY988Z5FWQSl6mzS9SLjHMCSXqwESIvtwUlaY8Kpa
         WL4OJTUlqOxdVakLSttIm/YE28oVOM1+SqHAdoEhZuWw85eR5x4GmcLyS7Aprllj6JI2
         7/1qhWxw0C1RBvVcKnbQna1c42BluOWIhEiRKa9bpQ+B2SAie0SGkjr3IF9SiU4sIZKi
         xfdAaroe/WC/hKzPU3DnhJW776thh6UAiLfWgKzDviTEhfw7daEQepBVyZDv8rHG09zZ
         ftmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950345; x=1795555145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QpBv608H3XEfpJHdsjwsSH4N/B/3iVDaSkCb5gSRQ/c=;
        b=PN2thUOb2hT02+1Jf61yMXwG3FuXs0qzLGkF2YFk/H1cRIZ1AI/SmdaFln4qt2mFnt
         Syo2pmNU93h71vGGE6at8vAMgQ5VUtk2C0/tk+156YrH/FtKmP8ua9lvRVnkhiUKWssh
         65i34ycZNpODUGWrnWoFIUnAydQVnVZgD9jWRe6BzKR9jhYq9R+qHIMNRWh+U/0uItwT
         YNJ1piE7TQwvKc6lqSXoyKU6v6J+dusX4X5P+V7xt6kk0Q3tkVJAJv/6GLtglkbQTBDH
         VGaMejQVQcENDXv/M+wCIIFxRUwvg0z3+6aUl8plCD8APHhLsSBS+4KbsoiSMhm81rZ3
         /osQ==
X-Forwarded-Encrypted: i=1; AL+hErGQz+JF9UcKU38e5EV7wq5vAPZNyvCq1Z00hDiHo0kl7GXLYxwxz2eoc82lTndCcKnWOf5Nfc+KrTCAbzo=@vger.kernel.org
X-Gm-Message-State: APuU4Z831sW6lEbKx78RK4hWEkT0TlofhRcZN00lQyiauk/ENiQ1lbsg
	4Vz2Nvb3bfM2HAVTVjH/RJT11hOwFxOZivem9VE6hBNYfKrjfdsXtmsZ
X-Gm-Gg: AYBFou1kl1iy0CItY+HFZiqh8UxHa6uYc/gTJFlAQ9Q8sNxXvF+RJ09n01IJOWXNGpj
	e3uToAIISgFgf+jm9FhdzYztfFqVKRb28U0tHm6PT8A5bqZujehEym25xdZ0m8qz6cxf024kvdi
	q7ncMhCavS93XlYDZCKRvHFvUEE5lXd4hOVBrSemVNVeS8eSVVEJM7GpTq1+dbcEjA/1kAPquh4
	o9NpU/LiaCuSmzJlipghzGTV0HH47icvFqccF0OjG+ZlVVFuJbqJfoeZke/xox9JBh9K3G4r1p1
	6szCWbtfJV1qrN5CX4Z4+3ZNClUOjJDXav5X46DPHauLkTdaMQTlt4HaiKQtxzy0HFP290s0j/i
	erCA8gGQRa5TWtEZmXRT9WRxqUArjx1BIE/3rNA47NX8N5NCvGyhvTqzhM+NVEB0Xuonzr5fjb2
	cqHXMVW2LbhoDeiBwwP5xKKNUOXolzr8sBYM021o0bAhA8V34/OSDW5nes5PQwDVkQMrONzyr5F
	dg8uI7zZIDGqWOMadoTL+ZvfzZ/EWZPPre07ryNEAJelrXip8ZuHa451ekrKKc3pKvjTt8wpS0y
	YURbUG4itzX+jZt7r/p+vptkm4uRwL6/Ikla73cGl06YLQR9xLzECqLLh2ftn+EF/2PTFpufj+Q
	eDrDaW1t8DZIiEp2Xqw==
X-Received: by 2002:a05:6512:12c2:b0:5bf:fd1e:1677 with SMTP id 2adb3069b0e04-5c1aa03e820mr112961e87.63.1794950344994;
        Tue, 17 Nov 2026 13:19:04 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([95.139.239.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa76037bsm66124e87.15.2026.11.17.13.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:19:04 -0800 (PST)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v7 8/8] ip_gre: add drop reasons to the transmit path
Date: Wed, 18 Nov 2026 00:18:53 +0300
Message-ID: <20261117211853.3733250-9-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117211853.3733250-1-littlesmilingcloud@gmail.com>
References: <20261117211853.3733250-1-littlesmilingcloud@gmail.com>
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

The ip_gre transmit handlers count drops in tx_dropped, but the
common free site in each handler hides which check failed. Preserve
the reasons from the header length checks and report NOMEM for
headroom, offload preparation and trim failures.

Report TUNNEL_TXINFO for missing or incomplete tunnel metadata,
UNHANDLED_PROTO for an unsupported transmit ERSPAN version and
SKB_CSUM when the checksum starts before the data to be sent.

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 net/ipv4/ip_gre.c | 101 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 74 insertions(+), 27 deletions(-)

diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index 7ad68392ecda..b9754272b1c9 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -510,6 +510,7 @@ static int gre_handle_offloads(struct sk_buff *skb, bool csum)
 static void gre_fb_xmit(struct sk_buff *skb, struct net_device *dev,
 			__be16 proto)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	IP_TUNNEL_DECLARE_FLAGS(flags) = { };
 	struct ip_tunnel_info *tun_info;
@@ -518,19 +519,25 @@ static void gre_fb_xmit(struct sk_buff *skb, struct net_device *dev,
 
 	tun_info = skb_tunnel_info(skb);
 	if (unlikely(!tun_info || !(tun_info->mode & IP_TUNNEL_INFO_TX) ||
-		     ip_tunnel_info_af(tun_info) != AF_INET))
+		     ip_tunnel_info_af(tun_info) != AF_INET)) {
+		reason = SKB_DROP_REASON_TUNNEL_TXINFO;
 		goto err_free_skb;
+	}
 
 	key = &tun_info->key;
 	tunnel_hlen = gre_calc_hlen(key->tun_flags);
 
-	if (skb_cow_head(skb, dev->needed_headroom))
+	if (skb_cow_head(skb, dev->needed_headroom)) {
+		reason = SKB_DROP_REASON_NOMEM;
 		goto err_free_skb;
+	}
 
 	/* Push Tunnel header. */
 	if (gre_handle_offloads(skb, test_bit(IP_TUNNEL_CSUM_BIT,
-					      tunnel->parms.o_flags)))
+					      tunnel->parms.o_flags))) {
+		reason = SKB_DROP_REASON_NOMEM;
 		goto err_free_skb;
+	}
 
 	__set_bit(IP_TUNNEL_CSUM_BIT, flags);
 	__set_bit(IP_TUNNEL_KEY_BIT, flags);
@@ -547,12 +554,13 @@ static void gre_fb_xmit(struct sk_buff *skb, struct net_device *dev,
 	return;
 
 err_free_skb:
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	DEV_STATS_INC(dev, tx_dropped);
 }
 
 static void erspan_fb_xmit(struct sk_buff *skb, struct net_device *dev)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	IP_TUNNEL_DECLARE_FLAGS(flags) = { };
 	struct ip_tunnel_info *tun_info;
@@ -566,29 +574,41 @@ static void erspan_fb_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	tun_info = skb_tunnel_info(skb);
 	if (unlikely(!tun_info || !(tun_info->mode & IP_TUNNEL_INFO_TX) ||
-		     ip_tunnel_info_af(tun_info) != AF_INET))
+		     ip_tunnel_info_af(tun_info) != AF_INET)) {
+		reason = SKB_DROP_REASON_TUNNEL_TXINFO;
 		goto err_free_skb;
+	}
 
 	key = &tun_info->key;
-	if (!test_bit(IP_TUNNEL_ERSPAN_OPT_BIT, tun_info->key.tun_flags))
+	if (!test_bit(IP_TUNNEL_ERSPAN_OPT_BIT, tun_info->key.tun_flags)) {
+		reason = SKB_DROP_REASON_TUNNEL_TXINFO;
 		goto err_free_skb;
-	if (tun_info->options_len < sizeof(*md))
+	}
+	if (tun_info->options_len < sizeof(*md)) {
+		reason = SKB_DROP_REASON_TUNNEL_TXINFO;
 		goto err_free_skb;
+	}
 	md = ip_tunnel_info_opts(tun_info);
 
 	/* ERSPAN has fixed 8 byte GRE header */
 	version = md->version;
 	tunnel_hlen = 8 + erspan_hdr_len(version);
 
-	if (skb_cow_head(skb, dev->needed_headroom))
+	if (skb_cow_head(skb, dev->needed_headroom)) {
+		reason = SKB_DROP_REASON_NOMEM;
 		goto err_free_skb;
+	}
 
-	if (gre_handle_offloads(skb, false))
+	if (gre_handle_offloads(skb, false)) {
+		reason = SKB_DROP_REASON_NOMEM;
 		goto err_free_skb;
+	}
 
 	if (skb->len > dev->mtu + dev->hard_header_len) {
-		if (pskb_trim(skb, dev->mtu + dev->hard_header_len))
+		if (pskb_trim(skb, dev->mtu + dev->hard_header_len)) {
+			reason = SKB_DROP_REASON_NOMEM;
 			goto err_free_skb;
+		}
 		truncate = true;
 	}
 
@@ -620,6 +640,7 @@ static void erspan_fb_xmit(struct sk_buff *skb, struct net_device *dev)
 				       truncate, true);
 		proto = htons(ETH_P_ERSPAN2);
 	} else {
+		reason = SKB_DROP_REASON_UNHANDLED_PROTO;
 		goto err_free_skb;
 	}
 
@@ -632,7 +653,7 @@ static void erspan_fb_xmit(struct sk_buff *skb, struct net_device *dev)
 	return;
 
 err_free_skb:
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	DEV_STATS_INC(dev, tx_dropped);
 }
 
@@ -666,8 +687,10 @@ static netdev_tx_t ipgre_xmit(struct sk_buff *skb,
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	IP_TUNNEL_DECLARE_FLAGS(flags);
 	const struct iphdr *tnl_params;
+	enum skb_drop_reason reason;
 
-	if (!pskb_inet_may_pull(skb))
+	reason = pskb_inet_may_pull_reason(skb);
+	if (reason)
 		goto free_skb;
 
 	if (tunnel->collect_md) {
@@ -678,10 +701,13 @@ static netdev_tx_t ipgre_xmit(struct sk_buff *skb,
 	if (dev->header_ops) {
 		int pull_len = tunnel->hlen + sizeof(struct iphdr);
 
-		if (skb_cow_head(skb, 0))
+		if (skb_cow_head(skb, 0)) {
+			reason = SKB_DROP_REASON_NOMEM;
 			goto free_skb;
+		}
 
-		if (!pskb_may_pull(skb, pull_len))
+		reason = pskb_may_pull_reason(skb, pull_len);
+		if (reason)
 			goto free_skb;
 
 		tnl_params = (const struct iphdr *)skb->data;
@@ -691,25 +717,31 @@ static netdev_tx_t ipgre_xmit(struct sk_buff *skb,
 		skb_reset_mac_header(skb);
 
 		if (skb->ip_summed == CHECKSUM_PARTIAL &&
-		    skb_checksum_start(skb) < skb->data)
+		    skb_checksum_start(skb) < skb->data) {
+			reason = SKB_DROP_REASON_SKB_CSUM;
 			goto free_skb;
+		}
 	} else {
-		if (skb_cow_head(skb, dev->needed_headroom))
+		if (skb_cow_head(skb, dev->needed_headroom)) {
+			reason = SKB_DROP_REASON_NOMEM;
 			goto free_skb;
+		}
 
 		tnl_params = &tunnel->parms.iph;
 	}
 
 	ip_tunnel_flags_copy(flags, tunnel->parms.o_flags);
 
-	if (gre_handle_offloads(skb, test_bit(IP_TUNNEL_CSUM_BIT, flags)))
+	if (gre_handle_offloads(skb, test_bit(IP_TUNNEL_CSUM_BIT, flags))) {
+		reason = SKB_DROP_REASON_NOMEM;
 		goto free_skb;
+	}
 
 	__gre_xmit(skb, dev, tnl_params, skb->protocol, flags);
 	return NETDEV_TX_OK;
 
 free_skb:
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	DEV_STATS_INC(dev, tx_dropped);
 	return NETDEV_TX_OK;
 }
@@ -719,10 +751,12 @@ static netdev_tx_t erspan_xmit(struct sk_buff *skb,
 {
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	IP_TUNNEL_DECLARE_FLAGS(flags);
+	enum skb_drop_reason reason;
 	bool truncate = false;
 	__be16 proto;
 
-	if (!pskb_inet_may_pull(skb))
+	reason = pskb_inet_may_pull_reason(skb);
+	if (reason)
 		goto free_skb;
 
 	if (tunnel->collect_md) {
@@ -730,15 +764,21 @@ static netdev_tx_t erspan_xmit(struct sk_buff *skb,
 		return NETDEV_TX_OK;
 	}
 
-	if (gre_handle_offloads(skb, false))
+	if (gre_handle_offloads(skb, false)) {
+		reason = SKB_DROP_REASON_NOMEM;
 		goto free_skb;
+	}
 
-	if (skb_cow_head(skb, dev->needed_headroom))
+	if (skb_cow_head(skb, dev->needed_headroom)) {
+		reason = SKB_DROP_REASON_NOMEM;
 		goto free_skb;
+	}
 
 	if (skb->len > dev->mtu + dev->hard_header_len) {
-		if (pskb_trim(skb, dev->mtu + dev->hard_header_len))
+		if (pskb_trim(skb, dev->mtu + dev->hard_header_len)) {
+			reason = SKB_DROP_REASON_NOMEM;
 			goto free_skb;
+		}
 		truncate = true;
 	}
 
@@ -759,6 +799,7 @@ static netdev_tx_t erspan_xmit(struct sk_buff *skb,
 				       truncate, true);
 		proto = htons(ETH_P_ERSPAN2);
 	} else {
+		reason = SKB_DROP_REASON_UNHANDLED_PROTO;
 		goto free_skb;
 	}
 
@@ -767,7 +808,7 @@ static netdev_tx_t erspan_xmit(struct sk_buff *skb,
 	return NETDEV_TX_OK;
 
 free_skb:
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	DEV_STATS_INC(dev, tx_dropped);
 	return NETDEV_TX_OK;
 }
@@ -777,8 +818,10 @@ static netdev_tx_t gre_tap_xmit(struct sk_buff *skb,
 {
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	IP_TUNNEL_DECLARE_FLAGS(flags);
+	enum skb_drop_reason reason;
 
-	if (!pskb_inet_may_pull(skb))
+	reason = pskb_inet_may_pull_reason(skb);
+	if (reason)
 		goto free_skb;
 
 	if (tunnel->collect_md) {
@@ -788,17 +831,21 @@ static netdev_tx_t gre_tap_xmit(struct sk_buff *skb,
 
 	ip_tunnel_flags_copy(flags, tunnel->parms.o_flags);
 
-	if (gre_handle_offloads(skb, test_bit(IP_TUNNEL_CSUM_BIT, flags)))
+	if (gre_handle_offloads(skb, test_bit(IP_TUNNEL_CSUM_BIT, flags))) {
+		reason = SKB_DROP_REASON_NOMEM;
 		goto free_skb;
+	}
 
-	if (skb_cow_head(skb, dev->needed_headroom))
+	if (skb_cow_head(skb, dev->needed_headroom)) {
+		reason = SKB_DROP_REASON_NOMEM;
 		goto free_skb;
+	}
 
 	__gre_xmit(skb, dev, &tunnel->parms.iph, htons(ETH_P_TEB), flags);
 	return NETDEV_TX_OK;
 
 free_skb:
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	DEV_STATS_INC(dev, tx_dropped);
 	return NETDEV_TX_OK;
 }
-- 
2.47.3

