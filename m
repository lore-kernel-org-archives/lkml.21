Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795805242;
	b=3S03+vCKGzfXsfks+57hmU5u90ayLpmlsj1VFrwVnwiEysAdSvs4zf5kN6xVS4FHm4Kp
	 ZkrZxVcRbCaUv0We0tf3iw2kjXmpnGNzeRNTmhgR5s3g5qTlolWVRrB2mTjNWwnJyUCU8
	 Rtk1v9xn29grmafFhCWHvq205urcj0YaOJd2I3hwfGN0DqCX6E9WCks4YBTJhbXDtc0pC
	 dwfPi1b/9/1Xz/g6G2wro3UEBUIBjE3uFXywmvmrAp2hWoLRnwVYSfyBBPe4QPEXq0CMm
	 cKuL8lJWAYx/Drd1YBlXek+2ln36iwa01d7y+KDBNI7p8cWB5KNhvu7PGXBlFnApS2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1RumGYNdKuYpuJjrf2vnXsyRvJ8ZqCg2nrdCsD4Uzig=;
	b=VdAyoun4CPz7JMC8HhxqshSQJ1JItH6hPNUuiZX9qTjIR/+8McM7uELDs6SYVlRuQBmd
	 +8HQiG+NuURhOFyhyUK9pV67Dne+IsxbjrYxLs+nuhrMG+QCFhsWXf/E+PT0m2wKWofcs
	 azxQ/WqReTPotJtLeaOyvQswgJsPgjPpnOwc9rZLPlg8lLfQ4YuF1JBtjEkbrkH6Fw8VO
	 5ahrNL5BbJxUxrJtcSiBhHdqNy5r5IqTtjYjfaPNN4TCtSd6/8ukS5gMgIAU88hsABwiH
	 lsR6aKOgQZPMkpzT9+NJ6yg75UWxXqMK2NjYHLMK5cJBmeQTAoEqABDoViYQR8P08Lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JhYQWZ3q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82179606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82179606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JhYQWZ3q
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-9212a5a66f8so68017766d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:47:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795805241; cv=none;
        d=google.com; s=arc-20260327;
        b=DGsd/IL0uKABE8mNBY9OE7EB1PdS5O6neCq5G8lDDvQ3LrKaDM6v6C3YtYHPO1Mojd
         aMNK/dzqeq86rhXQ2bDpzaT5HwkUUFLVjng7G9LHNQL9IcfbsrPIJhpL5tSYFAY6FGpl
         inGO/oJhvDHCgap1cFJzNYf1RvgY83xHh1E2Cihp3TFMniyvg2kBW6v+Nn6r5MIVUGUW
         vy9cdboJmOU3BSEqV6mRUa3YA5vxZztiIgxpwZsSqLWH2Ja6n4tEgj127kQog15KaRgM
         YOJ2dgAiUG+VBWP7MhK/GrkqZSCTUD3CgBveEbR1qkAZ2hEVKQ5/WXoJvYJFd8Gu8cyr
         Y6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1RumGYNdKuYpuJjrf2vnXsyRvJ8ZqCg2nrdCsD4Uzig=;
        fh=1Ql7TKF87AbXs6y8O6SsW7gkHpUN3SPAn/0zDFLLf2E=;
        b=VXWLdT6z4l6/kWS2jyv5e+50hLG30AfNwqShWFZCF0NOx9z+74Ek+CYgnzGEpivKEu
         fq9n/UUMG2Soa1NsFuOMlyn+uLV8syEb6mGt5u+zXowdLzGiv+NgdxkAs4VvkDFmNOxG
         fX1BuIGmAb0oBiH1ZYbwXFVWjqyNjDTYgtpU1BQQ7MEvwU+STDRNMKto0SmK5tauRzRK
         mO1ImJCKZNxBiwhfdEwXfFL4kVUW85WbxzR7XZNY53QNrNs2h+4Syqhi0gpUyat/2pkw
         FnBnoWlxw6pGQzphtt4bJq8tjO5gmkZ/1Rf0d+0hZdqejpTR6W0jPLl9jtr8lmOO22bP
         DAkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795805241; x=1796410041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1RumGYNdKuYpuJjrf2vnXsyRvJ8ZqCg2nrdCsD4Uzig=;
        b=JhYQWZ3qfHz/JrDdY82CcI1EEk3+UJs4oFxgLx4pjlewbMRNhpkAZv9ZktCnWrTvXl
         /7LiWrbz+ROZkqAIaMvgwlvOZTCfrvLFfQ/FiIj7u+V5yMQaaZBCx8DdZh0TX1aVPcfL
         m1olOT8PXThpVaTAb3XgJ/2bW2DnHoflvRGn5olOI7I/Nnc2olY1TkAWBV8Y1qZj4isA
         U/jmX08oZ72UhBf3mjVZTq3C6lbSUKqozV29fVxC+sMz648LrZeaUjlbPBpT4rgXF3hl
         trELRtgs4boNjYzU4oSGi3PaQbb2PDsIbc7VNRkT8XBl2PML2uinEHpFnwuYblQXAo6p
         wPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795805241; x=1796410041;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1RumGYNdKuYpuJjrf2vnXsyRvJ8ZqCg2nrdCsD4Uzig=;
        b=q7BHuP7j8u4dxOKt7PHPQNnndcK1EpgV7zjwLsIrZsaKW5DFlOQosPz0Qib3UckWRx
         +rfJZ6eip50lIvsfsH62Hsux+NptT7UQCHWYAUEpKxUnIj7sBMyk/i1MzUoxgbvGlvbi
         hH2V3BpS6KSf7D8evMKy1aiViUfOecT//L7+3PWRzuH2e8Lh1pEC+ihUVdFKEChCmWC8
         VS9qnP43fvFbH7k6sJqpP20844zsJ1p3D9jWSqhsu+cD4tKtOib3eYwjqQwbu8Fkyys6
         QdtpF0Xq6iI24a0YU37lJi+5uFByXufjQ426K/pgryDRFloF6Z0JpKhPNqCXj2/KZ3KK
         Kssw==
X-Forwarded-Encrypted: i=1; AL+hErHRgTZolAfDHtIVVNh64qhmP/xIj9If6ulS2MOmpFsG70dEkMJDmZTosxQWjKSyyDliruJWzBTBGL2Q3Lo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q9/nKHaHDBQJ8KQ3aIRns6qLKZD7Bu8fkM8cL6rOYaIx8gCxK
	vWzHGmEEFVrxgA8n2UwIMV2EqyEA9horJ6X4T33MWxLbmCejzZ4GbEEtqS6kk8n2Kj/ZkRmbUpQ
	O4SaZ2KnZ80gRmgDMqRGBERBko2Goy3w=
X-Gm-Gg: AZFdTZf5gTxoUf0HwNJyTn1G1umhA8DjnLbvULoHS9gaUs0QBbSMc4+QXc4lqTTO3s3
	UQpqnSmjeI7/H6TEFHG9hGe/hiAMhR2awW/SV2MNxwMVDjPQLXUn17G1ToS7mpm5pVdsgHmmOyt
	6wscgTWBAsfF3NhW5NSrCHc81i3XOK7FY5uP+aks5Ad1AMUUbSMOzCjXXfdbm3bPOtFKU2S1q45
	pGmmG2eg8d7WufZFXied1XI+13zu+1/S64dbaEm2et/lzAYpnxVGPqGChlBbiPOm4StCostE9mD
	pVucdPwQaUeT5mA7gf/aqLYth+uUYxtoYjADv+uXSd/EmJPWWZCqwwsqGlowS6jZBFEFTWoH28g
	S9QYfdZBOSJcumppe+0ho7MLmSI69WFT+VcUG9xLtfv6vt4BkiaGwe6Ez9w==
X-Received: by 2002:ad4:4eaf:0:b0:921:1e23:3e9c with SMTP id
 6a1803df08f44-92134a3730emr461759176d6.18.1795805241448; Fri, 27 Nov 2026
 10:47:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126214756.39027-1-artem122novak@gmail.com>
 <awk74XffmMjYTJ2j@ryzen> <CAPufuhYk8dZP6JOgmhqDOa1JXpY5w-GCLnPkeLe_+brxNb9utA@mail.gmail.com>
In-Reply-To: <CAPufuhYk8dZP6JOgmhqDOa1JXpY5w-GCLnPkeLe_+brxNb9utA@mail.gmail.com>
From: Artem Novak <artem122novak@gmail.com>
Date: Fri, 27 Nov 2026 12:47:10 -0600
X-Gm-Features: Aa3M54ocrif2-nlp6L1ZbWdVZtjDYZrhku2GvGRi8hy0fGvYgjXP6jDE0B5fT0A
Message-ID: <CAPufuhaHHhBWZcB=9hGag7n6oGFKe2MC0_9JjGH4hin+WW_idw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ata: add missing newlines to error messages
To: Niklas Cassel <cassel@kernel.org>
Cc: dlemoal@kernel.org, linus.walleij@linaro.org, viresh.kumar@linaro.org, 
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Actually, v5 I meant...

On Fri, Nov 27, 2026 at 12:18=E2=80=AFPM Artem Novak <artem122novak@gmail.c=
om> wrote:
>
> Hey Niklas,
>
> On Fri, Nov 27, 2026 at 2:14=E2=80=AFAM Niklas Cassel <cassel@kernel.org>=
 wrote:
> >
> > This series does not apply.
> >
> > Please base it on:
> > https://git.kernel.org/pub/scm/linux/kernel/git/libata/linux.git/log/?h=
=3Dfor-next
> >
> > or linux-next.
> >
>
> I've rebased the series onto libata for-next for v4.
> Thanks.
>
> Artem
>
> >
> > Hello Artem,
> >
> > On Thu, Nov 26, 2026 at 03:47:52PM -0600, Artem Novak wrote:
> > > This series adds missing trailing newlines to error and warning messa=
ges
> > > in four ATA drivers.
> > >
> > > The changes are formatting-only and do not alter driver behaviour.
> > >
> > > Changes in v3:
> > > - Carry Damien's Reviewed-by tag on all four patches; it was
> > >   inadvertently included only on the sata_dwc_460ex patch in v2.
> > >
> > > Changes in v2:
> > > - Fix an additional missing newline in sata_dwc_error_intr(), as poin=
ted
> > >   out by Damien Le Moal.
> > > - Add Damien's Reviewed-by tag to the sata_dwc_460ex patch.
> > >
> > > Artem Novak (4):
> > >   ata: pata_arasan_cf: add missing newline to warning
> > >   ata: pata_pxa: add missing newline to DMA warning
> > >   ata: sata_dwc_460ex: add missing newlines to error messages
> > >   ata: sata_gemini: add missing newlines to error messages
> > >
> > >  drivers/ata/pata_arasan_cf.c |  2 +-
> > >  drivers/ata/pata_pxa.c       |  2 +-
> > >  drivers/ata/sata_dwc_460ex.c | 10 +++++-----
> > >  drivers/ata/sata_gemini.c    |  4 ++--
> > >  4 files changed, 9 insertions(+), 9 deletions(-)
>
> >
> > Kind regards,
> > Niklas

Artem
