Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503376;
	b=deSkIV2YNrO+lnMEJHOlLRr3PMTCorlnhOXbR+q1tBeczxBbLwWD2Xwa0VLS0TiTLmA2
	 mEzd4YtaVYO4nSgtpk6LSvJU0EzlwO7tI/6BdEACPdNke9OJIqPA0eteg4/hmIztXCyxA
	 ChBsB506ntQB+31sgR0Z1OGzqM4AFcflpgwYKYeDkDK4Haw/wX9WmBlMw5ICV6ZHW3PF7
	 uurmz16bl7N8zIwpLmqEAfCUPIJ/sCZ210KCW/a5Gkv1Zg23j6h8Q10RNkjox/tiwARwo
	 nUPbBuYauKreKWAaB1RI3g20n/3xxA87dmT9HZzNH+yVfRS+vHEfNkhNzYLA8g/A1yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=UVO5OB1k44w8QyXiR0HTLo6A7H6lDK9wq0dt8nRl/vE=;
	b=1tkJUQMojlL+u9468DJB2Em8N0E/ESPy6o4kajTIlmdn7n9fGP/372l5jUF2x5Mwekbi
	 aWH8dI5doWELZt1ZSx6CPJA4/2GG7M/dCEftGCN5eqIGeRzzi7vInvENOshjI/MA3lvQQ
	 pQ7NMqO24m3FkClfhB9vqNCqo2mB6GKBXfwihD4oKiNMhVwyNS5tQsoasa8Es1ChFYIHm
	 BWkR9vgw6tKVyWzxR+6iL7kn/pJj/Cqo3DCh27u654J8zZHE1d3e7tBHaOWmEtGuUBwne
	 hlJp2G8ck9uPntdS7uepI7eN8EOrmh5bohhqLrZHVFmjA5UYdItA692RW+YKWd4I6Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b5u3H/Jn";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C646606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C646606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b5u3H/Jn
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3861d608cdcso459992eec.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503375; x=1796108175; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UVO5OB1k44w8QyXiR0HTLo6A7H6lDK9wq0dt8nRl/vE=;
        b=b5u3H/JnbH2I32gH/tcsxgvML6wKhSj8T+IXUKc9yha4JxQDuOIdMYrt2OehCitR0s
         zWbi1pWCFnFC+QcXv65hDxHi5io9eOVeDeIt8PDJndJSfeMtuI7LghrcaV1axmMPyRkN
         woKaqvcJld7a0+RSqlscFNGkaqH113aECJq6Z56liV/8NbdL0S8QCypVCMi3rdKG2VgO
         bQnQChgURvSaQiI8y/s288iZECRhr6ekZeK3hET/6wRGrQCr5IlCKBrzf6U+SOgRcKQp
         No4bAzwvB1XHABiwotbbriZR6E0iGYOkA6/YQq45ym763jOLfkKmBPHqW34nr7rAHlvX
         3h3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503375; x=1796108175;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UVO5OB1k44w8QyXiR0HTLo6A7H6lDK9wq0dt8nRl/vE=;
        b=gZiGEwHBkcEExjQUvXpKCUOJqS49Tbin3rpkk4pr85ZVzgM+15IT4bt8nNKVa65Tdq
         kWUsF0N4FCOCBC9ofS+y9ztxUDnAYYvkrX7WOXQ4IiK3hWncUCibb2bUcb6cNooCb18h
         f4K93/N/DUg+xfmtSkCUOOd47ej0kk22MCuy5YpMW4EfXHzH11pZH3XX9Ho6EvPotxCf
         YMo4cUWugE9khQfq4yn2AXjZDBxkFZj2HLCrexxgd+NuRjAcvcYW8DMgAcIpus0Kn7qw
         ENfHmimgTSoq5nHw1aT61JZnfTQwRwy5zsqsfmK6DGCvH35a3cygI9hZIpcn8NqCSICX
         rJBw==
X-Forwarded-Encrypted: i=1; AL+hErFFstOVX9q8vUTKtcsPWOnYYALSJpfZoyTidyX8lBtXIlbIOGh3Kg0w/mG5EAiTrWW7BwzRKtPuKjjJx3M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PwEh0WOqYJD/HkxALJZKoRm3Gt/NUYohQfHhYnLx1CH9RJ2dE
	bITr6s37ZDkGK7BdAr94sWKHhNx99OSgi1aEoexMHOTg2GsNDYtcDnug
X-Gm-Gg: AZFdTZdwhP1emVSzmaPRRu/R8hMI9AIBDX2D2AkaEpgqus365KUhw12t+zjhZEK6lQO
	L2Bbewa6QMBIQLxLUY2S8b8vV9Fs80IpfQQIqC3xf/3w4DdCD6RIOU1pFkinuvCT9v4shjexOXW
	GC0UHsS2WlJazNltTTJH5F7RVsttGvBdeHgjAiY2PNpS17dT6OYRaTmJRhusYY03dvvT6jV5gba
	PO4xo+FKvJVG7iJqGBw2SDg2+x4ZZGQGP/eB98W1kJiKBCorxHqldHYqhQNjW02smXb5JisJ8S8
	DChrhubtPWWCAh5ZEzKtjsA+dKnXqMbG/UFKNrXWPoUX2DJGqNOpUPLP8ovUu2Mqq90Yn/qrSUr
	NCNrsjB4JTKaYe4CB+gQ8A8mF2sLjnBo7q5vnRqraAWp6b39xEdRbv9w3PTpH2GOHmM057mX3kQ
	MSUUpcbz2L01WKITmv1BJ3bkcwZedwQR8kKFayWZ3+cRUaow0xQwboyCm3ZgNZqi2cbvcuCCsy8
	uYI0+uBaCMWtYCQLGtk2rXeuu9UHpLGELiXDhhrf2eRAb9CVnnGgb+k0qsDBB5R0cZbk3W2Of01
	QQz7qzFtxkwIzFU09ElvSLMJ/ljycMACjnEOU6oqf7Hv5rfOreLhq9a7uCRMuAr6hW2F
X-Received: by 2002:a05:701b:2919:b0:1b3:a881:a67b with SMTP id a92af1059eb24-1b5568a8a08mr19174015c88.1.1795503374683;
        Mon, 23 Nov 2026 22:56:14 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm53879891c88.9.2026.11.23.22.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:56:14 -0800 (PST)
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
Content-Transfer-Encoding: 8bit
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
Date: Tue, 24 Nov 2026 14:56:09 +0800
Message-Id: <179550336970.2385422.4070914679921452831.b4-reply@b4>
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
Hi Eric,

I reran the benchmark on arm64 with pages from an Android phone's
zram export. Optimizing short match copies cut cycles per spanning
read by 22–27% compared with the RFC decoder.

I also tried restoring the LZ4 short-sequence fast path within each
input fragment. That version was still slower than the existing
copy-and-decompress path in all 28 paired runs. Swap-in took about
6.6–6.8% longer with one worker and 3.8% longer with eight workers.

I'll drop this RFC. Thanks for pointing me toward the short-copy
overhead and the workload issue.

