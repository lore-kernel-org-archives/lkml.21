Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795171712;
	b=2sqrjnwRd/LnOrqCpfrzuoIh27z7YUSgtx9FRz2CaA6nqdWC1q0lRi74VyLZiy3dx6Tx
	 E3aABeuFUy04McGpLcAWdfYnDxnwAzkqxR7/Og+jKbv3zluU03SryFYOOVE65i+qxWDYZ
	 54Zixdt2ydIpYztIhIR0xuKxEf9Fd0pQbfGzQo4vqTQK7OpReJ/8cUFG3pKhAvK0gqc41
	 cFVLCLLYa5pM/19A/uaG8SmXYMrMlWKzt5w+z3fS9nAJlsdzU/R5iBExSYNU7bE9mk9h4
	 5deUojfPXPvtvdZUELKG5AfS91+G12qbUcggtinxKv9N6d8vF/SgEgI+rp49CQYAbDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=LHRQ0r5bmbaFTzfb7dcnjC6GldWyI7arDZV1wn6q7Lk=;
	b=SoHOkR1AFlsVxjetqCjLUZQKy50BCJrk/p4iHj7/R8UDhJ8Z2OpysHDnqJCaFwyJvtVy
	 sW44dq6QNY7gTj7N9Fp5ZiCfOp5+LvS3LMk6oKaYHRRjvpZ+JRsW43BzxZ6yFMh9PlYVv
	 AvTl+xvDNlr7VAyLttEdS2zhKYDyML9Dciie7tU8auHaXbg8z0nO8LB4sBG0oVRhlLMQw
	 xIOPzLqJt6UoeXn6Ya9/ByjPOlMrX6SmuSgHK9o5+80SMgowW6wfiLqmnMmOmxFNVcX+P
	 k/A7sNgd2YNWazjuh6+tdQgJTtlOdWidy8u+jzz57a0t9pXR35eM08451QyWEYHI+QQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OxcMU5xI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D77B606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D77B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OxcMU5xI
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-94937a33cfbso75594485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:48:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795171711; cv=none;
        d=google.com; s=arc-20260327;
        b=hR5b7zzoZ87j4lBMaGAeJ1HABNxOheOJehaTGaBvAiMwOcRMLGflAQr2qYOuMKB4/j
         iIZmTKlCOL/oT4ZiNNFwf0PwEVAG588TUc3PJNyp2gPG8PHI0SxjMXJaluLdOyN2BFsF
         Ndi/sBDs2nMg9OWIl6xJcBJYmq/3IYchj233orCfKXWuH0N+tsJ/YwFFTC37lj1ACbwC
         RDoQVtOdvrwKJCfIQkJb/RzwLu5u6T7JBBETVlcrOiuQb2MLp255nT+7u1K8ZClTHSxN
         i+MC17ucOYPGnKGPLTDYb1KX8JkDCF0wcjHHs6fA3CH9Oq3m6H5sHwfphckc/aQqQJ3E
         GFjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LHRQ0r5bmbaFTzfb7dcnjC6GldWyI7arDZV1wn6q7Lk=;
        fh=clgPgDIM5B5sIDyZLWpiNh4A4fpfxzYqvlJ3njrC6e4=;
        b=U6pNusoRMimIzAbK8aDbQswzmO1tQ3Wczvc+P3el3keL1DT+Mmt3P+au4ffd09OQ/h
         AOmnhVeqVbL1DHS095KcoPNlfrXiRtdAX+03EdnD8yHMWTvAVP5Z84hul+3PckS3GCzm
         eUTKtVH4lN0Gm9UO15hWGBRTWq8MLDwhgqfkrHlsnFADaKL7zZkd2w1aaCREjB01e+am
         WLuiIJchdhG6QhacT+T1rOpuSBIWshV3isn6ekhNaRwCRaVxRyn5FTep5+9ugxsirGmZ
         QErkm5FpmxL40Nw9snZv+Pfsh5pnD37kcd3PB6/fp2/qz+Zn72CZ35Z/l4auvlkU/QEJ
         oPSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171711; x=1795776511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LHRQ0r5bmbaFTzfb7dcnjC6GldWyI7arDZV1wn6q7Lk=;
        b=OxcMU5xIGdPBCANkh2DDHcT1gzhkDDBlcqFx3Z90TpY1QW6o9JUMRM8Ic7QUS54nCY
         Fa79oFQ/bjUnhp//+sFPpPH2WcHVd/rz6BMQ7ewIENA7kvvXqAvYWhit6e6I6DHK2LeN
         m5v8101A0JdZ1skf/dyjxzzAtaB9UnszyeBp0+JYfGekYMm7pfoxMT/awTTGD0y2AnoN
         6eyfP24sdYlCMlggWlqC9z1kUhYXH3KokwMJjv2/W11XrqQvb8Vj6T7uJtqcKYzxDEPb
         tzEuIGOLRuHHy8H6irQk1ZxZLTTJtqcdWXP53t7zrput3GxczMTI20QoWdnh1YKpVpU1
         vwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171711; x=1795776511;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LHRQ0r5bmbaFTzfb7dcnjC6GldWyI7arDZV1wn6q7Lk=;
        b=y9oBPWqklxInMD88QCT4Pfzqagdu9AxLNPG2QS8c3llhDcAgIbEuw9m6gp3t3e6BJ/
         /+liLFf6pm8EHlLj/EqpStoO731nOydqclrkJ4WrwVupRyGMb0l3OwyOP0rhxR9o+Tp0
         6w/K+ehwCh6Jf5haTuVhxYVwnGziAUI2UCN239/whVVZjVfHYkhsWddSHGhpEFAGvwsX
         Hrb6CJaAZlb9A27l2WR0s2LtbZ0Sl/AsxnjbHzUBs5ngbJfx/SH11ciqfA0lctS2UbeD
         Y0jBCBpevnJxD0gOGHi4GjuLX1PpfwHgcx1YrAqM8XJpJkEmrUPQVFHdYnwVLrkxYWgQ
         HnFw==
X-Gm-Message-State: APuU4Z8ZNGC/zhb4i4lb7/NN0CbHViXIYEb3oV52jiPcr6E66J+wyTQa
	z0SLcTxf81G2TleyDA6nsv5bA7uaO3pT2zUNCv1Ag5sXupCVPYLpAvRyfxqet0rtBY4+0/Z2SRR
	tMskagsx+EDpuFIelOtr3B5ep88SFtag=
X-Gm-Gg: AYBFou0S51+HB8yv+oNWGjm2+DpDHQibqW3+CgOeYI8gxzqO8fINGCf09v0OcWJiBtj
	/fdkGnVT5Nus31wMFgglci9bWi/X8RQuVmFQoT2MWJyj3P8Jul7AhhW3f7pthRv0CFaWGCu7GPj
	CjlzdPLehT5qmhUuYW2GayaMOSWJMBYo2mG1GSsTmwd+/p+GqqQHmT5tcZUkVx7NxGhzi4ChygH
	v74TtYAsaU5hKrxFw2TrnxhrNwst/eUUd+js8W/KPJFe+eBhjWJ4V8GVRkYPJLs59ovB7VOnZgA
	nk6sB18lT+QejpG5sSAIgt7LKam3Dh3m2WgbCz7FvXnNOUzxYjjJ89VHWMnkK51T3C0yr8JQOdv
	cRHq4lCBuifEJDk3yxIqc+PLvRKAQY2qfp3vVt6gLx82m5OTLP3Y/fdMKeqO7dj1aWD7jRg==
X-Received: by 2002:a05:620a:c42:b0:949:6614:667f with SMTP id
 af79cd13be357-949ba9b3dddmr392835585a.20.1795171710862; Fri, 20 Nov 2026
 02:48:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027100231.31184-1-jiangshanlai@gmail.com> <auO09UUOqkhXXuoI@arm.com>
In-Reply-To: <auO09UUOqkhXXuoI@arm.com>
From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Fri, 20 Nov 2026 18:48:19 +0800
X-Gm-Features: Aa3M54ogZcxmwU__d9rnXzxqYES-3ez8E7NLPA3T5222y6QcxVN7zVWPaQJXIzE
Message-ID: <CAJhGHyD-XmGQ0emzB67ipYJA_+Zf8KqO_KCYUT9qbtQFBJpGCg@mail.gmail.com>
Subject: Re: [PATCH] arm64: mm: Stop using the previous ASID for init_mm
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshan.ljs@antgroup.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Thomas Huth <thuth@redhat.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Catalin,

On Fri, Oct 30, 2026 at 5:04=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:

> >
> > Fixes: 7655abb95386 ("arm64: mm: Move ASID from TTBR0 to TTBR1")
> > Signed-off-by: Lai Jiangshan <jiangshan.ljs@antgroup.com>
>
> Thanks for the report. I think the problem identified is real. My TLA+
> model (apart from having a bug in how it modelled speculative TLB
> loads), did not exercise this init_mm case. I updated it and it now
> shows the problem.
>
> We'll check your fix in the next few days.


Just following up on this patch. Have you had a chance to review the
proposed fix?

Please let me know if any changes or additional testing are needed.

Thanks,
Lai


>
> --
> Catalin
