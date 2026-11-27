Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795777589;
	b=ny1/YhtY50S1HtsPVYw1eRvdx8gQ8Pw/CDyVNXPrfo06KC9NGDKym00lhVnkaLhtUf2E
	 EXnNGI3I+O/T3gxDgdpkzJ0rsdHFgp3MfZcKzvDLhXqh+Wd07wCfHqF4cd82w5ujYee5s
	 sUGzgjf/VB157IPU4Udk9mx/ecKjvKiYjGH9h+eRxOhDtEpiNCy7t8OUGV08f2IweENTZ
	 2RmcNiocnxTcF60/Rl2Ms0kUf3k8LCDpHWwPREwC04pQFI3I6iJMuCmQPWoKFzWr7mi//
	 R+DA74KKUZtsKr2pwRLB8d0mD6cGZqNR20YJ+T70kMfauz+KA2y7e/2Z8WddtvD36TQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fToPkxbMj9aSaNlXle3+uip1YFsu1M15ibYNmnEXT0I=;
	b=flO6t2EvmziwDFD6Q3CV0vnlJhaI+sj5knRWQoz9HJsLIq28X/ZxmMgu3mfwXWXWY02V
	 oMvkdKRbKXnu0HXBLeIiQcA488nOsmWC5nZaLXLqoNEayLxXlhlyqa6oHZmUMjNuzwUqK
	 pR9fCGypNwa5Ip1UrtlgnF9sJnkwPGM01uLhZ+8dtttB0i+1ofGUq7wtqJbFd/Wwpk9tB
	 FzXVwvHzTXbEHyCHsIwuwihFC5dj8shSpOy5qw1cjlLz+0zABmpSohcqJX3XXvLgCVRR/
	 4zGIgvi52E2GVlTwnX8Q+mh4U4SvrvoK3GlqheBE87hXcbKKj8Sp1Pz1bKQhKc5jPnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rkrVYxrp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB0D606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFB0D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rkrVYxrp
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so5384977f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:06:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795777587; cv=none;
        d=google.com; s=arc-20260327;
        b=nzBad283wb6IStgvnjOhz0j0qAwbxyzgjM/Xxfjhz5p60xKxWVHHeVfo4wgATjx3L1
         TNRRIwHgXALFhgvU71kvYeeKf6Lx9GgUEYfoXEaUxRsFBrY9aAQO0VUVWhCedj3QJLYO
         ZmEMGU+VE6DoP/JmM83OBLHZNS+Y4JvD/Wa6XMrCftN1Y21NqueC28qcHZhVu3acBjjs
         yeYs/aLFEAlNOfcEln33BPfpMOeHE6HYp0ykgDdmuZhNc6zndv5Dr1/mtWo3a4roOgOE
         mtwPN2Yt+wLqHwqSZwmSn+lxpx2O0L+WX1B0Vb61+TVjEp/WBHOP3wVUvpP+aR1hgA9o
         1WXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fToPkxbMj9aSaNlXle3+uip1YFsu1M15ibYNmnEXT0I=;
        fh=qjwLyXAmwNr1XhVRhyhM9sJNi+SWaui4kM2ZkzGdG/Q=;
        b=k27BaXN5Z/Wr0z4iF8Dg2BDTlPeHnyV2TuFH6yEWz3ffWwAWKcYlRx5WJ7TSoqlrq4
         YgVTJTEdLb6FgyKggDFg52Kz/ECg6bcsVzson+8Ocr8SgYpNGZqAwMA/0p7Id3yeWyn9
         8sjIvX4+8tQfPsiQZJTCBDKFBfsHIt8vMLrd+n35wJ2B/wPEVgi+Y6aer2RzfFEzmCpV
         BxgI9QfX8tZDQXYvtEKlPdw7zsrlHzowMxHNbkgQOQObTQZ+s0XK/6upc5tb3793pHY8
         rTBicYvtIvFHEHXhtHkMBGpHRPO8za0KkY5OA6CTF2Dbrb1GFF9NsfY/8yuxS22/xwyp
         LPUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795777587; x=1796382387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fToPkxbMj9aSaNlXle3+uip1YFsu1M15ibYNmnEXT0I=;
        b=rkrVYxrpyr6/dh7sRTJLaa5glCFAB0n4LiqyraEE+upHdJyoSNnkWWXzmwTynMHMlr
         kJCwTRIkCFkbnznpr7AF19V+hNm7d6LZ3QyNVLpWEgpcLt7EAQSJjjWGX/eFkrNbJ5B3
         RJcj7wls5qrJiQdlFy9p12hIFKNNmvk8hHdZ9yEo35o/XmKoAjCZskw6hr5KCJN0rltQ
         654/7ZzJlz6PpipiZRHyGdA3dT5HiPvukRj/2vpKGQwZRcjaUMhY3lNanXSMF17dg0K5
         iK6UfuOJe7hKVLTLeYctw5vIh3R+BfDDKHKwh6fhdv2z1o2/SSboFZtUHKU0fIXOAJ5L
         RGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777587; x=1796382387;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fToPkxbMj9aSaNlXle3+uip1YFsu1M15ibYNmnEXT0I=;
        b=zZ9GknyAlGX0INrtoDh/KtUDtCTnC/xbpYb35EZMoNZREBz9sq1QhXWSCe6Ob3dG7x
         eNovieIejUSscuylgEH+DyT2qjEAhHUkyXmK0EQgfECZn0rWtsj2leiIylWP6elLLlXl
         h0iXsk/keLIfRc9B35iJyztUO1RDQfxIElAfHZT+F6TPlI534oNddrlSpUXQdJtswO4t
         rMb4XEsgqNdTdgYszKWbe2blSMIOhgi7l6TEjbW92fsW2x0mT8bEY45qTHKY6nGNZMUh
         AzJmYuh4nm02DaJAXKRUs6tryCwpuIQqhSK94k7U9cjIq+VnlEDLjECjZHSybVJquNoc
         RVWA==
X-Forwarded-Encrypted: i=1; AL+hErE4a/Bp/oQiJfBpgjQf0gE/K+2leH5w9aX79JJVx+qXgTLNhWn1E+Kzav2+mkWJBEysCRf73Zeriol6ULo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZGDXe/gfu9yNguZq/TIyds7lwQ17qTdH1BOhfku1gzdmdpF8v
	rtNUOvlZ34zcxWMBMAIQmRnx2XDZsPF3+30a/iBDk9UskGfYu+ZQTjEWpYoG1oaoNMWBeWF7UDV
	ezWRg7hW/HmQgCDBt7rv1aDcNV3IXlJc=
X-Gm-Gg: AZFdTZd9Pg4FHUAPG24MHOp0bnXfs81BmBei/h2sjbHi+0QTpRJ0xe+vZnHpL7U7IRr
	uxOVJlURkluOtBYbUSU5GGTOhf4K0hAdquCx5dwBwaP52qvajjAxhnW2EYdlUoolj2J50vxfOjJ
	WbVZlK8F8W5RcWQlVK7t7Oon8qVERwgWbKyTNwxZvFhgu0tHKRYcnNVfHP4Hg0BQYDSCZ26ZptN
	30IRSH3UbAFuHRSidvBW9RlrfTRC+sYB8noiyIZk5mTMHh91JqNFGN0YABmnaw+Kh3YRCNR0bOC
	nt4Ptzb5KzDHGsQ3HEvm9l41LwJTY96AcbmBee6KTGzGZ6eCBXogpJO5VBOSKMjx9t3q8OGhENM
	n0Oa6EIuToRi7zC30ck67JawqOlEziRn//r6d9VuVFRm2MEo4+ij58XjtfvakJ3wEO0O9rcn6ve
	4dTKeHKc3nR/pHUss=
X-Received: by 2002:a05:6000:2c0a:b0:498:1a65:50ce with SMTP id
 ffacd0b85a97d-4abb1ab5d1amr49890261f8f.22.1795777586741; Fri, 27 Nov 2026
 03:06:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-l2tp-mcast-perm-v2-1-416741ccb334@gmail.com> <179560071114.3135.2532610269837690017@kernel.org>
In-Reply-To: <179560071114.3135.2532610269837690017@kernel.org>
From: Wong Steve <shyckless@gmail.com>
Date: Fri, 27 Nov 2026 19:06:14 +0800
X-Gm-Features: Aa3M54r9ImwZqH3PCd9cqwA8bx32ywqI8RPbWq3ryZMfNd1j07-JJ4T5cm48oIo
Message-ID: <CA+X8SdgnHtcNSCNQD9GJi7=X9pQihA1z0U48TagYohCFzpbM0A@mail.gmail.com>
Subject: Re: [PATCH net v2] l2tp: require CAP_NET_ADMIN to join the l2tp
 multicast group
To: netdev-bot+sashiko@kernel.org
Cc: pabeni@redhat.com, kuba@kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, netdev@vger.kernel.org, maoyixie.tju@gmail.com, 
	anilkaushikwireless@gmail.com, stephen@networkplumber.org, 
	linux-kernel@vger.kernel.org, horms@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Can an unprivileged user also control when that registration happens? If
> so, the leak is still reachable as long as this patch is applied
> without [1].

Yes. Where l2tp_netlink is a module that is not loaded yet, an
unprivileged user can join the free genl group IDs and then trigger the
load with CTRL_CMD_GETFAMILY, which calls request_module() for the
"l2tp" family alias. So the pre-registration case can be reached on
demand, not only by joining early by chance. The commit message
understates that.

> Should [1] also be merged with or before this patch, and be listed as a
> hard dependency for the stable backports?

The two patches are independent. This one stops unprivileged sockets
from joining the l2tp group once the family is registered, and does
that on its own. [1] (now "genetlink: Reject joining multicast groups
no family owns", v8) closes the pre-registration case for every family
that uses GENL_MCAST_CAP_*, including gtp. Neither patch depends on the
other to build or work, and the order does not matter, but a backport
needs both to close both cases.

If the maintainers want it, I can send a v3 that only changes the
commit message: say that an unprivileged user can trigger the module
load, and that stable backports should take [1] as well. Otherwise I'll
leave v2 as it is.

Thanks,
Suyuan

<netdev-bot+sashiko@kernel.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=8825=E6=97=
=A5=E5=91=A8=E4=B8=89 17:58=E5=86=99=E9=81=93=EF=BC=9A
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
> - [Medium] On its own, this patch does not stop an unprivileged local
>   user from receiving l2tp tunnel and session notifications, including=E2=
=80=A6
>
> --
>
> l2tp: require CAP_NET_ADMIN to join the l2tp multicast group
>
> This patch marks the l2tp generic netlink multicast group with
> GENL_MCAST_CAP_NET_ADMIN. After this, genl_bind() requires CAP_NET_ADMIN
> in the user namespace that owns the network namespace before a socket can
> join the group. Tunnel and session notifications, including L2TPv3
> cookies, then no longer reach unprivileged listeners that join after the
> family is registered.
>
> Link: https://lore.kernel.org/all/20261123155503.2497063-1-anilkaushikwir=
eless@gmail.com/ [1]
>
> > diff --git a/net/l2tp/l2tp_netlink.c b/net/l2tp/l2tp_netlink.c
> > index a07009d4cb009..c442e953df66a 100644
> > --- a/net/l2tp/l2tp_netlink.c
> > +++ b/net/l2tp/l2tp_netlink.c
> > @@ -31,6 +31,7 @@ static struct genl_family l2tp_nl_family;
> >  static const struct genl_multicast_group l2tp_multicast_group[] =3D {
> >       {
> >               .name =3D L2TP_GENL_MCGROUP,
> > +             .flags =3D GENL_MCAST_CAP_NET_ADMIN,
>
> [Severity: Medium]
> The commit message says the pre-registration case remains open, and gives
> this example:
>
>   "A socket that joins the ID before the l2tp family is registered, for
>   example before l2tp_netlink is loaded, keeps getting the notifications.=
"
>
> Can an unprivileged user also control when that registration happens? If
> so, the leak is still reachable as long as this patch is applied
> without [1].
>
> The new flag is only checked in genl_bind(), and only when a registered
> family owns the requested group ID:
>
> net/netlink/genetlink.c:genl_bind() {
>     ...
>                 i =3D group - family->mcgrp_offset;
>                 if (i < 0 || i >=3D family->n_mcgrps)
>                         continue;
>     ...
> }
>
> For an ID that no family owns, ret stays 0 and the join succeeds.
>
> netlink_setsockopt(NETLINK_ADD_MEMBERSHIP) checks only
> NL_CFG_F_NONROOT_RECV, which genetlink sets, and that val - 1 is below
> nlk->ngroups. So any free bit in the genl group bitmap can be joined
> without a capability.
>
> When l2tp_netlink registers, genl_allocate_reserve_groups() picks a free
> bit with find_first_zero_bit(), and genl_validate_assign_mc_groups()
> assigns it:
>
>         family->mcgrp_offset =3D first_id;
>
> On this path __netlink_clear_multicast_users() is never called. It is
> only called from genl_unregister_mc_groups(), so existing subscribers
> keep their membership.
>
> CTRL_CMD_GETFAMILY has no admin permission flag. For an unknown name,
> ctrl_getfamily() loads the module:
>
> net/netlink/genetlink.c:ctrl_getfamily() {
>     ...
>                 if (res =3D=3D NULL) {
>                         genl_unlock();
>                         up_read(&cb_lock);
>                         request_module("net-pf-%d-proto-%d-family-%s",
>                                        PF_NETLINK, NETLINK_GENERIC, name)=
;
>     ...
> }
>
> l2tp_netlink declares MODULE_ALIAS_GENL_FAMILY("l2tp"), so this sequence
> looks possible:
>
>   unprivileged user:
>     NETLINK_ADD_MEMBERSHIP on every free genl group ID
>       genl_bind() returns 0 (no owner)
>     CTRL_CMD_GETFAMILY name=3D"l2tp"
>       ctrl_getfamily()->request_module()
>         l2tp_nl_init() registers the family on a bit already joined
>
>   root:
>     creates an L2TPv3 tunnel and session with cookies
>       l2tp_session_notify()->genlmsg_multicast_netns()
>
> The message is built by l2tp_nl_session_send(), which includes
> L2TP_ATTR_COOKIE and L2TP_ATTR_PEER_COOKIE. It reaches the unprivileged
> socket, and membership is never checked again.
>
> Since the case here can be triggered on demand on any system with module
> autoloading where l2tp_netlink is not loaded yet, should the commit
> message say that an unprivileged user can trigger the load? Should [1]
> also be merged with or before this patch, and be listed as a hard
> dependency for the stable backports?
>
> >       },
> >  };
> >
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261124-l2tp-mcast-perm-v2-1-416741ccb334%40gmail.com
