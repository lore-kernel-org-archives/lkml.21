Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795303308;
	b=ZSYIvjHR6IfiUA6i4zuW8rVCt4DIz5waq4SzSeXBPBgVVYmQKITz/iv6YC56VrHtmYBe
	 DpoKGhAejEqXvQg9PTylmTgY1v83xy4NC35P3luWczzQkyo5vXYZwLZxl9hLaYA7NuiAo
	 L1YaW5k+gAvMp/DQSQ2Y9RYS8UDkEatmPIxKjrx7OyIR2r0aVZSwwakBeWsE16TtREluH
	 fXsq3HAdX5/wTp/NJ+BtyqX6axn6u9qP7Sp2JxY01JKpGEKWIlYqHpeCLkhN0M3WwAVmT
	 vhP7bHM2wINBm8Ao8eHk86fP/4ybml7F6YNtEnCx1FbPVhxKWWkvLyEHXs8YyU3YccA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795303308;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=CeRmkXb4PaO+jzA+zVIO/f6aAfAmNuevRYNzWo5MlYc=;
	b=mQlwkvYbx6yRGNjyC87VBN+b76ehH+JkEAyDsnpAGICox3pYjxMR8txbJVKNV0ZlzUqd
	 IsH8u0Jm8ODAdyggUTStpCG5lVZNvH3RAzxkjfo6S4ZpoiPg3988/nJYMUo5iBibRtiDc
	 SJgjbxMqyB3OGROmizvGsZWJj45pSIPcc8VjzDFu5Bf1RMLWUeI2Fwb7BJ4qJzHwthh2t
	 VMbC23XJI2Bpydjsx/SzaZ56bYyAduhioKWPc5ZqOe3eYXa2obD+Zr1f7BMhw/pyqjIC6
	 ArlLXwx57Iidj5fPIM066DzUV1wz6o5J6057q25iyUVlVp1J1fK4Gz4vLzlGGLS5kcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NMw2xf2q;
	arc=none smtp.remote-ip=95.215.58.22
Received: from mta1.migadu.com (out-22.mta1.migadu.com [95.215.58.22])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E212606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E212606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NMw2xf2q
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hm61AzN/MAJszg1nQNhYCz6kJuFkbVQtftEGzmQdmDk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795303306; v=1; x=1795908106;
 b=NMw2xf2qjvWfL8XJKyJwUglsH9z+WHrBF+WPQ7ioM8bXKF9ohNkRGLXbUZMGAPZjZ+k1s6PJ
 l+x2JTkZcobUGfKZRdSlp3BX6xb861/HXqRmQs1GNfJ1Wl4V4PYuyXFlbsmGl+j0oaRX5lKymjl
 ZkR67yLY6WvkcPztZ3wmPmiQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 21ba8d938a5604e2;
	Sat, 21 Nov 2026 23:21:46 +0000
X-Mizu-Trace-ID: 21ba8d938a5604e2
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Sat, 21 Nov 2026 18:21:21 -0500
Subject: [PATCH net-next v5 3/4] nexthop: release cached routes when a
 nexthop leaves a group
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261121-bug-net-netns-move-rcu-barrier-v5-3-100a3b5d9090@linux.dev>
References: <20261121-bug-net-netns-move-rcu-barrier-v5-0-100a3b5d9090@linux.dev>
In-Reply-To: <20261121-bug-net-netns-move-rcu-barrier-v5-0-100a3b5d9090@linux.dev>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 Nikolay Aleksandrov <razor@blackwall.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, Ralf Lici <ralf@mandelbit.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

When a nexthop is removed while other members keep its group alive, only
the group array changes: the routes through the group stay in the FIB,
and the dsts they cached through the removed nexthop are released when
that nexthop is freed, from an RCU callback.

Until then those dsts stay valid. IPv6 route exceptions, such as the
ones created on Packet Too Big, are checked against the cookie of their
FIB node, which does not change, so a socket keeps sending through the
removed nexthop. When the nexthop goes away with its device, removing
the device's IPv6 addresses usually flushes the routing tree first, but
not when the device carries no IPv6 address.

Once all readers see the new group arrays, release the per-cpu routes and
exceptions of a removed IPv6 nexthop, as replacing a group already does
for its old members, and flush the IPv4 route cache once if any of the
groups carries IPv4 routes. The routes using the nexthop directly are
already gone at that point.

A connected UDP socket in netns A sends to a route through group {nh 1,
nh 2}, on an IPv6 exception of nh 1 created by Packet Too Big, while nh 1
is deleted. Datagrams still sent through nh 1 after the new group is
published and before nh 1 is freed, 10 trials, median and range, the
ones left after the change being sent before the dsts are released:

                     before (datagrams)   after (datagrams)   change
  per trial            2832 (390-3805)            1 (1-6)     -99.96%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 net/ipv4/nexthop.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/net/ipv4/nexthop.c b/net/ipv4/nexthop.c
index 42e55b5a755ee..3fccd4f2f916b 100644
--- a/net/ipv4/nexthop.c
+++ b/net/ipv4/nexthop.c
@@ -2116,6 +2116,7 @@ remove_nexthop_from_groups(struct net *net, struct nexthop *nh,
 	struct nh_grp_entry *nhge, *tmp;
 	LIST_HEAD(deferred_free);
 	bool need_flush = false;
+	struct nh_info *nhi;
 
 	/* If there is nothing to do, let's avoid the costly call to
 	 * synchronize_net()
@@ -2130,6 +2131,20 @@ remove_nexthop_from_groups(struct net *net, struct nexthop *nh,
 	/* make sure all see the newly published array before releasing rtnl */
 	synchronize_net();
 
+	/* Routes through the groups can still hold dsts cached through @nh,
+	 * which are only released when @nh is freed. Release them now that
+	 * no reader can pick @nh from the old groups any more.
+	 */
+	nhi = rtnl_dereference(nh->nh_info);
+	if (nhi->family == AF_INET6)
+		fib6_nh_release_dsts(&nhi->fib6_nh);
+	list_for_each_entry(nhge, &deferred_free, nh_list) {
+		if (!list_empty(&nhge->nh_parent->fi_list)) {
+			rt_cache_flush(net);
+			break;
+		}
+	}
+
 	/* Now safe to free percpu stats — all RCU readers have finished */
 	list_for_each_entry_safe(nhge, tmp, &deferred_free, nh_list) {
 		list_del(&nhge->nh_list);

-- 
2.43.0

