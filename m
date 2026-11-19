Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795108884;
	b=cT/18VBh+HbCQz4nlN0Cb8PTMdnx2UJR7/g96eNUkrLa8w8vYCKfvccRAh5DkafCtgtb
	 /SgDD8T3oPEJCHllnFXz3k/qKG/qtlCYmz90vX36AWdA6gdirR02up6XIz4fEzUbTNMI6
	 MXWd7Q3khkSQ0cbnR0Fwz52jZIuOmIGoqR7YCrjLlU04CipekA7o9dHApXS/xKtHHPnFu
	 eJYfDvKx5IAem4pH27eYwHmcJYabekbH03GtPiYktCZY95bSGyN6SM+egQTcvT6vpmc/g
	 HNSyoU+G8ug1iCOMTB8GnStI5eq88dIUtLMlWu4F7oNA3QioagyyCtPYAhtlgewsmrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9+Wpo+rVuAhgDi7GaMibOozackcQ8FbSjOHycDbmxqE=;
	b=HMCoPhIj+41L88XChsmJEfQt6aYBrFwmaumxXvIALk3w2a2+hfZ3DBvyEaBY78iEe27W
	 p7M2HO6HvSeewt3Dp+qvp7CWLRdpDOyifJ3+kRPIJuSWG6SBhsraACYMFp97HgevDWRnK
	 OlIO6SAnRRSRfCpBO69TVjk4BAxazUux+AwqqpXnyoYPsF/qyEQM/rxvU05zB9rEyuszY
	 OFbYE09w3LRB4gsrH56afEcPSvYli3yDJNTZK0C5GrRIvcI9T/wgiq0BCnpDHEgYxsu5Z
	 DQfOkj7yxjUP/tNAhGN4Ubsr15rZQStMrT9i1VhG7UA0qBjltI58nwMnGmXS0soIuIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="c3GP/f+t";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA7D606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CA7D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c3GP/f+t
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b8b20b2538so2395462a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:21:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795108881; cv=none;
        d=google.com; s=arc-20260327;
        b=IoORajsZ3EIT+oO7V8S58ZRUHAZiHKLdgMgeXQOV4CRZIf5mO2ZY9B6PHwwZKPjvfZ
         mzkdZyAcj31AqJIyxzO+CnaZpnIyqv1sq8Eq+inJe3FA5lfQzzpS2eiDwEXE2TvsuRW0
         u018U2Lo5TO2ZKobq1r9D1vlRfsjMq7W/WgkvsBnc5Dd9Is/ubZ8ARruF1F7jzSbf5J7
         UlSk1H/I3MX+iRYVJW7n3Qg514LFtkARFxOcYUEYVYNyqWD72K9nm26c5AnnlNsin5YL
         Tz9BO/OlLvEmO1TAYF1PmqJdvYngPcgPB9L28HldUfVn6+6sXBLv5j5vZllfcwkf8alc
         sSSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9+Wpo+rVuAhgDi7GaMibOozackcQ8FbSjOHycDbmxqE=;
        fh=tnNT4SbX5EA5aM6ETXpFepElzExns1JQELT8g+V368k=;
        b=eDsnVB1bHQgRvxbBbUZtASZr6MIQYLWczCVYY1vX54byl2WrElmBQ7hJVtim65bd+7
         VnuB+i1VcdmXItfvBJRXAFcV+kTcN3Xin1fFycu19rY8cw2qvAN95GN4xthSjK50MKwj
         W6+6eYBIgBfN77loupD1GrUj+kXiLFuWx5rCx4Bcua7lhuNIdjyr/h7mm/d8wwjMU5m7
         EOPbqTG96zGztQDt8cXiKrMGkn8Detyjjjih5Qa4mrPfZrwlPEn2b4oy2xKOKsBDrcXV
         sAE0kDQS1mZCVDrFQNozjVWD1gIziioS3R3uRQ4KXMKz5oS9FzhEHt/+FFJ14lgign4M
         mi+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108881; x=1795713681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9+Wpo+rVuAhgDi7GaMibOozackcQ8FbSjOHycDbmxqE=;
        b=c3GP/f+teQzkEHFch/dYZZh5G7GlLPm8n3VAiZpw4VNfHRiIJPSpv4dcErTDCpfPyK
         CKyjMca9AYjuSTxjhJIN1fPBxk16VQLTd8KTqSHOrWbk/eu0c0nuoNQLtYfNx9GvC06k
         AwLKOHkeaKvNiSQgOVcs8KdmSK0f6fg2vUNz8SutQpHHSTm3WGAJJM32tz/kjJWojfMM
         iSCgfHlIxHRoj65IsyDb/eNEQOYY8HE1gPLMqOAnVXk3KYVJpRQ+lAmpQYaUJXk7SYlI
         myx5r+bSNAMO71D92JNEnq9Ic4QWgr6q5g4YZvxLe+WG/727euPc+eOnlCpz6eUpuPez
         7Zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108881; x=1795713681;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+Wpo+rVuAhgDi7GaMibOozackcQ8FbSjOHycDbmxqE=;
        b=QurMAj8pBD+33f9pRSndYqq+Plh7LPv4wAF/xSaWaojDUT61LTmZsn5haF4FIGLuj1
         UYlM2ZvV9WwYw6ridvnyskyUsZjo68WZHThHsrZoKRNvsAREr5upDto61KxZjrttk01I
         HMOBKZ0ofKOLwuI2qPPTf7cWC5dh6/1VXc9db6dK/OqCt+2MNJSvnGwl1tISEFxGNXKN
         Fl/BtAxK8CCQx59LDvkqOhB+E/9UsSUovAyqsPtk7xGkXR803HnOMl7gvD1qsjZXeHm9
         Bgc3VUxkTX+gA7CwoPADHlCoOKc9IjUb2ZWUP/4hBHsl43SdJ+E2yf+dSijyHedM3a0O
         tpmQ==
X-Forwarded-Encrypted: i=1; AL+hErEnvsj2oF2d/RAGorOcT8wuKoaPr2ADn3ugfL+Q0gOTsDdWIycZxRHpGvvgX5++xI/6CvTi4lMZyxjU9mI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WePdJwbmAaVKhdr5/MTLvMYO7rWSs0Bpmg2X11EeSNQCLfTRW
	QIzAFaWX5Z9OwvB6QrZldHeMoHwlqW6mAvToJT9nW8IemKk+P/mCG/Zwgm1HpmD9O/FWSpdtKrd
	18sTJOEr+W2k0GZZXYsaLVCgvQtadiFQ=
X-Gm-Gg: AYBFou06okJKIl+S6EfkGwEescbXX56dQ932CzIe849Zx604hXquUX844Hkck7jQbqm
	VLO5gWsvqdthp/tpFvRo8xMjVNCKT4mufmPEamfyaybUy9auaA6sUFns+pZ802P21329PDp1k0M
	Y4N4HioHv17SQNXSCECDE6hYGNzPEUR/0QKp/tlXF60eO54iEU1W3/CXiju7JO+7F3QCONGBeLW
	pyQFOcPgzUAPUdcqoa24oWTCi32KQj1JQ/rGOK+MxxN0Ly6WFoPo+75BSue/EcweK/mmFaHOmuB
	areCk2h8O40OLLlcrFBAaTC+b5S5a8qiF16useCJuB4j5g8o3sRxXyRLVoo/HUSEr9DFHNXfNPe
	D050QIwgSbAv06/ICxNkEHyJrF2nCro5MIrVxkCDOubNzplbh2g+ulHrPnqDUnM04AL8PM3U=
X-Received: by 2002:a05:6402:c54c:b0:6ba:36b0:3207 with SMTP id
 4fb4d7f45d1cf-6ba37e69823mr5555a12.13.1795108881438; Thu, 19 Nov 2026
 09:21:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117041029.80543-1-juanagusnicco@gmail.com> <179510476492.3136.15185317023274420078@kernel.org>
In-Reply-To: <179510476492.3136.15185317023274420078@kernel.org>
From: =?UTF-8?Q?Juan_Agust=C3=ADn_Nicco?= <juanagusnicco@gmail.com>
Date: Thu, 19 Nov 2026 12:21:08 -0500
X-Gm-Features: AclHuK-zJpLBGFXtmIIgaJV5q4o4q2kCjQ0v7081tz_orFt7g4xlF9-QouNmhuM
Message-ID: <CACQ4AciGFKQUxu7PVz+BoOAq60nW9B+cHasUsmh5jg=Gn=f7wA@mail.gmail.com>
Subject: Re: [PATCH net v2] tcp_metrics: hash the destination address with SipHash
To: netdev-bot+sashiko@kernel.org
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The issue Sashiko flagged looks like a quirk to me.

On the collision route Sashiko describes, the attacker has to be local
and needs on the order of 2^32 connections per target address. I
couldn't find another route, and the worst case is still a local leak
of peer IP addresses that only applies in specific configurations.

I'll look into whether it can be addressed at no cost on every axis
(backporting, clarity, etc.).

I will send v3 today including Eric's requested changes and
answers to his questions. I confirmed the remote leak is exploitable
even on high traffic hosts.

Best,
Agustin


On Thu, Nov 19, 2026 at 11:12=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wr=
ote:
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
> - [Medium] In net/ipv4/tcp_metrics.c, tcpm_addr_hash() hashes only the
>   peer address, with one global key (tcpm_hash_key) shared by every=E2=80=
=A6
>
> --
>
> tcp_metrics: hash the destination address with SipHash
>
> This commit changes how a tcp_metrics bucket is picked. It used the
> ipv4_addr_hash()/ipv6_addr_hash() fold of the peer address and now uses
> SipHash of the address with a random key. The goal is to stop attackers
> from computing colliding addresses and recovering net_hash_mix(), which
> is still XORed in afterwards to separate namespaces.
>
> > diff --git a/net/ipv4/tcp_metrics.c b/net/ipv4/tcp_metrics.c
> > index ae551546422fe..1d6c88bc35cc8 100644
> > --- a/net/ipv4/tcp_metrics.c
> > +++ b/net/ipv4/tcp_metrics.c
>
> [ ... ]
>
> > @@ -95,6 +96,22 @@ static unsigned int                tcp_metrics_hash_=
log __read_mostly;
> >  static DEFINE_SPINLOCK(tcp_metrics_lock);
> >  static DEFINE_SEQLOCK(fastopen_seqlock);
> >
> > +static siphash_aligned_key_t tcpm_hash_key __read_mostly;
> > +
> > +static u32 tcpm_addr_hash(const struct inetpeer_addr *a)
> > +{
> > +     net_get_random_once(&tcpm_hash_key, sizeof(tcpm_hash_key));
> > +
> > +     if (a->family =3D=3D AF_INET)
> > +             return siphash_1u32((__force u32)a->a4.addr, &tcpm_hash_k=
ey);
> > +
> > +     return siphash_4u32((__force u32)a->a6.s6_addr32[0],
> > +                         (__force u32)a->a6.s6_addr32[1],
> > +                         (__force u32)a->a6.s6_addr32[2],
> > +                         (__force u32)a->a6.s6_addr32[3],
> > +                         &tcpm_hash_key);
> > +}
> > +
>
> [ ... ]
>
> > @@ -329,6 +342,7 @@ static struct tcp_metrics_block *tcp_get_metrics(st=
ruct sock *sk,
> >               return NULL;
> >
> >       net =3D sock_net(sk);
> > +     hash =3D tcpm_addr_hash(&daddr);
> >       hash ^=3D net_hash_mix(net);
> >       hash =3D hash_32(hash, tcp_metrics_hash_log);
>
> [Severity: Medium]
>
> Is net_hash_mix() still enough to keep the namespaces apart here?
>
> tcpm_addr_hash() takes no netns input and uses one global tcpm_hash_key.
> So S(addr) =3D siphash(addr, tcpm_hash_key) is the same in every netns. T=
he
> namespace only comes in after that, in tcp_get_metrics(),
> __tcp_get_metrics_req() and the netlink paths through __parse_nl_addr().
>
> For two namespaces A and B, the bucket maps then differ only by the
> constant mix_A ^ mix_B. That constant is applied before the invertible
> multiply in hash_32(). This is the XOR-then-multiply structure the
> changelog calls not a PRF.
>
> tcp_metrics_hash is global. A local user who owns a netns (a container,
> or unshare -Urn where unprivileged user namespaces are allowed) seems to
> have both oracles the attack needs:
>
>   - tcpm_new() reclaim reuses the oldest entry in the bucket no matter
>     which netns owns it. So another netns, such as init_net, can evict
>     the user's own entries.
>
>   - TCP_METRICS_CMD_GET has no GENL_ADMIN_PERM and the family is
>     netnsok. tcp_metrics_nl_dump() returns the caller's own entries in
>     bucket order.
>
> Because S(X) is shared, take an address X that the attacker controls.
> If X collides with a victim address V in the attacker's own namespaces,
> it also collides in the victim's netns.
>
> Another route is to solve for mix_A ^ mix_B from cross-netns evictions.
> Either way, the attacker could watch V's bucket in the victim netns and
> tell whether V connected.
>
> It isn't clear how cheap this is in practice. The S-collision route needs
> on the order of 2^32 own-netns tests. The other route needs more than the
> few hundred answers described for the remote attack.
>
> Still, the changelog says:
>
>   net_hash_mix() and hash_32() are kept, to separate
>   namespaces and to reduce the result to the table size.
>
> With this construction the namespaces don't get independent bucket maps.
>
> Could the namespace be part of the keyed hash input instead? For IPv4
> that could be siphash_2u32(addr, net_hash_mix(net), &tcpm_hash_key), and
> IPv6 could add the mix to its input the same way. inet_ehashfn() does
> something similar: it feeds net_hash_mix(net) into the hash seed instead
> of XORing it into the output.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261117041029.80543-1-juanagusnicco%40gmail.com
