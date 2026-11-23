Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430538;
	b=sRduwpLdXnIpOz942uvFH2DqWp60smvn8XL9EjHmPIY9ka5GEgffKtNcjMxtnprcwbBL
	 WYBzVy9einuk/s7T48jIeknbAfChU32vG3WxB4XqyA2BBhvPg4CLp1XSgOKAAddOLDjem
	 GNmpI8wYIi7gmcjKiyuW6sNGpZ+WwsthTG+tZN5VJEMS1P07hW6LFe5N+hlWDd+TKLBck
	 w0Qz+LwmOrM+biyFhAhwxdiW8UuOoCLz7SpNka4y6Kqm27Ju+J8p4s/T0undx9Trg0K4g
	 k1OuF7FlyOhbh0JvLcvhaMjNKo4OMuBcXAPeWELsvjSsh9JOAQEvZIUQUwNppJifolA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=svANmzVlQPod18zx4UiEVTuKZ2HdW1VhhQxArxLt/Sc=;
	b=ebGzUY/GTn9YqSDRtgDFFnlF+s96GZm3FTqtHb1X0IxM4IBZAoveCFjeB8w5veAaXCvY
	 eBapzWL80aKPKS7ehKNc3r8tzvpAHBoOJ6iZMPlD0to7eOF8uXKE07/WkY8IEXOijC2ER
	 23TXbceUFHXOOYG11DgDnLI37EovVpReasVeK8m6q1qQhZY715x0sQr+OexcSZg3cpvnT
	 LTT2Fuuj/vMHmjPXBFDoqjypFSLt9x7TUoJ60rWPKt9SsJHSeXeMEyQJyH7AgxbWGtS0g
	 BapU7+GZqg7wONqXT+iaoPGq6/RL5/JyHZ5LnX9eBmBOMfD4ai09AezTYvVQGUvVzqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbE0EcD2;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B570606A693
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B570606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbE0EcD2
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c14470729eso3049744e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430536; x=1796035336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svANmzVlQPod18zx4UiEVTuKZ2HdW1VhhQxArxLt/Sc=;
        b=TbE0EcD2HmwZYHxVytSn3JrmXZnugMzpnM51QPW4xfu7LSF/P/nw+4ksDtf7HP6oEC
         qKMLW9bPluv7wq62IIpXbkokKvRkkwWCQxGFbN8D4bseyDAgENj1Smpktb+dXm+f59oq
         uZYL+eoEjeTFXKSUYl4w7VAyxrrlvHEfixScszjhMcKUOdUowC0ziL50FkBzqgG0CXM4
         xnCvz6hMEtqItflETBwur4nGcef5GwDmTbBKYvNWyTjjtvN29MBrHsKvkk2opvEYTFoX
         Lk3rmTeUah9CElX05+75AsyqujWmCSblwDEi4T6RTYqscgKtOqNG2RpLacBqSRYqJoB+
         PvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430536; x=1796035336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=svANmzVlQPod18zx4UiEVTuKZ2HdW1VhhQxArxLt/Sc=;
        b=QV03CCheawuwqFvrlm+TEQGe/8LiJa8bNdac2FETemkZxH5SzA7WrnUsZjGKzH8uJ2
         Q2uPZKeJ9iHS4bgCFHPGLxgu3Pn4Llq9cQDku6+39f0omL67/PLW0ItE0r5vGfwcc1xn
         KNsscIggQVPpC8gufxJcLD8Lsp2h4N/KnPf2J4xXfEKqN4+EDalfTXI+Y9bnHT+6lAiz
         iBN8gvrBWJojGTy8WJmWe0QbJkgE5tGccUilQMiE1FpKAjkgPpb6BK8MrRz8Oha+1ixh
         NgtxtdhVh52qT/JSLlCjfRW/vTddwPTkCjw7eBhRD6EBIVOjRJmt83vaVE8kM3UvqvSD
         5xjw==
X-Forwarded-Encrypted: i=1; AL+hErHvH5zoZK1gR0Yxa9+OFXUSTvz/xBIfgROYZmPw769gdk3GAalrbqV9Bx1jDuROxeLSrgaIneCbkYPaSLo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x6Qgya4US7TE907PItkaSbBMA2+0GTe6PCRGxh5RLijm7Vdba
	h6hBXLG64mB/7PhaopWgwrSObdYA4sUOHG/uaJL7r8lFduysghereQFk
X-Gm-Gg: AZFdTZdXJw4M/ogaUld1Fb/lJ0KhgrqItmuPGROe3alPJwUMRrjo0Vuje9yvh03ILfZ
	jSNckC290m2gkHONbChyz/OSAQVY3D5RMlcoiqHCYtQNsTDo+a9AwfvEIJHqMmvymQiSHUSnRv/
	nXmEUt9tCeEWXaCL7RM7Ls3Elp1PL/FhrO/K65nJmRrU8s6wMj8a56QApTm0ksletWngaM6VUbE
	tkuAsexD1sQLMurJuVyh3XHEvgFAUxxL/J4hhZJFVFZbTppbwAHYJg3JcVPkUfKVjgsjNoo43J6
	mgdDdJRBHH9y0vnw8Tei7qiQs+GLqHHvi7r+/jTgrf0hRhMDvew4ymvZfb6YUjl/6uQ8WIKsWGX
	b/momi7m6VqzSeazynNh087wbkg5v2eLxyrNoHld9tAZudVsDwVklXKuqCFW50A7OdtnupcHbie
	xunGz0Va4dw4178qAuNT7RgA/83pdh6IFgUWTYEke9nAJG3O1bZ7tXYzpcEsjfwWFYe6rx+5upP
	nKGcAeyxsVsSlcjf2sJrR2oKYpJMGZioUDG4wGK+q1iOUuQpKe9Imq8lvFaqY1SIXnS0Id9lAPv
	A5q0NW1E1TZzvb+WX1UpJqK4w+L7beR5iiLg640V/uHLI15bz1QqilcOrEbV0oJbDecRbJCxQRM
	PSHcw+/n0RCVdy+qBFQ==
X-Received: by 2002:a05:6512:1193:b0:5c1:57d3:efd0 with SMTP id 2adb3069b0e04-5c1bc80fd63mr2925805e87.35.1795430536150;
        Mon, 23 Nov 2026 02:42:16 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([212.35.163.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf332e3sm2859535e87.1.2026.11.23.02.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:42:15 -0800 (PST)
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
Subject: [PATCH net-next v8 2/8] ip6_tunnel: add drop reasons to the receive path
Date: Mon, 23 Nov 2026 13:42:04 +0300
Message-ID: <20261123104210.199916-3-littlesmilingcloud@gmail.com>
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

Report the same option, sequence and ECN failures in __ip6_tnl_rcv()
as in ip_tunnel_rcv(). Preserve the reason from skb_vlan_inet_prepare()
and use pskb_may_pull_reason() for the Ethernet header check.

Also report drops in ipxip6_rcv() before it hands the packet to the
common receive path. Distinguish a payload protocol mismatch, an XFRM
policy failure, a header pull failure and a metadata allocation failure.
Keep NOT_SPECIFIED for ip6_tnl_rcv_ctl(), which returns a single value
for several different failures.

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 net/ipv6/ip6_tunnel.c | 45 +++++++++++++++++++++++++++++++------------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/net/ipv6/ip6_tunnel.c b/net/ipv6/ip6_tunnel.c
index 64a184bca467..4912b08228a1 100644
--- a/net/ipv6/ip6_tunnel.c
+++ b/net/ipv6/ip6_tunnel.c
@@ -813,6 +813,7 @@ static int __ip6_tnl_rcv(struct ip6_tnl *tunnel, struct sk_buff *skb,
 						struct sk_buff *skb),
 			 bool log_ecn_err)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	const struct ipv6hdr *ipv6h;
 	int nh, err;
 
@@ -820,15 +821,22 @@ static int __ip6_tnl_rcv(struct ip6_tnl *tunnel, struct sk_buff *skb,
 	    test_bit(IP_TUNNEL_CSUM_BIT, tpi->flags)) {
 		DEV_STATS_INC(tunnel->dev, rx_crc_errors);
 		DEV_STATS_INC(tunnel->dev, rx_errors);
+		reason = SKB_DROP_REASON_TUNNEL_OPT_MISMATCH;
 		goto drop;
 	}
 
 	if (test_bit(IP_TUNNEL_SEQ_BIT, tunnel->parms.i_flags)) {
-		if (!test_bit(IP_TUNNEL_SEQ_BIT, tpi->flags) ||
-		    (tunnel->i_seqno &&
-		     (s32)(ntohl(tpi->seq) - tunnel->i_seqno) < 0)) {
+		if (!test_bit(IP_TUNNEL_SEQ_BIT, tpi->flags)) {
 			DEV_STATS_INC(tunnel->dev, rx_fifo_errors);
 			DEV_STATS_INC(tunnel->dev, rx_errors);
+			reason = SKB_DROP_REASON_TUNNEL_OPT_MISMATCH;
+			goto drop;
+		}
+		if (tunnel->i_seqno &&
+		    (s32)(ntohl(tpi->seq) - tunnel->i_seqno) < 0) {
+			DEV_STATS_INC(tunnel->dev, rx_fifo_errors);
+			DEV_STATS_INC(tunnel->dev, rx_errors);
+			reason = SKB_DROP_REASON_TUNNEL_OLD_SEQ;
 			goto drop;
 		}
 		tunnel->i_seqno = ntohl(tpi->seq) + 1;
@@ -838,7 +846,8 @@ static int __ip6_tnl_rcv(struct ip6_tnl *tunnel, struct sk_buff *skb,
 
 	/* Warning: All skb pointers will be invalidated! */
 	if (tunnel->dev->type == ARPHRD_ETHER) {
-		if (!pskb_may_pull(skb, ETH_HLEN)) {
+		reason = pskb_may_pull_reason(skb, ETH_HLEN);
+		if (reason) {
 			DEV_STATS_INC(tunnel->dev, rx_length_errors);
 			DEV_STATS_INC(tunnel->dev, rx_errors);
 			goto drop;
@@ -859,7 +868,8 @@ static int __ip6_tnl_rcv(struct ip6_tnl *tunnel, struct sk_buff *skb,
 
 	skb_reset_network_header(skb);
 
-	if (skb_vlan_inet_prepare(skb, true)) {
+	reason = skb_vlan_inet_prepare(skb, true);
+	if (reason) {
 		DEV_STATS_INC(tunnel->dev, rx_length_errors);
 		DEV_STATS_INC(tunnel->dev, rx_errors);
 		goto drop;
@@ -881,6 +891,7 @@ static int __ip6_tnl_rcv(struct ip6_tnl *tunnel, struct sk_buff *skb,
 		if (err > 1) {
 			DEV_STATS_INC(tunnel->dev, rx_frame_errors);
 			DEV_STATS_INC(tunnel->dev, rx_errors);
+			reason = SKB_DROP_REASON_IP_TUNNEL_ECN;
 			goto drop;
 		}
 	}
@@ -898,7 +909,7 @@ static int __ip6_tnl_rcv(struct ip6_tnl *tunnel, struct sk_buff *skb,
 drop:
 	if (tun_dst)
 		dst_release((struct dst_entry *)tun_dst);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	return 0;
 }
 
@@ -941,6 +952,7 @@ static int ipxip6_rcv(struct sk_buff *skb, u8 ipproto,
 						  const struct ipv6hdr *ipv6h,
 						  struct sk_buff *skb))
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct ip6_tnl *t;
 	const struct ipv6hdr *ipv6h = ipv6_hdr(skb);
 	struct metadata_dst *tun_dst = NULL;
@@ -952,21 +964,30 @@ static int ipxip6_rcv(struct sk_buff *skb, u8 ipproto,
 	if (t) {
 		u8 tproto = READ_ONCE(t->parms.proto);
 
-		if (tproto != ipproto && tproto != 0)
+		if (tproto != ipproto && tproto != 0) {
+			reason = SKB_DROP_REASON_UNHANDLED_PROTO;
 			goto drop;
-		if (!xfrm6_policy_check(NULL, XFRM_POLICY_IN, skb))
+		}
+		if (!xfrm6_policy_check(NULL, XFRM_POLICY_IN, skb)) {
+			reason = SKB_DROP_REASON_XFRM_POLICY;
 			goto drop;
+		}
 		ipv6h = ipv6_hdr(skb);
-		if (!ip6_tnl_rcv_ctl(t, &ipv6h->daddr, &ipv6h->saddr))
+		if (!ip6_tnl_rcv_ctl(t, &ipv6h->daddr, &ipv6h->saddr)) {
+			reason = SKB_DROP_REASON_NOT_SPECIFIED;
 			goto drop;
-		if (iptunnel_pull_header(skb, 0, tpi->proto, false))
+		}
+		reason = iptunnel_pull_header(skb, 0, tpi->proto, false);
+		if (reason)
 			goto drop;
 		if (t->parms.collect_md) {
 			IP_TUNNEL_DECLARE_FLAGS(flags) = { };
 
 			tun_dst = ipv6_tun_rx_dst(skb, flags, 0, 0);
-			if (!tun_dst)
+			if (!tun_dst) {
+				reason = SKB_DROP_REASON_NOMEM;
 				goto drop;
+			}
 		}
 		ret = __ip6_tnl_rcv(t, skb, tpi, tun_dst, dscp_ecn_decapsulate,
 				    log_ecn_error);
@@ -978,7 +999,7 @@ static int ipxip6_rcv(struct sk_buff *skb, u8 ipproto,
 
 drop:
 	rcu_read_unlock();
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	return 0;
 }
 
-- 
2.47.3

