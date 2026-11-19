Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068340;
	b=bk104SIlo/NbffMoa44AaglLmMbb1k+xHA6JEHo+IWencU9OF8kT9bYMxS7jnCaTbHf+
	 Uj2JM3G9nXFlwFZDPKxDPNAeznXnmcJpmr7UyEjeO9hMbudhoBFK+EX1farfiR1Hz+jCC
	 hq0zqf0iFdPrWqrqPI/JnT8GVPNhy8NNMCX3q0yTcEKmqctBc7B5peEng7LhoptqRqina
	 RIuYpvORZLDZlQpyxDm8Fe+UC9cMhCn8id4AqQS7g1AsJ7ZDKtqSqdfPHso+tFqm283qp
	 ywan433dUXuk0g+my1YcSwSfIuszZsScwoFgycmmA6oKDO/NKay7HmwICXceBl4nBKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vMc4aruOSkVK8zcMilxIlqFWJpw0QUrvo9/nbFQ3Vc4=;
	b=NFN5cfeGxByR+qukd4VtpFv+vwhQ00EWonRMwzJWwUhSEqp8Vez4/IXV2FGxP7lxHab3
	 ljizvCC5PJIWkGDUtkbJ8QR3uo4PEkaOUKmYy8r1iLKAfpAG59PQAqa7kbLV41s4nTk/p
	 epROjAqVPVSbXOXS6dDpwMj+Dd2njM3gGzR/NKJy29ihybfieWJ7Ncoy/9xH97KRSm2ua
	 ZedDpOx4jDrmMrCms/QXKgszxZ7z/V2SbvGpPLPUyF97qKKxMxJtWibhXcjD+ZCIFEfFN
	 WLU/Z1Wna/kAevTjk7TGhXzc5+WAvqAfgGWNeCZVSb3y2mttpbxZKEDmlZGIfOpN6NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A2dQMKCq;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4B6606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D4B6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A2dQMKCq
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so16501415e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795068338; x=1795673138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vMc4aruOSkVK8zcMilxIlqFWJpw0QUrvo9/nbFQ3Vc4=;
        b=A2dQMKCq5hAQE4e+OWLtg5zMf/dwj7qGH11IIU2U5GlyJkLH9q6HwDQ4UGljXf9ekK
         zBgl8hkZ8shNxYOUb9I6O6xy5WlxCA3mxRb1ZEbo/pB2HjtXBG3m2SMiNztfiI150zei
         F8cTkFtjBehMl9RLfYcSqI+OBySzrsodcM+wnwAVO8x+JiF4hrVIQ7k01XO/xMcNjfbz
         hM1+l2heDVo5uO7krwj8pl8PMOrwoAUt7w3ChLO31w8IKwCu8mq1WF0rVpOuesM8O0cw
         bVSYaNqzyOcvWXtRb7u0CjZHgQjlCh2L+zThIuqCsB4S3z1OgV/KjamiluABSIFwNxD3
         Fx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795068338; x=1795673138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vMc4aruOSkVK8zcMilxIlqFWJpw0QUrvo9/nbFQ3Vc4=;
        b=q+EBN5Qexb7XAFKyAj0Y1R9wVRTP8tukBTzA/xthNIhzIHocn7GG7Szqvha9LViU04
         nu23YHjCmFAvlRnyGIuhQV80GYZLkwUqPBuSbpaOLUL9IJ/F9dxD1+y9e7jMxO6CmxrP
         WboF/dc54r3cnyVbXgJ8eO6WvP6fnX6P6Yk1i/D3Y4Y9j+SEHi708qZoT7VO2QKwBE8Y
         Qy5xi7HJX6TdnukvR3pfRyqWQmkTpL++Q7FkU2acmfChN9J4obbXEAspQiMINn5x2h28
         M8HTJ9YMcDxvRDEY2B37Hbb4x7J9gGy+7UjOtTUWMPXkUFNTiQLXDZX/GO3ABjJNGdbV
         HbNQ==
X-Forwarded-Encrypted: i=1; AL+hErHJtlkyCC9hJ0NCzJAQLNUSR9cuZ5C40s5gDFhGuldMcLc/wC4UiQsKmqOoNkFIJTH28SBSZCSB9dJIL7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DFdIywu5b+KQWtgwi/ZTF6DjTj76he+LEd4ggc9bm1EQr5Qaq
	DZHXvMiuAiuccQw+tlPkKUkFphiYJFepbyPsKlpi3jjQWqfpP6aHPiq6
X-Gm-Gg: AYBFou3L5zZnrfFLZM0Gk5p31Gb0JtsktJpN+uY5uNJbMMDn3KJsiHbfc+YiAwvi2SM
	fn2iP1fFfPOsUCMog8mF4Bdx7X6AiM1zrmOn2oxdOT90Mpjyi06NwaLp2Fyx+Kr6jZ+oSsFFe3L
	eQxDYyoA3mNdVh0ChsYdlMn75vklTN2ayySEB32vZTEkUFY2MuGeBTXhy6CrEBpLUiYYpuAUGGM
	JLUAk8Kb3U9OThGW098FJVDanDUHUYjQSv3IayOWxqzS8fCZG0cZFJIRFEuBWsFBv5xQKum39j1
	XHs9ZBe7OYZhfTT7hG6AXbb0gvwvsnGapEQFemqVTrg3qDSoze3pA1uFwUbP49tP416eiN6KSy7
	D8gjxHS0OII7tJxBZmS9VOhoWoStR9E0VUilD4Ielo9oEO5zRSays+afJLq/FlA0I6SsW+iyc3I
	OZ1f9vNR9MrRo9HsAhVyuKhjBJXKH8pEnU5GdxqR9jsp4UG0VwurIsvSlE8uw+mO9oWpVa+HR45
	uUQt/KiF02BiU/5Qb9Da9lQJcHmDGwiQZqp7aWOcXyMza1+oG2MtK8yNJyy5aBwvqsF+t3ZOEF5
	qyFUTZAiZ0UjxHanwLluMG2TkwTt1Ch2uzNElaQ9jvjQeTlpR9fnBl5p32T+47DfUJ5zYVWuaDs
	TBOOhIshYog==
X-Received: by 2002:a05:600c:1f84:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4bb7da236c3mr89793525e9.24.1795068337735;
        Wed, 18 Nov 2026 22:05:37 -0800 (PST)
Received: from localhost ([77.237.186.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2ecd0sm9324322f8f.8.2026.11.18.22.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 22:05:37 -0800 (PST)
Date: Thu, 19 Nov 2026 09:35:30 +0330
From: Ali Nasrollahi <a.nasrolahi01@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kees@kernel.org, nathan@kernel.org
Subject: Re: [PATCH] x86/cfi: mark cfi_debug as __maybe_unused
Message-ID: <av6OwOx3psCYzS4L@zephyr>
References: <20261116173027.229752-1-A.Nasrolahi01@gmail.com>
 <20261117183505.GL1813469@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261117183505.GL1813469@noisy.programming.kicks-ass.net>

On 26/11/17 07:35PM, Peter Zijlstra wrote:
> On Mon, Nov 16, 2026 at 09:00:27PM +0330, Ali Nasrollahi wrote:
> >     When CONFIG_FINEIBT is disabled, cfi_debug is never read, but
> >     alternative_instructions() still resets it after calling
> >     __apply_fineibt(). Clang 23 diagnoses this as -Wunused-but-set-global
> >     with W=1, causing a build failure when CONFIG_WERROR=y. Mark cfi_debug
> >     as __maybe_unused to account for configurations without FineIBT.
> > 
> > Signed-off-by: Ali Nasrollahi <A.Nasrolahi01@gmail.com>
> 
> Does something like so also work?
> 
> ---
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index efbc11f8c336..9bfc36566e17 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -1195,9 +1195,9 @@ void __init_or_module apply_seal_endbr(s32 *start, s32 *end) { }
>  #endif
>  
>  enum cfi_mode cfi_mode __ro_after_init = __CFI_DEFAULT;
> -static bool cfi_debug __ro_after_init;
>  
>  #ifdef CONFIG_FINEIBT_BHI
> +static bool cfi_debug __ro_after_init;
>  bool cfi_bhi __ro_after_init = false;
>  #endif
>  
> @@ -1894,6 +1894,7 @@ static void __init_or_module __apply_fineibt(s32 *start_retpoline, s32 *end_retp
>  		break;
>  	}
>  
> +	cfi_debug = false;
>  err:
>  	pr_err("Something went horribly wrong trying to rewrite the CFI implementation.\n");
>  }
> @@ -2281,7 +2282,6 @@ void __init alternative_instructions(void)
>  
>  	__apply_fineibt(__retpoline_sites, __retpoline_sites_end,
>  			__cfi_sites, __cfi_sites_end, true);
> -	cfi_debug = false;
>  
>  	/*
>  	 * Rewrite the retpolines, must be done before alternatives since

Thank you for your review.

Regarding this:

>  #ifdef CONFIG_FINEIBT_BHI
> +static bool cfi_debug __ro_after_init;
>  bool cfi_bhi __ro_after_init = false;
>  #endif

FINEIBT can be enabled while FINEIBT_BHI is disabled, for example when
rust is enabled. In that case, the declaration is compiled out while
the uses remain, which naturally caused my build to fail with an
undeclared cfi_debug. Maybe you meant to put it under under
CONFIG_FINEIBT instead?

Additionally, I kept my original patch limited to the warning fix
because I wasn't sure about the effects of changing the reset. With your
change the CFI_OFF, CFI_KCFI and CFI_FINEIBT cases return before
reaching the new assignment. Wouldn't this change the behviour? or
perhaps that is expected.

Cheers,
    -- Ali
