Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195533;
	b=0pzXkMdoLB/yauEHVRIbhYcNcl5FCHQN+FwgqYahSsf7KgL/JCaiH2J/mEP02CIdGwdC
	 1uaXVYcp0xkSd6Qo9Tqb8k3WEy/pVGC4Smag9Qb4qmwQdCo4tcL9faTVdp9tSMgSR3RiM
	 2Eg0g1HCIFUCH2DTcW/8dx5VB50yCg/s8q13usflwgJT/8CfA7rYWEOshX9YvNPQzzxc2
	 CQFjjxi+fXTAWi44Mpx929LQDVchsWI9RbkMbUIzG7W3r+g8fi6DHbWz83P0hhDh12LjX
	 RG4b5DGHCgBsyammtm8qDjV/2G6wXKqMr0sgSDndreyflCtz0h69RwNBde052kzDDuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195533;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gUOpKIUvA+gYvUk3azH7yuC1fpsESJxA2NvXYZfgYMk=;
	b=3bOajhZxgBt6F4u5/M4DK541NwlbYF78CQtevK1No/m5/tO/WO85Y/zvHVrRb7zZnasa
	 QHBuqvpfoFvGnFWYPvg2dO822MpcrpxpG05tGsYSPRiS+qJSKEsgiDrG/igtIWPnrHn6R
	 KxUkIzLi7muubOKaKXyp016JAxTDfqbnA8PXdTwALdd+lwsjkVORze4TNqSJK1UP71o3q
	 SZiQjko3GtiqczVPmKhhuC6ZUY0F75ncJz4SPGJ2ioEiZ4H8Egy5Oi8wsd5Cr7e5trFb5
	 Ms9ejKPhrosH8ydiDZB3toG12QoHct9JMs6Stn8Wh0+86ClE5sl3tDMxYA6FvfQsPCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="f/6ePyX5";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA10606A333
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f/6ePyX5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E691F000D3
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195532;
	bh=gUOpKIUvA+gYvUk3azH7yuC1fpsESJxA2NvXYZfgYMk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f/6ePyX5pkVfJvueoYrkmj+fcorkgWiQVtdfpN3iLGeHwzg1jdUatzFusUo9jptnS
	 Za9lD2DDjKx8cbTGpKTSOyGwF5HzTqiNwuLKfXrbeIVb1TTPrb/y/pOjz3xBmG03Hd
	 Ex8QSI5vBWC/LtbzQd3NiySK7nYSYFTwhIsHR8SY9PHtWWM3xKz2joTtvAd5MwdOLE
	 xnhPCxY3vvBKjX66ellpr0++MDlzWlkb+l8EgZWis9rehzkvrmoBOKTwFdVeMaqIwb
	 ERxGs99Sd3IXxNvZ3qoR8gE8F3T91e/l9zUFZBtex+OKwuVqOometpGfBjtG8Qxg1O
	 YCrslVZBKXbjA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be416e603cso840462e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:25:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGuAafoTl+1gAzke+qDnhUbhhkh1psmTycug7CT257b1/dLyDZ2ScRuthlJwtQh89h9+zPPCRS72HGQUR8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ApEFbXpRZSaXBq5kP5S0lMcylF2gwZcRY69JELSw/sF12oZQQ
	vhOlLXJToqOJrTv6ROiEYdVS176a4sJ5Y4SRubcK8YLLCyWx+gt41aSOhsu1kOzrFX5bysRF0sq
	lvaEIJStTiL1Z986VoXvtD0Q3w6CUW/k=
X-Received: by 2002:a05:6512:3042:b0:5bf:cfcc:5440 with SMTP id
 2adb3069b0e04-5c1bc67eccdmr1186693e87.8.1795195531024; Fri, 20 Nov 2026
 09:25:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114165612.368785-1-safocl88@gmail.com> <20261114165612.368785-15-safocl88@gmail.com>
In-Reply-To: <20261114165612.368785-15-safocl88@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 18:25:18 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hrwcqc7ijG+RhJ=QoOW3VVBtXngfj9U_ZFM=Po_0dEvA@mail.gmail.com>
X-Gm-Features: Aa3M54p88_5liGwvEtGjd-mOmxn7VL1xtSpT1izxwwlqazqTM6pUpNwQhGK8PZA
Message-ID: <CAJZ5v0hrwcqc7ijG+RhJ=QoOW3VVBtXngfj9U_ZFM=Po_0dEvA@mail.gmail.com>
Subject: Re: [PATCH v3 14/14] suspend: fix duplicate extern declarations
To: Safocl Stollmannovic <safocl88@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 5:57=E2=80=AFPM Safocl Stollmannovic <safocl88@gmai=
l.com> wrote:
>
> Compiling a kernel module with a C++ compiler results in a "duplicate
> extern specifier" error.
> This occurs because the code contains `extern asmlinkage`, and `asmlinkag=
e`
> expands to `extern C` when processed by a C++ compiler.
> Since the code already contains sections that respond to a C++ compiler,
> I believe it is a perfectly valid approach to gradually move toward a sta=
te
> where kernel modules can be compiled by a C++ compiler without any issues=
.
> The `extern` specifier must be removed.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D222257
> Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
> ---
>  include/linux/suspend.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/suspend.h b/include/linux/suspend.h
> index a38150277..b97af3420 100644
> --- a/include/linux/suspend.h
> +++ b/include/linux/suspend.h
> @@ -385,8 +385,8 @@ extern int swsusp_page_is_forbidden(struct page *);
>  extern void swsusp_set_page_free(struct page *);
>  extern void swsusp_unset_page_free(struct page *);
>  extern unsigned long get_safe_page(gfp_t gfp_mask);
> -extern asmlinkage int swsusp_arch_suspend(void);
> -extern asmlinkage int swsusp_arch_resume(void);
> +asmlinkage int swsusp_arch_suspend(void);
> +asmlinkage int swsusp_arch_resume(void);
>
>  extern u32 swsusp_hardware_signature;
>  extern void hibernation_set_ops(const struct platform_hibernation_ops *o=
ps);
> --

Applied as 7.5 material, thanks!
