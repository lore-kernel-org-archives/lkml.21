Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795483371;
	b=ynBV2dSLWUv03f6Z7TQHXblchYGYvlbASiegeJQmcftZd4GYyXX+FHts6wKjX5Wl5Tvb
	 +CbB6D8IYs9IqItlrm4SvjLKEEAFoZ8DyFQWg3GtHR2olAHvstbre26/rlGTIHyJfO7iI
	 vBZ/Q3vuIqsfWCRy+kZgreovaY23HS6dsCsD3y02v7SgHB93CngKM1AHhcT4mvVCRhzk4
	 l2IgEniwxt+QMOb97kFG4NiNfhePzIWScDIN3ZHuvFpJDJNrenH0yn4MRzjtwdRGiP1UU
	 vA0win62hONJssV1nwLNPYvA1u50+e4mRrNRY+hBN6BEjKY3NCS5pAGcq/Rd0yWxjzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483371;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=o6hYnBwiFZNCgKvskv9vf2vEJ0wLJBN3T8leiCBivtA=;
	b=AmX/fCBrOIBE91zI5JFeO63q7wktH81SCSaOzghBANn9uBDISfPpMwWAF0v9zjkWmuGj
	 5j74KBwk94ThwIuNhued1PARvevaeMKpfe3I5IEjaCGo3BqtoiaICk3XT4hruMzuq5bLz
	 jgIi4Hk6ZHUubB4I8fD4S/0Gv34oyVMgklgm3EjHHUrF8OyqfFpmWVnpPhIMXXqU2SkeI
	 +/QEJCmBW9F9huJfLl1DP/n6hoB5bJzTFxWFR1vpFPTJ11bZQw6ugFwx0UNMQTjgLlsB5
	 1lrkYOv1/OfkUsNOxVOuYaHCwP8MbMbK1F6HGSibM9AZQ0KJSyra3GAQJcfZINnWXJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="a1vcX/T0";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=arOIfOgJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98704606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98704606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a1vcX/T0;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=arOIfOgJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795483369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o6hYnBwiFZNCgKvskv9vf2vEJ0wLJBN3T8leiCBivtA=;
	b=a1vcX/T0Sx8c8omryKOGdDu+8gIFpTqRxFI1KfNCOsI135H3WxoKyODw5aLfhIihaNZFOz
	4n6msE3GgXYOKks2h4dEO3A9683qMV+zw9P3jn4itrp63gEE6euzbyXdQgQVZnNEQ4RISY
	YFa9rHPK0ElEUUnALLQwpqcAMG4EucA=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-u5GcPtsmMxGrEzvkjPstzg-1; Tue, 24 Nov 2026 01:22:47 +0000
X-MC-Unique: u5GcPtsmMxGrEzvkjPstzg-1
X-Mimecast-MFC-AGG-ID: u5GcPtsmMxGrEzvkjPstzg_1795483367
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836caf085e0so53572047b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:22:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795483367; cv=none;
        d=google.com; s=arc-20260327;
        b=KgkQS4elBaEmGXEx5mPSGTkJ+I+A2ZjCLI2PAeqARj4GxMmkR279M2oG++x9StO5CA
         laydsYK30CdUFryqhQ/XD8jMcPo7qOya5sfs1LA0ho8/Gvj/m8ilzXaxDDV+wV3oy1Y1
         zZ8mGHUPqDCl4Wn1gqgF8hybMrmfaqq7I5tfJq296m93qm7Fj0lXFkdnnpShxr+mzRz4
         QtXJCfEjP0VokKvF5o+JzVjdhuER0poYsLYjUzsFXO8k8cQ0EhO0ZxhvnbjKdmX5uT8f
         iwwGjPwaTgCW9xXCuPR58wJOylejzu/aiO/2vp/6yra0nGDMlOnsAAi5168jVCus1FES
         PfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o6hYnBwiFZNCgKvskv9vf2vEJ0wLJBN3T8leiCBivtA=;
        fh=F4zq7dYSSDdza1+A5h2iUAVT1I0cpDCBV8E+dvqRcwE=;
        b=hn1xo6NptjwUnVV8CFqcLq/2ONTjf7IU8AgI9MpGt9JehKh6aOVUouwoFtvWw2PWEu
         Cx9l0akFVmZfhbezmQUGRnqqjkBWNq0TjuyrAeXx0dx/LaQ+kWtBSA5Lv4ynK3juxnLy
         +mcj0kDwy04/lwq7MBIKVCPpxEVbVv6GTLyD29FA+qGSerlCAXtdh02SHO2Za9cKiI66
         XJmR4HpEzTMviN6qrIveH/oDlbBip8WBR1SjoeGzJE7Tbrx6E5ZC6evMczgOnuKuhsnH
         IPr+q17WSc2EEVYPCqBYfvkPnH8OKjF4VJf9kBtPx1mL7rFYSBI11hRzKgG753UgPagW
         Lgrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795483367; x=1796088167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o6hYnBwiFZNCgKvskv9vf2vEJ0wLJBN3T8leiCBivtA=;
        b=arOIfOgJjatsv80JVEpBvWV2cYjk1DFG529WBeqYVZMGb8G5XKgQX0BxBVyYjO6X89
         XU/iiLqAa6JKHr5+YiHrFFmch4rOngPaojA+UtDibrDQFOJpR6UKfX6wDrp950WQlRze
         RmGbYgjStorRu/XXsv9TV1Kng/eUkxkJiXEtOmxzq/3jG3MksuxpL8XIph4t30fkGtZl
         puDe2bcO90EXdG3rFz/3uyZ3UUqq/tihog9dlpwR3WZRn/KDZPlNZdkSegJf6afWl7Eb
         AsZR2uq1NPJYyaOaHJqtpmJvQ3hEJuKFLFuywQdHZG3XkvT+wvWNbS1vTf1CVSxIV0oQ
         eBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483367; x=1796088167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6hYnBwiFZNCgKvskv9vf2vEJ0wLJBN3T8leiCBivtA=;
        b=M51HnGzhPj+DLP3CwkNgzUyd1mc0Q7RKcj83oSjkBj+1kgSdVkMrRTCH2Y4U79twyY
         QhezwA0HV7Vie6wcb4mmNngZzTvD7/pLHln7r7zzsYkU+5MI/MW7TsMjyXSxTUfft8rd
         xor+nBPSuFKplwLOB+/h1JHGCqkWz8T/6x7ge+7Jl+ft1VTTJB/8qMUL8HykAZFt7uZb
         JEWjJwjdp26IXtNP9A089dh5Cke4NqlFSGZmzePKG5HUbXHQVVMlHfxl2BVskIr892mF
         ej/iVg22yeSj9cHpNKjdrDdskiLujqY9fL95j16gwhjGV0TzC3tE+7L97WCv/La0fJri
         16Gw==
X-Forwarded-Encrypted: i=1; AL+hErH8kAP3E7ljkE1h0yWWTn8BCgu0NY12ulPppQTDHsH/Q0T3GO3r1swiS8bAFXjOYE1fS/A3sEnPnHQcT6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LQhEqsWr1BoHR2RlQIn2gd/AuBysWrOa7xK+z/4N/1lToJJ7l
	WDIMs4kV6F0tTuTgmsen6mYNnCjbhE7KZYrWhBzZS/oCHfUgv5ZmujGMNzj7ufshR3Z02zvkGQi
	NI5UfO9YA3IVQIyPseVbkK6Cfm43KsGYVrVnlRcXxuCdcTBmfdBcO+3NrNqz2TbLmTVhSvnjZJ/
	g3bfPcq8IrDyXM3FSh4CQLzUOnvYdt3KzH89UPMVE6
X-Gm-Gg: AZFdTZdA2djVwx9ty+do0oxLZ+MwOJRCJBtjBm3PDisytjAiWsfFob4GToBpvVRwlmK
	rml1LRdNJrJfuUgMyDB3ya0X3q31W37fmepLjMBS3b4KA9A05VThE+7JRFCllO7NcH6PZ/MEYFi
	trMYraJgVnIkGB6wWli0HR+HzMOt6dASwlBr0xmlBs6FiFsMq/dG4iNjSitd+Zt041NH7fyGTRq
	chnLs08WpRppW04oXvpRZABXNjNxAwkjHpzpjYZPp55zA==
X-Received: by 2002:a05:690c:c355:b0:8b5:4cff:d81d with SMTP id 00721157ae682-8b54cffe43bmr14262897b3.52.1795483367060;
        Mon, 23 Nov 2026 17:22:47 -0800 (PST)
X-Received: by 2002:a05:690c:c355:b0:8b5:4cff:d81d with SMTP id
 00721157ae682-8b54cffe43bmr14262807b3.52.1795483366524; Mon, 23 Nov 2026
 17:22:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260722151023.1308069-1-agruenba@redhat.com> <20260730-armband-reklamieren-heuchelei-6f67abb088de@brauner>
 <CAHc6FU4719z5crxP-ahSXs2qLachSL9GOiv4kXRZRifNxm-U_A@mail.gmail.com>
 <20260731-rustikal-revidieren-parolen-02b3e749e9cb@brauner> <CAHc6FU7JQsrqf064yzG8_nDovSFwNCd+-cfmJE=_9pQLLYLdXw@mail.gmail.com>
In-Reply-To: <CAHc6FU7JQsrqf064yzG8_nDovSFwNCd+-cfmJE=_9pQLLYLdXw@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 24 Nov 2026 02:22:35 +0100
X-Gm-Features: Aa3M54pK9ZdQ5UCTwrQed5DfOXgeoX3EWqsEowwcQtn42_zjFDDeV5ll4RqCoPo
Message-ID: <CAHc6FU4oKU0ojagHB__b9HTfTnn5_HG1N6MDpFHm=ZWA=Jk=cA@mail.gmail.com>
Subject: Re: [PATCH v2] xattrat: accept empty O_PATH file descriptors
To: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Christian,

On Fri, 31 Jul 2026 at 16:14, Andreas Gruenbacher <agruenba@redhat.com> wro=
te:
> On Fri, Jul 31, 2026 at 3:26=E2=80=AFPM Christian Brauner <brauner@kernel=
.org> wrote:
> > On 2026-07-30 22:34 +0200, Andreas Gruenbacher wrote:
> > > On Thu, Jul 30, 2026 at 8:49=E2=80=AFPM Christian Brauner <brauner@ke=
rnel.org> wrote:
> > > > On 2026-07-22 17:10 +0200, Andreas Gruenbacher wrote:
> > > > > Christian,
> > > > >
> > > > > here's an updated patch for making the *xattrat() system calls ac=
cept
> > > > > O_PATH file descriptors.
> > > > >
> > > > > Compared to the previous version (see the discussion at [*]), thi=
s
> > > > > version adds a fd_maybe_raw cleanup class that uses either fdget(=
) or
> > > > > fdget_raw() depending on which kinds of file descriptors are acce=
ptable.
> > > > > That's still a but ugly, but all the alternatives I could come up=
 with
> > > > > are much worse.
> > > > >
> > > > > [*] https://lore.kernel.org/linux-fsdevel/20260701191649.175871-1=
-agruenba@redhat.com/
> > > >
> > > > Thank you. How do you feel about?
> > >
> > > I don't think it's an improvement; see below.
> >
> > Do you see other users outside of fs/xattr.c that would use this new fd
> > class. If not it might be useful to just have a local version of this i=
n
> > fs/xattr.c?
>
> I hope nothing else will use fd_maybe_raw, but hiding it in fs/xattr.c
> still doesn't seem like a good idea. Do you insist on having it moved?

this patch from the end of July is still pending. There have been no
changes in this area; the patch still applies cleanly. What are your
thoughts on this?

Thanks,
Andreas

