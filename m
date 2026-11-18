Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012355;
	b=Pc0/TpomW67sH0y/ph774RYURQ2wivmH8i2noEiE9Qjtny8/Gm9t12bsA95aSI+tFnZd
	 H3F4ZaaabGJ0pdq3QRegS6lJHtN/+GgPJaqJQsTnWkTtE69ARsXhQj0kjZnWlOaRJ/k6W
	 tJjsxIgTzFNA0g1uQ+eH1aMvIgTLrvquC1nU9rtcA0CIgMptpO1jyv0BpO2dx0uB17gb2
	 V/a+cZUfntzcKVq7ntUZX5kmb7+aINuK5cXD4gGtq0uBdxp46/tRqXUQ4Wu//iKMQ9BZQ
	 icwHH3xafc6rSlx684cAkw1ighkrkVQ57Kl/0K48HafM8WXuNelo0jj73xhoiDJPzBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3ZJAcOCP3zmkVZkD5QI0PyTk+AskehJGhceTAmgUCU8=;
	b=jWf86Wb/p5R5ncB7dUV5q3HLnsYbb6WGvNGPOUnhmjrHc8CHh5eOI/GP9RJ+8kuq+Q+3
	 UdNeE6/02yRBXLMI9P4N51cyvojB9ASnIOvvS3Rjx4NrbSdY5ZpKCR6ErjjwJqi/3rc4D
	 0fbcDsYDvLZEVj06AGLm6OAeAo6uilj51Uqu5sxs7VQr4BynfvVyTEqZ+dEYIG4lI9VqZ
	 pBYANut8DL1Vn7BvNqNJ2AbW0/aApPw2mD9PL8u7iqlcmmRybrXX3XyJXT4gy1wqpQuwS
	 f1eI3Sov54vmAJ12lvFF6256AGnlg2P9/nWpA2tJmgCbITtWcx6CR55VMHUEVu03haA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=RubjJ0CY;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE261606A336
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE261606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=RubjJ0CY
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8470d7d430fso542617a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795012353; x=1795617153; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3ZJAcOCP3zmkVZkD5QI0PyTk+AskehJGhceTAmgUCU8=;
        b=RubjJ0CYDOmTBweYLKTHvy0nZydIyz6a/XH4aSbYuSI/l9MUOFFZYv68D1P9+G7vG8
         ZgAjNmwvzxw4kN6mPPUzF7V8atyTsEoQDKkKmQN9h+bc3zQ2o1EdcBH4M0Xr4lTC4YI/
         l0gRIjxH4nApvzoP78bOTf9POTVub/qxN8YSuShnl+GsVnhD+QHTuvSjQ2gk34Ii/5O1
         c0Ldoz3zuK7UldTIEJX9WCo7ke9CnjGCWZIwWXjMD3WtRrOtynP6/bcrFbritybWXwIJ
         p03nzzPP2B4Rzxeesm85FdJXyidRQJ1SFOygkolwo8bi3sRAaewWL7ZDNUMQ8p561gyI
         ovLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795012353; x=1795617153;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3ZJAcOCP3zmkVZkD5QI0PyTk+AskehJGhceTAmgUCU8=;
        b=szbBMM5O68o6u1yUNnMU92QrLzFd+uH2jZp1l5RcPjVak2mm+nswZZSG46as+a336I
         Hm9XNn6rkWtMQrLeMTpOq3KK0whAy6oMK5riL22vkMZo2mmb7Y6n/nVaGtF40Qle11PB
         QsNVyku2KgEAbAvo1iZH7MfzGX9OQvADnFL3Upw/uY4jJQETW6xx8LLaaGqoOPtBLmLC
         UY6daushggHMLj28JxpnuZlCNhPZJCaFzf+bN6SgLfe+WRIoQOjvNPkljQmTq+gMU1RW
         xWOnqvnn38U3PfHUm/0krymdQh754VaE2uU6A0wyzr5pIusK0aFMa0KtSDhLHYdsa1Sg
         fbjQ==
X-Forwarded-Encrypted: i=1; AL+hErF1FfVUP23JX3s59BjoUMdPNVM5PVEe71Nn3hGrG/QRHxj4qv3qxmPYvACPNXM+3a+j3zXoqYKZduBqqxs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Zqq43czqUXxI8iLh9EIsDr67TKMgpvEbs2VAVdTR7u88Iocrw
	0R+I8MHxcCsy49N+EvC+It3Jul/XqSzf01Lr9tdbxIHyP1BNhW2uyHdoJpDi0ICxH8M=
X-Gm-Gg: AYBFou3Ysr4uWAmhscTEtcLiEqvQtJcQjvbMkpXyxOrMl7C9Bm0Q8uMVpMn84tCKbid
	2iSkoZMXvJWgsmULGzfLX3Z2Ms+CW96mvxGTtnXCeIsbzhU93Z7CbOVfmhVXgz5qbm2SGBkT1zX
	6Ho6z0ZM/aiPgH29KJiq6U1ZJqAHb2LIuImbLOadUSiwuTOSgYj0LaakqJv9RSHbLRptM4dg0Vf
	rh0+cKg/ey79B+sjakMsix0Wc0EygNsoKr5YJvrg1l1GGbjlnqKIv9RJob5IL2vU5PCG89X06sx
	VL54+Uv74id3bnPoK84wvosKTKub0Zq5MXveXAVAL1QRhFdB9vunYH7KrD971kOZuKC3EbJVKG0
	qw1KeBcH6dxmFovAmK2HhBpVmxtPW9cOAlRW9NimeT0RoSUViBuw1q43XbjY3EluI/sdKYfj2Yc
	GtChNSzXJrI33C71jpOjW+AAjlP6EX8Us66PFQu9BPs4TYgmMCyLbWqQEEUH4uuS6+6zQtck8aX
	FoY/4YBswCduYPkeQS9zbBt8U2SsmnRxgcdv75ACwbucrNeDuO25X71TlMnFgMrSAx41NPwOnK4
	JmHPFmS2eoDEm44k6g==
X-Received: by 2002:a05:6830:4125:b0:862:b109:249d with SMTP id 46e09a7af769-862f0956531mr2869076a34.31.1795012353371;
        Wed, 18 Nov 2026 06:32:33 -0800 (PST)
Received: from [127.0.1.1] ([2a09:bac6:bf21:15d7::22d:8b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01f6563sm2145871a34.10.2026.11.18.06.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:32:32 -0800 (PST)
From: Chris J Arges <carges@cloudflare.com>
Date: Wed, 18 Nov 2026 08:32:27 -0600
Subject: [PATCH] net: prevent receive header offset overflow during
 decapsulation
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-prevent_rx_header_offset_overflow-v1-1-92a5be55f994@cloudflare.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNUQrCMBAFr1L224AJNRSvIhJi82Ijkkg2rYXSu
 7vq58C8eRsxagLTuduoYkmcShbQh47Gyec7VArCZI7Gaq0H9RILubm6ugk+oLoSI6O5sqDGZ3m
 r/gTTe2MHGwxJRxYxrb+Py/XPPN8eGNs3TPv+AauUfKiFAAAA
X-Change-ID: 20261118-prevent_rx_header_offset_overflow-45e24a2686d2
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>
Cc: June Slater <june@cloudflare.com>, Dan Jones <danjones@cloudflare.com>, 
 Jesse Brandeburg <jbrandeburg@cloudflare.com>, 
 Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
 kernel-team@cloudflare.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@kernel.org, 
 Chris J Arges <carges@cloudflare.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1795012352; l=4495;
 i=carges@cloudflare.com; h=from:subject:message-id;
 bh=QTnWkJunYlfdvFz/DPGmqGf2K3EhgAZ8pGP9PFmExL8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgaxY1IIT5oTohBZJmhnVgJo2HsM7Sv
 9I0LdJCgpeGX6gAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGOQ9J31i8iOCMDaKNgcCJ3tR7nJFP9GuibWOs4nYDl+gJ3xxyQyZgvMKA7JZgcNQeEis3KIC8n
 zwApVDBV9eQ4=
X-Developer-Key: i=carges@cloudflare.com; a=openssh;
 fpr=SHA256:Cun99EBiH0EV7wvmfTBF9eDrld2NJx+aD4ScWZ45Q5M

Repeated decapsulation can leave skb->data far from skb->head while
the remaining packet data is still valid. Since the skb header positions
are 16-bit offsets, a later header update can truncate and make header
access use unrelated bytes and eventually crash.

Limit receive headroom to 32 KiB. This is well beyond the headroom of
normal packets while allowing the networking stack to pull enough
headers in a single pass without overflowing 16-bit header offsets.

Tunnel decapsulation re-enters __netif_receive_skb_core(), so its check
protects nested IPIP and GRE. FOU and GUE bypass receive core, so check
their IPv4 and IPv6 resubmission paths too. Together, these checks
prevent 16-bit header-offset truncation in cases of repeated
decapsulation.

Report these rejections with the SKB_RX_HEADROOM drop reason.

Fixes: 1a37e412a022 ("net: Use 16bits for *_headers fields of struct skbuff")
Cc: stable@kernel.org
Suggested-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Chris J Arges <carges@cloudflare.com>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
---
 include/linux/skbuff.h        | 1 +
 include/net/dropreason-core.h | 6 ++++++
 net/core/dev.c                | 4 ++++
 net/ipv4/ip_input.c           | 6 ++++++
 net/ipv6/ip6_input.c          | 4 ++++
 5 files changed, 21 insertions(+)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 6787fcf6ac3e..adc61f5e3e85 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -268,6 +268,7 @@
 	SKB_WITH_OVERHEAD((PAGE_SIZE << (ORDER)) - (X))
 #define SKB_MAX_HEAD(X)		(SKB_MAX_ORDER((X), 0))
 #define SKB_MAX_ALLOC		(SKB_MAX_ORDER(0, 2))
+#define SKB_MAX_RX_HEADROOM	(U16_MAX / 2)
 
 /* return minimum truesize of one skb containing X bytes of data */
 #define SKB_TRUESIZE(X) ((X) +						\
diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index fa2fe8990557..903d6a3a0ff1 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -128,6 +128,7 @@
 	FN(PSP_INPUT)			\
 	FN(PSP_OUTPUT)			\
 	FN(RECURSION_LIMIT)		\
+	FN(SKB_RX_HEADROOM)		\
 	FNe(MAX)
 
 /**
@@ -612,6 +613,11 @@ enum skb_drop_reason {
 	 * itself.
 	 */
 	SKB_DROP_REASON_RECURSION_LIMIT,
+	/**
+	 * @SKB_DROP_REASON_SKB_RX_HEADROOM: accumulated receive headroom
+	 * exceeds the header-offset budget.
+	 */
+	SKB_DROP_REASON_SKB_RX_HEADROOM,
 	/**
 	 * @SKB_DROP_REASON_MAX: the maximum of core drop reasons, which
 	 * shouldn't be used as a real 'reason' - only for tracing code gen
diff --git a/net/core/dev.c b/net/core/dev.c
index 3c58db732761..6140fd9d11cd 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -6223,6 +6223,10 @@ static int __netif_receive_skb_core(struct sk_buff **pskb, bool pfmemalloc,
 	trace_netif_receive_skb(skb);
 
 	orig_dev = skb->dev;
+	if (unlikely(skb_headroom(skb) > SKB_MAX_RX_HEADROOM)) {
+		drop_reason = SKB_DROP_REASON_SKB_RX_HEADROOM;
+		goto drop;
+	}
 
 	skb_reset_network_header(skb);
 #if !defined(CONFIG_DEBUG_NET)
diff --git a/net/ipv4/ip_input.c b/net/ipv4/ip_input.c
index 9860178752b8..c74886b1f445 100644
--- a/net/ipv4/ip_input.c
+++ b/net/ipv4/ip_input.c
@@ -207,6 +207,12 @@ void ip_protocol_deliver_rcu(struct net *net, struct sk_buff *skb, int protocol)
 		ret = INDIRECT_CALL_2(ipprot->handler, tcp_v4_rcv, udp_rcv,
 				      skb);
 		if (ret < 0) {
+			if (unlikely(skb_headroom(skb) > SKB_MAX_RX_HEADROOM)) {
+				__IP_INC_STATS(net, IPSTATS_MIB_INDISCARDS);
+				kfree_skb_reason(skb,
+						 SKB_DROP_REASON_SKB_RX_HEADROOM);
+				return;
+			}
 			protocol = -ret;
 			goto resubmit;
 		}
diff --git a/net/ipv6/ip6_input.c b/net/ipv6/ip6_input.c
index d332ec60f915..6dc1211eade6 100644
--- a/net/ipv6/ip6_input.c
+++ b/net/ipv6/ip6_input.c
@@ -479,6 +479,10 @@ void ip6_protocol_deliver_rcu(struct net *net, struct sk_buff *skb, int nexthdr,
 		ret = INDIRECT_CALL_2(ipprot->handler, tcp_v6_rcv, udpv6_rcv,
 				      skb);
 		if (ret > 0) {
+			if (unlikely(skb_headroom(skb) > SKB_MAX_RX_HEADROOM)) {
+				SKB_DR_SET(reason, SKB_RX_HEADROOM);
+				goto discard;
+			}
 			if (ipprot->flags & INET6_PROTO_FINAL) {
 				/* Not an extension header, most likely UDP
 				 * encapsulation. Use return value as nexthdr

---
base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
change-id: 20261118-prevent_rx_header_offset_overflow-45e24a2686d2

Best regards,
--  
Chris J Arges <carges@cloudflare.com>

