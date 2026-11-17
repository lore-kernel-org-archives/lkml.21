Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950342;
	b=Xis3wZh7CHRB5RUS7Jj4fhDjS7vFX06bbC1iS+KCZt6Ijo6UZaYdjub/ULemXupK+tGl
	 LK4olm1Yvw3G8MYm7FzX8Dkntw02d6Xd5InfbAKa1hQEX4s0okYS1pVgdgoFhzmSU4fVv
	 ekanP9PUT06uk7590iLch116RQ720XdvrjgPUAt/5ryJqallii70zTIvLnR/ApGwKFE6J
	 e43wYpGRp3kPfpkQHzDcyhsaIwIfMnaV69PJc0niJT9dF1RhxofsYq7YBE7DXQ6wTKRqM
	 x9AvP0mHbrOR4PXiqzSwifHIgh0jIbq1hYeJCQvVp4BNuvvZy1IOHGd+yUqf84Sez7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6T+2m0dmOKP5vkDIbMYrm0qs8uTzh+5F0gq417om3g0=;
	b=HWG3oWu/yWTq+Kz8TsS5yQoZvfU+yKFgI4iu180P/gRsxufTLwW5/V0IICoc2V7fdc1H
	 Ye/Xh+csTBPPxsNn3evy3yya5X74oaBFqCXEHzCT+TF0gWZmba42grgyZfeeqjFyRm8ys
	 amX33OZ8jtZV9VLx0aVlZETA8nv1wpeEjwHUao3tAOzGo58+k33bEslNUniJTlr/Ynzuo
	 M0wTnrv6QsLIqySzRH4nh7zXxyMHFIb5eAaSXO1c3PIcvK3ghCjfPMIAWoabX3EMwxEoj
	 c/F+4pu9GW8z4NMz14AcxzQAVJN3YHRqXv/0XlNCfiynfcU1AAlzGcFIwhsCurUyN8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L8d8+rU0;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1045606A884
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1045606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L8d8+rU0
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c1a947b4adso168380e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794950340; x=1795555140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6T+2m0dmOKP5vkDIbMYrm0qs8uTzh+5F0gq417om3g0=;
        b=L8d8+rU0wIijXiQakcKLrOi39w3lO/krLgQBP+NzpQ06QsqbllkPzhbRkT5KEt07Bm
         iM8XfWcgjjBFN39zW0T56i8HiyLFS6pJ5jydM2DAo4GtII+JxF4QtTF2zHTw8av4n6nX
         nK8QumViCqcYFmIt+JB6Rz93U3gS+GD92LneRy0fHkM27WiIaiZIn44KS5PuJs7yEn96
         tEjT/akHeRnfIAmJJNsmBUQJFi/VqmygSh99gsW9IoPdvkHbHyCOe04EwUc4FIIPt1ZU
         mSQbvtw7tvEAI5HkJouypJFkXfyOCftMC7Pf3smtDEZCjU1eADfbiugsk0O4ekWAof/a
         0ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950340; x=1795555140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6T+2m0dmOKP5vkDIbMYrm0qs8uTzh+5F0gq417om3g0=;
        b=Hp90lwimPCIWyG0sT2wfqcYr89V0ozJSSd0+dx4WDPVGR9yqdE2wZ9XX2FxTCbEVOl
         dPGoqWgs5wX+nQT8Ldb1NL3iaCCjdYV5A74vvxBe6ogMwfm6PCqP6aGU62CK2mMzPAh0
         nhmw98DaX89if7YFNZR1ivSt/oOclbSImFh3rfqElVtI7mCAF+lJFIZWoO33MTbL6bUz
         U/ieZQYwKahlHt3v0B6MZGeqDWzw90SXl8WPeUqNK4qlyNzt+0SWu/zY4M/xrhXo1Pkp
         EkZj6yt1gdc2sSq3czYcqOwoU+HhR6xAfTOJ2CZp17xgLbLOBdHqPyrYxaF/Xq2uCd94
         3Fag==
X-Forwarded-Encrypted: i=1; AL+hErGLNl8bmST8t8RE3EcXT0i2ql7TvAy/B9tuKkFFsEdI90n63d4tUROPQUVZooKk/HlNlDolCAjyDxo+Qz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qjAyBnaFYEYAis5ijmoDW35Nn1g/mlZQ1h0OXXJZ5CSuB5iU5
	PCISF9tOUsR9DMPdwPTlezrZBKMAcy18pU3VM51aPAZ/spcME/vJPbSq3Dtnd0/b4aYYjQ==
X-Gm-Gg: AYBFou1bU23twRKX//3GHqM81tiiZNhevWxgM2ZgwsFsCZFWAFriFQnrQCdxPMOolY2
	5vNF+azJtl4W/B9vt2xRk0vXCq+64phVGbd3O2br6z3zrvv9nhCfDzBfCh5Byw5FjCodmeiI5Yl
	pJf3OumrNs7HzWoYVp6SKhWB33F4/N25XaWJlFP0iOt3CLFJ8nXMYfoTjd2sH/EcMsPpg6F9RTj
	a2oAw3IEG7Y1kgtsNuSJ7BHpVL+ALFvEkXaf5T1il6Tx8QY6FkivXKFd/+T5yK/3yi9Z1Gtg6Zh
	B5Bpc+om2c23w66T980ldahzPnrEMl5CuOg/Q+4HSUVORhk/4dvZUqSOkjw2l1yzsAGcceaQX95
	SNbFvxidYkdsTJ8q15eprE55maHjAO1rHvogRU1RwWhH14X1B7G/rJaz7cD+QthDK6inwJq8cqM
	rFIjEfLltvZbs0uA3AN2vr0kQMQaxwiJ1mKh5wX1dYRz7Cv7Z7knKiiDS7HQqXYuWzyRNMC5W1/
	Rn5j98pO/oeXDiv2joY4lYJk31QEsiXIP9oD4YytK+StmBLBgIaliexks5SJD+4/VJWjeI+n2ld
	YZ+KBDjKoAfvnr2yBeK2ZxOHd/+fLlLJZOjRmR3huALBH2ad7w5YpYHmCsd7avXyutkuB6l8tyO
	Stnvzpwie3AJ0e8eVfw==
X-Received: by 2002:a05:6512:3411:b0:5bf:a01e:8fa0 with SMTP id 2adb3069b0e04-5c1a9f1fc17mr137644e87.57.1794950340027;
        Tue, 17 Nov 2026 13:19:00 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([95.139.239.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa76037bsm66124e87.15.2026.11.17.13.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:18:59 -0800 (PST)
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
Subject: [PATCH net-next v7 4/8] ip_gre: add drop reasons to the RX path
Date: Wed, 18 Nov 2026 00:18:49 +0300
Message-ID: <20261117211853.3733250-5-littlesmilingcloud@gmail.com>
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

An IPv4 GRE packet that matches no tunnel is reported at the same
drop site as a truncated header. Report TUNNEL_NOT_FOUND for a lookup
miss and preserve the ETH_P_TEB fallback lookup only for that result.

Have the receive handlers return a drop reason when the caller must
free the skb, and zero when they have consumed it. Propagate header
pull failures, use NOMEM for metadata allocation failures, and report
an unsupported ERSPAN version as TUNNEL_INVALID_HDR.

Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
v7: Report TUNNEL_INVALID_HDR for the new ERSPAN version check.
Omit Ido's Reviewed-by pending review of this change.

 include/net/dropreason-core.h |  3 +-
 net/ipv4/ip_gre.c             | 83 +++++++++++++++++++----------------
 2 files changed, 48 insertions(+), 38 deletions(-)

diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index 922862f9ad88..83a17e36fed5 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -549,7 +549,8 @@ enum skb_drop_reason {
 	SKB_DROP_REASON_TUNNEL_INVALID_HDR,
 	/**
 	 * @SKB_DROP_REASON_TUNNEL_NOT_FOUND: no tunnel device found for the
-	 * packet, e.g. no VXLAN device for its VNI
+	 * packet, e.g. no VXLAN device for its VNI or no GRE tunnel for its
+	 * endpoints and key
 	 */
 	SKB_DROP_REASON_TUNNEL_NOT_FOUND,
 	/** @SKB_DROP_REASON_MAC_INVALID_SOURCE: source mac is invalid */
diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index be880f69c06c..7ad68392ecda 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -264,9 +264,11 @@ static bool is_erspan_type1(const struct tnl_ptk_info *tpi, int gre_hdr_len)
 	return tpi->proto == htons(ETH_P_ERSPAN) && gre_hdr_len == 4;
 }
 
-static int erspan_rcv(struct sk_buff *skb, struct tnl_ptk_info *tpi,
-		      int gre_hdr_len)
+static enum skb_drop_reason erspan_rcv(struct sk_buff *skb,
+				       struct tnl_ptk_info *tpi,
+				       int gre_hdr_len)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct net *net = dev_net(skb->dev);
 	struct metadata_dst *tun_dst = NULL;
 	struct erspan_base_hdr *ershdr;
@@ -288,9 +290,10 @@ static int erspan_rcv(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 		tunnel = ip_tunnel_lookup(itn, skb->dev->ifindex, flags,
 					  iph->saddr, iph->daddr, 0);
 	} else {
-		if (unlikely(!pskb_may_pull(skb,
-					    gre_hdr_len + sizeof(*ershdr))))
-			return PACKET_REJECT;
+		reason = pskb_may_pull_reason(skb,
+					      gre_hdr_len + sizeof(*ershdr));
+		if (unlikely(reason))
+			return reason;
 
 		ershdr = (struct erspan_base_hdr *)(skb->data + gre_hdr_len);
 		ver = ershdr->ver;
@@ -306,15 +309,15 @@ static int erspan_rcv(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 		else if (ver == ERSPAN_VERSION || ver == ERSPAN_VERSION2)
 			len = gre_hdr_len + erspan_hdr_len(ver);
 		else
-			return PACKET_REJECT;
+			return SKB_DROP_REASON_TUNNEL_INVALID_HDR;
 
-		if (unlikely(!pskb_may_pull(skb, len)))
-			return PACKET_REJECT;
+		reason = pskb_may_pull_reason(skb, len);
+		if (unlikely(reason))
+			return reason;
 
-		if (__iptunnel_pull_header(skb,
-					   len,
-					   htons(ETH_P_TEB),
-					   false, false))
+		reason = __iptunnel_pull_header(skb, len, htons(ETH_P_TEB),
+						false, false);
+		if (reason)
 			goto drop;
 
 		if (tunnel->collect_md) {
@@ -330,7 +333,7 @@ static int erspan_rcv(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 			tun_dst = ip_tun_rx_dst(skb, flags,
 						tun_id, sizeof(*md));
 			if (!tun_dst)
-				return PACKET_REJECT;
+				return SKB_DROP_REASON_NOMEM;
 
 			/* MUST set options_len before referencing options */
 			info = &tun_dst->u.tun_info;
@@ -356,18 +359,21 @@ static int erspan_rcv(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 
 		skb_reset_mac_header(skb);
 		ip_tunnel_rcv(tunnel, skb, tpi, tun_dst, log_ecn_error);
-		return PACKET_RCVD;
+		return SKB_NOT_DROPPED_YET;
 	}
-	return PACKET_REJECT;
+	return SKB_DROP_REASON_TUNNEL_NOT_FOUND;
 
 drop:
-	kfree_skb(skb);
-	return PACKET_RCVD;
+	kfree_skb_reason(skb, reason);
+	return SKB_NOT_DROPPED_YET;
 }
 
-static int __ipgre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi,
-		       struct ip_tunnel_net *itn, int hdr_len, bool raw_proto)
+static enum skb_drop_reason __ipgre_rcv(struct sk_buff *skb,
+					const struct tnl_ptk_info *tpi,
+					struct ip_tunnel_net *itn,
+					int hdr_len, bool raw_proto)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct metadata_dst *tun_dst = NULL;
 	const struct iphdr *iph;
 	struct ip_tunnel *tunnel;
@@ -379,8 +385,9 @@ static int __ipgre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi,
 	if (tunnel) {
 		const struct iphdr *tnl_params;
 
-		if (__iptunnel_pull_header(skb, hdr_len, tpi->proto,
-					   raw_proto, false))
+		reason = __iptunnel_pull_header(skb, hdr_len, tpi->proto,
+						raw_proto, false);
+		if (reason)
 			goto drop;
 
 		/* Special case for ipgre_header_parse(), which expects the
@@ -403,40 +410,42 @@ static int __ipgre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi,
 			tun_id = key32_to_tunnel_id(tpi->key);
 			tun_dst = ip_tun_rx_dst(skb, flags, tun_id, 0);
 			if (!tun_dst)
-				return PACKET_REJECT;
+				return SKB_DROP_REASON_NOMEM;
 		}
 
 		ip_tunnel_rcv(tunnel, skb, tpi, tun_dst, log_ecn_error);
-		return PACKET_RCVD;
+		return SKB_NOT_DROPPED_YET;
 	}
-	return PACKET_NEXT;
+	return SKB_DROP_REASON_TUNNEL_NOT_FOUND;
 
 drop:
-	kfree_skb(skb);
-	return PACKET_RCVD;
+	kfree_skb_reason(skb, reason);
+	return SKB_NOT_DROPPED_YET;
 }
 
-static int ipgre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi,
-		     int hdr_len)
+static enum skb_drop_reason ipgre_rcv(struct sk_buff *skb,
+				      const struct tnl_ptk_info *tpi,
+				      int hdr_len)
 {
 	struct net *net = dev_net(skb->dev);
+	enum skb_drop_reason reason;
 	struct ip_tunnel_net *itn;
-	int res;
 
 	if (tpi->proto == htons(ETH_P_TEB))
 		itn = net_generic(net, gre_tap_net_id);
 	else
 		itn = net_generic(net, ipgre_net_id);
 
-	res = __ipgre_rcv(skb, tpi, itn, hdr_len, false);
-	if (res == PACKET_NEXT && tpi->proto == htons(ETH_P_TEB)) {
+	reason = __ipgre_rcv(skb, tpi, itn, hdr_len, false);
+	if (reason == SKB_DROP_REASON_TUNNEL_NOT_FOUND &&
+	    tpi->proto == htons(ETH_P_TEB)) {
 		/* ipgre tunnels in collect metadata mode should receive
 		 * also ETH_P_TEB traffic.
 		 */
 		itn = net_generic(net, ipgre_net_id);
-		res = __ipgre_rcv(skb, tpi, itn, hdr_len, true);
+		reason = __ipgre_rcv(skb, tpi, itn, hdr_len, true);
 	}
-	return res;
+	return reason;
 }
 
 static int gre_rcv(struct sk_buff *skb)
@@ -458,16 +467,16 @@ static int gre_rcv(struct sk_buff *skb)
 	if (reason)
 		goto drop;
 
-	reason = SKB_DROP_REASON_NOT_SPECIFIED;
-
 	if (unlikely(tpi.proto == htons(ETH_P_ERSPAN) ||
 		     tpi.proto == htons(ETH_P_ERSPAN2))) {
-		if (erspan_rcv(skb, &tpi, tpi.hdr_len) == PACKET_RCVD)
+		reason = erspan_rcv(skb, &tpi, tpi.hdr_len);
+		if (!reason)
 			return 0;
 		goto out;
 	}
 
-	if (ipgre_rcv(skb, &tpi, tpi.hdr_len) == PACKET_RCVD)
+	reason = ipgre_rcv(skb, &tpi, tpi.hdr_len);
+	if (!reason)
 		return 0;
 
 out:
-- 
2.47.3

