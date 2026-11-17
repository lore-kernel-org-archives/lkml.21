Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794959855;
	b=OjWo+elAF+J6jGkBTgQ9xxzUss4+W+N74fe8kn/v82xfr9Xrf0zcksN04MJuqCaOBxtG
	 36OcCDaJrzCtM/YMBXUxRsm/062snQ9Y/76L7f62Tv/RWCW4r6zaksrdfs/RnFmsRlWx/
	 sw12MvwwsEf0ik2xWUayylEMY8iHjUfXaT1gsQ6iPNYeWQcgo9woXHmjLvYDz7iFcG9SK
	 /KtOGX7zq69uVEEiil4M0OqMsFa3kKAw2vJZPSa9PVlT3Wju4hQMKZEh/g9t8L5NbRRve
	 LiR7PhA+B7V5BX0225X603cmtcNoLk8RSwIU1doQ5FkchWMMBMh4VGHRKUtiH+xgDug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=q3OTBwL+TyzHGc36tg10hWnQr6i2w3v45IA4aHIlkR8=;
	b=tQxdMz/ssv/4ClGBWlIfNOqJOWY7WjXP1nlyha5NNsnGhxmiIEWQitmnvwLL+idzcofU
	 cAFyUb16EjPrwLTAZANN/JIZFZBdteE14b/xGhgDuFRngr0oUU2QsgzgCh7WKaF/rJ/k5
	 LF0hG9yZgKEVeWdoRjXr3L/imyMJxVEkX+ylSxxi7wMV+1ajPrp+Wim4SoyUuCrabpdy7
	 5HVjJ0bgj2zU1X6JoBnDhRsQOZjYKAHKTSweqrT2YJMIHn8Yf8GueRIJardYoQdiYGFwl
	 FsC9QeXraPOWfi9GWuDzPFqPhNbRIb0Zkg9YTRp5cpfQSSMH/ui8Hp5BL/sN5ycfzUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u7zqySAa;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EE8606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0EE8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u7zqySAa
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-702fd86d674so281645eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794959853; x=1795564653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q3OTBwL+TyzHGc36tg10hWnQr6i2w3v45IA4aHIlkR8=;
        b=u7zqySAaeYlhQpUqV32/X9eVu1RKlum8oNRsvTE0fE9E/aFMffn73Sjoe6uqQ+UtF6
         kFw4KN7mtWw7vryJ8J2BaTVqAinedz5zMu6sBZJux61Y73pSxtRTi2UVibzBDM07DXut
         zQDVi8UZ8hNSRxTub8QfrDLw6lhXILUFeJl9c/rooB1T1Z32GdUzCVlWmA9B6GzU+WLH
         FCe5awUUR1fFU7u/bKBu+Zb0rfEqOR0Hg5KrzgwNbQ58CP4ZiBGle/c+Itb7dkxBoGEE
         tWX1+5H46LnaqccEfkZ5MRv9NaFp9blwOAN8sSC7xlw+fTHzL491r8VuA47VelVm7Mvb
         KYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794959853; x=1795564653;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q3OTBwL+TyzHGc36tg10hWnQr6i2w3v45IA4aHIlkR8=;
        b=N9c2TF9iyL5LWKaQYdJPjb9OisWG4CJ2kCk2b6LvyHQz4HvLkIV75SM8LdI/7HSM7X
         JcwgZzEkb1M9xaFS+HqM3JgTOTaiYnc+0zcEE9pFfHSn9OuFr8emth/dfaSISbSgWMRt
         uumD6ZY1KWrHd9gOBHNVT4fHNlHarQnzAI1KFa5zwcYhgRX4CCfJFQD3LGqa935FCvUU
         1HAplXUDd3YjzNLftZmsnYKr7gTwhYP/V7oxsVZiXiZngdgH9dol8SY0Y5toTs6BclWH
         A8FLp7njZxC38Po8X+Y/oOwYSIt8h2m7yfeiZhNOvDN9ax7CTxgnWCSh7/NmI3c75n9S
         0fgQ==
X-Forwarded-Encrypted: i=1; AL+hErFn8t2UOGYkklLKBBaZt5DUUDBI0xnzyTZwx0CDZ77K+go/2K4X2nADck8xt0EXPOYzY5kN8vSB9rsCRQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YazrwlmS2a1IOaUNbCLTXsroGMx2qDPbruGPD+bxArm0Yecn5
	KAisvgPr2ghpnuf7R9o8Og/QgAWJVGQN8R3P1WKlp8QBh5Ln2RQnV8dgRCDsiw==
X-Gm-Gg: AYBFou0oTfSaAq9UMTM2uKKONP/QpCw2Civx0X7Pj6NSm/IYOu0BRplefdVw/FJ+qkz
	413pWJEeyPWSsVuoqxXV8oKKCWlNhoyboMyFixkvfQJsaLyRGhd+RbO5NJPzBdZmZumYnuCVsRy
	fQA0tzzWEQVJ/8vceZZhW2o8xdQiKNdrrRI3rXS5uoDE4hAdPwdfVMSwP1TGIBg5GLGYx7I/MxD
	oNIq/2FTQdqLjp7n4ckl5PVqfEObYJ5VKTG1tjksZ17zbJiAhfggcmnJsmF8Uq/+MnykXE0U69d
	c2EfHlET/5JQKs7sG+pzgEyFVhDKIzqLao2Ec9F9fEM+qp8HrLMYHTsM6gX8sFehmaiXEr23/S7
	7jvUkPWln3vZUOCDnYpbGqEGGdbjg9plRxYWFMUr20CvvaRLtYL9WHWVofg/8gXB9KTA3lqbMlv
	b0S+/gBtA3OO8AEFJMCYaE/gHF/H+xfBsRhtiVkFPSUvqgZKw25zMUFBGFzce/i68mBdJbWUUZP
	CIwkoqoNqdql4BoXif5E1nx0/8NQBXHIEVzmoj9SYFb6BSTlGA8A5TIC9B7YRcTD9h+5ZoJpt/K
	XAQLDyTVNMYX8C3YijdTHzJkcXmNhqb97YWpPY7yJty9b/LHdFZAq/0k0Enx
X-Received: by 2002:a05:6820:1c8c:b0:71a:e1a9:4b74 with SMTP id 006d021491bc7-71b1859452cmr762291eaf.72.1794959853612;
        Tue, 17 Nov 2026 15:57:33 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:1::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b1945800asm648215eaf.5.2026.11.17.15.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:57:33 -0800 (PST)
Date: Tue, 17 Nov 2026 15:57:31 -0800
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Down <chris@chrisdown.name>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] mm: memcg: fix zero throttle delay on 32-bit kernels
Message-ID: <avznwfoMxq9s2NwC@devbig011.atn3.facebook.com>
Mail-Followup-To: Hui Zhu <hui.zhu@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Down <chris@chrisdown.name>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>, stable@vger.kernel.org
References: <cover.1794902513.git.zhuhui@kylinos.cn>
 <6931674296b98139f5e02821d66ad1855eba36c9.1794902513.git.zhuhui@kylinos.cn>
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
In-Reply-To: <6931674296b98139f5e02821d66ad1855eba36c9.1794902513.git.zhuhui@kylinos.cn>

On Tue, Nov 17, 2026 at 04:04:20PM +0800, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>

Hello, thanks for the patch.

> calculate_high_delay() stores max_overage * max_overage * HZ, computed as
> u64, into an unsigned long before shifting it right by 34 bits in total.
> On 32-bit kernels the store truncates the value first, so the shift always
> yields zero. Tasks over memory.high or memory.swap.high are then never
> throttled, and the reclaim retry loop in __mem_cgroup_handle_over_high()
> is skipped as well.
> 
> Keep the intermediate in u64 so the shifts see the full width, and clamp
> to MEMCG_MAX_HIGH_DELAY_JIFFIES before narrowing to the unsigned long
> return value: a truncated result would escape the caller's own min().
> Nothing changes on 64-bit kernels, where clamping each term is equivalent
> to clamping their sum, which the caller already does.
> 
> Fixes: e26733e0d0ec ("mm, memcg: throttle allocators based on ancestral memory.high")

Is this the right fixes tag? That one doesn't introduce the division by
MEMCG_CHARGE_BATCH.

> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> ---
>  mm/memcontrol.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 84f4a8fd4d16..1ba42724ed1e 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -2576,7 +2576,7 @@ static u64 swap_find_max_overage(struct mem_cgroup *memcg)
>  static unsigned long calculate_high_delay(unsigned int nr_pages,
>  					  u64 max_overage)
>  {
> -	unsigned long penalty_jiffies;
> +	u64 penalty_jiffies;
>  
>  	if (!max_overage)
>  		return 0;
> @@ -2601,7 +2601,13 @@ static unsigned long calculate_high_delay(unsigned int nr_pages,
>  	 * MEMCG_CHARGE_BATCH pages is nominal, so work out how much smaller or
>  	 * larger the current charge patch is than that.
>  	 */
> -	return penalty_jiffies * nr_pages / MEMCG_CHARGE_BATCH;
> +	penalty_jiffies = penalty_jiffies * nr_pages / MEMCG_CHARGE_BATCH;
> +
> +	/*
> +	 * Clamp before narrowing to unsigned long: a truncated return value
> +	 * would escape the caller's min() and look like a small delay.
> +	 */


I think this is a bit verbose for what is happening here.
Why not:

return min_t(u64, penalty_jiffies * nr_pages / MEMCG_CHARGE_BATCH,
	     MEMCG_MAX_HIGH_DELAY_JIFFIES);

Or just dropping the comment block seems fine. I think folks should be
familiar enough with values wrapping around.

Thanks, have a great day!
Joshua

> +	return min_t(u64, penalty_jiffies, MEMCG_MAX_HIGH_DELAY_JIFFIES);
>  }
>  
>  /*
> -- 
> 2.53.0
> 
> 
