Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530337;
	b=O4PTS4/Y6oroGrQDX2lNAPzbVhs/L+Zl3JlXe41sG8KHvFU+AICsUi5i1SiJ7e4kLgK+
	 YLK/xDiCjJPxf6V0vr+FqXR/cyej/SvugRgc3NkEpRHtmyvHvy/bZx2wU8ipgnEXa/hYL
	 KkUJrxX5A4doiF/X9xlzj7rEK6B+kobadSVIhrBrdDwr35lJjy/ZlBpGsWUHfd0QCacK1
	 SgN4ir+bUa7xeteQUv9BIQ3qcIVv1OZD7/goLQYvHRCNDib+4xKmUVjNZDyJPPypSpfdf
	 2gSOpnqKJp8nJA6Q9HqWu1JpEunWluU0pE673ic/sPhDUjRyGwb+9UE2KLGJ97AM2Pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dF9Eh9RPsijpEV4u/u30zGzXT7uW3lnbZk/EegXl/U0=;
	b=P3Pg79el9csDzzQeRxa3rGFTLa/3ix81zpzYyEwZSMP65PXV6eRES77+hqbsb1zfWG9h
	 e/kS85+wYkfFuwzmLcHAE9FATUOKVzjUcj85i4I0fExfJavbTTCHocppofl4kXyXF91/w
	 HEuU7pZFHC67CLDkW/x2kd5QXpUqWAKvzTZCoYicnK2h9s8hXW7onz9UytE2HZefCMVo5
	 +mW03C769JCT/YjyeXndcyekUGHE3scO6cca18umYO2jP9A5OUy301qjYa6NBabL+rGea
	 WJuATTQMrv9bO/CIeWTLu2ptfea2oRz2rwQ3RcVhQuirf3VNOJag+vUZotytwGFwDBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tbri3ZFl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2A8606A331
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B2A8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tbri3ZFl
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so2219721b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:25:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795530336; cv=none;
        d=google.com; s=arc-20260327;
        b=jjRbFO1eWbenTKbaPG+99E1/dk0Hefj9HZiUhyINAAbtkRjB55B3DiFFJAdryJXzNh
         DvAbSqEpqz76JeAR5CK84cUnvx5TIgYujMzEfpWNHyDZZYiZ8rFKyGoulCytYacM3u6i
         1dqarev2/eEN9PGQ+xnQg/ZQAI54SoXeQajISj8YggcclJ9LeIzv8HkGzf5fd46/Z0Bm
         XWMMrOikOCXWcpW+iCJZmZmxR6bT//il20+ZpnqmPvnOLYqhCxhwh9Y3XbKvBbs2/AT0
         ZXc8qQw7UJCkP1WrcPjZv6U9O/0pOufXJQgk5L9DXIs3uk6Bj1/61jJR6+bswfj5U0bQ
         rWAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dF9Eh9RPsijpEV4u/u30zGzXT7uW3lnbZk/EegXl/U0=;
        fh=G/BMG3cAU9T6r4vte0EweP9MI1If6XwkQcq6JQY7ZOA=;
        b=WS92ff700QCETMT9QDteYYzx233D/uw3oqhg+GmBcaZI3htEcN4KUxiSzj3bWGbUM9
         TFPowXE2T5hnphbyeuHpbCYUt+GYILCgEI3xkDj9ROR3qN/NSxsIIJfgNZPKUxOamRDJ
         LXMvywmVBCTgYpQpVK1L5n5hvcpgNzP0RFFLkXAG/9qcMc5A7RLwaXay55DZRiH1cfjS
         k5fDkpVwOiCP2xI2wYTH6ULwgLfO6djWDl3/q4DdDVeTU1a9DMSEAyNQ56UIo68KJPVo
         hhuR0I6DyUYv8Hroea1rLKY/fcv+UEJ2L/Dtm6viPDCKNn2+mv6f67/prt0AvlffDBQP
         c3rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795530336; x=1796135136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dF9Eh9RPsijpEV4u/u30zGzXT7uW3lnbZk/EegXl/U0=;
        b=tbri3ZFlUrXTvmw515RCeHxH0sH7SQMgNgV4Hs5g+fAXiaTlyEH6gd8EcScn0kODl4
         kJSqhU98sY/p9sPCL3A8XWGexJBCuOudwaaHJQ4n6UHDmfqoxTcQO7/9he0guOX3+/QC
         QLBjRtZ0GELPj36h256GZZCXFGO+13FJ630OlVbTUXuo/Z6h/aUfS241CTLqXTMD8oNY
         XP7O81LK5PyurfY+LoA2n1dLA1wfegVhSfIifHrHGpv0aXMh8DMoDeOkcrsSxeR6/nga
         hgdQLMDO3G/MD7T+aiDqeeqHV1d/Nu6326difSM6CAkNrLI3P11MTXexSCBCAj+rxuti
         5mCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530336; x=1796135136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dF9Eh9RPsijpEV4u/u30zGzXT7uW3lnbZk/EegXl/U0=;
        b=tXMTa60RdUomo2NKME2S13IalPJ1f3O0SUPmaWQkUjdJbP047b0Oq2c0hUPMgNvobG
         f5ylNFhLw701awnE5ZJD8KYu5XTt0foeYSXUlw0V7bkeCnOyNP4msOURPiGc/wT+k2XZ
         IK2Lfhm3Q2fI1+fZRWeZPgdyUUfte0SZEQv0A7ER3xRSTnkYM4mLYhzGCFHCQs3idygJ
         dn4inRj37mXR3ULkCB6SC2njoLhTam3tJsZDiLOcUXPzAAPcxud84OXgL+HVe0IP99Ti
         YEbMwY8H7+vN3memwawE0WAeIx19LndYlizUOxeGNXVNFqbFhtNNmhVFgh0XUKUDP3ww
         ZrgQ==
X-Forwarded-Encrypted: i=1; AL+hErF4XovY8bPMSg0anDtS60AVBjRbbMiXEl648sEbkQR9Xov2p6V0KzndFHN3ZdJ9bXf1IFmSMv1L3i1pSIQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hWUO38VEIe7/eSNb2J5IxdwVWUEy+hM+7RP+2oMrvze5QN2Vs
	+ne+l66FPI4CnoDAIDY/s6ZW6XXmKwevhDfdmYGb16n10kjYajJeki2cNGhvL0gA8YWxdJaxwGM
	+mfbinl/JSMddIwziGXVq587meO/rK4M=
X-Gm-Gg: AZFdTZeOU/rjS49c/imy5hfoc688pD60vxDbG3qFQh15BHxGuHAuvKUE6QrGB/4mvxK
	VDcFketXnOf/HxKiMhSxv+cJe1vATolytJPUyh+DqdKbYUEVY2VV0hdF4vhxbh529nuJmZOQ6TV
	SOUTUDpYaSHpTmyt/cTJAJnnAr0QIgN/sjW9evW7G64qm3vWcC/x6AdDSObU4bnh0Bj8T6mFQux
	JL8+9uVuF/mFtZxU5Si00l4TAMLV6iT7xYLbBhKyBAfNhGfU08qMHOK2UXFR+eE3bxAEAT6U9bW
	uie9SOz2R18DimwVMYO6TUZQMYfW5e1Bw0GnigcWU/k+G3nghCWBeZEQeWfkkRjyoLFVWh0YfJC
	6f8PwezzK8gjE6UAnYm82zzpvkpGbH8XG+qcYFrsBEOJLTo66hmcVE09gEuBi+ZDeqSYrbKiBQj
	nCMPGppL+vDZFMB4m4utJFVNuM036c2uIa+U7n3g==
X-Received: by 2002:a05:6a00:aa05:b0:8ac:3a71:38a6 with SMTP id
 d2e1a72fcca58-8c87d51b350mr14612611b3a.52.1795530336387; Tue, 24 Nov 2026
 06:25:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119170342.1508789-1-irogers@google.com>
In-Reply-To: <20261119170342.1508789-1-irogers@google.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 24 Nov 2026 09:25:24 -0500
X-Gm-Features: Aa3M54q7cf8dGtPcbVzPYANJ8EMqW3ekx7jrSJiP6UuKtxdr80Wu8XceJYu_RHk
Message-ID: <CADvbK_fM=xmwthLnz=j7YqRghc6ncDo8ESVYgWYeR0t_Byubhg@mail.gmail.com>
Subject: Re: [PATCH net] sctp: initialize new_value in custom proc_dointvec
 sysctl handlers
To: Ian Rogers <irogers@google.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 12:03=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
>
> proc_sctp_do_rto_min(), proc_sctp_do_rto_max(), proc_sctp_do_auth(),
> proc_sctp_do_udp_port(), and proc_sctp_do_probe_interval() point
> tbl.data at an uninitialized stack variable new_value on writes before
> calling proc_dointvec().
>
> proc_dointvec() can return 0 without writing to tbl.data, for example on
> a zero-length write (*lenp =3D=3D 0) or on a write at a non-zero file off=
set
> ignored by proc_first_pos_non_zero_ignore() (such as pwrite(fd, "1\n",
> 2, 1) or a split write where the trailing newline is written separately).
>
> When that happens:
> - proc_sctp_do_auth() unconditionally stores the uninitialized stack int
>   into net->sctp.auth_enable and sctp_sk(sk)->ep->auth_enable, both
>   corrupting SCTP authentication state and leaking 4 bytes of kernel
>   stack memory back on subsequent sysctl reads.
> - proc_sctp_do_rto_min(), proc_sctp_do_rto_max(),
>   proc_sctp_do_udp_port(), and proc_sctp_do_probe_interval() validate
>   the uninitialized value and overwrite the netns setting whenever stack
>   bytes happen to fall within range.
> - proc_sctp_do_udp_port() also stops and restarts the UDP encapsulation
>   socket even when the port number did not change.
>
> Initialize new_value to the current netns setting before calling
> proc_dointvec() (matching proc_dobool()), and skip tearing down and
> restarting the UDP encapsulation socket in proc_sctp_do_udp_port() when
> new_value equals net->sctp.udp_port.
>
> Found by enabling Clang's -Wconditional-uninitialized on an x86_64
> allyesconfig build, with AI coding assistant help to audit the warning
> and prepare the fix. Build-tested with Clang; not runtime-tested.
>
> Fixes: 4f3fdf3bc59c ("sctp: add check rto_min and rto_max in sysctl")
> Fixes: b14878ccb7fa ("net: sctp: cache auth_enable per endpoint")
> Fixes: 046c052b475e ("sctp: enable udp tunneling socks")
> Fixes: d1e462a7a5f3 ("sctp: add probe_interval in sysctl and sock/asoc/tr=
ansport")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  net/sctp/sysctl.c | 39 +++++++++++++++++++++++----------------
>  1 file changed, 23 insertions(+), 16 deletions(-)
>
> diff --git a/net/sctp/sysctl.c b/net/sctp/sysctl.c
> index 2b94c211427d..0c33f05fa532 100644
> --- a/net/sctp/sysctl.c
> +++ b/net/sctp/sysctl.c
> @@ -425,8 +425,9 @@ static int proc_sctp_do_rto_min(const struct ctl_tabl=
e *ctl, int write,
>         struct net *net =3D container_of(ctl->data, struct net, sctp.rto_=
min);
>         unsigned int min =3D *(unsigned int *) ctl->extra1;
>         unsigned int max =3D *(unsigned int *) ctl->extra2;
> +       int new_value =3D net->sctp.rto_min;
>         struct ctl_table tbl;
> -       int ret, new_value;
> +       int ret;
>
>         memset(&tbl, 0, sizeof(struct ctl_table));
>         tbl.maxlen =3D sizeof(unsigned int);
> @@ -453,8 +454,9 @@ static int proc_sctp_do_rto_max(const struct ctl_tabl=
e *ctl, int write,
>         struct net *net =3D container_of(ctl->data, struct net, sctp.rto_=
max);
>         unsigned int min =3D *(unsigned int *) ctl->extra1;
>         unsigned int max =3D *(unsigned int *) ctl->extra2;
> +       int new_value =3D net->sctp.rto_max;
>         struct ctl_table tbl;
> -       int ret, new_value;
> +       int ret;
>
>         memset(&tbl, 0, sizeof(struct ctl_table));
>         tbl.maxlen =3D sizeof(unsigned int);
> @@ -489,8 +491,9 @@ static int proc_sctp_do_auth(const struct ctl_table *=
ctl, int write,
>                              void *buffer, size_t *lenp, loff_t *ppos)
>  {
>         struct net *net =3D container_of(ctl->data, struct net, sctp.auth=
_enable);
> +       int new_value =3D net->sctp.auth_enable;
>         struct ctl_table tbl;
> -       int new_value, ret;
> +       int ret;
>
>         memset(&tbl, 0, sizeof(struct ctl_table));
>         tbl.maxlen =3D sizeof(unsigned int);
> @@ -522,8 +525,9 @@ static int proc_sctp_do_udp_port(const struct ctl_tab=
le *ctl, int write,
>         struct net *net =3D container_of(ctl->data, struct net, sctp.udp_=
port);
>         unsigned int min =3D *(unsigned int *)ctl->extra1;
>         unsigned int max =3D *(unsigned int *)ctl->extra2;
> +       int new_value =3D net->sctp.udp_port;
>         struct ctl_table tbl;
> -       int ret, new_value;
> +       int ret;
>
>         memset(&tbl, 0, sizeof(struct ctl_table));
>         tbl.maxlen =3D sizeof(unsigned int);
> @@ -541,18 +545,20 @@ static int proc_sctp_do_udp_port(const struct ctl_t=
able *ctl, int write,
>                         return -EINVAL;
>
>                 mutex_lock(&sctp_sysctl_mutex);
> -               net->sctp.udp_port =3D new_value;
> -               sctp_udp_sock_stop(net);
> -               if (new_value) {
> -                       ret =3D sctp_udp_sock_start(net);
> -                       if (ret)
> -                               net->sctp.udp_port =3D 0;
> +               if (new_value !=3D net->sctp.udp_port) {
> +                       net->sctp.udp_port =3D new_value;
> +                       sctp_udp_sock_stop(net);
> +                       if (new_value) {
> +                               ret =3D sctp_udp_sock_start(net);
> +                               if (ret)
> +                                       net->sctp.udp_port =3D 0;
> +                       }
> +
> +                       /* Update the value in the control socket */
> +                       lock_sock(sk);
> +                       sctp_sk(sk)->udp_port =3D htons(net->sctp.udp_por=
t);
> +                       release_sock(sk);
>                 }
> -
> -               /* Update the value in the control socket */
> -               lock_sock(sk);
> -               sctp_sk(sk)->udp_port =3D htons(net->sctp.udp_port);
> -               release_sock(sk);
>                 mutex_unlock(&sctp_sysctl_mutex);
>         }
>
> @@ -564,8 +570,9 @@ static int proc_sctp_do_probe_interval(const struct c=
tl_table *ctl, int write,
>  {
>         struct net *net =3D container_of(ctl->data, struct net,
>                                        sctp.probe_interval);
> +       int new_value =3D net->sctp.probe_interval;
>         struct ctl_table tbl;
> -       int ret, new_value;
> +       int ret;
>
>         memset(&tbl, 0, sizeof(struct ctl_table));
>         tbl.maxlen =3D sizeof(unsigned int);
> --
> 2.56.1.708.g77570a6a1d-goog
>

Acked-by: Xin Long <lucien.xin@gmail.com>
