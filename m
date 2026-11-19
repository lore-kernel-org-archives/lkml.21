Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795128624;
	b=3pEuREnRWkNhwD6/Rj7/iTvw2DJ/7VZnPOPVltDGE4+Kt8RumIhTWLpVMKYB+y/3Ccam
	 wM2gmaqA05COKuq8jAECoXlZ35hgI71GcJnbv0menWq34UfarqVguq0TTvpJ7zQUW6UVl
	 PLFjnokU6gSj3HHwjqpwETjg0MK+b8uOilkhQBxd4Sk1XE+w4SVLGNwrmGl1ZAnZSpSts
	 3TzLA5gtCzsQpg2ibe7aq5nIdF2ptP4oMWUCO0hB3eeSnSLqY3u3NPUFhFUBhwM+IvXew
	 +L4sp1nsRt76K578AyySoI/sYyKJVEIwnSTh/ds0o6iz7oL1a2eEyfO5NwVD5Y22hMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=e5/dl7hyTqZEbaIFwuAjfKmRpl1SUl3FSpNrpJ9d20Q=;
	b=qoYqT+gZpAWLzP6wePz2f5O38vqluyMQCjaVIwzksu1w1t8oEuCVKW9imIF+viglsiEe
	 5GoeMp1kREryxV9JAyojm0g4sC3XHVzNVVvJ02WZ5fP73kYloum7GCqwJkQ16ArcPeBgX
	 xBde5tjqKGHajS3hPtPWvcJopbeLw01ilgwtWUjLsfCQkdHxsEWPR6erdo0KCd088LlOF
	 tghXgMEht2DmCHrTshICt2Tj5i9tCOSr2iPnv/wFfA8VIYeMfOKJaLSfX0ZAFQGt/SCxV
	 SPkhZw/FNN5Ws2bq7ebSQKOZpDkOdIhV9dsPYQn+OBVHk4e5NXli2vstFs3Fp9PrUwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CnCiCFWV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE847606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE847606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CnCiCFWV
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso230372e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:50:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795128622; cv=none;
        d=google.com; s=arc-20260327;
        b=nYAh2osQjZDJXSeI3pMVud/64eUDoHzScn6LXcHu4o9nwG+SOYoSbthczgj4BwLjvN
         oUn8dJ40jmkYLMXD/uW+HWvAIgVc7YHKiOJoiRxBp5LEaOCotpPqK6Nm6P/u01vHVrbR
         KeLlDLQ5RPE+5LtwKcWmOxacLmdggT5usGIJtmViVhhbnYuIBysAhZd/LgybijC2JP4x
         dyq+ClooYFkEJss6Vhk8YCStyYfwXbSaQyGLZid8Oh/Yl+6X0whiE+RHRZpq8AEqOoOV
         4ZclUI8Kb+XCzgr3fYxxenNV2qY0eHyhKKR2mA8pvlOsjJp/KvpTBomA6TqCxctsuZLq
         cRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e5/dl7hyTqZEbaIFwuAjfKmRpl1SUl3FSpNrpJ9d20Q=;
        fh=R5JavnteeMCElcDvQn26xyUa9PI59OIc/mUlR+Xp88o=;
        b=GI+2CNu5n1QeYZEVwi+w+HdZsv4tDs+z4zM9wm6f4QIf2gGZklcIFZ8RrpILW4rDqW
         IpGaYi3Df7wOhz2nM5TBf9/eipwqYCvWUkWaA8S8nL4Td18e9D7LKjwAPoSD6tVc3Los
         GGw+/TmGjig9HpL0HrziELp7TPbpxmywZmVdlAEYiqWuPmpoUR+WYRDeIEnDh3yjiejd
         0UR1rxL8dWHgCtBnXjqQI9F1RMLv6Ee6HlBBEJ0mALOjQ8yqBH41ZHTpJglEasIFaYTz
         K62/a8SMUb/+wwghT4GLQwKdx3wx3KTyOchp+uLjW1shqOMBvn+IUrD7te4ksnzIRjyt
         okzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1795128622; x=1795733422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e5/dl7hyTqZEbaIFwuAjfKmRpl1SUl3FSpNrpJ9d20Q=;
        b=CnCiCFWVdqrTol4CcpbrSlDlLA3fYAIDBwcdFh6d/8N9Al+d37Kz1pAOOAx90UY2GH
         RwYwOhoV6CXoXSA7CUTRwKZNDbbugHPiviw1ZrlJjOT9eUFGc0CH+hNOe4LM76Uo99WI
         P6DX/zlh2h7WDUsD45YZT8C+yOypQZE14pxWvAPwxvGPdkR0rsUQVWvZNIkOeDQqf1cS
         H/e2Yf2FTuVfpTJ9Pqe8/BMESdOeaRtqVNs8ZsQxV9qkxEPSGBEQoNPDU9l00ioRVU1Q
         yxzIE0LYkdOSEIRca+sVlkRgMIY4FpacTm8jEYXcDJ3wMRhmrd7u6crYQQV5v980MITl
         EpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795128622; x=1795733422;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e5/dl7hyTqZEbaIFwuAjfKmRpl1SUl3FSpNrpJ9d20Q=;
        b=DfCcg7972b0v/dlwH4Su4RFDDOaXxXTAw37Yo4NiFtqG876ooAQ/+4svES/HTsJUWk
         WEs1AXOBC++oV2+tpvzmBmGd151i9axdl3dP9B4PCUsbRlIVkn8wmWowMQOSU8bLyaL5
         SekU/GVVU6qgvxauAMVwnJpUXJ/UP8h8+WDQLJBVUozap2EqjZTJwXR8BE9M2VJA5ZAA
         4kbFUcmO3lE+ZGDzur/U/CGxFFXC9Ng6VuMOQXzd44cKz/1De1PlOz3HFg4W8oR1BJRp
         essld/00lg5y0+gQbd3CsSL+vd7r/EaVdtBcTdVfecmbBKKpG9AQ3GrlKaG93VPwSz2M
         iZ4w==
X-Forwarded-Encrypted: i=1; AL+hErGar+0GLSrL7U9EZMdMaWywvqb5E5EJemuA9ofF0y3MBA21UjKzMwoF6eBtm+WZmw54MclLgZ4D/ZP1G/A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wI7lOb9i0ziQIDnzBZh6CBMyvPsxQdGpjhLs1OqE9R51F3f6C
	ZhcsqEzIAhf9HMPCv4pJeJ8Ovjui06wSsMHd8cpNLQEQZ/NbgVafsx2qyuk2vEncVpOLwaGlJq2
	dBNJPQYQs/hdvo9nTuAuvRZ8FQIz6yv5sx6Y7mvSH
X-Gm-Gg: AYBFou1TpYJbxKSB6umSwxaXdXT7ch/9rgTGvpffuhRgTIlAMueV0hUikRckhsmMLft
	rM/cX4Jxqwaxef1pL+TTbyduNEqHgPPDjxUKeBzC1WRnQlQPN7eGfbdkGNjPGARbyD/mHGrL2TO
	CpLzf2O6+hj+M/90XZVd1SNl2KSyNmMGO2HFLIe119922spQaYiIQ5jJWTU3LI/Jhln24Henhz9
	MDfHQfVGiZ71iQfPWJ313z7TD1DblpQliqLHmT5LhqE6KtLoFv5OaVGGQCfDZxFaFFDVTxR4rDD
	rnqVSyJqYg3NUmZBEds7nVHQm9YdxzKsllOC32PDCM8LkmivzU0b7nKDby3yAuAWSZgFXRBJouN
	xCo5mVPus1h/uybNNcV7zSDl2PmA26Vmnlw==
X-Received: by 2002:a05:6512:3e13:b0:5c1:4793:bf31 with SMTP id
 2adb3069b0e04-5c1bc8495damr319148e87.58.1795128621989; Thu, 19 Nov 2026
 14:50:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117231352.3816603-1-jarkko@kernel.org> <CALCETrVUkbpoFjwSAejyA4b_9qEauAP_36i=O8Op1ifp8aUkqA@mail.gmail.com>
 <av3akYFOYaeQZauZ@kernel.org> <av3bkDnwmjunTleX@kernel.org>
 <CALCETrXPLeUgxyhjP4XuWS46FKB0TUHF5PcMkdMf+qeEXbyXRA@mail.gmail.com> <9463a969d35a7d5ec5a56aeb67644b94.josef@toxicpanda.com>
In-Reply-To: <9463a969d35a7d5ec5a56aeb67644b94.josef@toxicpanda.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Thu, 19 Nov 2026 14:50:09 -0800
X-Gm-Features: Aa3M54r1P8ngsOHB8Vhj7FvubBRj99w4Go1f1fZhV4inbefIYqqcV1gzmh9n2Fw
Message-ID: <CALCETrXt-Do28BHDpbrA98kEy-tQuorxD8c2XsW24Tt8Vspdtg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/13] Namespace for namespace roots
To: Josef Bacik <josef@toxicpanda.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, Jan Kara <jack@suse.cz>, 
	Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:30=E2=80=AFAM Josef Bacik <josef@toxicpanda.com> =
wrote:
>
> On Wed, Nov 18, 2026 at 9:46 AM Andy Lutomirski <luto@amacapital.net> wro=
te:
> > cells: The dance where I create an anonymous mountns, mount stuff into
> > it, and then attach it to the cell is cute.  But I think the userns
> > interaction is wrong: you are making me assemble all the mounts in
> > *my* userns and then clone the entire tree into a fresh, non-anonymous
> > mountns bound to the current userns.  And that clone operation is not
> > free and serves no actual practical purpose.
>
> The copy buys us nothing, agreed.  That's just what the mount API gives
> me to work with today, it's not something cells wants.  If I could make
> an empty mount namespace and fill it by fd I'd use that, the "root" slot
> takes a mount namespace fd already.  Extending the API for that makes
> sense to me on its own.
>
> The mount namespace staying with the builder's userns is on purpose
> though, that's what keeps the cell from mounting anything no matter what
> capabilities it was given.  The builder sets the tree up and hands it
> over, so the cell only ever has what it was given, and the mount code
> isn't something it can attack from the inside.

I don't get it.

Using the builder's user namespace means that the contained processes
can't be ns_capable on mntns->userns.  But this solves very few
problems unless you also deny the contained processes the ability to
unshare userns and make a new mountns, and if you can do that, surely
you can also deny the ability to modify the mount namespace.

As just one example, a mount namespace could have a little flag to say
that it's *in* one userns but its owner is a different userns.

>
> > cells: I find it *incredibly annoying* that one generally cannot put
> > new mounts into an existing container using most existing container
> > managers.  I hit this on a surprisingly regular basis.  You seem to be
> > baking this into the whole cells design.  Why?
>
> By design.  Allowing changes to a running container is what causes the
> problems.  If you need another mount, tear it down and build it again.

What problems?

I get that allowing a running container to modify *its own* mount tree
(or any other mount tree) is a meaningful attack surface.

But the whole ongoing discussion about cap_userns gives a clean way to
deny an entire container the ability to modify mounts (although we may
need to augment it to control mounts if that's a specific concern,
since CAP_SYS_ADMIN is a bit overloaded to say the least).  And surely
cells can find a clean way to lock down the container.

--Andy


--=20
Andy Lutomirski
AMA Capital Management, LLC
