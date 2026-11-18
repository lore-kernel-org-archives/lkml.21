Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998396;
	b=5U6dcrSCi87ZciFoL36AG3xjixOf8hsQI+jHtDZcBw7PYIEf420A0EXjnZgAmSqU17ph
	 DZKtdPZJ1yzzDsTng11ajdwlAqE+QdBudAWL1a55Hdm1Tp/NRoeueJRs5K1tod5jscLUh
	 F7AaLNpt7/4ooc/CHKWRFF2etZlKQY7ZGTaN6Ycsvf8yazqtMU7smNkKJiNOfbVd+stqZ
	 BsF6WKb7A36hjiP0twilCRhLXDp0+B5jyxwd1bY/E1OD9nScLHebxtUUjfU0G5EMaBXDP
	 EObklRnt7zMOlZcB45xZAeFZDFaE4aHtKVAZgMMR1Fd1bFLcmy+lHlAjkrwNrVQWfyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998396;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gBoWaO2BpC7nFhli8/O/xwsvCcPKI30OlLn0Mx8JuFM=;
	b=bZ7AHeZf6DgizQ6CQCEuQyNEWPQm20CHwvc6ZtGApZp6zdf5vPoPiPjSDW8KDSQ+o2UR
	 4lPsfGnO3ch2uer20sMWn7tf8/E13U9Jw9Al9g2nOglE3E6ABTiSm6FbHxBWl/zNs7Po/
	 ROf8a/AoQ38AOrNtccRi1WpOrlhrjN3NMVgWS7R8ArgUb5vvDJqgyHrOYgg4fgYSyn9VC
	 8dPMAWRlKjVJOIrEcte1TI0/WqkjslLKW4o/G3joCmcjbwFeNqVYI+EGuCrbUqaOFmo6C
	 cFnwtHH8Ic4qDzDvVMFXyokH0r0f2dbzorItztIyLbSrD8wJvwTsa8H2DbgI2Eyd4FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kZMEFJi6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84D5606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kZMEFJi6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9132F1F000CE
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794998396;
	bh=gBoWaO2BpC7nFhli8/O/xwsvCcPKI30OlLn0Mx8JuFM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kZMEFJi6YvZYZEoA6tjjUn6+nPNpMa++glv5pA/Fd93mEFIBpqdWHz5JqxhSqJXto
	 zOVD1ZNdrOU259d5HGphMDN5GPc7BtcVWSW9AMa5w7FYgfcVMU0+eWkDNQkJcbPQ13
	 5J0icKUCF1LHroq0HP9gwYBDde0odFIHgWX5deFGj1BxiEEP3uSwYsRxIqfW+FWm2f
	 o86mi1xTcT1Dv5/oRmsosGx7OFOQ9ImwOx6NLSWa0Bbv5eCnxHnT1ugv5EfIVfoEPL
	 36QsqS0Ts9bUddRudDXfmdjYwxY8eDhK+q0GHaVIh4JjImNK3OLgEMk/Z3pibjTpmB
	 Yc+z0ZF0ZX9cw==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-71aea92f666so512419eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:39:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHSIpTK5x/OI5Jbj3ZmHSWyrC+svj5GsKbtfL3QhtG7LqIDCfyGRMi55snZTxyU/L80Pi9MJDwwxqCxgJs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zYX8T6YZKKauWTXbo851XM9RctsuwE58YUBBWT1C41IqoNuXu
	6gqy9gAMm9kHxsHsPPp9YMAp85a52f7bdpCLyJFha6At9GjHJwPPqYDZpJxXKC8XgBXSj+z0vSL
	VO4Fhbh8x52IomMfA+8WS3YTGUNvfvAA=
X-Received: by 2002:a05:6820:2306:b0:70b:8148:94f with SMTP id
 006d021491bc7-71b18610c01mr1159744eaf.76.1794998395684; Wed, 18 Nov 2026
 02:39:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116024056.1274402-1-bsdhenrymartin@gmail.com>
 <20261118100729.jn66g5cvdkspoqjc@DEN-DL-M70577.microsemi.net> <CAL4Wiip+hBuFcdyZPrJ+T-rKrwyfNTXDu9MUirPn4XtDpa3nZA@mail.gmail.com>
In-Reply-To: <CAL4Wiip+hBuFcdyZPrJ+T-rKrwyfNTXDu9MUirPn4XtDpa3nZA@mail.gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 11:39:44 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqAB6sbiGnRuOqaA-TBuMi8kFPSt6SDtuj0+FpU36k-yw@mail.gmail.com>
X-Gm-Features: AclHuK9VaZOgPE54qY8a9OdI1oZgonXk27f25PRd6DD4-jtXavC-2_khlA46Uno
Message-ID: <CAL4WiiqAB6sbiGnRuOqaA-TBuMi8kFPSt6SDtuj0+FpU36k-yw@mail.gmail.com>
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

Le mer. 18 nov. 2026 =C3=A0 11:38, Eric Dumazet <edumazet@kernel.org> a =C3=
=A9crit :
>
> Le mer. 18 nov. 2026 =C3=A0 11:07, Daniel Machon
> <daniel.machon@microchip.com> a =C3=A9crit :
> >
> > Hi,
> >
> > > __hw_addr_create() allocates entries with kmalloc() and initializes
> > > only addr_len bytes of ha->addr. Dump paths emit entries using the
> > > current dev->addr_len, which can grow after the entry was created:
> > > tun's TUNSETLINK changes a device from ARPHRD_NONE (addr_len 0) to
> > > ARPHRD_IP6GRE (addr_len 16). Both the RTM_GETMULTICAST dump and
> > > /proc/net/dev_mcast then emit up to 16 bytes of never-written slab
> > > memory per entry.
> > >
> > > This discloses leftover kernel heap contents to anyone reading those
> > > interfaces.
> > >
> > > Zero the tail of ha->addr at creation time, so dumps can only emit
> > > initialized bytes.
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: a748ee242681 ("net: move address list functions to a separate =
file")
> > > Link: https://lists.openwall.net/linux-kernel/2026/09/10/320
> > > Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> > > ---
> > >  net/core/dev_addr_lists.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
> > > index d827cc21867b..53a2dfa2706c 100644
> > > --- a/net/core/dev_addr_lists.c
> > > +++ b/net/core/dev_addr_lists.c
> > > @@ -100,6 +100,11 @@ __hw_addr_create(const unsigned char *addr, int =
addr_len,
> > >       if (!ha)
> > >               return NULL;
> > >       memcpy(ha->addr, addr, addr_len);
> > > +     /* Entries are dumped with the current dev->addr_len, which can=
 grow
> > > +      * after creation (e.g. tun TUNSETLINK), so never leave the tai=
l
> > > +      * uninitialized.
> > > +      */
> > > +     memset(ha->addr + addr_len, 0, MAX_ADDR_LEN - addr_len);
> > >       ha->type =3D addr_type;
> > >       ha->refcount =3D 1;
> > >       ha->global_use =3D global;
> > > --
> > > 2.43.7
> > >
> >
> > Looks right.
> >
> > Just a thought, I think switching to kzalloc, like so:
> >
> > +       ha =3D kzalloc(alloc_size, GFP_ATOMIC);
> >
> > Would give you the same fix, and you would get rid of that extra tail l=
ength
> > arithmetic.
> >
> > Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
>
> I agree with Daniel, kzalloc() would be simpler here, this is not
> fast path. You can then remove the "ha->sync_cnt =3D 0;" line.
>
> This is fine as a hardening measure, but the root cause is in tun:
>
> bonding and team both call dev_uc_flush() and dev_mc_flush() when
> they change dev->type and dev->addr_len. TUNSETLINK does not, so
> entries created with the old addr_len stay in dev->uc and dev->mc,
> in an rb-tree which is now searched with a different key length.
>
> I think TUNSETLINK should flush both lists, in a separate patch.

Something like:

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index d4870bdc156f..f675e5469cfd 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -3387,6 +3387,9 @@ static long __tun_chr_ioctl(struct file *file,
unsigned int cmd,
                                           "Refused to change device type\n=
");
                                break;
                        }
+                       /* Addresses were added with the old dev->addr_len.=
 */
+                       dev_uc_flush(tun->dev);
+                       dev_mc_flush(tun->dev);
                        tun->dev->type =3D (int) arg;
                        tun->dev->addr_len =3D tun_get_addr_len(tun->dev->t=
ype);
                        netif_info(tun, drv, tun->dev, "linktype set to %d\=
n",
