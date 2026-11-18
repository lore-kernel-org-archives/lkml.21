Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001399;
	b=2bGwykYghbyW6hEkLmms6cWvLHBs3FM8yppa5tNW2lcj2VhBhOCIFV+m0DoXEvwSJGs1
	 e3FC0J76c6ANjLe7Y59O5SteZnfHL5tBPDlEtPOw/RudAKWLpww5lYpi8PsC7a7eZAoKJ
	 hFH3W9XVucGYNkWKrA/wYXu+4W8UuGG3JDFGk+ScpPHA7bXjEkkXmWmt7axNjDoBJE19L
	 cm+wZnMYGr3D9VSTRAETWYOIVAbs5opQY2tFeI6VEHOKMmJgNvs08kX3BSmC6x5qcHRyS
	 pWoYvTvRo5xOroYF4lFR8QYeWmv5VKDuqvXFxlELpegxcHTi8RS85b9CBhULfquSnmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CKJXXPGigrKiCn6BqmrO398ZNmnv1y4ivGMlHte/o0E=;
	b=qdJ9gACisr/4GK88f6Yf9/sUIpAh5Nrs0q+CMT3rBfLDw6t4SawM1lYVE9tN7hyTgb8S
	 KNVnW2MQiYRdkVtuKx1cUh6ANNBRQRTNdaPNUcCwNcbea+g2dYr+AHOruLF9Aclqnuan4
	 JafZDyfa1rmn7h1c6z5Zu9yiqVltKaOUjKprr0xPQ6WoUPZtndYcjSSroEHjHcS2r84vg
	 SaYncI+icX07fmKcE7IjeAkRmfSpiOH6c/2Z76HJzhTguLVmDlhV7WONjCE142YU/sxEX
	 oFkZbKdCJet4Xgtj2sGWbR5mjBESGd+WJiwPddlKVU2tWs5eh9ZvNIMi4EagIoJESdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uuBN95WS;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01DB606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:29:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B01DB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uuBN95WS
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso652389a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001398; x=1795606198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CKJXXPGigrKiCn6BqmrO398ZNmnv1y4ivGMlHte/o0E=;
        b=uuBN95WSEgtwvJ5b3XgGzVGsIkSPMmD8peFA0kaW4t8J3Hwzt8LSI6YOOnU2f1r9i5
         OvNL3KbvQYpNCSdr4fkW8z4Owu0lZQUoGE+LyG6s6i/gmvGrxNZaz3EpqcOQR29bT9OR
         zH/OqaFbFTiUIWiVtLqPyPJUBEj9XAGdKQ5OShvoTH1AoAnu0p+lO+2MdvvRXDmrJSfC
         k75uYDvq/+C9rUeOwqRvUt0WBSJxm4StE/pdGoVi70UzAJnNG2hvAZBtvQ7qwy8laElu
         wfqopc3FOF8KIQCBjYlAmTR0Cnk8apqX8oyrqsp8R2XoG6GAvC/5UTnu67p8g94mHb8V
         FzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001398; x=1795606198;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKJXXPGigrKiCn6BqmrO398ZNmnv1y4ivGMlHte/o0E=;
        b=JsrAJ80n3zjbkP1UjXBWfmk8PVpVC2Auknv0HP/aHw8VGyYgT4UWm1eyThdOrNdwmU
         QbOfOLqlkVSPPgNY4CPPBrFv8wQW8poXqbsl6Fe7Opt1iL4ysqqEv40dRE1z5McY4EG+
         n2beicfjyhQrQc5hPx4j/78QFGJrNOz2wc9x9f4nTesrUv1IqGu91nlV0epYS7Vn/cp9
         0MsmeA2/kkW0FznGG9WfyUT+GnWvBaTCEcbUH8iDiXR/HZlbyHF3EqJZmVHwcm199X6N
         X624NJcLFUWX5cBylm5eRpgmBOpLb37oezzPiZGxoZUoN45reF8kRStN9fyCj9ylxONH
         833w==
X-Forwarded-Encrypted: i=1; AL+hErEIaF6ODXbPgOG+TDFKqCJ/9yfVBICSbRwmlM8hO3nhL6FHQdRFlTSm178lpnLeS7fibCeu6tCHDEBRzmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iHYH8zlfY8eIy/y1CWELmOOuY268s+f1KGo50ifGO0TXMrda+
	a+oBA91QGh/672nGgBg3Yl7s1QRs+eb0LrtC04YDzyl7WhujBfpj3H/I
X-Gm-Gg: AZFdTZfZ1bFnlppH8NPflZm/7/5Vb0VQRnUbMcTlxps2MBTxJnduIV8rCxy+XnuWrNm
	MEZCKo3GnMoBZ6lxfwvTuK3g5hCxsCNsZlGlPd7RdpFPjobLbp1LpPvhwesAc60sdQrJnwOh7k0
	8zzLUAOO4g7kBZHcn4d2e5kd4N/LjFMSwVhm7iRbKJ+ZPMAkjr+iNMdb6CCqvhyC8qZ0ajaY/cp
	8NJPjCeOYjbmoqxxUzA5Qm9qjChWsufNookajWPZgodepI8LhzpLnj2uC7bm+l9kHp82xGC6H1C
	1jMohKfWimVHf7nMT2dre7l8jwDEr3UmzJOlrVy0SGHI4sc/JwVV7AO/MffGFc9iuZsh7aifxdD
	ACxwylAlpfbegVYUNnt4VMgbwgLfB0O95fyM8kgdLe0iT46vtsaJGmgFgbjOCavxoYmeEMg29Um
	nFpuDDzNYUKo/PzLQ3D4/GxF8LJRschhFfbjW+QLWsIVb5mBO5hTXifgOJbKt6bXINKAVL85ixl
	QyLofgl4yP7ZFuFeXka6y08M+uCXqLikQYwGsHrf3eKZizZY8hkp7TccuEUtPwOGNGrjNg3BD7x
	ifG1ki077FdGU0lYtKymBBI1uIA=
X-Received: by 2002:a17:90b:1a8d:b0:3b3:c4dd:5437 with SMTP id 98e67ed59e1d1-3b3d06415fdmr2730809a91.5.1795001397974;
        Wed, 18 Nov 2026 03:29:57 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d143d69csm3960221a91.1.2026.11.18.03.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:29:57 -0800 (PST)
Date: Wed, 18 Nov 2026 19:29:27 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Peixin Xie <peixin.xie@linux.spacemit.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] riscv: cpu: Fix incorrect cached machine IDs on
 secondary harts
Message-ID: <av2L1MlTWoYI74eu@inochi.infowork>
References: <20261118-riscv-marchid-fix-v1-1-6d677fcd5461@linux.spacemit.com>
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
In-Reply-To: <20261118-riscv-marchid-fix-v1-1-6d677fcd5461@linux.spacemit.com>

On Wed, Nov 18, 2026 at 11:04:33AM +0800, Peixin Xie wrote:
> During early ISA-string parsing, the boot hart stores its mvendorid
> and marchid in riscv_cpuinfo. This happens before setup_per_cpu_areas(),
> which copies the static per-CPU data to each CPU's allocated area.
> 
> When riscv_cpuinfo_starting() runs on the other harts, the copied IDs
> are already nonzero, so it skips reading their own IDs. As a result,
> secondary harts can retain the boot hart's IDs.
> 
> Read mvendorid and marchid unconditionally on each hart, as already
> done for mimpid.
> 
> Fixes: e482eab4d1eb ("riscv: cpufeature: Fix thead vector hwcap removal")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peixin Xie <peixin.xie@linux.spacemit.com>
> ---
>  arch/riscv/kernel/cpu.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index af84b97af3a1..64c0c83eff76 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -197,16 +197,12 @@ static int riscv_cpuinfo_starting(unsigned int cpu)
>  	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
>  
>  #if IS_ENABLED(CONFIG_RISCV_SBI)
> -	if (!ci->mvendorid)
> -		ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> -	if (!ci->marchid)
> -		ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
> +	ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> +	ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
>  	ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
>  #elif IS_ENABLED(CONFIG_RISCV_M_MODE)
> -	if (!ci->mvendorid)
> -		ci->mvendorid = csr_read(CSR_MVENDORID);
> -	if (!ci->marchid)
> -		ci->marchid = csr_read(CSR_MARCHID);
> +	ci->mvendorid = csr_read(CSR_MVENDORID);
> +	ci->marchid = csr_read(CSR_MARCHID);
>  	ci->mimpid = csr_read(CSR_MIMPID);
>  #else
>  	ci->mvendorid = 0;
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261118-riscv-marchid-fix-3ea3672d1e0e
> 
> Best regards,
> --  
> Peixin Xie <peixin.xie@linux.spacemit.com>
> 

LGTM.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
