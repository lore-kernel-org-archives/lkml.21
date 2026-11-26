Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795703549;
	b=VPZ4S5BepJKEq3qqUDaR7l/DOUmhiWUMo5bZKOdfagOo39S2iu+zfC3vOEzQyrGxJygC
	 XA6Sno83Zwd3cnqkK63xUpgvXBruzCUlxkmYLIdit8V/qaN0wTjETHHm8zdQPmUv66CWL
	 gjoBKIFnzVfvar8e/Fzdwrwe+NMJm7utmngmMP2Rbg6FiZR4GLpco8gXw70Ze6RI7Nc1n
	 ygmInXp8ygKuldnX2a3NDzRPSMANF5pl/YNTIqEDNbaljX8Z9NS7FcGGz7/6tgFE0of+e
	 m0g2s9R8CyVARRP74QO9sF0TvH5/MS6rUJAGO13OcdgiW+TOQFmuZoa1xhZtcmyDRMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703549;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZBcNEAgJHSy4LVa0EEBy71Jr78O+HkW/q/nH1NNGyoc=;
	b=UHfOvhnF1V+Sc+PULl3bbZYTx6AjFJxue26OushCprovi92NnHz62BRRIfnSG4X3Tg2e
	 z5JX4txk4ljt+hZ7D0TUJVUlIzcm+dv0ECR5Jmm9aFEDZoNdf0Gmkr2M3ksoTaGFOryvw
	 6OZdLscpJ5TkCXff7yo03xicT6oNuSAx+/n66T0lAaaDgEJIaw5NGqgED++/NWUBfNs8D
	 YESyp0Ar0NUMrEeqqrMTI3FOBU0etWM7eWSdN2I3VjVkE1Bkn10bbPYv6VxqG0ljAwgGO
	 bIY40rcSdH0fenoPr2pFJsUTnhGG8VazCdeim8IiiWCavaRGeZNSavObEoHSB+6x4Eg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="dWhkAlm/";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kAQxEPx5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D29606A331
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53D29606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dWhkAlm/;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kAQxEPx5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795703544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZBcNEAgJHSy4LVa0EEBy71Jr78O+HkW/q/nH1NNGyoc=;
	b=dWhkAlm/rgUPJl3OyPpQzb7XCB7dWuPSJ07TXheuGSFN2uVe3I9XU/TzKF4kp+gW8Wzogo
	PTZD2ssp9kGpNZENFnJXmKpiZF6/3WyyuvtQBWSB2Zs1Z9N8pKOsk/IyZEj3XZVQYyZzia
	SFa3Kx2DJbJT7Un3EZazyg7sPxAXlLk=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-qqFJBW-DO-mo-Ydgi9h55Q-1; Thu, 26 Nov 2026 14:32:22 +0000
X-MC-Unique: qqFJBW-DO-mo-Ydgi9h55Q-1
X-Mimecast-MFC-AGG-ID: qqFJBW-DO-mo-Ydgi9h55Q_1795703541
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b51464f007so85774647b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:32:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795703541; cv=none;
        d=google.com; s=arc-20260327;
        b=cJXNx8F743hJyLcZppayJUyF1Sfwy5d91eNcBTHGPnwXHgCw3zKiPOVQ+2CL4jBVRt
         hsLvpxkDoIo8bXIXR8Yn/iItsg2rTPLKO7aVLTi8tj7xuRgNBUTBiEVsO13JaN+euDTy
         BIrDiSva4JSs6LhXOxeB+hEfWRktq5d1kcKgFuQMt3XCnqL+OU4wKpQ6UUsBKfQes/vf
         H0t9q9fBj9rxfvDg74kKXNFrHNHGq8OBBIHT4x1Fz2rK4699o/n5CPcHxlU7i+YP30Ua
         +zGJoBQ2B0Cjz0OBaEOe9bgoa7duAv1ogS8MuD12/eBjako08SIF+SCtXJx5dyY7Frns
         JnOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZBcNEAgJHSy4LVa0EEBy71Jr78O+HkW/q/nH1NNGyoc=;
        fh=8HP7U3rYkPovXV91UQ6wKn0CFo4e6d+JYG2k3BZyT8s=;
        b=dRX8d23nEr+tipcK65H/xcWDeD9Is07Db0RBslyp1ar3iyHyHIFlq7NMysS63SOct5
         b40QRjA8moehqtdM78HWp1DY/8ZdtHBQiDG3mtToRgJfAFsP7qXfsbS2j9dRaAEKC2/T
         AYp4IP6tpWCHs0711kY6tj5yJ+lMgQbczCqx0fYKfetGzoi7VrPM/SYkA83tH+hQVOhu
         3vNreBPXvrXJAPDvbGB2LV+dAiv0jEeiPKQwkwFRQpwAkOeGZ11kSnWdvwhfRqDKR+GW
         kS+cSeFcLBHUaqLqT2VS4zgEpL5a8P//9F6uIqbykq5Eo4XpX8NtWdWdGCHwvR9A0Mw/
         t/KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795703541; x=1796308341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZBcNEAgJHSy4LVa0EEBy71Jr78O+HkW/q/nH1NNGyoc=;
        b=kAQxEPx5oasXLg4Pt+Xfz5hwvlrLHucbfaO/vKl0kanZWdof2TEW03W7Cm8+ifuGG1
         +mTWcWl0TLsimQFyQjuxmAs68b518GOVTaNyq6JkGgYJennJ5JwCRSLWVOEbVhcLd8mu
         PS0vK7WyEYOUS+8IB9DMZbz1kb2E1uvxBiBfXLbqJpz2O6Ua914XDl14FBTKKD4gjQw9
         6S0w3j1BBdWSZFqJfL+JjHQLJcdfwmhKmZNwNf+bAUj6GjY268imgron4i7nXJSKqIaC
         LEmiogljUYdXLD3VKDxp2zRY+/CXyVEpCoB/KGdCeP0z/wSfPeipbX61apofl98nNmsS
         Km6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703541; x=1796308341;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZBcNEAgJHSy4LVa0EEBy71Jr78O+HkW/q/nH1NNGyoc=;
        b=TJiwThl4oj5Xk4oKmbZ+iJER8XduZQXbF7XRfrKOou33aHPA2pWvgxIcr8QasBl/Kv
         7KBXQrL4wsLydIT2RFoDkYbDsd+jfLrB3zrxjgs8ctAEpZd3DeCSlBeQcDi9XPrUi0Z3
         M8cmQR/AaPUdbiOLVmxmhChNL4TT+ry33aVvPJmYjLVQYNI9wYgcNmCJmoL7RXFkCU4V
         uHfs6lFtAQDCUePovK9npvXn6zq74yS/GkaYjFvEem19Lpj6erwoGo8WmFLMVl9uvNA+
         GRgZ6dMATcyXe+uSIIaTrjt/ewbjVd/dVJV2gqgqmkRMYy0OfYM2jEYoN4gZtOrsClNS
         weQA==
X-Forwarded-Encrypted: i=1; AL+hErFj0GI8Vem9fl72fo2Q35SSTfwzGxxynH03SXNnEww5v4zpTARr4CY7OTogq6ngg9spYfdLLenanMBRXY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d/DzYjboCuL5Y2PXpOHvrEnvWdqoxivMQYuaPgnpTNmfVCDbK
	9cZ9v9deLoICol6mKT6G9K0T1OflylwvDrtconuOzjhgRAH5mvxeMGLHUeA8WhTcrG6bN/Zm3Al
	+maP1wRzogJrjd9Uq986hn3dQ5j+4beW2rMckENWBykUWwDoyq6y1hP6bCtQOkg0YYHSoekC/sw
	htHY+kyozc32JL7YaavURtfEJ6E920wDyWDvnKG4PQ
X-Gm-Gg: AZFdTZfiahkjVmpJKlglL5jLwUrXv0lGFyCGsEhhNiG7ONdEkIJHKzoFxcBn/mrofsg
	Tx4CzV/a2xI15r37qoHxj5cLjwdi4QlvghJWWDGyeqAftTJho+eLd3y3LNMbiPLobrnjq7fsXXq
	AniobZgEcmrm4NEKM0rPxi03N+7oM5odUsHn7wtjGBo/I7q95dgeFt4Z24++17I9hyU3G5nUsbs
	IVDCZgSlkN4z7jiSa8+CbJtpPPAKLlZUBvmPTZ2Yqm3sA==
X-Received: by 2002:a05:690c:7349:b0:8b4:fc2d:2fbd with SMTP id 00721157ae682-8b52042becemr71775467b3.22.1795703541272;
        Thu, 26 Nov 2026 06:32:21 -0800 (PST)
X-Received: by 2002:a05:690c:7349:b0:8b4:fc2d:2fbd with SMTP id
 00721157ae682-8b52042becemr71775297b3.22.1795703540562; Thu, 26 Nov 2026
 06:32:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125091157.1822521-1-huangsj@hygon.cn> <CAHc6FU4h-FRvLkO_0ouTey9MbX=n61t3abt4hPNFOthsRGG9mQ@mail.gmail.com>
 <awgi6a0Hayug7RJH@hsj-2U-Workstation>
In-Reply-To: <awgi6a0Hayug7RJH@hsj-2U-Workstation>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 26 Nov 2026 15:32:08 +0100
X-Gm-Features: Aa3M54qEByO_EHNX8OHGBPouiZLwpLPKlFRFRV9aYOI6i2TAngEySFHZ6dr1dD8
Message-ID: <CAHc6FU4KLxzoQ6NJQUnFfcbKufqwqdhfcGhva9V44K=J7HCXRg@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] vfs: add inode iteration methods
To: Huang Shijie <huangsj@hygon.cn>
Cc: viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, 
	hch@infradead.org, mic@digikod.net, axboe@kernel.dk, gnoack@google.com, 
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, legion@kernel.org, 
	aleksa@amutable.com, libaokun@linux.alibaba.com, ebiggers@kernel.org, 
	djwong@kernel.org, sandeen@redhat.com, zhongyuan@hygon.cn, 
	fangbaoshun@hygon.cn, yingzhiwei@hygon.cn, wujianyong@hygon.cn, 
	shijie8@gmail.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	gfs2@lists.linux.dev, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Nov 2026 at 13:20, Huang Shijie <huangsj@hygon.cn> wrote:
> =E5=9C=A8 Wed, Nov 25, 2026 at 11:25:12PM +0100=EF=BC=8CAndreas Gruenbach=
er =E5=86=99=E9=81=93=EF=BC=9A
> > Huang,
> >
> > I have some thoughts ...
> >
> > On Wed, 25 Nov 2026 at 10:18, Huang Shijie <huangsj@hygon.cn> wrote:
> > > This series adds a superblock inode iterator and converts the open-co=
ded
> > > sb->s_inodes walks in the VFS to it.  The design follows the cursor-b=
ased
> > > construct proposed by Christian Brauner:
> > >
> > >   https://lore.kernel.org/all/20261120-mitverantwortlich-drehbaren-ka=
ntholz-241300d20168@brauner/
> > >
> > > and is the same direction as Dave Chinner's patch set:
> > >
> > >   "vfs: improving inode cache iteration scalability"
> > >   https://lore.kernel.org/all/20241002014017.3801899-1-david@fromorbi=
t.com/
> > >
> > > The caller owns the iterator state and drives the walk itself:
> > >
> > >   CLASS(sb_inode_iter, iter)(sb, eligible, priv, flags);
> > >   while ((inode =3D sb_inode_iter_next(&iter)))
> > >           /* do stuff */;
> >
> > The pattern should be:
> >
> >   for (CLASS(...); ...; ...) {
> >       /* ... */
> >       if (/* end iteration early */)
> >           break;
> >       /* ... */
> >   }
> >
> > so that the iterator goes out of scope immediately when the loop ends.
> > Hide the details of the loop header in a macro and that this becomes:
> >
> >   for_each_inode(inode, sb) {
>
> The fs/jffs2/build.c has used this for_each_inode.
> Maybe change to for_each_sb_inode?

That's the least of all problems; just rename the jfs macro.

> >       /* inode is referenced and unlocked here */
> >   }
> >
> > Use that to convert the simple cases.
> >
> > And then we've got preconditions that are checked while the inode is
> > locked. Those can probably go in an expression:
> >
> >   for_each_inode(inode, sb, expression) {
> We still need add flags here.
>
> In evict_inodes() and hook_sb_delete(), only the expression is not enough=
.

I know, these are the two cases that check i_count before the inode is
even locked. Leave them as they are for now; we can get back to that
later.

> How about add a raw code like this:
>
>     for_each_inode_raw(inode, sb, expression, flags) {
>     }
>
> And add a macro for_each_inode:
>   #define for_each_inode(inode, sb, expression)  for_each_inode_raw(inode=
, sb, expression, 0)
>
> Most of the cases, we can use the for_each_inode.
>
> But in the evict_inodes() and hook_sb_delete() we can use the for_each_in=
ode_raw.

No. Convert the simple cases first, with iterator constructs that are
as simple as possible. Later, worry about the more complicated cases.

> >       /* expression was true */
> >       /* inode is referenced and unlocked here */
> >   }
> >
> > This unfortunately cannot be implemented on top of the
> > sb_inode_iter_next() pattern, at least not in a reasonable way, so we
> > actually shouldn't use that pattern.
> >
> > The locked iterator would look like this:
> >
> >   for_each_inode_locked(inode, sb) {
>
> I tried this way today.
>
> The macro for_each_inode_locked is complicated.
> When I tried to add more hooks to super_operations to implement the
> procfs issue, the for_each_inode_locked becomes more complicated.
>
> BTW: the procfs issue see the link:
>   https://lore.kernel.org/all/20260920072811.2064247-1-huangsj@hygon.cn/

Introducing reasonable inode iteration constructs is a completely
separate problem from introducing per-super block inode iterators.
Please keep those issues apart.

> >       /* inode is locked here */
> >   }
> >
> > This doesn't cover all existing cases, but that's okay. Don't force
> > things into this pattern that are not a match.
> >
> > We can always extend things further if it makes sense.
> >
> > > The lock does not span iterations.  sb_inode_iter_next() takes
> > > sb->s_inode_list_lock, takes a reference on the next inode, drops the=
 lock
> > > again and hands the inode out; the reference is what keeps the cursor=
 on
> > > sb->s_inodes so that the next call can resume from it.  As the iterat=
or
> > > is a cleanup class, a caller that breaks out early does not have to c=
all
> > > sb_inode_iter_end() explicitly.
> > >
> > > Two optional channels let a caller keep its own state instead of fill=
ing in
> > > a shared context:
> > >
> > >   - iter->eligible is called with inode->i_lock held, so that a calle=
r can
> > >     reject an inode before a reference is paid for.
> > >
> > >   - iter->status carries an error out of the walk.  Setting it to a
> > >     negative value makes sb_inode_iter_next() return NULL.
> >
> > Nobody needs that. Just break out of the loop.
> >
> > > Most callers just want a referenced inode and use no flags at all.  T=
hree
> > > flags cover the walks that need something else:
> > >
> > >   - %INO_ITER_F_REFERENCED restricts the walk to inodes that still ha=
ve a
> > >     reference, preserving the "only handle referenced inodes" rule of
> > >     landlock's sb-delete walk.
> > >
> > >   - %INO_ITER_F_NOREF hands out only inodes whose reference count has
> > >     already reached zero, and %INO_ITER_F_NOIGET suppresses the refer=
ence.
> > >     Neither keeps the inode alive, so the caller has to make the inod=
e
> > >     unclaimable itself.
> >
> > No flags.
> If we do not add flags, we cannot convert the evict_inodes() and hook_sb_=
delete().

No flags.

> We'd better convert evict_inodes/hook_sb_delete this time, and then
> we can add more hooks to super_operations{}, such as sb_add_inode/sb_del_=
inode/sb_iter_inode.
> With these hooks in super_operations, we can add more optimization code f=
or different FSs.
> For example:
>
>   "vfs: improving inode cache iteration scalability"
>   https://lore.kernel.org/all/20241002014017.3801899-1-david@fromorbit.co=
m/
>
>   and
>   https://lore.kernel.org/all/20260920072811.2064247-1-huangsj@hygon.cn/

Right. One step at a time, please.

Thanks,
Andreas

