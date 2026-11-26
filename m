Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795661345;
	b=XxdaJcG0p11dcS+8wHTcNT33E7A+MyzdYRuwNUinSn4Gk7Fogw7GEwjYFDd2qP+QuvXQ
	 DLcWTFf4RI2ao0AbxeaqdJJ9olGg0koRvadcbrv8yTPPKKBgPEw4htpC1PYVvrVHGrdtF
	 TGzF8KHIYTmtkyzey30b7ufCVFVO5NWPmrDQjEJbw7gs2DxCCoqj0zAOFzheITQ5neWmg
	 59lam5Uc+rc8VCEZ8xfiuBq3K4LaUCd0VDN2j/p28R0lDs2B+2SC4tVFkTv1wvTOVidhb
	 XLj227RwtmzwpO9//8vIrukyV/iIYg+4rIqRDRqomuJ67RrhRGbM4VZc5wNgYAA6xWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=S5Xf0dq7djJOyag1DG5P/5wzKwC4wT62MOh8WMXjPgs=;
	b=Ef+0Up8fdkP8TTGYAMzaM7+SMmhMOFd6cVe/p2uA7DmFIN0bV0vCqJFTam1I4V408W4p
	 JCzuFcUmUM47FFaDfqzB9k5kIyU2sjPrwrkmNopzYz88zHqKFiSXjtvzB0Oey/Fp6RGM2
	 iQduSM7M2Urd5HKZkOC0Pwa7XLuexX7eBFZIby+07T3mNGa4bEsPpGoEVkZgshTbw63xl
	 gbWKHdx3NGiIOVloa2VH2N4a0xLP3n/O4coFBFHOW5iTvdpVwwCyswyUZ+XlMQBnh4Iem
	 8nta8ZcPNBXWrtoCGZmd0Oi/szYk7GTMjDu7pw4LqjQ3kHBoxhcLg/eEdxBKPi8K8cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sammc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=arR7VQp5;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4AA606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC4AA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sammc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=arR7VQp5
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-574f8578e48so5874577b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795661344; x=1796266144; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S5Xf0dq7djJOyag1DG5P/5wzKwC4wT62MOh8WMXjPgs=;
        b=arR7VQp5azQ5b6hju7KGOB7V6ClhAWrxmzkeZ9IITkugl3PI4ByVVbrEF24yrUH6fq
         gstOjY2waspQjNey/GwSzVvsbUD8T9q0ayX5K5WnkH4zzjCUJo+LZRJkh+zDtjaGXbWw
         TAcav06zp001mulhD7+tfyaBOeOHbson4ER5X/8Xx1CoPru8vXL3l7QNrQ7gUL8ZZHk+
         MOZuG4KI+DGoggDorzMITDtQ+nE2R+sRQAVwVp2EdzbMgkMWrNMntgreFThfMJaBiFhG
         v8Tjt5AnyQDc1chclyBragsg/fIiGQkeNe7gXMu3ppDBPCq56yRl3/J4e/Z4jPOiZeg4
         W5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795661344; x=1796266144;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S5Xf0dq7djJOyag1DG5P/5wzKwC4wT62MOh8WMXjPgs=;
        b=fUT9XStyqsiSfa6lz5pC7Bnts0qFQyX5m2Cc1MMdB6lZN7rIjqQ6bkolkxPeHaACs/
         DDYaLN7Izg1fq7L15j12u4x3zVC+32B81Mf1DBeuuB+rEcFB56uisbDQFprJfcVO4PXL
         32iiLxsKbyf1C0qjhj8ttFyyidX6LCL+7Q2FwiOfBR2J1807tY/HhWveRfX9xqLdu15H
         qfh0JPrvZK8puQ6jrgcfSoMc1W50arSBGo+VPctXYIiVkrR1zBPZJgpomdV4x7kX0UEW
         Fcf5i69bTvX3EHrcP/sX/ynLhITIVzs1p2Tv8GbspjGKSwSPhcrdImzQVq4LM8HkhNRm
         +CjA==
X-Gm-Message-State: APuU4Z/koYJype0B30JNv9H1IfWUKGkVNo2nMuKiyC5DyI1nBgQJ0VDC
	33B4inP36XPEht2deLYhHMTMmlF0g1e+Pes6FSXiO3UAApFUARLGVeENbo+3l8rs1DLoJ8smSV+
	uxg==
X-Received: from ilqh16.prod.google.com ([2002:a92:d850:0:b0:54f:e3ff:ca5f])
 (user=sammc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:6615:b0:573:d802:fc1
 with SMTP id 5614622812f47-57a0a70c27bmr21744377b6e.30.1795661343537; Wed, 25
 Nov 2026 18:49:03 -0800 (PST)
Date: Thu, 26 Nov 2026 13:48:58 +1100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.911.g883d8bcb20-goog
Message-ID: <20261126024858.4013811-1-sammc@google.com>
Subject: [PATCH net-next] ipv4: route: do not allocate unreachable dst for
 non-IP packets
From: Sam McNally <sammc@google.com>
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When ip_route_input_slow() reaches no_route: (from a missing FIB entry
or !IN_DEV_FORWARD(in_dev) for a non-local target), falling through to
local_input: allocates an uncached RTN_UNREACHABLE rtable
(dst.input = ip_error), increments in_slow_tot, inserts it into
rt_uncached_list under spin_lock_bh(), and attaches it via
skb_dst_set().

Non-IPv4 callers such as arp_process() never invoke dst_input(skb) to
send ICMP errors; they ignore RTN_UNREACHABLE and release the dst in
consume_skb(), unlinking it from rt_uncached_list under spin_lock_bh()
and queuing dst_destroy_rcu() via call_rcu_hurry(), which wakes RCU
kthreads immediately since
commit 483c26ff63f4 ("net: Use call_rcu_hurry() for dst_release()").

Return SKB_DROP_REASON_INVALID_PROTO at no_route: when skb->protocol !=
htons(ETH_P_IP), matching brd_input: and ip_mc_validate_source(), while
preserving ip_route_input_noref() rp_filter source validation when tip
is RTN_LOCAL.

Observed during idle power testing on CONFIG_RCU_LAZY=y systems, where
background broadcast ARP traffic with IPv4 forwarding disabled
repeatedly woke RCU kthreads. Tested on x86_64 and arm64 under
synthetic broadcast ARP load (~45 ARPs/s) and live /16 network traffic
(~20-40 ARPs/s): live in_slow_tot dropped by >95% and 60s idle
rcu_preempt wakeups fell by ~70% on arm64 and ~75-88% on x86_64,
raising x86_64 package C10 residency from 62.5% to 84.6% and saving
~100-250 mW of SoC package power. An AI coding assistant was used to
help analyze the code path and draft the patch and changelog.

Signed-off-by: Sam McNally <sammc@google.com>
---
 net/ipv4/route.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index 11d990703d31..1f1b09b4ac8d 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -2463,6 +2463,10 @@ ip_route_input_slow(struct sk_buff *skb, __be32 daddr, __be32 saddr,
 
 no_route:
 	RT_CACHE_STAT_INC(in_no_route);
+	if (skb->protocol != htons(ETH_P_IP)) {
+		reason = SKB_DROP_REASON_INVALID_PROTO;
+		goto out;
+	}
 	res->type = RTN_UNREACHABLE;
 	res->fi = NULL;
 	res->table = NULL;
-- 
2.56.1.911.g883d8bcb20-goog

