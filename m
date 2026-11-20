Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795160986;
	b=eI4kSAukVGAen2AjEhlCglANAtZB9bvHjBUGGWYzsJnn6cLDL/WGoGduogyZpbQljsYM
	 UdyxPNHlckfBtoATtotUb1RTKnOK8mAeWuKzt0q8xEmXDN+fM1NjAlaW934s7KHDSZcxH
	 cUbyPX4ef3Kl3jCrS1+Kijt0/mBRp0UTYf1jThfvDnJXocn9acdgvc06gS7ZCAKPykvHw
	 ce9Uku8yt0rGnbSu8xeVHdWJhF9R5D0a864vRNWy5i7TIOBGgThK0w5X3HFf3lflWZIKJ
	 bFVi32w6RkimxGBVskkfKRWFRksTWr34ymKxVzfOwwMbNTwizN/cCN2tCYCbShhg60w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PKfh3kaU0G0rUT/geWuCPv0s5ju8c8DPCj+FrnIkKs4=;
	b=v0xB0fwFzjaLb8l1kOuw3wUntXTHdoG64DR6bujtvpr+UAnYvl4EHh4PDJamMhlUvjVx
	 djAyWklcSUeDxshWweJNwvKBODGMcFsbfF3vfAc0cYbEIm75T6TFBobRecoF7ju7cZRW/
	 ggcZlaPre3bQN8ceWIMtbKw7DuD8Sg9sMRWGTP4b3qQj9qjLxLuWijJ2YDkE9woJ9m30y
	 km+3csO+jut38LTlx8HuOF/ORsm++bYBKUD2ln+b+ERNxg2+QRUwWjhc2Vow8RzOw/gkj
	 R2k09KYv0D9KW8nvBb0fFI/mlmISh387HsVfbnBJZ5kgpqIff0x50C/6FEDNHc6+WDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mW3WMEgU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056BA606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 056BA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mW3WMEgU
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so978837a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:49:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795160984; cv=none;
        d=google.com; s=arc-20260327;
        b=LFHvIAT+kC4UR1tRA2v6UsxI3nth5ax+JRFq4m09MDX6fp16C48C2FKOJTRH2MeqGr
         XyVYs+lelsa2myhZhlzeSZBJ+ohmpuMcOxgGjBGmPR8xEpwZjC28XEwOn55DJ4OexPUX
         NnuUf8rBaGQMZpYhZKlYeDBzP6gaGAadlwnrqPBYWsM8rYa67Y2JC/sYv89nXn37vsGI
         aTkX14TI2R33PiLwMpnrDURZik9bCml8uACI/NkT/YtP8Zz3pBdZy3I8BN2qlduWmVZH
         L75rcnWIsRFM/nRdr04jOAZypONzHAynuDwKUIJjHTxfmssi0CvOC7vwTfz1alphdPq3
         kaEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PKfh3kaU0G0rUT/geWuCPv0s5ju8c8DPCj+FrnIkKs4=;
        fh=y3tlE0iavSnxzSBVQPPyYjaB32hEk357htC1PmR9cbs=;
        b=fV5wWU6elPYiOCI5iX4jsv4rPsTGiZL8aqUJoy8TnKOtLA6R4whBRL/P6Y8tveQ/9D
         dRRDA9m5N3lRTuwBEmOa1IFQVSHtDJqYxZbbIcQUYksg38A7M7bQa7h3oKIuzVaF/OJJ
         TN75DOUv5iHtDu1TVLbPKRkfvSGkKgOuehNdlM+LuwdBJdR4hNQpRjhdZengHWGayqcn
         qzt/J7K8P5m5sxyOUdpqPPjpDvc8X9saxaBvziTQzlRPoZSoDqnqPAQ4jQPct01ypJA1
         DlVXnl1+1pfnpThWue5ibcZ79S6wX4T+L3RulHpLaXl/v/husCvh7svQhDk0emIZefT5
         746g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160984; x=1795765784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PKfh3kaU0G0rUT/geWuCPv0s5ju8c8DPCj+FrnIkKs4=;
        b=mW3WMEgUD7JxWrK0tDYJP86u4bhgYy7GpbQgMpG2Wci9ADVKI/VSjhSR9kqUPb0x9W
         53uhMZ32TdRHcMos72JJdUvFUO21lPqaZyELkv2MUA7IxDz19Qc2C+m2XAEBU/dc4bQm
         2CDrdlxYF8IglAThc2xqmrXUsHCXiYicI6+Hwy1l5pRkHAOYGW2eLn9tUu0kK2oVJMvx
         7rKO0mXhF9T2TQv5dlep+6ADg4BWUVJSnBkp+jaxXiB8kArorfh1EZeqD+Qlw3jTrlFX
         1mW8fCeiZhQSD2v2JBC0YnpanTKel9Jf5FBFxb7pqUSyrwXVzBbRaV8SymAOpuMVRyo+
         UmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160984; x=1795765784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PKfh3kaU0G0rUT/geWuCPv0s5ju8c8DPCj+FrnIkKs4=;
        b=gBEEzCDM7LEAlAnGjIZnuYoSPCBeC5GJX98lPKkn82cq6iE/hwZO51dDvxZEq+ksvk
         r5yi1YUViH05K1fbx7OCTdipPb6stbM35e13Q0B8hawZUx/CtakaWk8goALKOJtQEXkY
         EHoJBYfVVnon1h6P4myID00MS4ct1JJFsGYl8UZcweTy34oujQs/Ojhq6kgxn0g8lCIB
         9OsmSEVVpRVNCNmfliojGaHS1SntLkdVhmNW/pkYuiArzNIUtfRVcQfK1bvWoaMxN76E
         W7Jowu/2tUp7wQJo2kQHhop5Iva2PUIAb1bOUav/btE6fPfeRsV1fUdfb3Rm/+MXF4+T
         NdPA==
X-Forwarded-Encrypted: i=1; AL+hErGste878DO9LOChnDpZ8aWr+Cjkql8RXs1HdWOZWC9HVEHvbpScCU7NHlynvYHfvBksrF7xXmBuiDdX72M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rAITyvpoXuWVKiwDUIZPr4cGGZamt5Ssw1j3CcHiN2udBqWcE
	dOYNUzhaL62pQNpi+HgjuEQIsY/i9Vzfe/JGUREu1R777yajVnlt/KXYPMTkVQ1/D+sdmoHr9mE
	Kf3AxCH214rz4AINKiR1Um33owUxKDhS3RxZtg2Kmyg==
X-Gm-Gg: AZFdTZdLodjDgrTAtShmMv63DSiYajvoRp+EnS2p8KJyE5OYMog7ATV2HfBddYQgHgI
	oykvJsvNYseCZch678TOvIDxiS3K9lu4OzDvr3tMy5O/U1v3B0tBUlLJ5flzSzUkZI5P23RqyU2
	yyh6EPcTAV8FVfqwZwN9B0dImnZLiXvzugGgYGyDQ++72DhpRLHtd2YTUjwzUhE93KCurskwrlX
	MBP10ianPxwdw5fJXkP+2W9i89jnioF4V6e5Spipphhz4KId/c/blnaDD17vW1rXQ7IbpgmO/RR
	3/IjXL72QGIRI6Y1662ovaVtQmuG0u4VcMCG9lOygWnNEJnkzH8sQPQ6FB22oh4r3/YeMseNPSn
	R6k0FsKieYkV6v56/C1afFpi1CBBt5Bt9uJ2ZVXQ4tPZRLaIL9u/zDO20TfKd0CjBYWkWow==
X-Received: by 2002:a05:6402:51d4:b0:6b5:8cb3:5e19 with SMTP id
 4fb4d7f45d1cf-6ba37e8826emr1567455a12.38.1795160983956; Thu, 19 Nov 2026
 23:49:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119025942.2848130-1-neilb@ownmail.net> <20261119025942.2848130-5-neilb@ownmail.net>
 <CAOQ4uxgan=mpQ9yHOyZwZZp8E69+oH3uaPJ5CBkP7Z5BCO-5jA@mail.gmail.com> <179513093550.1728055.17648674323193416652@noble.neil.brown.name>
In-Reply-To: <179513093550.1728055.17648674323193416652@noble.neil.brown.name>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Nov 2026 08:49:32 +0100
X-Gm-Features: AclHuK92Odp_LX6Yi_Upic4sX2AvoYnwQkl4O4i6nLgkGpqLV9L63P1FdN9RHzY
Message-ID: <CAOQ4uxjECTaXaeH_cfgikrWF3jrg-knhSJuC0voVxdajAzH5-Q@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] Add d_for_each_positive_child family of iterators
To: NeilBrown <neil@brown.name>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Kent <raven@themaw.net>, Jake Edge <jake@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 12:29=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrot=
e:
>
> On Fri, 20 Nov 2026, Amir Goldstein wrote:
> > On Thu, Nov 19, 2026 at 4:00=E2=80=AFAM NeilBrown <neilb@ownmail.net> w=
rote:
>
> > > +
> > > +/**
> > > + * d_next_sibling_sched - return next sibling, but schedule() first
> > > + * @child:  current child
> > > + *
> > > + * This behaves like d_next_sibling(), but drops the parent d_lock
> > > + * and calls cond_resched() to avoid any soft-lockup.  A cursor
> > > + * is inserted as place holder.
> > > + *
> > > + * Caller must hold the parents d_lock, and must hold a counted
> > > + * reference on the parent.
> > > + *
> > > + * Returns: the next sibling, or %NULL if there is none.
> > > + */
> > > +struct dentry *d_next_sibling_sched(struct dentry *child)
> > > +__must_hold(&child->d_parent->d_lock)
> > > +{
> > > +       struct dentry cursor;
> > > +
> > > +       /* always skip cursors to ensure we make some real progress *=
/
> > > +       while (child && (child->d_flags & DCACHE_DENTRY_CURSOR))
> > > +               child =3D d_next_sibling(child);
> > > +       if (!child)
> > > +               return child;
> >
> > Why is this skip loop here and not after the resched?
> >
> > As this is written, if the caller passed @child which is another cursor=
,
> > now child the next real dentry after another cursor and hlist_add_behin=
d()
> > below will insert our cursor after the real dentry.
>
> You are right of course - that is the wrong way to address the problem.
>
> I think moving the test into d_next_positive(), like with this
> incremental patch, will work better.
>

Oh yeh, that's much better.

> Thanks!
> NeilBrown
>
>
> diff --git a/fs/dcache.c b/fs/dcache.c
> index bacb218400a8..46aca619a9a3 100644
> --- a/fs/dcache.c
> +++ b/fs/dcache.c
> @@ -2095,6 +2095,9 @@ static void d_init_cursor(struct dentry *dentry, st=
ruct dentry *parent)
>   * Caller must hold the parents d_lock, and must hold a counted
>   * reference on the parent.
>   *
> + * @child should not be a cursor, else two threads could potentially
> + * live-lock, each only stepping over each others cursors.
> + *
>   * Returns: the next sibling, or %NULL if there is none.
>   */
>  struct dentry *d_next_sibling_sched(struct dentry *child)
> @@ -2102,12 +2105,6 @@ __must_hold(&child->d_parent->d_lock)
>  {
>         struct dentry cursor;
>
> -       /* always skip cursors to ensure we make some real progress */
> -       while (child && (child->d_flags & DCACHE_DENTRY_CURSOR))
> -               child =3D d_next_sibling(child);
> -       if (!child)
> -               return child;
> -
>         d_init_cursor(&cursor, child->d_parent);
>         hlist_add_behind(&cursor.d_sib, &child->d_sib);
>         spin_unlock(&cursor.d_parent->d_lock);
> diff --git a/include/linux/dcache.h b/include/linux/dcache.h
> index 7150ecd81d72..c384b0f8743e 100644
> --- a/include/linux/dcache.h
> +++ b/include/linux/dcache.h
> @@ -697,7 +697,10 @@ struct dentry *d_next_sibling_sched(struct dentry *c=
hild);
>  static inline struct dentry *d_next_positive(struct dentry *child)
>  {
>         do {
> -               if (need_resched())
> +               /* Don't schedule on cursors to ensure we make some real

Hurts my eyes. Please add a newline. or shorten to ...ensure we make progre=
ss */

> +                * progress between scheduling

the between scheduling part is kind of obvious

> +                */
> +               if (need_resched() && !(child->d_flags & DCACHE_DENTRY_CU=
RSOR))
>                         child =3D d_next_sibling_sched(child);
>                 else
>                         child =3D d_next_sibling(child);
>

Thanks,
Amir.
