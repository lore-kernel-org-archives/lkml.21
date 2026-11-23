Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795435022;
	b=gT/Wv4kl1T3gv0CreMpFSqYj+5d+2Za++Rwx21T1pfKbvoxIBZ1gxZcc3+bQbsu2+eLw
	 2wu5hXLFN1YUS9QDOnqLIm/KWPEHuvtCs3OpEFhZHfYM3QxDA0xcu8++aUSxQhtWJWrnq
	 y6+DwsCiRhmYmPjpsyo9rPgzPvFalKSEmTS+B/8TBeXrEOk2Hi+kEId/9qkB48HbJNEDo
	 1BisonyO9zknC6e2+eFTNg6SFW8OeJbC4ibEzRogARGcG/HlM8bQ3xmw9GUuHkgnqvbDf
	 tic7I6XdeKt2QDu99WPyxOtZl+01YR0zNwxXK8ueRt4IdPK7L4w2ah4lQIR2vHbzpRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435022;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=oqxTqGc37dwDnLjYZnqU54myhb23sMonqleeRzhUP+A=;
	b=Aqj+9aplLW449dBIrmxV1oO+RRf5cFrM9z9S2rsgOKvbQfd9FGieEV56zC9+aajnc89d
	 K21C+bhAxHeZ3droyuGBM0ACKmIsBa2wno02aIGJoHXOC13Y+3dZZ92zyiRFWgd19Id0l
	 N1OOFhFMfQTXtjHIzWO71q0T1Y3U8hkOk80jxvoxl9jmwLBzXSUurQcO1B1QnzFU7xVjU
	 WxuyROnZTB5C4beQGCvuWmRtzJ5zhRAfOwljJXJFnu0i5f7sJb1eBHnWGo3o20xEngcjR
	 EwXTbauaUoQ8TTy6fk5VD2ZHjB0fAlOh2+tQeD2QJYvPiMCNNyP2IGHhxcSSoITmtqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E+gRbUMk;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=uE3fBkPq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418B6606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 418B6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E+gRbUMk;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=uE3fBkPq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795435021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oqxTqGc37dwDnLjYZnqU54myhb23sMonqleeRzhUP+A=;
	b=E+gRbUMkXzr0ftgnphVyzjzHx4e5SigwzrZsgeRJCNybCOx25/aMeDa/5uK8JDEq0XaT8T
	/GotI0hz8XNeEaCJySIHX7w0tJVAPDeoB3onXSvfuP5VncwyfmwP7YIzUrYUIH/3A0FxwR
	7vcuuTbyVgva45tbdLQt4k2HsLFCp7w=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-NUlWkIBCNSqLP3q4Rvrxow-1; Mon, 23 Nov 2026 11:56:59 +0000
X-MC-Unique: NUlWkIBCNSqLP3q4Rvrxow-1
X-Mimecast-MFC-AGG-ID: NUlWkIBCNSqLP3q4Rvrxow_1795435019
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b501e92b97so30282377b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:56:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795435019; cv=none;
        d=google.com; s=arc-20260327;
        b=WuM0cPxsKv6f1aiZrBTnB0lyjWJRU65fb+V0a8Uab/lm4baBtsa2XaysBDohNuJl1S
         8vCiAyG3Pusx1oCt7OURaxaAYWd63uysvDAAS+806zW6XWJqMcp1wTy630GHFYiA/7YC
         RHTn4FF30Ij1YDgfqIV8mdVT+pQ3CypgIRw0jRHpL5rowSZl44n+F90yHuxCBgGWU2LN
         1aELsklGOW1cMxmQkX5WvOcoCqt8ibBckxiTjGgeF7K5v++0QijTiz5dJv7GUigcFknq
         GMEb753O8FXyLDx/h3CA3DdCGgBAV3STth9LZQcvAywwcGxreL3SCrt79H5nQ4OGA6br
         htMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oqxTqGc37dwDnLjYZnqU54myhb23sMonqleeRzhUP+A=;
        fh=raU7aK6vSlAOZ79rmZ/IHXtNFGM+hpjLEeL1K9dk3UA=;
        b=bjSDYLH/XjW57AfcdBxEqeoJwP1sDaVSudzG1La6kdFXsAV62blCuUSr65Q3wNgXfo
         TalvGKxw/uBKchXi8zi3OdnuQlMVTKqxca60WToobR6Nb9u3/2V79qY0TT1xJCJe6Ocp
         /A1Ff6htJS4eJR28PHpYiM3ITFmlxes7wCMj7jWkRLT6DvPX71KWggRv+LmQZ2WNnCSq
         ddkNeagWGQR+8Yr0XOzkryHxRPau2chvIRH3fByNESJ15K32EtoYMo5Uyl8VR6nAuza0
         xPUJuVz0HBW8nBdWruUv9zZQppnp0NrBRvfL4SK2iztvcQ9DlyBWLUNmO/x4xz3ftZ59
         Q9/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795435019; x=1796039819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oqxTqGc37dwDnLjYZnqU54myhb23sMonqleeRzhUP+A=;
        b=uE3fBkPqZHuiV0zspXRYOlAIWjlsHa1xBh411w5ZfvWMkXRNiiCke1/VIMPgMms1cw
         emY44vAHwtWhEcy7QqtIcvwOEdAwbKkZT8gnb9pQg0GRhv+aCfl0/3pN6c2nOCFBkDar
         iGBmarvx33bHtPnyd2m47JeR2vILjrFMW30NjMcE/im19C0YwNf7Uq+VbBh8Wk5nFQLx
         yBFDMgB0Mwuu4r5ESKndz4VGkwJYcIa35a1H7nmRqItTsgjc2xx+eBvQ9LJx9KO0qV9n
         z/pm0z3kBbliJnL+sIRkMzmJlO0XRf5FW2DcnXZseXLmODP/phiKBd4puY5oi/HQexhT
         c+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795435019; x=1796039819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqxTqGc37dwDnLjYZnqU54myhb23sMonqleeRzhUP+A=;
        b=t0Mm1C7EVeNFOOm2T3TrNKYY4JHVegmXyhf94paMzqn69+rP07lleuZyyuOkmhhqdt
         PQTd6ZWoqq+JLT/1rc+uyq/vOLt+eS0RKfxwxePi2KI7DDOM0QTi+G5yhe3VJF97BhyV
         d9RtM6RYrUjBJQv4xkgCiFMtYMLFoeBskghvg8jnwn0RBf9G/UGpj5LKO8uujDIJyKD8
         9MgDBSRaEK3qX6EcMrImxDBfuKlHz1fAU0tSGTRbnJqqCu0DstLB2DHoroCUjXy1AQPn
         NET/XTPlQknu+xcI60hwBF2QFcZa58B1pJASB3QZeREJRup2hWgWIFR86oXIuM6DBdBU
         +OmA==
X-Forwarded-Encrypted: i=1; AL+hErH2pZpEpsWDkr5ya/J97gRSSF7rcgqIwQJnN3Xj5unzFjXHjJI5A0q7CrFwcbK5MYniqi4eclidT7wa2IM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OV+NdwOdExq2PHIrrv/gcP+KEL5AY5N9eVgDBX/2YjvBmuft6
	rztZVaFFLQeT6wTrQsQfsRsbIDy7fXIl+Vho2fyMk9jnXI0gowamDJfNWSXwizpuy4DSJB6FiN/
	jUoN10mF9iBCaDJBVb232WTVSWwVuJRHSKWyNs8RUCYqzzapP5zl+3mqMcvSeKo93gsuBQA5Ytb
	rf+Ig/u3BmT9kOUA4+O+dHN2b9roGJc5LWdN9cl9Rs
X-Gm-Gg: AZFdTZfxS6thCb7AwX1mYaHXaRAH+jsQqgGbU62lbpG4St5CxAdriZ5MLnS1gPkvOhC
	6hYZlzFUR9/W5fyQAJi9MO+EkR/hFXb/0Kc9Y7FN7Y5kzexa2UaKSDpVmp3WYgxcQfBSUvHSpWO
	2KdnOWcPVcA1w6q4wIApejlmu/l0fHuo0saD4ucXAYnWprsDYkefHK7+KmgEjnoUuFCYON9KJKv
	tgqGOiYmHNYQPsFsTBcpuH0/pAb4tXFqtPjKvAzBFpqIA==
X-Received: by 2002:a05:690c:6b05:b0:8b3:ba8d:2f55 with SMTP id 00721157ae682-8b52043567emr39667117b3.33.1795435018733;
        Mon, 23 Nov 2026 03:56:58 -0800 (PST)
X-Received: by 2002:a05:690c:6b05:b0:8b3:ba8d:2f55 with SMTP id
 00721157ae682-8b52043567emr39667047b3.33.1795435018370; Mon, 23 Nov 2026
 03:56:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120031305.3561045-1-huangsj@hygon.cn> <20261120031305.3561045-2-huangsj@hygon.cn>
 <CAHc6FU7VUBLg=gX-xspFfp4jPffdH7Pc4oVx5nRDo7A3aiVWug@mail.gmail.com> <awP5q_CmS3uIqfCw@hsj-2U-Workstation>
In-Reply-To: <awP5q_CmS3uIqfCw@hsj-2U-Workstation>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 23 Nov 2026 12:56:47 +0100
X-Gm-Features: Aa3M54pdTCvZmmXjws9eztEBY-s6WsNxLh4ieFxp9T0N0Za24a02lla1XE5V3KA
Message-ID: <CAHc6FU7rAr4Mbf3KssQdsxhdk7D+2SzxSydkyw7cgykGGJOi=A@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] vfs: add super_iter_inodes()
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

On Mon, Nov 23, 2026 at 9:31=E2=80=AFAM Huang Shijie <huangsj@hygon.cn> wro=
te:
> =E5=9C=A8 Fri, Nov 20, 2026 at 03:56:23PM +0100=EF=BC=8CAndreas Gruenbach=
er =E5=86=99=E9=81=93=EF=BC=9A
> > > +
> > > +int super_iter_inodes(struct super_block *sb, ino_iter_fn iter_fn,
> > > +                     ino_iter_eligible_fn eligible, void *priv, int =
flags);
> > > +
> > >  struct super_operations {
> > >         struct inode *(*alloc_inode)(struct super_block *sb);
> > >         void (*destroy_inode)(struct inode *inode);
> > > --
> > > 2.53.0
> >
> > Sorry to say, but this has gone quite a bit off course. Can you try a
> > construct like iomap_iter() instead?
>
> Christian had suggested to use the following methed:
>   https://lore.kernel.org/all/20261120-mitverantwortlich-drehbaren-kantho=
lz-241300d20168@brauner/

Yes, that's what I meant.

Thanks,
Andreas

