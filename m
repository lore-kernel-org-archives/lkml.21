Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795312748;
	b=BxsO4FzFqwnJ8KqJ1YlPtOEGHBsb3T4KgaZjDotz+c921Ps4Rd5tsKFM18+wk60N8qd4
	 6M1RwBDguDxKhgQqPIGWdNbgahkwFNU8iiLW6qmMQnnZPgZUEbBY4m7mO612XXMQzxUWr
	 +1tCdgvw5PZIaGWuUJHmtoxhKZQ4kzqGgQeIt+DWDb5gl8cfgOb76NoBWOB70lXyoH2ob
	 cZJYJOeRp64PDN1Q4Selk2+rW0WxcQtq614I7mZHSrezCiGzEuD5fnPIACKJXNd+2jbJA
	 Q58bzvmz8zXl6swArQ9Ja7EiRQVKJurJtlrWKxoEg0YYtEdT3TlFqGCbYqP+dg9QvoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795312748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=pfjbw67htTtalCIVH+0nx+HlV0pTaeMozQ67+kkKxbQ=;
	b=fFUhr320YhzVSKwUGNHjtVLkhApMideGFugjTkIx11ZcDVh9rXauGWTNiT4f5oyDd8dn
	 8SJmX31LGrYJgwTvtjznHuVETXkvS6ZKZ2HYeQv7pxYAYtzUbUC71fZaGfRnPoDChQ8Ck
	 Z63qb1OHPZStzcjlu0J6uR3xwwIhjllV56wOw0+V6UlMjAI6Hw1Zw0WJ64khWHxpCICFE
	 5tMDgQl+JztGfWae2Mg38TsplAL2xGXjT1wlaffLpDdyDjXtFm6oq93saZoDFvZfkTevG
	 cVBkTyRPWJizZN2P5oqPd20o6KHfIQiO952MtB/76IgNvo4bbKiGCzA5oJmeV2l61QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YsDGSKt7;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A4E606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 01:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1A4E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YsDGSKt7
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3830e56feecso33594eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795312747; x=1795917547; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pfjbw67htTtalCIVH+0nx+HlV0pTaeMozQ67+kkKxbQ=;
        b=YsDGSKt7+wZS/g934zu7cIPv39C6J3sIMD8THQ/X6GYzyVZHvAk1y2W0wBH0D00n8T
         ewz78xhSzTP+Er+WmczIjvvqmlO3KJHM64GG5NnvewARGXS5CFmEUd8rO9zcjlLK1Qnj
         sTsceH5OZ9QsoSQX/OLkuI53zkRAevkt/sMwMu49TejcoZ15/uHCACRg3+rtALTjd/aj
         1nDs7+12762c/7gbCDJAHkozcJNRFrOjt4Kiojd7ayJQMALHwyIHoA3wbNVWRVcg9WIB
         GXJmedAbHSLVhpxu19WLUSDYzdqaeq9Bnwgbmc7nlYEPvl39EJj8zbRvg64u0QTY9Xsh
         7Dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795312747; x=1795917547;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pfjbw67htTtalCIVH+0nx+HlV0pTaeMozQ67+kkKxbQ=;
        b=MXSQluzyvuvzm8fDQ39Q4RM2WyFQc0+LNjX3DpDRyd6Cr/nCb/qwyzHAI6Rkr1F6gH
         +nt/vG76utLg0M9M7xGT0D372sNe17ai24VlY6a+i5p/YVx7ZagDbFZabCAk0fW8Q2tC
         eAV1Al2xUFsazyGcDeKzOAHZZrLWUkSjkUqv8MZYjT71+CcIGQtDd0E6mOka7JND3JA5
         aFU2fg5CJ2+N4IrJUHoD5GPzhGCmaZuC3nlagOsMIs9lY3dLvbFy+h2YWdGg+qRBX1/1
         SVer9jgD/W7U+YTXfFZqgQS0oT2oBb5iOYrl5NTOoGmMztlc5zWLseSlpUVcDPm/dqjQ
         cszg==
X-Forwarded-Encrypted: i=1; AL+hErH8R3gFdUIeO8/q9GPZFYzLbgj2lem6QKvPsBLlFrUNhGTGFfxm0yklyY4GNvl2Wrt3iB/TQ0wyE4hja3I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YX4LAz6DPW3Vt8c1Y76TAQkvbXm1r3+54AHrFp5rS3vZvlyu/
	jh9wsKWgHr4KEA8ozWxEU8UpmC5QL5gcIf+u3b2kELF+PS649AKz6Wae
X-Gm-Gg: AZFdTZeDVjLGewUZouVHUheu8m1gZQQt0ZhcbQuICbtHj0q3t+c5psikI9+9eCdJQ+f
	zhnvfnZUwhye9cE8qYsyrDVeF6AqNBHU/KIGZzJWba3CFV64cjbn5xMKtk0U8MBrKTLGzG6NYoH
	Z6afj+Kg3warPwv9NQzqqfO0YaXwGciKu7VMn5QQJ9cOfOmD1d/6rRxSSPCr1N04b9E9EFHoOeu
	AYKinRpiAyG+qKIlRz4PxSJOVXX7IGg3LfGYSdDYEa0bffyuomZSOBlbMQ4wF39LEwL/8OpuDZW
	Kca6whTN9+SAsmridhLLNoQ3xEzccZNT3Lv0iX5oQDeQCqkaWrZA/P6rQq5ChOsPALw6YXTdBLp
	zTOcxh+B/j+A5e8fC3kO52Bz4gNtvUaIiTDjBuYbyszjTV3e4WCYNR3JCe0VaP+OBdGljDwQWlN
	LiBgcBHS2h3wqRXgm0dLXdIgUESt/BPAW/vkc8mqPonsE6ntUsqnGx7gDIATJNO5ET6fN4y+VAj
	hG5bmjiq2dSOdV5fUs5pvqk6WMKB08d7rIuz7miJa93CGUgWMb63T0d3GqxavL501OXToIU1/bL
	wZuRZaChXj1jYqu0UFKe/3qGOp7kOOS5DTwamtFuy3jboP2mNDKgd2L7BMmUDdpfuPs=
X-Received: by 2002:a05:7301:2624:b0:385:1a45:47b3 with SMTP id 5a478bee46e88-3856e24682amr12308740eec.1.1795312746575;
        Sat, 21 Nov 2026 17:59:06 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm15055243eec.19.2026.11.21.17.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 17:59:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC 0/3] zram: avoid copying spanning LZ4 objects
 before decompression
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, 
 Minchan Kim <minchan@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>, 
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
In-Reply-To: <20261121201511.GG1975@quark>
References: <20261122-zram-split-decomp-mm-rfc-v1-0-4e69b08c0fed@gmail.com>
 <20261121201511.GG1975@quark>
Date: Sun, 22 Nov 2026 09:59:01 +0800
Message-Id: <179531274171.2385422.15680036128312823906.b4-reply@b4>
X-Mailer: b4 0.16.0

On 2026-11-21 12:15 -0800, Eric Biggers wrote:
> Hi Xueyuan,
> 
> On Sun, Nov 22, 2026 at 01:09:23AM +0800, Xueyuan Chen wrote:
> > I measured the time to swap in 1 GiB of synthetic data on arm64 with
> > 4 KiB pages. Each page started with pseudorandom data of one of 16
> > lengths, followed by zeros. On this workload, 32.6% of compressed
> > reads spanned two pages with LZ4 and 34.4% with LZ4HC.
> > 
> > The table shows median swap-in times over seven pairs. The last two
> > columns summarize the percentage change within each pair.
> > 
> >   Codec  Workers  Baseline (ms)  Patched (ms)   Median   Range
> >   LZ4          1        1403.81       1344.45   -4.21%   -4.64% to -1.61%
> >   LZ4          8         222.57        216.36   -2.73%   -4.19% to -1.97%
> >   LZ4HC        1        1403.35       1336.99   -4.74%   -5.07% to -2.90%
> >   LZ4HC        8         222.10        215.77   -3.16%   -4.39% to -1.27%
> > 
> > These timings include both skipping the copy and switching decoders.
> > 
> > I used Codex to help implement this series.
> > Do you think the swap-in improvement justifies maintaining a second
> > LZ4 decoder?
> > 
> > Assisted-by: LLM
> > Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> 
> LZ4_decompress_safe_split() isn't actually very well optimized.  While
> it avoids the copy of the source data into a contiguous buffer, it
> copies every match and literal run with a variable-length memcpy(),
> which on most data is a very slow way to implement LZ decompression.
> 
> I suspect it looked good on your synthetic benchmark (pseudorandom data
> followed by 0's) only because that tended to generate 1 very long
> literal run and 1 very long match.  Whereas normal data would have lots
> of interleaved literal runs and matches of much shorter lengths where an
> external memcpy() call does very poorly; that is why the existing LZ4
> decompression code does not do it that way.
> 
> To some extent the literal run and match copy performance is fixable
> with a better implementation.  However, having to handle two different
> source buffers still introduces overhead that cannot go away.
> 
> So I feel this approach is probably not worth it.  If you'd like to
> continue to explore it, it would need to be tested on different data and
> would need to be properly optimized.
> 
> - Eric
> 
>

Hi Eric,

Thanks for taking a look. I was also unsure how representative the
synthetic workload was, so I was hoping to get some feedback from
experienced kernel developers.

I'll collect 1 GiB of data from zram on an Android phone and rerun the
swap-in benchmark with it.

