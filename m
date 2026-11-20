Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795178628;
	b=ms7tWRXm6EP4OAKABRe9PQG+g0QGZKgfuXF9sOPUgFtEypokI/rZQxIgrPlCXnx9cXe3
	 UfekrGvxXPWMC/WMSSW7s5OTUrzEN8sNEt9k6va4SUsVVgrt1rAp7Q81oLa7/uVu6LGN+
	 0D7MO08yO3/32EXzVnp1g/9c8r0a0O0JNhdpDIlEvGS/sjHcAkzwL7ZS8wZmch+wbvRL3
	 Hxeh0+b4ND2shHlWUaiaPPteYlJRHLAwXDWNCstMywg4mEwbmTGsT/aS7vGUYfFINPuaj
	 VIz+BF2W4nFKDwM9Z20xjlBtQx1ODfmtT0QZTc8TjbvOCOdfMBJBpSlxMZng/lgPDcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TJ+eeQ57O4kTx3qsNmiukGiIfub3RnkhaOW68+iHads=;
	b=NeVE1tKC6PWAeSLpJ6jjeWZoQqSJsZE+GAhbl6n8NgbAuns902WjXY642RpT6WIUovLu
	 rUZ0EFg7s4ogKiX/BsAaJFmcRK6H0jNeAR2crA170N8zLdQhcw/peronbIOaSZ/yT+q02
	 z0BkGQltAQhNeqt/lptzV1SHCvmgyG9S/mQaAeXz4ChTqGBX16PD/UyqV9XJLDChHrAkl
	 CGjIUjP+3hUzSc7zLSwfRNbPGCkhW1h+LIwIQa1HauH8AhiU37cXEzEODmfRtfci60rHV
	 yO1wl5tgYgWySDTzp+QgayAewhlbESe7fYvmcNCzeWo5NqM7yFk8ffqfwnVxMMuM5Ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ywktutcD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA23606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AA23606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ywktutcD
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ba38c41804so869960a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:43:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795178626; cv=none;
        d=google.com; s=arc-20260327;
        b=CifcJox7h+sArnCfnUD/sVSFTL6prS0HtLogadCrjpgGoCfWje8mGXrXpgOag1uwBQ
         e/HJ4Qu2gPq77nIh1I2+22q1rssgODH2lIYjGUJxfvCDEFR2OhwGuZSetOPrG4Zjig6J
         493mwWjiwMxrn0VYdhruhN2FZgMS4ZOD2D5Fn3UMk9qH1Aqw8+jio+cEtsMENhfnsoqJ
         gv+cKymyMiZESv0lGbqZHQJ3vqoyZxUuU7pfNawWeXvKuBwuCBvdpqM7fjrEaYs8rian
         BOYEePga8QZ/dDV5Gy+oOx5vET6XR/4WSHLL5cxf8pQHi0GB3SixAY4lZTIwgcwwLiyV
         ct9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TJ+eeQ57O4kTx3qsNmiukGiIfub3RnkhaOW68+iHads=;
        fh=wzCYAj+k6yaU/A+jcr6SoX4hCUjiRuLthNQDNXEfhmQ=;
        b=WadFA1s4YopOIv3oVzcwEjri19NQlY/T79h4zhTYMrvolRbyp5OxFdoiekhio6kl0X
         jh2RTwFpHhJLNvAUZCFoTdkY5vB0i6n9aIBuqv+C3tsfxiIWkOJ3s1mNC5jU03KsMaIU
         Z6R0OJUjZYruFviQdMNBjr8I0VeTFYZnrLfhRmnVsQYdVbstIMljLe6A5eAV/hjNr3qn
         Z1c1qgy1XwupB39UHrAYdUP0JNVNSNU/T5U+3+2AO8XKgIjpN/jHjlK9es5qZ5rw2P8q
         XECmZNmGceO0WnJQr2iDUGLsV1xKJVLBs5G7V7QRAPK5GqywwMs6TJ4v7aA4fdnBilmX
         TZhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795178626; x=1795783426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TJ+eeQ57O4kTx3qsNmiukGiIfub3RnkhaOW68+iHads=;
        b=ywktutcDJAVz3wdITMJbeA8rkCIaBxjC+IqdTznGfFTy/pbh+tkan3xGluUpLgfkJ3
         hVVSZAXkCQ+pBC7hhwHSNnOzNb4qzwVzHHsg1k2ItfJHdisCr6zqli1NZsr/DzwQeZAY
         Uai/H/RO0cNTqKP04YaY5pOJyOBeiFXH7wVpqGfV4YsFq3DZi4WIFlgh7UcZ7TEcGmvb
         yZZCKr/xAGSZpvj8q+PQ2YqZ4WELJhWAUcIMH1CPHJhh8Bcssoko1EEPQ/WiE/VJMfCu
         E4FzE1d1vCqzN0YH2qkptA8ki1T3ApozK/jeiSx5vV5M/qYK8v3lJlDUu/zpVZMUuas7
         yYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178626; x=1795783426;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJ+eeQ57O4kTx3qsNmiukGiIfub3RnkhaOW68+iHads=;
        b=Q5Kno0p8JPHY3VTVqb4TEDVO6ArrAMhANSNGEQ0G3s9uyJbd4atkGZvJlOTvbcFY89
         cNaCt0flAJp9dloDMI+FgV4+wTgjYXNkx8HZjJrOXqrGpMuO3YlhaKPVQAnzzwvxA2h9
         IeSFxBEsfrGpOeRwKSXjccIrug85Tl2Liw0Ynn04tqiFh3B6XuwB3n5ceVfm+4MxnrZm
         uRrc57McbYWeCqXUiCf3SsHz6SP3fXaL47JnYDtDntYMZavv7/oir1fjjhwbRfK21MNZ
         2DfxyGia8vVQolbiN48NTyuh0606bYcJcK1v/Fd7bDYvxvh0HCXVvQslPeWQMxDNNliJ
         6Fuw==
X-Forwarded-Encrypted: i=1; AL+hErHqv49tzCDzTMw1OGHxFL+W7EpsSH5681vCoC1HTreZ9hM1WRy1uebCe2PK7lppiLhO4s2o6zBc6Lp9xcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+K1L/nPpqzvNslc3PEAzQ6qj3L8sp1qEK3xm8D0Zh3385fefK
	G85M/i4rZ/MB9/3VFFxH0TjsXwYEeBiSQL0yv/1BAijm7g1wUNir5hYXnvjvHaQR8IUJFNc7tyB
	EdKteN9e4uLOrWjI8LBnSpZ6kIieTCVc=
X-Gm-Gg: AZFdTZfBN+/4aC09A3wzpp+Ohc1iBoNdqJZrmgh+6m7fFMKIZRsYgOV4yhlY0tS6UTt
	pT3SoEjw8OQEOEqHwx8suZ1UbI1NoS+la5E6Byvj+syu6qLm8mueyrLpgAAxtWPsybW4fG8hyQ2
	fY/BZkFLLjSm20VBXfDKOakFFegqZR3OIIqM7Crty283uJXU1whTanM+lWnAzK5tbq9uHRmR42I
	pTFv+hSFOA5468q+uw0zXKyRo0sw8XxHaX6wvrt+oIdhXkMyFUXpCeS3f9lr4QTBsNDgg/78oBL
	TDU6/1tYW47ILwW0goxH3SfzZPyQF4nMA2xJJ6aqKCvEzZ/4GgrSqFav+aYdOa1DPP3wmVZ9IJ4
	EsHScyWJpG4C+axLZZ/Pymbw6DS2CdVrsi0ay83A+OGnUHz9Txk9XyfzhcmZyv0a4w0UoYA==
X-Received: by 2002:a05:6402:280e:b0:6b7:d55:87d3 with SMTP id
 4fb4d7f45d1cf-6ba37ea7696mr1994022a12.36.1795178626027; Fri, 20 Nov 2026
 04:43:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119025942.2848130-1-neilb@ownmail.net> <20261119025942.2848130-3-neilb@ownmail.net>
 <mk7u4brorzgbyol7x4nyolufk3s3piqwqd5hnya3nhoq43d5ui@x5sdqeyrhde6>
In-Reply-To: <mk7u4brorzgbyol7x4nyolufk3s3piqwqd5hnya3nhoq43d5ui@x5sdqeyrhde6>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Nov 2026 13:43:34 +0100
X-Gm-Features: Aa3M54qy76OmVkVDlQrjcASI5MLOeuOS5yDaKgdB9RmNQh5aB3uSEkS8ocfTEbE
Message-ID: <CAOQ4uxgEqDiw2=dCM_PV9kObBboCmt7ohnHehKR8cgKyvLTPUw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] fsnotify: update children flags only when adding
 mask bits
To: Jan Kara <jack@suse.cz>
Cc: NeilBrown <neil@brown.name>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ian Kent <raven@themaw.net>, Jake Edge <jake@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 10:48=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
>
> On Thu 19-11-26 13:57:02, NeilBrown wrote:
> > From: Amir Goldstein <amir73il@gmail.com>
> >
> > Since we only ever set the PARENT_WATCHED flag from
> > fsnotify_recalc_mask(), there is never a need to update children flags
> > when removing mark mask bits only when adding them.
> >
> > Add a helper fsnotify_recalc_mask_and_update_children() to be called
> > in cases where updating children flags may be needed (i.e. add mark).
> >
> > Also avoid update children walk with mark spinlock held.
> > This was only done by dnotify and can be easily avoided.
> >
> > neilb: added update_children flag in fcntl_dirnotify() so we only
> >   do the update when needed.
> >
> > Fixes: 172e422ffea20 ("fsnotify: clear PARENT_WATCHED flags lazily")
> > Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> > Signed-off-by: NeilBrown <neil@brown.name>
>
> One question to Amir below. Otherwise I like it.
>
> > +/*
> > + * Recalculate mask and update children dentry PARENT_WATCHED flags if=
 the
> > + * connector started watching children.  When parent stops watching, w=
e
> > + * clear false positive PARENT_WATCHED flags lazily in __fsnotify_pare=
nt().
> > + *
> > + * The caller must make sure connector and connector->obj cannot disap=
pear
> > + * under us.  This is achieved by holding mark->group->mark_mutex for =
a
> > + * mark on this list.  mark->lock must not be held by the caller.
> > + */
> > +void fsnotify_recalc_mask_and_update_children(
> > +                                     struct fsnotify_mark_connector *c=
onn)
> > +{
> > +     if (fsnotify_recalc_mask(conn))
> >               fsnotify_conn_set_children_dentry_flags(conn);
> >  }
> >
> > @@ -367,8 +383,8 @@ void fsnotify_modify_mark_mask(struct fsnotify_mark=
 *mark, u32 set, u32 clear)
> >               recalc =3D true;
> >       spin_unlock(&mark->lock);
> >
> > -     if (recalc)
> > -             fsnotify_recalc_mask(mark->connector);
> > +     if (recalc && fsnotify_recalc_mask(mark->connector) && set)
>
> Amir, why is the '&& set' check here? Under normal circumstances if
> fsnotify_recalc_mask() return's true, 'set' is true as well. We can be
> racing with other updates to the connector list of marks and in that case=
 our
> fsnotify_recalc_mask() call could be the first one that noticed the marks
> attached to the inode are now watching children and is thus resposible fo=
r
> setting children dentry flags even if 'set' was false. So I think it can =
do
> only harm...

You're right. It's wrong.

>
> And for similar reasons I believe fsnotify_recalc_mask() call in
> fanotify_remove_mark() needs to be updated to
> fsnotify_recalc_mask_and_update_children() as well. Standalone
> fsnotify_recalc_mask() is simply never safe unless it is followed by the
> update children later - perhaps make it __must_check?

Yeh... neither dnotify_flush() nor dnotify_handle_event() check return
value now. I'll need to look into that.

Thanks,
Amir.
