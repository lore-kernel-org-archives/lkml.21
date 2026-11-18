Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794963298;
	b=FO3o3eiSzbjC4aTQ4YPugV3cAJbMj7aerZPvfwOe8ZOGD/+VfhYJ3N/8czQQm4CncvDP
	 V2HURpAqjN9Q/ry7PMwAnG+QCv4yKM0dzxqtcZP1pW1z7FlT8/c4tkzCvPhKaOlqR9giW
	 nFr67F/qp6maINl/yn6T4VmvNRS/ihOYWtVo30SsQ5IoKYcfkojIsMWITM6zgL+7Telcv
	 0dGtRgguDlHxyP7KY9GLQ4SA38k817EtLrFtJXEBXGfbkc0pep8E86btfT5T/ut4gG8uK
	 R1YBuHiGoz1zAQvOFlDCJRFHOgtc/pYC32YeWk/is1IgsBTQH+ADVh+0hVjwj4zJCcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794963298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=okrriRKI5iUmexz73yDJ3a18AbZwO0cF4iXDn3kRazQ=;
	b=Mdy+z9rq9Egy6kShQguk5zKAPs9WPEtq214InlOK4mempGliRKfghgDqmXRNf7UR7AQL
	 5tHvJXeAxgDmuLp6FVYsAxJe3u1gPhjT7XeDJ5oxlciIPg0Wt+ABrTlj01+769o4yJRk3
	 KMNYwelr+V6dYEO6WgSi8dqfBnRzhUOm5rsHz8k6qOmgmZhcuwEwJVJJYdSjuB9ZrNTly
	 5wX8dwT0z1Q84wnzQ0NQYtQMNXbx3JQBu1Tf4xJzN8qMbVPAq/oqa9whh8y9unfQDY/IO
	 bIga49aoYXHV2lC9ypnWyJtONuCzYGq3a1XD6mQjkAxiHCrY7n/0Ie4qbeE2QkSK3Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=DnTawPg1;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85421606A899
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85421606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=DnTawPg1
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b3af93b85cso186485a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1794963297; x=1795568097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=okrriRKI5iUmexz73yDJ3a18AbZwO0cF4iXDn3kRazQ=;
        b=DnTawPg1ce4RaLDbeynrZu+Qnkv80eVbkdchCGnV6bFS1DQ8ngRNCAMI5B0fzv1dh6
         C7/HHwJ9vkA2nmAghifS0SRr7MEbVixQu1MBW7LWBjC8hsv6xL20tP8uPjhBLD6VkswB
         iSMqFCJ+jm4BKT75qD7kDaWT6WHYaE0FpUz6ZEmF/BUkPRcyWHDxdy5tKufgkIvX+9tu
         jXw4Dfa9rz/LI2A5VQbgcmoDxgFet397kyu7S1SAE2lDAtmfn1O6VBvIlTqdGXJxYAkg
         tYQpgygvlmk6NaUf/10RdjG1CB8axDdgRuv8H+54vCEttkzyd1ktRzElLghu0aV4WkSy
         gHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794963297; x=1795568097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=okrriRKI5iUmexz73yDJ3a18AbZwO0cF4iXDn3kRazQ=;
        b=k/pvMriwRTFKG0Bp0HTMRFHcJKe2yxtk4GojQtyz/OYo0tdadcSTPHjMj9HmYUJVEc
         ueeFeeKf6KdrLZgrk1WWgys4qKKySbj1mzNfVLdLGh6+EYlVN6nVl42w+XSghrWIQvk0
         51uBngRvS21xF/edpOHjaXjCSd8S9teyJl8gY6ss323BVCCk+m8y2ut64ihsRzxpvyhW
         8HSpQ0bahsFiqDBTuLsOt0787mIesk9thgKrqit8DTq+gMyk2/roGYb0SSfQk0Oa33k8
         Zjya8QNk5alY+q+fKCroB9QLYv/l4NCTyJeRgnH5pJya10jgKaKpgO6A1qLUBMXyqWDK
         7K2A==
X-Forwarded-Encrypted: i=1; AL+hErHeeEY7offgKAIEe53Y/ImbZng4cbFloyJOZNekevjj6vzfbdmrKbn388ZnqoV85s11f8h/Wvu1FXhiwMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OzC/wSTH9PEfBUwdXyDd7mACOv0LjSc3fEWi9FujSmwxCGP78
	l3b86r82QjicttdQBO2/AmzcMLCzNiJoALA7WS97BGOJq/en7i2edelTCCadmgQM7w32x1y+vPf
	Sb1KOY5xi9aOCLtQrF0iTgY7pxYFug2Cza/XKiyFElwqHbWEo2vjT
X-Gm-Gg: AZFdTZcVieiYCZPdOHDD4MYV3on1cVXgvmf2RRuN8u4ujSOlFO8za2OTnkbsalo3NqL
	2L2kDWbDAPt58jPfx73KJvEniTW8YQaes2hLPeAkNH94EPPcnYRUipp4WllLBybuqkxNCSmNj/x
	o8EY95p58XhpesJLnYwo3nfBax2A5mExQZn0dgwA1MMuYXerfz5lAAtoLMXPaPSEOoTFF5EmpUV
	w2BAPW46YQRimV7aZo3vJ1v2UpASW3+lWfVFvs25A2WvPgXzvhXOzmBR6nRUWvaGXszJoohNf8Y
	G1/gbHLE8EhLulDqIQfbfX+OjwW61UewNCCFD+dqmdk8s15arhufNIhIZ1a65ntfOhRX29H6GU7
	oXSXm+3SzeNjs36RNCT3EFI5mhMc=
X-Received: by 2002:a17:90b:39a3:b0:3ac:b3ff:b476 with SMTP id 98e67ed59e1d1-3b3d07a29camr946463a91.38.1794963296708;
        Tue, 17 Nov 2026 16:54:56 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d4914caasm161524a91.2.2026.11.17.16.54.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 16:54:56 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	security@kernel.org,
	Andrii Tereshchenko <opensource@andrii.net>,
	stable@vger.kernel.org
Subject: [PATCH ipsec 2/2] xfrm: iptfs: hold the dst while a packet waits on the output queue
Date: Tue, 17 Nov 2026 16:54:49 -0800
Message-ID: <45f802a2-c639-44bd-aba0-5c81e2198c9e@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <b56bbced-a8b0-4ae9-80b4-1958ea36684c@mid.andrii.net>
References: <b56bbced-a8b0-4ae9-80b4-1958ea36684c@mid.andrii.net>
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

iptfs_output_collect() queues the skb on xtfs->queue for the delay
timer without taking a reference on its dst. Locally generated TCP
attaches the socket's cached route with skb_dst_set_noref(), which is
valid only inside the RCU read-side critical section of the transmit
path. The skb outlives that section on the queue. When TCP drops the
cached route, as it does from the retransmit timer, RCU frees the dst
while the skb still points to it. iptfs_output_queued() then reads the
freed dst, first in iptfs_get_cur_pmtu() and then in xfrm_output():

  BUG: KASAN: slab-use-after-free in iptfs_delay_timer+0x2ef/0x1900
  Read of size 4 at addr ffff888100cff01c by task swapper/1/0
  CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 7.4.0-rc3 #1
  Call Trace:
   <IRQ>
   iptfs_delay_timer+0x2ef/0x1900
   __hrtimer_run_queues+0x16d/0x340
   hrtimer_run_softirq+0x136/0x210
   handle_softirqs+0x162/0x420
  Allocated by task 0:
   dst_alloc+0x4f/0x250
   xfrm_bundle_create+0x236/0x1010
   xfrm_resolve_and_create_bundle+0x13c/0x1d0
   xfrm_lookup_with_ifid+0x303/0xe20
   xfrm_lookup_route+0x1c/0xf0
   ip_route_output_flow+0x15b/0x170
   inet_sk_rebuild_header+0x4c0/0xa40
   __tcp_retransmit_skb+0xe8/0xda0
  Freed by task 0:
   dst_destroy+0xe8/0x140
   rcu_core+0x3f6/0xea0
  The buggy address belongs to the object at ffff888100cfef00
   which belongs to the cache xfrm_dst of size 296

A NULL pointer dereference in xfrm_output_resume() follows the
reports.

Take the reference with skb_dst_force() in iptfs_output_collect(),
before the skb is queued. If the dst is already being destroyed, drop
the packet and count XfrmOutError. xfrm_output_one() takes the same
reference before it calls the type output handler; with IP-TFS the skb
leaves the RCU section earlier, at the queue.

KASAN reported this while the panic fixed by the previous patch was
being reproduced, on an unmodified v7.4-rc3 and without fault
injection. In the setup described there, KASAN reported the
use-after-free in most boots of the unpatched kernel and in no boot
with the series. Kernel selftests were not run; none of them covers
IP-TFS.

The analysis and the patch were produced with an AI coding assistant
and reviewed by the submitter.

Fixes: 0e4fbf013fa5 ("xfrm: iptfs: add user packet (tunnel ingress) handling")
Cc: stable@vger.kernel.org
Signed-off-by: Andrii Tereshchenko <opensource@andrii.net>
---
 net/xfrm/xfrm_iptfs.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 95ba73013..f5260bc51 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -1914,6 +1914,20 @@ static int iptfs_output_collect(struct net *net, struct sock *sk, struct sk_buff
 			continue;
 		}
 
+		/* The skb will wait on xtfs->queue until the delay timer fires,
+		 * and iptfs_output_queued() -> xfrm_output() then dereferences
+		 * its dst. skb_dst() can be a no-ref dst (e.g. the bundle built
+		 * for a TCP retransmission) that RCU frees while the skb is
+		 * queued, so pin it before queuing; if it is already being
+		 * destroyed, drop the packet rather than queue a dangling
+		 * pointer.
+		 */
+		if (unlikely(!skb_dst_force(skb))) {
+			XFRM_INC_STATS(net, LINUX_MIB_XFRMOUTERROR);
+			kfree_skb_reason(skb, SKB_DROP_REASON_NOT_SPECIFIED);
+			continue;
+		}
+
 		/* Enqueue to send in tunnel */
 		ok = iptfs_enqueue(xtfs, skb);
 		if (!ok)
-- 
2.53.0

