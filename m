Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795549271;
	b=UavU8PXmjYbw//l/phXLHaKlNVuKk9o3mMsvKzxH3DfZf1fB+SOocg1AFngFeWE+YaLR
	 im0ZhRCuZ3nB01E2keQZDwBJdLx6urxRu0XqA07DO7EHqKkNMpedS+bXXEO/p6dXmseQi
	 vdmERm02vGF/ozcW4gXCxM6h4pciGonHpR95Vk/5lwRy81F/tfG9wRG5zlTLTkQ//saWS
	 0pkI+sBm//u6X/T4qYvDX4Snlg3FDwWswr9Z0VX/DpGlBvZTJSROAiEPt7iAXLdTE5IF9
	 KRtCCONxF/w5JwuiVKg6tWIaHGZmlNnXLhVVfHWOlW6HDGlol59CxNpSfoya75wgLjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2vmyLu0fj3UnidokWQBdzXx40ajwhgez4jCRx5It+x8=;
	b=c8MYCHDuxBgP4pnjHqzbTBB0t8aLeX4SXxrTOMFl0/Dmxh4cmJzd2pA+wq7gjKRdHJ9v
	 RuJ8iOVZU7eZ0tS4LNe/h93xIxE54hIPIU9jJfMRE2gA6hZ6dRhgk11xg6t0dqUmoTgAt
	 kjOWlXNrK2vwA2vPVa0G93lfDItHXbJdWohQE2pGI+nwiAFo9IoBFVjX5YELqR6TabReG
	 thMdHELt51iTIgL7tx8MqaNDJ2yZvdECzOi7s6Lqvo9ar8jaQwC2CVXfwoihSP+DiEbDw
	 ODMaKwmxKAcWlcqEmo949V2JsmO8hMmN7I3PRF/VLz54yrjZqZYqJX47zOtxUDyc69g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GWvkDnNo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DF3606A697
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60DF3606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GWvkDnNo
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso6355637a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:41:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795549269; cv=none;
        d=google.com; s=arc-20260327;
        b=VQF4riMLWe6AFCYf9ONmVh70WJS1AurgK9y5+QRJBzCcUt8ofk5sx8QjVSJkgwxRcK
         OWNx3/Rw/Ncv2yKgdFl900V/sGoj3RuMhQY1WPEdzwRIJeV9819YB9ln9YXCcxqZMPuq
         msF+JF0XiBPb2XSMyr6QuAysToji3i8oCDqAmWU/Y6S8z4Xzfchk0iS0wcSy49CnEn9i
         WclMVtYWHU9NPGrbMcUvx2Xc12SB/i6MfW+4ZfNMr7JFRs62qRY1xkrqAHYf06WkfLHM
         prPm/8lyaZso8o1pjswOfZ6jHEMtlYJBhrRxgZA+ZprX5Rws9ZD9YBe2T7z5vHz61DSK
         HCcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2vmyLu0fj3UnidokWQBdzXx40ajwhgez4jCRx5It+x8=;
        fh=uf3hwVGIOieroWdd+lQ0e17xr50yEUlekwH1HEUJEY4=;
        b=lMGWryWDKF/sZajQCwDrP/olFFykcz1385PIEDyjweJuIP16MjR9dWLM6cN7jYXzG0
         a1vRpIlJZorVzfSuBdvB8TFl65W66FlAgc5yFKPui5nlrYI+8zatlQQhLJg4yuTS+ZyW
         ft9VQV46GgU8pZHD9vgHa/DuNe7f3mlOLuw1l5lmH25sNSPkQ3IAFh2zv+jU0wq9OwYX
         e0Z3L53p0gMMaplOBfe4KPzzj0dOe2XJ8su5a3xi0t912o/7Fb0RYXcea3mrb/tTDhnF
         FIfcPYIxA0EA3JpP4z/LtfAHmI1bIlmE6WQiodS9q30uE6MzsqCCUVkhslgufkz9Wl7D
         3Kcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795549269; x=1796154069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2vmyLu0fj3UnidokWQBdzXx40ajwhgez4jCRx5It+x8=;
        b=GWvkDnNoeNqbKrdrviN/4FfZFU7FJTkVONEzz/odwE0V4oRV1ndq4Uv1V9Rtwm7ULT
         FBe6pfyg7dsiyzmO9S4ts1nmdEEL1nAZyKJTVUw6uj3lokjm5H6nT5QpYI/FdopkTHX6
         m6ZzNK72a7Q6NfaESiqwfV9y/NIAjiQ+HkYbgMpve+LXng3ukVgIL1WNNoTqgROTpqYN
         feVg/7Tt4Gyuzz5f1DcRTfuZC4cqdhkQHQeco90xjL5sZYOJx0mb/EIKtedD6n2f13Zl
         H6QdhO/XhxHp/GNZP7BouXE8cc0guFBHn7/f7ZtbrGpuES9Nxysv15xZtnyKrda5DES7
         ZOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795549269; x=1796154069;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2vmyLu0fj3UnidokWQBdzXx40ajwhgez4jCRx5It+x8=;
        b=z8wZdnw9G5vSSCgc0bbjeZV8Dlaii54dFH1+BbnZcgqASeKHt+JFJrdQl5Q5wKXb0B
         Ku/mVbu9+8DnknG0h9hUFJPzW4vA0nqX177FniDCL33px4brd61ugkm9L4ht+F+4Pcgg
         OPyghJTR+vONSVpch4hUiGR2nKFeXU5wijIMYaUcQCXGklpImMoYOu9A4OUssW8oaCDq
         9zJ5BL2BXOOZPRGxRfq5/TmNEMqZ9sbg7ZyFkZXdtAHkfnBCZ35eg/B7OoHQ+VA73KkB
         wvhf1DsLNm3e5g9ecAaGHigrFLFK1OZUtZzRQL6FFZxPXQSIB4soCK2jUuZrKgXq4xRl
         2S6w==
X-Forwarded-Encrypted: i=1; AL+hErFS79Hn1x8AYgp2h302WymKJYDKQSGZ5AbCTSVxgj5Qq7NzTj4h5Z/VOVCiEtaXI0jXRZUxlDMSx88QHp8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sowm/UfsGnXE3HAcN9PT2trHcQ/FUab7f5oMu56QC2qGcQFxz
	mRYiK1xwWuAQSkCkPtPzN1SY86cbvfj+/sGOUoKI7xaJJqLnnhxpA9jUV9poqyJdhpKhsTQ5fd/
	rFxolnQ+FVXbfujZnx+bUpyRMJlUVrGU=
X-Gm-Gg: AZFdTZd1pfERYwCq1Q9ZctpqjnXf0TueAhBWNdzv5On6Wuv5dztBIRiMFIcuMV+eWGr
	uLiue+IAEXdajpRo1Dmu8mS8I805CgOCsT8S5GMfGAe/J5KoOaBjveDFzNoc4nfuGv/aZXesA/e
	6epvD8ebpjYXmJ749cW8KEoafAno9WWKr57pIbSqOV8H3pZM1/rF3jKroDx9OGQehcXZPZqnyqg
	6B/a6Yb99r4pZ9jnzhMb/eVeeez5Z3ZLjqnh8474aaerIkX9x0q/FOM1qEvGHvWSxdpdcmJxQno
	DCV3Fln6JTLknCMzgTr/oCFB6Y0s1nnCSuVJGu3DjzwW6OW+vV1ojCZS3hFnVzVVGbXiwEHLcs9
	2LNcy5z/5X1HsJkrBaEobGhmMrOZOe8qB7xMrdpO3SHvLj57dHauRtKPMMwzCokM61lFo4g==
X-Received: by 2002:a05:6402:42c8:b0:6ba:c8f5:180d with SMTP id
 4fb4d7f45d1cf-6bac8f51ec8mr4818837a12.19.1795549268628; Tue, 24 Nov 2026
 11:41:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120174341.35873-4-juanagusnicco@gmail.com> <179554500493.3135.4927369151169103128@kernel.org>
In-Reply-To: <179554500493.3135.4927369151169103128@kernel.org>
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
Date: Tue, 24 Nov 2026 14:40:57 -0500
X-Gm-Features: Aa3M54pN2jqlvjkTLZQmXsBkpJFB0IQDHtW-QrL9IKxIIMg-upICPH4zZY9HTqU
Message-ID: <CACQ4AchEcWdFRV+hfkR4J1t3_RHsQiaZ1-7PDi0RdqRQJmsv0w@mail.gmail.com>
Subject: Re: [PATCH net 3/4] udp: Ignore a connect()-set device in the bind
 conflict check
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, kuniyu@google.com, 
	willemdebruijn.kernel@gmail.com, willemb@google.com, e@erig.me, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> - [High] Incomplete fix: the port hijack in the commit message still
>   works through the local address that connect() narrows.

Addressed in note 2 of this patch:

"- connect() also narrows the local address of a wildcard-bound
  socket, which opens the same window through the address. It is not
  fixed here: connect() moves the socket to the secondary hash slot of
  the narrowed address, so a specific-address bind on a busy port never
  scans it. Closing that needs either a full scan on every bind or no
  rehash on connect, which slows down binds or lookups on busy ports,
  so I leave it for a separate patch."

> - [Medium] Incomplete fix: the L2TP/IPv6 bind conflict check still trusts
>   a device that connect() set.

I didn't include a note for this one but I was already aware. I think it
needs a separate patch that does not belong in this series but
maintainers can decide.

> - [Medium] Race: the lockless check in udp_bound_dev_if()
>   (net/ipv4/udp.c:134) reads flag, then device, then flag again, and=E2=
=80=A6

Addressed in note 1 of this patch:

"- A connect() that sets the device and is undone again, both between
  the two reads of the flag, can still be seen as a bound device, so a
  conflicting bind can be admitted. Not fixed here because closing it
  needs a sequence count in struct sock, a larger change for a window
  that the other socket's owner has to open within two loads."

> - [Medium] On a socket bound to a VRF (L3 master), the bind conflict
>   check still uses a device that connect() narrowed, not the device=E2=80=
=A6

This is pre-existing and needs a VRF to be configured: connect() has
replaced the master with one of its interfaces without a recheck since
before this series. As the notes on patch 2/4 say, fixing it is a
separate, VRF-wide change, so it belongs in its own patch.

Maintainers, let me know if you want any of these addressed in this
series.

Best,
Agustin

On Tue, Nov 24, 2026 at 1:30=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 3 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] Incomplete fix: the port hijack in the commit message still
>   works through the local address that connect() narrows.
> - [Medium] Incomplete fix: the L2TP/IPv6 bind conflict check still trusts
>   a device that connect() set.
> - [Medium] On a socket bound to a VRF (L3 master), the bind conflict
>   check still uses a device that connect() narrowed, not the device=E2=80=
=A6
> - [Medium] Race: the lockless check in udp_bound_dev_if()
>   (net/ipv4/udp.c:134) reads flag, then device, then flag again, and=E2=
=80=A6
>
> --
>
> udp: Ignore a connect()-set device in the bind conflict check
>
> This patch changes the UDP bind conflict checks in udp_lib_lport_inuse()
> and udp_lib_lport_inuse2() so they ignore a device that connect() set on
> another socket. SOCK_CONNECT_DEV records that case. A new lockless helper=
,
> udp_bound_dev_if(), reads the flag, then the device, then the flag again.
> Matching smp_wmb() calls are added in the connect, disconnect and
> SO_BINDTODEVICE paths.
>
> > diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
> > index 9f1f45afee532..a13bf32cbdb99 100644
> > --- a/net/ipv4/udp.c
> > +++ b/net/ipv4/udp.c
> > @@ -131,11 +131,35 @@ EXPORT_PER_CPU_SYMBOL_GPL(udp_memory_per_cpu_fw_a=
lloc);
> >  #define MAX_UDP_PORTS 65536
> >  #define PORTS_PER_CHAIN (MAX_UDP_PORTS / UDP_HTABLE_SIZE_MIN_PERNET)
> >
> > -static bool udp_lport_same_bind(const struct sock *sk, const struct so=
ck *sk2)
> > +static int udp_bound_dev_if(const struct sock *sk)
> > +{
> > +     int dif;
> > +
> > +     if (READ_ONCE(sk->sk_userlocks) & SOCK_CONNECT_DEV)
> > +             return 0;
> > +     /* Pairs with the smp_wmb() before SOCK_CONNECT_DEV is cleared. *=
/
> > +     smp_rmb();
> > +     dif =3D READ_ONCE(sk->sk_bound_dev_if);
> > +     /* Pairs with the smp_wmb() after SOCK_CONNECT_DEV is set. */
> > +     smp_rmb();
> > +     if (READ_ONCE(sk->sk_userlocks) & SOCK_CONNECT_DEV)
> > +             return 0;
> > +     return dif;
> > +}
>
> [Severity: Medium]
> Can a full connect() and disconnect() cycle on sk2 happen entirely
> between the two loads of sk_userlocks here?
>
> The writers are ip6_datagram_connect_dev(), __udp_disconnect(), the
> error path in __ip6_datagram_connect() and sock_bindtoindex_locked().
> They hold only lock_sock() of the other socket. This reader holds only
> hslot->lock or hslot2->lock.
>
> Say the victim runs connect(fe80::1%eth0) and then connect(AF_UNSPEC)
> between the two flag loads:
>
> CPU1 (attacker bind)                 CPU2 (victim)
> udp_bound_dev_if(sk2)
>   READ_ONCE(sk_userlocks)   /* clear */
>                                      ip6_datagram_connect_dev()
>                                        set SOCK_CONNECT_DEV
>                                        sk_bound_dev_if =3D eth0
>   READ_ONCE(sk_bound_dev_if) /* eth0 */
>                                      __udp_disconnect()
>                                        sk_bound_dev_if =3D 0
>                                        clear SOCK_CONNECT_DEV
>   READ_ONCE(sk_userlocks)   /* clear */
>   return eth0
>
> udp_bound_dev_overlap() then compares eth0 with the attacker's eth1 and
> admits the bind. The victim, however, holds the port on every device.
>
> On PREEMPT_RT, spin_lock_bh() in udp_lib_get_port() does not disable
> preemption, so the binding task can be preempted between the loads. On
> other kernels a hardirq or NMI can open the same window. The attacker
> can retry SO_BINDTODEVICE plus bind() at almost no cost.
>
> The notes after the commit message acknowledge this window and leave it
> open. Since this is tagged for stable, would it be better to close it
> here? A sequence count, a lock shared with the writers, or a single
> field that records the bind-time device would each do it.
>
> [ ... ]
>
> > @@ -157,14 +182,13 @@ static int udp_lib_lport_inuse(struct net *net, _=
_u16 num,
> >                   sk2 !=3D sk &&
> >                   (bitmap || udp_sk(sk2)->udp_port_hash =3D=3D num) &&
> >                   (bitmap || !sk2->sk_reuse || !sk->sk_reuse) &&
> > -                 (!sk2->sk_bound_dev_if || !sk->sk_bound_dev_if ||
> > -                  sk2->sk_bound_dev_if =3D=3D sk->sk_bound_dev_if) &&
> > -                 inet_rcv_saddr_equal(sk, sk2, true)) {
> > +                 inet_rcv_saddr_equal(sk, sk2, true) &&
> > +                 udp_bound_dev_overlap(dif, sk2)) {
>
> [Severity: High]
> Does the hijack in the commit message still work if the attacker binds
> a specific address instead of [::]?
>
> On connect, a socket bound to a wildcard address gets a narrowed local
> address and is rehashed:
>
> net/ipv6/datagram.c:ip6_datagram_dst_update() {
>     ...
>         if (ipv6_addr_any(&sk->sk_v6_rcv_saddr)) {
>                 sk->sk_v6_rcv_saddr =3D fl6->saddr;
>                 inet->inet_rcv_saddr =3D LOOPBACK4_IPV6;
>                 if (sk->sk_prot->rehash)
>                         sk->sk_prot->rehash(sk);
>     ...
> }
>
> __ip4_datagram_connect() does the same for IPv4:
>
>         if (!inet->inet_rcv_saddr) {
>                 WRITE_ONCE(inet->inet_rcv_saddr, fl4->saddr);
>                 if (sk->sk_prot->rehash)
>                         sk->sk_prot->rehash(sk);
>         }
>
> Suppose the victim is narrowed to one specific address and the attacker
> binds a different one. inet_rcv_saddr_equal() returns false before
> udp_bound_dev_overlap() runs, so the bind is admitted. In
> udp_lib_lport_inuse2(), the rehashed victim is not in any of the hslot2
> buckets that get scanned.
>
> Later the victim calls connect(AF_UNSPEC). A wildcard bind never sets
> SOCK_BINDADDR_LOCK, so __udp_disconnect() calls inet_reset_saddr() and
> the victim goes back to the wildcard address. The attacker's more
> specific socket then wins the lookup.
>
> This IPv4 sequence needs neither a link-local peer nor SO_BINDTODEVICE:
>
>   victim:   bind(0.0.0.0:P), connect(8.8.8.8:53)  /* narrows to 192.168.1=
.5 */
>   attacker: bind(127.0.0.1:P)                     /* admitted */
>   victim:   connect(AF_UNSPEC)
>
> After this, the attacker receives the victim's loopback traffic to
> port P. The commit's own example also looks exploitable if the attacker
> binds [2001:db8::a]:P instead of [::]:P.
>
> The notes after the commit message mention this window and leave it for
> a separate patch, and nothing later in the series addresses it. The
> commit message says the patch stops an unprivileged user from binding a
> port that another user's socket holds, and it is tagged for stable.
> Should the address case be fixed together with the device case?
>
> [ ... ]
>
> > @@ -194,13 +219,12 @@ static int udp_lib_lport_inuse2(struct net *net, =
__u16 num,
> >                   sk2 !=3D sk &&
> >                   (udp_sk(sk2)->udp_port_hash =3D=3D num) &&
> >                   (!sk2->sk_reuse || !sk->sk_reuse) &&
> > -                 (!sk2->sk_bound_dev_if || !sk->sk_bound_dev_if ||
> > -                  sk2->sk_bound_dev_if =3D=3D sk->sk_bound_dev_if) &&
> > -                 inet_rcv_saddr_equal(sk, sk2, true)) {
> > +                 inet_rcv_saddr_equal(sk, sk2, true) &&
> > +                 udp_bound_dev_overlap(dif, sk2)) {
>
> [Severity: Medium]
> This converts the UDP conflict checks. Does the L2TP/IPv6 bind check
> still trust a device that connect() set?
>
> l2tp_ip6_connect() calls __ip6_datagram_connect(). On an L2TP/IPv6
> socket bound with no device, ip6_datagram_connect_dev() therefore sets
> both sk_bound_dev_if and SOCK_CONNECT_DEV. __l2tp_ip6_bind_lookup()
> still compares the raw device:
>
> net/l2tp/l2tp_ip6.c:__l2tp_ip6_bind_lookup() {
>     ...
>                 bound_dev_if =3D READ_ONCE(sk->sk_bound_dev_if);
>                 if (bound_dev_if && dif && bound_dev_if !=3D dif)
>                         continue;
>     ...
> }
>
> Take the same sequence as in the commit message:
>
>   victim:   bind([::], conn_id X), connect(fe80::1%eth0)
>   attacker: SO_BINDTODEVICE(eth1), bind([::], conn_id X)
>   victim:   connect(AF_UNSPEC)
>
> l2tp_ip6_bind() skips the victim (eth0 vs eth1) and admits the
> attacker. Then l2tp_ip6_disconnect()->__udp_disconnect() clears the
> victim's device because SOCK_CONNECT_DEV is set. The victim now holds
> conn_id X on every device, while the attacker's socket is still in
> l2tp_ip6_bind_table.
>
> sk_add_bind_node() added the attacker's socket at the head of that
> table. So l2tp_ip6_recv() would match it first for control frames from
> fe80::1 that arrive on eth1 for tunnel X.
>
> The previous patch in the series lists L2TP as a __udp_disconnect()
> user, and nothing later in the series changes this lookup. Should
> __l2tp_ip6_bind_lookup() also ignore a device that connect() set?
>
> [ ... ]
>
> > diff --git a/net/ipv6/datagram.c b/net/ipv6/datagram.c
> > index 0296207dbeb0b..37a093f74724e 100644
> > --- a/net/ipv6/datagram.c
> > +++ b/net/ipv6/datagram.c
> > @@ -141,9 +141,12 @@ EXPORT_SYMBOL_GPL(ip6_datagram_release_cb);
> >
> >  static void ip6_datagram_connect_dev(struct sock *sk, int old_dif, int=
 dif)
> >  {
> > -     if (!old_dif && dif)
> > +     if (!old_dif && dif) {
> >               WRITE_ONCE(sk->sk_userlocks,
> >                          sk->sk_userlocks | SOCK_CONNECT_DEV);
> > +             /* Pairs with the second smp_rmb() in udp_bound_dev_if().=
 */
> > +             smp_wmb();
> > +     }
> >       WRITE_ONCE(sk->sk_bound_dev_if, dif);
> >  }
>
> [Severity: Medium]
> For a socket bound to a VRF master, can udp_bound_dev_if() still return
> the slave that connect() picked instead of the device bind() reserved?
>
> In __ip6_datagram_connect(), sk_dev_equal_l3scope() accepts a slave0
> scope id on a socket bound to vrf0. ip6_datagram_connect_dev(sk, vrf0,
> slave0) then writes sk_bound_dev_if =3D slave0. It does not set
> SOCK_CONNECT_DEV, because old_dif is non-zero.
>
> udp_bound_dev_if() then returns slave0 for that socket.
> udp_bound_dev_overlap() and udp_lport_same_bind() treat slave0 as the
> reserved device.
>
> For example, user A binds vrf0 X:P and connects to fe80::1%slave0.
> Another user then binds vrf0 X:P. udp_bound_dev_overlap(vrf0, A)
> compares vrf0 with slave0, finds no overlap, and admits the bind, even
> though A reserved vrf0.
>
> With the earlier patch in this series, __udp_disconnect() keeps slave0
> because the flag is clear. A never returns to vrf0, and the other user
> alone receives the port's traffic on the other slaves of vrf0.
>
> The early return for reuseport can go wrong the same way. Say B is
> owned by A's user, uses SO_REUSEPORT and is bound to slave0, and its
> scan reaches A first. Then udp_lport_same_bind(B, slave0, A) is true,
> and udp_lib_lport_inuse() returns 0 before it sees socket C. C belongs
> to another user and is bound to slave0 X:P.
>
> The commit message says:
>
>   A VRF master that connect() narrowed to one of its interfaces does not
>   get the flag and is compared as before.
>
> Is it safe to compare as before here? Would recording the bind-time
> device, instead of using a flag, also cover this case?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261120174341.35873-1-juanagusnicco%40gmail.com
