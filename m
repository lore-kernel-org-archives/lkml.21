Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709705;
	b=aw/hljEwXV5/afRmThxzBTzWxCh4TT3OoZzQf+LhMqkHiSgW/tovkgkLYqTGImPX2t/T
	 rLjikQBkjFvxWv8LbideHVYyy7pW70a3E/TR90DXQ8YG3kV+4OGqQIunGndTyhrfh9KfV
	 k8WWOGZqvn/6kaKhaB8V/9AOHTLE50YHEeKM1xaZ+majW+VnQdLmuhw6mvjNOwEtqBE8i
	 SThj2K5qag8Kk5OU2ymiJNi5zoxj/eEXMjDLDQC0nlcl8UEYs/LKYnmXmyj2nloOS1tuB
	 kZYLglZzlerpJ3TmQg4S+YkCo9k1ii/4Jn3cxBFI9dZRbfxVnqw28RrPqxqBNuOtKEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709705;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=3lKSc+Bc+1wSufdoeF5bFWTjYJCqmuJF4q+Yk/oXdGQ=;
	b=fHTENPEUOjR6W4hGKX6xHnIdPVoQ9SOcOPelstS8LAZDnO8011Ks517+l7VTFPcdAUBw
	 NUm0Hlgmqpb4v4lakCFiUbWCOmtrM1E0/YIpiCbC1ovpBW37x1kL7yOKHauPKSTi9SE2D
	 Ep95AILBAlitxxBznhQj4DYTDwEKR+zyjXOvpNAil6MgIdrdZqMJv7Ks40Sh6s4i62GiK
	 PWltu+GtuH6LIKcD5AT0fzLdqE8qRTFVOpbEh0sBQJaeGFz2JDsSh1ghCtyiQfe7kw0jQ
	 MpIA6DrUMfuNwx0yY3FaXDWmPsrMc1xGRTUP6tK7H1sXwP1KCthSD2wOGE39GKQoJ7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MdINvNsj;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCCE660A2639
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCCE660A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MdINvNsj
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DB481BA8;
	Thu, 26 Nov 2026 08:15:00 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58DE03F86F;
	Thu, 26 Nov 2026 08:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795709703; bh=YbnSTX7ECabj5Kpk98lfgm3U879E7bHUwxxQyn3DVZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MdINvNsjaxy3RRyoti23H/RAjpnn5we+doDDB2J4iLXsEWNA4PciuUHkY4S9rmvW9
	 KGBKC3hmabiW3RgyXHJ+kF0KVxTZx1HIbM/Kf+mDXlGBJrUJDZQIc5HQ1GjxrkSQen
	 aYhBSkVOVHuPL0zuXw6RauaOcWG9cJ9jyDD7qSb0=
Date: Thu, 26 Nov 2026 16:14:59 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: cacheinfo: Simplify init_cache_level()
Message-ID: <awhbA7pxop_WyMTK@arm.com>
References: <20261104083632.65715-2-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104083632.65715-2-blum@kernel.org>

On Wed, Nov 04, 2026 at 09:36:31AM +0100, Thorsten Blum wrote:
> acpi_get_cache_info() already sets fw_level to 0 on failure, so drop the
> redundant check and the manual assignment.
> 
> Use unsigned int for fw_level to match the expected type, and remove the
> now-unused local ret variable.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  arch/arm64/kernel/cacheinfo.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cacheinfo.c b/arch/arm64/kernel/cacheinfo.c
> index 309942b06c5b..881131fb4934 100644
> --- a/arch/arm64/kernel/cacheinfo.c
> +++ b/arch/arm64/kernel/cacheinfo.c
> @@ -67,19 +67,15 @@ int early_cache_level(unsigned int cpu)
>  
>  int init_cache_level(unsigned int cpu)
>  {
> -	unsigned int level, leaves;
> -	int fw_level, ret;
> +	unsigned int level, leaves, fw_level;
>  	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
>  
>  	detect_cache_level(&level, &leaves);
>  
> -	if (acpi_disabled) {
> +	if (acpi_disabled)
>  		fw_level = of_find_last_cache_level(cpu);
> -	} else {
> -		ret = acpi_get_cache_info(cpu, &fw_level, NULL);
> -		if (ret < 0)
> -			fw_level = 0;
> -	}
> +	else
> +		acpi_get_cache_info(cpu, &fw_level, NULL);

I wouldn't assume the caller always sets *levels to 0. It may do this
now but the kernel-doc is not entirely clear. It claims that it sets it
only on success with some muddled text about returning 0 on failure,
which I guess may have been intended as setting *levels to 0.

This also relies on ACPI_PPTT being selected which is true for arm64 but
we can't simplify the checks here just because of Kconfig options. It
doesn't cost us anything to check the return value, the patch doesn't
make the code easier to read. So, NAK.

-- 
Catalin
