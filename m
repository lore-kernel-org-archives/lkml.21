Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795196666;
	b=Sa0z3ME41QYBYvRR+hfR/hI3eHPH/N5gR3MYNOFOYVqTEhrgMXqVmvEq4dCvSmepo2H2
	 xjRwd/jZtNqQ0yfu5yj7qeV+SKZyl3qKbVKvorutL3UHfYrQEJBjK8jre9mgaR8BTYml7
	 3Np+JRB05ozrWBuxCkvOvJx7EISYrYiucC6BctCUYS3/T9xrHCqCTWOrmXRfdI0j9hBPu
	 cN9hJc03iV9AjLmf1/qBPBsKN4XzOfEk3u12xnqT6eg06Iy11H/GhVcNRGSIr3ZJFPlpr
	 2h8Ug28vcMgtH42PaTKFb/kaI1LHjDlcKBA3zIg7gL26oEdnAC9Iqd38GZNxAMobmcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/PSFFyAe69sjRzigw0kuVs6QT4zV1dRas7KhEugrhMI=;
	b=S5/FJvFvqO3hGpLPoKlEMFbuIaA4pSFQgBku3mTRiW1MOlbhYwOhOe238Fay7Y2Tuy9M
	 srn6KsuglzLH4Y1oeeASOkEgmhDiDd5kyOY4DZzQ7eAQZz0jm2OVdrZdbELnb0JrOqHk4
	 PHFXZQUWw3HjbbxC9I1rITtAHaHgy4LPT42tFgM377bOoAmSzB80/DZPXviH1lfltQSTq
	 IhM6C5UTLFIoZRJMYYEQQDTVxmrNqAX9zemQ3Cenp6OJUj6i2J17Ghh1kDKYwtFkEL7Jk
	 mOPVubyTB7ONQjuPjX+5SpCec0atVU8EyRlILi+s5E73sXrxa2ADNZhyA6rK+13ZXcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=LHJ6QWol;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BEC606A336
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08BEC606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=LHJ6QWol
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-86320a60314so95654a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:44:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795196665; cv=none;
        d=google.com; s=arc-20260327;
        b=s5TSrCoEDcs/DuDBm4y3LNiDT4unx0JsqWFg5RPFr2ByiCi1hVd9g2ZZbDssQi+Q9u
         Pvlq7ZUsHG7j1e3hRLMS/TrmbCc9xggfoo8bVoYl3N4DxxRIkOv8+ktp3JD4e2vA+uPb
         UTxY3tKUvYX9ixf5ORT959FDkRfoJ8Zfu0syiRNLrUDi8rkDCF4pz2gejFwbEUwwDMR7
         0+Sf7u/hgFT0V+AzQN33gywm4MZfUA0gQCSIJ2EPfw8VyJTLa1w68lCveqFTtLdI8mdd
         TeZllPJWLErIJPuI1CPoRqwRj7CfX/dujSYvrqrR/YKTxpmbVnr7iUa0RpvDANYtRUQy
         acRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/PSFFyAe69sjRzigw0kuVs6QT4zV1dRas7KhEugrhMI=;
        fh=2hOETvaJOKqMcLNVL9Gkz/Q3m0DRJAQZSqVPtNqXjy8=;
        b=OT0GAj8cl5+FuqRFVplW4wtMAGOe5zm4IuxQvJmYprklE7iErM7veqk4pzQhdpmiVq
         IFB7SnhZ26CGepO7wiyRQ98yC/rc5N3/HfpZrgUPL56k8i1MQO1I3qWpVt2x/nIj9lO0
         oUUHuYPy8qzKjL9Jp2NgQ461rIZj9TFjq6bv5JWDdTJCAGl41/uhok5lOlzn1r8023Qh
         WYbmwwZfNF1TYZRMyH0WDWWmGHU/55cA94O3RqASNl/HE/q0PBxolFuCAG09TwB9FYrL
         kEp5W3mxr29DhQLR5C41+W2MQh/hNfjYram+85jNht/V70WevexwTWyWkcIWctm9pMtF
         Z9XQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1795196665; x=1795801465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/PSFFyAe69sjRzigw0kuVs6QT4zV1dRas7KhEugrhMI=;
        b=LHJ6QWolNZbCECT1cCM5sJta11VYUHU7CZc8SHEQ8lqzh+DXexDxS8nP+YiC+PcCp4
         v3MOFF9uh+g1gyQx1S1rhqX2DYn3XGc6c0pg+Rx1xXLVbPaQeTJUCBHJOki5u/UqivmY
         1mOupbvh/iRl1UY43O5c6WPfw4/8eE/1zGpozyY6ZZjoFpDKKXOTq5bFosJHeZkzIE0Y
         a/8D+jz8UBjVhhqIyKRd4K6x3E79uakHohWgKzHoZuvEx9Q1u9sQRmrclQJiNuJaFwgR
         4NmxTx+QbZvaSXR6NPJMZXhA+1XWC4HPMhYBJdRrdCOPbL2HGffM/F/K2c8dCyG+JiAP
         X4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196665; x=1795801465;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PSFFyAe69sjRzigw0kuVs6QT4zV1dRas7KhEugrhMI=;
        b=mx1BBlPfsHvD12cvOybcznZ1BGhr3yo08bdzizJvMzQ5yuWEYWS/NN0EO0+uEjJLuM
         EBLE1V0y610JbxmGHcYums79l9OTO3/a5Uc8MzdD2Me0IKEXQVmxciM88CSLoaaKnrxb
         C95AVm9CjG7D1hiqUYSBJI3aamhyu4K5t7gO5huKpB+w8LuRKUPbTnu6ingSeOjJETlZ
         fXZvONn0pvU4wD2X31wzy3YZnMhUPksufOayy/iWvpXZOIqQ0inUEh4KGK5GBiOz7Hm8
         bpgNl+HEAHuDSOQrdyvWeTcnm5qPK34tNtnN4rwcjrJ0D74EzlEJ5radDBtM0hvDKHZF
         8m3A==
X-Forwarded-Encrypted: i=1; AL+hErETzTRXOXKSousb8lpBPSBdIKNPoPFQ2bEwwspvWfv/WTeNSDE5QENHv6Ab6XDCg4cjWE/LuczW42cTvSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aXcT7947vT0HIUYGGg6q+qb2ybCEFa+COyRP3Zf6yhdeVACr7
	San1LXG7WJaSSA44wzyxAkdWZbKCy71CA6bVhRVrBYKIdjzu/3azL4jqxHHFB0E91CyDfJ77zO3
	kgAKvbeet9ZFCWU31grFtTw/nkixm7ineRkbRx8M+PQ==
X-Gm-Gg: AYBFou3L+8ZhQ6eRuwPEyYHh7RrDibkmh8hYvpVOAWPRwB4+XVK2Sf+yv63VBcdBkG+
	5vQZEXx8r/0LeWCFOkm43TmetvzCe8ybaQeJSGT0gzPKbOrkQuENt2LVamLkmaKh7MYe9uoTsdS
	SIP+mRFxmCheVM6d0VFXQzKCVemX+6l8HlvZ74ie2Rb5gSl0J5bDn2giGglAV5B2i3Qw5vTBFZU
	s4cprRud/P2rh8pz12YQ99Cll+8VPSh6QYr5cVbMZMMIdQPQ1L4MDxIakoJBvfTIbunlceKYC96
	U0GeIyA6VJn2YCM44s7v/xvGlwenjse4bELuT5lVDGNXW0Vf9y42NArEIakPEWKURzJBDNsg2lU
	ZlSAJG9zY1ngFXKpJYAzx1qxa8cu8zrHACMj9Hg==
X-Received: by 2002:a05:6808:151f:b0:571:a186:d6c8 with SMTP id
 5614622812f47-57a06506db4mr6743010b6e.1.1795196664754; Fri, 20 Nov 2026
 09:44:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <awBnB-55HQ54C1x6@infradead.org> <20261120162257.498238-1-zakaria.belkadi@inria.fr>
 <awB8OODx0fCFGc5G@kbusch-mbp> <awB_xd60To4UawrJ@infradead.org> <awCCG3FWbMHHvYd5@kbusch-mbp>
In-Reply-To: <awCCG3FWbMHHvYd5@kbusch-mbp>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 20 Nov 2026 09:44:13 -0800
X-Gm-Features: Aa3M54rN6No3ymPiMuTUPQJo1VGf1P8ZHIrPSwo1qjIt4YuOPXOB68fUXRsfIYE
Message-ID: <CADUfDZqNM2=KzsnpA+R5ygAbS-SiUzQczZvgM_NoYrhR7Qyj9w@mail.gmail.com>
Subject: Re: [PATCH RESEND] block: pin user PI pages for writing when ref tags
 are remapped
To: Keith Busch <kbusch@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, Zakaria Belkadi <zakaria.belkadi@inria.fr>, 
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kanchan Joshi <joshi.k@samsung.com>, Anuj Gupta <anuj20.g@samsung.com>, florence.schadle@ssi.gouv.fr, 
	frederic.tronel@centralesupelec.fr, louis.rilling@irisa.fr, 
	stable@vger.kernel.org, "Martin K. Petersen" <mkp@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 9:23=E2=80=AFAM Keith Busch <kbusch@kernel.org> wro=
te:
>
> On Fri, Nov 20, 2026 at 09:13:41AM -0800, Christoph Hellwig wrote:
> > On Fri, Nov 20, 2026 at 09:58:32AM -0700, Keith Busch wrote:
> > > > Agreed. I'll keep the PI iterator as ITER_SOURCE. In v2,
> > > > bio_integrity_map_user() will bounce the user PI buffer for REQ_OP_=
WRITE
> > > > when the integrity profile has BLK_INTEGRITY_REF_TAG. That way the
> > > > block layer can remap the tags in its own copy.
> > >
> > > Can avoid bouncing? I think the remapping flags can be tied to the
> > > user's reftag check request.
> > >
> > > If BIP_CHECK_REFTAG is set from the user setting IO_INTEGRITY_CHK_REF=
TAG
> > > on a write, we can map the PI buffer for writing. The user explicitly
> > > asked to have the ref tags checked by the device, and partitions requ=
ire
> > > remapping them, so they've told the kernel to write to their buffer.
> >
> > No, the user did not ask for violating the mapping direction.  The
> > whole remapping thing very much is an internal implementation detail
>
> Okay, fine. But can we skip bouncing and remapping if the flag isn't
> set?

Currently, the remapping happens regardless of BIP_CHECK_REFTAG. It
depends only on whether the block device reports ref tag support via
BLK_INTEGRITY_REF_TAG (i.e. Type 1 or Type 2 PI). I think it would be
a UAPI behavior change to make the ref tag remapping conditional on
BIP_CHECK_REFTAG.

I don't see a way to tell ahead of time whether remapping will be
required without walking the metadata buffer an additional time in
bio_integrity_map_iter() to check the current ref tags. I'd vote for
making the simplest fix for the vulnerability (e.g. always bounce
buffering) and optimizing later.

Best,
Caleb
