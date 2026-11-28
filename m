Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795884726;
	b=tW1f3RmbHOYbz0fu1Z781NvUKGkKlwpfk+b40FhnP056Mo7Hw+7YsAvjXjR8sVX69Uje
	 JS527ndSb4BsAb/Zb9xXBC8EcgcUfNU15yhDWbVJwIa0rQUXAqTWDBCQdiwhfgZCLOhGf
	 EFteszgF2cOozcpoM4kUSnleq3Fqqhpf73+mT0nKe/9uoB+gHrjH2WTriUhjpywNiaOxO
	 85c8vTVA2Dmxd9A/SniBH3VVloLomzaCbPhHAeOq0vy4dOmwbneYiqtcw4UeXe1wrnhEg
	 9ub2AUNvcwOqdAAfRQbxCjN55mHjwPP+doygZZDjAJKDmLjKzyH1qc5rarSkUceIzOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795884726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V56w7wMavbydLwToobqRbdRknwC+tiNiRclQamsepb0=;
	b=bsiHMNfhCX6xhFnoxjlLi7TrGralWQfKwCFDYZwB93hO78aS9/HZnQFcMBp9kx9KYwYr
	 PageqrVHugnNrx9hTF7hEic1jo9yafPLjWf7k0jaDaNAYT3E/JbCn1aFdQLrAFMg6uoKa
	 kVDfzLgQyh2VPAFmkKhIBOlVhx1gqrC6MBJ7eK2kz6TH4nX+IwM5HLa6uSYzGL1Y9MQ2x
	 pqHaYAo1h/s13n/onfnk8w8CuUTquB+/IdNAW7Ws6sBl+dgrtglwa+ghymwOGxgNt3ixB
	 v3cPQYfqG6LQtKjq08x4UhjJVwz8ZJUmlXbJ2I/sKhIBBN0Rs1608cu0DwpN6z4oZ9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=sh0tZ5+T;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7889B606A337
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7889B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=sh0tZ5+T
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so1717126466b.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795884725; x=1796489525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V56w7wMavbydLwToobqRbdRknwC+tiNiRclQamsepb0=;
        b=sh0tZ5+TuxHJHbm7BXCSs6h3bgEj1kKGYSz8Y7J6QW5Y3lcAiFBYtZxGESrlIzKJ1T
         9MIafGTnK/YoSGgqA28kqWvBrNCDK4ZTzF9cLmPWvkTs4CT8aS3YJJuE7nMLUMUHkvme
         dgkbAy/Avl44czUVqraOWWfGy/P4kGPntrriWaFL6ULPeK/a0DS0Q9qwKWJJp13eynco
         FfiI2aAOM4Nqea1gKYqctpfOLjTN5UkNixPtvpV0u6MM9UmtMCJ25JmsUCHcJTcW2FHv
         ajJM68WPDqWbthI2hV+e/m0PHoPUX+R7BmqdrkSdac9hhL9VmyhjPT6oJAfziLOfkoQh
         0R3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795884725; x=1796489525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V56w7wMavbydLwToobqRbdRknwC+tiNiRclQamsepb0=;
        b=kQNnvT+qfnPoXGm9xNc2hzLfg8Z5VXHoePXQhh23bA1tEeraAIJ4mU9UsUxVe3/Fx/
         Ydi3cp88WRzneTZk73crlqw4YyY1g7HhaG497dcHHoaX5+qM0kbbKZJ9EM8ysVN1O1/l
         htEYgVtNTGEWCxTz3jopYiUEoP9EfbzhNDjeiDy7h1qKGyBigPbRY1VqkZS011B/Z4vB
         fZARMPGwvXJmuSPH2jfmlzn1hvW4vfzcHzZN0JsmqcmSM1joW8Vm2PRK6AWlGqLm2pON
         rwgnt/itT5Qc6zaD9TyI0Ee6D5h10MKbI8KmpUTbvP5sb3C266r6ddY2JNkN0fgKExE5
         4oGg==
X-Forwarded-Encrypted: i=1; AL+hErE7rde7iEcQHn2kx3+az9QPmFKTmwusvbsguD44A1mnTHvNp25BicD/txAGaeX2V1B2pceak54g/LNvaQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sFYsOroNY+UoF2nFsctqmnEevrX7AUMKyunR51RGDcvCpYmrJ
	qEw3ajwC3RRsSfmamL+1f+BBFcfCQwiQugxMeLHx0hjvglPfRlmwIViRoThmcRiXZQ==
X-Gm-Gg: AZFdTZe2Mc1OX230eB9CxapMYXFLaOsMEZCgPvATlhpag2mPtaZP6UsfJr19Swx2nS4
	MQwt85anMBsMozBMn7FU/cdGYr0JbI8FdMY3xYVEsBylqJlhtv3sPgc/Z+P/4AbGSPVh3WbzqV/
	AAsxIQoeaHuiMuLY/7QJy+9UcfZqT8y79LdMLa7YbnJWYwBZEEPPrj8v4qod7FH7LmVM/gUdjqI
	5IHCh72GcrvE9A1txnzwXAhXTytNAtiJyKRc5c09xHD8gUM2AjLLbYRfiMZnCG9pyBFiF1qs36e
	M4BYHyKZdPcTyDLATPahy7InpwjdLFEpXOCLI3z3FNm/9tvEp+OaDLWFj309c+i1jdokn+Su1Zb
	BB8mdvBCjd7PKMYgvjW9d0kCmmHEjpABH3kTCJZm8RlCROci31fIXOfhiT974IGlvyDSei/nRik
	K1hzAaCc6n6NSis+R8baLz+hHDawJ09gAXYMTbiINAxNiS3YYAgac/UlunDsf2kCBedcx0DwJzH
	vfxLnI5mBroMx5kR+jrAg8nYAiFS1QBybxKu6tGPaUcf31wGS0V3sQuW89eN7pCDJfvJ12pFKm/
	Y/7544OMZPhwG87O3O7sB3pDV075yIEkdBjY1eR9b1pJLsMQhlnOi4dpGY2j579DGbT7qmnZ0wT
	BkqRtuPPPMa19wt7hCVWUPOI5Bikv7LwvVee0E0XDs/L9165svZ9wB8BkJCBtvDwdbKAjHpkO5k
	nQZNVVAzEydIo2tyeL6hQWyjT5l6a/S9RqIqaS3UUTd84ikwgdfO1w4Xd8r6mxOb/OUfLi9Sh5Q
	xaS5+b5wYAK1XDaMe36KlwYhKDKgZOupTRa2DTBlJ3JRQvtlt/7OkwjAwCTiBhIK9+agFsvAK61
	8GCafhm0jFDtkA==
X-Received: by 2002:a17:907:c0a:b0:c51:5589:31dd with SMTP id a640c23a62f3a-c5155898474mr2079891366b.22.1795884724884;
        Sat, 28 Nov 2026 08:52:04 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea3537sm954627766b.36.2026.11.28.08.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:52:04 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	Linus Walleij <linusw@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Pawel Dembicki <paweldembicki@gmail.com>,
	Tobias Waldekranz <tobias@waldekranz.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 2/6] net: dsa: tag_sja1105, tag_vsc73xx_8021q: read the bridge once in xmit
Date: Sat, 28 Nov 2026 17:52:01 +0100
Message-ID: <20261128165206.3248835-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128165206.3248835-1-julius@bairaktaris.de>
References: <20261128165206.3248835-1-julius@bairaktaris.de>
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

A frame received on a port that offloads a bridge carries
offload_fwd_mark (dsa_default_offload_fwd_mark()). A tc mirred redirect
or mirror, or an nft netdev fwd or dup, from that port to a standalone
port of the same switch keeps the mark, and vsc73xx_xmit() and
sja1105_imprecise_xmit() then look up the bridge of the standalone port:
dsa_port_bridge_dev_get() returns NULL and br_vlan_enabled() dereferences
it, in softirq, for every such frame. The same happens when a port leaves
its bridge while a frame that the bridge marked is still queued for it.
Both taggers also read dp->bridge twice, once for the device and once
for the number.

Read dp->bridge once. When the port is not in a bridge, it is a
standalone port, so send the frame in its standalone VLAN, to the port
alone, with the PCP of its TX queue, as for a frame without
offload_fwd_mark.

Both drivers are fixed in one commit because they share the mechanism.

Found by an LLM review (Claude), and reproduced in QEMU with dsa_loop.

Fixes: b6ad86e6ad6c ("net: dsa: sja1105: add bridge TX data plane offload based on tag_8021q")
Fixes: 6c87e1a47928 ("net: dsa: vsc73xx: introduce tag 8021q for vsc73xx")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/dsa/tag_sja1105.c       | 21 ++++++++++++++-------
 net/dsa/tag_vsc73xx_8021q.c | 14 +++++++++-----
 2 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/net/dsa/tag_sja1105.c b/net/dsa/tag_sja1105.c
index bfe1f746f55..6c267a2a232 100644
--- a/net/dsa/tag_sja1105.c
+++ b/net/dsa/tag_sja1105.c
@@ -209,27 +209,34 @@ static u16 sja1105_xmit_tpid(struct dsa_port *dp)
 }
 
 static struct sk_buff *sja1105_imprecise_xmit(struct sk_buff *skb,
-					      struct net_device *netdev)
+					      struct net_device *netdev, u8 pcp)
 {
 	struct dsa_port *dp = dsa_user_to_port(netdev);
-	unsigned int bridge_num = dsa_port_bridge_num_get(dp);
-	struct net_device *br = dsa_port_bridge_dev_get(dp);
+	const struct dsa_bridge *bridge = READ_ONCE(dp->bridge);
 	u16 tx_vid;
 
+	/* The bridge marked the frame, then the port left it: the port is
+	 * standalone now, send the frame to it alone.
+	 */
+	if (unlikely(!bridge))
+		return dsa_8021q_xmit(skb, netdev, sja1105_xmit_tpid(dp),
+				      (pcp << VLAN_PRIO_SHIFT) |
+				      dsa_tag_8021q_standalone_vid(dp));
+
 	/* If the port is under a VLAN-aware bridge, just slide the
 	 * VLAN-tagged packet into the FDB and hope for the best.
 	 * This works because we support a single VLAN-aware bridge
 	 * across the entire dst, and its VLANs cannot be shared with
 	 * any standalone port.
 	 */
-	if (br_vlan_enabled(br))
+	if (br_vlan_enabled(bridge->dev))
 		return skb;
 
 	/* If the port is under a VLAN-unaware bridge, use an imprecise
 	 * TX VLAN that targets the bridge's entire broadcast domain,
 	 * instead of just the specific port.
 	 */
-	tx_vid = dsa_tag_8021q_bridge_vid(bridge_num);
+	tx_vid = dsa_tag_8021q_bridge_vid(bridge->num);
 
 	return dsa_8021q_xmit(skb, netdev, sja1105_xmit_tpid(dp), tx_vid);
 }
@@ -273,7 +280,7 @@ static struct sk_buff *sja1105_xmit(struct sk_buff *skb,
 	u16 tx_vid = dsa_tag_8021q_standalone_vid(dp);
 
 	if (skb->offload_fwd_mark)
-		return sja1105_imprecise_xmit(skb, netdev);
+		return sja1105_imprecise_xmit(skb, netdev, pcp);
 
 	/* Transmitting management traffic does not rely upon switch tagging,
 	 * but instead SPI-installed management routes. Part 2 of this
@@ -304,7 +311,7 @@ static struct sk_buff *sja1110_xmit(struct sk_buff *skb,
 	int trailer_pos;
 
 	if (skb->offload_fwd_mark)
-		return sja1105_imprecise_xmit(skb, netdev);
+		return sja1105_imprecise_xmit(skb, netdev, pcp);
 
 	/* Transmitting control packets is done using in-band control
 	 * extensions, while data packets are transmitted using
diff --git a/net/dsa/tag_vsc73xx_8021q.c b/net/dsa/tag_vsc73xx_8021q.c
index f4736a1a7a0..d65e5ddaa8c 100644
--- a/net/dsa/tag_vsc73xx_8021q.c
+++ b/net/dsa/tag_vsc73xx_8021q.c
@@ -17,13 +17,17 @@ vsc73xx_xmit(struct sk_buff *skb, struct net_device *netdev)
 	u8 pcp;
 
 	if (skb->offload_fwd_mark) {
-		unsigned int bridge_num = dsa_port_bridge_num_get(dp);
-		struct net_device *br = dsa_port_bridge_dev_get(dp);
+		const struct dsa_bridge *bridge = READ_ONCE(dp->bridge);
 
-		if (br_vlan_enabled(br))
-			return skb;
+		/* The port may have left the bridge since the bridge marked
+		 * the frame: then it goes to the port alone.
+		 */
+		if (bridge) {
+			if (br_vlan_enabled(bridge->dev))
+				return skb;
 
-		tx_vid = dsa_tag_8021q_bridge_vid(bridge_num);
+			tx_vid = dsa_tag_8021q_bridge_vid(bridge->num);
+		}
 	}
 
 	pcp = netdev_txq_to_tc(netdev, queue_mapping);
-- 
2.53.0

