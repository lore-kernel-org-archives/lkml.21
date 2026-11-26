Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705261;
	b=evFjlqtmDhrGzOFuSHj1L2m91nRpYUuEVUS9FFjiFIM1irONcY71Hs8OLn27ben7szI7
	 NFtaJt7DaIC1BjbLwL25yczIETkzGmOXKsov2LtXS6NFVqxZ1mRj/sSaK+5Eje8ZYTB8f
	 ONZFXIIK5Spa+qTHpiX7f58hILOfPY4T2YH7/eO0vzDx2dXC4LZmcPfSR2zoEXkxyOXu3
	 ngyrphpzYvKg2L8XVFm1rHqvJesd0i0xGfcGMwYfq4rZIGJC2wadcpp2qd8JBXFG63vV+
	 xYIfK1bx7k3M5uxitSyfoeZBepEUgNNRroLLyFFED0GoUgqIjJgCJWpNLQscHPebJjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9KeWf6go4A5Nn7MqAkyc2ajXlZEzS7uSzF0B6BvUuPg=;
	b=GW46yUGv5RnIQIBn0xiQQTqzuEpLmTNxFO8izkhvzKuQihr0AayQHLU6CBGUqoUg9W2Z
	 gYiCWv8RWN0HE+oBduMV6Q51OUY6Y41CCxsljRUKO/HJPpmdmRPI+PIEYIEc6P1S+E2d/
	 jaLlFVKP5n1dtRqD33DBr6U23JMg2Mzs9AZQGWKtJXgG/uYg1jm3as1fmMVj7YEUcgHNJ
	 XE07Ukt8rS+0Y8U1rpc7K9islUZsH8V7Nx7eb91DjqV2SJQNosaeFfaNH7Z6Awq8OaSuR
	 i/PWW2ASKFLs8SyjLZwgr4Lp2hEEM/rdgOQbhCf6o96V2LIo06z5+YFxBP7D5IIVrEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CNop9L7X;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5252606A331
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5252606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CNop9L7X
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so68122625e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795705259; x=1796310059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9KeWf6go4A5Nn7MqAkyc2ajXlZEzS7uSzF0B6BvUuPg=;
        b=CNop9L7XM39/VsHEvl8RDGzGBl45OJoHsrvNZZ5btiHAyeJkp9djnBiXrbpzVX2/Qn
         mF2Tk+w112peuM7UKUIa9U0O/cAJgah75TK9Nx/2yaralg4tXYGANuIBQXHTbey/tHCK
         4aaXcPR2ZHlgppi0FooEArvUs54Hw/+RZ5si2JH7eNfiQBs4nkQ6PTTlHYMw0WjG9vUp
         dEGLMyF+9guc8WFBu0VNcrlC+hm8dYzrpkOlkpeyygKVCaBCOVLO4ROO+sk3hn1W/Gdd
         TLTfUTfdsGEdZVNuEYPkUbu/LHLV82mgJYCwIr9n4r4/lH3dxRtcaJvN+zCqmgx288TI
         5FsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705259; x=1796310059;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KeWf6go4A5Nn7MqAkyc2ajXlZEzS7uSzF0B6BvUuPg=;
        b=nRer7aFQTZ5IehapovnEy9a4tUM6vuykvV9X6poIInsYl7qzpKztUSHSx142xTaM7N
         3GWeZ7dkkwHgg/cxNJZHuzmf4pXWNT/Rsujcs7PHxt3J9ZTFMmcjs4HuVlcSlduLmapd
         bhTxU9iLCAejCc7B99YKspshAKaitbQ03u8dM1YaAzgiE2yAGtSeIGHoQ6gI4JGo/ZQz
         bUap+6w3ord4hyiUH3q4rGqmni03CZscEPjK1f57WDEw4URjIUmHMddmdRlEZV0GqmJM
         f8gheXgqKCi1udO9x38eWdFNMmxurjqwuSWXjhD2bddXxptuOOEkwlS8bxI4cFXLTaxr
         wrKg==
X-Forwarded-Encrypted: i=1; AL+hErFLRhzkfxo6xmoSGRbdUncF5zxXuJKwMQX0HrVrktGqamHMtcEWLKDaIPi/lEjsgQvasJXDZ/7cCRXek9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nfRVs6cpiVlwBd768sUVaASNbnrrxT0igODHYziu8ZKNnN1UW
	AFd3fJatAFt/juSBFq81op2AaE7aD7zWpbgCsu2KQqo5Dyx3iojaGQVLBZBLafCmi8Q=
X-Gm-Gg: AZFdTZcbncV6Rb89VTWQidY1MrPOlQlctLE/o+KYs2ijVKu4azG/xMvBnEHWpFYUEYZ
	5FWbBErXjArpgjEzPJOBhSgKQOC4Y5duIOueWzZXS+qkB6W3iKa/6hzerC3l9dhFJ7jN+DoJJ5R
	GrUu22jhtZIrAzstu86/CFNFanvpZ2LRwj4u2snQnlJRZWeUztRaMJRanEQDdLY7LjbLtOSLDGP
	NQMeiK6pFhtCEI65fwgHBIpKwdz9M53I0jV3oeu5Ag6tiCC2QaEBNMByqBuuUcWKdAGgzz2KS/S
	h+bIIa6TGfvSBiMVJi4Wqyz79bySx0XIi+lMVfl35/4k1hy7MMaphjXQSrC2a3XOneigYezNtv9
	VZV/499+pbdackGDo2dFSuJ3mw6PtU9RI0g9weqRuO1QKU8SxQD8BFQ367ELf5Ju8soLAVwKNL9
	DkfttCeCWLHeBtlksTa129U2k9yHfw+mSc58I7P8BaXM5ecxBKDWZv8Fg97r68WUTqdA7kiCKd7
	gamY/oM+94WFOy11l9TliRnDokpNIPw8KYB7Fk2TzE+0xgyzAwrtGaY1ovupD1DInsBrB+kK1gA
	mQROdDp4SeeIQ48veMp8+Utx3bjHjdk=
X-Received: by 2002:a05:600c:5246:b0:4bb:60ba:49e0 with SMTP id 5b1f17b1804b1-4bb88930707mr458102315e9.26.1795705258195;
        Thu, 26 Nov 2026 07:00:58 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm631523885e9.3.2026.11.26.07.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:00:57 -0800 (PST)
Date: Thu, 26 Nov 2026 16:00:50 +0100
From: Petr Mladek <pmladek@suse.com>
To: jim.cromie@gmail.com
Cc: John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jason Baron <jbaron@akamai.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org, Philipp Hahn <phahn-oss@avm.de>
Subject: Re: [PATCH] printk.h: fix overzealous pr_fmt in pr_debug_ratelimited
Message-ID: <awhJooa6HkPoKqSH@pathway.suse.cz>
References: <20261125-pr-fmt-v1-1-3ff6832f5a50@gmail.com>
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
In-Reply-To: <20261125-pr-fmt-v1-1-3ff6832f5a50@gmail.com>

On Wed 2026-11-25 11:12:53, Jim Cromie via B4 Relay wrote:
> From: Jim Cromie <jim.cromie@gmail.com>
> 
> Historically, the CONFIG_DYNAMIC_DEBUG implementation of
> pr_debug_ratelimited() passed raw fmt to both metadata and runtime:
> 
>   DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);
>   if (unlikely(...) && __ratelimit(&_rs))
>      __dynamic_pr_debug(&descriptor, fmt, ##__VA_ARGS__);
> 
> While descriptor metadata was clean, emitted dmesg records lacked the
> pr_fmt prefix present in the !CONFIG_DYNAMIC_DEBUG fallbacks.
> 
> In 2015, commit 515a9adce0f0 ("include/linux/printk.h: include pr_fmt
> in pr_debug_ratelimited") fixed the missing prefix by wrapping fmt in
> __dynamic_pr_debug() with pr_fmt().  However, it also wrapped fmt in
> the metadata macro:
> 
>   DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));
> 
> This causes two problems:
> 
>   1. Build failure when pr_fmt() expands to multiple arguments, e.g.:
>        #define pr_fmt(fmt) KBUILD_MODNAME ".%s " fmt, __func__
>      Passing pr_fmt(fmt) into DEFINE_DYNAMIC_DEBUG_METADATA() expands
>      across the comma in DEFINE_DYNAMIC_DEBUG_METADATA_CLS(), supplying
>      4 arguments where it takes 3.
> 
>   2. Metadata pollution even for single-argument pr_fmt(): baking the
>      prefix into .format breaks anchored queries such as:
>        echo format "^foo" > /proc/dynamic_debug/control
> 
> Drop the pr_fmt() wrapper from DEFINE_DYNAMIC_DEBUG_METADATA() in
> pr_debug_ratelimited(), restoring consistency with dynamic_pr_debug,
> dev_dbg_ratelimited, and net_dbg_ratelimited.  Update
> lib/test_dynamic_debug.c to exercise pr_fmt() with __func__ in
> pr_debug_ratelimited().
> 
> Reported-by: Philipp Hahn <phahn-oss@avm.de>
> Link: https://lore.kernel.org/lkml/a5e3c89fe5f4126873d58dd3472e66c56550ff91.1773779753.git.phahn-oss@avm.de/
> Fixes: 515a9adce0f0 ("include/linux/printk.h: include pr_fmt in pr_debug_ratelimited")
> Cc: Jason A. Donenfeld <Jason@zx2c4.com>
> Cc: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Looks reasonable to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Jim, should I take it via printk tree? Or would it be better to take
it via another three to avoid conflicts, please?

Best Regards,
Petr

