Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095372;
	b=vvDH+pfhydGHH86c2LCVzOvNA6T+pkx0KF1fpu2tuzbEMhu9VZoigGDxXIOucKGKi00o
	 0cKVWrr2D3IbTLZkNJDmwt4yYUGIpgTA8ozQxEPBPpXdMm1OW8IdXc0IGO+gy99HMntRo
	 IdxTgaonROoMCEHkrOoiPTZj5myvrl//ztfbbMZfH4NmYDipBqSQn62drnXh9Q7fe4XMl
	 HEuAqBRXyZoO5o1hCC1gSapYBXenDXrJ6SKTQzk+buWrDf5HbBv5msjHyFPC3cvvJkw6K
	 xigsuXF08VTeMJ5txQpQWwKFwkwUUrVAfu4wRsC+v4ahXKIWGIyOU5Ckk0uVZ/k38kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YTomsJzN86B4i+kyehTHEeuAX5N33ShCtJVKBYwLGHM=;
	b=XwWJ9QPs+xiXF3SJR3VZMrGEozogNzTmAZKHyTaATWfl9cJJ4m2YBHRkMtgeN9+7eXUx
	 FC50KEFj9m8su6VZcyQP0DPfCgK6/Ph7lgo9JMxjUmWvq4dAd0yb7pvEO/yR+RbsMEs8M
	 PNk6nF8Yp1EQcXmOWbS71i9ioJAwn7r83nSmaJaEDgx9k0MpAgqLX/lSHirRsGwOfvfH9
	 N+wXfWW26jfATfdY5sH761za4mtomAtNCs8h22GszHOOaWMNEIKOjbmBjQTZNZfLdkcJ8
	 VdBE5n+CnL5lnVyznI/G/3/irmy/awzxpSyx70RajtUA8E9Pgw/UWICTaUFdXV5ZL+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b="GxYII/6w";
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BFB606A336
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97BFB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=GxYII/6w
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2efe591a1f6so10373655ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795095371; x=1795700171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTomsJzN86B4i+kyehTHEeuAX5N33ShCtJVKBYwLGHM=;
        b=GxYII/6wR1PyA0WzJgv/ztp9cJRK+H2FJyPVpivHfXxa/RBwgZQrJ7KUO+2NC5GNpH
         ude7W7Zjpfo8jTW96FTD+JB7KrxMkvb+qhkfed2tdcS1lXvOT5dfKUP6xHtQpAwYV8F4
         +jdPqdF6Hwnht1s2Bi4Pas31FKqZg6mEjWQpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095371; x=1795700171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTomsJzN86B4i+kyehTHEeuAX5N33ShCtJVKBYwLGHM=;
        b=LyuWzt2jNw/XcqMl1lidEH04Tc7ymyRJojxaEF92+wbJUJxYJgdJAoEkh0lmUJZdF0
         hoGLQ6xEWKZzzC3buIIPS1n8MMWs/sZokHYH3KgTQpoYqY17/gPWtxqI0hbJrn4fXvgO
         akNt4K0aG7HzeZ+AEUWMSG3PA50THotMg0+RSs2egcdOVl8bNVI4Dxy55t3Aav25OgSY
         cfMOu4wZTx/JKTRYzwzVlEKWZplveOLWbBQSjncyL9PDiiE/NPgHxKvpxOaUe7xfa+aF
         Ft6W4oZ9q+Wq1pAjVBdQHVKomRaM3D2rkdOSPL94qaO0BvhptBOUsGXhCrp8h+PiJlTm
         SDWg==
X-Forwarded-Encrypted: i=1; AL+hErFmBBr+cweEgDOv7syckOtweV2ngie7mAVTygdLcx5PdQAtKtizld77GLzoD3+UJfmmab9ziD/3fxK8RiM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xu65ppbNyXpNcjGKhH+71y9hOW4k5wt83kjeaT0old9F3HGCd
	Gv1EKTVrLLISIoUFBe0fV7x5GOM8s334dhyU+Xa8qgcZNOUiJYOta+k8Ymgw0X7wmxg=
X-Gm-Gg: AZFdTZf1yUvBwsnPZzSYbtpWe8T3LhztFTL2Oge2gI2k+o/wd3/hEjK/g3h8RWPVtVP
	FNh8zTNVoNl66vJehB2hpX5bmmMsN5JAuJ80miFU1KKif9rP6UP3LU9t7S6G38Ave+pfpJNLUP0
	TzoWHes48V9Ic+hWh+xyl6bYngGyOn8CBjDWBc7SN8Ze/XYjW6CkpWW1w2sYIQgs9+twdwISN3K
	9FR1zw5Z9a8D2j8H9bo2lCnkqmIcc5vFi/LH1R4YozWze1T+Qsu99VBCVvqTASaVlukUUHEx27e
	YiEK543YKOBW1VsKqu1v+BH1ZJAfbCYW45EtooDpm0jtYg5c0dhlmej6iJNMyE/hwH4ZujW0Jqx
	8kEoEBoFpLc2QMRncRoJfttg0SYTLDcmN09CE8tFOZcJR7r9vcK6X93V7mOSpPdFGyq2StND3aU
	4zLsfKeFCyvOwbXZnljTokh41HVaiDyA7/PEsavcjdIgRLlB7B8kx1w0qt4FEksqpBX4ZRxpmlf
	9RQ/lw2Zy2cqe+7UuEN2M+eyJ2oGPJvhqFm1WaJJdU299+K7+jpT56jl8poe5olauN3vsYfV5/R
	xoRuFLgCLVgeQJ/0vHLY02Udaks3e4pysJgHr3LqNNai+CUrWGgx9kYza3ee72fXrd8rqIjL2fI
	wQdfXXANfmJPSH/C2kNwk44w5yXCxwcF41sUycgIjQDcEiUgToS6Pd4NW1aulh7Qy
X-Received: by 2002:a17:902:ec85:b0:2ed:38c0:3328 with SMTP id d9443c01a7336-2eff73fade1mr58759865ad.28.1795095370830;
        Thu, 19 Nov 2026 05:36:10 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622c0a5sm31787405ad.50.2026.11.19.05.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:36:10 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Jamal Hadi Salim <jhs@mojatatu.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev-bot+sashiko@kernel.org,
	kapil@presceralabs.ai
Subject: Re: [PATCH net v2] net/sched: act_csum: bound the IPv6 jumbo payload length
Date: Thu, 19 Nov 2026 19:06:04 +0530
Message-Id: <20261119133604.3214926-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179506934898.3136.2983483959880388164@kernel.org>
References: <179506934898.3136.2983483959880388164@kernel.org>
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

Thank you - both points are right, and both are things the v2 changelog
understated.  I have read each of them in the tree rather than reasoning
from the patch, and measured the write before claiming it.  v3 describes
both and adds a second hunk for the write path.

1. The out-of-bounds writes, and the plain UDP arm

Confirmed, and my first reading of this was wrong in the direction that
mattered.  I had assumed skb_try_make_writable() established the length,
which would have kept the stores in bounds.  It does not:

	static inline int skb_try_make_writable(struct sk_buff *skb,
						unsigned int write_len)
	{
		return skb_cloned(skb) && !skb_clone_writable(skb, write_len) &&
		       pskb_expand_head(skb, 0, 0, GFP_ATOMIC);
	}

It copies a cloned skb and returns 0 otherwise, without consulting
write_len at all.  So in tcf_csum_skb_nextlayer() the
pskb_may_pull(skb, ipl + ntkoff) that wrapped really is the only length
check, exactly as you say, and the single remaining guarantee is the loop
condition

	} while (pskb_may_pull(skb, hl + 1 + ntkoff));

which covers one byte past the option chain - against stores at byte 16-17
(tcph->check), 2-3 (icmp6_cksum) and 6-7 (udph->check).

The ordering in tcf_csum_ipv6_udp() is as you describe: udph->check = 0 at
act_csum.c:339 precedes the ul tests at 341-352, so the plain UDP arm
performs the store and only then returns on ul != ipl - ihl.  "The plain
UDP arm is not affected" was true only of the long read, and v3 says so
instead of saying it is unaffected.

On the rawv6_send_hdrinc() arithmetic: I confirmed the allocation form,

	skb = alloc_skb(length + hlen + tlen + 15, ...)

with hlen = LL_RESERVED_SPACE(rt->dst.dev) and
tlen = rt->dst.dev->needed_tailroom, so a 15-byte tailroom is reachable as
you set out.  I did not independently reproduce the 353- and 673-byte cases
landing tcph->check on skb_shared_info, so rather than repeat figures I had
not checked, v3 states the mechanism and gives only arithmetic I verified:
a 49-byte packet, skb->len = 63, the store at offsets 78-79.

2. The set of senders

Confirmed, and this is the more consequential of the two for stable.
br_dev_queue_push_xmit() (net/bridge/br_forward.c:49) pushes ETH_HLEN back
before dev_queue_xmit(), so a bridged frame reaches tc egress with
skb_network_offset() == 14 and has never seen ipv6_rcv() or its jumbo
checks.  The only bridge-side check of this option is br_validate_ipv6()
at net/bridge/br_netfilter_ipv6.c:63, which calls nf_ip6_check_hbh_len()
and is reached from a br_netfilter hook - so it is absent unless that
module is loaded.  act_mirred does the same push for ingress-to-egress
(skb_push_rcsum(skb_to_send, mac_len), net/sched/act_mirred.c:315).

So CAP_NET_ADMIN is needed to install the action and not to send the
packet, and the sender need not be local: on a bridge, VM tap or container
veth with "action csum" on a port's egress, an unprivileged remote host,
guest or container can reach it.  v3 states that instead of describing only
the locally generated case.

3. Why KASAN does not report these writes

Worth stating explicitly, because the absence of a splat for the writes is
not evidence against them.

The overshoot is small and stays inside the same allocation.  The loop
condition in tcf_csum_ipv6() establishes hl + 1 + ntkoff bytes, and the
furthest store is tcph->check at bytes 16-17 of the transport header, so a
store reaches at most 17 bytes past the end of the linear data.
rawv6_send_hdrinc() asks alloc_skb() for length + hlen + tlen + 15, leaving
15 + dev->needed_tailroom spare bytes, and __alloc_skb() places
skb_shared_info - in its own words - "exactly at the end of allocated
zone", immediately after skb->end and within the kmalloc object.  So the
store lands in the tailroom or in skb_shared_info.  KASAN's redzone begins
only after that object, so nothing is poisoned and no report is produced.

This is why the harness that found the UDP-Lite read never reported the
writes: that read walks tens of thousands of bytes and leaves the object, so
it hits a redzone, while the writes corrupt skb_shared_info silently.  With
a one-byte transport header the arithmetic is: a 49-byte IPv6 packet
(40 + 8 hop-by-hop + 1) gives skb->len = 63 at clsact egress, which is
exactly what the loop condition establishes (48 + 1 + 14), while
tcph->check is stored at offsets 78-79 - fifteen bytes past the data.

I have not posted a demonstration of this, and deliberately have not
instrumented a kernel to produce one: observing it needs a WARN added to
tcf_csum_skb_nextlayer(), which is not something to carry in a fix, and the
reproducer for this finding is not being posted in any case.  The claim
rests on the code paths above, each read in the tree.

4. What v3 changes

The write path gets a check of its own.  You are right that the jumbo bound
closes it transitively - once *pl is bounded, ipl + ntkoff is back inside
skb->len and the existing pskb_may_pull() is again what establishes the
header - but the guarantee then lives in tcf_csum_ipv6_hopopts(), three
frames from the store, while the code at the store site reads as though it
validates.  That split is how this got here.  So
tcf_csum_skb_nextlayer() now checks the header it is about to hand out:

	if (!pskb_may_pull(skb, ipl + ntkoff) || (ipl < hl) ||
	    !pskb_may_pull(skb, hl + ntkoff) ||
	    skb_try_make_writable(skb, hl + ntkoff))
		return NULL;

It cannot refuse a valid packet: ipl >= hl and ipl + ntkoff <= skb->len
together give hl + ntkoff <= skb->len, so the new test succeeds whenever
the old ones do.  It only refuses an skb whose header is not there.

Measured both ways on 7.4-era code, with a print added to that function for
the purpose and one 49-byte packet (40 + 8 hop-by-hop + 1) through a clsact
csum action carrying TCA_CSUM_UPDATE_FLAG_TCP:

  before:  ihl=48 jhl=20 hl=68 ntkoff=14 ipl=4294967282 skb_len=63
           data_len=0 headlen=63 hdr_end=82 oob=1
  after:   the print does not appear - the function returns NULL before the
           store - and ping6 to ::1 still works, so ordinary traffic is
           unaffected.

ipl is 0xFFFFFFF2 there, so ipl + ntkoff is 0 and the first pskb_may_pull()
passes without pulling anything, ipl < hl is false because ipl is huge, and
the 20-byte header ends 19 bytes past the 63 bytes of linear data.  That is
the store you described, and the reason it needed a print rather than a
splat is in section 3.

5. The jumbo bound, unchanged from v2

The bound is relative to this skb,

	unsigned int avail = skb->len - skb_network_offset(skb);

so it holds for the bridged and redirected paths as well as the local one,
and it closes the writes together with the reads: with ipl + ntkoff back
inside skb->len, the pskb_may_pull() in tcf_csum_skb_nextlayer() is once
again what establishes that the transport header is present before
anything stores to it.  That subtraction cannot wrap, because
tcf_csum_ipv6_hopopts() is only reached after the
pskb_may_pull(skb, sizeof(*ip6h) + ntkoff) at the top of tcf_csum_ipv6()
has succeeded, which leaves avail >= sizeof(struct ipv6hdr).

If you would rather keep v3 to the jumbo bound alone and treat the
nextlayer check as a separate cleanup for net-next, say so and I will split
them; I kept them together because the write is reachable today and the
check is what makes that function's contract local.
