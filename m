Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795424480;
	b=rBQQHtSYGC1dl1U+OWZRYIWPbNidQ6nLn5VkvU63n4vgx2QqyYckLVtmpUH9Ul0ylusa
	 Cqo1jZ3CT5TJLf8+mOHywfRVodFmRYU+iu7UoHGVZZ9CuWd1L9J9Ix00l+loqSYUaWH6I
	 pMR2hcdpqSG416o5Fu7LcgAFMntKFyrP17SR2UgCeR36z+q5P0psOQnp7WurVEcKEWNaH
	 qdEyj5FtgDy1v4k0MvkkWn+uIl2yh/7KtPVwqXLBPZfZ5gEUI6vN+5kYhYoi6tpB2oE9x
	 z9M1S5DWMV3pDrtIsSBDR1NxoC0Fxk/mUlJIOBiEGdQ9kiEiiWI6nYh0z4oKO96PuIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iEL2+JCwPEIGLNb/94dwdFv8o2SffeGDTCEHWPlYg78=;
	b=P75htLMj7hDtf957mX70DLv2DOAJ2r8w5bCbgKmpLvlrI+TgAxY93bSZ1MmpJuy1ytgJ
	 Y9UhVMn9cGPycV40mVHXYTqDH4I4hrjI343U2ImBl/8ADsr0M2YiCWZ2Ib1ZRaesFs/CH
	 cMTSHMTV1+fGd3kbEAaaIHIfaMingOGMkVXjhWZb/Jh/x3fZ6uHU2a6T4/iFBFihokSfr
	 wNXamJQvTH0KA4t2psq9O/PAPdWotFgmPXRUg1jqGooq6vXj1oHxaRu0HkBxN79G2IHU1
	 YfmfWgIXAOJDlzGF4vDE0siTqWBTjxyFFZgfuiGN8Vy6XA8kcCCABLZrsPL0AFAXoag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lDIypQYt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8DB606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D8DB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lDIypQYt
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so22615205e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:01:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795424478; cv=none;
        d=google.com; s=arc-20260327;
        b=kPkSVu1eD2EFxsyn3Rfs0IAZn2qfTqM/fQhTRHe8ggb5CNNIuuziK9cHLcQ2OkN28i
         /q6Muy3zzl77vl8GgOb3MwRBS6PU3ZOLH6nnWKECSSKbXwYlLIkFYVrEXqMonCChombS
         KaHrp9O4k7SbXujs89HJxtbR0HQjwuzs/xnguYxjBRuP7Z2YSn8d11Xch2tJF+Eq4b1k
         MkVFDdn8bmkYuynxfE/N2aKn7C6a6G/qQmOK3ss8Bo63qgFdvIVNNRuzzIiC2ZT89z8i
         zqdY2M5VXeMxVEEKJISiltW64yBDKI5tC+CzYGsk4XeL7c403ScKoCDMknEc+l7VZJeo
         J+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iEL2+JCwPEIGLNb/94dwdFv8o2SffeGDTCEHWPlYg78=;
        fh=GaiGO6FRo98xcxTB8e2OQPPslHsJfSYhJtNISFitKwQ=;
        b=lPAAmOqTfkroTqnFDtTn42JE/DFXSy7K7SM2aJkpC1zX0K+lnaKmDLsp/DHvCO2pgz
         ecVlfMUD8cothULSnB0IvwfjxbLSSQH10g1jsXLAbPHN6Vh9I1MzypSeBNS2FV522esp
         OoZ+8NiGpSUgC9b90P9rPZ5wL/QZt81SJW4T6/mfDxqg0vIpONjnisoGutSGUmwX7+I8
         cOLXWsyDXhl1rfJmfq9Lsop+lyaOirprTrYYLq+gwm2rFqvCZD/ATXl97xd51lo3OlRQ
         uWgrOx1/MKFSjzIjJrsL5+AZD+RVPfb3oVHpixRiwuIy49lZQqQ37YOiF/b1zFY5hQvB
         fnYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795424478; x=1796029278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iEL2+JCwPEIGLNb/94dwdFv8o2SffeGDTCEHWPlYg78=;
        b=lDIypQYtGMYSsqoisCS9ORWetWNwzyhWYxVQjJILGn0axWWQ3SroGPgW/kiaaKX9yG
         IDFdSR7frhwRDZe0FYTtuKwTlxCAHC/tcedkQTP5aOAzjXzH2GcJldQHAWllOsckAvYR
         zDkYGaVfrnIMRO3xlCAmV1PaDQBHVz8RWtdrhw2Gpcr2aJjaUyLx8Ob8gXCVW8Z2g5+x
         +Oav7XOBannXpEVHxIt3Yg03EFHtiE/K2Erb55vcNC3+Ck9FIBFIBpjwYjjb1uYq4Hp/
         JYfdu/A90MLfXAg8s5WFsy5AUpbuaGnENgRq7SXuJYE9ikITVnGenNGD/kGqAHGInVZ8
         FkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424478; x=1796029278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iEL2+JCwPEIGLNb/94dwdFv8o2SffeGDTCEHWPlYg78=;
        b=pWjQixT0VtXZTEZ6Cnb3dY0qtp58bDSi800v9+lr9IznZT1F4Ga13Xl/s9vS8/nkQa
         lOw11bzYSFy6UWhaSNeQI49ibSP5cvIyIv2kfAXn7eGpwMEdMhnOTDQ/9sP1ERdlgTAl
         RE+3XzU72VvZg0kGulIhV38j6/8TXAMFnlUR84ZWfe3P4T7DOz7OVngIr04um/+sac6L
         6NZ3lK1qFVLy/iYQAtjkab0tlqDcJS7IsB2HAUrWv+vObtmfkROP9MPH5bVjmnKz81WK
         4hmsXUKP79G9nHvhvBo/BkNFogiHPVYzXqD7FLmUvr5ux0ivOAi4lBPgvVwTH2It1Gbj
         kw0A==
X-Forwarded-Encrypted: i=1; AL+hErFphwtUS7PAV6zVNuFNIej6WPC7bBDUNjw9wk1kQqGqqodMr4NjKGJF+UHtVwPJK24Clvnf46YdZqZE9m8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pOQweFlTOxaKpt0JLLGWyID8oQnKD7ukKfizAwfyQRHrI3umX
	lb/zOW5UqxuasshZDn1/WTEDuzz7nRtqTNXqyaZxOmkwzP79geS49SY+tBQ8BbGhW7xnlP7zG+Y
	jUAcPz3fUgxKVrAuyNqn+Pf8m+oUStN0=
X-Gm-Gg: AZFdTZf9O92eyIq8jkxSJsaF2OWnxYwQBxRPduD2x+qghtac9eWb10KoYolX2waIn9c
	IjYErG7fvArFwrhOpR1yZLms/4tTEvA1JLG/7pGMLf4HQEv771Vg7oos8HCASCyQo18wDd4vjRf
	4vWkZGDqzxsaBsbeLTe/LH0I5YIsAZzH6KR8V6gw5cr8GAaP9PE9UVnYeFp2amwcDZZJNepJuRK
	QFLfKs+qcxkgUntqz0/JqFD6h2eCYWtxRmXJb9QvVpsPcsyeVlqh1J5/TrwR2zf81RTDziGVhIy
	YKjQ0u2ilXyJb0UtElG+VO8z+YLYXFlgcB1HUDhRchpRR/vzyPCto1VHNxOKQvsVZPt+3B3XadE
	/pV2D/gnqAvYvruSwawD/9xPlgSvl7UcfyUXJS0OLk280AtxcTaAK5GgciVxVzNXgcOJHFBdhXN
	NPf6DLmqYR4Dnb89UFzPgZevWc8CXutHMmaEr7vyjbIvV+y65NnrSJ
X-Received: by 2002:a05:600c:8b11:b0:4bb:6871:8f21 with SMTP id
 5b1f17b1804b1-4bb88822346mr226556425e9.23.1795424477763; Mon, 23 Nov 2026
 01:01:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-reuseport-lock-filter-v1-1-a3e5324c8d55@gmail.com> <179542364209.3135.6346728453187808939@kernel.org>
In-Reply-To: <179542364209.3135.6346728453187808939@kernel.org>
From: Wong Steve <shyckless@gmail.com>
Date: Mon, 23 Nov 2026 17:01:06 +0800
X-Gm-Features: Aa3M54p7sikU-xuQj6GlI0jXC-7c2SJPbhZVFn909Hn6R_I22BVip8-BRA2UoiM
Message-ID: <CA+X8Sdi2zLn8ZUOWXQww1DOFkOqkPWFwrF9t5LnHxn==3s+8ZQ@mail.gmail.com>
Subject: Re: [PATCH net] net: reuseport: honour SO_LOCK_FILTER in SO_DETACH_REUSEPORT_BPF
To: netdev-bot+sashiko@kernel.org
Cc: pabeni@redhat.com, edumazet@kernel.org, davem@davemloft.net, 
	kuba@kernel.org, kuniyu@google.com, willemb@google.com, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, martin.lau@linux.dev, 
	linux-kernel@vger.kernel.org, horms@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> - [Medium] The fix only covers the setsockopt(SO_DETACH_REUSEPORT_BPF)
>   path.

Thanks for the review. Right, the patch only covers the setsockopt
path, and that is on purpose. The disconnect and re-listen case is
different: the socket leaves its group, and when it was the only member
the group itself is freed, together with the program that belongs to
it. The program is not removed from a group that keeps running. Making
that path honour SO_LOCK_FILTER would mean keeping the group alive
across a disconnect, which is a larger change than this one.

If you prefer, I can send a v2 that says in the commit message that
only SO_DETACH_REUSEPORT_BPF is covered.

Thanks,
Suyuan

<netdev-bot+sashiko@kernel.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=8823=E6=97=
=A5=E5=91=A8=E4=B8=80 16:47=E5=86=99=E9=81=93=EF=BC=9A
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
> - [Medium] The fix only covers the setsockopt(SO_DETACH_REUSEPORT_BPF)
>   path.
>
> --
>
> net: reuseport: honour SO_LOCK_FILTER in SO_DETACH_REUSEPORT_BPF
>
> This commit makes reuseport_detach_prog() return -EPERM when
> SOCK_FILTER_LOCKED is set. Without it, an unprivileged process that is
> handed a locked socket can remove the reuseport program with
> SO_DETACH_REUSEPORT_BPF. This matches what sk_detach_filter() already
> does.
>
> > diff --git a/net/core/sock_reuseport.c b/net/core/sock_reuseport.c
> > index b9e5648fa4c51..cdff61161a70a 100644
> > --- a/net/core/sock_reuseport.c
> > +++ b/net/core/sock_reuseport.c
> > @@ -727,6 +727,9 @@ int reuseport_detach_prog(struct sock *sk)
> >       struct sock_reuseport *reuse;
> >       struct bpf_prog *old_prog;
> >
> > +     if (sock_flag(sk, SOCK_FILTER_LOCKED))
> > +             return -EPERM;
> > +
>
> [Severity: Medium]
> This closes the setsockopt(SO_DETACH_REUSEPORT_BPF) path. Can the holder
> of a locked TCP SO_REUSEPORT listener still drop the program by
> disconnecting the listener and then calling listen() again?
>
> connect(fd, AF_UNSPEC) or shutdown(fd, SHUT_RD) on a listener goes
> through this chain, and none of these functions check SOCK_FILTER_LOCKED:
>
> tcp_disconnect()
>   tcp_set_state(sk, TCP_CLOSE)
>     sk->sk_prot->unhash(sk)
>       inet_unhash()
>         reuseport_stop_listen_sock()
>           reuseport_detach_sock()
>
> With net.ipv4.tcp_migrate_req at its default of 0, and a program that is
> not BPF_SK_REUSEPORT_SELECT_OR_MIGRATE, reuseport_stop_listen_sock()
> reaches the immediate detach:
>
> net/core/sock_reuseport.c:reuseport_stop_listen_sock() {
>     ...
>         /* Not capable to do migration, detach immediately */
>         reuseport_detach_sock(sk);
>     ...
> }
>
> reuseport_detach_sock() clears sk->sk_reuseport_cb. If this socket was
> the only member, it also frees the group:
>
>         if (reuse->num_socks + reuse->num_closed_socks =3D=3D 0)
>                 call_rcu(&reuse->rcu, reuseport_free_rcu);
>
> reuseport_free_rcu() then releases the locked program:
>
>         sk_reuseport_prog_free(rcu_dereference_protected(reuse->prog, 1))=
;
>
> tcp_set_state() keeps the port bound when SOCK_BINDPORT_LOCK is set, so
> listen() can be called again on the same port:
>
>                 sk->sk_prot->unhash(sk);
>                 if (inet_csk(sk)->icsk_bind_hash &&
>                     !(sk->sk_userlocks & SOCK_BINDPORT_LOCK))
>                         inet_put_port(sk);
>
> On the second listen(), inet_reuseport_add_sock() finds no sibling and
> calls reuseport_alloc(). Because sk_reuseport_cb is now NULL, this
> creates a new group with prog =3D=3D NULL. The socket keeps listening on
> the same port, but the program is gone.
>
> Documentation/networking/filter.rst says that once SO_LOCK_FILTER is
> set, "a filter cannot be removed or changed" and that the filter "will
> be kept until the socket is closed".
>
> This only happens when the locked socket is the only member of its
> group. If it has siblings, re-listen puts it back into the existing
> group through reuseport_add_sock(). With migration enabled, the socket
> moves to the closed section and keeps the program.
>
> In a one-socket group, the program matters mostly when an SK_REUSEPORT
> eBPF program uses SK_DROP to decide which connections are admitted. The
> group-wide load-balancing change described in the commit message cannot
> happen through this path.
>
> Should the disconnect and re-listen path also respect
> SOCK_FILTER_LOCKED, or should the commit message say that only the
> setsockopt detach path is covered?
>
> >       old_prog =3D NULL;
> >       spin_lock_bh(&reuseport_lock);
> >       reuse =3D rcu_dereference_protected(sk->sk_reuseport_cb,
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261122-reuseport-lock-filter-v1-1-a3e5324c8d55%40gmail.com
