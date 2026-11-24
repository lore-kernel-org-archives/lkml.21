Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795538006;
	b=iTNt3Cys94GSDSkDeDNr9rS5pB0x3QGcBf7YKkR41U6n1/dsf1+O/gyTo3qqqEaB+m4g
	 oKj5EQqCnfpPayeLvARrsnm29IRyRacw9MU+aDD08XFGPqCTlYkCZyC4iNvgi0byvkvAV
	 G/ARy8zqk169rkxHX5jvMIFayMQrWPSIPzpOSjfAVVtgGoS/wLy3I4FfWG9xENL2b1XCi
	 uwhDbQt/JV2+jU4kdCLRUFmK28Yt9uI7XAjtQGXV5shPtYshy2ouREqDLxHoidV+cOeiB
	 dFlWOfxE9oBs0G6oSJuLQG9IHv63Xa7Cz/qB45zZv+jO6FeLE+iWvItjngxe0sMJQjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RWL8USnmTy+KwJMsv1mm6fJtCLW5dOGP1PUWvK7nhKA=;
	b=anew1ax94xfk9Yl1ukx+S4/5HvDzeMlx2P3rgTWcVkDs5B/HnJ6u/REe3sEOkp2P/q0E
	 O61yninmei1FGW43ij1zB3QSzD1fF79psv3FtRdjyaPWuUNtmW1ncCqp8hoUhC88qErcB
	 IP4gvq3C/7aN4vvVZAzbhQ21bNtvdkK1JxfCU0H7Ew3p0pum8xdUV+bZcjOaIFgxCWL7B
	 0nqTlDByHb+SvzKfEGOxCWj9uXMMGjtdJ7FExkIycENrWBbnZgtgVq8mwsW2vxP8VTgfN
	 vap/VONfdlX1r+i12J/zaCa1ciEbVcP2HB5k5n0NUGxg9GS5GRopW7iS6PneSThuhtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AC9tfPIg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E7A606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8E7A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AC9tfPIg
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b502b9b702so55006127b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:33:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795538005; cv=none;
        d=google.com; s=arc-20260327;
        b=mkArJ9c68WslOD4IGCvUVcfyPYeDcGDDmvqpPPN218SSY1t4ncp3G3nFRZRbYY6YRz
         VsM01D5jCSZOtx+upb+4Nnj16tOyqK0mAZcVzevRxRqQTRoeBQ3ZH+ueyU6buKdEpNH8
         Dr+y5MqrKJfyPetqLTtoxRnwXXzNk/KX+ogF7ZHGe0sKRpdUrx0Msn4ckGo5QmjyzTgP
         tE8Jd9EXC2mRv6/QhVFGVoeC9A4J2IkQmRVFue/lyS272+kcmFvIR5RYa0CO4MX8Ahs4
         rC0B+26OC6rK82r2rwbBHqHimQVJy6SumFqrxe9VoA4kRg8Lwry5Dech5UErR4+BWaUK
         tjCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RWL8USnmTy+KwJMsv1mm6fJtCLW5dOGP1PUWvK7nhKA=;
        fh=fMa4imqwo6AtkeX7SjVKW9uw4n4HvfV1tpk7c4HYio8=;
        b=osTJHYt9j0WCymzYy71IOjYFX4wPIiVfAMzyzvYOmaYOhRAVYp/JcdpcHH2JfhB4x/
         J0wARozxLJ6ZmOP+wbHxqueuOg7rNnidzCHWikQAsvb8tCPtixNAmrWXTCxyp3WP6TEa
         PXtdBgboXXoh3euoHAfpiZc6wrUCXDsJaySsAXSpqpSLAbjJ8Wt6AByPqQ0ESdp1X/ld
         mgIlj6d+0HcbT4+a4xTcvQt4hGl/TvRkiRxNQOiu+spx7+3YGtRvgraKMczjkpNW+A49
         ThA0H12AlzwBvuHETse0eOwRzWRTs5WVfOvWXwPCJdx1ELP3jl4p3hE0szr3ILZyIZnb
         UnuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795538005; x=1796142805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RWL8USnmTy+KwJMsv1mm6fJtCLW5dOGP1PUWvK7nhKA=;
        b=AC9tfPIg7KPBstpG6dU6bq41mFEkF3AITSlk7e7VcDMnKx7o+njbxt8BBSqqTn6FNX
         t+BZ+6X+jXP7bF9KD7JKUu8R4e8PAAuDCmZg9YHFbHVJaQAgvMfD3gyJCAlo4Kmxci0o
         HjmOEBAuJo+dLXhwTMZQ4DoVmWAZURwQF1WYfqpk4yWuJ6V6d32cjiNzbOi0WKnEd85V
         ipaHnHwiXN22FVXl9t7mlLPh9tR2XrX7wL7BKhTM5aVLxXOD0VU/h27vtYXWmTDBDEZ9
         QornJ19o2ihLpH3c9HPbRnYf3xi6JTPfKqlPDLmLt8EOm/hkSNI/1cyy8YE0cKWCLGwj
         u/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538005; x=1796142805;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWL8USnmTy+KwJMsv1mm6fJtCLW5dOGP1PUWvK7nhKA=;
        b=P3FftzGqodTA5/mFKD+nxVTuELPOxPKIpHebaImfJg7ikfs/fpSL7HCjL6CVXbuQBw
         cSTDUA9fgKlRxDlxsc4Y4bLtcgAcjSwsa6xAlTxhHGSkWoMYL8rucN9PdhfoiQbGNkBB
         JdX37SIflAF0q2ovtufRy3JdpqtX60fZGsSbXZcHIjumr+S1Qeu6JvwDNxhvMSflHZ6r
         CHkD/fbJnJw150WswiRbQ1ckOss41I/GQY8n5Us8VynRJ70w32/j5cfKN/v7uhSxIKnr
         KhURCnuAhusb5lW1fGcs05IWDPP5ICKZQ65nOGu82SRXHUxCLILPl5RJW6KcyrBTSwBH
         /yHQ==
X-Forwarded-Encrypted: i=1; AL+hErGScpsys53Vw876RYaB3WSyQoHVsERtQbhsaIGbTnHGKF8/pGtVM/VgGZA57TURAiPy9ZP6OhyqkBa+Has=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y+OFlMDla8upWo0lXo5zab0un42+dR5CJ2rNmxMahlLlDO85P
	RDItu3lQsl9IP0DYc7t8+C57+5BhUeUHrFJgcJwWvs5CamRweehR2XTK10FgKNHBul2NKsKiAQW
	wBnZ5ERC4V3yyDO5NpQ7a3wcdm7IgVVQ=
X-Gm-Gg: AZFdTZfIoTau5yxSDjAYJMRR/fv2BdUAttzqXhWlDWxc3ldrDt3sEDHLYhMkH+Uoe/u
	YfAanfez4N6n5jJo3tDSjIYJAZ/1PVeWHPBY+btcy6BB/Sex4JkyaDAbj0Gceb9k7Lo/usChfrw
	wMKxMGdHh/l8TDIH+2DTGNVMR1Pj0g4QW4SPrvdpEi9xvx5YYhVnqaeDO7v2ZhJ+aU6eDt0d1DL
	Mh0+nErluDLBfj478vEcJQoGirF/I2AeLT9EylIgxURYbiqUaPLA1cQODUD+GRkX2fU/UteQ9fO
	QaEZlxvMDCCZlr/PjdalJrWnaIxcnHbo1Fsm4brTiCMDDDqnrHmbnVJ/nmt6uFbI2mWXnanCMUv
	7xFxtLsaVD1lJCWeXCcCyVUNGN1MXLgh5vOWHVr8UZWYH/17n7e2bk52rGH7VDwp4nl3efBIcUV
	WKgGgGcvmfqEI=
X-Received: by 2002:a05:690c:9a8f:b0:8b4:dc8e:2e6f with SMTP id
 00721157ae682-8b520514f25mr53029687b3.63.1795538004573; Tue, 24 Nov 2026
 08:33:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120150008.1144420-1-ekffu200098@gmail.com>
 <20261120150008.1144420-2-ekffu200098@gmail.com> <874id6cuvh.fsf@igalia.com>
 <CABFDxMGGtxxm5OyLiihbVLBJKihoTxtV2g-FG6rURdPWnQdwPw@mail.gmail.com> <87mrqyb3lc.fsf@igalia.com>
In-Reply-To: <87mrqyb3lc.fsf@igalia.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Wed, 25 Nov 2026 01:33:12 +0900
X-Gm-Features: Aa3M54pPy5MGws7-VwziFvwz9vT5ifSxWMpohqSuXzhnuGyopXjPnX2IMBf0Wcg
Message-ID: <CABFDxMGfVFFwcUYwHM1bmo53E+ZrvPvjPF_gnoxU0Oo7ZzkqFw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] fuse: defer dentry_tree_work until fuse_dentry_tree_init()
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 11=EC=9B=94 25=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 1:23, =
Luis Henriques <luis@igalia.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, Nov 25 2026, Sang-Heon Jeon wrote:
>
> > Hi, Luis
> >
> > 2026=EB=85=84 11=EC=9B=94 24=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 8:=
49, Luis Henriques <luis@igalia.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
> >>
> >> On Sat, Nov 21 2026, Sang-Heon Jeon wrote:
> >>
> >> > inval_wq_set() schedules dentry_tree_work when inval_wq is enabled.
> >> >
> >> > But inval_wq_set() can be called at boot or module load before
> >> > fuse_dentry_tree_init() initializes the work, so __queue_delayed_wor=
k()
> >> > warns and the work never starts.
> >> >
> >> > So defer scheduling the work until fuse_dentry_tree_init() sets it u=
p.
> >> > Also hold kernel_param_lock() in fuse_dentry_tree_init(), because a
> >> > sysfs write can call inval_wq_set() at the same time.
> >> >
> >> > Fixes: ab84ad597386 ("fuse: new work queue to periodically invalidat=
e expired dentries")
> >> > Cc: stable@vger.kernel.org
> >> > Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> >> > ---
> >> >  fs/fuse/dir.c | 13 +++++++++++++
> >> >  1 file changed, 13 insertions(+)
> >> >
> >> > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> >> > index da23ccd8685c..0d5d04df477b 100644
> >> > --- a/fs/fuse/dir.c
> >> > +++ b/fs/fuse/dir.c
> >> > @@ -39,6 +39,7 @@ static struct delayed_work dentry_tree_work;
> >> >  /* Minimum invalidation work queue frequency */
> >> >  #define FUSE_DENTRY_INVAL_FREQ_MIN 5
> >> >
> >> > +static bool inval_wq_ready;
> >> >  unsigned __read_mostly inval_wq;
> >> >  static int inval_wq_set(const char *val, const struct kernel_param =
*kp)
> >> >  {
> >> > @@ -62,6 +63,10 @@ static int inval_wq_set(const char *val, const st=
ruct kernel_param *kp)
> >> >
> >> >       *((unsigned int *)kp->arg) =3D num;
> >> >
> >> > +     /* Defer the work until fuse_dentry_tree_init() sets it up. */
> >> > +     if (!inval_wq_ready)
> >> > +             return 0;
> >> > +
> >> >       if (num && !old)
> >> >               schedule_delayed_work(&dentry_tree_work,
> >> >                                     secs_to_jiffies(num));
> >> > @@ -224,6 +229,14 @@ void fuse_dentry_tree_init(void)
> >> >               dentry_hash[i].tree =3D RB_ROOT;
> >> >       }
> >> >       INIT_DELAYED_WORK(&dentry_tree_work, fuse_dentry_tree_work);
> >> > +
> >> > +     kernel_param_lock(THIS_MODULE);
> >>
> >> I wonder if this is the right solution.  The solution I had in my loca=
l
> >> tree was to simply declare a spinlock with DEFINE_SPINLOCK() and use i=
t to
> >> synchronise access in fuse_dentry_tree_work(), fuse_dentry_tree_cleanu=
p()
> >> and inval_wq_set().
> >>
> >> Do you have a reason for using this kernel_param_lock() instead?  (Hon=
est
> >> question! I've never used that before :-) )
> >
> > AFAIU, parse_args() (boot, module load) and param_attr_store() (sysfs)
> > already hold kernel_param_lock() when they call inval_wq_set(). So we
> > don't need to declare another lock if we hold kernel_param_lock during
> > init and cleanup. Let me know if I miss or misunderstand something.
> >
> > But using a spinlock should be okay as well. So if you prefer using a
> > spinlock instead of kernel_param_lock, just let me know and I'll
> > switch in v3.
>
> Well, I think your solution is correct and it should be OK.  My question
> was mostly a bike-shedding question: we're using a lock that is defined
> outside of FUSE, and that doesn't seem to be used a lot elsewhere.  On th=
e
> other hand, this kernel_param_lock() was likely created for solving
> problems like this one so... yeah.
>
> Let's just leave it to the maintainers :-)
>
> And sorry for the noise.

No problem! Thanks for looking into this.

> Cheers,
> --
> Lu=C3=ADs

Best regards,
Sang-Heon Jeon
