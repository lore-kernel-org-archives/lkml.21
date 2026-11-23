Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415773;
	b=2KLHrlh6syB+QM/mbuMULmhBwq6gTgnCBofcOtiqC/ly3DOt2wH9EVZJVxuUUniqReEj
	 NgK3wQcxAHDiWjg0qafpn8yLZFSl1fv9pmSi/K1oCUmNzVx++NyQYRzLbeiR2kagq78qZ
	 YXG9wS31hWa7h4rxe57Sl7BCiD+cXCkHYTyiwyP/RVaFzsju+3DtbWMEhQOxeR+B4wb8l
	 p5rmNVXBGU6qPVSggu5CEjZJLhtcR7kd3wTINtXFc/VbuPilxFzUVJw/mljmJdsyQi70l
	 YR0XrtTkbEXPzzIJTd+dW2kbuuZUnoh74sBZwqphYfTypJ8DHVzRGEgbWAEAyy5vQDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=BrBSPPpRxeUHkZ8Aspm71PBog/B6QtNxw8MB+kxwe5s=;
	b=Ta0+VCFHKTyiQNqNgd1IYdqXIo62nHTahIirw5JR99A1clFM19EYxHcs3PzOBbqm+t6x
	 vb2hhNAyxYmJYPpqVW8CuViQK0jkScsPKJNhnnShiOA/+GWujm8mdZeEPNNIpq38s8BfU
	 VT9AJFnuKQCRHOseF0DHarF51Kj5FmsbX14IFlbk7PbcQ2/EAxICtxXfrMYilpTueknSv
	 b1YqOjfFUpciIJfb9F7ZIjARIHXL1G677zeOLq146k9O8AeHDJq0M6yR6K2NaiKA/dzgN
	 9iZtmAienSDtrTsrZlu5to9vyDZo3RhSS1mmOePtvBYTYC4N2fMB+Ehu1l5L4gJp7LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--starchang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ndf82j9A;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489C1606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 489C1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--starchang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ndf82j9A
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-55bf11583d9so3136532b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795415772; x=1796020572; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BrBSPPpRxeUHkZ8Aspm71PBog/B6QtNxw8MB+kxwe5s=;
        b=ndf82j9AD419mQdAmC6YLQ7YDAJmogSheYNYRMMJyb1tGQ6Z3uKEVwr02fSesodckD
         u8a7mmizquPt/l6tI0UGe53paB0APeUL58w12k1NlcV1vT2F3Xr8a+RbUZe5mLoLt9qX
         wHA1jPpedn12bHqJvNAxCRVbrr9LhcBtczwB+BwN108APCiOWZxPLjYNeCOyoCAwQzpu
         QigWr6Ba/sT0Ys6laFaKXpsEAjd7RH0815FN8vJtgc9JSK9+h4IKsAJmsrI7rkrsAPYl
         XJJs+cW++2gS9pBKcc7CGypjxUmSn2c5lF9ucSf7KuYz8NTrfv/Y1HkbiqfzObQpFQ12
         47Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415772; x=1796020572;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BrBSPPpRxeUHkZ8Aspm71PBog/B6QtNxw8MB+kxwe5s=;
        b=XLpxEGrN/1DOy6tjqki4vDTM0VSHTFujcp3VdFAVTgWU64aeY9qxU02FECj/ArfiMR
         cP7O59o1rS/xtC+l+x9FX/LGX04ruf6+PNdLcpQgTOI5myp+6FzitoR5fcuB8oBq3O/Z
         +SHOwihquqhSc7hY19WvQVIse055NWNqIXE2amDZU0jvC/tb0mVF0fDhNxsPNFr5p653
         /XR3GsZk9TPhCPnALGH9+emmDYk7Z97WmjCx9O6mwJnANfc9sKTRD2wWMr+Al+6B4ve+
         DGcLtMdjTAdbW3lQvFlOGepzu8WXFBOmPpr8ZzqnQZrNddFuqtg8TvYzTnpkvXESv20D
         3mAg==
X-Forwarded-Encrypted: i=1; AL+hErGacgoFhneBqTLpIFbP+epwmZgwEu6PGzIEfdmAXMTukorG+Eup8+nQuYxlfWZ2U4yMhKDhWGgt8CF3zOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8akpK6Rw2y4VFUw7DI68JogDPlocPo/Y+yGVvQt2P9eIoHTNTQ
	+Ja0rb9luXvWZkU2srgl/dZ/tQGZmCUSQgrF4e2xM4JalvO3iFU14JbLRE1qiteakxbeuNy/K/E
	3YMeVFtfyCMiCW2nEGQ==
X-Received: from oibdu15.prod.google.com ([2002:a05:6808:628f:b0:56d:b7b4:fabf])
 (user=starchang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:199f:b0:568:2782:d1b4 with SMTP id 5614622812f47-57a0bd95bcemr8831086b6e.32.1795415771832;
 Sun, 22 Nov 2026 22:36:11 -0800 (PST)
Date: Mon, 23 Nov 2026 06:36:08 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123063608.3665186-1-starchang@google.com>
Subject: [PATCH net v6] arp: Do not update neighbours from ARP in L2
 multicast/broadcast frames
From: Star Chang <starchang@google.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Julian Anastasov <ja@ssi.bg>, Johannes Berg <johannes@sipsolutions.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wangroger@google.com, 
	starchang@google.com
Content-Type: text/plain; charset="UTF-8"

The drop_unicast_in_l2_multicast sysctl drops unicast IP packets that
are received in link-layer multicast or broadcast frames. On Wi-Fi this
protects against the "Hole-196" attack, where any station that knows
the group key injects frames as group-addressed traffic.

ARP is not covered. A broadcast ARP request or reply with sip set to
the gateway address and sha set to the attacker MAC still creates or
updates the gateway neighbour entry, so the attacker can poison the
ARP cache of other stations. ARP requests are legitimately broadcast
and cannot be dropped, and drop_gratuitous_arp only catches sip == tip.

When drop_unicast_in_l2_multicast is set, do not pass ARP packets
received in L2 multicast/broadcast frames to neigh_event_ns() or
neigh_update(), so they can neither create nor change neighbour
entries. Requests for local and proxied addresses are still answered;
neighbours are learned from unicast replies to our own requests.

Fixes: 12b74dfadb5a ("ipv4: add option to drop unicast encapsulated in L2 multicast")
Suggested-by: Julian Anastasov <ja@ssi.bg>
Signed-off-by: Star Chang <starchang@google.com>
---
v6:
 - Instead of dropping L2 BMC ARP replies, skip neigh_event_ns() and
   neigh_update() for any ARP received in L2 BMC frames, which also
   covers broadcast requests with sip = gateway (Julian)
 - Drop the frame and release reply_dst on that path (Julian)
v5: https://lore.kernel.org/netdev/20261030031136.607720-1-starchang@google.com/
v4: https://lore.kernel.org/netdev/20261027015619.1745984-1-starchang@google.com/
v3: https://lore.kernel.org/netdev/20261026150539.1357037-1-starchang@google.com/

 Documentation/networking/ip-sysctl.rst |  4 ++-
 net/ipv4/arp.c                         | 38 +++++++++++++++++++-------
 2 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index 208f46967ee5..d603588266b4 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -2298,7 +2298,9 @@ promote_secondaries - BOOLEAN
 
 drop_unicast_in_l2_multicast - BOOLEAN
 	Drop any unicast IP packets that are received in link-layer
-	multicast (or broadcast) frames.
+	multicast (or broadcast) frames. ARP packets received in such
+	frames are not used to create or update neighbour entries,
+	but ARP requests for local addresses are still answered.
 
 	This behavior (for multicast) is actually a SHOULD in RFC
 	1122, but is disabled by default for compatibility reasons.
diff --git a/net/ipv4/arp.c b/net/ipv4/arp.c
index d409f606aec0..17b5f32736aa 100644
--- a/net/ipv4/arp.c
+++ b/net/ipv4/arp.c
@@ -714,6 +714,7 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 	struct neighbour *n;
 	struct dst_entry *reply_dst = NULL;
 	bool is_garp = false;
+	bool bmc_no_learn;
 
 	/* arp_rcv below verifies the ARP header and verifies the device
 	 * is ARP'able.
@@ -791,6 +792,10 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 	    (!IN_DEV_ROUTE_LOCALNET(in_dev) && ipv4_is_loopback(tip)))
 		goto out_free_skb;
 
+	bmc_no_learn = (skb->pkt_type == PACKET_BROADCAST ||
+			   skb->pkt_type == PACKET_MULTICAST) &&
+			  IN_DEV_ORCONF(in_dev, DROP_UNICAST_IN_L2_MULTICAST);
+
  /*
   *	For some 802.11 wireless deployments (and possibly other networks),
   *	there will be an ARP proxy and gratuitous ARP frames are attacks
@@ -850,14 +855,19 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 			if (!dont_send && IN_DEV_ARPFILTER(in_dev))
 				dont_send = arp_filter(sip, tip, dev);
 			if (!dont_send) {
-				n = neigh_event_ns(&arp_tbl, sha, &sip, dev);
-				if (n) {
-					arp_send_dst(ARPOP_REPLY, ETH_P_ARP,
-						     sip, dev, tip, sha,
-						     dev->dev_addr, sha,
-						     reply_dst);
-					neigh_release(n);
+				n = NULL;
+				/* Do not learn the sender from a BMC frame */
+				if (!bmc_no_learn) {
+					n = neigh_event_ns(&arp_tbl, sha, &sip, dev);
+					if (!n)
+						goto out_consume_skb;
 				}
+				arp_send_dst(ARPOP_REPLY, ETH_P_ARP,
+					     sip, dev, tip, sha,
+					     dev->dev_addr, sha,
+					     reply_dst);
+				if (n)
+					neigh_release(n);
 			}
 			goto out_consume_skb;
 		} else if (IN_DEV_FORWARD(in_dev)) {
@@ -866,9 +876,11 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 			     arp_fwd_pvlan(in_dev, dev, rt, sip, tip) ||
 			     (rt->dst.dev != dev &&
 			      pneigh_lookup(&arp_tbl, net, &tip, dev)))) {
-				n = neigh_event_ns(&arp_tbl, sha, &sip, dev);
-				if (n)
-					neigh_release(n);
+				if (!bmc_no_learn) {
+					n = neigh_event_ns(&arp_tbl, sha, &sip, dev);
+					if (n)
+						neigh_release(n);
+				}
 
 				if (NEIGH_CB(skb)->flags & LOCALLY_ENQUEUED ||
 				    skb->pkt_type == PACKET_HOST ||
@@ -887,6 +899,10 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 		}
 	}
 
+	/* ARP received in L2 BMC frames must not change the neighbour table */
+	if (bmc_no_learn)
+		goto out_drop_dst;
+
 	/* Update our ARP tables */
 
 	n = __neigh_lookup(&arp_tbl, &sip, dev, 0);
@@ -945,6 +961,8 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 	dst_release(reply_dst);
 	return NET_RX_SUCCESS;
 
+out_drop_dst:
+	dst_release(reply_dst);
 out_free_skb:
 	kfree_skb(skb);
 	return NET_RX_DROP;
-- 
2.56.1.750.gf70dc682cf-goog

