Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795084845;
	b=uVLwwQ4mJQ5YBBHHw1CbEcVy1ro/O65So+bwq4WSVZDZc0hbF3UYWp2aaycHvO+yPNTI
	 ruDofM8K9HvnbAeFgxYDXUBtTmlk5mFc5D2ADwb3FNUN/DFQK/fg2Yx5UM17/Tzb17wQz
	 rEG6rmEEeHJQKhAWIYMeJDzbC8MXlOhkoyVQXzD5rtnOXKK+mmibA2YGRTS5ro5UPemgF
	 TFK/OYO4ARHS9LflSTzLu1lajVIqffhaxvs9kdYs6skQO+g70opTxI1CyYWp9LrqIc4dm
	 1l2sahthe4WQaT+5VDuZ45ellHRv1JLC4fhF2kQzrvDxH2hwksoPJAqP876U0bz2WuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oyV11sNyiPF5EtrEj/Hv35REZuzSEoXVxLshK/+9asw=;
	b=pYYE71+RVbSBAd9RzJPYT/vIZdpyOT68BQJVcxnjY/YGoIH/4h5zsGW4Fm1Rw88tS7CI
	 KNr4c5J3TGKt8esXqKUAozj711o/xmEXtbO9nOk0cV3QVkxTlbFYiammhk/ci3vvlZIin
	 sHfoaf3II0h0audLcQgyrwQ4lJ7CWy7olAIgECWUpwKFCVPwTxQGvqSDhH4AjR+K6QPPG
	 sj2cFSZOPl5kK7m5jE4JGBsSU+qhLIjnJ5z7BwGoxg8O8V4VMn8NJSOKTdI9ENE7SIjaH
	 WABOEO8B+66ihncl8qvagWUlvl4lMVR26+Ac2WbxzP86t1ItsR9w43Sl/VVaDWmGBng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zzpfFDTl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF0C606A338
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF0C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zzpfFDTl
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9906870a9baso1033903241.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:40:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795084843; cv=none;
        d=google.com; s=arc-20260327;
        b=R/ocSz3o+0yPR9Fwy/e8fm4vbHvXynQi13gA2ZDgs0YqJFwpiNWFtq6OT25Uni8V7K
         ulGUE+pk7hyOyXHCcjgmZLTCgVNuEJQI11fX+qcI4ZseNvaEunw6w+vef7p8u9nSv6f3
         OSGmDtgcjdZWlAa9hjoio1m6E/QqDpIVWriV6akyteQoujM9yFsDH5ZeoqmInervQnmv
         WQKKczbIRQd54pchrWGLXTk4NdLpI8lCS3GfGt7ziPKYi5kBUNE77bx5uGRptRNb7VY+
         SQZeDKieyeQUiFDd1BrEcYLCKb9fOadzvSVR1FbdxZSwpN8dU24ido1kfwZGEA6edjU6
         54AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oyV11sNyiPF5EtrEj/Hv35REZuzSEoXVxLshK/+9asw=;
        fh=7SPMgCljZCEpj44o0BJq5n7dd7Aw9gkFAHQfT7fES4A=;
        b=F2bdatyQ8McJPvelw79f3SOaW4ilcPKyiyIdteqBLavpNiKPuiHiHdtqxooJWzOAaC
         tKhpr75jd584nhPNH2HCCZuKI3e7b0+5CLbZd0BPcS/Lx/eLU2TURlvUde6QuFqQOcb7
         iqRrdaNs7Q7x2+Zvec3rrh975+EObrDFwRXt/EsCxCFb+H+h6TAOCXe5ubXkoZCtc6xS
         NLMgZL2BKududErQRfgILh774fPQ9LzeVF58Uo3Alzj6qPFWeIZuE3ruClNAiZoFZQDc
         haID4+qre6SFf3E14O6CkydfRYyssdHFVPwF/6hc70Uyl8lCcADQ/Tp8/8i/QbSzU6lp
         6i3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084843; x=1795689643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oyV11sNyiPF5EtrEj/Hv35REZuzSEoXVxLshK/+9asw=;
        b=zzpfFDTlXCDKyLJIihGW9VpB14K3xE9HaOWWU24vg8A0w+HQbsayI4pM2X7cnBOk9U
         QbJhsDrEM6Z1FwSvemcAQtf00KgOAQBmcyhbxIxysUU1+qSmne3ewou4x26sIxO4cjZM
         dJNDwVKJhL3tcP3r+K7rbANFiSbxakKKCfW16cUEeat7ypZeymjlgdopOPUQOqGgwVSV
         aPIODUeO8wb+Q4H4zIqi80fp62sUO9sM1ojX9UdPSJvLnc6iEM06DpdhikfYPfcVg//4
         EraZZbAYhzjYCUIns7b4Q4ib1MHlg4PeOsFPxiaoUJ73fXsBZOiehQ5Dt6WFPMMn9V2r
         iSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084843; x=1795689643;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oyV11sNyiPF5EtrEj/Hv35REZuzSEoXVxLshK/+9asw=;
        b=ijNV3NSAblt4VxurFl+IK7fKR6/KK6Fjizn6KpU011inbrVMJa5xqfN8e3Bnxq+zWc
         +C7U3MnIKcUMZxNgnvxehkbHHdXZBdFCfPpxOLCwumVPkHiIQXMdJr3vmNlUro5gjtAj
         A9yF6Fay/xGUdNw2B5sgfrCmxN6nWh/aIz6CqVWDK8JdG8OCX8uDZlcskK4vwjC2mz8q
         14TTVSB3y7Uv2ktBwQ6QbJEDtBSPBQjrTY3OFwGZyG0oGmgSja3QTKJXN1kczEKymBc8
         c2pAqIDBU1JdusryALinN2MjpSXzUDaV8lyVNdY7+qpnn2AS2pXWlWZ19zGj5pg2aKzN
         2S7Q==
X-Forwarded-Encrypted: i=1; AL+hErH4i5d5rO0KirYeHgLbs3i/CAtIJMxuFQtQd1ZxA2DDj6sZWiX7aw00ietwIQyn8JRlIepEPFORKhXUHQQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xjXfbNJgbsvvjfziHFdzpciUK4Qk8zE90JSL00SFxmhbqg+PZ
	fcUIMTEGaIXlFpOvavfoV0AezVF+C2A8ejX/MH4PpX4gNMQRdwpCL59tIrOEscBHJ82WWTYIQxk
	QouBTLiEH++jEDA0OoxX+yYpV0EGDV9c=
X-Gm-Gg: AYBFou3LXW+u391QY2yhvfxZL5IGmyoCMMrHXuFa7UqfiANbBTJdQRFGXJDD39p1arV
	E15/UoewBuRuPEKAtEmBJfFu/KtxXDOQe35v/89TjD7PntQICrjZG+PnNFUvdqcUUa2DyRK5JBc
	lfHe7o8jm6cSrwinzN9/aTBxQQUf7r5lVuxWcjAjg2YNLKwewzfqjmsvaRWjmBywTL5qumQrAf6
	nfbsqIRlFsWGuEFp0jhWl93F3PZWXj1J0Gvj74mc71jrV7PzaNMochGpx8UqvRGNfC6tRifCP+M
	YlVp5fnG+wRoDebnQDAzVHEU+bkwn3VEmf42l9+X6MLPzR53bZ9aGwY0vdotCZjn1GDsmi23Y1C
	4Uvf+wLIknqktEpXVQ6QqWESfYzdHBGtKIStZcxRpNIvhASjnrXC56q4q4Xv+Uc41Hjp3cfpUc2
	+0fWQK/RsXjMsGRTeW8t0vzTXpZyVskXV+MfwXvyH1sR0cNyoaqtqPYquN4zBMZWZGXTzvMsTgR
	5pos3Q6HFSX6Ld2dykbbpy8AJqSVSc=
X-Received: by 2002:a67:e7c1:0:b0:7d0:6f1c:b3fc with SMTP id
 ada2fe7eead31-7d6b9ecfa35mr2486007137.0.1795084843574; Thu, 19 Nov 2026
 02:40:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-submit-rawnand-bbt-scan-error-v1-v1-1-0bef8334198c@gmail.com>
 <87fqwyjwvk.fsf@bootlin.com> <CADvTj4rY=fN5=RYbhL_X56O5kbim-NZWRoRMQJAndZAxUZUo+w@mail.gmail.com>
 <87ld6pfc75.fsf@bootlin.com> <CADvTj4ok=HXZiD4t1pgomZAD5_zRpe3uJyRgfBiPON6Rfx-wVA@mail.gmail.com>
 <87tslddsz7.fsf@bootlin.com>
In-Reply-To: <87tslddsz7.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 03:40:32 -0700
X-Gm-Features: Aa3M54qjaCUt9J365p8_dA5m7ajQO-qQNSq3Rt3oQKzZyARlHcvRPZIOw_smURU
Message-ID: <CADvTj4rNmrJK6kgVJVFEdZfA16SnzjZyayDt04AMSaMrmETfOQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: stop BBT creation when the marker scan fails
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Thomas Gleixner <tglx@kernel.org>, 
	"Artem B. Bityuckiy" <dedekind@infradead.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 3:19=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
>
> >> >> I would prefer if you could write your own commit logs, giving us m=
ore
> >> >> confidence on the work that has been asked. You can use an LLM to
> >> >> improve/enhance it obviously.
> >> >
> >> > To be honest I've never been great at writing commit messages in
> >> > general and have gotten a lot more complaints about commit messages
> >> > missing important details prior to using LLM's. I can barely tell th=
e
> >>
> >> For me the code is getting better but the commit logs are unclear. Som=
e
> >> details which don't need (imo) to be written are there, and the big
> >> picture is often missing or not clearly stated before the details.
> >>
> >> Don't get me wrong, using an LLM to refine/reword/reorganize is fine,
> >> but letting the LLM write it entirely is not working well.
> >
> > I guess the issue is that I often don't have the best understanding
> > of what the big picture that needs explanation in the commit messages
> > is some of the time, if I did then I would then just instruct the LLM t=
o
> > make those edits whenever I review patches before sending them.
> >
> > I think I just don't have good intuition when it comes to predicting wh=
at is
> > important to explain in commit messages.
>
> I get it, but for someone submitting this many patches, that lack of
> understanding is precisely the problem: delegating the wording to an LLM
> when you don't know the rationale doesn't remove the cost, it just
> shifts it onto others.

It's a bit tricky since it's not that I don't have any rationale, it's more
that I don't always have the best big picture rationale since that's a
bit more subjective.

The rationale I'm using is generally more related to a TLA+ test
and/or fault injection test that was used to confirm/discover the bug.

I guess the issue is probably that the pathway used to prove the
bug can be somewhat detached from the bigger picture.

I've tweaked my workflows to do more analysis to try and derive
the bigger picture rationale for better commit messages rather
than focusing as much on the most proximal failure pathway to
the bug. Hopefully from there it will be more obvious what the
commit message should focus on.
