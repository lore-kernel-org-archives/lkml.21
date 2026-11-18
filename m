Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998326;
	b=WxxXiQU2nojWZyLBEVG/5WNciQV30TyASDTIoSo5eKkwK2hJvhjtiUtMnkRgTvjevYAA
	 q5q0RuT36XQ5e1DpPvyHaoSgMRH5V0toxrQYBBoD/KWmg2tRLyWJODkuB9CJaaERe4KaP
	 89MEFni4QD/KxDIbWgvcsIzYkFUld4vC81U3HKPVMaFS+FsJo7rhEkifU+3nGeIJeMlxl
	 jEzD1Fd7tQOIzNrWCQRWUnGmRZCjycNGoEgVJR1R5rfdLbLMkP7cT2mYiBClBDUb8v+92
	 RWsxa9dsFSmI3+txAKZNjUhGl+Dyp4gjdR/tf9+f4mFon/6MYiP0oW+Ww7O0u+I2TbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998326;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GxtG9BPmfEwj6u3aHjtehCc68SConjGhseToJDF1BtA=;
	b=JNNfZi+pgSQY8zryM4SqOd2vb3dKADLJ/PeT1PnIK8iCOwFXotUsblz7BmPi7WXU/zOe
	 c093G3xA/iFzbDw+wKXSVd2us3F0MPS7sT26y83QrrMBLDMSI4iN2cvCdZUZ2DlCEGeuw
	 44EEj4V9u7hZSHsIs7mnMWlYftBzO+AeEx1Yy5/LV/5cSEY0IdlVbtn9tHwzw7UYQxibn
	 TZpOKoGmZFo98mLwcIfIZzCP2REFco3i0I1JfXQJutbK7/6W8Cn4IaftF+g9P1hIFjFuL
	 0QFMpALTi+Q5eFdh6HJpwZVYU9CBhqnj2htb7WQ4rc0wEzNk7Rird9ioVuFsC99PVrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RaDOZtLy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE03606A336
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RaDOZtLy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D10A1F000CE
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794998326;
	bh=GxtG9BPmfEwj6u3aHjtehCc68SConjGhseToJDF1BtA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RaDOZtLyEJIbynRwJUAKMqPJaHF6f8UpIpFwhgq4+u/Mz1DkAAXmSJolb1BL8hqK4
	 cBBH7c8KhvjoQTw6Gluv/9VbzxJXLCOzD4q5ZgCj072SWMIrAZZKNNFin4T+6EkqBI
	 1uqtiTgwE1lJK3bgeb6nMZXEpLH+IkGOhZPiuJ46jgJsp6GxFu2/TD/4KeUtXMErAS
	 4YQeGSnDUHRWmqIEpKdCNMTymnLaLYoXUPHdb3DygFMNgOsxbfS8+4VCkA7EuNp+OX
	 eiJDsoMeIPRLX+ltwxBvCYvRYLC4OoXgKYfdftSjL6Lpkrpp5C5g83LXxVF2CZq8Wf
	 fVVS33owbj/LQ==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4ad587ba293so528983fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:38:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGQIYX+0gYif0x7RXUamUsDjBcsQ/HhqQdIVLYhxV/nEgECdH6sP893rv1NcWWMQwPk+jogXC+Z80NAOck=@vger.kernel.org
X-Gm-Message-State: APuU4Z98jWHBhWhVxMFvajmqphI64mI2557AvvaTISpiykDjnIqIgLSM
	Kv4dPapBWkt5CIlBAJkdDoA8ZMTM+jqP8VknZqNrJiA9JfIgJ+1gUpHTybvUTgdd+mrU2AJJula
	Cyx+Yy+i22yX7M9UvR/wYSB4Wn+/OuIs=
X-Received: by 2002:a05:6871:341c:b0:4ad:9182:beb1 with SMTP id
 586e51a60fabf-4b75764e892mr1847510fac.7.1794998325378; Wed, 18 Nov 2026
 02:38:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116024056.1274402-1-bsdhenrymartin@gmail.com> <20261118100729.jn66g5cvdkspoqjc@DEN-DL-M70577.microsemi.net>
In-Reply-To: <20261118100729.jn66g5cvdkspoqjc@DEN-DL-M70577.microsemi.net>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 11:38:33 +0100
X-Gmail-Original-Message-ID: <CAL4Wiip+hBuFcdyZPrJ+T-rKrwyfNTXDu9MUirPn4XtDpa3nZA@mail.gmail.com>
X-Gm-Features: AclHuK_c97tQ7s3T-ZTa9kSnkLABdRyUU8aDaqUhtSXXdkZQ2STr-YTR9BqUiPc
Message-ID: <CAL4Wiip+hBuFcdyZPrJ+T-rKrwyfNTXDu9MUirPn4XtDpa3nZA@mail.gmail.com>
Subject: Re: [PATCH] net: fix uninitialized heap leak in multicast address dumps
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Henry Martin <bsdhenrymartin@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
	Yuyang Huang <sigefriedhyy@gmail.com>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 11:07, Daniel Machon
<daniel.machon@microchip.com> a =C3=A9crit :
>
> Hi,
>
> > __hw_addr_create() allocates entries with kmalloc() and initializes
> > only addr_len bytes of ha->addr. Dump paths emit entries using the
> > current dev->addr_len, which can grow after the entry was created:
> > tun's TUNSETLINK changes a device from ARPHRD_NONE (addr_len 0) to
> > ARPHRD_IP6GRE (addr_len 16). Both the RTM_GETMULTICAST dump and
> > /proc/net/dev_mcast then emit up to 16 bytes of never-written slab
> > memory per entry.
> >
> > This discloses leftover kernel heap contents to anyone reading those
> > interfaces.
> >
> > Zero the tail of ha->addr at creation time, so dumps can only emit
> > initialized bytes.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: a748ee242681 ("net: move address list functions to a separate fi=
le")
> > Link: https://lists.openwall.net/linux-kernel/2026/09/10/320
> > Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> > ---
> >  net/core/dev_addr_lists.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
> > index d827cc21867b..53a2dfa2706c 100644
> > --- a/net/core/dev_addr_lists.c
> > +++ b/net/core/dev_addr_lists.c
> > @@ -100,6 +100,11 @@ __hw_addr_create(const unsigned char *addr, int ad=
dr_len,
> >       if (!ha)
> >               return NULL;
> >       memcpy(ha->addr, addr, addr_len);
> > +     /* Entries are dumped with the current dev->addr_len, which can g=
row
> > +      * after creation (e.g. tun TUNSETLINK), so never leave the tail
> > +      * uninitialized.
> > +      */
> > +     memset(ha->addr + addr_len, 0, MAX_ADDR_LEN - addr_len);
> >       ha->type =3D addr_type;
> >       ha->refcount =3D 1;
> >       ha->global_use =3D global;
> > --
> > 2.43.7
> >
>
> Looks right.
>
> Just a thought, I think switching to kzalloc, like so:
>
> +       ha =3D kzalloc(alloc_size, GFP_ATOMIC);
>
> Would give you the same fix, and you would get rid of that extra tail len=
gth
> arithmetic.
>
> Reviewed-by: Daniel Machon <daniel.machon@microchip.com>

I agree with Daniel, kzalloc() would be simpler here, this is not
fast path. You can then remove the "ha->sync_cnt =3D 0;" line.

This is fine as a hardening measure, but the root cause is in tun:

bonding and team both call dev_uc_flush() and dev_mc_flush() when
they change dev->type and dev->addr_len. TUNSETLINK does not, so
entries created with the old addr_len stay in dev->uc and dev->mc,
in an rb-tree which is now searched with a different key length.

I think TUNSETLINK should flush both lists, in a separate patch.

Thanks.
