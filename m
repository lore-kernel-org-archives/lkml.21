Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795532572;
	b=qQggmog1Ji0DSoftWYpeAxdW2gSixWeYmVqyV3eBvxr9sjTsEMutaAC4zj1wdZINMUc6
	 ldZtiHvstHhdJ9Ny/WW/AQYJqXF1RfQeUkgbcDgA9SaMKncMX6Fw5hMTr3yS/HJEvao3f
	 SUk098o0cfVdNcoCesNySsoWFpnVJTVn+CatGrcJuA2fqdBwxFS97jR+4+oeZB4Odg1JR
	 eaOqx368ujq06rjnlyjvfX42k2u7W/Ky2Mqvawus4TFbBC1cy6XernXP8sSjf2k+IfQm3
	 EiaIjjvzZUx5bTOPZvmETVHh2Z12adqXx7XzIZXrDtlloWU+6hSWgD4foxX09oRCIDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=15qhdURAff4Y2KbNVFJtyqKm6cg9Ddnc33WPFF64dLk=;
	b=z9hzzq+SgIPW23s0IeUfY/WOErioPn4fAc1PWf2PuP9UIVA6rh4FZ1Bg6jddQ1G4fIOP
	 RszpQBxtxgMhB2mAggNeeKkZQHiz5ZqDZZAMYVvlfq3R6+LUH4ifO9ARCUeHeFjovjPra
	 JFaP0Z28wGwrUTTom82pbbS9ypnr884tVJotTfIoWuVL4xio1BYXlggAADgoRGHecFl7j
	 l//8b+gpHVf504LgMEw2US2xuc7IGatAUFRjHOdYAgageyZMFL7FyF0HtxbZUV5xrs6Fk
	 RiqupRH5iRRnKukD1HnBzXa+Px9eiLmqqsZCSvV4m7090AwEtdJRx05o4A1AEHSXOTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7bZyl4z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF106606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF106606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7bZyl4z
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b4f4095a7aso38935927b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:02:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795532571; cv=none;
        d=google.com; s=arc-20260327;
        b=mtH7onW94fEYAPgstuPj8RDexY5Wd2Wq6jXCj6VcrEL07LDXRaa4lIsZgbrX+2KIIx
         J9XIMX/XneoISdiL/XZqXQ0YUDnhkh8TbgBaC3L3xbc608g6C6U+AsKlawFkpxfDfpsN
         E/zGCrzC1a42WjRTd8DHZpxplRPJkzYVU+1mg28LpUWt3oBhHutSmJW0l+vf27UirBR1
         ge8NVvmIzp7oDhFkC3Mdcx82rpRvR+EPpScL6PdyGkWKjsRwJre0UlfP9p5g9H2W9Pzk
         s5tc7UAfl8fy0LGi8vESuaD+owYrKRZTnW0M9JTj/FIuceRTMToFx0HY/MuzC0uQnWj1
         wVBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=15qhdURAff4Y2KbNVFJtyqKm6cg9Ddnc33WPFF64dLk=;
        fh=yxnUKmG0Evendh0avCHM27qAJNSAZ0EgjTBbMGWp+yM=;
        b=HGysxIuqPuKL6DP02qiJG/d036kj9Mk6ISCwrj9H6UDrEPMtDBQzFZbWIr97Dah5TL
         X0fstJXZ1KdceQ3ZtrKvn8utpRRAVr0PGB6AB7E3wBYGfSemdQ/tcPtE9Jf9WwOCNZjw
         LQaevpUuD3DHZWVoL+UMAaH8+yWP/U8iyEecSbHwROFO2IzMXh0eO1F4UljR2LmH1haM
         BD2keRDcn41RE1syE1BlVuewexZQjwMR/jVKFBzZDSqCYIrX5B/UTft3VB8pAE27aHXd
         jZDXg4lvZP7QzQE5v2O5VT1W5GzQME7Zc8gVHuaLIkQPo9NALHta7/AMNyRQszQnCWYo
         DAXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795532571; x=1796137371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=15qhdURAff4Y2KbNVFJtyqKm6cg9Ddnc33WPFF64dLk=;
        b=r7bZyl4zJUFbtDloS96gjqVcF/HEKin3TvDEpPfRVdV/vlcCu63rkuoEQzURQjDD1F
         qDxUNisfRi5vhJqJl/JQJSTw7gmq4P1r/+QRIXmrDexCPQorEL0fPkp7qPH6ghBZJRgN
         n4DtsATmv5Qezhn/4OnKAicIHfHI379jaTS2bAG0jqAc9bMEaiQAM48A4C3lA5ZbY7lc
         PQ1GLXHbxqwnXTOsgBVfjr1E5VM47M7TwsUWIB1zHCYd51u8UPsMwSsFpljTLPrGqkJs
         Qns6YwdAY172Q7JlCFGSYYEfjlyVOfNyfWFfwlbycqO6tmYYB50pY58dKnKWm1IAnpLG
         h0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532571; x=1796137371;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=15qhdURAff4Y2KbNVFJtyqKm6cg9Ddnc33WPFF64dLk=;
        b=AMaGceDsv9t76g9xvWa4458vVNOlndB+kt5z2u7Ib70IireW+RqtZk1yGOBXVIiVWw
         4UGcSPjS29DpIxcpQPP669Cv1qdMkCQCpRGlO7sqKBi36vxwbu9hH/JgumidtB/MzSOZ
         BSVxwZ7NBhf7pgSnirpDxZ9CGvaBDxVCLe/ormSonBSPudQLCs2wc3wOQrvAyKq2wlck
         3Dxt7GOuNEeYsqpNxcmdA8a3q3ajGo74K6780l5rz3xYdfBJgJUbg2blDl/UOqPRBT+Q
         F/F+YfS91pfBsY7hXMIRpa6fHmGKOAN0Wh6yOBM7ydmboMVgUhsgEjDyjpcBQ7arhRmr
         SbcA==
X-Forwarded-Encrypted: i=1; AL+hErGmwBJLj70Nc3mYtqwMSz1nTukTCNAevB3b0MqIRQSbs2PFpo4y7kqFTB5YasUmk7QX/QT68zqLDuyZHCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZHyHaYwef4A17mI60BcUezRBdbhzzvCa7+GcFLGZL1skkYljm
	THMGSLs+xnOBAiOOuKCtMHCUg3sddlxicm3N4n8oV6BTt7OhPMQKH06B7TS0rhNWlm2nUcSrTWq
	SDRkdi6tbmEAKoM8M8NpKCExb8ccB74s=
X-Gm-Gg: AZFdTZcWsZDd88tcVQZGuMZUqnhDLOwJh2GRGMspuwI/qNapAPtzXVKFGYsI3ni1F0h
	S0f5wY4eHsLLV25FA4+SLfTGBFmwJchbLWgZfchJ34hu/Xc/UNfGZPgJpyzWfUnyF+adjnO+mEc
	0zWVr2I4YrfqyG1BLbu1utDFTg/V/8TxcN18QhtXp0TbKFcPMgpPeGojLiSGouRvyMCbvRk7Tqh
	j9lxyPlB764rMa2CLM2LMyRt2MkE6Nv7kgO6VrVXPD/T61Dqy9SOgxg/ian5CYuUc3HPAIKIEMA
	khkNpEXok7ByE8QL+cUXt8egbk+3aITMX8WkJuWI5ToHFQQlpTU9mbxja5+rX29GPVjrYAxVwEx
	/IKlriDpcLD9wTxQ2grE3y7dCWtwP2fmuIYGqbohZ9l3jO963cTbKs9n9z9kJ8vkP0Q==
X-Received: by 2002:a05:690c:6c8a:b0:8b3:33cf:1fdf with SMTP id
 00721157ae682-8b52043a56fmr73445267b3.14.1795532570462; Tue, 24 Nov 2026
 07:02:50 -0800 (PST)
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
In-Reply-To: <874id6cuvh.fsf@igalia.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Wed, 25 Nov 2026 00:02:37 +0900
X-Gm-Features: Aa3M54q7McbRkX2Kvq38FE_QJzJaOozwIIO4D-O26WWXQe2rdNcekeLEZ0LCW74
Message-ID: <CABFDxMGGtxxm5OyLiihbVLBJKihoTxtV2g-FG6rURdPWnQdwPw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] fuse: defer dentry_tree_work until fuse_dentry_tree_init()
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Luis

2026=EB=85=84 11=EC=9B=94 24=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 8:49, =
Luis Henriques <luis@igalia.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Sat, Nov 21 2026, Sang-Heon Jeon wrote:
>
> > inval_wq_set() schedules dentry_tree_work when inval_wq is enabled.
> >
> > But inval_wq_set() can be called at boot or module load before
> > fuse_dentry_tree_init() initializes the work, so __queue_delayed_work()
> > warns and the work never starts.
> >
> > So defer scheduling the work until fuse_dentry_tree_init() sets it up.
> > Also hold kernel_param_lock() in fuse_dentry_tree_init(), because a
> > sysfs write can call inval_wq_set() at the same time.
> >
> > Fixes: ab84ad597386 ("fuse: new work queue to periodically invalidate e=
xpired dentries")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> > ---
> >  fs/fuse/dir.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > index da23ccd8685c..0d5d04df477b 100644
> > --- a/fs/fuse/dir.c
> > +++ b/fs/fuse/dir.c
> > @@ -39,6 +39,7 @@ static struct delayed_work dentry_tree_work;
> >  /* Minimum invalidation work queue frequency */
> >  #define FUSE_DENTRY_INVAL_FREQ_MIN 5
> >
> > +static bool inval_wq_ready;
> >  unsigned __read_mostly inval_wq;
> >  static int inval_wq_set(const char *val, const struct kernel_param *kp=
)
> >  {
> > @@ -62,6 +63,10 @@ static int inval_wq_set(const char *val, const struc=
t kernel_param *kp)
> >
> >       *((unsigned int *)kp->arg) =3D num;
> >
> > +     /* Defer the work until fuse_dentry_tree_init() sets it up. */
> > +     if (!inval_wq_ready)
> > +             return 0;
> > +
> >       if (num && !old)
> >               schedule_delayed_work(&dentry_tree_work,
> >                                     secs_to_jiffies(num));
> > @@ -224,6 +229,14 @@ void fuse_dentry_tree_init(void)
> >               dentry_hash[i].tree =3D RB_ROOT;
> >       }
> >       INIT_DELAYED_WORK(&dentry_tree_work, fuse_dentry_tree_work);
> > +
> > +     kernel_param_lock(THIS_MODULE);
>
> I wonder if this is the right solution.  The solution I had in my local
> tree was to simply declare a spinlock with DEFINE_SPINLOCK() and use it t=
o
> synchronise access in fuse_dentry_tree_work(), fuse_dentry_tree_cleanup()
> and inval_wq_set().
>
> Do you have a reason for using this kernel_param_lock() instead?  (Honest
> question! I've never used that before :-) )

AFAIU, parse_args() (boot, module load) and param_attr_store() (sysfs)
already hold kernel_param_lock() when they call inval_wq_set(). So we
don't need to declare another lock if we hold kernel_param_lock during
init and cleanup. Let me know if I miss or misunderstand something.

But using a spinlock should be okay as well. So if you prefer using a
spinlock instead of kernel_param_lock, just let me know and I'll
switch in v3.

> Cheers,
> --
> Lu=C3=ADs
>
> > +     inval_wq_ready =3D true;
> > +
> > +     if (inval_wq)
> > +             schedule_delayed_work(&dentry_tree_work,
> > +                                   secs_to_jiffies(inval_wq));
> > +     kernel_param_unlock(THIS_MODULE);
> >  }
> >
> >  void fuse_dentry_tree_cleanup(void)
> > --
> > 2.53.0
> >
>

Best regards,
Sang-Heon Jeon
