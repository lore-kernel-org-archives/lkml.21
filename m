Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506772;
	b=CduhuySJpF3K3Pm9kBZp7WkNhknfPYe05+R6J7ZawBU/fY/N0y0nuGml7HjCemWahm6h
	 Fjxug97vf9J/de9sW/ADwQypKlLbPHxO08lPLioV+3QyRSu1rCJTmoPx0LGfRmTmIAGB8
	 YqpDQSu0bSovJin84yNMTmvgXlKtGUYDqwdKcRFGlNAt91TVyw2A3nubhbh29ezzyPuiE
	 NAK0gQMTb78QbbWhexvLRqdPodTRWdbM/Fe3YyoPK9zcBR6OtQXXjziJkxfZQtKJK0uUk
	 iXqwkbsERxDZrzge9/NDYfXVsTi+021FH9Jky9uAJQS9xUZUaMhsxBIh7Dvk/ijkY4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RrnVY+ZofBroIM5B7vAXAF0TamSQ44tggpydwwzWVMM=;
	b=MFEdMA2VOcqIVuHwirIe8Sn7A9jBtSnJq4sfz7MrFKrkwyrCGqSVAeC1hCfGMx3AWtr8
	 GkM57kdgfmunjYlrhqKzAa79y8+ntHjIjvCEQM6Apxi/zUga/S4fTGwMRiceiIcOV4SK1
	 w/rAkDLLXk7PgIqBVsgw+JKDXK24eoB4hLvFoFdiXp1K13dZSwfeJYy7mphIdNHLfKAgi
	 9K+gQqlTFl3IEtCftq+pLM6/YjoBeY1hPTi877E0U5BzmllXa8b5NjLbsC/X3+DrvIREz
	 OkgxwrllwXpj5UiBiuu/EDmERKkbu34DJ/F9PQ9t0319dUvqKUUy9Uf0fqL2kAfD9kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYou23AF;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6092D606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6092D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYou23AF
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso2224372a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795506772; x=1796111572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RrnVY+ZofBroIM5B7vAXAF0TamSQ44tggpydwwzWVMM=;
        b=cYou23AF4SEylTjH72edOqmsrdJC71eO5tZsSTwRxDdUUtNwNOFvNtV+TrUkuG2bzP
         tF9xgmzEiB4muV6gxFq7nUv7V0s8efg2t9q5T0YwrYWTfpFNSLiRZMEL7YS23Jh4U6rm
         ksWQ+PaHD0KZoouBjvoze64VLs8HIfIKQDB3hwl2ZndzaavrmsBTzpbKPqyWZBdaBqOh
         moiIn0tNptDn4p/rSUTHs2f/2PkMC9SUUHhYQuq0tkob11I/HjJpS0wYtSxcNSWoqsrp
         2owKk9ehjH0zx70fmdGfQdgNge5bv/AJ784rSl13nkRmrxEBSUFD58OcRCxoVGt1YyXe
         eTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506772; x=1796111572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RrnVY+ZofBroIM5B7vAXAF0TamSQ44tggpydwwzWVMM=;
        b=lQVJ/SxK+JFzZCJl4mC2/Ig8+yMC9KYoiClGRBVuLE8A+y09ADJZozWmnZ4cHjLkgJ
         NH4eWX/7K14sxa4Ea9svgkeyJy/+OCnB/otjeCeidyr7UNLH5eIqh+XXRzkm2+vRz9jg
         rtZ9Eco7TQnlDH1H4gRQh7jcR/iXzkUfx1+ZzqTCnw6nb2rDkEuP0Ji4yRU+v3wsepaa
         JPM+K5PBjgWz2l4rWHe5tDX0K9Xb4vu7tFZ6QnV2BaL1twBhw4uOJLWNRSANtlpMREJ5
         qc1FoI0sk1HG/GGaJcJdUE9JqOiG1oY/H39lT60pJqKUaHb8vNn9+KfCq1S3lnWljN+v
         bp2w==
X-Forwarded-Encrypted: i=1; AL+hErERy6i9C+CEwe8WNKZg33+Rcs5kDuHgtyY6/TySY3+g5ws7OaifDq1lRujXhD55JNPqDluDC70e4h53Kzg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qTcHZeQ8FaMO5zP2krGClV3svU4cgqqdLOrceE78ERvf4Qv6Q
	dgLTjpoyEd5AucvRriaykM+nKc6NyHVxXEkBH9DYhQU0fug1NYAwVFTK
X-Gm-Gg: AZFdTZfJWy/uG5orKiveg36MXIfwyUbqEd+z0U9DI+NOw9td1RRVsDu09Pzp29fHaWw
	CoUQvOYJFTGU+nLpwY0fnmQCTy81uIIGWL1zHDi1IaCF7PySVU9Iu33+orCo2/wfZXnZS2Aj1Zc
	9uAamKh2CLxpGsyhxJcxURZgJ3fedSdfgQASBVQ6Jj6uP9ZyFG68dik47G6ZwJdMrZ1eRVrlFZD
	TGPudKTqKRz/RynTtT+0OQVafHbGNhFo6i5a4wb02uBEDjKmwDhz81rFnqNCdBmuaYA/TxERNz7
	jUIs23/i5PqteIB7om1V76aT3Qj2SJ1Or4fjMX8J87+78oZ9DHXCsf9xKW5AsBA836MJeSHUyB0
	EZPvmioDRSF4W7jJ8iOr4Dcxb99yASCMcVFWa0uC3gDPI2NqYWMAjmwr5E4GGRkEus3Ej2NdlaP
	ddhsq273y3yEE1dED4kX9R2zqOkFNFIcEyf26oGR5JGkKrKuc01STG0NewDn+GAF3OWY12HZ+LK
	9xOnt783iJoaHLqrAUpLTtFfBRjS1dYFCgMRURqUOpBIH6f9IVApQzK6LIPhNVibfyi0+WnzCZ/
	JzjPZO7vTszotpanJCwzrEf+vHnNc5hPoseBkegcGd1/ki8saHM/dYdRFEZrWm28nYM=
X-Received: by 2002:a17:90b:2ecb:b0:3b3:c45e:c715 with SMTP id 98e67ed59e1d1-3b41c95e7bcmr11837289a91.50.1795506771626;
        Mon, 23 Nov 2026 23:52:51 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm24140910a91.13.2026.11.23.23.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:52:51 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Jon Maloy <jmaloy@redhat.com>,
	Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: Ying Xue <ying.xue@windriver.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] tipc: drop discovery messages shorter than the fields they carry
Date: Tue, 24 Nov 2026 16:52:46 +0900
Message-ID: <179550610427.774194.2378040347436778640@gmail.com>
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

tipc_disc_rcv() reads the media address and words 13 and 14 of a full
MAX_H_SIZE header, and the 128-bit node identity from the data after
it, but tipc_msg_validate() only checks that the declared header is at
least MIN_H_SIZE. A peer on the bearer can send a discovery message
with a 24-byte header, and those fields are then read from past the end
of the message. For a UDP bearer, tipc_udp_msg2addr() takes the peer's
address from there:

  BUG: KMSAN: uninit-value in tipc_udp_msg2addr (net/tipc/udp_media.c:129)
   tipc_udp_msg2addr (net/tipc/udp_media.c:129 net/tipc/udp_media.c:159)
   tipc_disc_rcv (net/tipc/discover.c:227)
   tipc_rcv (net/tipc/node.c:2136)
   tipc_udp_recv (net/tipc/udp_media.c:389)
   udp_queue_rcv_one_skb (net/ipv4/udp.c:2433)
   udp_queue_rcv_skb (net/ipv4/udp.c:2473)
  Uninit was created at:
   kmem_cache_alloc_node_noprof (mm/slub.c:5105)
   __alloc_skb (net/core/skbuff.c:616 net/core/skbuff.c:716)

Discovery messages have been sent with a MAX_H_SIZE header since commit
948fa2d115c5 ("tipc: increase size of tipc discovery messages"), and
with the node identity after it when TIPC_NODE_ID128 is set. Drop the
shorter ones.

Fixes: b97bf3fd8f6a ("[TIPC] Initial merge")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
The issue was found by an LLM-guided test generator that we are
developing as a research prototype: as an unprivileged user in its own
user and network namespace, it enables a UDP bearer and sends it a
discovery message with a 24-byte header. KASAN stays quiet, as the
bytes read are in the skb's tailroom; KMSAN reports them as above, and
the kernel logs "Rcv corrupt discovery message" for the address built
from them.

The patch was written with LLM assistance; we reviewed and tested it.
With it, the short message is dropped without KMSAN reports, and two
namespaces joined by a veth pair with UDP bearers still discover each
other and bring the link up.

 net/tipc/discover.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/tipc/discover.c b/net/tipc/discover.c
index b9d06595b067..0f99e4af1cfa 100644
--- a/net/tipc/discover.c
+++ b/net/tipc/discover.c
@@ -219,6 +219,12 @@ void tipc_disc_rcv(struct net *net, struct sk_buff *skb,
 	}
 	hdr = buf_msg(skb);
 
+	if (msg_hdr_sz(hdr) < MAX_H_SIZE ||
+	    ((caps & TIPC_NODE_ID128) && msg_data_sz(hdr) < NODE_ID_LEN)) {
+		kfree_skb(skb);
+		return;
+	}
+
 	if (caps & TIPC_NODE_ID128)
 		memcpy(peer_id, msg_node_id(hdr), NODE_ID_LEN);
 	else
-- 
2.43.0

