Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795424655;
	b=jh8S1mLv0QKOP7Hy/I8owFztkCdbM7x1v3rR/Dw4awrdheZFX5a4WiLpTfHs8XyGvkrW
	 sINyx4NmO7K6qzT6RlX5rysjfyD6iWloftPCD1QI7lU09YjSvMUVRpyVjYn69vox38nI5
	 6JnDU8QGcDLC+HxDBdAeS0d2rYgHdD61KuAkLlSYOySU8+fVbi/EWgNPi7oacYLqr/vds
	 rlGWYS/iLAqAMmXGe1sZW20WLBWEN7cEYuR+IHT56/WIY7f1vRAZ1skwpLoz6u6Pn8QIz
	 SvvTIaoEE0h2AlpRKZ2WwmDX0d9IHhg8YvrstZk+K7mqB7reYgspVy1nEDDApQkwiUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Iahu//YmpmZyg0DhyYrw87fZlA1aEgZxAw+wZWOdpsM=;
	b=ffxqs4+gYmIAHdVvDVJIrnbS2OpC+FFxphGeMPrqBbHeWqRL/bi3lLOCI1dDAkjjd1G5
	 NtiC/M9D3RbjCrHL70cCiPD5/TSwiXFFf82ytCEWIK3j8jJ6S3NFv+797hviCOqL/VE1W
	 +gO+u2f6Cze37xNCeKcnTfjIQ1Y7SZoE5OvMX7JLR4z0ub6ZX83Erl31joDuJhZdqmy1f
	 Te5iiUqs5y3s9xEWSZEauwSLfJnCAMGrvX8rZWpC5k1KQprOj06J61aWGIr+qs/+S7mwc
	 YEADyljwxmzLyTPwMnyNlvTKLl0OzuWxuBcRWkLK2I+k423ejB9Pypju7GEhKDUdxpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xzh59vly;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C89606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77C89606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xzh59vly
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso35364435e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:04:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795424654; cv=none;
        d=google.com; s=arc-20260327;
        b=KVnTooQfzteSf23T3TG4XJB7ZiZdTOE4pnwZc+WaZXfjtJR1gSXfj3eBYZuF/ib5LE
         ugWed+vFqIGoA3HXM9QC6Aj7dFF7749KYkzEvT2e1qoOXFBU5t+5W6afaJ7gvX9LHTRr
         w59A2XO9ra+39Z/u3PjozyF3skO6431OORX5DIgf0rK8IsUHBROBZDVgeDxSMrMLyggJ
         EzGh7uEWJBDKj2gNQl4hIePYfMdWZS1m+sghN2eSGN0kLpA1t8mYaJJI5MRJz3r8+vBQ
         5WcQEwOsD7GodXHnhE7a47pu6LS4FshgJvcb4gEC0R1p86CiFSbuQ8cSU/RMPoo8yLIT
         gpTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Iahu//YmpmZyg0DhyYrw87fZlA1aEgZxAw+wZWOdpsM=;
        fh=5ttAMKzYLROdmxnyVM1gRlwFyxXXqf+P0eCZgZG1br0=;
        b=L71DvRKoUQnLC1+vbRK1r4aYOx+HraKxNR7wnEpQrQWT9c75oZToetiGT6bUZcTNXp
         dWGez+w5N3CR/zDMG22ZJBbLnNZW6hzt91bjQDNIsrueBeTGQqmh5omYGO+YqKFDEiUU
         anxycFvhqKI8D++Qg+l9543iVlU34+3NrKm/7HTXLERBeE+KPfdut3KLhtdk/hedpTVm
         vCNL3CXLKhar7ssdY8oVrdaSmInADwEwqGo1JWZnmqJcs2b14SXL00KS9C4hWbnYP2Na
         lcdBiJbaeiz0QoN95d/MVZI51R8pvORNuEHaC32pNnQNATds/PDjLXnx8IrbnsjGprhf
         cdJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795424654; x=1796029454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Iahu//YmpmZyg0DhyYrw87fZlA1aEgZxAw+wZWOdpsM=;
        b=Xzh59vlyxu25A0YX5r65mvsWDOc7XnpsInyTaQSA322zS/gqRwLLodre9BTAwe61up
         9TLw4fgjPWEgu24JYmDKvdu0t2qSd01actNwTe587I9D2Ev+sOBJ5l0LdhzYaVlwNaJT
         /T07I+HG006abWBnJfK9TtfN3nhs+oEbysVTpFNh0ICl1H3KUyB108N9dJZp8e4H7AzY
         +tQ0MfhWJBPVkoCB36+0w4FVAXHd/RccLsn51AClZK8EW2IKiz9wLQ/D5kEdPX969m7u
         T5o/AHlvDK4/CB802NxBBKkFVC0JiIrcX7+XJgRrr68xWLqpxyKCoEqlX9d3OZ0S+4mW
         oQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424654; x=1796029454;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iahu//YmpmZyg0DhyYrw87fZlA1aEgZxAw+wZWOdpsM=;
        b=iYK3Wg0VbPSBcOHTPKSbQ1zYEeg2rSFuhkNVnTaDjaVDsq4xYcVo2iN3Zq0JAGYjB9
         WJjWMjMRUBp63QJImfMy+ACzNWrZbSEsYM06O7cnbl7hL6eXXJeBoVxw88aZicg00si7
         rc4gfIGQ16T0LSAvbSc0kiZ+PSDcKCMmKggjqP7stoiy3JfTIO01HnhZeak4RzpZ4q6F
         xdBlAog8jiP3GIwpm6Ev+G5Yr7n6mRn3DZCC9hxNADUthpczaV7P62uuGFa3jfvNaoTD
         SrBoRZVE2HBdHy4umYgh4/B8uJP7kQ18SKsxrXMzIjTJ9tubVjpIWJK6s0PFD3NBOWpp
         +HOA==
X-Forwarded-Encrypted: i=1; AL+hErEsYeAU1ZUWxYD4fVtvygfPbKgUuVXzuY5PuyZ8DfrH+qpkwIZD9Vi7o9WZL9+KisA9HnmhnNxXl4j0VAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4yOLbwJuZZ/H3sN0asDh0wzR6S2Vtu3nOSShkPJWpQpmfX3mM
	eBrPv7CXTlbNCkQF802Tbkw++TF8pI+WSinpmW4AlI9ihagF7ruLRpRlQkRzqtiJz8N4GckizEJ
	P6/p1+SXd0Nby+5FE0A1VIe7n7ZSqU7s=
X-Gm-Gg: AZFdTZdHtuTC6vndH1g2n23Ued57j8HGyW+LOKkGP2Z0wqYcroavb0f6MBNQlAygQWU
	uG5OFpD65KFh9Qpj8a2FHz6aYAvZFcrqbxiNR6NHUCpwyI0cTRJNbsfgx4QXNHtMPAtjaueLm48
	aGRRd6aoMPvwlDNes8Sq+OnwMiGJMArVc1P5hU/34KPnax7dJQwVgLOVgW288UnT6gEXveI0ltT
	1LrrVNRFIascmyMHYsMuXpLEnBFvWFgQNwbJRn+Of6nE4ur2ub/7XM1cLaIXC6rIdV3RtvwBO7W
	lh19NCM7w41GGonRmakrg2z9Us0u0R2NjXs1DR2RtBubxfr3kYw7woBPpv47VibK4wjXZZN2wJx
	Y7X6C8Q/dA9t+OVD6QLa29L1BeYPFACGHsis/5xeRzBJH6l92uQMwJNO9ZVUAX7YO2BLGDaWjWY
	4hSspSwzP56wYJ5IJD+C5+0knXewK6yWDnYwEkE/xt+sBEx9yGsB1U
X-Received: by 2002:a05:600c:2319:b0:4bb:752e:991c with SMTP id
 5b1f17b1804b1-4bb86160370mr174614835e9.15.1795424653574; Mon, 23 Nov 2026
 01:04:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-reuseport-lock-filter-v1-1-a3e5324c8d55@gmail.com>
 <179542364209.3135.6346728453187808939@kernel.org> <CA+X8Sdi2zLn8ZUOWXQww1DOFkOqkPWFwrF9t5LnHxn==3s+8ZQ@mail.gmail.com>
In-Reply-To: <CA+X8Sdi2zLn8ZUOWXQww1DOFkOqkPWFwrF9t5LnHxn==3s+8ZQ@mail.gmail.com>
From: Wong Steve <shyckless@gmail.com>
Date: Mon, 23 Nov 2026 17:04:02 +0800
X-Gm-Features: Aa3M54q0kY5NXfFKpwRMPNQElPAV1wS6zgYhFbHOo44WAbFtAZw8Id81pwRjkew
Message-ID: <CA+X8Sdhn8u=QFkuFOzTQf-rdCRLLd_uBsQ83pJNb4jWsKuFriA@mail.gmail.com>
Subject: Re: [PATCH net] net: reuseport: honour SO_LOCK_FILTER in SO_DETACH_REUSEPORT_BPF
To: netdev-bot+sashiko@kernel.org
Cc: pabeni@redhat.com, edumazet@kernel.org, davem@davemloft.net, 
	kuba@kernel.org, kuniyu@google.com, willemb@google.com, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, martin.lau@linux.dev, 
	linux-kernel@vger.kernel.org, horms@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> [Severity: Critical]
> This problem wasn't introduced by this patch, but can reuseport_attach_pr=
og()
> right above hit a NULL pointer dereference on reuse->prog [1]?

I don't think this can happen. setsockopt() holds the socket lock for
the whole SO_ATTACH_REUSEPORT_* call, and a listener can only move to
the closed section through shutdown(), connect(AF_UNSPEC) or close() on
that same socket, which all take the socket lock first. So the socket
cannot be shut down and evicted by reuseport_grow() between the check
and the reuseport_lock. I also tried it with a delay added between the
two: shutdown() waits for the attach to finish.

Thanks,
Suyuan

Wong Steve <shyckless@gmail.com> =E4=BA=8E2026=E5=B9=B411=E6=9C=8823=E6=97=
=A5=E5=91=A8=E4=B8=80 17:01=E5=86=99=E9=81=93=EF=BC=9A
>
> > - [Medium] The fix only covers the setsockopt(SO_DETACH_REUSEPORT_BPF)
> >   path.
>
> Thanks for the review. Right, the patch only covers the setsockopt
> path, and that is on purpose. The disconnect and re-listen case is
> different: the socket leaves its group, and when it was the only member
> the group itself is freed, together with the program that belongs to
> it. The program is not removed from a group that keeps running. Making
> that path honour SO_LOCK_FILTER would mean keeping the group alive
> across a disconnect, which is a larger change than this one.
>
> If you prefer, I can send a v2 that says in the commit message that
> only SO_DETACH_REUSEPORT_BPF is covered.
>
> Thanks,
> Suyuan
>
> <netdev-bot+sashiko@kernel.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=8823=E6=97=
=A5=E5=91=A8=E4=B8=80 16:47=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue(s) to consider.
> >
> > Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
> >
> > If you believe none of the issues are legitimate, please reply to each
> > issue of Medium severity or higher and explain why the AI is wrong.
> > If any of them are legitimate and you plan to respin, please let patchw=
ork
> > know by including "pw-bot: cr" as a separate line at the end of your re=
ply
> > (one such reply per series is enough).
> >
> > - [Medium] The fix only covers the setsockopt(SO_DETACH_REUSEPORT_BPF)
> >   path.
> >
> > --
> >
> > net: reuseport: honour SO_LOCK_FILTER in SO_DETACH_REUSEPORT_BPF
> >
> > This commit makes reuseport_detach_prog() return -EPERM when
> > SOCK_FILTER_LOCKED is set. Without it, an unprivileged process that is
> > handed a locked socket can remove the reuseport program with
> > SO_DETACH_REUSEPORT_BPF. This matches what sk_detach_filter() already
> > does.
> >
> > > diff --git a/net/core/sock_reuseport.c b/net/core/sock_reuseport.c
> > > index b9e5648fa4c51..cdff61161a70a 100644
> > > --- a/net/core/sock_reuseport.c
> > > +++ b/net/core/sock_reuseport.c
> > > @@ -727,6 +727,9 @@ int reuseport_detach_prog(struct sock *sk)
> > >       struct sock_reuseport *reuse;
> > >       struct bpf_prog *old_prog;
> > >
> > > +     if (sock_flag(sk, SOCK_FILTER_LOCKED))
> > > +             return -EPERM;
> > > +
> >
> > [Severity: Medium]
> > This closes the setsockopt(SO_DETACH_REUSEPORT_BPF) path. Can the holde=
r
> > of a locked TCP SO_REUSEPORT listener still drop the program by
> > disconnecting the listener and then calling listen() again?
> >
> > connect(fd, AF_UNSPEC) or shutdown(fd, SHUT_RD) on a listener goes
> > through this chain, and none of these functions check SOCK_FILTER_LOCKE=
D:
> >
> > tcp_disconnect()
> >   tcp_set_state(sk, TCP_CLOSE)
> >     sk->sk_prot->unhash(sk)
> >       inet_unhash()
> >         reuseport_stop_listen_sock()
> >           reuseport_detach_sock()
> >
> > With net.ipv4.tcp_migrate_req at its default of 0, and a program that i=
s
> > not BPF_SK_REUSEPORT_SELECT_OR_MIGRATE, reuseport_stop_listen_sock()
> > reaches the immediate detach:
> >
> > net/core/sock_reuseport.c:reuseport_stop_listen_sock() {
> >     ...
> >         /* Not capable to do migration, detach immediately */
> >         reuseport_detach_sock(sk);
> >     ...
> > }
> >
> > reuseport_detach_sock() clears sk->sk_reuseport_cb. If this socket was
> > the only member, it also frees the group:
> >
> >         if (reuse->num_socks + reuse->num_closed_socks =3D=3D 0)
> >                 call_rcu(&reuse->rcu, reuseport_free_rcu);
> >
> > reuseport_free_rcu() then releases the locked program:
> >
> >         sk_reuseport_prog_free(rcu_dereference_protected(reuse->prog, 1=
));
> >
> > tcp_set_state() keeps the port bound when SOCK_BINDPORT_LOCK is set, so
> > listen() can be called again on the same port:
> >
> >                 sk->sk_prot->unhash(sk);
> >                 if (inet_csk(sk)->icsk_bind_hash &&
> >                     !(sk->sk_userlocks & SOCK_BINDPORT_LOCK))
> >                         inet_put_port(sk);
> >
> > On the second listen(), inet_reuseport_add_sock() finds no sibling and
> > calls reuseport_alloc(). Because sk_reuseport_cb is now NULL, this
> > creates a new group with prog =3D=3D NULL. The socket keeps listening o=
n
> > the same port, but the program is gone.
> >
> > Documentation/networking/filter.rst says that once SO_LOCK_FILTER is
> > set, "a filter cannot be removed or changed" and that the filter "will
> > be kept until the socket is closed".
> >
> > This only happens when the locked socket is the only member of its
> > group. If it has siblings, re-listen puts it back into the existing
> > group through reuseport_add_sock(). With migration enabled, the socket
> > moves to the closed section and keeps the program.
> >
> > In a one-socket group, the program matters mostly when an SK_REUSEPORT
> > eBPF program uses SK_DROP to decide which connections are admitted. The
> > group-wide load-balancing change described in the commit message cannot
> > happen through this path.
> >
> > Should the disconnect and re-listen path also respect
> > SOCK_FILTER_LOCKED, or should the commit message say that only the
> > setsockopt detach path is covered?
> >
> > >       old_prog =3D NULL;
> > >       spin_lock_bh(&reuseport_lock);
> > >       reuse =3D rcu_dereference_protected(sk->sk_reuseport_cb,
> >
> > --
> > Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/pat=
chset/20261122-reuseport-lock-filter-v1-1-a3e5324c8d55%40gmail.com
