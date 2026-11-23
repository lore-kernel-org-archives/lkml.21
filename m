Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430536;
	b=u3482C9dw1Ju9A1S9fwIiB6hsJubQ3sEzgtcBAw7SI++eTfcZXS6C50pwOzMGxvDivyF
	 7vs5LrzEQQ45Vc2rWt+PfZoyoNmhX5c5TJVb5v7x+EL6EKOOGtao7S8/4fNUctMrtYx3Z
	 k9C4xlj/A+Bxplk+X8qvxFRzmalNPU6bcfhAh/35KXgAJYGZ1kpmziozZKj2mIQ8TqFwD
	 mxdWLBPqE7Hr57ls1vNYiksvzEGR8gC5HBZ3qA1ZjNby6WDul3g6IJqHGBW1Ne5OqFXlB
	 G9qK5mQntzrJ4QNuSfJ0Qdla6nRzFOvEcBhz2R7xMuSMH4ZuJoIjSoJixNotZM0eVfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sZEvWJJs9gNGR6cDHf5uqCIrchpjW4HhbI7/ro7mHso=;
	b=0rtqc5fWUbIxlWVKDB6KZWobaVTuIWtWSEu7hwDq3/Qg04u0gezc77rU6/xrGWVxh06H
	 HWXV/MrSR2UnovL1i5dNLgi6y8RJJsRipnwWED2XG6gWaZNcoL67w7kcPNpO4qrdqmhn+
	 MgxfRGiB6ao/lVMQi9b9E2+5jR6vrug7j5yrt5wmd8PSvIAcWduPpde0iDWWEIhRnToMG
	 MjzGFbNO3BDkyCqM1APbBDlkg9fWI6R+pdSrL0p8zRBYQuDpr3DvIs5X1+SmYsvdigxse
	 ziayLTwlkXCTF4XuW2tfYrnNF771jBL4GVWJu03z0x9blNGTezCvDcvOaN1z42XdBkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vcGPa0GQ;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89141606A336
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89141606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vcGPa0GQ
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c15ccd7fb5so1736600e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430535; x=1796035335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sZEvWJJs9gNGR6cDHf5uqCIrchpjW4HhbI7/ro7mHso=;
        b=vcGPa0GQO/HXO6DJDxV07bel9tvg/kEmWFX2k9vKrYoq8GScaOMxHnCuw/5HxBtm10
         qa+uYvEkSYMomvYoPJoUXw08PkByWiimD/0zkECurzHP9uKwO0zj2+tGpE1bkeKlQHsQ
         8appaCL7ZgAEfwn9+3dhQxGwEGwwUdTpzV1LRKTDkNSVMcSOU0zrJo+yvgPbaSUuGiFa
         BdFH3k05uyDfjeanZL8l9fe+lk7KOjjQN1xvZko2Bk612K5FNwFVNtbB9ct3gZObMvc3
         9+M3dp1OKHQtwJSZB5LsZMB779YEh7HC34oC5ODr7UTM3outyUs3jCLa2C/zdVPTxpg1
         AShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430535; x=1796035335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sZEvWJJs9gNGR6cDHf5uqCIrchpjW4HhbI7/ro7mHso=;
        b=r4R1LPfcS1q2fm+iYAIZ000CH4rJ5Bvp04rPSqtdcChAZdshxwvSxTOvQj1g0jR3/b
         z0kqSZu/Wie5xLWWOB3qXSO8noeogNA9ZUmgtpRL9GwqIxBMQppGNw7WUf92Fc8LZBR3
         UV/7GC0qdTO41gNdmF0FoMnkdgPQR2G95lVxbsY0AqEKRXXDaGs1+9WpUM56fsPof51D
         apHzhxc0o584VKQWJ3XTAyseanWp41pol2CnX6f/LDVG2EDw/3RQD5Pxh2BUk51ttQfB
         jE9MvzmdDSdfJlR1CulY2V1NIiL1l5U7zNrjOe4o3IvFc9hKX8oq9xhpzop/r8U4jmML
         c42g==
X-Forwarded-Encrypted: i=1; AL+hErE0tm2nPwD9/Z2w4SJmz9SBEpJm35HDRy3pOK37p76uKoAGK6qKXMdSOcAEwpClGszrwE+bxQcs7eRZ5MU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yXOO0VS0BgMjTyt6puSTWhY52HpVW9aXdhoKV8ZpCPICCm6Q3
	viC0A5SbiyAdbFKk4XsxUEqgIzNFggkMcrb54IjlcMy4Fes8Wvi2ELwv
X-Gm-Gg: AZFdTZfjXHnHfnWxPRmXR7RzI5r2/hNuoFMfS5Y2tiAR7VUGmDZFpt2EcTiqcVamcri
	ZevIGPOUcqr6Zw0R54MnEhq5zosOmdBBzFC2Ph6sUDwiY6PFRZ4Vjcf9sbzxb1I2kuJLROH9/+8
	ORi1BYokZLZlcWSzlMAWZ5NYesgRub0Lc7xQFROpKVyf6PyLwkCB2h9s0wy/uOYALtRRuF2G6sG
	4qAteWepDMy/8rg/JWP5EQ4y8h4qGLL9BQjckRVSN6EiyfPa6Bo73pjLN1Gh320Ze1eifLzNo1a
	s+2fDwWguhyNDjfzVydgNllE3B0BMoTEd1l1hy1FUCnf8aYAEw0DD8c6v3d/nRUydHt4mvt74mu
	jxECw108DTYvU2yKjIF5v5h1lAK6G6Y7dlPIzf2Msj7W51DAdo/TYP0UKmCrH+D0syAN07iqCE6
	2UA3eXBrWck4Qe0EpY58R11fheURdH1mHXGYsY3sq+pm8Mlg3YDtLQBczexwCatY2LnaE1WK8O/
	yrqSZp+s47otbJCARh1NBhvd6GYILQeyIVCiE31SrFyWakjb3L2cdJohPIvNQwwCteItl3zc2Fn
	bmKfAS7BDsnBRbxHIucwE8qZXFgECBpOoMVB34RDbrSJJJXpzc/d1e0EHbMf0H8xJkFizl2Y+7x
	JxP2a5PJlfzrimc6i7Q==
X-Received: by 2002:a05:6512:138d:b0:5be:3c86:f24a with SMTP id 2adb3069b0e04-5c1bc82068amr3577069e87.53.1795430534670;
        Mon, 23 Nov 2026 02:42:14 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([212.35.163.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf332e3sm2859535e87.1.2026.11.23.02.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:42:14 -0800 (PST)
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
Subject: [PATCH net-next v8 1/8] ip_tunnel: add drop reasons to the generic RX path
Date: Mon, 23 Nov 2026 13:42:03 +0300
Message-ID: <20261123104210.199916-2-littlesmilingcloud@gmail.com>
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
index 8cd7551a9370..4c89485b98e6 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -113,6 +113,8 @@
 	FN(TC_RECLASSIFY_LOOP)		\
 	FN(TUNNEL_INVALID_HDR)		\
 	FN(TUNNEL_NOT_FOUND)		\
+	FN(TUNNEL_OPT_MISMATCH)		\
+	FN(TUNNEL_OLD_SEQ)		\
 	FN(MAC_INVALID_SOURCE)		\
 	FN(VXLAN_ENTRY_EXISTS)		\
 	FN(NO_TX_TARGET)		\
@@ -550,6 +552,21 @@ enum skb_drop_reason {
 	 * packet, e.g. no VXLAN device for its VNI
 	 */
 	SKB_DROP_REASON_TUNNEL_NOT_FOUND,
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
 	/** @SKB_DROP_REASON_MAC_INVALID_SOURCE: source mac is invalid */
 	SKB_DROP_REASON_MAC_INVALID_SOURCE,
 	/**
diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index 1052af6245df..5137c26b9c1d 100644
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

