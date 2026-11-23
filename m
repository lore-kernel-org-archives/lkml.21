Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.237
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414631;
	b=QGHFItz1iUlxhVY7zIluRbxPqKCk0qP10o+gB1FEHU7q5F1yA8fqC2xAbqPBrPS/nDdo
	 rL/aSHGJFJIiwpXNyYnlNN/ozXeixjnfzK+yQvkj+P9WFbtw8wGrMjG1vrw7tDulshvW1
	 QdG4ut50LBFAs0+Kiq1TGyaDtzXOvkpTKYGdJSM77KTD47QLTUFVfLGk6NJvtUPSy+94V
	 mYnVx10oIqzd9u04ShT1tTxiBnzGJxATEcFl5w2bXBzUbILLEBO9S+gaDLntEdeJj7iNB
	 cOHnMdZOOAG/ErNIV3oVt8QmjApRekOJS/68jB0WHUMNS3jLTrcwRy46FACAYsuILVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414631;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1rBLAy1WSlW0j01EGSb8zQ3VnNxACKn1ffYhnDM1Amc=;
	b=NRhaMf5nbQIiMQsURlaqgKVzOpJIfhiw11UvgTWN36uPCrksg0V7fIvjUgQvav69GgFj
	 aOA2Vt+WOTCRSoRV5GB0bmsIATSA7wPs1X8Dex2awXsDts2lfHDNZlv8zZMsJaEo/m0lL
	 qXs1GkF36wWgvIws1kmgv8bs95gUigO4ODRpkes0sCDjx+OLWR87XlsWjQbwhVydo8Q/h
	 xO2mNHzTyIZuIf+G32EHSGskky3NdQeqvffBL26gdM7U0KOc8Vb/fMFWeDtMDy5OqVqeM
	 erK+iAQEckj3nAZsnyFhZvOnqv2arxRSCDHfacpgwclfXER8uOH0r4sJMPK3xrdFP8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jTbojTpp;
	arc=none smtp.remote-ip=95.215.58.237
Received: from mta1.migadu.com (out-237.mta1.migadu.com [95.215.58.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11936606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11936606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jTbojTpp
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=giOvSHAOr8ZRxE8MoHsdh6XZLWVdDYWU10lBTFdDrrI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795414629; v=1; x=1796019429;
 b=jTbojTpptxj2VJj9BzxK8exnAJdDEedY8a9O1R2iFeD/tqXAVYmMcByaDtYyN2K0emA5GCnl
 yjzN4EcwRVvGWZTTa9MjGj4khtwiqrw9eUWlZ34QRdnV6qv4YxBaX8Q83qbd5X2yn4d/sB+2T/D
 ROn9qg28IT/WJ62Id+gXmn18=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 7db56b269390c286;
	Mon, 23 Nov 2026 06:17:08 +0000
X-Mizu-Trace-ID: 7db56b269390c286
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 14:17:02 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
Cc: netdev-bot+sashiko@kernel.org, David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Hangbin Liu <liuhangbin@kylinos.cn>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, 1342116488@qq.com
Subject: Re: [PATCH net-next v3 1/2] ipv6: check mc_forwarding before calling
 ip6mr_get_route()
Message-ID: <20261123061702.GJ10218@Liu-laptop>
References: <20261116014744.18223-1-sunwenbo@cmss.chinamobile.com>
 <20261116014744.18223-2-sunwenbo@cmss.chinamobile.com>
 <179509619796.3136.11845865038486249097@kernel.org>
 <20261120032219.18091-1-sunwenbo@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120032219.18091-1-sunwenbo@cmss.chinamobile.com>

On Fri, Nov 20, 2026 at 11:22:19AM +0800, Wenbo Sun wrote:
> Thank you for the detailed review on v3 1/2. We reproduced and verified each
> of the findings in a User-Mode Linux (UML) environment (`CONFIG_IPV6_MROUTE=y`)
> and prepared a focused single-patch v4 to address them:
> 
> 1. Root-Cause Analysis & Local UML Reproduction of v3 1/2 Findings:
> 
>    Base UML topology:
>      ip link add d0 type veth peer name d1
>      ip link set d0 up && ip link set d1 up
>      ip -6 addr add 2001:db8::2/64 dev d0
>      ip -6 addr add ff0e::1 dev d0 autojoin
> 
>    (a) [High] Routable multicast query when mc_forwarding=1:
>        In `inet6_rtm_getroute()`, `skb->dev` is never set on the newly
>        allocated reply skb, and `ip6mr_get_route()` looks up
>        `ip6mr_cache_find(mrt, &rt->rt6i_src.addr, &rt->rt6i_dst.addr)`, where
>        `rt` is the per-CPU route copied from `f6i->fib6_dst` (`ff00::/8`).
>        We reproduced this in UML by opening an `AF_INET6` `SOCK_RAW`
>        (`IPPROTO_ICMPV6`) socket, enabling `MRT6_INIT`, registering `d0` via
>        `MRT6_ADD_MIF`, and adding `(S=2001:db8::3, G=ff0e::1)` via
>        `MRT6_ADD_MFC`:
>          MRT6_ADD_MIF(mifi=0, pifi=3) OK
>          MRT6_ADD_MFC(S=2001:db8::3, G=ff0e::1) OK
>          mc_forwarding=1
>          $ ip -6 route get ff0e::1 from 2001:db8::3 iif d0
>          RTNETLINK answers: No such device
>          ip_exit=512
>        Because `ip6mr_get_route()` checks `(::, ff00::)` instead of the
>        queried `(S,G)` and `skb->dev` is NULL, it misses even when the MFC
>        entry exists. Making `mc_forwarding=1` MFC queries work requires
>        passing `(src, dest)` and handling `skb->dev` / `skb_realloc_headroom()`
>        across `inet6_rtm_getroute()` and `ip6mr_get_route()`, which we now
>        explicitly state as out of scope in the commit message and drop patch
>        2/2 in v4 so we do not alter the uAPI errno to -ENODEV prematurely.
> 
>    (b) [Medium 1] Regression when a multicast query matches a non-multicast
>        route (e.g. `::/0`):
>        In v3, replacing `ipv6_addr_is_multicast(&rt6_dst->addr)` with
>        `ipv6_addr_is_multicast(mc_dst)` caused queries matching a non-multicast
>        FIB route (when `ff00::/8` is absent, such as on `lo`, an l3mdev
>        master, or after deleting `ff00::/8`) to enter `ip6mr_get_route()` when
>        `mc_forwarding=1`.
>        Reproduced on v3 in UML:
>          # ip -6 route del multicast ff00::/8 dev d0 table local
>          # ip -6 route add ::/0 dev d0
>          # (with MRT6_INIT / mc_forwarding=1):
>          $ ip -6 route get ff0e::1 from 2001:db8::3 iif d0
>          RTNETLINK answers: No such device
>          ip_exit=512
> 
>    (c) [Medium 2] `RTM_F_FIB_MATCH` (`fibmatch`) missing link-local exclusion:
>        In `inet6_rtm_getroute()`, the `fibmatch` branch calls `rt6_fill_node()`
>        with `dst = NULL, dest = NULL`. In v3, `mc_dst` fell back to
>        `&rt6_dst->addr` (`ff00::`, scope 0), so link-local `fibmatch` queries
>        still entered `ip6mr_get_route()` when `mc_forwarding=1` (whereas IPv4
>        `fibmatch` uses `fib_dump_info()` and never calls `ipmr_get_route()`).
>        Reproduced on v3 in UML (with `MRT6_INIT` / `mc_forwarding=1`):
>          $ ip -6 route get fibmatch ff02::1 from 2001:db8::3 iif d0
>          RTNETLINK answers: No such device
>          ip_exit=512
> 
>    (d) [Low] Fixes tag / net vs net-next:
>        Because this patch aligns long-standing non-crash route-get reporting
>        semantics with IPv4 (while full `mc_forwarding=1` MFC lookup in
>        `ip6mr_get_route()` remains a separate effort), we keep targeting
>        net-next without a Fixes tag, and have softened the commit message
>        accordingly.
> 
> 2. Concrete Fix in v4 & UML Verification Results:
> 
>    In v4, we converge the series into a single patch that checks `dest != NULL`
>    (so `fibmatch` queries always emit the matched FIB6 entry and `RTA_IIF`),
>    keeps `ipv6_addr_is_multicast(&rt6_dst->addr)` (avoiding the non-multicast
>    route regression), and tests `ipv6_addr_type(dest)` against
>    `(IPV6_ADDR_LOOPBACK | IPV6_ADDR_LINKLOCAL)`:
> 
>      if (dest && ipv6_addr_is_multicast(&rt6_dst->addr) &&
>          !(ipv6_addr_type(dest) &
>            (IPV6_ADDR_LOOPBACK | IPV6_ADDR_LINKLOCAL)) &&
>          atomic_read(&net->ipv6.devconf_all->mc_forwarding))
> 
>    Verified on v4 in UML (`FAILURES=0, TEST_EXIT_CODE=0`):
>    - Test 1 (`mc_forwarding=0`, `ff0e::1` with `iif d0`):
>      `ff0e::1 dev d0 proto kernel metric 256 iif d0 pref medium` (PASS)
>    - Test 2 (`mc_forwarding=1`, link-local `ff02::1` with `iif d0`):
>      `multicast ff02::1 dev d0 proto kernel metric 256 iif d0 pref medium` (PASS)
>    - Test 3 (`mc_forwarding=1`, interface-local `ff01::1` with `iif d0`):
>      `multicast ff01::1 dev d0 proto kernel metric 256 iif d0 pref medium` (PASS)
>    - Test 4 (`mc_forwarding=1`, `fibmatch` for `ff02::1` and `ff0e::1` with
>      `iif d0`):
>      `multicast ff00::/8 dev d0 table local proto kernel metric 256 iif d0 pref medium`
>      (`ip_exit=0`, PASS)
>    - Test 5 (`mc_forwarding=1`, `ff0e::1` matching `::/0` after removing
>      `ff00::/8`):
>      `ff0e::1 from 2001:db8::3 dev d0 proto boot src 2001:db8::2 metric 1024 iif d0 pref medium`
>      (`ip_exit=0`, PASS)
>    - Test 6 (IPv6 unicast with `iif`, IPv6 multicast without `iif`, IPv4
>      multicast with `iif` regressions): all PASS.
> 
> Thanks,
> Wenbo
> 

I think it worth to add a selftest to cover these testings.

Thanks
Hangbin
