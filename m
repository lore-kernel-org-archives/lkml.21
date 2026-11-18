Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795031808;
	b=MT++XqAZRonTe7WOztQtat5mqLMVG8Y/cWaboIVLKyJwh5Dsk16Bu9O4jZvSd3H5jCQd
	 Y2O2Ef48VLquMID6+t7D2LjUobXsip5w8dasQwtYsvP0EDu7g7/L2SuV6Y9ho/JCyj0Yd
	 opSgDYcowK0FDMxO1uHyHaEotbl9GT+zStdbkwT6YMGRv59FcaFusbjh+LZGHeMbbv5oC
	 hPiL5S/8CdhD4DIl6ZL60tHOuErjkXIcmOp0BPQP6Y+1bEhuYWQF9ugeFboOdPJS6M/rz
	 MeGyvziB2QlGYk1w6Z95eWge+50JulTTlpC8OuAHQCygOGLLNpTXVQ/FxBf/8AZjzzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NtPU/MbG9+73eNJHJ559zS+z0t6I21eZG5LokkgEKJU=;
	b=tUnqOGk2KGfokKA7xx44SbNf+kkl7qXvlBLupeYpC7ie+C76dShf0p0oBMGWWCk0Jqaf
	 Z82UUAvqW6ewd/NjAd0C3Q1QWhkW2AXb9lYYr9K/2yxh6OlXSVZ5k1a7OKMwNvhH1//54
	 vSBo2U32aBTITzWEZmJV8BW6/GlmklC8gPqRnLKL24sdgkwKQe1MwiyKC/APFHtfepEA2
	 wpRVj5leTG2dg7HBqDFFSAwLr3QzN8AsmOKN9bbonpjeT03BYC24e1ovxSc9UKUY8Dhq7
	 Uk8Tij5i8Ku3BIuZZvdTXaVWt4HlcGiBkTIlX6GvKrddKmtUbW44Mss3tsABvaAq54g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E6U6cniW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F24606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86F24606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E6U6cniW
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso548293137.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:56:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795031802; cv=none;
        d=google.com; s=arc-20260327;
        b=ONCyucRcCs/jNOFpTWDHXW8om/ufCm1ZFMR0pviWchrZrKSvEd4lVaibt7QDK6ilvi
         uIMc1/B2umpdlVLmx//hmg0pHCEFDcycLTnXl4oTvIwJyZeLmzvrQEaNjPj13CzlJDhN
         USBCPvYQtjlg3q7Zhvx871bw04hs/y5AbeOk+3eHdMFya7vwE/e4BPAOKuznqF8VQ2zl
         p5iAkqKYTNNLUiJvTECUzKWg94G6asnRSAMPJRZjH89r8LACtQ8nbJNF8gekQf1SsMxE
         wJhvVLDblbCzvOfsXVNmehlzJkT4+DlH1cRcaPBfkTNMZmyMyLhf9fI5+zwnnejIJht/
         YsrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NtPU/MbG9+73eNJHJ559zS+z0t6I21eZG5LokkgEKJU=;
        fh=DbnZzQg4hEkn0w0W76NTPhd9CDEctJ62TRBGjc/Tz2o=;
        b=mFXvLLt7Pk81rVbchBP7TvhaCfHBKPtMiOxJD3cc5NSA/IwKdsd4iJ7qbbAJRIOJ8D
         nlIjbXjC02OePqEDNvGeRSsqVoM8XFGk9LLJ8eyNMbQsABleqJwYyXqS1jJMJtXvQmO6
         2DqHTLFk7rG2T/lYqwn1wGmNgpnQ3NMi7Yk5KmQK0mdPtKwTVq0pahB+uCHVisYOI0BY
         JuXbkthfQ4/oGhM2W5fz9/4YboIZ4vqg69lbvPj/XxxnAIZ0ttP3kNNP6hhTAbWIKqnV
         Lvx85TQ/CasmYhqxr7lKCMRDkZu6Bbs7xrifngdtXzAdTuJjCSqj8snu88nWhuDa3ovK
         kBAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795031802; x=1795636602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NtPU/MbG9+73eNJHJ559zS+z0t6I21eZG5LokkgEKJU=;
        b=E6U6cniWdBv4u1frro78r28mZd2rSyVRwkQPtS08J3LsTYiaQf6/HGQ2OqePF4ROX+
         VjO2dIUSWczxhjl69nSad5l57PBA01G9CLPvyOeD6KIz6MkNtxc87701b6K62XtIGDez
         agdlsIAXb6DvI6OF7cix26pIx+iO9RK2Y53/QkFbLZKRzgbW6xyPICFFUqGPO4gUg/oz
         CQsLzxf4dmp70WA4qEMf/DY6N98YzPSAUvlZrowPUGCWUoaGpxTjzCa7VL5Z49Us4Wl1
         RyLiQxoxxAu7z9unjUJMFpm8st7cL01X37rY8J1FzBAHvK8oano0BPpbpv4dsVCPM4Mt
         7k5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795031802; x=1795636602;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NtPU/MbG9+73eNJHJ559zS+z0t6I21eZG5LokkgEKJU=;
        b=KDXkPppxZuk9Cwkdeem+93/sOakzACsyfyw6E29ezChsZ1FVnu2SL3fjaloD3ilos1
         cQPF6SROoqLINYHudrmotkdTPHG1An2t0JFoNad3ObXCVM/lQTzoXFJ9T4shiQXcX5XH
         NXz/mGd1D3ePHTc7Mqpycw+LL/5J+DGdhZj7kyvNiSv2Lsm51V8OLryse5fj0R0LD/QJ
         x3mlxo5cS7174ISH+CuhWu1e89hwKB8Oav3sux9Zaj5Sc7oHjAWvAlWWpLd433iHa/St
         v4Ny0ZysFawDTUTGGS6V0eWfV3wpb/tD96AQU64LLDr5ANvwdoUSHG+3Illt9SPlBLqC
         syvw==
X-Forwarded-Encrypted: i=1; AL+hErEFefiuuiJM0NyVE8GT1cTOlKXtjEg3wTGJRA9lhkI5F6ta+pAY9nS07sFUwIHZggHkT+D1GAhnXjcRLqs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+vmBEyskuy/qDHONYr0qyTYPiRhdREdmKPkqhbyvxCswuIru/
	dihshweuYvW9HyABdDLfKYCUSnkhqOHCFiWzh/ZRe1GpSqANMbotVYj3MGO7XYPNRMuWIijQz5w
	arPgOVjnhYTshZiDSpRkUtIPmXYPSfkI=
X-Gm-Gg: AYBFou12wq+9faoA4A7BugPY/kSp7xNJgP66KoNcwWrq1VDXNYXA8ILDA6w5vvWuSGS
	mEUsmJQHKyDHx0oMdXC4FHBa2xt/5HpkYRZT1rqsxFbyixcM/Pf9HfRkC7jJzgAAJBwzK1yP50Z
	+e9o3mstasX50OX87mvpWscKXxcXBs3BkqSrjkeE0QqfGSNu4WogQFsoPS0GMU21Lq/JWHLC5+q
	TYlHE8Icj+tYI6xkaT5uZ8J3fjtLsdrvROHG9B5cVoBfyoob0SR+JLBbOtsLK6DBuD7gg/XAZMw
	8YUhWoG6BaArCu8lD0Wzp5nCiWQIIGzFw6m7AFE9g2o+8g5Ub/RNC6AiQYG+nLNMgRQDs66Id+i
	3KpxVTRcQkBX6o2BDeud62R5iuT4TAdvPZDLxfNkatwwy1IXiHubBSEwLNnc0Hu0WPMgxRHwPVO
	1isGdTJZXRM3JdNbWSU12tGfUZwKDvKXNmhXiW54QkJKqdEbiDdzmmV3DWwDD3o9+4Hy0KSJhhs
	rEyHnrNfKvcStW/Rg+PRMB9mjsRCg==
X-Received: by 2002:a05:6102:4485:b0:7d2:cc5a:f0bd with SMTP id
 ada2fe7eead31-7d6ba40e444mr1449924137.19.1795031802357; Wed, 18 Nov 2026
 11:56:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-submit-rawnand-bbt-read-error-v1-v1-1-2ff0abffaf2e@gmail.com>
 <87a4n6jw82.fsf@bootlin.com>
In-Reply-To: <87a4n6jw82.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 18 Nov 2026 12:56:31 -0700
X-Gm-Features: Aa3M54qIZa9sLBcPCUXfBjRmC6549XEA-mD-S_AxKtnIB-qiolOZnXMCHKAHF44
Message-ID: <CADvTj4ovcTPn9NyJcZf+L5nWconfeVLNSbRHy49epVLyeqdmGA@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: propagate BBT read transport errors
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 3:00=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> On 03/11/2026 at 23:03:39 -07, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > check_create() handles uncorrectable ECC errors by invalidating the
> > affected BBT copy and handles corrected errors by scheduling a rewrite.
> > Other read_abs_bbt() failures are ignored, allowing initialization to
> > succeed with missing entries in the RAM table or to rewrite a table tha=
t
> > was not completely read.
> >
> > Return non-ECC read errors from both the selected table and the second
> > unversioned copy before updating versions or writing tables. A transpor=
t
> > failure does not establish that the selected table is corrupt or that a=
n
> > older mirror contains all of its bad-block information. Preserve the
> > existing ECC-specific recovery paths.
>
> Be honest, you did not read that back. I don't think one would guess the
> big picture by reading this. Here is a proposal:

I'm not seeing anything particularly difficult to understand in the
original explanation myself, although maybe I'm too accustomed to
reading this style of explanation.

A lot of these bugs were discovered using TLA+ tests based on LLM
translations of the driver logic into formal specifications, along with
fault injection tests, rather than through real-world hardware testing.

Because of this flow, the commit messages tend to follow a similar
pattern of first describing the code/logic relevant to the test
failure. I guess when the test case itself makes it clear to me why
something is a bug, I tend to make the commit message more or
less explain the failing test case rather than the bigger picture
implications.

I'll try and further analyze the bug implications beyond the immediate
test failures for future commits. Figuring out the right cut off point is
somewhat tricky however.

>
> ```
> ECC failures have dedicated recovery paths: -EBADMSG invalidates the
> affected copy and -EUCLEAN schedules a scrub. Any other read error
> (typically an I/O error) would be unhandled and leave the RAM table
> incomplete.
>
> Make sure those errors are propagated.
> ```
>
> Thanks,
> Miqu=C3=A8l
