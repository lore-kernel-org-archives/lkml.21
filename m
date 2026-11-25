Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578654;
	b=L7hP/Rafw9ropOLY2KTne5eFxrhi+b+O2qNz3N57cadHhCO6OORdxMN1weIQ0SGYacwW
	 wpJUeWhyszLMveGNdmq3N8kK/i5FlAMUIfbula7EGW075/TYPXnS4EvotZw1DPBtgEwoz
	 ge5zvAyDDMeiLUF9FecLfq52huzv/MqmNLPUUPJD4dfWltHR5BUJismdPssTazxjefW1a
	 2bfgCKhXq0+ofMXq+Y/W514TQOEUoJHfFn8WbkYx3dTZTNedQrDuPBN1hOrN9HdsMq4dw
	 nrg+AnZ/rT65nrldXEbVZstnnw2OURRphJPZxiCpXnEftjrUvOT1NiqwSVgtzoa8sCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578654;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type;
	bh=WEKhbJUkbM0WYWSf7920uNUMWUxgqj443q2LzRm9f7s=;
	b=LdrU+k/V+k2jG2PjDUlYBHdZJlfXDLk+s8T18nkToHv9UbMQJxswapYULMY3CnkthPsy
	 7jEuHVSk/jreO2kXg45TsFMMVKCFJ4neumQGSxWxmTmjX40wrTpye4To+jcg72K0KIBvB
	 WCLOsSdjrPT+1o3b8hxeSiNEZp3iA8DBlZQJnaYjs3sfkn8+SPoj+KuLJeCzc3FFTu10l
	 12CpfnxQpgjK5LNbv3jqPaQiMIPTRjTLngy1x1oO8ZYGnJnCuraqqG9Inubg2K5zy48li
	 sMvzF/2zyXcmw3fkW0rUsGhFmgGbmKj36fDRC4R2+LUCtgDH8RKbzN9Qs+cgwmZ7tXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rv+CKdzO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA09D606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rv+CKdzO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB481F000C4;
	Wed, 25 Nov 2026 03:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795578654;
	bh=WEKhbJUkbM0WYWSf7920uNUMWUxgqj443q2LzRm9f7s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Rv+CKdzOyYG2YCS+OzbHxqABnTY9JEYrtO/mGa6r0ZfwFOEn9QzfAxAr4x8BwwFJC
	 wmXO6bFffoxiD/ssfSVBk7TjrWsoacaB3DKwv6rBjjQOhj4pB2B7UD1B+4gHCcWi+h
	 whnvLeBi1UWX7DcVAYCM9KNRqAKCngtg2Yo07loHvwwqQAdSjEq0MyOh/YvEmMLwkZ
	 ZJTzJy114+mR3XHR2mP+afIaOLzgw2wESaMfKQf2pvpYGYYUvIEEM8h9CMZUUC3C6+
	 qesZZ+ucKQwlRJkTZHCgyjm07BoOddrUoE8J3JCiFDCAYxbGqKvss3DJoCXF3rkTTU
	 9hCkeJ7ZULKbQ==
Date: Tue, 24 Nov 2026 20:50:52 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Nutty Liu <liujingqi@lanxincomputing.com>, 
    Junhui Liu <junhui.liu@pigmoral.tech>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: pi: validate early FDT string properties before
 string use
In-Reply-To: <20260403005904.8904D166EA5F@hppdeMacBook-Pro.local>
Message-ID: <36ac8dd9-aaea-ade9-cdd6-dcd470771633@kernel.org>
References: <20260403005904.8904D166EA5F@hppdeMacBook-Pro.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 Apr 2026, Pengpeng Hou wrote:

> The early RISC-V FDT parser reads status, riscv,isa, and mmu-type
> directly from the DTB and then passes them to strcmp() or
> isa_string_contains(), which in turn uses strlen() and other C string
> helpers. DT string properties come from external firmware input and are
> not locally proven to be NUL-terminated within the property bounds.
> 
> Use fdt_stringlist_get() before treating these properties as C strings
> so malformed unterminated properties are rejected instead of being read
> past their declared length.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  arch/riscv/kernel/pi/fdt_early.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/kernel/pi/fdt_early.c b/arch/riscv/kernel/pi/fdt_early.c
> index a12ff8090f19..a44afd460d70 100644
> --- a/arch/riscv/kernel/pi/fdt_early.c
> +++ b/arch/riscv/kernel/pi/fdt_early.c
> @@ -38,16 +38,13 @@ u64 get_kaslr_seed(uintptr_t dtb_pa)
>  static bool fdt_device_is_available(const void *fdt, int node)
>  {
>  	const char *status;
> -	int statlen;
>  
> -	status = fdt_getprop(fdt, node, "status", &statlen);
> +	status = fdt_stringlist_get(fdt, node, "status", 0, NULL);
>  	if (!status)
>  		return true;

Sashiko points out that fdt_stringlist_get() can return NULL not just 
when the property is missing, but also when the property is empty or not 
NULL-terminated.  Those cases will now all be treated the same way.
This seems to conflict somewhat with the apparent intention of the patch?

> @@ -210,7 +207,7 @@ u64 set_satp_mode_from_fdt(uintptr_t dtb_pa)
>  		if (!fdt_device_is_available(fdt, node))
>  			continue;
>  
> -		mmu_type = fdt_getprop(fdt, node, "mmu-type", NULL);
> +		mmu_type = fdt_stringlist_get(fdt, node, "mmu-type", 0, NULL);
>  		if (!mmu_type)
>  			break;

And again here.


- Paul
