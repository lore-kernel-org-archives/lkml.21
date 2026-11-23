Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445140;
	b=ZBZ7EUf68Qi4NhnIK+/7gcT13BbKOV6v0gEEFuhq/c4u51xEanIFweHKxkKJjEOsLzDa
	 r98X686REHF3KcbeMQS7tfqffr0RkvaFFvK0aD8T3jZvKZ5/c89/UJ0TvasIEdCU3u8PD
	 +Dbso+Jg3Vk7CpQevI8d1AVKQ2PVB9cYhz2VxipyNpY2tBSU2wJpk4KdRNTTen4I7ZwWz
	 D9NA9trqWcFgg7wxD1ji1YOC2rqGicKPCbtmS1kNBZs5WxOn5kRI8kpn89CIZiBXA7Yux
	 djfqI69pLq2OLwxM8qKIPL22BAha3GGtJnunk+9M+Jc1deqvn2ZdHS0yczVvBSBOauA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=HgymT9X4GLVCIEw/A5amCe6qZlzOlDVRvVwfoXilmPY=;
	b=bo7eRScug+A/YRGLhDi0tZYlxjeHfMTJoguxFxYVpuUjDdlQS1RwwJmhMrWsWJDuwWrr
	 47/SYBLnd1tBLTatr7TjChf59KSuoYdzo6QCRCrxZccKNeOxLXVbnKUk+o1kqH/wSFb6K
	 gqs/Py+VOv0s0Q19XYTKz8iuXOuvC7PWDRpEmVzHd/dHRGQFWq6bZCDkGxm7BvEyYjx6m
	 EgdQ7UxMU4Ooz4If0Djg67fiLcHQlqYYpl03MNfrBPUOxnU2Z9/MdYwAlZc8cNrBgq/TK
	 wkGSx6Hn2b6qH7qM//P+3KvYWx7KrjSkzHazIDRN1f24yIgeg0zxOqseKLqEUxrJP/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--starchang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZIHYubhv;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3D6606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A3D6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--starchang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZIHYubhv
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so2641212b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795445139; x=1796049939; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HgymT9X4GLVCIEw/A5amCe6qZlzOlDVRvVwfoXilmPY=;
        b=ZIHYubhvLp+vswPrauUvTV78Che5NPhf+XNJK5EgPL25dhbOPx5W4Fp83LqTdXDwOs
         r+wefDmK25nWYKSlI5gID5ptgCb3yj12S4Od2NVNgFpqdFYTMWvJ6+akALEWgvGCvQZg
         uVZ5CBJezmnF5d6Y7pz3XWfWqQwdS4hTua4q8xSjRsCxf9kYAt676D4USV5cg4X9WxQF
         MelaPYhufjjLau6KH3IVjZheiHIn1VBbKPZfDR+uSHeCykp3YnDBnAILarAswKiChS4r
         vwu2y4nqgNaIhK9GQYptHc8CrL4/Ktln1/rdfYaLeBZJ2gZuF5/GiDGHP36m2g/djVvb
         4nnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445139; x=1796049939;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HgymT9X4GLVCIEw/A5amCe6qZlzOlDVRvVwfoXilmPY=;
        b=mye0oDdVrQ+0V/XoEkRmZJl7NPMLNagEJOxDN1V4Ah01o/zH1PNk4pdEj3xD81La9U
         PcrCZozwA7UrRVK1teX3hhL1VomPfU2CA4EniqRYtVevfmJsAOWTf/I2Mr21la8waBGS
         Xaa4GDWSjaGJgV9BOjl/ROzjZ/3tX/UUnGEtG7gulEf7QxljU4oCWiLPpHUw+JktivRO
         BMANQoJYGW8SXnoefhlMYkgKnrjP6xjSKF5UrM06ihdLQZNtzY6yFgpWT1lDL9gtwlTS
         mTr//0heGSg3h+l4KxI3m52uVjunklftrDYYpCOS8/n0LOVtbgK6paDRQ8ay+vhGHiIW
         eJnA==
X-Forwarded-Encrypted: i=1; AL+hErHsieHE01krCjCdWgvGg2SB0tORbB320wwb3anON7WDv8vzz0mIgyoVerzkqVHXTpLjczKfq7v7zCd+fUs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5hi7+KB3fAHY1HtWMF8K+Yid5q0jULlui278W7jT90Q17TFF+
	yrHZ2MwUpYvrdQkzcXq0jLknQJ1QhAj0h+/tkymY2QST3ergN/tnrUiC3gLFhXFPj0nVMNbv/sw
	mCJwJth4SJpNV6smJyA==
X-Received: from pfbw1.prod.google.com ([2002:a05:6a00:b481:b0:88b:8b90:725d])
 (user=starchang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6300:8052:b0:3e2:827c:2fe2 with SMTP id adf61e73a8af0-4014a470489mr10760040637.1.1795445138722;
 Mon, 23 Nov 2026 06:45:38 -0800 (PST)
Date: Mon, 23 Nov 2026 14:45:35 +0000
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
Message-ID: <20261123144535.155300-1-starchang@google.com>
Subject: [PATCH net v7] arp: Do not update neighbours from ARP in L2
 multicast/broadcast frames
From: Star Chang <starchang@google.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, Julian Anastasov <ja@ssi.bg>, 
	Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, wangroger@google.com, starchang@google.com
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

This was found in an internal security review and reproduced in a lab
on a WPA2-PSK network: a group-addressed ARP reply injected by another
station changed the victim's gateway neighbour entry to the attacker
MAC. There are no kernel messages, only the wrong neighbour entry.

When drop_unicast_in_l2_multicast is set, do not pass ARP packets
received in L2 multicast/broadcast frames to neigh_event_ns() or
neigh_update(), so they can neither create nor change neighbour
entries. Requests for local and proxied addresses are still answered;
neighbours are learned from unicast replies to our own requests.

Fixes: 12b74dfadb5a ("ipv4: add option to drop unicast encapsulated in L2 multicast")
Suggested-by: Julian Anastasov <ja@ssi.bg>
Signed-off-by: Star Chang <starchang@google.com>
---
v7:
 - Rebase on net, arp_process() changed (Julian)
 - Add an empty line before out_free_skb (Julian)
 - Mention how the issue was found in the commit message
v6: https://lore.kernel.org/netdev/20261123063608.3665186-1-starchang@google.com/
 - Instead of dropping L2 BMC ARP replies, skip neigh_event_ns() and
   neigh_update() for any ARP received in L2 BMC frames, which also
   covers broadcast requests with sip = gateway (Julian)
 - Drop the frame and release reply_dst on that path (Julian)
v5: https://lore.kernel.org/netdev/20261030031136.607720-1-starchang@google.com/
v4: https://lore.kernel.org/netdev/20261027015619.1745984-1-starchang@google.com/
v3: https://lore.kernel.org/netdev/20261026150539.1357037-1-starchang@google.com/

 Documentation/networking/ip-sysctl.rst |  4 ++-
 net/ipv4/arp.c                         | 39 +++++++++++++++++++-------
 2 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index d3523c9064a2..fd2ffb2d2812 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -2302,7 +2302,9 @@ promote_secondaries - BOOLEAN
 
 drop_unicast_in_l2_multicast - BOOLEAN
 	Drop any unicast IP packets that are received in link-layer
-	multicast (or broadcast) frames.
+	multicast (or broadcast) frames. ARP packets received in such
+	frames are not used to create or update neighbour entries,
+	but ARP requests for local addresses are still answered.
 
 	This behavior (for multicast) is actually a SHOULD in RFC
 	1122, but is disabled by default for compatibility reasons.
diff --git a/net/ipv4/arp.c b/net/ipv4/arp.c
index 3bc8db6ccd68..cc69ea07fc2d 100644
--- a/net/ipv4/arp.c
+++ b/net/ipv4/arp.c
@@ -715,6 +715,7 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 	struct neighbour *n;
 	struct arphdr *arp;
 	struct rtable *rt;
+	bool bmc_no_learn;
 	__be32 sip, tip;
 	int addr_type;
 
@@ -794,6 +795,10 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 	    (!IN_DEV_ROUTE_LOCALNET(in_dev) && ipv4_is_loopback(tip)))
 		goto out_free_skb;
 
+	bmc_no_learn = (skb->pkt_type == PACKET_BROADCAST ||
+			skb->pkt_type == PACKET_MULTICAST) &&
+		       IN_DEV_ORCONF(in_dev, DROP_UNICAST_IN_L2_MULTICAST);
+
  /*
   *	For some 802.11 wireless deployments (and possibly other networks),
   *	there will be an ARP proxy and gratuitous ARP frames are attacks
@@ -853,14 +858,19 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 			if (!dont_send && IN_DEV_ARPFILTER(in_dev))
 				dont_send = arp_filter(sip, tip, dev);
 			if (!dont_send) {
-				n = neigh_event_ns(tbl, sha, &sip, dev);
-				if (n) {
-					arp_send_dst(ARPOP_REPLY, ETH_P_ARP,
-						     sip, dev, tip, sha,
-						     dev->dev_addr, sha,
-						     reply_dst);
-					neigh_release(n);
+				n = NULL;
+				/* Do not learn the sender from a BMC frame */
+				if (!bmc_no_learn) {
+					n = neigh_event_ns(tbl, sha, &sip, dev);
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
@@ -869,9 +879,11 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 			     arp_fwd_pvlan(in_dev, dev, rt, sip, tip) ||
 			     (rt->dst.dev != dev &&
 			      pneigh_lookup(tbl, &tip, dev)))) {
-				n = neigh_event_ns(tbl, sha, &sip, dev);
-				if (n)
-					neigh_release(n);
+				if (!bmc_no_learn) {
+					n = neigh_event_ns(tbl, sha, &sip, dev);
+					if (n)
+						neigh_release(n);
+				}
 
 				if (NEIGH_CB(skb)->flags & LOCALLY_ENQUEUED ||
 				    skb->pkt_type == PACKET_HOST ||
@@ -890,6 +902,10 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 		}
 	}
 
+	/* ARP received in L2 BMC frames must not change the neighbour table */
+	if (bmc_no_learn)
+		goto out_drop_dst;
+
 	/* Update our ARP tables */
 
 	n = ipv4_neigh_lookup(dev, &sip);
@@ -953,6 +969,9 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 	dst_release(reply_dst);
 	return NET_RX_SUCCESS;
 
+out_drop_dst:
+	dst_release(reply_dst);
+
 out_free_skb:
 	kfree_skb(skb);
 	return NET_RX_DROP;
-- 
2.56.1.750.gf70dc682cf-goog

