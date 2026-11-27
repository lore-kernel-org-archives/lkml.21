Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777442;
	b=fZ0uMDnqP1LMStr4BEh/vjTiguAOczXNf6+XYJXWN7UwuIN/8nap6LiZ1wrh9B5TnHFF
	 0VnfaZap49PLqEoWvLTzs723rol7ZEKbLHTaL4Ht+8vRCOS/oex50t3iVIiL1O0PK6WhG
	 K7c0YCDhpZr1GGq6DHW8C8qoYpjXl8YFAe5inll1xLRgangBwPgHMc9wYBlVaKrkBitmN
	 o5Wsd5TJ7VyrKCpR/crbne1eBhQUAtgfrG5ompk2NmUQxO1cLBYRspDHL90YqIAPokxmn
	 feOAk3lFBDy4Ja6uIFiwPZIeDbI+XMyzm+Pdvc8BxYuQ/yAuAcOWRT/DxMsbq7pbl+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sBbKLTeMth/78J0FzA5MVCClolXP++to0y+7e0RapHo=;
	b=K9WMf7feHBGpxiMtrsJFi7FdgcSD9D+ukZgrPxn+BKrAqEqHgqBefFYot7ApqwnW86UG
	 rEMxN8y8ZmvPyFYy6pIsRwXBVahd/ybudAXXK3VAMLgv16hsg2W4PiPA0hQTVznisuNTo
	 678tSZ0+0jk6htqUSZyjsSKDFo8KucC6YVSDZVa+3dKCxUcjEZKzFuIMMBaNWbOXS/3i1
	 h48dTP2CVr21bEapFzzA+9Dxv9pinwG3qG8jcegry0BMkiwfiZ2CWeHSL15+dJDHRi9s/
	 aZuZNrLZwo7U7Nim27sI96dZ8xboFPiZyWl2U9eRduQyPJum55ISLCSQ/Xu1eFV1KkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=UQZiU34F;
	arc=none smtp.remote-ip=74.125.82.226
Received: from mail-dy1-f226.google.com (mail-dy1-f226.google.com [74.125.82.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD720606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD720606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=UQZiU34F
Received: by mail-dy1-f226.google.com with SMTP id 5a478bee46e88-386c71feeeaso4459323eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795777441; x=1796382241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sBbKLTeMth/78J0FzA5MVCClolXP++to0y+7e0RapHo=;
        b=UQZiU34Fa3WLoJfrLE6309naeCq7IO6zuC2AP3eyTRT/oykAOoZnS7dTa0QKRzG1bX
         GxHACPHIO5DVgnHtS4+xk4RereDUpW2PImoxHBUamW2UcE75t3wx8KQ0bDSXgnQOHBHr
         E8tzrc69cZDRExukvNvh9gkSmy2h6YL9dwfgPVOkKsQpFCB6GWFr6b0V4P5uQEUWty+4
         4lqroT0ADML6YOXMgpC1kueW2UvPa90u/nLXAJCvjY11kp9Z+h09dXi4ooaGWjDl4JfU
         FTxgtKmrY+MwOyq8zhWZ92NzvWAEivE400c406O6Z7i/fOQTIRdhC+s1JTAq3n+Bdx8q
         UyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777441; x=1796382241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBbKLTeMth/78J0FzA5MVCClolXP++to0y+7e0RapHo=;
        b=Af4mjN4fuSwMl3eA+MW6AEgTLGDp9lJJ4Q36vEf+S9tS11JdzMHQ/luO5dzFDdpXC2
         KSNxtCa1AHN4y7Uhi5i8JJNa0w8Iq6EmplB9K7oOxHV0jQF8M4DgF6wjkuj7gMFJgMjW
         93qHRv+30EnBo235RRyGWW//sg7DDIICdgi6hDforJ36alRMWiAIpyCxE4ugmdUyo1c+
         JzVRG0IP2g0KeQJzuuh/LzvS+Fk8xpzazucahlNkYPgn3VLUXVkg0QkL8gCjHZGlfxxX
         lFGgfvjm/eQZVl2XVcBFCVlBK5qrUE9NtnXta45yaBuqe8BUJyjdbAdXGUchCVUzFtNa
         45AA==
X-Forwarded-Encrypted: i=1; AL+hErGPM2BMsvg/Da3o9GEuTY/eN073rjtE1nuf/704iQVZlDaGJ/UVxgQhh1U6whQFJn82q3UkKQd2Qtr0Bsw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Emac55KjDaPr/RYhrLe6YTtXvRiH0TZZ1VXJCqCwqCJpYLLWU
	IwmzaXtQAzr4MPC+l4366Ihx0i335jt9fjFeVYW9WPjVD9KMSYQTQYX7fXx8b9Vr1xddi00Qe6U
	dvH4lRvf1yZo1mcOleKziRrTzQltvIm11Sfvd78OS09pjoKooe7MP
X-Gm-Gg: AZFdTZeYnmZdpuS2FzHz2YmAfoC/aWdSscxKsxfSOLH+Sujs0gMGLHriVwbApffwsUE
	kNwP1BIiPbDjlubjdFY1jSHmDswaOK0ELEEBPn8wwC2TVv0Vi/bJtk+huyP4bFVWqv3Dxe24h1n
	7Ra0bYm7KKT9eG6/EqWMro+UFs0uBPAFqtMfK6DfsYWVC9yn7s/U4ECfynrNIfGJWpLvcMMC596
	SoLOPg0V5Sz+d0MdV8UHyTXLz+35KFsL8X0ug9ZstN0S5+9n5E0Cbe3wZnODXhvDZTJMLzRA6Hd
	tkzcmRX47D65QUb285WDnyohPLOAsTM3XWjwzS28UFN9b1w5+ZK6phIwYM7whD0VOoYU72zWuJl
	rRcQUKbrX4/tmkt5f7jpekgbu6z8=
X-Received: by 2002:a05:7300:ce8f:b0:375:7be3:1bbd with SMTP id 5a478bee46e88-38570b336f4mr21662778eec.23.1795777440698;
        Fri, 27 Nov 2026 03:04:00 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-385677c0c07sm3922451eec.19.2026.11.27.03.03.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 03:04:00 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec] xfrm: iptfs: reserve room for the outer MAC header in new inner skbs
Date: Fri, 27 Nov 2026 03:03:55 -0800
Message-ID: <a502a95c-de83-4f8d-986e-80f804ebe76c@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
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

__input_process_payload() copies outer MAC headers into skbs with up
to 80 bytes of headroom. Longer headers (NBMA GRE) wrap the 16-bit
offset, and the copy lands far past skb->head; reserve room for mac_len.

  BUG: KASAN: slab-use-after-free in __input_process_payload.isra.0+0x51c/0x1c70

The patch was written with an AI coding assistant and reviewed by the
submitter.

Fixes: 6c82d2433671 ("xfrm: iptfs: add basic receive packet (tunnel egress) handling")
Link: https://lore.kernel.org/netdev/179524501671.3135.15869590714107061136@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Andrii Tereshchenko <opensource@andrii.net>
---
netdev's AI review of Piyus Kedia's "xfrm: do not write the ethernet
header when the mac header is unset" pointed out this write (Link:
above). 7a505bb0168a ("net: clear skb->mac_len in
skb_unset_mac_header()") does not cover it: here the MAC header is set.

Found independently by an AI code review agent. Reproduced on ipsec
master without kernel changes or fault injection. With this patch the
reproducer passes, two boots each way, with panic_on_warn=1 and no
KASAN report. A reproducer is available to the maintainers on request.
Not tested: an architecture where L1_CACHE_BYTES is larger than 64.

 net/xfrm/xfrm_iptfs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 3fff835497b9..fe54979116de 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -242,7 +242,9 @@ static u64 __esp_seq(struct sk_buff *skb)
  *
  * When @l3resv is false, resv is XFRM_IPTFS_MIN_L2HEADROOM which arranges for
  * `skb->data - 16`  which is a good guess for good cache alignment (placing the
- * to be pushed L2 header at the start of a cacheline.
+ * to be pushed L2 header at the start of a cacheline. If @tpl's MAC header
+ * is longer, as with NBMA GRE, resv is its length rounded up, so the
+ * arrangement holds: it is copied in front of the inner packet.
  *
  * Otherwise, @l3resv is true and resv is set to the correct reserved space for
  * dst->dev plus the calculated L3 overhead for the xfrm dst or
@@ -263,6 +265,11 @@ static struct sk_buff *iptfs_alloc_skb(struct sk_buff *tpl, u32 len, bool l3resv
 
 	if (!l3resv) {
 		resv = XFRM_IPTFS_MIN_L2HEADROOM;
+		/* A longer MAC header needs room too; round up to keep
+		 * the cacheline arrangement.
+		 */
+		if (unlikely(tpl->mac_len > resv))
+			resv += ALIGN(tpl->mac_len - resv, L1_CACHE_BYTES);
 	} else {
 		struct dst_entry *dst = skb_dst(tpl);
 

base-commit: 2803867cf3defa294710088a4663b434e12b5e93
-- 
2.53.0

