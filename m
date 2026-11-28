Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795884726;
	b=TEi8Xkk3+R/su9mm6ZX+0zMsqaQu/AACQAEq+jvP9RStquDOR5AxWjNU63682mG6FMTr
	 qIpirF5e5LDsUOtALnDsf6+m7M/ipMcbZknt4t24EFbB8t8WFuX2kN4fsc/uoguig3qGl
	 Bg39i6QO4mLxaBCX06/CF+B5Iz6Jwoglge3GYmgI2mSUa863+x6O1bU2X62YLd3tBeLrW
	 5iz4nJMp+p3Khv7LWoqXkallBrhT2rZQrmevFOb3HKVdYNf9y809rSl1rNAdxDDhYHkmm
	 HYuTmSpTUXIx7amUKRXAzr4V+UzxMsrxHjrCI7Hh5+8uTFrN4MA/mPxImhu7CeCmBCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795884726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kyDFnq0CPRRfly838IKxORSianTXXRQU+qT3OdoTSLU=;
	b=K5G06WDVFJIg4dQzc4WnJuPvZJwsFH3TxRQyz7IY3ou0dHVphLGI7no3sx5t8hIrWfNI
	 SDJKUMvR0E3DpLz3IEKw0ras32Hz6AE3LfHOu9p7hUsuzhltnznKeD1Mka1eTt7uAwNm9
	 8dOe6eThrrZPq8xmsTojuF9TD5QPujXtNvfVipECbcYVo7eMd3YaY8fUn7T0V9wYyPlmB
	 PI/DFn4cewLtxQglbi58oRA49+JgJN7OTeswfYBkbFqcCGHOwy+uh5iajRBM1tv68QgKR
	 3JcaAYvAq3w5r6ZGeA5ag0sifKzj3AzfycDMHNTkFxkh0B0JsKgZcMIARKmjrjl5stA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=MV9n+Mmm;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0026D606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0026D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=MV9n+Mmm
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6bab10844b5so11073643a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795884724; x=1796489524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kyDFnq0CPRRfly838IKxORSianTXXRQU+qT3OdoTSLU=;
        b=MV9n+MmmCXitFrfZXz/C1+4tKne2YusZW4CtjPNRsh8JXYC+cyzzBnNjIImoAUUyi2
         m2GP7qREGd8MgwiIN9hDJ0aYz/4tEqXR7W7uqwTBv5ScouAZW5ZX0kBaMkXtb6UoYf8m
         GVnFJwoEJD7RTNIKB2cb2uheFY2jjbHsOyA4gM/i0u8jE0PxWoMN7XpkZLDP8HGZn7tb
         Ltm5QzfmaJn2DDD3Hgty7Em4lzkwXEFzUiuC/0v1J4t/aE4l/FvyOrEfLkRNRcEn5Op6
         FVwQWW7ul6w2Fy6I1EWA959dFGqfnz0j80UaTLZjy3FE5RcZk23/4ZY5VI+BeHp9kDi5
         MsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795884724; x=1796489524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kyDFnq0CPRRfly838IKxORSianTXXRQU+qT3OdoTSLU=;
        b=q55sJi0PtPFjIdBVzWh6QojOcldbatBGHsENtMgpPnizqLRqYrBT3wjPjWRjOE+Xbs
         Kh8LZIFKT1+lWIAp2Td7j9nZlmGqL8PBdICTsDMjN4TYa1Bh0mYbegTYQSZTqotYNCit
         QogL7YYUHDiSD7eOgGX2+r/0r/FAoe0TT7KALIE/Jtn0cfb0q52vYWh7u/r1QvddqLYl
         RuJxdHu6tovicnmO5jNis5GN5j7X3h9QeJrEB6DejJjNKovObJaLnwWD+yK7rYOZleLD
         i5kfARFYhjfFvzAwoeuRY0n4Hcb0HpbV8ZTEYldHNRRT06YTZ23WwpUwByNYs9Rd+tTM
         7mMw==
X-Forwarded-Encrypted: i=1; AL+hErFbsMIBn4BfaeAiq7A7FRqpVILUZGYXEO5GLCM66PpPYOJQ4acdZh8tSwGtPkp1WSWgxHwGdOGjp68xgyA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hbbLYm5xc17F008DsybgCpP9zfBMyieNnjaIlPMB6UBjEgMo4
	/G09julwsxqAMGO/mqHu2WvC6ssHRyVxEi+PrL8DPTyG4+RinVBocq43mPxkStSSWA==
X-Gm-Gg: AZFdTZepx3LUusaUgfFVAiohzHSaZ6xHptgKA7YlhCxI3Q9mZcWNaWutdkarMkEA0Nj
	cmzvJmRr24W4cWhlyoap6kjnYbZNuPJ7nxeSPV+Rh8XlXo/BO/qEaXRekvSCT1+PpAZaxS1mPyD
	fRQIRthh9wIgH2fey0BQvqYEbuw9ZkIHNRSVgYn4S3xOwC+OejiG1SKnaJB/sujDFZv7aSmQp1p
	leR0oVNniqERNX3TV9ZciZqO2mi7JE6VQFUzifaoght3nwQFG3B+nvQ3ououMgKMkSruR5qcS5l
	Dv+G/byqvgICnBZ+v37PBusNi2bcBVDl6R4dtWr5tbP9H3QREUwtrr5owT4NqPxmtVY63618LRl
	YcRv+KzecCDIx1K8P3Hl7VGm9rinzvSt0+CO+ipM2FfjZh4O+rpKXq67NOq9nUIEHcR2RsIxB2e
	PnDly7jsXM1eR7GPBvl/BY0KadRZ/WHmWLN2VD0SYad+mAa5fjCxivzDyab6H9JJVljdCYbDqRl
	NYwpY5afXXeuun+JHqTKddBarZjead6TEoKHgcBXfiyic7PnK6NY+esahcNAKTUQoKNotUtIg8H
	9CX+J4Qj5h5n9BMQPNozg+MQnXXsTMfU2S/p8C+tgGg7nND54v7y/jD1HR9toOFg5EMk8r/B02X
	pcd43KYaRZzictwFVPFUwYTlLkgzy5pCDzherQgVPUww7o3iHgd89e8uMm/LNnWS4OkdjRLSsOd
	itRe9qbj4B6NAZiCHO/UeMCVFPoErkBFUEAcn++UHRjXRxYhw2tm04ddx3wuVoNxK9Ck/0vXx8E
	vY7YKScJ9W+2vDW+9/+FTO7RzjkAME5gnYqP1jIkVh4jVfMvLSwIXpPmkLsy1qabZtb6s+nHFoe
	fzdGq/CME/vv7oYOQsthgIFUUa/v0nFL1KE=
X-Received: by 2002:a17:907:3dac:b0:c51:9b3f:454 with SMTP id a640c23a62f3a-c519b3f096bmr1145916466b.18.1795884723862;
        Sat, 28 Nov 2026 08:52:03 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea3537sm954627766b.36.2026.11.28.08.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:52:03 -0800 (PST)
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
Subject: [PATCH net 1/6] net: dsa: free struct dsa_bridge after an RCU grace period
Date: Sat, 28 Nov 2026 17:52:00 +0100
Message-ID: <20261128165206.3248835-2-julius@bairaktaris.de>
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

A tagger that offloads TX forwarding reads dp->bridge from its xmit
function, in an RCU read-side critical section with BH disabled, to find
the bridge number of a frame that the bridge marked with
offload_fwd_mark; the receive path reads it as well
(dsa_tag_8021q_find_port_by_vbid()). dsa_port_bridge_destroy() clears
dp->bridge under rtnl_lock and frees the structure with kfree() once the
last port has left. A frame that was marked before the leave can still
be on its way through the tagger at that point, and the tagger then
dereferences freed memory. dsa_port_bridge_dev_get() and
dsa_port_bridge_num_get() read the pointer twice, so a concurrent leave
also turns their NULL test into a NULL dereference.

Free the structure with kfree_rcu(), publish dp->bridge with
smp_store_release() and clear it with WRITE_ONCE(), and read it with
READ_ONCE() in the datapath: in both helpers, once each, and in
dsa_find_designated_bridge_port_by_vid(), dsa_default_offload_fwd_mark()
and dsa_tag_8021q_find_port_by_vbid(), which uses the bridge it read for
the number as well.

Found by an LLM review (Claude).

Fixes: d3eed0e57d5d ("net: dsa: keep the bridge_dev and bridge_num as part of the same structure")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 include/net/dsa.h   | 14 ++++++++++++--
 net/dsa/port.c      | 11 +++++++----
 net/dsa/tag.h       |  4 ++--
 net/dsa/tag_8021q.c |  6 ++++--
 4 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 5d12191b6f6..1076439e838 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -242,6 +242,7 @@ struct dsa_bridge {
 	unsigned int num;
 	bool tx_fwd_offload;
 	refcount_t refcount;
+	struct rcu_head rcu;
 };
 
 struct dsa_port {
@@ -302,6 +303,11 @@ struct dsa_port {
 	struct device_node	*dn;
 	unsigned int		ageing_time;
 
+	/* Written under rtnl_lock. The datapath reads it once, with
+	 * READ_ONCE(), in an RCU read-side critical section: the port can
+	 * leave its bridge while a frame is on its way through the tagger,
+	 * and the structure is freed only after a grace period.
+	 */
 	struct dsa_bridge	*bridge;
 	struct devlink_port	devlink_port;
 	struct phylink		*pl;
@@ -772,12 +778,16 @@ struct net_device *dsa_port_to_bridge_port(const struct dsa_port *dp)
 static inline struct net_device *
 dsa_port_bridge_dev_get(const struct dsa_port *dp)
 {
-	return dp->bridge ? dp->bridge->dev : NULL;
+	const struct dsa_bridge *bridge = READ_ONCE(dp->bridge);
+
+	return bridge ? bridge->dev : NULL;
 }
 
 static inline unsigned int dsa_port_bridge_num_get(struct dsa_port *dp)
 {
-	return dp->bridge ? dp->bridge->num : 0;
+	const struct dsa_bridge *bridge = READ_ONCE(dp->bridge);
+
+	return bridge ? bridge->num : 0;
 }
 
 static inline bool dsa_port_bridge_same(const struct dsa_port *a,
diff --git a/net/dsa/port.c b/net/dsa/port.c
index 1f5536c0dff..997e68cd215 100644
--- a/net/dsa/port.c
+++ b/net/dsa/port.c
@@ -427,7 +427,8 @@ static int dsa_port_bridge_create(struct dsa_port *dp,
 	bridge = dsa_tree_bridge_find(ds->dst, br);
 	if (bridge) {
 		refcount_inc(&bridge->refcount);
-		dp->bridge = bridge;
+		/* Pairs with the READ_ONCE() of the datapath */
+		smp_store_release(&dp->bridge, bridge);
 		return 0;
 	}
 
@@ -447,7 +448,8 @@ static int dsa_port_bridge_create(struct dsa_port *dp,
 		return -EOPNOTSUPP;
 	}
 
-	dp->bridge = bridge;
+	/* Pairs with the READ_ONCE() of the datapath */
+	smp_store_release(&dp->bridge, bridge);
 
 	return 0;
 }
@@ -457,7 +459,7 @@ static void dsa_port_bridge_destroy(struct dsa_port *dp,
 {
 	struct dsa_bridge *bridge = dp->bridge;
 
-	dp->bridge = NULL;
+	WRITE_ONCE(dp->bridge, NULL);
 
 	if (!refcount_dec_and_test(&bridge->refcount))
 		return;
@@ -465,7 +467,8 @@ static void dsa_port_bridge_destroy(struct dsa_port *dp,
 	if (bridge->num)
 		dsa_bridge_num_put(br, bridge->num);
 
-	kfree(bridge);
+	/* The datapath may still hold the pointer it read from dp->bridge */
+	kfree_rcu(bridge, rcu);
 }
 
 static bool dsa_port_supports_mst(struct dsa_port *dp)
diff --git a/net/dsa/tag.h b/net/dsa/tag.h
index cf52283fe9d..0e1be1da453 100644
--- a/net/dsa/tag.h
+++ b/net/dsa/tag.h
@@ -201,7 +201,7 @@ dsa_find_designated_bridge_port_by_vid(struct net_device *conduit, u16 vid)
 		if (dp->type != DSA_PORT_TYPE_USER)
 			continue;
 
-		if (!dp->bridge)
+		if (!READ_ONCE(dp->bridge))
 			continue;
 
 		if (dp->stp_state != BR_STATE_LEARNING &&
@@ -238,7 +238,7 @@ static inline void dsa_default_offload_fwd_mark(struct sk_buff *skb)
 {
 	struct dsa_port *dp = dsa_user_to_port(skb->dev);
 
-	skb->offload_fwd_mark = !!(dp->bridge);
+	skb->offload_fwd_mark = !!READ_ONCE(dp->bridge);
 }
 
 /* Helper for removing DSA header tags from packets in the RX path.
diff --git a/net/dsa/tag_8021q.c b/net/dsa/tag_8021q.c
index f91646e6024..ac9ba1ee04f 100644
--- a/net/dsa/tag_8021q.c
+++ b/net/dsa/tag_8021q.c
@@ -482,7 +482,9 @@ dsa_tag_8021q_find_port_by_vbid(struct net_device *conduit, int vbid)
 		return NULL;
 
 	dsa_tree_for_each_user_port(dp, dst) {
-		if (!dp->bridge)
+		const struct dsa_bridge *bridge = READ_ONCE(dp->bridge);
+
+		if (!bridge)
 			continue;
 
 		if (dp->stp_state != BR_STATE_LEARNING &&
@@ -492,7 +494,7 @@ dsa_tag_8021q_find_port_by_vbid(struct net_device *conduit, int vbid)
 		if (dp->cpu_dp != cpu_dp)
 			continue;
 
-		if (dsa_port_bridge_num_get(dp) == vbid)
+		if (bridge->num == vbid)
 			return dp->user;
 	}
 
-- 
2.53.0

