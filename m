Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950344;
	b=u2ucBQIL0r3aryJgX2YVxNUIIQni2m1RIVVs7d3GrW7lEJ7+yza4h5AGFbHW5lHBgi9o
	 JMM8t12ldFrlAaprmpCjcrJWKfAm0d6p560SImYE6jzYfsBsiBIr4w4olal3kOxJIdLR4
	 65GkFa7dTEj7iKe9TsT2Ax85kmeYQP+eBkSUkDFM24tI+7FvibU7PjHbIZe1jPausqF3F
	 no+LboWw3OgcZHaXbuHfeVX/wfXT6AArtcBWCP2kydSq5J6y7oW6gc1h+hNa+VqHPk3LW
	 crEhBrAMsmv+DVhXwkMxfWBhdNGLWVb4ij/OqyXE5TF2xRMA+UQTV5KG3JeyWlzmAKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LrprGJi07n9XBqwPXj3E3onpWWQViLbV9z8e9Jua3Rk=;
	b=pqIt5Wp5cDAh/twGhNPWcPQW6llUFgTaxfawWrH/SnKlAdiUuYIPfvAPAGiZ1IK7RWh7
	 TWnBJhHdFDe2MwpG8L6WTmZR/Maz1QBEFaqZci0SGSJYNbNFbwbDMhFTK/NCIJt8y+kOs
	 N6WlcOtWlDuOEskmhAIJrvFhCfmDHuUlOc7SziIlXlLmwkdyvSYUAteKub/xN7tKBdss4
	 ZzkpbfaLszsZazvSl+WMFKFOT7+bMgc/Q7Lwqki/VyPvbPcBifBthVVIehHng5M1DHml7
	 NksjpT/MuqOt2Bc/mgRpT/qhvd+ExeOlHQAkBwyPHVZb8gymjy/OiYYxFpgGQ0RcjFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1Bs1jil;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D47460A2629
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D47460A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1Bs1jil
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c14f7768acso149373e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794950342; x=1795555142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrprGJi07n9XBqwPXj3E3onpWWQViLbV9z8e9Jua3Rk=;
        b=M1Bs1jil3Pji5gyRqkQ6KQMECmLVcNYIvnVkgLgfvVsVKvasMBzo4IRxV6fexnwBMi
         7CdKUOhWjSyfqojjx1I8jiWICgkh9cmjBQ+Y3ZGwfg5eWch2VGp7nYs6sZ2pC9Z887mK
         iiB64ki47TovXpFpWZuDqHo74nxge6bi+B2Y/3fyG4y3hGFOAiVW7YuMLCj5gBlKqO/W
         z362cqjQNn7jyOJIwPs+qKbbr0A19MfsuNLmmFQzplaOBPC3tDD29L8/k31yn+HNhsvF
         5q/N/U/lv9/Yjd3Sr7Nj/ctyesQDaDz1evbpTO4I/NgB2fsPCD+QGpnpVQy8+w2SfP5F
         edFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950342; x=1795555142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LrprGJi07n9XBqwPXj3E3onpWWQViLbV9z8e9Jua3Rk=;
        b=Y9PrQTeGxiCwVSWEVNCbboNLVPZWXNkN+4OskOgLKcjerl0J8/LKm7YEz8vpabQnOA
         uHcLTPmQk2Dz6HjqFjaSVVzsuzRhK6M2Z759//jzGPRj2Z5nzoZqn0RhzQL3VFF93RKQ
         oJsK6eSm6QUYuH+pfCCcPZ2qiW96KoYdNwbIccGhGOZyxussu1KVs73iSCxMLH0YL16Z
         FIRvr05re+z9Y0rZna6/Wj1PDk2ymugfqm9yGSaddgNzRjKNAG9Ah2XK5HH/BvKvaGvQ
         f6yb3YdjNIzxKKPkLc9YzzGgVG3Pv6YdE+/s6vZAEyK13xt9MC7savmOnCTgjB4UhD4n
         /KbQ==
X-Forwarded-Encrypted: i=1; AL+hErF/04Zjs0uy1xKhPU0uMsvJNKU9FoJDdVMPfqvgazuf64jHZ8e2Gzha/ZRRuOlTjQ3XELu5st87ELo8XdA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NhDu8k3NzoyaFP4iaCIV96uCC3z8V4SYmFQdUu3iu6DGxR+E9
	2bB2/BAUtmj1Un+6QOdrC/UvcihWHsZxs7n+5ZtqJrlY+Sl/uGAQ43iLirZBXc7/VDsltg==
X-Gm-Gg: AYBFou14LPLbZ1mA2NtposVPY9xBx1D1AAkaSDvnX3M1qDHtkz/4PiTZ2m0j0lUG+81
	8bYHdfb5zkf7MVQ8hM6XMT82nhsFR3gQsfdVNjKEDadZPgZoo1VN2Tg28Kbw6713zDUsLaUvn2P
	/ggXepB9j3Flx3vLZi+ON0jlhKTe5bTtbfarAcwT2yflkFuiaf+UilU0gdZi11r9Hu1KBtPDHrZ
	ttzh3Brkaw1qhJ+T7ZNn6WRiAEDUPwAu2n4oFHQMh17bchUZFfyozb51A2nUOSURnFIeTfKnpsK
	XDEr9cxkM8KsGTwxtD2YPK4VvvMVCbpgyyxhfst3v/rjC+15s68R81kq9l0cufWkRoAURIOBpPV
	TYqSm+lgLvCuL0V8sUm6gGVUDmyZmZGRtm6z/9ZjUVetWSjmMB9CkLCznaRmxEUkL1SF7ctNhEw
	E+HfGevxR961kLGuRu4JeIX8CbAu1ZoyQuxenKoVSuorY0h0Aev5L2dAMVvR5KbYB+of9FNqkUs
	DoSYJgEIXqVHlvqSiTNR/zcQ3V5DRZQRgKLD2Mm1rK2ed7GiuVA+Q1OT6a27SZEiHH/MR064QyH
	PvrvB7M685S4wVTRJ0V0L1ehagrvaAkrYzCrWohdndjLc4nNf2pUek6Cgqskbr+WM2f1ejT5zfL
	9I59hp5lZ3XNuzXBxTLA=
X-Received: by 2002:a05:6512:3a96:b0:5c1:5a43:6291 with SMTP id 2adb3069b0e04-5c1a9c09b13mr119951e87.20.1794950342339;
        Tue, 17 Nov 2026 13:19:02 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([95.139.239.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa76037bsm66124e87.15.2026.11.17.13.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:19:01 -0800 (PST)
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
Subject: [PATCH net-next v7 6/8] ip_tunnel: make ip_tunnel_encap() return a drop reason
Date: Wed, 18 Nov 2026 00:18:51 +0300
Message-ID: <20261117211853.3733250-7-littlesmilingcloud@gmail.com>
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
index 83a17e36fed5..73053bd25c2a 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -132,6 +132,7 @@
 	FN(TUNNEL_OPT_MISMATCH)		\
 	FN(TUNNEL_OLD_SEQ)		\
 	FN(GRE_CSUM)			\
+	FN(TUNNEL_ENCAP)		\
 	FNe(MAX)
 
 /**
@@ -640,6 +641,12 @@ enum skb_drop_reason {
 	SKB_DROP_REASON_TUNNEL_OLD_SEQ,
 	/** @SKB_DROP_REASON_GRE_CSUM: GRE checksum error */
 	SKB_DROP_REASON_GRE_CSUM,
+	/**
+	 * @SKB_DROP_REASON_TUNNEL_ENCAP: failed to build the encapsulation
+	 * header of a tunnel, e.g. an unknown or unregistered encapsulation
+	 * type.
+	 */
+	SKB_DROP_REASON_TUNNEL_ENCAP,
 	/**
 	 * @SKB_DROP_REASON_MAX: the maximum of core drop reasons, which
 	 * shouldn't be used as a real 'reason' - only for tracing code gen
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
index 7d8744ed1664..f3c5d8424925 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -619,7 +619,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (!tunnel_hlen)
 		tunnel_hlen = ip_encap_hlen(&tun_info->encap);
 
-	if (ip_tunnel_encap(skb, &tun_info->encap, &proto, &fl4) < 0)
+	if (ip_tunnel_encap(skb, &tun_info->encap, &proto, &fl4))
 		goto tx_error;
 
 	use_cache = ip_tunnel_dst_cache_usable(skb, tun_info);
@@ -780,7 +780,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 			    tunnel->net, READ_ONCE(tunnel->parms.link),
 			    tunnel->fwmark, skb_get_hash(skb), 0);
 
-	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4) < 0)
+	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4))
 		goto tx_error;
 
 	if (connected && md) {
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

