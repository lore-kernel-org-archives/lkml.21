Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491287;
	b=qjqR8kT1bVdj9rO4OTyiPW7j5w318Xo2OB02b7NqTX/68FF0omtq9wJT2RRqJTAIQLMM
	 ZAmkaDDnnRqOLU/9aZJgp9sJosCGFWXVhZE7bsTH12RQeU7M8B97OjCo7FR0CPpV1D0px
	 p18VtgigLomOcqPP69VJnYFBKTuUiRFDVnbaZzeqON7fOqOBXMX3EggcnLezoBNYg43Gi
	 vh6nj2XR4CyUSvSJ/0999tesEG1Tc5lhmY+c45jxOUl/bQyQA7cdGCaaOneOTcemQ9xoj
	 O5rPcC6k5NWlUt+tzfnQwNPs20DyWD3iAxez7ZqFSNiAxNnpwHOHXXcd2crNPQ77G4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491287;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:
	 Content-Transfer-Encoding;
	bh=fP/Mx0dblCgP/wj46a6gbOk4x/NoLAFd9CC5avrjjVQ=;
	b=iX1+uB9NBtdMItpV7yVtXnd7Ax06vf2R6ueZm33NPKOlCPAvPr5QABlhpOz7I9/8ztve
	 7NXIunSDq/zCdyvHb4vm1TpjVh86/U8Y7vbpg8Wa5750d4LptaKZDKdZMewwuSmuv/vIs
	 yoCUiHjheGcVihH0e5C5a4A4hMcDfsiR/5ufzncs1hH3wz0pOLRYCMa5l6FMgXrq3bNvo
	 /xKZlP+UMMhUBJ81Ef+0St6pBweUmaN1F4AozDs/5rzMufHYYjSQV//fVyq1yScIIAa9x
	 y6cTYC4UwRBfKwZiLlfNj3Fe0rb3jfc44Z+kdQ5rehEBn6RoBg3aHN7+unVGelIvALg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=fail reason="signature verification failed" header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=M9mh+Q2A;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87105606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87105606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=M9mh+Q2A
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9C75440E02A9;
	Tue, 24 Nov 2026 03:34:44 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id A4l_v50l5NWR; Tue, 24 Nov 2026 03:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1795491281; bh=pex+PtdKRPR6kX8vZdjN0kqg4npN7Z9SCcKmf9LNyUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M9mh+Q2ALG81kmzBfLwG812TQk3UXZeoMK0ItqsvsenxHFh/eXyPX5Ifrk91rsyNI
	 mXCGEMlUBOCnOeRAKAd6uMfDrBSGOEORjZLyPWZsmku3sRSwj2ZiIHWtfi9CfDMix1
	 H3iYOqrBi8ZyVXZ3+Zeq1qHrmZTTJkGrvneOsUmBdvGXcRrsLBI4Qc8RHjvL6lxYU8
	 Z2do9GtlwoLBiThYa9Npa3TNVOPWBQRIvQmS56TqSV0DCyXQWQeuKsL+8KmFWwDI1C
	 pWoWb9K6CIwqU8BxxJ5wR6vFDsRaslXZO7a0yebKtzOzLtKXsAYgFVte9Rlv2B4Qw3
	 2vNqVu/3bhqHH6vdE933N02ZyDH9T+COXiuiXLF/5DNDDAMkVfuax/8E5y2+yqa6JP
	 4ZGwWrQQHvw8eBDM1lGDmsng+hqdhL+ZsysSljyId3MC5EI1qtGJt9OGHHtKizha7G
	 tZubS5B2Y1CX08OE/SRevap5bCvJr0RWDFlU11fzKqWXAq5eTq8Gjeym1ilNU9bcVf
	 yfX1fZi33cZCyMMZRAyVNyqfCeVY+MJBJsy5bFTbwRQ2wNs2ceZCupRzSWGymC7rv+
	 FuzRA8VRr5jCS8tA8ciUD4rbkJMN2s09/0I845oSNfEt8F3zfAmFzX3YhbFNC1L/L/
	 BAHYI133PdVflwiLimlm0Cr8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7B59340E0240;
	Tue, 24 Nov 2026 03:34:33 +0000 (UTC)
Date: Mon, 23 Nov 2026 19:34:29 -0800
From: Borislav Petkov <bp@alien8.de>
To: =?utf-8?B?572X5ZaE562W?= <luoshance@hygon.cn>
Cc: x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/CPU: Fix FPDSS on Hygon
Message-ID: <20261124033429.GEawUFxR0cthvQ1b2r@fat_crate.local>
References: <20261119075330.961-1-luoshance@hygon.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261119075330.961-1-luoshance@hygon.cn>
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 03:53:30PM +0800, =E7=BD=97=E5=96=84=E7=AD=96 wro=
te:
> From: Luoshance <luoshance@hygon.cn>

Is this the legal name you would like to be in the git archives when I ap=
ply
the patch?

We usually use "<first name> <last name>" in commits and I think if we ad=
here
to this, yours should be

From: Shance Luo <luoshance@hygon.cn>

Agreed?

I'm asking because a) people should use their legal names when authoring
patches; b) you can decide on your name spelling and stick with it so tha=
t
there's no confusion in the future.

> Hygon family 0x18 CPUs are affected by the same floating-point divider
> issue as AMD Zen1: the divider can leave partial results of previous
> operations behind, which another attacker thread can sample.
>=20
> The Zen1 fix, commit e55d98e77561 ("x86/CPU: Fix FPDSS on Zen1"), sets
> MSR_AMD64_FP_CFG bit 9 in init_amd_zen1(). Hygon CPUs are family 0x18
> and do not go through that path, so set the same chicken bit at the end
> of init_hygon().

That paragraph is not needed in the commit message. If anything, it needs=
 to
be here...

>=20
> Signed-off-by: Luoshance <luoshance@hygon.cn>
> ---

<--- ... under those "---" lines. But I'll fix it up when applying and af=
ter
you've clarified which name spelling you wanna use.

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
