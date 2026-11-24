Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795493737;
	b=jVoCTGiwi2P1oUgPZFiZL6Zr3tzcoOFiJjGh7Q3Apno8NNzh2KYfps20hDhrj8cJCuQk
	 I6xVylYgDyAJj1YsUY+SM+Vi1aoqrLMvDH/2Kjvzr9mJS8q2PzSXe48he+SEL5P8icY9w
	 TnD/DDN+ze6uN8v7St9TDejEm1jzzTo+vMDiIVRh9eKCbX0wwxA1+jI4tvVqJecBP9Jqk
	 GUanxrTiuntmOVUcwOVcZRtmGrUIf4d/86LfXnUvLmZfRcTkW9Jf1AXhhTQivYcAEx3de
	 GFaiAOVHPJRrAM132s/lXtrlMl9AOZEvDZWntY1EP6n+mhzuPu0fB7BmMwMbwnnk4tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795493737;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AJft6SG2iDhVlxIVm+LaJGF+qGzg6VktxdXn6Mac/TE=;
	b=XtPL8bH2Su6YsEgO4e+uLCX4vqh4e/B8G/gsKP61BUII1f06ghTxdA9BzVyuWh9rZNjM
	 OpzN1kVPLUsuDGHMI2Jg54JTnXMgAOgRVomghnExZ8hb65lhPMTmtc7Vb+uxx+B5wTfM2
	 TZ6+hGq5GOinK8f3GwxfT6/0sjtbPcLm7H7s+I6qzLHeo15YS2YH/dvy2JXtxm0AzdTjA
	 FfZAOJYxN/VeF8dh9+DkmpQwtDYwUmmwomOvFOVWa2T2tTUSwP0pxGaWL1bFqEMl4bx1N
	 +PBwDyLoBxbZgIQ3PNg9SSjDs/Z/edzp56WikYb/0ML5Gg+c/90i4HNZKPezfXtsXuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=HeLZKBEx;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31F8606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F31F8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=HeLZKBEx
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id ED18F40E02B4;
	Tue, 24 Nov 2026 04:15:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id uxjIyqGgZ08I; Tue, 24 Nov 2026 04:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1795493731; bh=AJft6SG2iDhVlxIVm+LaJGF+qGzg6VktxdXn6Mac/TE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HeLZKBExFpDXhdve0TuWVXUFv6hF2Hwl7EHLU3uFa0JGjCcy5xB+9mEszkupMZSpI
	 EAcqj2n8Tgs9r8w2hrmewQ7O0Hu5RBxDvLJPOW07ItL2NGOrk5cyoYXAMdo7gcTfzT
	 mgBKqXRQVSvcyueO0wOCFtZtZtZJd12PayVTSvw50Aui81cKvK4IJybM+PSj5eTjCL
	 UWpCOS+BLYDhhmKyMp/CvBfFY5bC/yacnTVAHFkfJisfvqBF3Tvnu+dQTwp5HlM6Yd
	 UTbwqiNQYDKWC0t0zzMQkbGVOw7Hw66UvANYMAVKbiW4dGlNOibVqeWG2AL25jyFIL
	 S5kpCOCuSpNDT5P7F0ZpqZWscWjXR4JPGqRlHyCUuBXsqx+6asVE6fZohgLQHusmC/
	 AaVhH57W/nQRqd/r1qYzUqwoT8qKH0FO4vF7mE14ddUqgH5TfXwMhi6/0GyM8RzgJ0
	 6oHk2ioCCFJnzOxNUrHvxwMXL24eIHARsGs7Dy9tcjew6ZHe2J/P5Uo+B4spPxIAlK
	 xH2Z/fk7jV4I2yvPowG2rnkeqrtFzMXp8YZFTbGYW14yhMcxqfZrgjPNdiWaWgiPH7
	 gDQQKENmvoJ6glNeR26VgntfVXvrwkUeHq1w0t4RgQClOyPZP224E0YPaGB/luKooQ
	 ikFHn/CwDQc7yrPJEowSN6kQ=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D077240E02A9;
	Tue, 24 Nov 2026 04:15:23 +0000 (UTC)
Date: Mon, 23 Nov 2026 20:15:20 -0800
From: Borislav Petkov <bp@alien8.de>
To: Shance Luo <luoshance@hygon.cn>
Cc: "x86@kernel.org" <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86/CPU: Fix FPDSS on Hygon
Message-ID: <20261124041520.GFawUPWLoqzIx7sAcW@fat_crate.local>
References: <3670e857db444608b685ca4785a62ffd@hygon.cn>
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
In-Reply-To: <3670e857db444608b685ca4785a62ffd@hygon.cn>

On Tue, Nov 24, 2026 at 04:08:06AM +0000, Shance Luo wrote:
> Hi Boris,
> 
> > Is this the legal name you would like to be in the git archives when I apply the patch?
> > ...
> > From: Shance Luo <luoshance@hygon.cn>
> >
> > Agreed?
> 
> Yes, "Shance Luo" is the name I want in the git archives:
> 
>   From: Shance Luo <luoshance@hygon.cn>
>   Signed-off-by: Shance Luo <luoshance@hygon.cn>
> 
> I'll use this spelling consistently for future patches.
> 
> > That paragraph is not needed in the commit message. If anything, it needs to be here...
> 
> You're right - it does not belong in the commit message. Please drop it when applying.

Ok, got it.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
