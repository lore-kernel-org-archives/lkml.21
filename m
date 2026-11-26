Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795653077;
	b=cqwJiyOqk/IoSOK1zzd50k1v7uX1khnt5sbJv6EogjCRfYAl0FdLA9nv6H1Nkhi3uhH+
	 QJsWbfWU5NWCJeW1GjNul14ooSfv7s+ya01dT8ePGU+ZeohgShqsuT833OCQ3B6muUTSW
	 jco5RJzsVMqZ0QcbZd6kUdyCaa6QWqBmxzNYnXqTm56I8cAGJGN0WGdk/+n4Jc9romeUt
	 ERM+qZiNK5+a2jbzU1HoD1xbAneIbpmTC8VJO+pjOzaSv418deu/iJFL/I+IjpXsfgyis
	 wZMGAd1CVKucL5rDeQVlBM0SE8AicCQrw/tIRu3oYShIGF5E2V0DAY+P73+wUA+axoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=ICZZE9VBO9beisSpy8BNbX6a9KzopoCzuyfJCIEcnuw=;
	b=TcsfNw7m0NFs6e53To7rZ+ZLUjx6+joHmLgMcAI/10KxxVkmB1dhWEtuR04DxD5FGh/+
	 jTo2gVDUFGlfUmkCquF81UAcouT0ejNyEdy5TTx+W1rXjWl86EywlHwkb8f4/Dpcg6m5d
	 czWQXlbxfaQWKKq98RhPBn301+PU8Wd2VhZi1YF77ietMyY0Clmbxr1uXe9aUnc1oYo82
	 WvNLwPGFxYuPvFKU7Mwt7VNIkIZbl51cSbz0t0dzX5+ttX9ahQtQxkp1WXUa61ZKwsDmu
	 zEmIApaXCu3ETXuL20JRvvHingZEW6+blaA/O1VQNIIeFG1tQ9xV+5KTpE0mbd0nbWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K1SfXYOS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1002B606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1002B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K1SfXYOS
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f0458cc9easo51998645ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:31:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795653076; cv=none;
        d=google.com; s=arc-20260327;
        b=fk/HFm+AHmhrZ7W4XVK1tOSe9xD2mxNXoHFULUvYIj74TGBwdOIESN9I4ZAuV7fctv
         7evsPHwUTjZJZ60phFP8NaFVzuzGPiFErUdb/XE1GDR2CKdDy80dKPzQ8OevL6nX/t0I
         9nN6PSEFOi8XMSVPn9SxbO3BFgT2lH6TzBm/ng3IrSixFCWEpty0JzCxJ7f+pHYjlGUw
         3yy7vKaRuJdA1NesRZ6gfWWqeuVLR3l9gsL6MyK3rnZEHAivIiTdg3uml9U3WR9km5l8
         TQH6LqDNkAk3A2VAbpcc7BGAOfhrzneM+rM7jgtV2Ig7yA2QhsFhNdyKRBv31pQHugQt
         1UOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ICZZE9VBO9beisSpy8BNbX6a9KzopoCzuyfJCIEcnuw=;
        fh=DQs3gBNBy3ni9wB+58UXaYgm29/wPoW2nRPNfsOoN2w=;
        b=E9irn/87EkJf7kqOLHUq9QMlwwixKm66Nr69mS6fJySOoRaN8qRTc0JE/LTE1SR07p
         Jlo/Q/XA1Ur8/57mA5/oX6t6EA2vLiwcmq7M1o6YHjw/WL8yf6oavy+TeUzFONcxScz0
         RYlHM5wkHHEMIvydaANJpoxF71qRonHPkoU6+b2+kCbSYZMPZCtuhPtlhwip0zYHunpG
         6BQhsKfn9+QK6yGIME1V73Mp7t0HGEA6jhDjLLHDMyQ8aNOgwqMu5Or3M2C8AiIHHDvs
         YHrbL0RnrsTAbyU7FdZJHtxAmULOcO19Mdn+7F/gmrbu/Ken4QxH/8z3wfD3FtHbYuy0
         w0Wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795653076; x=1796257876; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ICZZE9VBO9beisSpy8BNbX6a9KzopoCzuyfJCIEcnuw=;
        b=K1SfXYOST280EGOh0hqJwdPc7hYk4wdpIGgBf8cGDZcs0rAmSi410idxWSEVrzo52b
         3EjE1Fi+4MpBEztBC1iUR68Bryiwg2gz8kHdea+1czfhitbP4KGhkBu3H7okWoNbRzjV
         xc5Mk3NCiYHVVCKko78vIAIYIEMCh0h7DzPjWuHjohFjYmnWaRlrl0IxADz3/QLf/Vlt
         NA8ud5c42BnHdjrHhcvqfjnSc9VUD7U985lQL4NsCL1rfvOMhcL64GEukIvvkiLZhv/S
         OVsdjdWbpup4Cvc6W53xGc2NkTA2YyRX094xdA2tNX5dHRXJAXP5wLOL6ZJxyuvwLUGB
         L4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795653076; x=1796257876;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ICZZE9VBO9beisSpy8BNbX6a9KzopoCzuyfJCIEcnuw=;
        b=kMxGc1xwGstGLqacdqHocJAW3xFzUKfJmLCropku08lTAqQGrMlpztOIK+J4iaaQa8
         zXY4zlVy9Ovha4EdcTilPZR5XtBzzugaeCjjyHflo5VD21S/kwq5H9IyZZSyLvmSP/9m
         FLQrXtC6QzBBqisqJZwAH9mMU1N4d5w/txMvCSdTgHq2dHeCkBac4kly3JpBTUL8Ocjm
         gP9ayLOejXQx2MAU7gHe8An8yatr3GzOzJ+vviOV8KNK7OvUmPQ7Y1gVlSCjMjPJyjKP
         l3y4s/X5NQvFEJnXJkcx272ImWy6E3WIHRk5Iqu/EOAv9eY/vhxWfEhRfF2EzgFthh0R
         DSPA==
X-Forwarded-Encrypted: i=1; AL+hErEBuQGNyozpizoeEz1hCDM2OjqF36KK6ZWUTSw/t2nE841Hsp7z3G5oebNG0TwE007R2C5CKYAlzklRE0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oCuJ+hBzjGJ4AC5xxchmFXPjlbxqAyJMsQ7oV8iP1niBba9NR
	ujkg196odTJkjr3xmvTekH73oT6tsxM3/2xVL3YQDFp8Yo2e4i35ildfbwMK4C3FiQNY46f3isH
	RHhOmPSuju4RbBoPh8JbRqdZfZth97901D0YS5M1I+RGlNG3Qiw==
X-Gm-Gg: AZFdTZerUZqTwa8yZpVv7TKIAM0o79ttOLotOksBepZkTjoZdSyyFRkLnEG1DHk/caL
	dJ68W9p56AS/7vH6gtJZNDnsQ81Xoj2xZca3FjgU+/vKtwsoxBrBq4azgK201tELj7O1oe4RnKx
	GNnTv6afuEwo0iPpX/LfWpsmGreHMd+Qpzw4HBfDXHJQUj7ACRwaYSvIYLKeBlDuR5ac0txAA0a
	FFwRgGwnXgIggLxc/QxsvVX17RJN73HpkOpMik0d2L9iVV0gfJEbi4LVGqo9gtoSWCfxiIZCmUc
	PMB3VTsSAZx3Q4tELvQRGC6KmrSCQzQVk3DCyY1HAwugDsM9NK6P0oh1/QlHXRAe2XywXfR9+WJ
	K3RDwoUr3/hvHPVTOZl2PdGG0qh18YFkC3kxtt/UqSl917BSzCljr+zSWHN6pVB+GQpFV+CcZTo
	CVTF9Ux7+y+5KZz6iHHa1GYc1RzQK4fw==
X-Received: by 2002:a17:902:ea04:b0:2ef:e946:cdc with SMTP id
 d9443c01a7336-2f03f1f0ae8mr211799355ad.56.1795653076333; Wed, 25 Nov 2026
 16:31:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Tom <tomasbortoli@gmail.com>
Date: Thu, 26 Nov 2026 01:31:05 +0100
X-Gm-Features: Aa3M54okSEAPWFMbrv6EcpD0OgdWdl35ZbfM3ItFkdVh3fTU8GP8oNOoxWq68oU
Message-ID: <CAAHj5qjM7BoGKD35gVCn_XCf6ec-LKq7-5_1YMewOYfskyATjQ@mail.gmail.com>
Subject: [PATCH net] udp: don't apply socketless ICMP PMTU/redirect updates on
 end hosts
To: netdev <netdev@vger.kernel.org>
Cc: David Miller <davem@davemloft.net>, dsahern@kernel.org, eric.dumazet@gmail.com, 
	kuba@kernel.org, willemdebruijn.kernel@gmail.com, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

ICMP error messages are unauthenticated and quote an attacker-chosen
inner header.  udp_err_update_exception() (and its IPv6 twin
udpv6_err_update_exception()) process ICMP Destination Unreachable
messages with Code 4 (fragmentation needed, RFC 792) and ICMP Redirect
messages before any socket lookup, calling ipv4_update_pmtu() /
ipv4_redirect() with no socket and oif = 0.  The resulting change is
stored in a route entry's PMTU, which every user of that route shares;
on a non-forwarding end host with one route to the internet, the
change affects the entire network namespace.

A single forged ICMP Destination Unreachable with Code 4 lets any
remote host pin the victim's PMTU toward an arbitrary destination,
degrading or denying service for flows using that route, depending on
their packet sizes: values below net.ipv4.ip_rt_min_pmtu are clamped
and locked (see __ip_rt_update_pmtu()), so a locked 552-byte PMTU
persists until a route flush and breaks PMTUDISC_DO senders
(EMSGSIZE) and QUIC (RFC 9000 minimum 1200-byte datagrams), among
others.  The in-kernel ICMP
rate limit exempts fragmentation-needed errors from its ratemask, so
attacker-controlled entries can be refreshed unthrottled.

TCP drops errors for packets that match no socket (tcp_v4_err(),
net/ipv4/tcp_ipv4.c); UDP should not be more trusting than TCP on end
hosts, where forwarded flows do not exist: an error that matches no
socket would then change no route state at all.

Fix this by only performing socketless PMTU/redirect updates where they
are actually required -- for forwarded traffic on a router
(net.ipv4.ip_forward enabled on IPv4, net.ipv6.conf.all.forwarding on
IPv6).  On routers, this path keeps its original preconditions and
residual exposure, which transit traffic legitimately requires.  On
end hosts, PMTU updates continue to work for socket-bound
flows through ipv4_sk_update_pmtu() / ip6_sk_update_pmtu(); those
paths are intentionally unchanged -- an error matched to a real socket
updating the route entry for its own path is the accepted PMTUD trust
model (PMTU state is a route property for TCP and UDP alike; the
matched-socket difference is who may trigger the update, not where the
state lives); this patch only removes the evidence-free flow-agnostic
route-wide write.  Errors whose quoted inner header matches no
socket, including those from middleboxes that rewrite or mangle the
flow (NATs without ICMP inner-header translation, for example), are
ignored on end hosts; NAT devices that translate ICMP inner payloads
deliver the original tuple, which continues to match.  Encapsulated
tunnels keep their own error path
(__udp4_lib_err_encap_no_sk() / __udp6_lib_err_encap_no_sk()).

Reproducer (forged ICMP Destination Unreachable with Code 4, inner
header quotes no real socket):
  pre:  1400-byte UDP sendto with IP_PMTUDISC_DO succeeds (local path)
  send: ICMP Destination Unreachable, Code 4, next-hop MTU = 1100,
        inner IP header src=<local>/dst=<peer>,
        inner UDP header (no matching socket)
  post: same sendto returns EMSGSIZE; claims below ip_rt_min_pmtu
        (default 552) additionally install a locked 552-byte floor that
        persists until a route flush; identical result with a packet
        source address that does not match the inner header (nothing
        correlates them).

Verified on two builds of the same kernel (6.12), differing only by
this change: without it, a forged ICMP Destination Unreachable with
Code 4 quoting a UDP flow with no matching socket installs the route
MTU for MTU = 1100 (unlocked, self-heals via aging) and for MTU = 500
a clamped locked 552-byte floor that persists until a route flush; a
forged packet quoting zeroed inner UDP ports behaves identically.  An
error matched to a real connected UDP socket still applies its PMTU to
that socket's path (the unchanged socket-matched PMTUD path,
ipv4_sk_update_pmtu()).  With the patch and ip_forward = 0, forged
packets of both shapes are ignored while the socket-matched path is
unchanged; with ip_forward = 1, socketless updates keep working
(router parity).  A genuine end-to-end PMTU event, generated by a real
forwarding router with an 800-byte-MTU egress interface against a
PMTUDISC_DO sender, still shrinks the sender's route: the sender gets
EMSGSIZE on the oversized datagram and completes delivery at the
reduced size, with and without the change.

Also gates the Redirect half of the same problem pre-lookup
(udp: ipv4_redirect()/ip6_redirect() were reachable from forged ICMP
Redirects without a socket); generic ICMP redirect dispatch is left
untouched for other transports.

Signed-off-by: Tomas Bortoli <tomasbortoli@gmail.com>
---
 net/ipv4/udp.c | 15 +++++++++++-----
 net/ipv6/udp.c |  6 ++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index 2e5562f353f8..503575f0cf6c 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -913,10 +913,17 @@
 static void udp_err_update_exception(struct net *net, struct sk_buff *skb,
      int type, int code, u32 info)
 {
- if (type == ICMP_DEST_UNREACH && code == ICMP_FRAG_NEEDED)
- ipv4_update_pmtu(skb, net, info, 0, IPPROTO_UDP);
- else if (type == ICMP_REDIRECT)
- ipv4_redirect(skb, net, 0, IPPROTO_UDP);
+ /* ICMP errors are unauthenticated and quote an attacker-chosen
+ * inner header.  Socketless PMTU/redirect updates are only
+ * legitimate for forwarded traffic on routers; end hosts do not
+ * act on UDP errors for non-existent flows.
+ */
+ if (IPV4_DEVCONF_ALL_RO(net, FORWARDING)) {
+ if (type == ICMP_DEST_UNREACH && code == ICMP_FRAG_NEEDED)
+ ipv4_update_pmtu(skb, net, info, 0, IPPROTO_UDP);
+ else if (type == ICMP_REDIRECT)
+ ipv4_redirect(skb, net, 0, IPPROTO_UDP);
+ }
 }

 /*
diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
index a6886a0432f9..d1cf5ce2b00a 100644
--- a/net/ipv6/udp.c
+++ b/net/ipv6/udp.c
@@ -694,6 +694,12 @@
 static void udpv6_err_update_exception(struct net *net, struct sk_buff *skb,
        u8 type, __be32 info)
 {
+ /* Same hardening as IPv4: only forwarded traffic on routers may
+ * drive socketless PMTU/redirect updates.
+ */
+ if (!net->ipv6.devconf_all->forwarding)
+ return;
+
  if (type == ICMPV6_PKT_TOOBIG)
  ip6_update_pmtu(skb, net, info, skb->dev->ifindex, 0,
  sock_net_uid(net, NULL));
-- 
2.47.3
