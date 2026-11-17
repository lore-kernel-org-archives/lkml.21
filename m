Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950339;
	b=2t7EoctgER8HCU0lC7a6+YT2/mj1mN3gx97ve6XQVDaizXPnZsnZgg1LnXVpKeNGDDXS
	 niXEQMORqT9pTKaklYFkkFNY1B4ENCYzqxFzT0hvoyjRDG0heSgjLU2OQ9sfUtW1HtgbY
	 O2F2h+4M0uDuvzJWzL+aNWtF7BCBASxlkls4yqK8mik1tbgDU55R3KWEeAEosHM9olXfc
	 MVoTYQLl2dbXwpf4r6Hq35pybS3cdpOZP32oC9eKxcUQlMod/9WLcrVyLGLv0YTGzGHuE
	 rXqnrCWne1I50zO7odH52iqBFhWMoY4fSrsxZ/PWYwUy0lr6Iox3hJUn03GoPzHXLFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7wB6bRo3lbSsZaUMjbOvD2Y5uBp3Ggx5j0TCCZ4sIdQ=;
	b=wNrLpDQYl0n3KWaq7oVJRsxot2vg5XbMR1IUsbFKGQOQKRD7g6MPMi0aALWhw/8OV54q
	 yJ77Ut0eTfKaLk6vGfqYl7tlzNQXfl0iRO+hRaE/YEHOj1qRbaVOQh++FUE2WFIDtuqV2
	 K0GcONKM4hBPN1EH60w8R3jPYi8hjVf/b8gBET5o96T5jsb6o4hD4V701CaDgabfCfKPq
	 T7DGVifwat0GBSIXM0LHyOfvMxq6QFuTs/c/c0hfDeDbzOwE6UQDXPednNfo1TQAMTY46
	 Q/yySy+skR/t3V5azUvs8m4bDBblePfRwFjkI31JzWTQgKewRM0/brXO3FrGNLf9BOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ul+Tq5Fb;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817B5606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 817B5606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ul+Tq5Fb
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso154542e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794950337; x=1795555137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7wB6bRo3lbSsZaUMjbOvD2Y5uBp3Ggx5j0TCCZ4sIdQ=;
        b=ul+Tq5Fbf/Rlj42uDV+HtK2Sc4z2rbt+cr7mrr5+5lNqN+x6M0DJI04jGh5JECKpvS
         +h3I4H2AdMHktmMxGjkgcz2exkmXqn594AqyoPxvX5mIhk6oM4lU3fy9ZETc/aKR2wqQ
         4lhd1ZumDNlHtfPcsFGsvAuWA0HLdEfy7K9zilLPKCL0yf3qAPqPxBLmfMM67xH7Ad4S
         4m5LSrzcWv5/cbPMgoCiKkcARGhlWJtUe538LubTWugGrpthM+ZL6ImHmctdS52z9hd+
         a9gmiPJCd/eMi0pRPtcirjHZkPoeNncyx0AtOaALDtfRW3SLxvD5xh1G2kT17s+Gh/O7
         awQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950337; x=1795555137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7wB6bRo3lbSsZaUMjbOvD2Y5uBp3Ggx5j0TCCZ4sIdQ=;
        b=0GBIVeX71x29FpS5P+g7k6nCvtX2zOu5uYRl6uUF4rbtQ8xwQUyUdxVQQDshF3Je9I
         /YLXg5PKY7L47nIGTbWHhsO5puOSXALRusCfJr18XYUq7jxbDEb9G9XHDeWx7OswkPAH
         9nsu7GW06Yc+tyTBtIsFZA1WRGrGDnSX98i3XI2DrzdWjbO6QgUEAVVAsUcoNC1oa2Tv
         eG/xkQ8wm4mxab4jeDBz/RbL4cJyKYrGSi6MhrdzTTefnQ9NDr+5PCFaHKK6YvS3SOLQ
         08Ge9Kp8405JxgZsPO2D0q5Csw6ohhtzYP8HoDODY1/U17Cjn9vKjy7y+TfXVAWSVPuT
         VUZw==
X-Forwarded-Encrypted: i=1; AL+hErEV/srXyPqXE8GUGu57PiJcFAbzLvoVvsvdB9kPv3QanRCynZ8hncs0SRLFbElTSjc2e38+7tx36htXJRU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IdXZ6K8H9cA2ArbmlBuGAAuGz20cRQbONn0yrpVrweNfiuFQK
	/GDegQTW/ol3AVbMchpmZ4o6WAl0jzD30DhDniMcwQyH+a8wYeVkOcEB
X-Gm-Gg: AYBFou2Amxm14jto08vRn13PEiN9UCCxb8QztSbgNJ8piRAE2LKipmQoW+S/GNd8N0Z
	ucnjFsPW9AodlvUeDbwrZQX4/MF2EffoVJiDY8AxAcaRD9W+mWypfFAA3BK6XecFjpw2WFWZCGF
	VsvWp+84tgeCPIlm2GZ/UTMai4l1Wwh1MZalXDCUkVL22sLglwz9vr55ZQzfcNhNIMkAbluNNmd
	ZuGKOUiBWGn4QIpNSFRSTisiWv33w4+ovQ9AesYGM2HLuKVygSDEGNy7rqXc+FnOltus5rAZNjD
	v24LU7Sdbb/4hPBpU972jlK9dNBTGw8+4KaWj8YcpRtUtO+c8OupENff8MKMGUoyMlNb0eDYxf5
	ms4ODi2Kf/1UZibVwjU3+a+79qUzsvGaMB30rhIWVU3HRJUVAS/uW+6oWFnfaLMNnvDHSkTkB8m
	WZzL8Me6lCOE4fXygREDXEtdlcBCz3u3xO7MAvz0+0tAFuTVef86csxa1MinuQQIRRADtulPeos
	taILl4xPdu3f4/S6MTpUQFGzzuQVKhbO4w4710mCHz+JaFSxDUjSZYLYAS9jdzDGvVIkn9mWHmz
	c9aaz4Ujf2lsTH3QfNtP4EOm4t6dUUQuXHEMKV3S/QFqK6ocMCU6I0EuFC4lF4dsYAlYgd0C6YH
	lg6J9EWHl3ZHSHleZGt8=
X-Received: by 2002:a05:6512:3043:b0:5bf:ca51:e25d with SMTP id 2adb3069b0e04-5c1aa07392fmr111858e87.11.1794950336433;
        Tue, 17 Nov 2026 13:18:56 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([95.139.239.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa76037bsm66124e87.15.2026.11.17.13.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:18:55 -0800 (PST)
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
Subject: [PATCH net-next v7 1/8] ip_tunnel: add drop reasons to the generic RX path
Date: Wed, 18 Nov 2026 00:18:46 +0300
Message-ID: <20261117211853.3733250-2-littlesmilingcloud@gmail.com>
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

ip_tunnel_rcv() frees every rejected packet at the same call site.
Report the failing check through skb:kfree_skb and drop_monitor while
keeping the existing device error counters.

Use TUNNEL_OPT_MISMATCH when the checksum option differs from the
tunnel configuration in either direction, or a required sequence
number is missing. GRE checksum validation happens earlier. Use
TUNNEL_OLD_SEQ for a sequence number below the expected value. A
reordered packet or a peer that restarts its sequence numbering can
trigger this check.

Propagate the reason from pskb_inet_may_pull_reason() and report ECN
decapsulation failures as IP_TUNNEL_ECN.

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 include/net/dropreason-core.h | 17 +++++++++++++++++
 net/ipv4/ip_tunnel.c          | 19 +++++++++++++++----
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index 27bc63cbc020..03c6f6aa1510 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -129,6 +129,8 @@
 	FN(PSP_INPUT)			\
 	FN(PSP_OUTPUT)			\
 	FN(RECURSION_LIMIT)		\
+	FN(TUNNEL_OPT_MISMATCH)		\
+	FN(TUNNEL_OLD_SEQ)		\
 	FNe(MAX)
 
 /**
@@ -618,6 +620,21 @@ enum skb_drop_reason {
 	 * itself.
 	 */
 	SKB_DROP_REASON_RECURSION_LIMIT,
+	/**
+	 * @SKB_DROP_REASON_TUNNEL_OPT_MISMATCH: the tunnel options carried by
+	 * the packet do not match the tunnel configuration, e.g. a GRE tunnel
+	 * configured with 'icsum' or 'iseq' received a packet with no checksum
+	 * or no sequence number, or a GRE tunnel without 'icsum' received a
+	 * packet with a checksum.
+	 */
+	SKB_DROP_REASON_TUNNEL_OPT_MISMATCH,
+	/**
+	 * @SKB_DROP_REASON_TUNNEL_OLD_SEQ: the sequence number carried by the
+	 * packet is older than the one expected by the tunnel, e.g. the packet
+	 * was reordered in the network or by the receive processing, or the
+	 * remote endpoint restarted and reset its sequence numbering.
+	 */
+	SKB_DROP_REASON_TUNNEL_OLD_SEQ,
 	/**
 	 * @SKB_DROP_REASON_MAX: the maximum of core drop reasons, which
 	 * shouldn't be used as a real 'reason' - only for tracing code gen
diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index 0875474a578a..7d8744ed1664 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -384,6 +384,7 @@ int ip_tunnel_rcv(struct ip_tunnel *tunnel, struct sk_buff *skb,
 		  const struct tnl_ptk_info *tpi, struct metadata_dst *tun_dst,
 		  bool log_ecn_error)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	const struct iphdr *iph = ip_hdr(skb);
 	int nh, err;
 
@@ -398,14 +399,22 @@ int ip_tunnel_rcv(struct ip_tunnel *tunnel, struct sk_buff *skb,
 	    test_bit(IP_TUNNEL_CSUM_BIT, tpi->flags)) {
 		DEV_STATS_INC(tunnel->dev, rx_crc_errors);
 		DEV_STATS_INC(tunnel->dev, rx_errors);
+		reason = SKB_DROP_REASON_TUNNEL_OPT_MISMATCH;
 		goto drop;
 	}
 
 	if (test_bit(IP_TUNNEL_SEQ_BIT, tunnel->parms.i_flags)) {
-		if (!test_bit(IP_TUNNEL_SEQ_BIT, tpi->flags) ||
-		    (tunnel->i_seqno && (s32)(ntohl(tpi->seq) - tunnel->i_seqno) < 0)) {
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
@@ -419,7 +428,8 @@ int ip_tunnel_rcv(struct ip_tunnel *tunnel, struct sk_buff *skb,
 
 	skb_set_network_header(skb, (tunnel->dev->type == ARPHRD_ETHER) ? ETH_HLEN : 0);
 
-	if (!pskb_inet_may_pull(skb)) {
+	reason = pskb_inet_may_pull_reason(skb);
+	if (reason) {
 		DEV_STATS_INC(tunnel->dev, rx_length_errors);
 		DEV_STATS_INC(tunnel->dev, rx_errors);
 		goto drop;
@@ -434,6 +444,7 @@ int ip_tunnel_rcv(struct ip_tunnel *tunnel, struct sk_buff *skb,
 		if (err > 1) {
 			DEV_STATS_INC(tunnel->dev, rx_frame_errors);
 			DEV_STATS_INC(tunnel->dev, rx_errors);
+			reason = SKB_DROP_REASON_IP_TUNNEL_ECN;
 			goto drop;
 		}
 	}
@@ -457,7 +468,7 @@ int ip_tunnel_rcv(struct ip_tunnel *tunnel, struct sk_buff *skb,
 drop:
 	if (tun_dst)
 		dst_release((struct dst_entry *)tun_dst);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ip_tunnel_rcv);
-- 
2.47.3

