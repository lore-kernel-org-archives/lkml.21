Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795545618;
	b=aLddsq+5sjdohM+CmVN7lmYVTyeUBYphTbPopAA1DuHj10bfVcpL+cLWAONUOnBWsamM
	 okASJDbaDvpGB9ICxcrfD9rEEdFifzuBXnKeUB0lsVQybDl0+/V+hQM4SJkdgt5pkd331
	 /M96sM9CmeAki1+jIta1G6BOVQJN/io3t5RuqhRLKDft7CI0y8ZMWtXi+yvtX56grQPmg
	 kWIqCtc7VhS3yxe/spY8KT3/lDrF5CIqFP5jxmoWj8LEK0u9dzwUCdL6VRBELfOWMdBw/
	 q78xovYdN2Caj7k60eMqTMxulU/s8fUSzemEtIE5bWcwxFdZ4q4J+QjFfMcYGhP+HTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3cr3soCs/aH4Auc5veUlCs6H08qDugqKnqtBUy6DKyY=;
	b=bytfbK02nLJ+UMwp5cY6CWHnUIBEUJFZ9oU3+Vs3MVH3S/VnzBmDLcsW6/04sB8EkByJ
	 Z/uas7gI7A8r0c0JLP7U5x7SmtbTZGgqw1AMfSncjPrAoc/ION6JDfRtNe1FPlJh/UFr+
	 d9M2REiDNyTpBJY2vAieT6Ju7z/c4uym1ij4nTbcbdGVzAX+HeHHqc3szlC09t3gx6Kbs
	 dt0XX+hthdlXQvw0X5wErfd55LYhMUS421+x4SEGGXoNZhQ0BzQcwEMRjV/ASyQ7vNn2/
	 0QafF0pqN65W8HP+zXJl89t0Ycj/9whsyT4txIXD9gCx6RK7w014PMA6L8g0abl3qlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Vfv0YWxS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6915606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6915606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Vfv0YWxS
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b271e573adso2090137b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:40:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795545612; cv=none;
        d=google.com; s=arc-20260327;
        b=XNyIgi3MxO63CBRm2vckt39JS2vReWfLwnnxTL77UARZ3Yo5dfI8e5g+BMZUp+n8iQ
         s3DCcMg3uszla5Ij8/vCm0Vtn/iroWy5YDvep0CC9UMS2VD7kwQSjDRY/mak9TC/xO6i
         6mJnhSMms6Oh8vcSz9jLkov0sgv63kWso42Mq5vpMh9pRWXjPyXy0t5UJ6DiRQZ2js2B
         YLFg8ehOBZa7skn5Q0P0394W9szQBXm9Irk4+GS1/EqsNmTsoEPpqvyVWlbBTUfXXker
         NEUE1YyCD1jZIryT5U+mWqDGFl0Mup2y+KHgWQRnqZP3N+wEmY32r/PbK/gqGKhrdQjX
         IOVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3cr3soCs/aH4Auc5veUlCs6H08qDugqKnqtBUy6DKyY=;
        fh=ApPCF/qnfEyy/ZW9wSm18dQNcdHRzmEKSlVLtVhD29M=;
        b=gJiIhAHMcc44COW2b1S1fC/XSoiDpd2qifwvK2aeONvcDXK9til6Pn+pkgzbyTMa/u
         BKvWzmrX4xUS0pl24hfL27v9+eakLT617hjHgRa48jtiZPvEWQ0rggt1pHVrwD8QsjVL
         gl4Es+hR0/Wk8aGeuPd/r8GSNRBSSagF+3tG4R32R+8ZRlWkVmy7XjDKwEUVdTvTa4id
         4RLi3Pt09UyJ2nxD78JmIukwIG1hbFJltOGUwzECNhs393qQEv1vUFbT0uvPDRJjp/GS
         MWceAdALDQR/Pj2vOZiJfrjclCGVCtPTEADqeWjlAe6d/UBJKGhIm9w5U49liRKYsaYH
         3cBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1795545612; x=1796150412; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3cr3soCs/aH4Auc5veUlCs6H08qDugqKnqtBUy6DKyY=;
        b=Vfv0YWxSAxoP1AD3nQ+YQzFzO3EpWxRZbX1pQuOChuKfbzewP85iO1pEw97BDfn3jm
         vjpbtXC0YVI234XklnPCOtBFXdOxskhzU1fvy520UfdSyEvxE7VRjq4NgzgxzY+K1XhY
         a731bhTlCKkOqy3fZ5xznDV4yOmbiBtbYFPHXAVKrEf6+gYjx5sj5UDs4OuFQpogM7LS
         6cDAynXbGm6LnF6yorabsPUUT+fzshFwUdTNxoE/0EAIEM9Hi3gfAhl9FrJRectaLrsc
         G9qQA1dGU/+wCd3Y5f0zLjRhsMwbxUw74/x1cd5hJ+xpdV5S/tEjdO/Rs0ooyEfwmtzp
         DUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795545612; x=1796150412;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3cr3soCs/aH4Auc5veUlCs6H08qDugqKnqtBUy6DKyY=;
        b=gIKJgwa9grm98p2wvXmh8ZpPBfl/kEqUpDtvkmced3vNFGLCpiQZhxWT1BUOL0uW+c
         ZahgNBEXR9BHHd7NX1ML/bps7kRK3M/9n3ysfXTrAe2RggoTaYYFSwkJeb1mfD5lxCtG
         OWgiE2phbkNW/j303nlFaZvfj/j4DWoz+AjtaNix5jYQleURGa2PBWWnSW6ChnP6nQM9
         j77S+86EQsrfHzzjr9f8ujQZM6zGsYItk9RPM5qOd9tKqk1yByz1WxjhQevh1JYk0iyT
         VYPGt7L7tM8/DJk/rB8usc4CpjGdz714RGeCbK7SJCQcalK5l2BLR8KVKXpVh69VcjTo
         tRUQ==
X-Forwarded-Encrypted: i=1; AL+hErHIUjaHMpaNmcBnFnKbnX6vwZw3+Blh0Q9kMURP+DBOdjJwAr4if8angF8kyVZZXDmlblRVMoxfb1tlRv0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Nv8A8OWG4WE01iExJObuns3UNDGFs2izdC1qIxJFhJs24rUvj
	ZUme5ttwHzWXf8EW0Y6yBnsBZ4TsmGSd0IqyNu9OSN5SFz6Uk1zHJ3h+RAnLtlDOBwFYyqPXLHa
	Lbp3/qN8n87LUStSEx3ya1VMGFjFbftwb9g2JKcez/A==
X-Gm-Gg: AZFdTZdzzFe27/2ReBVrEFREOSditNo9WZLdUYxHTwFjYnF552KytqTVc+tzF6pNXS+
	dp0u9Xf7MO9IdHl5ONXuqCwbWlEa3RpKqgUCbIwa9VFgHRjUGG7QaUmZpfWVhaHHm6QhSwAVT0t
	K1Ju711i8Osx2a4n28lDVjG6YwVYmx+KIlw1nk6MfTq3+m3XpODeO9waJgmd4kPczpMmj9rqovm
	R/4qhLrceprkYnM4eoqntF3+QdZL9TGG35PWG4tWT9VZ2RgdfyJ4ek01BUH+8RH7PO5PyYBzsU0
	MUXyKeW8uOcITjuDH0Bm7UWDmSnhsrN3Q86vtxml21NT0yMgNNIr7dihn1O1R+KWhMghAivZNhz
	xXoKcoE6Hp568BO33WPLUmraIUxRe6ye0v4h/
X-Received: by 2002:a05:6a21:3e04:b0:3d3:ae40:51e6 with SMTP id
 adf61e73a8af0-4014bb52da7mr14240670637.26.1795545611912; Tue, 24 Nov 2026
 10:40:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-34-angelogioacchino.delregno@collabora.com>
 <CAPj87rO9saEC34+5NiYK8xyZiNytrVgOcszoY5uc7BpL=M4WTg@mail.gmail.com> <14a4f698-8739-45c6-8904-496ac61e73c9@collabora.com>
In-Reply-To: <14a4f698-8739-45c6-8904-496ac61e73c9@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 24 Nov 2026 18:40:00 +0000
X-Gm-Features: Aa3M54qIEgHVmsqq4DxWvUflQF2v_NEZOm-dewWZxD6n7rtVG1aK5-HIk_WFDp4
Message-ID: <CAPj87rPtL1nDrEF34LTmQDr9V4GbX0s8SR3wwwWWp4r0yQ2hag@mail.gmail.com>
Subject: Re: [PATCH v2 33/46] drm/mediatek: Add support for Display Controller
 exDMA component
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hi there,

On Tue, 24 Nov 2026 at 15:01, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> On 11/24/26 15:28, Daniel Stone wrote:
> > On Tue, 14 Jul 2026 at 12:45, AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >> +       if (!pending->enable || pending->height == 0 || pending->width == 0 ||
> >> +           pending->x > OVL_EXDMA_MAX_SIZE || pending->y > OVL_EXDMA_MAX_SIZE) {
> >
> > Definitely don't do this please. If exdma is asked to do something it
> > can't (and I'm assuming that these last two checks are intended to be
> > on w/h rather than x/y?), then you need to reject that in
> > atomic_check. Getting here with pending->enable == true and then not
> > enabling it, is not OK.
>
> That was done because mediatek-drm isn't in the best shape, and atomic_check is too
> late for this check... adding support for those components is done on top of a big
> restructuring, which still is not complete, as the entire mediatek-drm driver can,
> and needs to, improve quite a bit.

Hmmm, too late? I don't quite follow - there is the layer_check()
which should presumably stop such a state from being generated within
atomic_check() - is there something I'm missing which means that this
couldn't work?

> > Relatedly, most of mtk_plane_pending_state should be deleted as
> > duplicative of drm_plane_state and it would be great to see a patch
> > series very soon to clean that up.
>
> Again, I agree mediatek-drm needs a rather big cleanup.
>
> Lately, upstream has been a bit slow in reviewing etc for many reasons, which is
> why this series has been there for months now (though things are getting unblocked
> lately at least for this specific series, so that's good).
>
> Anyway - let me see what I can do, but I can't make *big* promises - the only thing
> I can say is that further *big* cleanups/restructuring is something I can do in the
> next iteration (after the partial restructuring that is done in this series gets
> merged, but definitely not in this series) whenever I can find some time to.
>
> I'm all for making things perfect, but I only have two hands, unfortunately :-(

Sure, that makes sense. I think this series is already a really good
step in the right direction.

There's still a lot more to be done though: if I was looking at this
as a new driver, the state management alone would be a hard reject
until it was fixed. It looks like it was a pre-atomic driver with its
own state management, which then had an atomic implementation bolted
on in a way you wouldn't do it if you were starting from scratch, that
has then had three different hardware-programming mechanisms (shadow,
direct, and CMDQ/GCE) pushed into it.

I'm sure there could be more to be done with the vfunc forest and the
way all the components are modelled. I'm sure any specific 'why not do
it like this?' suggestions I would have would be very wrong in some
way, but as an exercise, sit down with someone who understands display
hardware and KMS drivers for half an hour. Start by spending 3-5
minutes explaining the MTK block & routing model to them, then go
directly to attempting to explain mtk_crtc_num_comp_planes(). A lot of
the questions and confusion that comes out of that would probably feed
into what a different design might look like.

Right now, it feels like the top-level DDP implementation is so
generic and flexible that it's extremely difficult to reason about and
think through, but then it's so abstract that we end up not being able
to use any of the hardware blocks in anything other than passthrough
mode, which is pretty much the worst of both worlds. Hopefully we can
come up with a better path forward that means we can support more
hardware and expose more of the functionality as a nice present for
next Christmas.

Cheers,
Daniel
