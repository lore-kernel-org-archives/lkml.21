Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950343;
	b=yzyg+80b2yxBrJRqXLIrKYbGfloyyXJjPtfqWUYfHPbYd712FbIcVcJI0DHUflKbjDno
	 QZf2QUMAhvaDvB3WfDeALOXy+jxCcPcwRi9o5HmWy6UMYdYxkqkVidSXLTys4Mw4d1VL3
	 lkDiCKR/wHVHUgsfoRi5sp54LA2H5NNxNyDAlZ4CpDjLr1R82CY1QUVBnI4lPDy7oCg+5
	 2gZkEVuZs3zEaTRcY4SsIa04jOwztnghLnSQTZQM5PEoREHFXQ+xJv743pH0J2iytZhU1
	 QThgYAXSm/0sa00w7izU/o+yyn/A3DPAuW+Hy6oz5Z7ARi56v9/35XCDoWfv8yNjfBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/nLQBYNMUocnbmb/hG7Ffmqg4ItL7VmOCCnTkk0C8hE=;
	b=LqZvGxSpw8AjE4CLONRXs1ennM/ndDmbmoKel0xfMMMx6TGHIZ7gPa514TtKRucPeRWy
	 eTZ36sAIXjyBa1R9kITsXNlrEI1knFJfffo1cjiZkUQAEjg3C8vfgS48/FSHIMFbcpCrS
	 DtB8uGNzvEK5t9ctfb06+pQ2cYMM0wzaCYmbfwdPm6fmLmmv3jLsNCAz3GGrV+vf8oerf
	 3yaYGTUg5tWzNPinPACy4yKs9jcDc+OUG/uCu8Ngghi3bTG0PgfdVSXb9UI2M57oGt6ui
	 kP//6b1YDml7EWNSoQH7w0GU3pTK1qA/iVjxNYhOopwHVpqU8nl8UEIlO5VbEVmy86w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a68WpQw6;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A9560A2615
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44A9560A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a68WpQw6
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bfbc67991cso158877e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794950341; x=1795555141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nLQBYNMUocnbmb/hG7Ffmqg4ItL7VmOCCnTkk0C8hE=;
        b=a68WpQw6NPs0VzisZgA6hwnYbabkEKkbfekZC4Ie505iQjA/dzdW5InR5J9kIZS2Zw
         tNxBO4S53WEcPOxztE6jIh/+jjXSSKUHhDO7p0XQE2glH1M/HcTR50InCaXInVko6Ah7
         zBvLpBNtgG2Lq0kjSyIguRO60gDCkiIEqagpjWLnppIvyAFnUDr0LWcblssmO0Fckf6m
         k6Tip9NzfC9LW6zs48LqDq1HNvVgA3mfMdAzCTo/L3JH0ZGRdXBAhsCZ2yjPuPhfQFst
         9FUdMmG3UgMPG6tqscqwDAd+Q3McJgAJDt5RcZjXqiUknFtZ6mn+X3P0HSCM0b0ttllA
         RUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950341; x=1795555141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nLQBYNMUocnbmb/hG7Ffmqg4ItL7VmOCCnTkk0C8hE=;
        b=BnTx2ari+fa3LsT9Awc04dxL3sxQ1v68edftiWh5CPZF2y82Hz7+K83ZFhh5j3beeJ
         z1K4l/5KXPREXZ4syONnogBxDuxtJKoDZV+uaM47xHSaF920ht6/8hT/RUkRMuleP5QG
         x5vaVjKC9z7DQjU/uxQQ/1VlKYLG8Y8AwtcZOD9Zc36TCaPZ3KofpxTcaa9b+/Z8LHJV
         hOTzYy2+r12psNZFn6kmCQ9Y1/1GB6x3/89zJGCsx18EbpfhCHayelT7VO+4Hjj9UkLl
         /WG03ffjl9t0yb+C2nSXi0uDQ4iR1zWAyLGYBLp5ZwLGeqb3tex1K7/nuj43kETe1Bwm
         SaNQ==
X-Forwarded-Encrypted: i=1; AL+hErF6DHLR7Vs3prHbU86o8yIeeOibQW9bf+Lgi4P7EThylilpDr6XwmcZZb7XgpnjZeWPaL/6Ro3pCHCg3ic=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+caIWz5WV4pPLYtq98ZlntL526xXT80HaH8EFLJilVtgDa19n
	8ex3ALDnCALU3wGWleUvMt1+yd65VtJomNuGkYOTv0goASG6DeBVYmEz
X-Gm-Gg: AYBFou2PCUG+YhEqc0TaxwJmJaRTS6x9Dsc7gWIW2axBBXS1+MOL9x5ThTKe3Wtbgrv
	PZHb+o+eW/uBt9KHlw2MLRe30jHCjysFwDqMZkN3NGhLLn4vn1XYn8/wY/xY0HUfIePlE7bQntO
	tKDRn8zARDHykaJR1zmwk+yaY7kH7IOhw4MgGCTyHuYoD687kjYVDCYsOWmQyxjsXFWBJAEn3s5
	QKilCzJGZUcievQli9U7vUQwlLHx21MsqK2wy8qQxxZsX68Egsxijix7v9lVr9If4/wvEvVYU9X
	VUa/I5iPlxeqD0oa1WS9KiAV7PdOxgn8YiiDUcjythDrTpkL+eGRbw+Itwy9sBIh2EOdA2CgZC5
	DerPoQbVVyYviwolQWZ5p1C76S94ZRWRzhOZxqpkxMwuP2JpROI0kf9yxFYPV9GF1r9Vqw0TRou
	eD05fyKrsYg+Rme+QPKntzAzEdiH05nzcFivKCP+m24Oj6tcmBwy4in1AKAcWGoOyk/uxPZYg89
	RlBeex/GNjxpUipGrGcqgjjodaV54iajmkdKqJWTYrwQHBGtOqYHT5u9N1HBjVXcXwjkpEqhzr8
	1tcFfMJi39lHhdk2hwjmz1t2fn+Yxgd6+zzCnLQ7fOF+8JVYLQxLriZ0ucnq1W03MIsfWPtURDa
	uC3vHXrHUoe9CjUvLtFHUwtyfzRaoskBDkoSKxFI=
X-Received: by 2002:a05:6512:124d:b0:5c0:bd3:d7da with SMTP id 2adb3069b0e04-5c1aa0662e5mr132585e87.27.1794950341179;
        Tue, 17 Nov 2026 13:19:01 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([95.139.239.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa76037bsm66124e87.15.2026.11.17.13.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:19:00 -0800 (PST)
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
Subject: [PATCH net-next v7 5/8] ip6_gre: add drop reasons to the RX path
Date: Wed, 18 Nov 2026 00:18:50 +0300
Message-ID: <20261117211853.3733250-6-littlesmilingcloud@gmail.com>
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

Have the IPv6 GRE and ERSPAN receive handlers return the reason for
rejecting an skb. Report TUNNEL_NOT_FOUND for a lookup miss and NOMEM
for a metadata allocation failure. Use TUNNEL_INVALID_HDR for an
unsupported ERSPAN version or ERSPAN type I over IPv6.

Preserve the reason from header pulls. IPv6 GRE pulls the inner header
before tunnel lookup, so a truncated ETH_P_TEB header is reported even
if no tunnel would match.

Remove the now unused PACKET_* return codes. In particular, a leftover
PACKET_REJECT would compile as a drop reason with the value of
SKB_CONSUMED.

Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
v7: Report TUNNEL_INVALID_HDR for the new ERSPAN version and type I checks.
Omit Ido's Reviewed-by pending review of this change.

 include/net/ip_tunnels.h |  4 ---
 net/ipv6/ip6_gre.c       | 55 ++++++++++++++++++++++------------------
 2 files changed, 30 insertions(+), 29 deletions(-)

diff --git a/include/net/ip_tunnels.h b/include/net/ip_tunnels.h
index 5cccf4c0e691..792690ae4f26 100644
--- a/include/net/ip_tunnels.h
+++ b/include/net/ip_tunnels.h
@@ -207,10 +207,6 @@ struct tnl_ptk_info {
 	int hdr_len;
 };
 
-#define PACKET_RCVD	0
-#define PACKET_REJECT	1
-#define PACKET_NEXT	2
-
 #define IP_TNL_HASH_BITS   7
 #define IP_TNL_HASH_SIZE   (1 << IP_TNL_HASH_BITS)
 
diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
index d91161e7ed78..579df41fa5b4 100644
--- a/net/ipv6/ip6_gre.c
+++ b/net/ipv6/ip6_gre.c
@@ -451,7 +451,8 @@ static int ip6gre_err(struct sk_buff *skb, struct inet6_skb_parm *opt,
 	return 0;
 }
 
-static int ip6gre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi)
+static enum skb_drop_reason ip6gre_rcv(struct sk_buff *skb,
+				       const struct tnl_ptk_info *tpi)
 {
 	const struct ipv6hdr *ipv6h;
 	struct ip6_tnl *tunnel;
@@ -471,25 +472,26 @@ static int ip6gre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi)
 
 			tun_dst = ipv6_tun_rx_dst(skb, flags, tun_id, 0);
 			if (!tun_dst)
-				return PACKET_REJECT;
+				return SKB_DROP_REASON_NOMEM;
 
 			ip6_tnl_rcv(tunnel, skb, tpi, tun_dst, log_ecn_error);
 		} else {
 			ip6_tnl_rcv(tunnel, skb, tpi, NULL, log_ecn_error);
 		}
 
-		return PACKET_RCVD;
+		return SKB_NOT_DROPPED_YET;
 	}
 
-	return PACKET_REJECT;
+	return SKB_DROP_REASON_TUNNEL_NOT_FOUND;
 }
 
-static int ip6erspan_rcv(struct sk_buff *skb,
-			 struct tnl_ptk_info *tpi,
-			 int gre_hdr_len)
+static enum skb_drop_reason ip6erspan_rcv(struct sk_buff *skb,
+					  struct tnl_ptk_info *tpi,
+					  int gre_hdr_len)
 {
 	struct erspan_base_hdr *ershdr;
 	const struct ipv6hdr *ipv6h;
+	enum skb_drop_reason reason;
 	struct erspan_md2 *md2;
 	struct ip6_tnl *tunnel;
 	u8 ver;
@@ -498,10 +500,11 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 	 * IPv6, and such a packet carries no ERSPAN header to look at.
 	 */
 	if (unlikely(tpi->proto == htons(ETH_P_ERSPAN) && gre_hdr_len == 4))
-		return PACKET_REJECT;
+		return SKB_DROP_REASON_TUNNEL_INVALID_HDR;
 
-	if (unlikely(!pskb_may_pull(skb, sizeof(*ershdr))))
-		return PACKET_REJECT;
+	reason = pskb_may_pull_reason(skb, sizeof(*ershdr));
+	if (unlikely(reason))
+		return reason;
 
 	ipv6h = ipv6_hdr(skb);
 	ershdr = (struct erspan_base_hdr *)skb->data;
@@ -514,15 +517,16 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 		int len = erspan_hdr_len(ver);
 
 		if (unlikely(ver != ERSPAN_VERSION && ver != ERSPAN_VERSION2))
-			return PACKET_REJECT;
+			return SKB_DROP_REASON_TUNNEL_INVALID_HDR;
 
-		if (unlikely(!pskb_may_pull(skb, len)))
-			return PACKET_REJECT;
+		reason = pskb_may_pull_reason(skb, len);
+		if (unlikely(reason))
+			return reason;
 
-		if (__iptunnel_pull_header(skb, len,
-					   htons(ETH_P_TEB),
-					   false, false))
-			return PACKET_REJECT;
+		reason = __iptunnel_pull_header(skb, len, htons(ETH_P_TEB),
+						false, false);
+		if (reason)
+			return reason;
 
 		if (tunnel->parms.collect_md) {
 			struct erspan_metadata *pkt_md, *md;
@@ -539,7 +543,7 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 			tun_dst = ipv6_tun_rx_dst(skb, flags, tun_id,
 						  sizeof(*md));
 			if (!tun_dst)
-				return PACKET_REJECT;
+				return SKB_DROP_REASON_NOMEM;
 
 			/* MUST set options_len before referencing options */
 			info = &tun_dst->u.tun_info;
@@ -567,10 +571,10 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 			ip6_tnl_rcv(tunnel, skb, tpi, NULL, log_ecn_error);
 		}
 
-		return PACKET_RCVD;
+		return SKB_NOT_DROPPED_YET;
 	}
 
-	return PACKET_REJECT;
+	return SKB_DROP_REASON_TUNNEL_NOT_FOUND;
 }
 
 static int gre_rcv(struct sk_buff *skb)
@@ -582,19 +586,20 @@ static int gre_rcv(struct sk_buff *skb)
 	if (reason)
 		goto drop;
 
-	reason = SKB_DROP_REASON_NOT_SPECIFIED;
-
-	if (iptunnel_pull_header(skb, tpi.hdr_len, tpi.proto, false))
+	reason = iptunnel_pull_header(skb, tpi.hdr_len, tpi.proto, false);
+	if (reason)
 		goto drop;
 
 	if (unlikely(tpi.proto == htons(ETH_P_ERSPAN) ||
 		     tpi.proto == htons(ETH_P_ERSPAN2))) {
-		if (ip6erspan_rcv(skb, &tpi, tpi.hdr_len) == PACKET_RCVD)
+		reason = ip6erspan_rcv(skb, &tpi, tpi.hdr_len);
+		if (!reason)
 			return 0;
 		goto out;
 	}
 
-	if (ip6gre_rcv(skb, &tpi) == PACKET_RCVD)
+	reason = ip6gre_rcv(skb, &tpi);
+	if (!reason)
 		return 0;
 
 out:
-- 
2.47.3

