Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795574558;
	b=K1rs7k8JBTqs/YcK3TgPM4fWqiqjpDjoFRTCZ3DIH0oP3hRiBO/oAUVqF9p0r6nk38WG
	 CcJrZ8oF9WacLXzjqZkLcD7y5Tc8Q/m0BGN5YADbe3pe2Tjld9Lg8jTdZJIy4Cdk9Gkya
	 Xilz6aa16CWh2bB6rj9+Hnq9UXDUsjqVz4TSnaPYP5ZMpeM99TmUPwK0fzi5AOs41Zbpd
	 B7eusyl8ApwOdrva579eQmhk8P1XZb+K5O4Vx6y16BrYrwyB1WMQF6PKvWXNhNMdY+e0W
	 AFzgEIDZPuqv9yVJ8S7mhcx+hEXPTOOxjH7OONg91etZt9WVwMFRGeQb5lHxLhRwSfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mEExPnF37SF6L15+U7oygTLDkR+EbGh7oqFgruuLRMI=;
	b=OFH9GW8II09AH4PbGPQwyY6Nyq6e/RN9NdZzksHpUqXy1T0LUhYIAEpO2f3aDdI534Za
	 dO1mzUS+ECVoilQ5NCAFbqBDUXkeVIU2vX4ZnEESXNIAnB/eTMJodMyOCZ71tmB7V9CyP
	 uaSb79VEvG5Wcjl2WEHxdMgwZZCNuCYKtknaPDDMoRT0QNW7ZAq+cJCxVKcLgyBH0+HuJ
	 ISoh9EWphBmWYkEvKFeuHqqps6U+EOv8G9cmHmYnniUJak4Aft7bvJ07pKU0zGFImutw7
	 /UOF2jxvuamHiBzGNp2DBv1ZbIJDURNh/EM5hXNq8tQgU/aHZYcJ2kQdDDmf6mRfEDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lpqHvE7o;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39FE606A692
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A39FE606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lpqHvE7o
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b43d30822fso2683560a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795574557; x=1796179357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEExPnF37SF6L15+U7oygTLDkR+EbGh7oqFgruuLRMI=;
        b=lpqHvE7oFQMRktUkqjnAP23urMaMeOWlZbyQz8DFAkOKgQcFkgf/wQXFk3odj6kSsD
         1oI/GkxWQ11lVFXOW3Q2khTt1HNOnFvUxixkqdxEH7J/37gWizkM51Bccgz5Vy8VHHoj
         3bd9hJrJx8O0NnkrtjhioYVgiUVJkSrgp2jVx1AcGZZftIyymymXTLkpOzzvwPQ9GISS
         sx93lMp+QLA/J1QItLXS1SlCgf/k57kooLzH9n2vKqyMoh/5ucyvsxEXtL5NCY+hUm0i
         tSjMfaSvKb9cPIN3hcwP+X/Wq+ldW9QIv71lfoHNdwjXk7NLKwoXmANZrV1RAOJVmZst
         /VTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795574557; x=1796179357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mEExPnF37SF6L15+U7oygTLDkR+EbGh7oqFgruuLRMI=;
        b=z4pF+lJiL/DZYFYAbrncM6hPDCbJKc7P74+cJeE8I1kvATXmcdkNxdtXGaBQeJ7x7F
         jDAsIvpMWWA/7QXEdm2BC3wTza8/u7qJQQAxojcTPyeq2HxRrLWbqUZaWsfRjd13qfEc
         u9BeOIGZgILoHsQQwBWcV3vuqscSDkIZGb+JwyL9sLESzensphR5xwdEGDv//YTqCHdq
         Ujaxp8NjH+hg031kDYqg23BoazICISY6Fi7Mu01fXqSzHXLSleu88a3BufYX16hOs++o
         mpawWQT0Jtrnrnv5DOrZSEC50aPTlPV78+F30id6K+BkKWhQ7TlsV1HH53cLw6rShLMy
         wi/g==
X-Forwarded-Encrypted: i=1; AL+hErHepu7eiHQpIqJ0ugUuKTCKZ3ImOFeyBEmSQ6+TgfezNq8tEnjGChLUYLnN4YPyqc1JqsDdY6RyYcOE+rM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CzB0fDP9EX8tTGPkWTD9KTKH9mZihnNRijmNb1ccSiJ/LZI/6
	Jol2AHCYemeeoe1srGRpHsDaFhbzBYVC0fP3/cZmuhdd0P8FlaGogI9O
X-Gm-Gg: AZFdTZcIexBcEh6E1L5jLx9gD3+oMubWFVDpMz8G7Wzh+YQHxcgcngYI7wQq2IZEkAZ
	7XBlSz0tLg0Hm/HPNNlnNVC98TDUz7l7s2qLTuSjZPZkmDc9NdNA1kDreIaAYbbgvv8xgLKpuhp
	HXDm+oNByYywI++iMEEH/Mm8glLyR/MtgHW86ICgC2DH28VnSH0IiJ2BwmAkU2MQBt6JAdGgcNx
	LCFKIDca85mAghmVPnjL/Hvfy6wO5JJHHCCog3V7hOoIbUDu5T7OwSIRqLbp7ykOIhv4AIh+VeF
	5MqYKzTYxXLLoLXnpSCYsikdoRlypW3UPhBzG3xyDLsLGkJJlzb5seDLhdELH7SuctdCJv9U5fB
	QPSb7raE1bMQcpvSdCnB9FEztS/cwc9oPslhEWW+AWlBfsSqr6Q8F4mGIqv2hiW6V/YQsdtMzJj
	zdERYj0H3+Q9uoSOULCiQIwqAd9VIX8I3NqqKNUnIdF2C40f7ntBqEO+ZBJMLAUnlDz+d30ZVY9
	DftRiqnoHFYkiRUGNVmhUZt5ZZg5pRiP7rv6DZwszlSsvpGFRDgUhs4Kgm1S35l/bFunYl6NQGv
	jt+vapfouqmBr47CQDROVt+SZWq4bGuQ14EyxQyAh1/a4cY3PrlsmVduXZaArnwHR3Y=
X-Received: by 2002:a17:90b:3f43:b0:3b4:e97:22ec with SMTP id 98e67ed59e1d1-3b41c931cfcmr16259721a91.35.1795574556864;
        Tue, 24 Nov 2026 18:42:36 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm25727086a91.6.2026.11.24.18.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:42:35 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Florian Westphal <fw@strlen.de>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Hui Peng <benquike@gmail.com>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec v2 2/2] xfrm: refuse modes that AH and ESP do not support
Date: Wed, 25 Nov 2026 11:42:28 +0900
Message-ID: <e5abf3005007d9bf3eab4b640d513856f8eacf6c.1795573672.git.kyuwoncho18@gmail.com>
In-Reply-To: <cover.1795573672.git.kyuwoncho18@gmail.com>
References: <cover.1795573672.git.kyuwoncho18@gmail.com>
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

ah6_init_state() refuses any mode but transport, tunnel and BEET, but
ah_init_state(), esp_init_state() and esp6_init_state() accept any mode
and only adjust header_len for the ones they know. For ESP over IPv6,
a state in route optimization mode then reaches the WARN_ON_ONCE()s for
unknown modes in xfrm_state_mtu() and xfrm_inner_mode_input(), as long
as verify_newsa_info() lets the mode through. Over IPv4 there is no
route optimization mode, and __xfrm_init_state() refuses it before the
type is set up.

Make these functions refuse the modes they do not support, as
ah6_init_state() does, so that each type checks its own modes. ESP
keeps IP-TFS.

Fixes: c2d305e51038 ("xfrm: remove input indirection from xfrm_mode")
Fixes: c7b37c769d2a ("xfrm: remove get_mtu indirection from xfrm_type")
Suggested-by: Sabrina Dubroca <sd@queasysnail.net>
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
 net/ipv4/ah4.c  | 11 ++++++++++-
 net/ipv4/esp4.c | 18 +++++++++++++++---
 net/ipv6/esp6.c |  6 +++++-
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/net/ipv4/ah4.c b/net/ipv4/ah4.c
index 6fd642d2278d..32094169718c 100644
--- a/net/ipv4/ah4.c
+++ b/net/ipv4/ah4.c
@@ -535,8 +535,17 @@ static int ah_init_state(struct xfrm_state *x, struct netlink_ext_ack *extack)
 	else
 		x->props.header_len = XFRM_ALIGN8(sizeof(struct ip_auth_hdr) +
 						  ahp->icv_trunc_len);
-	if (x->props.mode == XFRM_MODE_TUNNEL)
+	switch (x->props.mode) {
+	case XFRM_MODE_BEET:
+	case XFRM_MODE_TRANSPORT:
+		break;
+	case XFRM_MODE_TUNNEL:
 		x->props.header_len += sizeof(struct iphdr);
+		break;
+	default:
+		NL_SET_ERR_MSG(extack, "Invalid mode requested for AH");
+		goto error;
+	}
 	x->data = ahp;
 
 	return 0;
diff --git a/net/ipv4/esp4.c b/net/ipv4/esp4.c
index 111bea0bd260..1bb7c4b24cc6 100644
--- a/net/ipv4/esp4.c
+++ b/net/ipv4/esp4.c
@@ -1148,10 +1148,22 @@ static int esp_init_state(struct xfrm_state *x, struct netlink_ext_ack *extack)
 
 	x->props.header_len = sizeof(struct ip_esp_hdr) +
 			      crypto_aead_ivsize(aead);
-	if (x->props.mode == XFRM_MODE_TUNNEL)
+	switch (x->props.mode) {
+	case XFRM_MODE_BEET:
+		if (x->sel.family != AF_INET6)
+			x->props.header_len += IPV4_BEET_PHMAXLEN;
+		break;
+	case XFRM_MODE_TRANSPORT:
+	case XFRM_MODE_IPTFS:
+		break;
+	case XFRM_MODE_TUNNEL:
 		x->props.header_len += sizeof(struct iphdr);
-	else if (x->props.mode == XFRM_MODE_BEET && x->sel.family != AF_INET6)
-		x->props.header_len += IPV4_BEET_PHMAXLEN;
+		break;
+	default:
+		NL_SET_ERR_MSG(extack, "Invalid mode requested for ESP");
+		err = -EINVAL;
+		goto error;
+	}
 	if (x->encap) {
 		struct xfrm_encap_tmpl *encap = x->encap;
 
diff --git a/net/ipv6/esp6.c b/net/ipv6/esp6.c
index b287c807b018..ced910d44b47 100644
--- a/net/ipv6/esp6.c
+++ b/net/ipv6/esp6.c
@@ -1192,12 +1192,16 @@ static int esp6_init_state(struct xfrm_state *x, struct netlink_ext_ack *extack)
 			x->props.header_len += IPV4_BEET_PHMAXLEN +
 					       (sizeof(struct ipv6hdr) - sizeof(struct iphdr));
 		break;
-	default:
 	case XFRM_MODE_TRANSPORT:
+	case XFRM_MODE_IPTFS:
 		break;
 	case XFRM_MODE_TUNNEL:
 		x->props.header_len += sizeof(struct ipv6hdr);
 		break;
+	default:
+		NL_SET_ERR_MSG(extack, "Invalid mode requested for ESP");
+		err = -EINVAL;
+		goto error;
 	}
 
 	if (x->encap) {
-- 
2.43.0

