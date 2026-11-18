Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794976431;
	b=KNf6YrQr6s8y8I9EsyTRvK9iCKYnvS6oZy7O+dBXstA6ll+5TucdxiSaLwiQbr3Yx7mO
	 MHK2fXY2Elu9/HuKMgJKB+/79kstLTN1w06/KpQWtleHTwyo1g0EaO9c67j09IR6TmS1+
	 ZdR4sOTQca2Weh/qHuGp3TwEayQ5tyEPDjR+cxz0RLkZzygWjhXIJqcuXQCiH8IZOFRtZ
	 rr5HTJ1wPfoAqYsR5gN6wkLUO+EOA6hrj3pP9fQZemvKO91UhVbsYCoH63a60KfgdXMB2
	 ZlsXUVj7mIiDapXzBnLpp8T7azFjmI6EIXrTfAO/vp8UKWibA0hGch/nZZYAG+ROamA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794976431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MUs8CjwaGuk4iVeRZDmUQDbYR0xgE9bvqwlZImODLwc=;
	b=s+GGxKG1iiMouuM/LU8i4/5zeAqHLbZjl/Ycp95ta/HFvc3ttYgVfozaH6JJuwn+5BGH
	 Uo8bbrje/QdhXzhnbCG+mBOIpTToodpS3ay/H0Tn8M5GAdv4jc+v9WO4sufIeXBkWXn0/
	 sttL9Si+ToTxy58/zmbrWsWTVzo7PZv7rXpuxbH9e0Ugr9st3jrjBwO8p7OSUeWO0zgxN
	 jP8BDTzAoBsyOV+H/Eu5WXV+LQxG2alGODx3pO3AgjnD6ltatITJ3+ht/86nun5d0lCs4
	 nfLxqmERBsuYYrGadTdd41jDqiJmLFDF6bld97JpxWEea7SMcIWRrYdBDREiLtH33Ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lOomIVn5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C10606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07C10606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lOomIVn5
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso110350566b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:33:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794976429; cv=none;
        d=google.com; s=arc-20260327;
        b=HCEWhuXi/2uYbChkdIgdhiiov+IPlOEq14M6VxcIfBxfHvdO9i1NiqbjgffWQ9olck
         OuQRjITQpenFIB64JGm+u93oc3CI0ePDhp0uexjATFotrxl6vi+pV+D1vtYZEynR6e1r
         7tnnCjghNf23ncGvQpQCFT8WMzs7uW4gvtLNP+T/RjjF9/5+aQczKRjv8COVZlp8wW/G
         aBz/zzr/dULM2/J7aZMu1pT9gR2L+Tr2eDGAGDidHnAT82Eb0glSz0c2vBKjnHyFi6R4
         i/eVS8OW81tOaZQELwm2tTFMioahhY+Hoz6zMGWRUgE56+3R3KgZ76k/ZsUGUqyeIHeq
         tgpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MUs8CjwaGuk4iVeRZDmUQDbYR0xgE9bvqwlZImODLwc=;
        fh=7uGdViWWyabdMxBIkDgLmEVxX11zmkE7Qp0ZWQqlDpM=;
        b=k0PnOXlf4rqBIer3mUQTjljz8GbR7iF7SeJ3pqVOHY3lOoYo4UPYxAxUmJi0wDjb/X
         WjwR/fWeNspRr9zSAJy+I9u9/RKJ1v8vmXgmxlYJMJay6gpTdagXKvHwoygy7yqc5pgI
         0Tdon8kyfAXcXIiIxbSCWKlwfB8fhRgNVNutB5Agj1qJHPPj+ix04LHiCXkYtXn8sW7S
         xOXKdgE+tlwCdGD7wr1SUZsXwvudmjmfzNo4lHuHwdaAdLNA6+YU39Ox1ERedTgBKpfu
         zXS6hQI8KqyiseVzavHZTUo1sMiY79rk+SKgtzJ1IgKGZxdVXA8AJh4FUWUSEBpBdXRX
         7tCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794976429; x=1795581229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MUs8CjwaGuk4iVeRZDmUQDbYR0xgE9bvqwlZImODLwc=;
        b=lOomIVn5Q9QOElBLYfAz1d71UntWM2MAvpo3ZN+IVP2h5OmfJqOq97xn2Apf9syGeu
         wrSmemvxWEJGy9NwSytqyVj3Cr3cdJO09aBfahxKZxvGhmuAS4KLg3n0HlovQ/BlYS1i
         iT0aa9k4J/B6NR3Kyrz52lf1d9KX+t2/S3NoTKKKQBmadM9Cf4hH2on9vBRrv5MNXUrk
         9BB8eSZMp8O8Yn6Lu++pXgnw+/gaiIlai24FRnZX2wf3Xchuc7gmD1FYMt1CI0atKzkh
         SSPHJvtdUDTD1Ijq1UD3O1n3oPbpWpyVH87UucfZrADRm9Ff3j/ZITQRXA5XyxBNtj5Z
         ZT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794976429; x=1795581229;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUs8CjwaGuk4iVeRZDmUQDbYR0xgE9bvqwlZImODLwc=;
        b=M3PgIAugD8MyKaRUTYpOHfhoH2gYzJszak0jaX7tla6+BZuGwp0uW7r3+56/loWrH2
         7HBwjJn5ikV+v45Z0LTQ+hKKwUkl2OzB4+nzR/9VZcLRNX9/YOoq0Kfx5/C5YkiyI0wQ
         OiSKaq4HYQdz52aTSq9Tti/Lhs32lYOA31MeEDvCeosenOJZmaWDYmoVXEnNLEfBChkb
         2hmnglqpNNWX0z4n8LlNwDrQstJtfANVQADv4M1djY+xcoK7H87BgA+c7varfaKNgSpA
         AX8qT3ll98MdZWabvzbDwh9rJk9pfHNJ05Fi+eJzLMTs1SYsRx9IRrLTmMYBHnMCOGqQ
         qrDg==
X-Forwarded-Encrypted: i=1; AL+hErGQSMc/TjULj5cFNYvUB1furv0dimE5LavncLehTf1e2Nx0MfRtrIvyfuz6e0Jl85QzOCgL+sXy0YVMmq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GMqVeJh2OxxXah80K6UbND7XwgzyJyyU7WlTwRvbXY7WQaztU
	8H5GrRPUB1rBwSeiKufXgad6yOh5KSjRhGyoZqTT6zQ8n+Ok3aSatP8+/xadXzf47RjFA3bEGd0
	nq9HGM43BpXqC5tsXpMxyovVQoe1KiKI52wX770a3
X-Gm-Gg: AYBFou3b8Z9oJfqfemeFcyxOf/M3uPMno+OAOqssUqgass4RPn5otXh24dvZxbG9HrI
	Wm6nZ4IdqJs10qOPPFRLDBoj9OtQmLF2w/ZX2MzBzqd7Jt4vY7riZ94JveitisLNDzDz9KQdUA1
	4AlkEOlA+Ju7GNY6/OVn2+IYV+O8TBHC3e7OXaofcznzPWIHdkQKj1gkiFIZJYJnESEavOMbiCb
	fv88GjXuy1+ryUTePv+JHKV1soqOsOvceHzY1urU+M7sX5R7FkREhkWYW+L6ezOhOhorAw37cB5
	WzKBTsWSxcA4tSRPIpY5KXz9040STZOE8QBVnBb6rIiOkkgRb/+QjRHOCVZsS76Rap/LCZC0LDl
	Ffvp7af2ZLvJqDwhQWSKHQmkS2jw79vp8HGclkJrc6vlej+K4ivDil4FeBOdKXUVWTAES
X-Received: by 2002:a17:907:84a:b0:c40:9b35:ad91 with SMTP id
 a640c23a62f3a-c510e2b7e2amr97065266b.13.1794976428544; Tue, 17 Nov 2026
 20:33:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116224308.986555-1-joshwash@google.com> <179495835918.3136.2006086240050992361@kernel.org>
In-Reply-To: <179495835918.3136.2006086240050992361@kernel.org>
From: Ankit Garg <nktgrg@google.com>
Date: Tue, 17 Nov 2026 20:33:36 -0800
X-Gm-Features: AclHuK_uCg09n60i_OGP551CiYLXSQ0RQo7AahklWQYhEoJUhCMiIcbOK6k_ukQ
Message-ID: <CAJcM6BGpwRPm6bhRWp6BWLsaTzwYd__x=tyQqpAcbOKsBCxekQ@mail.gmail.com>
Subject: Re: [PATCH net v2] gve: fix checksum state and gso_segs of HW-GRO packets
To: netdev-bot+sashiko@kernel.org
Cc: joshwash@google.com, netdev@vger.kernel.org, hramamurthy@google.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, jordanrhee@google.com, thostet@google.com, 
	willemb@google.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	pkaligineedi@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 3:32=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
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
> - [Medium] gve_rx_complete_rsc()
>   (drivers/net/ethernet/google/gve/gve_rx_dqo.c) works out where the TCP=
=E2=80=A6
>
> --
>
> gve: fix checksum state and gso_segs of HW-GRO packets
>
> This patch makes gve_rx_complete_rsc() set the network and transport
> headers on HW-GRO packets. For device-verified packets it also seeds
> th->check with the TCP pseudo-header checksum and calls tcp_gro_complete(=
),
> so forwarded HW-GRO skbs can be resegmented correctly. IPv4 and IPv6 are
> now told apart by EtherType, and gso_segs is computed from the TCP payloa=
d
> length.
>
> > diff --git a/drivers/net/ethernet/google/gve/gve_rx_dqo.c b/drivers/net=
/ethernet/google/gve/gve_rx_dqo.c
> > index 82ed5e48b00ab..b4dbfb1ba39b0 100644
> > --- a/drivers/net/ethernet/google/gve/gve_rx_dqo.c
> > +++ b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
>
> [ ... ]
>
> > @@ -1049,10 +1061,50 @@ static int gve_rx_complete_rsc(struct sk_buff *=
skb,
> >               skb_frag_off_add(frag, hdr_len);
> >               skb->data_len -=3D hdr_len;
> >               skb->tail +=3D hdr_len;
> > +             /* napi_gro_frags() pulls the Ethernet header later. */
> > +             nhoff =3D ETH_HLEN;
> > +     }
> > +
> > +     /* The header lengths come from the packet, so make sure the head=
ers are
> > +      * in the linear part before reading them and writing th->check.
> > +      */
> > +     if (unlikely(skb_headlen(skb) < nhoff + sizeof(struct iphdr)))
> > +             return -EINVAL;
> > +
> > +     skb_set_network_header(skb, nhoff);
> > +     proto =3D nhoff ? ((struct ethhdr *)skb->data)->h_proto : skb->pr=
otocol;
> > +     switch (proto) {
> > +     case htons(ETH_P_IP):
> > +             gso_type =3D SKB_GSO_TCPV4;
> > +             thoff =3D nhoff + ip_hdrlen(skb);
> > +             break;
> > +     case htons(ETH_P_IPV6):
> > +             gso_type =3D SKB_GSO_TCPV6;
> > +             thoff =3D nhoff + sizeof(struct ipv6hdr);
>
> [Severity: Medium]
> Is it safe to assume the TCP header comes right after the fixed IPv6
> header here?
>
> Nothing checks ipv6_hdr(skb)->nexthdr =3D=3D IPPROTO_TCP or desc->ipv6_ex=
_add.
> The IPv4 case above also uses ip_hdrlen() without checking
> ip_hdr(skb)->protocol =3D=3D IPPROTO_TCP. The only sign that L4 is TCP is=
 the
> ptype.l4_type check at the top of gve_rx_complete_rsc().
>
> The descriptor suggests the device does parse IPv6 extension headers:
>
> gve_desc_dqo.h:
>         /* Set when IPv6 packet contains a destination options header or =
routing
>          * header.
>          */
>         u8 ipv6_ex_add: 1;
>
> gve_rx_skb_csum() only holds back CHECKSUM_UNNECESSARY when that bit is
> set:
>
>         } else if (ptype.l3_type =3D=3D GVE_L3_TYPE_IPV6) {
>                 /* Checksum should be skipped if this flag is set. */
>                 if (unlikely(desc->ipv6_ex_add))
>                         return;
>         }
>
> So an IPv6/TCP packet with a hop-by-hop header and a device-verified
> checksum would still be CHECKSUM_UNNECESSARY when it gets here.
>
> Suppose the device coalesces such a packet, or a tunnelled packet whose
> ptype reports the inner L4 as TCP. Then thoff would point into the
> extension or tunnel header, and tcp_hdrlen() would read doff from the
> wrong bytes.
>
> gve_rx_fixup_gro_checksum() would then write the pseudo-header seed at
> that offset:
>
>         th->check =3D ~tcp_v6_check(len, &ipv6_hdr(skb)->saddr,
>                                   &ipv6_hdr(skb)->daddr, 0);
>
> tcp_gro_complete() would also set csum_start, csum_offset and
> CHECKSUM_PARTIAL at that offset.
>
> Wouldn't a forwarded packet then leave through TSO/GSO with a bad
> checksum? That is the same blackholing this patch sets out to fix.
>
> The destination-options and routing cases are CHECKSUM_NONE, but they
> still hit the wrong doff. That could drop a valid packet with -EINVAL or
> give it a wrong gso_segs. It could also take the new early return:
>
>         payload =3D skb->len - thoff - tcp_hdrlen(skb);
>         if (payload <=3D rsc_seg_len)
>                 return 0;
>
> and deliver a multi-segment coalesced packet without gso_size.
>
> Before this patch the RSC path never read or wrote the TCP header, so
> this assumption is new. The changelog gives the VLAN guarantee ("The
> device does not coalesce VLAN tagged frames"), but says nothing about
> IPv6 extension headers or encapsulation.
>
> For comparison, bnx2x_set_gro_params() documents the matching hardware
> guarantee ("TPA aggregation won't have either IP options or TCP options
> other than timestamp or IPv6 extension headers"). The mlx5 SHAMPO path
> checks ipv6->nexthdr =3D=3D IPPROTO_TCP.
>
> Could the device guarantee be documented in the changelog and in a
> comment? Alternatively, could this check ip_hdr(skb)->protocol and
> ipv6_hdr(skb)->nexthdr against IPPROTO_TCP (and ihl >=3D 5), and skip the
> GSO and checksum fixup otherwise?
>
GVE device doesn't coalesce IPv6 packets with extension headers. I
will send a v3 documenting that guarantee in changelog.
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261116224308.986555-1-joshwash%40google.com
pw-bot: cr
