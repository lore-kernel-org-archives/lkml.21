Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.237
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782199;
	b=MFH8eNEXLcVHhsDWYt+Br+Dks3Ny42qXN9s5qPRnGlJ05DvNKl4jqv2L7ZORDDK4U2LN
	 mEb15m52f86s1S+RERqaIZULz5+AuqU0f5OiF6Gh5LQY0ItmxBw+IP7BsapPRS8IPiCwj
	 4gQgw5hUBpIfkVmHJNZQNZPODyeyTf/murT1Ch+LkpNebTS6QLSbmBrF5w3kfddc6T/Jm
	 LK5K9ifnZ19Z0tC8B8vSswfgmRgKGOOr5MjC4vlRN6u7JG+WFnTw9TBD5E0S9a/yLGhir
	 /HEdHBCmEgaYd3Y/X4hNJF8FWVfn62Tji5QWyrv3OSZQewRVNy1rD+0VEAeTR3emLwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782199;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=we26npX57rKL+VL8xivi5E7EKRh5WKL6xyTPMHFncME=;
	b=nzYBYQwVwWgxjeIZ1QvEVwX7nWGxwv1v/Nk+qi+ZNg5GcoDOnq2vnZzyOdYsMB9oCJBz
	 dw3+CLxWHpAjeiEMrkkQ0XQXeH2JTdElzTc1GaXCn954JVZ9IGJhaJ/3QJ68U4Sq/fWQ3
	 rp5IREhWV3KAA9q5e1tFROVaZ05YhLyZqHoojhuPOTOo56HACPmwsi9St99SWKBN2xObu
	 oB3c8sQbEB7MJr7WCVRA5a+D0pHFfSbkZf+JvAD83DF+bOQQ70Y1qSmc4RJXPjgiPbP4f
	 ZjN5KjQzIYHcn+LUl/c7Z8Cy3bTi1EWTmZvCcbQHbxdaIdvs86mUN2FTplMZsW+vVpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZQ3enJyt;
	arc=none smtp.remote-ip=95.215.58.237
Received: from mta1.migadu.com (out-237.mta1.migadu.com [95.215.58.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9C0606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB9C0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZQ3enJyt
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BA10GbeixydBlnD7l7DBKlHSr5quCNW2fqkr45XbMcM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795782197; v=1; x=1796386997;
 b=ZQ3enJyt7KEbqECNYjUWqm9CuJMuvWzmGYMGsfNCLdt6we75CVwrz88wsqwYH4BzicNPOUlp
 DVcwjo0Zvgc/I8ZiepVHJzl29fcYGBVAqHA0LBlqBciM/hFOzl1UbA6FPnxzLGGcQ3Qi+I3C1++
 3Lua1XtiUG61PRAuZ3RmFtAw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id adf3816c4789e0e7;
	Fri, 27 Nov 2026 12:23:16 +0000
X-Mizu-Trace-ID: adf3816c4789e0e7
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 27 Nov 2026 12:23:16 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Zqiang" <qiang.zhang@linux.dev>
Message-ID: <37ac3078817eb588433881217b273f0dfd301014@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] neighbour: Move the netdev_put() out of RCU callback
To: "Kuniyuki Iwashima" <kuniyu@google.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <au-AQ7OPf6QPyc3Q@google.com>
References: <20261009091941.5837-1-qiang.zhang@linux.dev>
 <CAAVpQUAeHP7M07uMweRePtuzPPUo-99dL6jOYUiVf7CSVUxNDQ@mail.gmail.com>
 <a951af6957fe4890d3eaaf5a661754fc259a4b79@linux.dev>
 <au99DNHQEsaaDqpJ@google.com> <au-AQ7OPf6QPyc3Q@google.com>

>=20
>=20On Sat, 07 Nov 2026 19:34:07 +0000, Kuniyuki Iwashima wrote:
>=20
>=20>=20
>=20> On Sat, 07 Nov 2026 11:47:45 +0000, Zqiang wrote:
> >  >=20
>=20>  > On Fri, Oct 9, 2026 at 2:19 AM Zqiang <qiang.zhang@linux.dev> wr=
ote:
> >  >=20
>=20>  > >=20
>=20>  > > For builts with CONFIG_NET_DEV_REFCNT_TRACKER=3Dy kernels, net=
dev_put()
> >  > > records the caller's stack trace via ref_tracker_free() for debu=
gging
> >  > > reference leaks. however, the netdev_put() is within pneigh_dest=
roy()
> >  > > RCU callback, this recorded stack is uninformative, it does not =
reveal
> >  > > which code path initiated the deletion.
> >  > >=20
>=20>  > Have you seen pneigh double-free ? What motivates this change ?
> >=20=20
>=20>  Firstly, Apologies for delayed reply.
> >=20=20
>=20>=20=20
>=20>=20=20
>=20>  Actually, I didn't see any double-free happening, just wanted it t=
o
> >  record a meaningful callstack which on release path. After all, if d=
ouble-free
> >  really occurs, the callstack of the RCU callback execution path will=
 not be helpful.
> >=20=20
>=20>=20=20
>=20>  >=20
>=20>  > >=20
>=20>  > > This commit therefore move netdev_put() from the RCU callback =
into the
> >  > > caller's process context, and replace call_rcu() with kfree_rcu(=
).
> >  > >=20
>=20>  > > Fixes: d539d8fbd8fc ("neighbour: Free pneigh_entry after RCU g=
race period.")
> >  > >=20
>=20>  > Please elaborate why your change is safe in the commit message
> >  > and remove the tag.
> >=20=20
>=20>  Does it refer to using kfree_rcu instead of call_rcu ensures safel=
y ?
> >=20=20
>=20>  I mean why dropping netdev refcnt waiting RCU gp is safe.

Hi Kuniyuki,

Do you mean that if we dropping netdev refcnt and this is the final
reference count of the netdev object, the netdev will be free when
it still be referenced in neigh RCU read critical section ?

But the synchronize_net() will be invoked before free netdev.

I am not an expert in netdev. if I missed something please correct me.

Thanks
Zqiang
=20


>=20>=20
>=20*without waiting
>=20
>=20>=20
>=20> Thanks
> >  Zqiang
> >=20=20
>=20>  >=20
>=20>  > >=20
>=20>  > > Signed-off-by: Zqiang <qiang.zhang@linux.dev>
> >  > >=20
>=20>  > nit: full name
> >  >=20
>=20>  > >=20
>=20>  > > ---
> >  > > net/core/neighbour.c | 14 ++++----------
> >  > > 1 file changed, 4 insertions(+), 10 deletions(-)
> >  > >=20
>=20>  > > diff --git a/net/core/neighbour.c b/net/core/neighbour.c
> >  > > index 6ed8eb075146..4263689fc415 100644
> >  > > --- a/net/core/neighbour.c
> >  > > +++ b/net/core/neighbour.c
> >  > > @@ -818,14 +818,6 @@ int pneigh_create(struct neigh_table *tbl,
> >  > > return err;
> >  > > }
> >  > >=20
>=20>  > > -static void pneigh_destroy(struct rcu_head *rcu)
> >  > > -{
> >  > > - struct pneigh_entry *n =3D container_of(rcu, struct pneigh_ent=
ry, rcu);
> >  > > -
> >  > > - netdev_put(n->dev, &n->dev_tracker);
> >  > > - kfree(n);
> >  > > -}
> >  > > -
> >  > > int pneigh_delete(struct neigh_table *tbl, const void *pkey,
> >  > > struct net_device *dev)
> >  > > {
> >  > > @@ -849,7 +841,8 @@ int pneigh_delete(struct neigh_table *tbl, c=
onst void *pkey,
> >  > > if (tbl->pdestructor)
> >  > > tbl->pdestructor(n);
> >  > >=20
>=20>  > > - call_rcu(&n->rcu, pneigh_destroy);
> >  > > + netdev_put(n->dev, &n->dev_tracker);
> >  > > + kfree_rcu(n, rcu);
> >  > > return 0;
> >  > > }
> >  > > }
> >  > > @@ -891,7 +884,8 @@ static void pneigh_ifdown(struct neigh_table=
 *tbl, struct net_device *dev,
> >  > > if (tbl->pdestructor)
> >  > > tbl->pdestructor(n);
> >  > >=20
>=20>  > > - call_rcu(&n->rcu, pneigh_destroy);
> >  > > + netdev_put(n->dev, &n->dev_tracker);
> >  > > + kfree_rcu(n, rcu);
> >  > > }
> >  > > }
> >  > >=20
>=20>  > > --
> >  > > 2.17.1
> >  > >
> >  >
> >
>
