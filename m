Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795318806;
	b=FHLJgglen4SqGEyi+05vF5yg7OHOHcAeHGxZI6isUek51isd7J/AXhXJqhBXoiD7ln1l
	 EppZXNjc3mhF5YkpjS77d3uCy+tKSHfr2t98te4O1YcX3r0W5fLJWGUshYCSlMzy7gtNv
	 PRw8kkJawA0lNdjKC273s9jajwM4UuZ0xD0uy+bJOz5p3DFPjKlDjbneiLsWscQtoN1am
	 unuQMp/pqfpofVMbZq6aNWdHYnFxVLck3BFJ5RweUmUi/x3PxMwAkrtAEGcVKX3Dfc+e1
	 9oTMn9BkAZUfl84vGPZUjzEMbACbVL7rlmbX0ZeR8BmhGf5deuueSlNf0DmSPrvqzbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795318806;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sfwVFwLVWPpmFp0FkgeCqGBnRdb5nlwL2+g7uc71NhY=;
	b=F/+ft9Zbgf7imPSpQ4HHIi51Ji+kxiKq7ST+KYGnZ3Yn0Rie71XLnmvGKANWvPRGj0Zn
	 EwLUSW+z/dKQXi4/NkH9SK3qVgOxEsLqLE2bNWGl7wvJXZ4RFVB6qjOkAlloF53wgqvoQ
	 iOza8vLfVoHS/GwDi2tmNwxVdysjC2SXxAP1c1xYWJkuf+cBfMZmNVfblfzGuxMaGF7xJ
	 j3t7U9b9iyK6iSFyBobVRqP1cJdvhQGlEB8CwJsO61w+jsWqVMmqGeIJpekBESg5b0PbD
	 HWJNMqxUUfqd4myTrcc6B0iT0cY3m3K14PnPiT1IKg+cRkhB3IQ0w0MW2bimRwpeRdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L1/jrmk2";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CAD606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L1/jrmk2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066771F000C0;
	Sun, 22 Nov 2026 03:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795318806;
	bh=sfwVFwLVWPpmFp0FkgeCqGBnRdb5nlwL2+g7uc71NhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L1/jrmk2ENUXu7mvXiy0YbnEl9+3lZrx2fTilzLCDoxAhkOi6wT8o+uDWMQcBpELo
	 brJrTBPJfqASsak0w8sSXn88708yrQA/37r8h8jdeaEkWBzBUTJqwgKd8sQC5QnI6l
	 lflYzpVfp1bzdC6MVLZVc9Ud85krTyu52K2y3VFykgnzvrEGtdWl7zflXA1tgTh0rq
	 cwMPD+fcEaoSLFyuIAHMDpSaTaFX7FT00C/BWGhcEwv4w8SVw3Cu1rTHfwmkcvnaIF
	 Kqest5iPmEQIvApG77XpxSaagmrKJKjCfCen3fBI2z5v8yHp80ot64I66YjkJpDEp8
	 EGros6akT5d4Q==
Date: Sat, 21 Nov 2026 19:40:04 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, leitao@debian.org, 
	keescook@chromium.org, hpa@zytor.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/6] objtool: Add instrumentation_weak()
Message-ID: <awJjRvCwceyMA8Nw@jpoimboe>
References: <20261102112549.714541309@infradead.org>
 <20261102114000.552033727@infradead.org>
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
In-Reply-To: <20261102114000.552033727@infradead.org>

On Mon, Nov 02, 2026 at 12:25:51PM +0100, Peter Zijlstra wrote:
> The strict pairing of instrumentation_begin()/instrumentation_end() gets in the
> way of tail-call optimizations, since it requires writing code like:
> 
>   int bar(void);
> 
>   noinstr int foo(void)
>   {
>     int ret;
>     instrumentation_begin();
>     ret = bar();
>     instrumentation_end();
>     return ret;
>   }
> 
> Introduce instrumentation_weak(), which is like instrumentation_begin() but
> does not nest and does not pair. This way one can write:
> 
>   noinstr int foo(void)
>   {
>     instrumentation_weak();
>     return bar();
>   }
> 
> And get tail-calls without objtool getting upset.

I find the "weak" naming to be rather... weak.

instrumentation_begin_unpaired() ?

instrumentation_enable() ?


-- 
Josh
