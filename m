Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950339;
	b=vuqbSp16LVkxt0yHJ1MBDkzx+ejVdNpya3sqsnX9wkA32mYI5aaE4fM4zA9uHEOpTjJL
	 F94EFb7PvfRZ4I1bCFys0PdDGm1PAuY3RDiOM36IzR6QYYvD9hVMcobEOYaJ5FASfhLnG
	 NO8nHbXLjKdZqaMCLaloA1YDXEC23DJrJuYtfaB3bVpm/DInNsqiBkF+w9qGH5lPd26xv
	 GJ9fUVpkjG5oBF+9eg1PJtPltLu1h+OhXhMjub2PyUntk5koAJZ6Hdwglq5jBUtIdqyFz
	 YT/fEu3PTs9DP7n7WbhDh/zQM54IZfTZa7FOjpw/9CGTwcdYZkPIDtzkjcb2CqpyGYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=svANmzVlQPod18zx4UiEVTuKZ2HdW1VhhQxArxLt/Sc=;
	b=yGI4sfTN27DfO3i0Wr8LYyJXvX/srimd6IWM1VNgy5G1/EoKlMpb+wP7EflSAWFYcg7w
	 g56niBd++f3QG4xlnUUg4bXlMfjlJnlRylGxjeq2MhbcI8zkmlHAJOaD5zNtwwgBGgrIG
	 WzWpRkNYluYK5TxLAIDFPtJPPMiHzEnkARKTCtT8gIDkwpcI8JDpi4ceqXKLzdUAMX6kc
	 sXULpPbFiSrsX+fUE9gzFe3GGlI2gIXexBqmyGWdd5Kpb5o/ifMAy965AyMCxL/tu6x/6
	 ul7jQb8PajMsTzrbSBeOp+AKwcNUXVYAdA1C6JbjP2+5fcAYORJE+xDQZqFjS1K3PBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dSCT2kPM;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB71606A894
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EB71606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dSCT2kPM
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so3771571fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794950338; x=1795555138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svANmzVlQPod18zx4UiEVTuKZ2HdW1VhhQxArxLt/Sc=;
        b=dSCT2kPM7qCIsgslpfSDEo/K73skdCToK+/f6A2A/6cdgdwVj+YFLMAs4/JwcaGk3A
         VnXD3eQW5p2puqEZ+aCZaslk08qtsMW+aX5X+rzY7eKKibJPHJV0EE09LpURcITLKfH2
         /xgLnNuvE2jMr0a1ClWNCP8vU00fzAJR4JWAYlB5dkz8SXURPTsz/zZ1a8rBGnihWpci
         HxsYOZKi4egf4nYlRucAQd4IykkWLpJl3BEps1J6PvzissMF5WwmIp0fDoSmcdAKd/RA
         OhQCterhO4l4IbmQaY0woSiGkMUDSqofY0v/G+eDvofn11dn/rR0k/YzLwgHFgsQxf5m
         0QrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950338; x=1795555138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=svANmzVlQPod18zx4UiEVTuKZ2HdW1VhhQxArxLt/Sc=;
        b=psVN2BNduc7VYk6eXz1/07Dndw9WtGS5LkKsVD+31NFaYaYtUO3kXVFyfteYUk8YhH
         FYF29y6HCmQIssPLIQ2GIwFWxycbSvtw7qicMlRUTm3c8Of5BkuO9O8rpFr0LmBvNkc0
         PpDgYEsNeR+KWPnB12HykUy/eySFw4jcaz5vK98dNW22dAzkTu4SSsUwC2J7tyYlShGY
         2V877riO0t9yIvjRkFNRj9G2+XzBDASTwSSxC+oV3wu2/T482DDue1/BaXV9ulFLjsSe
         Mi9gB1e2FbST1AL46VO15mNp8Oz3Z0p5sX3PhVh4a1kSzx00ZQaSCYFK26Q/X6238S1k
         +57Q==
X-Forwarded-Encrypted: i=1; AL+hErHWqQsIQKStN3inl9F88oOWc9/syuVSgIt+lFBcH0CnGHsunBgAaG7leYXIt61CF7sVAFWlCA6aKU64zMo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bSFLSp1FY6qxCzPlcIK5GffLUPm1B9mcTQ/zguBm7PQRM6ZVZ
	O9hBgGWUGAU/Fa/Yo1Hh8vRaffpvjxDcxpkev1zOFeEJpXvOqE0fRyvq
X-Gm-Gg: AYBFou2UkSRtNQNQVdFhPd4Z7CWewq4dqUPC16Ss84B2q4QTZ61iyUqsgCMl1wCj/Hv
	74bXNOMWMvUSXIniYsR0PY/rBz1uwKYoGjsuEyQP6mK1F+/Vh8+NW74+mq5mro2WDm+YjMVyaWE
	5WOW4x9Hsy83fAwsPYkKxzX6S/oVtD2YAHPLlfRKDTPgs+bI3R+GIcmrWPtFaudarMiLFQUITyV
	BhScU8sZK8BhQ6/oU+w//lQGQ89RvnbWdPCGoJLCtE2M6J1WwmKgXUFBNrQahNRVJs/TPP6ubcd
	8S/KWL27dLb0uZgeqS2v7YueUfP9sb0ttY2mv4BPfmkRcb38DzmqtAqzUSX/THq4UnUru5bRbWR
	ybGm19rW3QMwRFex/XYbvfhY9TN+pQAR/V87W9Ufo8dx2ERNklqChJg1ra8LEd/YfsKAarY+a58
	rpDj7okgFVGIQvB9GYpq3c4w6n5Whtqks00EVq1qa1RrrfRITpj+5Xz5oqBgs4lvZN97w7fKiVI
	nFilzYAkVcbYXY+7zKBofyvZf0IJNA3j5sFYz/fFLBxoRa6o1t4iiJ/H6gU8yZ+M0EOR9t5mzz0
	B3XT4nk2SK6996iZD66iOqNamnwGjTkinRme5kqidL2f3zVAaRzW4DmXaFTbEonQNLeImUrD1Sk
	3pbGHpNVNGa/JWbnnGA==
X-Received: by 2002:a05:6512:3dac:b0:5c1:4cad:c31a with SMTP id 2adb3069b0e04-5c1a9f30272mr116770e87.63.1794950337601;
        Tue, 17 Nov 2026 13:18:57 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([95.139.239.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa76037bsm66124e87.15.2026.11.17.13.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:18:57 -0800 (PST)
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
Subject: [PATCH net-next v7 2/8] ip6_tunnel: add drop reasons to the receive path
Date: Wed, 18 Nov 2026 00:18:47 +0300
Message-ID: <20261117211853.3733250-3-littlesmilingcloud@gmail.com>
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

