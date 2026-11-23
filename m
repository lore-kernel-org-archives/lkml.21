Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430546;
	b=44kpsQ3EGuCU0j3lQ2pG3PdWlieFd/vnRx5h43KQR9yIJWloMgOx0Rc+Lr9YbjQ4lmW3
	 P8eCFzWodmjr2mZCPCIZY54f1m4kVE349+4okyhoQXM50fdDBLhmOtL16aniN/8AZ/j8A
	 BXKjDuVsemRlh/4haixlsYWSJ59lY24IozMlPY7T4bdWTjtv2P+dwfFMiEEILaiES69DK
	 woZ2QUgmb9twhe/7YEj3PtYek1fDF3rm3Q40zfRY1k+T61tNEejWnZvfMxg4a1Obwt7cF
	 JNxCUWmiY80YoVFG1AgEGMM8XAWa4oOz578dQPYmOi5oQsxwpcgyGc7iBrg1LC8tNnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gad8maG51xc8AbUCmKdDWoozq/MazB8gSdOzFhjzxk8=;
	b=jcvjWYE0MN3H/g8TTEfQwqZYLMaq9C8LxVESYd4vSaDVnH9zoVQZGBP3TFihJjSkbp1X
	 5LxBSpqEmPNHb3zdiwMAdll7I0JT2YeaVFfFpSDo+eoWIfXhDFl9B5QK1XszKsFyuMsyR
	 eeCBXrPMR8pMYSn4Xodo6GzlXkXVjL2/ZhnVkc0v2gXu0XCqMPq1y09hJM8ZmwXktr3XO
	 vrQ6gahZ/8c9eK8XFiasVwd0pxw6fjZKxXqEehtOkhqMzEBZOPthh6+PBYRlPSjQ3bASU
	 nVSgeoyqtEx1OrKTGvB2iPMPv0X68c5UWHHa3gnjFDGkDr/nYS9y6pnYrvkATK8XXDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ymkCQdTW;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA3460A2637
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFA3460A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ymkCQdTW
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c1a947b4adso2479231e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430544; x=1796035344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gad8maG51xc8AbUCmKdDWoozq/MazB8gSdOzFhjzxk8=;
        b=ymkCQdTWKblUKs3zneEL136fZwgL0BVU141HIPhQHMYDESoNywylQm6YsWRakkpfuk
         4mwKaw1xLZ1i5kmigwPkvF+sPZ81GrEb2LlAyszT4+v3PBuehlrywmKXsba44zlOxpMg
         u+I3Js9PNwurbfDhsHMElrF0XHRTvuHKbsvLXQhsNt9vwzneNlfwhAG/icZnlyv2YjRN
         CkRrMWkZDjEUwXKCZMPdlm++2l3453FqVs1+EmdLyOtYtfJY9dp63O5XVbMHy/P8hPk3
         3rOiMKffleMr6iFQ6I5bON9DoMlGq+oic0VHJMb/DLe8wbeSvAZY/dvKKN11cBV2kaKa
         oxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430544; x=1796035344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gad8maG51xc8AbUCmKdDWoozq/MazB8gSdOzFhjzxk8=;
        b=Qg0m6XjbLz2ZJq6Q7v/mw5ha+geqjiPijmwEFOstl114g39wa0zPELLakqi0y0jY0A
         NWRqFy7wGkwJEpqtLwz7XCduV/UtAH9mAm5RPHUOhFci9p6kdnLmtkACB06qguNWi1Cb
         0tGmYTTJKCvs3PPxIak4LbqPWeU8DZUhAqGBMpLWNXzfSZPA9+ooIjD0fd/qXTUuIGhe
         67VuabJT4NR/GOfkL7xZQU1X1jxz+Rk9q5RybQn4e9E1J4gQ4SGb+io9B6Vv+nof/7WH
         EXeAP882bnQy/+UBsku0kBO/cOoF4k3aAfnTuzdWjhmYEl1S0ufrXzQ2t+NpaDdMlYyQ
         395g==
X-Forwarded-Encrypted: i=1; AL+hErFZdDPO88u3gb2cOEv5o2rXpP0xDSVjISl1rOrDz3oyQ0h4YFyY7+VhOt0g57/h5h5JDxEZMAk+yy9br24=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i72CQ55BCEJEcdYXxZ4D9RT6kyHstQC+ykLDve215HFuWXoku
	VBanqdIwSc0sPwehgUQcdYQHbk6u4cvPozaxUXnE1wUrR97g+UkuPiZy
X-Gm-Gg: AZFdTZdrHMD/UocMDVWC2XCt3uboR/V9+Z7im3Rh3JkMmloopOGretB20vUdYgYJzDB
	nE2K93QhY3xVEc9ilxWQCC4YzgaB357U1rxNKGBewzcTfqOfn8xnDq937u28QzbUEa0AISWxbRE
	2lgbSeN4ycIsmi0/6oAcTVTDNsHWTJ6s/M05mP2XgvihZQId0G0fwnnCs9IAFGYoqtjFIMcg4gc
	bg4MHh4QL+GfHtiPzGJbeqfIqMUZg7QdWQ9BXw9dp91nkJaM6rAOnmBMtFNBQNqwaWpm/z9f7Or
	5T6qAZ455E38rirrY/UHtVWj36knuS4ke6DVMAPMuD3jfhhS+rTQfvdg0+8anvciqGUcAcEl6Sq
	sQjqL7GxFJyZ2rWQLva7+DxFcre3+IxTiblCs4oG0RwRhl0No2aFxtVqryL35g01pTHakLHfyv7
	ZHX4T4EnU3UVTJ/breTnE/fdS7J65pb4Ff41dkGsPTOaQMScIfXBATN9qM+d9GRNWxs9wYrSdMN
	Qigw5VIOKxLq+ggqrIu+rboC2g0lSZzDLDXaAgdltykr9podbQvBMEYk47bMEczmdC25VA3D7my
	3OrGT8rtDtIy1F/Jg0PEJD/8S3u+bk4D5tD4uisFAzR2ivLmki5910YMVWFCB5G4R9MY0Doo6Ve
	mItmUUZmZX0EuzIXF7A==
X-Received: by 2002:a05:6512:2249:b0:5c0:b73:a3d2 with SMTP id 2adb3069b0e04-5c1bc717115mr2954781e87.2.1795430543999;
        Mon, 23 Nov 2026 02:42:23 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([212.35.163.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf332e3sm2859535e87.1.2026.11.23.02.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:42:23 -0800 (PST)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v8 7/8] ip_tunnel: add drop reasons to the transmit path
Date: Mon, 23 Nov 2026 13:42:09 +0300
Message-ID: <20261123104210.199916-8-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123104210.199916-1-littlesmilingcloud@gmail.com>
References: <20261123104210.199916-1-littlesmilingcloud@gmail.com>
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

ip_tunnel_xmit() and ip_md_tunnel_xmit() free packets from unrelated
failures at a common drop site in each function. In particular, a PMTU
drop after sending an ICMP error and a failed encapsulation both
increment tx_errors. Report PKT_TOO_BIG for the former and propagate
the reason from ip_tunnel_encap() for the latter.

Use IP_OUTNOROUTES for a failed route lookup, RECURSION_LIMIT for a
route back to the tunnel device and NOMEM for headroom allocation.
Distinguish an NBMA neighbour lookup failure from a missing transmit
target, and report TUNNEL_TXINFO for invalid external-mode metadata.

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 net/ipv4/ip_tunnel.c | 42 ++++++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index 92e26464f2ee..c73a53df07dc 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -586,6 +586,7 @@ static int tnl_update_pmtu(struct net_device *dev, struct sk_buff *skb,
 void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 		       u8 proto, int tunnel_hlen)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	u32 headroom = sizeof(struct iphdr);
 	struct ip_tunnel_info *tun_info;
@@ -599,8 +600,10 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 	tun_info = skb_tunnel_info(skb);
 	if (unlikely(!tun_info || !(tun_info->mode & IP_TUNNEL_INFO_TX) ||
-		     ip_tunnel_info_af(tun_info) != AF_INET))
+		     ip_tunnel_info_af(tun_info) != AF_INET)) {
+		reason = SKB_DROP_REASON_TUNNEL_TXINFO;
 		goto tx_error;
+	}
 	key = &tun_info->key;
 	memset(&(IPCB(skb)->opt), 0, sizeof(IPCB(skb)->opt));
 	inner_iph = (const struct iphdr *)skb_inner_network_header(skb);
@@ -619,7 +622,8 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (!tunnel_hlen)
 		tunnel_hlen = ip_encap_hlen(&tun_info->encap);
 
-	if (ip_tunnel_encap(skb, &tun_info->encap, &proto, &fl4))
+	reason = ip_tunnel_encap(skb, &tun_info->encap, &proto, &fl4);
+	if (reason)
 		goto tx_error;
 	inner_iph = (const struct iphdr *)skb_inner_network_header(skb);
 
@@ -630,6 +634,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 		rt = ip_route_output_key(tunnel->net, &fl4);
 		if (IS_ERR(rt)) {
 			DEV_STATS_INC(dev, tx_carrier_errors);
+			reason = SKB_DROP_REASON_IP_OUTNOROUTES;
 			goto tx_error;
 		}
 		if (use_cache)
@@ -639,6 +644,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (rt->dst.dev == dev) {
 		ip_rt_put(rt);
 		DEV_STATS_INC(dev, collisions);
+		reason = SKB_DROP_REASON_RECURSION_LIMIT;
 		goto tx_error;
 	}
 
@@ -647,6 +653,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (tnl_update_pmtu(dev, skb, rt, df, inner_iph, tunnel_hlen,
 			    key->u.ipv4.dst, true)) {
 		ip_rt_put(rt);
+		reason = SKB_DROP_REASON_PKT_TOO_BIG;
 		goto tx_error;
 	}
 
@@ -664,6 +671,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	headroom += LL_RESERVED_SPACE(rt->dst.dev) + rt->dst.header_len;
 	if (skb_cow_head(skb, headroom)) {
 		ip_rt_put(rt);
+		reason = SKB_DROP_REASON_NOMEM;
 		goto tx_dropped;
 	}
 
@@ -678,13 +686,14 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 tx_dropped:
 	DEV_STATS_INC(dev, tx_dropped);
 kfree:
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 }
 EXPORT_SYMBOL_GPL(ip_md_tunnel_xmit);
 
 void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 		    const struct iphdr *tnl_params, u8 protocol)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	struct ip_tunnel_info *tun_info = NULL;
 	const struct iphdr *inner_iph;
@@ -712,6 +721,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 		if (!skb_dst(skb)) {
 			DEV_STATS_INC(dev, tx_fifo_errors);
+			reason = SKB_DROP_REASON_NO_TX_TARGET;
 			goto tx_error;
 		}
 
@@ -725,9 +735,8 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 		} else if (payload_protocol == htons(ETH_P_IP)) {
 			rt = skb_rtable(skb);
 			dst = rt_nexthop(rt, inner_iph->daddr);
-		}
 #if IS_ENABLED(CONFIG_IPV6)
-		else if (payload_protocol == htons(ETH_P_IPV6)) {
+		} else if (payload_protocol == htons(ETH_P_IPV6)) {
 			const struct in6_addr *addr6;
 			struct neighbour *neigh;
 			bool do_tx_error_icmp;
@@ -735,8 +744,10 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 			neigh = dst_neigh_lookup(skb_dst(skb),
 						 &ipv6_hdr(skb)->daddr);
-			if (!neigh)
+			if (!neigh) {
+				reason = SKB_DROP_REASON_NEIGH_CREATEFAIL;
 				goto tx_error;
+			}
 
 			addr6 = (const struct in6_addr *)&neigh->primary_key;
 			addr_type = ipv6_addr_type(addr6);
@@ -753,12 +764,15 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 				dst = addr6->s6_addr32[3];
 			}
 			neigh_release(neigh);
-			if (do_tx_error_icmp)
+			if (do_tx_error_icmp) {
+				reason = SKB_DROP_REASON_NO_TX_TARGET;
 				goto tx_error_icmp;
-		}
+			}
 #endif
-		else
+		} else {
+			reason = SKB_DROP_REASON_NO_TX_TARGET;
 			goto tx_error;
+		}
 
 		if (!md)
 			connected = false;
@@ -783,7 +797,8 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 			    tunnel->net, READ_ONCE(tunnel->parms.link),
 			    tunnel->fwmark, skb_get_hash(skb), 0);
 
-	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4))
+	reason = ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4);
+	if (reason)
 		goto tx_error;
 	inner_iph = (const struct iphdr *)skb_inner_network_header(skb);
 
@@ -802,6 +817,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 		if (IS_ERR(rt)) {
 			DEV_STATS_INC(dev, tx_carrier_errors);
+			reason = SKB_DROP_REASON_IP_OUTNOROUTES;
 			goto tx_error;
 		}
 		if (use_cache)
@@ -815,6 +831,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (rt->dst.dev == dev) {
 		ip_rt_put(rt);
 		DEV_STATS_INC(dev, collisions);
+		reason = SKB_DROP_REASON_RECURSION_LIMIT;
 		goto tx_error;
 	}
 
@@ -823,6 +840,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 	if (tnl_update_pmtu(dev, skb, rt, df, inner_iph, 0, 0, false)) {
 		ip_rt_put(rt);
+		reason = SKB_DROP_REASON_PKT_TOO_BIG;
 		goto tx_error;
 	}
 
@@ -856,7 +874,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (skb_cow_head(skb, max_headroom)) {
 		ip_rt_put(rt);
 		DEV_STATS_INC(dev, tx_dropped);
-		kfree_skb(skb);
+		kfree_skb_reason(skb, SKB_DROP_REASON_NOMEM);
 		return;
 	}
 
@@ -872,7 +890,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 #endif
 tx_error:
 	DEV_STATS_INC(dev, tx_errors);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 }
 EXPORT_SYMBOL_GPL(ip_tunnel_xmit);
 
-- 
2.47.3

