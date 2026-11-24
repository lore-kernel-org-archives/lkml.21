Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795479292;
	b=wgisDG1/Jniz8NbzpQAA+YCnNqfchcOFKaEhy8NAJcNciz6wINlOVLNcCOsUgVKvNTRS
	 TzaUSJuNjyIZ4qWjtt8xfecaPho/o+kbYRmQdPs1GtpcAhgvqZJSbL7KhdUOM9tIz8lge
	 yF3n/SATLKm9jhNdMkSN9jmrHV2oq5W+nA16yCK4Bhi0ssIlPb5onjmkpeQhvZdHUxImj
	 7H/Sl3tpFRzKYlPjOE55pLeozrCdIwlIoTxujwAdZnQz1RVacUao6zn+Q74a4YjEKkv44
	 BKizCDMN6gAezAS2W8Bu3ZVAU3rqjsvZjw0YWT5/t/Fxr2qTy0CDOxJADXuSYEUuZ2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6XVZ2NiwhlknfYaEdDrlA5ehy0/PYDAe60GW8QDF+Jg=;
	b=BQizbgKVqlMSAOfBRq1A6ltd4/xICZPfSE98yHwdY/J8RuC131uiUEm1JnICU/DD6WhJ
	 +OdlVIpF6rQ+NLothV+xoBJC7btqMT4AQZYZAFpXJyxlTUlVVVOoAR81gE/ucdeXQp2pY
	 1WILCpnRWUDegtltjv2mDx/QOmojx5NJJk2biVVdNmyvk3JiGjiP4uU9flfUF3dOC0R2g
	 qRa8FLyaADOVDf9pbObpnWJL9Tv27PYw0I3HoT4fO7lZJTX4o36Gq4LYv6JwqW4WT3t61
	 TAybPnE8r56V1GihUj+NpxV5E9HyTbRMzyazihDeWU6NYSxzkvGsrCyr4vVQ1EjQpGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A4QlAUdg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5719606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5719606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A4QlAUdg
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-92130d3ee15so40256996d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:14:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795479291; cv=none;
        d=google.com; s=arc-20260327;
        b=dW0X+J6n8TTLhcur6FuQNBsAqGYnLo7Kyp3GCPJb0y6/9JmL+FIDdZLg6OO0nwzZht
         Jk5yEXSXCuEHByNZmJP6+2JDVsho/S+2y+iH+EdXW095m8ZfbW+0b9S2YQ/KLZZ7lld9
         8C4QixAknXMyBZhcxtWfGfs1AgE1KAAx+dzBedHXaGCXGNyiuZ5zp29uk2iUYaBJZEhF
         8PcI/odqyXIaV2tGk4x/fxGqemvWOEqojEdHoBvDL1jQKnDqAuAYCJpRgupTUOTU0rW7
         hAFuslzySlrc99a0LLMjJftoXIybQMb5MBc9PNOKDczZ+98qHYA4eQYgvcBngdGgMLl1
         jQMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6XVZ2NiwhlknfYaEdDrlA5ehy0/PYDAe60GW8QDF+Jg=;
        fh=TqCqUOLdG3eOZF+uuJjhaavct1Na1xeispnxB+skh1U=;
        b=ie7v8Ob1aF0ypSv3V06WZCwlzA+aFq7BBCOpQr3fH1sN32Oc0l2vaGWpSIiBxKsdD+
         Ckf1O9tiogqJJeQMEw1bkSPnwwGHput4llzYsDY6z8GaQBt6HGQ2WRyMPyXzX+9R7461
         gHGMtKHkqdIMd6G3FCREauVw0LBYlmAIt6wRmLZqEM21TgdBexnV6+1Vfs9L8TAOCQLM
         eBwRdllQFV9BCjcDmzg+9wq1H3qwoRu/EvWETsh7SqvcFJ2LQU3T0KddAL8PMCOY05Og
         ntlSSTSi5nEMuU7mBxIfus8rGYo8Zq7qG77KTuVRwaAY2P6BkR7Krlw22cbg+8PB8c8z
         6BAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stellman-greene-com.20260707.gappssmtp.com; s=20260707; t=1795479291; x=1796084091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6XVZ2NiwhlknfYaEdDrlA5ehy0/PYDAe60GW8QDF+Jg=;
        b=A4QlAUdgzcP4QQMusPEGIU7gYufXHiTJ8so/+IqtSIsFx9qdWKy+wWPDSyd2xBim7O
         em9Hzsbp4eF2QgZ4E/ZOCukj+tpJjX+cmpgVdlWHIUjhj1jAlb1OeGkCeyVNS4DDCAX/
         BYFeDw8AXnCxqpICZ+V6oLllWqiAs5S/z5inSGFNlLzh11DcYuyxugkaJJCXppU809jS
         Eva34bxzf2Ia5lO7ZiS8JMaQuPY3f6nhf4Vcby57ik8Usmh4IlaDvHJ9FU5rTZ4sczsN
         C37xoJWsTpyn/8InYUPjfzMV3kamioT6+DwmuyZ0CLYB8W4zZfAq5/uvoamQOrjYcfV4
         c0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795479291; x=1796084091;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6XVZ2NiwhlknfYaEdDrlA5ehy0/PYDAe60GW8QDF+Jg=;
        b=Oqp+iwxxcf56tGC44cIXOiaXkntWCWCKO83yMGizHZ+KxoKmoOQ6PvSfr8AxzeoJgc
         vFkb13phnYrvLQ8wwOf5ywnET4rtm5U6sLRSBowNzwg0QI5601zluNl1rJQ+Szq2VHgD
         j0KWpMPD4ay18JdYY77pJ4zPEz8IuUKOLbak/i3ln05MLfG5mLpuW34W67j2qSdk8r/X
         scGVMr9Yii5hLaFqIhwdPciKq51dQrvywGouSzy2k5TmVBNt239WGygqZKVhS8G+fYkD
         OnDvB1iXB4Qbg70Rgg6d3Sjohn2bXDtFl6pJQZefSoGajESs6WhfPX55lmOntEKuLxET
         G9ug==
X-Forwarded-Encrypted: i=1; AL+hErHMLX9ybgrrLZiF4/PDfEPjVd0gd0eUPTp9hSnOCZEgvqCwt58T5EFFHcHbtaMDcJfYvCQL8nI5DfpYLoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yYXy5+5EtlYXx5bu89Py2bBu9JSyxpKYW8SVELIUhJo5EUjQO
	ucggOJmUdw7ZsdtgKm3Iym6o+YSlUJx/DkANLqkH85RN0bcI854Cf+iySSkxsLQQPinhzJcrA6z
	2ixQVJONtqYUb64+vi/Zt9vEl/hJe4Xw=
X-Gm-Gg: AZFdTZfCQbraSpx7JrYATnEccoic3zFTz7OzObrn813WspP262OGFtamrP5PxWHJ1o3
	7ZoJpMTG+P/7rHT6A0gA422riun/WuNnK5q58wFNY/oQJL3Gp+n2qd9cI7iz+h7XZrTDWaAMq06
	GhxiSGia2grgDNIWy12VHfHRhgXy+AdFjFPFcfs/4KUtEr9v6AfjjcPk67va5xh+dFbdyD5OhNJ
	W2fb1jPEM6DBpf07M6/PaL11mcHlGjDAgxV1eYvvVMD9pZAdlIHRFaBJ2JnOYMQwbZLRsx3rBo0
	+7Dfwn8Vn/AfGy52tF986wOUZoUqcf5fNVy0WdUizUZ0V5cOJq3JAqroQar7W7vckV71gAtuQ+C
	SoTcOrL7xEmfKl1oQEkxNzM8ollN59aGiBiA96Q8UF2vkAcJJfmmQs0o9c9d72uay3fHgkxmcyQ
	7b8SzJQ93I/BXtIe7NV9l0Ey18po712uaWM4GDl1Azc0qP8wpywX4K8eCqZ3r/kdVvyvauE+593
	PrJaw4vMIFTWzPF/A==
X-Received: by 2002:a05:6214:85d4:10b0:921:2397:15c0 with SMTP id
 6a1803df08f44-92134aae88amr174798896d6.9.1795479290741; Mon, 23 Nov 2026
 16:14:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122233958.10462-1-astellman@stellman-greene.com> <179547862919.3135.6087887655063297728@kernel.org>
In-Reply-To: <179547862919.3135.6087887655063297728@kernel.org>
From: Andrew Stellman <astellman@stellman-greene.com>
Date: Mon, 23 Nov 2026 19:14:39 -0500
X-Gm-Features: Aa3M54r8LqYwCwZHSInNPFAsZl3pmCroukwtjzOFoNnEUp-H2sQ6lvQOIHcivKs
Message-ID: <CAChPuV88P4Uf8BBxAhrM044ozX21ZCiPqn4J3-vLc-x_Gz_wiA@mail.gmail.com>
Subject: Re: [PATCH net] tipc: free the tunnel packets when failover
 tunnelling stops early
To: netdev-bot+sashiko@kernel.org
Cc: jmaloy@redhat.com, tung.quang.nguyen@est.tech, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	tuong.t.lien@dektech.com.au, ying.xue@windriver.com, netdev@vger.kernel.org, 
	tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Agreed: that return also skips the FAILOVER_MSG hand-over, and goto
out is safe there since tnlq is already initialised and empty. I'll
include it in v2.

pw-bot: cr

On Mon, Nov 23, 2026 at 7:03=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The patch leaves one early exit in tipc_link_tnl_prepare()
>   (net/tipc/link.c) that still skips the FAILOVER_MSG receive-side hand-=
=E2=80=A6
>
> --
>
> tipc: free the tunnel packets when failover tunnelling stops early
>
> The three early returns inside the tunnelling loop of
> tipc_link_tnl_prepare() now jump to a new out: label. That label purges
> any tunnel packets left on tnlq. It then runs the FAILOVER_MSG receive
> side hand-over (drop_point, failover_reasm_skb, deferdq).
>
> > diff --git a/net/tipc/link.c b/net/tipc/link.c
> > index 6427c69f89294..2fead2f4ed0fa 100644
> > --- a/net/tipc/link.c
> > +++ b/net/tipc/link.c
>
> [ ... ]
>
> > @@ -2073,6 +2073,9 @@ void tipc_link_tnl_prepare(struct tipc_link *l, s=
truct tipc_link *tnl,
> >               }
> >
> >       tipc_link_xmit(tnl, &tnlq, xmitq);
> > +out:
> > +     /* Empty unless tunnelling stopped early */
> > +     __skb_queue_purge(&tnlq);
> >
> >       if (mtyp =3D=3D FAILOVER_MSG) {
> >               struct sk_buff_head *fdefq =3D &tnl->failover_deferdq;
>
> [Severity: Medium]
> The commit message says the fix is to "go on with the hand-over" when
> tunnelling stops early. Should the earlier exit, taken when the dummy
> packet can't be allocated, also jump to out?
>
> That path in tipc_link_tnl_prepare() still returns directly:
>
> net/tipc/link.c:tipc_link_tnl_prepare() {
>     ...
>         skb =3D tipc_msg_create(TIPC_LOW_IMPORTANCE, TIPC_DIRECT_MSG,
>                               BASIC_H_SIZE, 0, l->addr, tipc_own_addr(l->=
net),
>                               0, 0, TIPC_ERR_NO_PORT);
>         if (!skb) {
>                 pr_warn("%sunable to create tunnel packet\n", link_co_err=
);
>                 return;
>         }
>     ...
> }
>
> tipc_msg_create() allocates with tipc_buf_acquire(..., GFP_ATOMIC), so it
> can fail under memory pressure. If it fails for FAILOVER_MSG, this code
> never runs:
>
>     tnl->drop_point =3D l->rcv_nxt;
>     tnl->failover_reasm_skb =3D l->reasm_buf;
>     skb_queue_splice_init(&l->deferdq, fdefq);
>
> The caller goes into failover anyway:
>
> __tipc_node_link_down()
>     tipc_link_tnl_prepare(l, tnl, FAILOVER_MSG, xmitq);
>     tipc_link_reset(l);    <- frees l->reasm_buf, purges l->deferdq
>     tipc_link_fsm_evt(l, LINK_RESET_EVT);
>     tipc_link_fsm_evt(l, LINK_FAILOVER_BEGIN_EVT);
>     tipc_node_fsm_evt(n, NODE_FAILOVER_BEGIN_EVT);
>
> tnl->drop_point then keeps a stale value. That is 0 from link creation,
> 1 from tipc_link_failover_prepare(), or whatever an earlier failover left=
.
> tipc_link_failover_rcv() then does this:
>
>         if (unlikely(less(seqno, l->drop_point))) {
>                 kfree_skb(iskb);
>                 continue;
>         }
>         if (unlikely(seqno !=3D l->drop_point)) {
>                 __tipc_skb_queue_sorted(fdefq, seqno, iskb);
>                 continue;
>         }
>
> Could this drop the peer's tunnelled messages? Could it also leave them
> in failover_deferdq for good, since drop_point only moves forward on an
> exact match?
>
> tnlq is already initialised and empty at that point, and the out: block
> only touches tnlq, l and tnl. So changing that return to goto out looks
> safe.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261122233958.10462-1-astellman%40stellman-greene.com
