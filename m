Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107448;
	b=SSr3GnPf+fQ3dkf7dq2X3PRIrAZRCkEguLeqSPmq3lrRoB7tQLZJtHFyOVuvG+pzeV9a
	 zWZu08jykDPrFN3kkeNLczGCtKY6z2YMUknatDMryA0glOZ6aHNiINslw335eEx4fAxn3
	 KqcrXWvXLd/cxwLTTjDegvRFi6ZVANlHn3gXvhp2X3hZpgkLBIEoul8GM7vDXAvxn/ZY7
	 IAWSliocV2iiciPaH7pGJNp1k6Yi3OugUsSaGWHbkNIMrm6otQgpidCrEi3lneV4Txf/p
	 xDqKznICPulSh8xSYoy6rP6kfo6o+JqUwxXz2ux71AypnpkHmwowzElTLBiIjs+bWww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107448;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=76oqwEH/SPEJYq2mPir1GKyIN8scXu14LeMlRXgXqmY=;
	b=d9IBjfNpiGCJlrzq6mQfs1ZuJkuPiOkc0ipQYVvmzumaxOLw7MqJ7Sz06L9pquKp/qDM
	 ETmxSjbquqescItyzW+OpL5mRCjJ515aajTNQwEW3et0hEfvPYDbp9pEr55KlVYAMotyx
	 Y59Ik5xi4W+ZJNQpJD++MOG2l1GEbPku5RJgVqBg3Qt6D39ijk8QxizjAa0AZZZQqE0M5
	 X/c8FXcfFsfGDp0wxqrZZ3U3SBUhIPkm/dygij3VNtHtE3mBDk1VZ6l2Q1CPdgwN5On5N
	 OVEAYPV0I16u4RrFBMiEI6GqeHfz5hkDebq/oKRNEIMOmyhgFY0UOadSQbm8Ig0ql1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XyHA6W1w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E04606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XyHA6W1w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778461F000C4;
	Thu, 19 Nov 2026 16:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795107447;
	bh=76oqwEH/SPEJYq2mPir1GKyIN8scXu14LeMlRXgXqmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XyHA6W1wKVMNLYfFY1PAf/Ex4mdE1JcFitb6qqtkgjCTBJaFEcOtED6FxQbEqefL0
	 Ncgayy7Nw64SclToqro3Ouy/3hd/H0XxSHgFQREhlhAocensYjjBCo5IFWuRIwPs33
	 JXo39xjAoz59cRTzCjDf8uWvxMkapjWEIVupLCl0Mh77cG+wt1sgJOElJK59winlmK
	 VwQ5lQNRc63uo6VGe7UqFdToaGqexZDDRmAdk7w2Bp/IYSwOajcT3+Bz3qJekfkWpu
	 lw1AeLkl0Zz+xi9WOLQaYNCSnaD6FlCHhp1c3boBMrR2MnL4mZwdrayqrq7fuF38GW
	 l4ZhmFcKcmEHA==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.ams.internal (Postfix) with ESMTP id EA703198003A;
	Thu, 19 Nov 2026 11:57:21 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 19 Nov 2026 11:57:24 -0500
X-ME-Sender: <xms:cSr_ameBHFzvTpO_rIXLLBLXU1EtHVEWsAz5WbTam7k2-UcX2tEZ-Q>
    <xme:cSr_aiELSNQKkENGP3HW8vjyZECX5yYGKnnsGQbir0ZYCD14tsQ80C5UM_PegQTYl
    3xX9WuG7w1QIT8XkuUWnqCQOrrT624B54a4tr0RtjKQrIHOnLKl-0ew>
X-ME-Received: <xmr:cSr_asKf2AeJxBNI7ovLT5AEEGIVGzvlqgo1NZUyJTdeY0FiJzdNb7ZFqGk>
X-ME-Proxy-Cause: dmFkZTECkGlHxkJe4+gF+AuCoU2k+QynF2HxgU91M7WpbV+jxcinlrLiUAlopmwL7pHS5E
    LvY6KmYY1CnLULCOYDnE2aQ2kgo6IRkiKhm5LxtPn7IKmVmSl2K8sC9zJ+8pm5OpVnzjuV
    fRWuCOJXOSfgZZ0NkT7vXFT++F+DtOtufWah4kNGqv0AwZp9zJ7UIAFYHuSk7ZKn+oKO77
    hexhpL8B097bMkGS9j+v2YfQdGxHotBzVpmnoDqvMgHoIT2OPWTvtsHXVEcKybYF5MiCOu
    QBbkrn+m9VqknXPorWw0kxlwBeqOuuMMg1FBjguaOglb0CToJNjxQFXxizDM16c5bm81am
    MQdruA6/0IfuLeflv6gkoGd/RzA33YQ+gVJWyfajlr4b2zUvj7EKK6V6uri26hZLd9Fk07
    uRye4XSksbK4D7dJTLukd8gIWDKjXBKBQWu5lEK9vXNd8LheaZBcDuADP52l8yEYBUCr+2
    DDOTfElQhr4JVbCzxUqHvc+6tyt98Kcqpo/VcKjX2Lq7R5OIW9psl9ujJb3DIm04IkPYyP
    43qVgEm00n+VtDmVU5fl92UBcjQ6g/HCyqDASf14U4YufP/sanWDvA8RoIXG38gG0vwq81
    CGXsuaIZRC4FvA2NYxcawcSeI50G0guJ56YSlhsow17BXCtkgZyx9HvlWvyQ
X-ME-Proxy: <xmx:cSr_aieaBQ0adQssbpm_F0KnQw-naYjUY-pfKsIJM6hUXsyMdJ6QYA>
    <xmx:cSr_aisiYnPHW5UqVSnLtXnONHB5_fQxajEnNOqxKlUlmmm6TklXjQ>
    <xmx:cSr_amvPG3SzOYQyCtsQtO9lhAl-pv1WMQVs-hObBl4F3kHaz_tyIQ>
    <xmx:cSr_ap8HNqsgR41UYIHUbDEfE_pga_SiO9X66FWCEcKwQmTU2Ov9sA>
    <xmx:cSr_an9RX_WxlPHzmJ-uefd-csKOGhiCfcaO5lya0XFI7x-RrfKxX4RP>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Nov 2026 11:57:20 -0500 (EST)
Date: Thu, 19 Nov 2026 16:57:19 +0000
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Vladimir Murzin <vladimir.murzin@arm.com>, Marc Zyngier <maz@kernel.org>, Breno Leitao <leitao@debian.org>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Doug Anderson <dianders@chromium.org>, 
	Linus Walleij <linusw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Huth <thuth@redhat.com>, Dawei Li <dawei.li@linux.dev>, 
	mrigendrachaubey <mrigendra.chaubey@gmail.com>, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: entry: sdei: always set VBAR_EL1 on SDEI entry
Message-ID: <av8p2WL4R2tlU1HX@shutemov.name>
References: <20261117174814.95936-1-ada.coupriediaz@arm.com>
 <20261117174814.95936-2-ada.coupriediaz@arm.com>
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
In-Reply-To: <20261117174814.95936-2-ada.coupriediaz@arm.com>

On Tue, Nov 17, 2026 at 05:48:12PM +0000, Ada Couprie Diaz wrote:
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index beb56891fc4f..cb122163a68d 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -1079,19 +1079,22 @@ __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
>  	far = read_sysreg(far_el1);
>  
>  	/*
> -	 * With KPTI, VBAR_EL1 holds the trampoline vectors from the return to
> -	 * EL0 until the next exception from EL0 maps the kernel. They only
> -	 * handle exceptions from EL0: an exception taken here would run their
> -	 * empty current-EL half and never come back. Switch to the kernel
> -	 * vectors. The IRQ-like resume keeps using the interrupted VBAR, so it
> -	 * still goes through the trampoline.
> +	 * As an SDEI event can take over at any point, VBAR_EL1 might not allow
> +	 * us to take an exception safely :
> +	 * - With KPTI, VBAR_EL1 holds the trampoline vectors from the return to
> +	 *   EL0 until the next exception from EL0 maps the kernel. They only
> +	 *   handle exceptions from EL0: an exception taken here would run their
> +	 *   empty current-EL half and never come back ;
> +	 * - With VHE, the kernel runs at EL2 and VBAR_EL1 accesses VBAR_EL2.
> +	 *   KVM might be running a guest and switched VBAR_EL2 to the
> +	 *   hypervisor vectors.
> +	 *
> +	 * Switch to the kernel vectors unconditionally and restore
> +	 * the interrupted VBAR_EL1 before returning.
>  	 */
>  	vbar = read_sysreg(vbar_el1);
> -	if (arm64_kernel_unmapped_at_el0() &&
> -	    vbar == (unsigned long)raw_cpu_read(this_cpu_vector)) {
> -		write_sysreg((unsigned long)vectors, vbar_el1);
> -		isb();
> -	}
> +	write_sysreg((unsigned long)vectors, vbar_el1);
> +	isb();

This makes the comment I added in do_sdei_event() wrong: it still says
that an exception taken during a KVM world switch goes to the hyp
vectors and hyp-panics. Could you drop it in this patch?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
