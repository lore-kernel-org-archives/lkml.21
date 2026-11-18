Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968919;
	b=F4aaozm/hZWfACWiT3ABR7L86uIpaWNnNvirrlbKzbd7V4+19aDPGG7h8cR4ZjpSJ+c9
	 JRTvYEss7LyWaRnEM63G9h2wwDSvG1UW/WC5PSGT2RgnqGI1GAgDd2E5PoQmxX1pDWy2Q
	 pqU6ix7E5gC1s0nUo8vKNslmYg332rukqweVdZ9fO+e7bwO0lByiETC9gaPBgIEPIyAVH
	 oTSTfzN8JzBsql8jA7LZEwOVa3J0lttRtTTUwSUKnYmPYFsSr8fC2/Oc6sUEKrrtjwVQF
	 3wA36SpNs53sYz3RxQjsgs2xMrnTM8lY1Pdp/BiG0z3skKzGEk9Vn6tnjxWtoMCB7Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968919;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer;
	bh=piadX7DCQN7dnI1PWSYyjQ0A0vL4PpkN2uWmi7fyHSE=;
	b=aC1zDmdzR0jd1J3o39ecYImhrJQ11FVSu6pg78+nidxkIdQHJD8sX5xP0Y5CvqwHIikr
	 c0/faCcodamjcj90PzsZibc/p6lrzpXsau4zY+PIFJj5/PRqQvVwNWlV0/0+jw+HXcE9t
	 RjxqTnXlSmZa2u8+paBM8cDU984stgov5PymbfJBPPQUyitUYDOHD6c+zhEUShcuYdI2/
	 JdN9LcuMHOMAFLeUhPVt8iLIeWMCv7UHz7t/yVFRMSvJthoea2w+desMO4oDEW7TSgNp2
	 wt4MxXdHO89taaKKs9w4yRy5EClPy1y8c6NJMaqRSs0qOc1HcUsugGGr+gvRnL55fHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BDGvkxjs;
	arc=none smtp.remote-ip=91.218.175.162
Received: from mta0.migadu.com (out-162.mta0.migadu.com [91.218.175.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29C1606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E29C1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BDGvkxjs
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OktuLr0DwTw9RYjPY5fkZ8QC4ABTj/yCvojAgRbuM78=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794968916; v=1; x=1795573716;
 b=BDGvkxjs26vSVWd4EUkPQjjmrlssG/GZgx/5v/ZZEZvErLLHacjhlAbpYb8D5drihczG9Zob
 wCWcNZgAlOGL5GR1IHPq3eQZd8BHYKvcQ8xCu8GD+WgdxcaQxq5vK/Vol7Cido21DrKituZn1IT
 hxnF3ZvSByCdSllLY9vPJFXE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c63383c44b5772d0;
	Wed, 18 Nov 2026 02:28:36 +0000
X-Mizu-Trace-ID: c63383c44b5772d0
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Subject: [PATCH net-next v4 0/4] net: make moving a device to another netns
 cheaper
Date: Tue, 17 Nov 2026 21:28:29 -0500
Message-Id: <20261117-bug-net-netns-move-rcu-barrier-v4-0-43e1ca0aac7f@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE0N/WoC/43NTW7DIBAF4KtEs+5E/NgYuso9qiwMnjhIMa7AR
 q4i3z2ELlp1ky5m8fQ037tDougpwfvhDpGyT34OJTRvB3DXPoyEfigZBBOKM67QriMGWp4XEk5
 zJoxuRdvH4kQcjNFOSdNqyaAgn5EufqsDH/D9ty1wLs3Vp2WOX3U589r/dyRzZNjwths6o1WrL
 6dx6v3t6Oap0ln85sxLThTOKrJdp5lrjPjLyR+Os9ecLJxiurF138rTzYd1Ow6U4bzv+wPYCo6
 WdAEAAA==
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 Nikolay Aleksandrov <razor@blackwall.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

Moving a device to another netns waits in rcu_barrier() with RTNL held.
Container and sandbox managers move one end of a veth pair for every
new network namespace, so this barrier limits how fast such namespaces
can be created on the whole system, to about 70 per second with 4
CPUs online however many threads create them.

The barrier was added for NETDEV_UNREGISTER_FINAL, which is long gone,
but it still keeps cached IPv4 routes through the moved device from
being accepted in the old netns, and it lets the RCU callbacks of the
nexthops removed with the device release their IPv6 route exceptions
before the move. Routes through nexthop objects are not fully covered by
it: their cached dst entries are released by an RCU callback queued from
another RCU callback, so a socket in the old netns can still send
through a device that now belongs to another netns whenever the route
generation numbers of the two netns happen to match.

Patches 1 and 2 draw the IPv4 rt_genid and the IPv6 fib6_sernum bumps
from sequences shared by all netns, so a cached route no longer matches
another netns. Patch 3 releases the cached routes of a nexthop when it
is removed from a group, instead of leaving its IPv6 exceptions valid
until it is freed. With these, nothing relies on the barrier, and patch
4 removes it.

Without patch 3, removing the barrier lets a socket keep sending through
a moved device that carries no IPv6 address and is a member of a nexthop
group, until its exceptions are released. Datagrams a socket in netns A
sent through such a device after it moved to netns B, 10 trials,
median and range, with patches 1, 2 and 4 before and 1-4 after:

               before (datagrams)   after (datagrams)   change
  per trial       1044 (444-7789)                   0    -100%

Creating 400 netns, each with a veth pair whose host end is moved back
to the initial netns, a tap device, addresses and routes, in a guest
with 4 CPUs online, median of 5 runs:

               before (netns/s)   after (netns/s)   change
  1 thread                   30                32    +6.7%
  4 threads                  40                48     +20%
  16 threads                 69               110     +59%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
V3 -> V4:
- 2/4: reject the initial fib6_sernum in rt6_is_valid(), which a route
  can record while fib6_add() has published it but not bumped the sernum
  yet (Sashiko review)
- 3/4: release the per-cpu routes and exceptions of the removed IPv6
  nexthop instead of bumping the IPv6 sernum once per group, and flush
  the IPv4 route cache at most once; this also drops the forward
  declaration (Jakub Kicinski, Sashiko review)
- 3/4: with the exceptions released when the nexthop leaves the group,
  4/4 no longer lets nexthop_free_rcu() remove them after the old netns
  freed its rt6_stats (Sashiko review on 4/4)
- Drop the Fixes and Reviewed-by tags (Jakub Kicinski)
- Rebase onto net-next and remeasure in a 32 vCPU guest with 4 CPUs
  online, so the netns creation rates differ from v3

V2 -> V3:
- Add patch 3: flush the cached routes of a group when one of its
  nexthops is removed. Without it, patch 4 lets a socket keep sending
  through a moved device that has no IPv6 address (Sashiko review)
- 1/4, 2/4: say that cached routes carry values drawn from the sequence
  because inserting a route bumps it, not because NETDEV_UP does, and
  that this holds until the sequence wraps (Sashiko review)
- 1/4, 2/4: add Kuniyuki's Reviewed-by, the code changes only in comments
- 4/4: commit message only, keep Eric's and Kuniyuki's Reviewed-by
- Rebase onto net-next and remeasure in another guest, where the barrier
  costs about 4 ms per move instead of about 10 ms, so the gains are
  smaller than in v2
- Send from my linux.dev address

V1 -> V2:
- 2/3: keep the initial fib6_sernum of each netns and never hand it out
  from the shared sequence, instead of drawing a value at netns creation
  (Eric Dumazet); 1/3: do the same for rt_genid
- 2/3: note that fib6_sernum is no longer monotonic per netns (Eric
  Dumazet); 1/3: likewise for rt_genid
- Drop Kuniyuki's Reviewed-by from 1/3 and 2/3, which changed
- Rebase onto net-next and remeasure

v3: https://lore.kernel.org/r/20261109-bug-net-netns-move-rcu-barrier-v3-0-6084b02610b3@linux.dev
v2: https://lore.kernel.org/r/20261019-bug-net-netns-move-rcu-barrier-v2-0-b6eb7780c492@gmail.com
v1: https://lore.kernel.org/r/20261016-bug-net-netns-move-rcu-barrier-v1-0-4157d798658f@gmail.com

---
Qiliang Yuan (4):
      ipv4: draw rt_genid from a sequence shared by all netns
      ipv6: take fib6_sernum from a sequence shared by all netns
      nexthop: release cached routes when a nexthop leaves a group
      net: remove rcu_barrier() from __dev_change_net_namespace()

 include/net/net_namespace.h |  5 +----
 net/core/dev.c              |  1 -
 net/ipv4/nexthop.c          | 15 +++++++++++++++
 net/ipv4/route.c            | 21 +++++++++++++++++++++
 net/ipv6/ip6_fib.c          | 16 +++++++++++++---
 net/ipv6/route.c            |  6 +++++-
 6 files changed, 55 insertions(+), 9 deletions(-)
---
base-commit: c432f1c3b529be7fdaa5c08feeeb640b6e144745
change-id: 20261016-bug-net-netns-move-rcu-barrier-d998c6395830

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

