Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430543;
	b=bzvByYUTU2IEYN9+/gvBn6gFjpXItuXkwdSp9nPOre/TAlmE1PCYRuK1qRUARA8j72Gl
	 fJgyvBLLaTHMW2JQsSZFZSkxf0wVMD6xRbpDSYoPxwVeCr8D6U+r8hzG+77Koxuuhcgqm
	 I9UJXASu6Mr5QYzrh9MzPsPDAMisVWk9h0CD6T2ITKzWrVo6tC3wfxaOlEb0IWoZtLeIW
	 hxVuqhb6U9YRSCoy6ZR+7P8uNjO/alLPFXQkC2R7L0/T9ZjDUF5feSbBkcGf9dpVOH8iA
	 mvsWUfK2yYOjl3ziz2zfZdRzkWm83F9PW2ivMiQyf2FsNWHrQivW/uf/TPCPBThO9KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/nLQBYNMUocnbmb/hG7Ffmqg4ItL7VmOCCnTkk0C8hE=;
	b=C7iu8oJ41b2hK0orlEkM3ZHYy5/aa/z71TBEvLS9lcHZBf7EvRG3AZhqFOsNc/bmlzq/
	 t/o0LPAKj41gJYwWr61nLdNgCZg9mhiyCda0JSbSgwwEcBgR/08Sg659VD7PmX5bV/v6x
	 rQOIBWLdKlwKKymj0dOCjnA+YQqoDfWF8uPdAvt3B855IKbpWoE4DUxHt+nF8FYILgUN8
	 5l77QHWleIUz0TiaWlQrSOjxv2nr3X+9TlZ6Ia7ahgkbVNN+cxIhYPVflxUv8jNQAHcMQ
	 clQiZffX6E48omXjPkSFUv7Oo30Qpx7u3Uy37NteCSNhGKq1q64F5yEkUQ08dMR+PCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xApP/Kwu";
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1A760A2619
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF1A760A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xApP/Kwu
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c1c0c8d61aso1889966e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430541; x=1796035341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nLQBYNMUocnbmb/hG7Ffmqg4ItL7VmOCCnTkk0C8hE=;
        b=xApP/KwuuhynMahw00bFWESMO1DwXSsh68+mU7XcyalUzn2jD0WxQJ6I+tvGgBXp8w
         A0qze2/z48m/kJFpK/I7vLcYjMV+ggOx12s7eRuw/hM1Hz6Kn+BFTLkwkNd7hCm8G45R
         5Iv/tP65qQHFfJH21ZHrZ6L7l/DboUAgRctWv/I1sqwpYakJkDG3rIjaYxk8QfNVmDhr
         fM5EutW5EYFlTf/BWtnUXndj1RDunGA9NVy0jVFraV3hse6C0R6EWt5DXdIoGqbMrXvp
         WENWxKFwxMNOLqVc9z64i+VWN1mA3MVwsfPs2cKOUfcNSNXCkPg/U0T1oCENM5N77lAT
         /sbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430541; x=1796035341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nLQBYNMUocnbmb/hG7Ffmqg4ItL7VmOCCnTkk0C8hE=;
        b=ensHCjKpoQ1zz1iGMPk9tb5ECo6YU9SPgw1oBfM2s9vzS3hruDi6XpIwsYubArxt7b
         sE28mWq/H/P5bmy3sW70O7FE/Qxv/cq9QYYsr8oI/dbC3Vmw2jIkMr2HfxFSl47uMEwd
         gMVQNxMMEqAU33jriyNXXfJWyVCv2QP1Ed2Zxi32ITslVAR3ca39lipaOAnw3b0lBgh0
         QddBAxTEh157FTiNyAbrn5NdjIW0mQo/AROtIIm8HHdmiDonezB0WszojBQz5xfGL0Pt
         PeEcYhjuKLzcxmUZ+WS8E4iYLAJngo4fZ/RSvaMuuxtDo7BcnZDgJDeD2VojJG7BQdC0
         GOSA==
X-Forwarded-Encrypted: i=1; AL+hErHAYiYv6ZyG9sqWkYFI8A60Z3s/cV4aDsqRpLipcYbgc0ozZ6L3KrRJZ9zPHfw53O8rWD9s/naU3JJFuoI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ir7IG8kpgyp0Ri40rgIFEW5YkJX+9ppX9czWb9wwNoW8DXk7i
	V5ZM1mXg/PYCWJfvWP+BNME8KbDeF8+u0t5L7FD/HSTVzBtoxCktiqMl
X-Gm-Gg: AZFdTZct3b7aurprvW7T3v5pdqD9yPFdeYi2PEeYlYFdBScb6Wy5SGIAlFAqj9RYxIW
	Iwn0aMBg2lyADUvemScGnKXkwjoEDnSp5HcJ+UGd5z16cwShEXZOeeK06Qjf3e5vQElzXrqu88O
	N/ZeDSeRZ7sUBbBlxZxsGdb6ypKLfR67Ed45enHaOizxiltWv+8NvrDtyohZzBnU5TuC2GFXBxx
	p6KmHdiF/Oao4DhYb1WBI7QG5JJkIq9KCi9D+lW61BHLwNnKiBIeY/KxLo6dlyV01pBQtGyB84R
	yBubedwa5PvGvQtjI9PDvabT2qx9sKg4QytTJGStRD6qEcGkmlJLaC8O/+iTtdLPJEk43g8nO7F
	o+eQI8pcuBd+y+T/Hh+lpxNAT9ee5/lGnqL+q9SI+BSFEriRM+SQ2dhMi/WSdDpoykNpPKdYkzl
	g2mpaN8OZpr3c359uoXFmWUap/87sx6gOLdmftIgaeZM5s3FWMmYLRiE94PN+0TgchfjGA+Mej7
	JWure8ONpoyKLBwkwE3xFl7UoueJFZK6NAKPtGVUsHwuUTYxlKjzJmfmf9d9UgaOgQGxYjgTmgz
	PLpglKHKeMzH3DIFyvGLgG0VO35jc3bRUbiiurR3ssY75XwjpTIzCl4NLRInRdNw0ylbsSkjQc7
	FFul+aM9LWL8D6Hp2H2+Qjqq47i9J/IrjvXc7HuY=
X-Received: by 2002:a05:6512:32d4:b0:5bf:e246:d38e with SMTP id 2adb3069b0e04-5c1bc7db0c9mr3118227e87.36.1795430540888;
        Mon, 23 Nov 2026 02:42:20 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([212.35.163.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf332e3sm2859535e87.1.2026.11.23.02.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:42:20 -0800 (PST)
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
Subject: [PATCH net-next v8 5/8] ip6_gre: add drop reasons to the RX path
Date: Mon, 23 Nov 2026 13:42:07 +0300
Message-ID: <20261123104210.199916-6-littlesmilingcloud@gmail.com>
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

