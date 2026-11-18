Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012404;
	b=xFZyO5enwJ1N4srBA58a4kUcYr9ZQbFmsQB70S38SKTq+88mvJPoQ/gJRkH9JcAO4sHN
	 lJWnmo6DF/6ux/JnLWX7nIbgLSBHvrAmqGq3FM44VH4FHsGpsS0Xrd2bCy9QzL6rHylbS
	 caYEsCdYVeS1aHn+U46u2ynhZ4s8CuqFvf0D9eUQ5ELKcdPXBUVc7b7eONSsb+58wmAa5
	 CQdODReHu9v4GrTy7V1VoEXNjW6skpi/TQ3LqYyEO3iSNX3tHyHFa0glBcz6nXtgSdrgw
	 1Mfu/e7NUNJRsLHO/dvw/izAevj8k5cC9nh/dPgFFc0q01/BaWQXOX4cTLpmPDawh4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012404;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=D34zpbA+OMm4F17m+5ezKBsGNb5NpX4r98ZUFyFRDGc=;
	b=IsV3/61pkC11k7BMIz3FMPg241XWCn6wVY8L5OA+0T/A5fKzZzkSMCOvDwR3HWY53A8G
	 wzgNI17xto+hvop91YtsR4NWok9tpttKyf+g9/Ij9ILIVZRX6gbdOdgtUP8aH8tTw04dJ
	 a3h2jn6LoYsaFpECZgb71ttUA47SvxPblTR6m9xzBmAkCrUPNBVaf47UdaSAYBSj6kr+h
	 pfbdx4CUbOwn+BC8FmwusH8RUIr2GvFfMvh8aPvmHGpKrl+PWPQpXfsG1NG9LoGmNgluA
	 QqCmGsXciJswZ49/kXUd54JC1QmOKJ3cm/TkwNcMYBbtpkqfM5WvdX4WEdyKuc6jUFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=afgpSWbK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A78D606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=afgpSWbK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F861F000C6;
	Wed, 18 Nov 2026 14:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795012404;
	bh=D34zpbA+OMm4F17m+5ezKBsGNb5NpX4r98ZUFyFRDGc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=afgpSWbKiI0avSw3IMSoFyToj/tUm6odZZ/653SR9sWa935SEWaDnU1sPwutnRwpQ
	 ryRmkjvCLZ2SZWLbSsqoEvycvDgASL93L6ECEPuTEv/cAbgUppgjAF4f7cHCJYEgH7
	 KsbInXBIHRKlvg8H8jxvFrFeLe6Y9o6KFJZK/64DZqLN36YT6fCx29Ubkr5tRqOt1J
	 oF15uZJtLysw9pHPjvHsW1t2ZB3MTeCZ29LMQ7wvGmdoE1l7uEvPETBhMVEYULZDie
	 4zAXAihUC0BFkMAcq0L1mILKbwZQowtWhaNIW8563irTdrknoQVkI/6GxhFSlUCSOe
	 DHwsXz8MfNHGQ==
Message-ID: <36a31353-34a1-4a24-b034-1e486df3ef26@kernel.org>
Date: Wed, 18 Nov 2026 08:33:18 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform profile: Restrict the core prompt to
 COMPILE_TEST
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, rafael@kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 open list <linux-kernel@vger.kernel.org>
References: <20261118110255.2946563-1-daniel.lezcano@oss.qualcomm.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20261118110255.2946563-1-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 05:02, Daniel Lezcano wrote:
> All platform profile providers select PLATFORM_PROFILE, so users do not
> need to enable the core explicitly.
> 
> Only show its prompt when COMPILE_TEST is enabled. This avoids exposing
> the option in normal configurations while allowing the architecture-independent
> core to be build-tested without a provider.
> 
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>   drivers/platform/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
> index 7270f24a3b6e..1cf87904afc3 100644
> --- a/drivers/platform/Kconfig
> +++ b/drivers/platform/Kconfig
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   config PLATFORM_PROFILE
> -	tristate "Platform profile support"
> +	tristate "Platform profile support" if COMPILE_TEST
>   	help
>   	  Provide a common sysfs interface for selecting platform power,
>   	  performance and cooling profiles. Platform-specific provider drivers

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
