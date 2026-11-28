Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795884727;
	b=vfRw2BVoo2jFSryyMyIXsinzkJMd8LVRxztjKdKmeLSWk4iLnmmLQnqm6Tbrs2IHbtgV
	 E9JujIwVG9QAfVr6NYWxD/hEVnFteSAWChaQH8jfg4Sq68GrJlkhybmEdd4zyflPiVRji
	 P9qRs4XGNGjl5ZRJ5sIJBZnrciUoYs7nIsxxs0fJrfhTY7Js4t32GW5ZkXQAvVB7GSREA
	 8TUMADo2Mw/oZL88LMdQvEZJQcFjAadM7VCiEyHk0yV2cMZOVW1U8WVqP2QLm35dZeLIE
	 hF8uJ9kCBdxGaNSagXf5S3g5zipq7MyUyjXvBepZS4U89D4zpSMLRRQS4aqJTSoqLBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795884727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gk+KCbSzY7Tu12vBD7YEX1shB/Xyg5UW8CQ+18wvmIo=;
	b=WsZZmctpXtIVZPQ75NFqp35gCaBVDxQ3DbgvopkJuRRu1JuVP9IwC4sRS7nqbFboIsHp
	 G/v25zkum5PEWOj3SG26qFCDkLTO5CvcPFCIh0ntd2Pihln9w62v2FwCQohGHjr9FrLfI
	 AQxKS3b0QN0rW+t21xic6/0sH0xFkAvLpmUIa45SMNgD72TcrherEhXcUCEIFCxr4IuXN
	 JJ5EASEy7chlvVhCnqAfewLZo8s5p6BqxFer1cWJaSJEFL5Qehc8K9g0SFUdxSQb86HQX
	 9jxjUpP4QvBY0m8IHrzA9ocjuMFSNh/utLGTGdryEbZEOLJdWEeXXlFvdQ6zZkrmtAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Dk0iWUOc;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BED606A68B
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27BED606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Dk0iWUOc
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4322d310e7so537720066b.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795884725; x=1796489525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gk+KCbSzY7Tu12vBD7YEX1shB/Xyg5UW8CQ+18wvmIo=;
        b=Dk0iWUOcc2EV+9jQLMfGnc76JxAiMUEpdOT7ZXGsHSX67bv2dAQ8TwVDXViqBQj/2Y
         +dRuV7vVeZ/QT1JNTQUPq0fkeZykgsLnRXKlOY46HpnCSh705CVgeMOs8rejWxCdrl8T
         mJ0tZe55T5cV6cPMlv4d/LJ0/drsPppuog3vym0FDu2xRY5uDLfTqcp+mqM3KfjyZyzZ
         Xb6n1dcQzztzJNUTNiQpPvwMoBvQSwG8AM1VRXa5QXEY+lePznAAZDDTqjo9Fl8DNsew
         TzQLnxHVqMCCgDyjnUJRA+oZt4wPMKYtx27YbY2W129J3TVKccsMVu5VAQNYOrvRcRan
         /rPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795884725; x=1796489525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gk+KCbSzY7Tu12vBD7YEX1shB/Xyg5UW8CQ+18wvmIo=;
        b=o8XMjBozcMgRnA4vyIxOHBo/DM9TNJBJ8MrLyymEnLn0qlkyBcDHkcAJlcRVhO+nSy
         XtVWBrvpPGTUFy5s2MqOlTpFLgqNFHST6aRu5pOrrBYgnjPKMysEyykx1npirGp3KNUU
         E12oSA1FXVbuAVFYrsq8MKdNzMNIEzpOhKRxDs1Db7AfMOD4/Vch5Mhs1WUF/xGXgJ8i
         Gvy1UBGnLQFPctwvbIxRMlLoM3cdJlFPY50SCbR6aMuM1hL/1bz8JFCvIdr9ZY5nK+bt
         ktGWE2ImFIpWgdj2ucDNax/z+u9QoNXuhjz7oFnwhVraYwvdkvE7gEIyqHzGHw7QO0vg
         aNMQ==
X-Forwarded-Encrypted: i=1; AL+hErH+gTwjgBtkZN2UarpEP1eYeU2v+Ijut3ALCNqU6w5Z00Y/Nq3emrwns2i16Fozj5ouSZ6QUuRtsYhU8uM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hbDWoRQ+rbDkdGXiXvpN6gYNlRRujyKID1v8rXqrgqM5DY58W
	41SmsF6Ony6btyED/ZD4uti7WBvLvILUegQ0NkJHA+7ezq4GHJG4wBqWKy9/noKJdA==
X-Gm-Gg: AZFdTZdLwyBDmjx7LMtvzJZR0/Xw5uCZzAvb7AW0YKdGB9xva90dGHC2tEZHorUmchg
	6VYgNYLoH+ymzclhB6/Oz0POP6pJYVBbuQGp754W/YNwvO+N5MgnOzIVq9n7ckSbMTAv6WqbS9u
	SEI5QOWwwGTOa34cESVnNWMGHvaE8biX/yahpHDlTCW4J3wTQs+UU6S9e51PgttnbG4rhQ67quP
	y3bBDVMyaogVnjFVGbjeJCk+/iA5pyTYuoD2SVY6ja0Ge1t+vMV8vdm9dEQpdlvzyQpXXQe2OPr
	OW0SZfeZJINutBs7VvEikTfoRqOZ+xpfrSlVyPTh8XS/ZoNsIF2nfYChHISzQE/FImjhG6bRYjY
	bMnyDUo5RXsF+uAn5VHMwwRgbuDadSBJP8Zi+9TZpz1mfrLv+MQXOHNxyt9xkgZ67LAeQ6wpD+S
	WsNMQKz2qmLTctE7wc0VqLrbTOYrmnh1k2Ro0udDHZXMd0nmRCWAbhieXtQbQ1vr+UYs6/kfXbo
	PrlCQDeP9vR+3gD/DhgnR3UhTuoZcJ/1HXvfjS7t/k4A6H43UXGpeoF06Gk09ow9+VUY1z4uuYO
	Y960t+2DV827ky2619GQpWogTS+kPXRMPhcUH5A4f6ZYS9StRLgRJKdkn9SLui5cWwnMXovntV2
	2rUr5haqtdefGO2lILAvyxQyHYyeBxtrI4oK+m3slAdJgz6uEiggmVCwn9NFOujeWQgTpVrnzu5
	uWl4LM4wbHYE2+ujuo71TBF41SezSL2VsB1YCs57g36xlmn+zqMotjT+Qb6g8r7RWKhYrYSSynl
	cwTT0Gh9zRDXWhwiYpFtxklItYMPw7OJhezEdQQuEBbucnCHB5LkmwKyobc9LoA2cH8QCZC5rF5
	fDGX1CPboYaQYA==
X-Received: by 2002:a17:907:608a:b0:c24:6985:d7a1 with SMTP id a640c23a62f3a-c513a47e161mr2219866966b.7.1795884725602;
        Sat, 28 Nov 2026 08:52:05 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea3537sm954627766b.36.2026.11.28.08.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:52:05 -0800 (PST)
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
Subject: [PATCH net 3/6] net: dsa: tag_dsa: send a marked frame of an unbridged port from the CPU
Date: Sat, 28 Nov 2026 17:52:02 +0100
Message-ID: <20261128165206.3248835-4-julius@bairaktaris.de>
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

dsa_xmit_ll() sends a frame with offload_fwd_mark as a FORWARD frame on
behalf of the port's bridge, with the bridge number taken from
dsa_port_bridge_num_get(). The port need not be in a bridge: a frame
received on a bridged port keeps the mark through a tc mirred redirect
or an nft netdev fwd to a standalone port of the same switch, and a
frame that the bridge marked can still be queued for a port that has
left the bridge. The bridge number is 0 then, and the frame goes out as
FORWARD from device dst->last_switch, port 0, instead of FROM_CPU to the
port. The function also reads dp->bridge twice, once for the number and
once for the device.

Read dp->bridge once, and send FORWARD only while the port is in a
bridge; otherwise the frame goes FROM_CPU to the port, as a frame
without the mark does.

Found by an LLM review (Claude), and reproduced in QEMU with dsa_loop.

Fixes: d82f8ab0d874 ("net: dsa: tag_dsa: offload the bridge forwarding process")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/dsa/tag_dsa.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/net/dsa/tag_dsa.c b/net/dsa/tag_dsa.c
index d5ffee35fbb..9a89508e451 100644
--- a/net/dsa/tag_dsa.c
+++ b/net/dsa/tag_dsa.c
@@ -130,13 +130,17 @@ static struct sk_buff *dsa_xmit_ll(struct sk_buff *skb, struct net_device *dev,
 				   u8 extra)
 {
 	struct dsa_port *dp = dsa_user_to_port(dev);
-	struct net_device *br_dev;
+	const struct dsa_bridge *bridge = READ_ONCE(dp->bridge);
+	struct net_device *br_dev = bridge ? bridge->dev : NULL;
 	u8 tag_dev, tag_port;
 	enum dsa_cmd cmd;
 	u8 *dsa_header;
 
-	if (skb->offload_fwd_mark) {
-		unsigned int bridge_num = dsa_port_bridge_num_get(dp);
+	/* A frame keeps offload_fwd_mark through a redirect to a standalone
+	 * port, and the port may have left its bridge since the bridge marked
+	 * the frame: only a bridged port forwards for its bridge.
+	 */
+	if (skb->offload_fwd_mark && bridge) {
 		struct dsa_switch_tree *dst = dp->ds->dst;
 
 		cmd = DSA_CMD_FORWARD;
@@ -145,7 +149,7 @@ static struct sk_buff *dsa_xmit_ll(struct sk_buff *skb, struct net_device *dev,
 		 * packets on behalf of a virtual switch device with an index
 		 * past the physical switches.
 		 */
-		tag_dev = dst->last_switch + bridge_num;
+		tag_dev = dst->last_switch + bridge->num;
 		tag_port = 0;
 	} else {
 		cmd = DSA_CMD_FROM_CPU;
@@ -153,8 +157,6 @@ static struct sk_buff *dsa_xmit_ll(struct sk_buff *skb, struct net_device *dev,
 		tag_port = dp->index;
 	}
 
-	br_dev = dsa_port_bridge_dev_get(dp);
-
 	/* If frame is already 802.1Q tagged, we can convert it to a DSA
 	 * tag (avoiding a memmove), but only if the port is standalone
 	 * (in which case we always send FROM_CPU) or if the port's
-- 
2.53.0

