Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795884736;
	b=xc1XXqQHU0C7BKhCiV7L7XYwblDaj8Go4QUhGdhtOtHr4rj+ydGwtSAK/alR1SG110gD
	 30YiboUz+qG74pR8ycEirtTLW9mQduDxU+hnHEnxz80POdUwnpx1yMMXGAoXBd8bbNzd3
	 ZwJ4DfawuajiRGKdhmoUjHnV4DbLv8ri+G2jlWMLPr0qn49T8XRpKlFhf56pbQHmAYOM+
	 iOrpN/Mjh4PWFAzyxtb9ww5fs5oPWF0Jnmno899qDnXYHw2fBoMpzMYUBBBbi56/UHnVo
	 lrW0/bqZMsG4sV5UoHMT0lXF8L9TSGz/a7jpdvYEQUWE8Ht+zKDfKhRoAh7/6lwYuyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795884736;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Spam-Status:
	 X-Spam-Checker-Version;
	bh=v2uit/kKLQEF6WpXD9qavwurhXxTwzb4SoHUnkTxWBU=;
	b=yAtNgx0C02/sJhNpOsbXtz8Plq6rFGPs3+2ozg0KENXXd9Z2tgxyv9aghKOwp3U+CnHi
	 X076EUcLvXoXfTtHys3Gtv2BsTzmOyBpr91lgbpXpuWkpw5Dk9gXpgmWzIa72r3UVxIiD
	 qJJ0kD6kwyS6OfD3pSxNB8IowKczUdhaPKxmQD/fvCVBUqH39rLsDtvdXNs5q7dBGESXS
	 uG2uw+iKowgR4aPXMt1eex7D+RKQyFQvP/S41F0nnfMUiKf9N8o+p5pl5WKrUUkyrUdFo
	 /SGwZ7PKuULWL8rmLg+XJaLWoRg/kAXQqyuTRw/mVThV4RpH2xvt8aN31oPGNP9IdbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.microsoft.com;
	spf=pass smtp.mailfrom=linux.microsoft.com;
	dkim=pass header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=JXMOXZAZ;
	arc=none smtp.remote-ip=13.77.154.182
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4B2606A33A;
	Sat, 28 Nov 2026 16:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E4B2606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=JXMOXZAZ
Received: from [192.168.1.10] (unknown [52.172.102.187])
	by linux.microsoft.com (Postfix) with ESMTPSA id 32A5720B7166;
	Sat, 28 Nov 2026 08:51:57 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 32A5720B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1795884723;
	bh=v2uit/kKLQEF6WpXD9qavwurhXxTwzb4SoHUnkTxWBU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=JXMOXZAZGYRH7aNN3h/atbh1M4IvVYXeJcg8tiBa+MAJDqRBxLzOfeUclEBmjzHs7
	 2MIKtxZZGajBK58V0fJHiHx/bEGTQ+I6H5k3t2n42EkFUL1D6B7xMHUyyzY08OR27o
	 yqTck2se/jNcl9pr5PDBwnPkb2ymY1cII+MtoVeg=
Message-ID: <b8ac7469-4edb-4ddc-8e63-754961022c16@linux.microsoft.com>
Date: Sat, 28 Nov 2026 22:22:02 +0530
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
Subject: Re: [PATCH v2] arm64: sdei: add sdei_nmi.disabled= to keep the GIC
 NMI path reachable
To: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, james.morse@arm.com,
 rppt@kernel.org, arnd@arndb.de, kmehltretter@gmail.com,
 dapeng1.mi@linux.intel.com, elver@google.com, enelsonmoore@gmail.com,
 bp@alien8.de, jlayton@kernel.org, catalin.marinas@arm.com,
 sean@starlabs.systems, suzuki.poulose@arm.com, will@kernel.org,
 tzungbi@kernel.org, kas@kernel.org, wenst@chromium.org,
 steven.price@arm.com, tzimmermann@suse.de, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 vladimir.murzin@arm.com
References: <20261125080812.1225194-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20261125080812.1225194-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25-11-2026 13:38, Jinjie Ruan wrote:
> While the SDEI cross-CPU NMI provider is active it claims every
> cross-CPU backtrace, so on a platform whose firmware exposes SDEI
> event 0 the irqchip NMI path can never be used.  There is no way to
> opt out.
> 
> Add a boot parameter "sdei_nmi.disabled".
> 
> With sdei_nmi.disabled=1, the SDEI NMI will not be registered, so
> sdei_nmi_available stays false and the hooks decline on their own, which
> lets arch_trigger_cpumask_backtrace() fall through to its IPI path.
> 
> Suggested-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v2:
> - Alphabetical order.
> - Simplify the code by return before registering event 0.
> ---
>   Documentation/admin-guide/kernel-parameters.txt |  8 ++++++++
>   drivers/firmware/Kconfig                        |  4 ++++
>   drivers/firmware/arm_sdei_nmi.c                 | 17 +++++++++++++++++
>   3 files changed, 29 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 176648941aec..4f07c771b46b 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6934,6 +6934,14 @@ Kernel parameters
>   			non-zero "wait" parameter.  See weight_single
>   			and weight_many.
>   
> +	sdei_nmi.disabled= [ARM64,EARLY]
> +			Disable SDEI-based cross-CPU NMI and leave the GIC NMI
> +			path in place. Requires the kernel to be built with
> +			CONFIG_ARM_SDEI_NMI.
> +			Format: { "0" | "1" }
> +			0 -- enable (default).
> +			1 -- disable.
> +
>   	sdw_mclk_divider=[SDW]
>   			Specify the MCLK divider for Intel SoundWire buses in
>   			case the BIOS does not provide the clock rate properly.
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index 43e2e2a64594..4c8b917867dd 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -58,6 +58,10 @@ config ARM_SDEI_NMI
>   	  regardless of the target's PSTATE.DAIF -- forced delivery into a
>   	  CPU wedged with interrupts locally masked.
>   
> +	  This provider takes over every cross-CPU backtrace; set the
> +	  kernel parameter "sdei_nmi.disabled" to 1 to use the irqchip
> +	  NMI path instead.
> +
>   	  If unsure, say N.
>   
>   config EDD
> diff --git a/drivers/firmware/arm_sdei_nmi.c b/drivers/firmware/arm_sdei_nmi.c
> index 038eb79e28ac..0e146e603354 100644
> --- a/drivers/firmware/arm_sdei_nmi.c
> +++ b/drivers/firmware/arm_sdei_nmi.c
> @@ -62,6 +62,18 @@
>   
>   static bool sdei_nmi_available;
>   
> +/*
> + * Mirrors irqchip.gicv3_pseudo_nmi=: the architected NMI path
> + * is preferred when asked for, and SDEI stays out of the way.
> + */
> +static bool sdei_nmi_disabled __initdata;
> +
> +static int __init sdei_nmi_disable_setup(char *str)
> +{
> +	return kstrtobool(str, &sdei_nmi_disabled);
> +}
> +early_param("sdei_nmi.disabled", sdei_nmi_disable_setup);
> +
>   #define SDEI_NMI_EVENT			0
>   
>   /*
> @@ -222,6 +234,11 @@ static int __init sdei_nmi_init(void)
>   	if (!sdei_is_present())
>   		return 0;
>   
> +	if (sdei_nmi_disabled) {
> +		pr_info("SDEI cross-CPU NMI disabled by sdei_nmi.disabled.\n");
> +		return 0;
> +	}
> +
>   	err = sdei_event_register(SDEI_NMI_EVENT, sdei_nmi_handler, NULL);
>   	if (err) {
>   		pr_err("sdei_event_register(%u) failed: %d\n",

Looks good to me.

Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>.
