Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430545;
	b=pSQQGl2kPuFN/IgZg6uJeiuQrRBvxkxGcSDf+F8ZfB8QBf120V0RsKOIUJ7zXcqojxTi
	 QzoCmFoAtdxcMhY3O42NI+n4zIVZJ8MeCNB3zLMRhl9i7j//+WX8URSLGrZHsSVZJJnUI
	 rvJE/SiUbYoDYhWgHUr8dDgxgA3sV5MxvN/v1tG5Zxb4Medm6Oq08WUV9AFHef3HoOTDN
	 PxMoKvrQXmQA5TzoH5SSPz8LwAL7ptDmtocEUB3XFC8EOYqJtQY4snj9NL/Ix6e1IQmYT
	 uz5bUFtpF0xA3QbQlLstK2RoU3miC20a+S8plqQ75N5ryvbDeJ5gK10HJeTuWHcXflA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2Mu0HppQ36/o9RammXZiWbsYG3B69DWXDQ6ktqeYZBM=;
	b=eF8T4RUo8HDk6PoKyt70KEBLwxe4iICMmW+il+ClfmjqN5eR3+tr1awuMCXSl+MCgYSH
	 /R2NEXeo7jkt4MDh9AM51IBvm2/6RoOfInhqxe07Xwj69Y4YQhQ+jIrF+CjV5ltyKYm+2
	 OhJSeT8RnHpL0VahMKwBiv41NPvG03IcmTdRHEDATDCzbPL8OGKP7Jyn5RO8Wln127d61
	 vVFfTSGvpHCveSrOHKBjYQtD1OL2PvMqA+pHEm2Zi+8FkVBGLRiD50mT7PnhpIL2wNb8x
	 bG6mZiC7J5A7hSR5EpwxRaH+UAT48jL3VAieyk5Mke6xA5kHqUQscZ19/3cnWdZml7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dimQ0d/3";
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D49C60A2624
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D49C60A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dimQ0d/3
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso3872415e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430542; x=1796035342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Mu0HppQ36/o9RammXZiWbsYG3B69DWXDQ6ktqeYZBM=;
        b=dimQ0d/3DC+owpNDEGAa1VvRlrJhu6CRvdBDtQUHcWWZwxH53T5pChSO3go8MVe88T
         jgJuXnib+XI6n6dUAmhOHf9t6D8SWR0ZIiAT8xzzA/2eOSF4qO2fFSKIDcbK5YNKleyy
         /fM8x/ObMVr+G/h3k3Wcr0Hdo9QsKourTfExUdvJCuNMKtZph+Oo8GHARzl0IgKcjA3U
         itSfj/A27ft58bzzwQCvElAQbXLFtLPgwmNE61yQvDDo2L/7YlIw6WxFjBM2Fnk8+ITk
         Do+ShqPHm1p4iH5XhePRD3yCDkgbqonFfDlYO/sNTXsbPpog3aoSCrDE4cDfCcMqtNi3
         nOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430542; x=1796035342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Mu0HppQ36/o9RammXZiWbsYG3B69DWXDQ6ktqeYZBM=;
        b=XPukVNlEpBgVwRnQQRe4B09mNo5J4aeBNncax3Ym+4IqwnVLC4j69zM+LNifxJx9pQ
         MJ220cxBajJU5zeImdUzZyJQvX2dwXNv43KTJpVM7R+evBxJB7n018JAdMLgERc4ERIO
         Rapg3NqOG29vIkAiXBpiRyMxcUlqFcmsdARmaCX1IGBfyssWUkoz1zzQV6vM27IECwqn
         EFwD1vko8mSgqtZipGjCngHBU2CSHOvITDCnQufwx7hwx4hz51OMkUcepuKqp7PrBb9p
         5tLV4YEVb8KidpuARR+jrBAbfebC9YTp1m9HISqHNgT7sCdybhJtIkdXwIE9YOsx8ogC
         uuFQ==
X-Forwarded-Encrypted: i=1; AL+hErE7deisqzYw4meLNzJ8DXGYcTHWmxqaGwcMeACV9eoy1CQAZpjyE24o2XO/VD4sIp1ef+WH9xJVoADrjYw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jZq6qMiy+5dzS3C70NodHVkiUzD9Owb5sXamLs6e1Wg/Vu5Mb
	V7g90o+xWikpghu+gAYGuHrmfG9FZWWqlCacx4h1uplytgIlULx9HDjw
X-Gm-Gg: AZFdTZeVKCK+TXD2U5G/ihY/qAhnvUW5xQauRL2/PzKqzGQozw5ePcguX77+rdVAT6X
	k5+cYkl9czmxaVD5lxRT93JeET7N8Z8d4hmgWSufB3scrRObPhTAz6U4cSWb6cNnDD0FwtYA5+B
	EFCIv1qyHLPo0G8Hd6ovsLR6pGMNHUTrzrck+G1BFFycEj2nuOieKxKO3fCfq8MDt6sTubK37/8
	xA++vElof/FnZBHQkxkBX8fbTm+fiOkFT/KIN/FnDtcwIuhnb80QthlXFjyMZfBg36sXy8zHYib
	+04CMp61accvr8ZR15VvniIuAPudpBUmuwfNszz4e2Cx+8q0YHfA+zElYrglYU6zVqYU0bP35Hc
	TnXi2rbqG54QP5n/W+GSc/ZtQWpvm/yYN2Pgvx+5rJnDCzCJ7ZeIO9y1KCQ8B8655oXHTFGOj9h
	J+m4+nYiq9Jk42MSHoDMsUImkii6XVt6DBU+hAVzYx31qhQtezpr4Jraq8rbVydjk3XuqgMjDd2
	Z01IsAW3+bZh1VBeEnKe97T9trj0wvtcBhFmjxnjDPmg2GTusI4zmwsitfO3tQno48B6d2KwvmA
	lE73YH5eEWTVwFWhrVuvJThUVmmviPAtdWYQYLgMEyA2ITMcPUmhvQco4XOcx/wM0Ip7PKbBfeH
	CxH3KsIy0kulcQq8IKA==
X-Received: by 2002:a05:6512:10c7:b0:5bf:ec95:41c7 with SMTP id 2adb3069b0e04-5c1bc6f6aa8mr2515417e87.1.1795430542472;
        Mon, 23 Nov 2026 02:42:22 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([212.35.163.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf332e3sm2859535e87.1.2026.11.23.02.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:42:21 -0800 (PST)
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
Subject: [PATCH net-next v8 6/8] ip_tunnel: make ip_tunnel_encap() return a drop reason
Date: Mon, 23 Nov 2026 13:42:08 +0300
Message-ID: <20261123104210.199916-7-littlesmilingcloud@gmail.com>
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

IPv4 tunnel transmitters need the reason why encapsulation failed.
Make ip_tunnel_encap() return NOMEM when the FOU or GUE build_header()
callback returns -ENOMEM, and TUNNEL_ENCAP for other failures. Success,
including when encapsulation is disabled, still returns zero.

Update both callers in ip_tunnel.c and the one in sit.c to test for a
nonzero result. Their old negative-error test would miss a drop reason.

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 include/net/dropreason-core.h |  7 +++++++
 include/net/ip_tunnels.h      | 16 ++++++++++------
 net/ipv4/ip_tunnel.c          |  4 ++--
 net/ipv6/sit.c                |  2 +-
 4 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index 7150f357c1c6..767f528e099c 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -116,6 +116,7 @@
 	FN(TUNNEL_OPT_MISMATCH)		\
 	FN(TUNNEL_OLD_SEQ)		\
 	FN(GRE_CSUM)			\
+	FN(TUNNEL_ENCAP)		\
 	FN(MAC_INVALID_SOURCE)		\
 	FN(VXLAN_ENTRY_EXISTS)		\
 	FN(NO_TX_TARGET)		\
@@ -572,6 +573,12 @@ enum skb_drop_reason {
 	SKB_DROP_REASON_TUNNEL_OLD_SEQ,
 	/** @SKB_DROP_REASON_GRE_CSUM: GRE checksum error */
 	SKB_DROP_REASON_GRE_CSUM,
+	/**
+	 * @SKB_DROP_REASON_TUNNEL_ENCAP: failed to build the encapsulation
+	 * header of a tunnel, e.g. an unknown or unregistered encapsulation
+	 * type.
+	 */
+	SKB_DROP_REASON_TUNNEL_ENCAP,
 	/** @SKB_DROP_REASON_MAC_INVALID_SOURCE: source mac is invalid */
 	SKB_DROP_REASON_MAC_INVALID_SOURCE,
 	/**
diff --git a/include/net/ip_tunnels.h b/include/net/ip_tunnels.h
index 792690ae4f26..87046ba50d45 100644
--- a/include/net/ip_tunnels.h
+++ b/include/net/ip_tunnels.h
@@ -541,18 +541,18 @@ static inline int ip_encap_hlen(struct ip_tunnel_encap *e)
 	return hlen;
 }
 
-static inline int ip_tunnel_encap(struct sk_buff *skb,
-				  struct ip_tunnel_encap *e,
-				  u8 *protocol, struct flowi4 *fl4)
+static inline enum skb_drop_reason
+ip_tunnel_encap(struct sk_buff *skb, struct ip_tunnel_encap *e,
+		u8 *protocol, struct flowi4 *fl4)
 {
 	const struct ip_tunnel_encap_ops *ops;
 	int ret = -EINVAL;
 
 	if (e->type == TUNNEL_ENCAP_NONE)
-		return 0;
+		return SKB_NOT_DROPPED_YET;
 
 	if (e->type >= MAX_IPTUN_ENCAP_OPS)
-		return -EINVAL;
+		return SKB_DROP_REASON_TUNNEL_ENCAP;
 
 	rcu_read_lock();
 	ops = rcu_dereference(iptun_encaps[e->type]);
@@ -560,7 +560,11 @@ static inline int ip_tunnel_encap(struct sk_buff *skb,
 		ret = ops->build_header(skb, e, protocol, fl4);
 	rcu_read_unlock();
 
-	return ret;
+	if (!ret)
+		return SKB_NOT_DROPPED_YET;
+	if (ret == -ENOMEM)
+		return SKB_DROP_REASON_NOMEM;
+	return SKB_DROP_REASON_TUNNEL_ENCAP;
 }
 
 /* Extract dsfield from inner protocol */
diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index 5137c26b9c1d..92e26464f2ee 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -619,7 +619,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (!tunnel_hlen)
 		tunnel_hlen = ip_encap_hlen(&tun_info->encap);
 
-	if (ip_tunnel_encap(skb, &tun_info->encap, &proto, &fl4) < 0)
+	if (ip_tunnel_encap(skb, &tun_info->encap, &proto, &fl4))
 		goto tx_error;
 	inner_iph = (const struct iphdr *)skb_inner_network_header(skb);
 
@@ -783,7 +783,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 			    tunnel->net, READ_ONCE(tunnel->parms.link),
 			    tunnel->fwmark, skb_get_hash(skb), 0);
 
-	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4) < 0)
+	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4))
 		goto tx_error;
 	inner_iph = (const struct iphdr *)skb_inner_network_header(skb);
 
diff --git a/net/ipv6/sit.c b/net/ipv6/sit.c
index a7ec800216ad..9576d146c961 100644
--- a/net/ipv6/sit.c
+++ b/net/ipv6/sit.c
@@ -1096,7 +1096,7 @@ static netdev_tx_t ipip6_tunnel_xmit(struct sk_buff *skb,
 		ttl = iph6->hop_limit;
 	tos = INET_ECN_encapsulate(tos, ipv6_get_dsfield(iph6));
 
-	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4) < 0) {
+	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4)) {
 		ip_rt_put(rt);
 		goto tx_error;
 	}
-- 
2.47.3

