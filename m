Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.203
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794967046;
	b=J8plKgb9I9B+bBWx1Qfv410GcrMw+kDgRrcfDMRetf5O316rZW2BAC+q3P2XpSSv1+6J
	 3FmYygQi2zX+u8q/+y8nOHe+h8ZUQ/+dniftD1lguejBA1vnTFDTVLgTMYnh+6JaHx8M0
	 agUpTVNgwupG5msj+/5ofGKbXCpKrFtveiUL1E61Nl/lZ+PEcfZQKmK2RjXUDmNSgOFYg
	 BR0MZEZe440CCgH877s0rfC5XdKjESC0etVNZ/YE3DKXyFayFEQTOZ0jnqoNU8enjQpEs
	 wPDgiX3twtj6yATpg31jCCiU8tFinhGhiFnfAPA92ciTdSB+lLgi11dNlhxOuLXDrQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fPM4Z2/d+OWE/oPOGuzhHg0apTJ3Jgl1KSfNq20bq4U=;
	b=GTIa7YPSmZGu5oV5YCs98U+Rqft87wiuZfcGKvdc4MBA7cICUnqVX+nsG7q0kthqNIc9
	 0VNrX1ObV+BoMWcLPn+Evwsao6axdYBePy6NAgO9DMmeyfvpm7gOOzoRTh81raKDLVORL
	 kzv1r6tEV0Ov3jdyBBsf+mCXSabSdSu0M26HUySBvm3F4c1hRqKWpkO1162kUAQL4vAkM
	 0A4ewfQpu7T7/uRsCNjHAem42RHFUB/dkI+xSQMG+Bjo0dAU7YBKAV1gPeYw2obTmKn2S
	 wCthkdlWiiwlBq4Hb9AAo7kEQcA/+/ockNEGHfiHKbesfoLmYRAKXixGYyPAdgy9BRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjvjLRJD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.203
Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E739606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E739606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjvjLRJD
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-56820670d00so100611b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:57:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794967045; cv=none;
        d=google.com; s=arc-20260327;
        b=YpORjq5hRuj7GesdsLJK/jhRRr4vnXeirpV8g36KJOqgi8zEYNmr5FJn4nqmBmulYT
         TRKk4Ts7KrFboSsRiIDtlkaaG4gymPGUXTTT8y1IDizHMhp49psbOkJypWZFZDKAg7jo
         Q2xArvU3ihq5GjdoB5uPf2lCFOQQq3fA5PR//5DPWCbXUYOdl/LW67LKuo0CJ/R4dfH6
         ZSiX/30XNBa4OMIIqf1fJdGzVJdL6XlZn+agJFhHzu/RwBKX7dE/N4AhwF5SNfQvtKBJ
         qtd+2iQl2V+ibu3+r9XjWkPFHs+e5fIeILZWWweb2gTo48yGBAW9ygH1tF2SspiTVo9Z
         KDQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fPM4Z2/d+OWE/oPOGuzhHg0apTJ3Jgl1KSfNq20bq4U=;
        fh=c0mzjP8yu8UODnhWPR2QTx0gYMWop1XbenWFPRaAdb0=;
        b=Bs8yB68mkLY9jcgM2zxY8R5LJ3Y2PJ6abcOxQb2OEdYJ8fFfInle4gVUKQaV4NY3Kx
         kpVGOk7k5O8o+KC4vushbb8vWNyU96fOxSXpzh2mAIIlPovmr1rxbX9cdKt+Vb/A0abC
         iZDPf7/TjUG52w3g+OSzbT2WJWaWUCmB14+khFrxz3Q1DBTq0kF+etqDrEIIzhYmJ66G
         DyA4ehnzazaZ3KhIa9dAeo6tjtzL7Sbd4SiLoQYXM+wowLnpzjAFK8LbKO8QAUVGCCiu
         wpSer+89+ooI6xKlC3aQJuNlKNIZc+oYYD9A9pR5y5A2Ev9gg1TjUPiaiXAa3JjGTHv7
         xD9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794967045; x=1795571845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fPM4Z2/d+OWE/oPOGuzhHg0apTJ3Jgl1KSfNq20bq4U=;
        b=wjvjLRJDMo+za2NlWDbIczbW1gnm3Ppy84MnMb/ANoVKxLp4zwk1WMvzloaufYQudi
         /FYYh3TS1XtQAAw54xv7/p0DTlRrRA+0tikSecYdO0UfO0cBsDp3c5bp7FQNQ4ZbZqLe
         75CxpLjwbeRRDm6NdrkW7HWOl6V8/hcNsovcduPAsc4O85I1c6hWpobO3k6Wl5TE7x5f
         Gp6XWPyo0SeRblRRp4VgjBIf5gyh9OwhSftV3bKjrLi2Fr/xxx7dl3HHi/ec4nJaQh9t
         xUza+CQ8NnQCP0sNZcBrMIV8Xk1DPSGlG7NAyl8vhDczM7RFm1rZK9ns+NRp6ggQM1WK
         A5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794967045; x=1795571845;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPM4Z2/d+OWE/oPOGuzhHg0apTJ3Jgl1KSfNq20bq4U=;
        b=Qfk4HgFEyV/KukqGmPcwRMI/uX/22a+cGA80YpMrQelijn/vCTOVis+SKEiutsqN4H
         ArqymSJOdMIeuzM1i1jD0qHVK3vHqGTowdBhWh5/4LSQTnmugwxWwvlrWRdJ3ox83irq
         iKOHZpRpFcoH8S1vJs9mmrUb8NJV9EJc8sTLKlrWGJhtRv1+oUCyUUbowhguYC9bPrw1
         rnJYHm27oj5wGkoLf4H6DtRQ5fgohWYkUVJ+cip0E+SMRZBebyuJ2MbqtZGTj/qPzV7E
         oIoq5ZuKw6iXQUYO716uHRzOT1zOXxofphkz873FQBf3BXc4L53YTUmDv0fSjZNLe1Lp
         pb7w==
X-Forwarded-Encrypted: i=1; AL+hErHXjFTnIL+XsPj70Bg8B0x8NEhJ/7NXj6n4QHwwV8+LD6pSO+62Xt2KMPRbhYswL3TilBRmJ2Jm3sUWkGM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/C7nuW02a3VQBvilg1o9gt0tSGjYWrHgkx1EGKzNdcSA8oFzbI
	BJ9oIOoV32AUsqaXLHrYJIaxN2Df3Tg/S2jxWUrPHYqQGAKJps4rwT/ZqwEsGSzbQIvuvBb+tuP
	94GG0I5M96vbuUx/NZmpuvZZzbeHsw2Q=
X-Gm-Gg: AYBFou3Xnt7Rxe1BZAy2bvQEXCDcOKpBuoz6vSQ2bKaxMe++FbSfqOofzUNgWacMI+u
	vEb+GaMzCEu0yzSA2kDYU/+h4bwVdKtRbc7I17l0XhJGnieEZzEiZmy/+FfUclwAUIESFrjySfG
	y/qOo73k3BcVVS5+uCYRFsi+796Exy0O2igHvOwch13nQ36ySavXZwhEUL2W9L9hLcMkEzg6ehF
	DP/bzI4Su084xQMnp7RLPV8vRe8y8XfCyKfPJTu1wfaQuF/YRqhOO+/s3kxBhmnt7dlxRN5wRpf
	MtkNwWWbMnP6orPEGWKNsIdri6U3FltcVgbBe61m40fnkZeKhBUXR2a71DkmQzCKkwEUtDpyaUy
	WrBWx7wYXB23ZA/elBalJoIsHjtuEktSkDKp7kF0qrnU6WRAgsDgJ97n4B3ih8M92vLn5VaUheJ
	3o09Fmjg/gMWa1bIdXa2o+aFCr7aDXhrp+BiOvxGwqbDIJQmG7GJzm
X-Received: by 2002:a05:6808:23ca:b0:573:2541:1804 with SMTP id
 5614622812f47-5774045c9fbmr1927983b6e.19.1794967044731; Tue, 17 Nov 2026
 17:57:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAJ6F8CFSfgdZqaKMndGZtbaww32Xr_KVL3gA_2Jemgv9i9vskg@mail.gmail.com>
 <CAJ6F8CFgkgksyk6YM3NdMkQNhSFWV4depC4c-mHvpDHpnjhM-Q@mail.gmail.com>
 <6ab4a114-57b2-40c7-99d4-55a4ac4c9a9c@leemhuis.info> <CAJ6F8CHzm4=ryY+j3ao6doR=-67Lq=3-w-kbhk1wdvtYDhyNeA@mail.gmail.com>
 <CAGEkeHdxaC2BBg5wWOCL0pj0r4Ks6mD_a3KpE7h+en9Aupb4zA@mail.gmail.com> <CAJ6F8CF5FF6-+Z6tOA7Gz=m_Cvxz-n7G=bqVY5H+fBCV3kbo_Q@mail.gmail.com>
In-Reply-To: <CAJ6F8CF5FF6-+Z6tOA7Gz=m_Cvxz-n7G=bqVY5H+fBCV3kbo_Q@mail.gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 17 Nov 2026 17:57:12 -0800
X-Gm-Features: AclHuK80GibvNnDmnk1ufJQUnUWv6v5F6uZQtv2GfalFtbrM8RVlito02JIyaSw
Message-ID: <CAGEkeHfywOHr225v1tm7zjf6ui2a2NttrPBwUhts9-DHLYszcQ@mail.gmail.com>
Subject: Re: [REGRESSION] ntfs3: existing files/dirs with ':' in their name
 became inaccessible in 7.3 (ads on by default)
To: =?UTF-8?Q?Cl=C3=A9ment_Smagghe?= <cle.smagghe@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, almaz.alexandrovich@paragon-software.com, 
	ntfs3@lists.linux.dev, regressions@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 2:27 PM Cl=C3=A9ment Smagghe <cle.smagghe@gmail.com=
> wrote:
>
> Tested-by: Cl=C3=A9ment Smagghe <cle.smagghe@gmail.com>

Thanks for testing!

Hungyu
