Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795303293;
	b=bK9DoZxYBVyzLOM1PGJeXJr8eRGKGLL/Oya11qL7ey6QgAxAQcxUhAuADH/WJefhz6nR
	 QhbFz2FLQ3tYVA3GuAJI+uS55ZyhgVh8CHVpR5fI/5fU2846MsuAAzaHLn0+bfHm3JUgf
	 JezKN3IzDgEHudWAMYscdXMrGwDe7wX9peOHIwvPxxvlCiKE94481o4VDkiffdEfFIbot
	 U+wc3GaeHqdmYB+2Ue/D59w2kGleskrQff4jOviMezouJ/mgxNYb6Ucv1mYcJsyjmElI/
	 D9Sezq9aRhqXCI2tLEYd1cCAu7Cq06TE5Q3l2A7Sa+sfhxTexVCVjAzTrolI2g0iIsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795303293;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer;
	bh=Aj67hpSVfvyNeY2bYAHOKOCgXRNNXNasIUFLScoP+LQ=;
	b=ib3xRkqpGfsQGEl4ptERb9h/B4huhOE10PxqZfUMJg/123XutUrblAFIxvCh700xVujV
	 q+pgqU4Z9rvEwC8fRNy1x5V524MrPC7r1iGYP6+UyZHDqdED/GEjE1UPhOMwANb5MtNnP
	 Tl6nG0fkBczaAmFyvJIdHF9u28o9kxWvM1Q1hgJxMpe1zAg3hRUTwvf/eJToqhisGzwZ3
	 4giAKKvAsa0wuqB6gOKC9arJKcRxzKU0rtSKiF2WFym88X3KalDAoNmEONlLY59anjo57
	 I6M6oijBMA3eDy/tfWx3KeLLv0njva4AnAbKo+V5cAO8oIlhbO31aeytErGV/YTseJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CMbgGIOg;
	arc=none smtp.remote-ip=95.215.58.4
Received: from mta1.migadu.com (out-4.mta1.migadu.com [95.215.58.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C850C606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C850C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CMbgGIOg
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+1izkUncMumyUej9MQnzVY6Io8Kc1oNzUryCzKqQJWg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795303290; v=1; x=1795908090;
 b=CMbgGIOg067l8ATcf9G8UhOG7NsSRBjB4LrQQCIxsfQOy4O8y0asCazw/fKJHwwUT2prykPO
 QOmsEeD4BzsrBnLbZTlD2hr8oEcKqUljaXaxqQq62EwOyNIEmQpRcYbPBLGi59ecEQwaqO1J2QP
 RDoGsoI0p9yX6jpQYbI9qUx0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b4e59da960c162c4;
	Sat, 21 Nov 2026 23:21:29 +0000
X-Mizu-Trace-ID: b4e59da960c162c4
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Subject: [PATCH net-next v5 0/4] net: make moving a device to another netns
 cheaper
Date: Sat, 21 Nov 2026 18:21:18 -0500
Message-Id: <20261121-bug-net-netns-move-rcu-barrier-v5-0-100a3b5d9090@linux.dev>
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
X-B4-Tracking: v=1; b=H4sIAG4nAmsC/43Py2rDMBAF0F8JWldBL+vRVf6jdCHJY0cQ20Wyh
 UPwv0dRFjXduItZXIY5l3mgBDFAQp+nB4qQQwrTWELzcUL+ascecGhLRowwSQmV2C09HmF+zZj
 wMGXA0S/Y2ViciFtjtJfcNJoTVJCfCF1Ya8EXet+tM/oum2tI8xTvtTnTuv9vSaaYYEEb1SqjZ
 aO7Sz/YcDv7aah0ZnvOHHKscE6CU0oTLwz7y/FfjpJjjhdOEi1c7Xf8cgvjsp5byG9O7DiqDjn
 xepYD9ZZY61W357ZtewK0fm6DwwEAAA==
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 Nikolay Aleksandrov <razor@blackwall.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, Ralf Lici <ralf@mandelbit.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
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
  per trial        886 (399-6542)                   0    -100%

Creating 400 netns, each with a veth pair whose host end is moved back
to the initial netns, a tap device, addresses and routes, in a guest
with 4 CPUs online, median of 5 runs:

               before (netns/s)   after (netns/s)   change
  1 thread                   27                31     +15%
  4 threads                  37                48     +30%
  16 threads                 67               103     +54%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
V4 -> V5:
- 1/4, 2/4: publish each value drawn from the shared sequence with a
  cmpxchg on the netns counter, drawing again if another bump changed it
  first, instead of storing it with atomic_set(). This keeps the routing
  change ordered before the new value and the value before the nodes
  stamped with it, and keeps a stalled bump from overwriting a newer
  value, so rt_genid and fib6_sernum stay monotonic per netns (Ralf Lici)
- Rebase onto net-next and remeasure

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

v4: https://lore.kernel.org/r/20261117-bug-net-netns-move-rcu-barrier-v4-0-43e1ca0aac7f@linux.dev
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
 net/ipv4/route.c            | 36 ++++++++++++++++++++++++++++++++++++
 net/ipv6/ip6_fib.c          | 28 +++++++++++++++++++++++++++-
 net/ipv6/route.c            |  6 +++++-
 6 files changed, 84 insertions(+), 7 deletions(-)
---
base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
change-id: 20261016-bug-net-netns-move-rcu-barrier-d998c6395830

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

