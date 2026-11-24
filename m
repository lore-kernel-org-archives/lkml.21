Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505589;
	b=Jhp3Srg7WIMy1hMIS8XElVHcArR3G00Aa34iT6rNExxXDkcCDRGbLhCgkE4fgz/lezZR
	 hYnc+42WJ0Thl2jhC1BEck0dbCGzGHdBk1Uuv24TlRc/MhZHXam/yOmn6mxxMEotIafZk
	 rETYYM0gZuVv6cePUqD5M8P1WInGZ9NaoctgWdOjSTOBQ0YcEWABLT+snbXsp1/xsEcOs
	 TCmhFlQKdcNNGuxU95QAbYmbQUo3nyOcQ2gty/0PljTCnn6jQxFqGxomL9iMzR5WjbFdV
	 vPSnCtbR84EVOUopDuLXNm4TczFfk71Ti9iNnjycu+jjtgjLywvge8Z6mQ6rRc4YDmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=TAMfOuNFtblDQEnaf3fqBx0suItcSS3DJ/gNPv6O2+Q=;
	b=oR+oLF2x+eF9Qs7AUqez3OgqqPJCvIeS0jCkUIrJ9R5uc6ZcIVQnAzmU92mk5RyTy+Rz
	 sWPO2XUPaPvH2DaEyHGbUpZudPljp0qiSeFxeAllTIuW/uEy32hI5Pm4+VTviboVRLdx3
	 jPHym9YLhmXhjcnZS2+SsFoGeABQch2uoCNJu9wmGPYZpguT5wXbzXjqE7s5SXiYwXZxG
	 TDOEewN7pBC4/QUBVMmKSZMZBr2DOhAji3gmRUcutUAN4vpVfMW/T+AfaVLF4KY6CMYDb
	 MF8W/RFv5O6xbAA/VblDVXI4z4dLcHf9wqqUKBSe+EIsdUX4mjF4NXu/g0s+NMuj1Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Fpd3dPh+;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CCE606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2CCE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Fpd3dPh+
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3869f03af6aso3410084eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795505588; x=1796110388; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TAMfOuNFtblDQEnaf3fqBx0suItcSS3DJ/gNPv6O2+Q=;
        b=Fpd3dPh+c6x4LvxCk5WLrpb/2qKK43kRNoHM/prHUNmCE6nRIBkvq0qdPwjBEl3+BR
         ZlAMrMXHM8ax7dtGxnoS/bNyXdhcthaNbv2Ws83Toyvhs6dQpKsfSa7gQhCZa4vCvZ/W
         GkkoHGs0YviwI6T6YP7PDAW6pcTQ4O/rNz9Qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505588; x=1796110388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TAMfOuNFtblDQEnaf3fqBx0suItcSS3DJ/gNPv6O2+Q=;
        b=p27xoBASjHsbBHHk+mxviDHWO/3mZZLmjCP4Sk3ClFr5s+TCcGQag+DO+ohuaxspYF
         PZPLYeXuS3GsqKVJ16kWcqH/0wbB1yPhwhQuIoHVt8/CRNWYNLQ2F6C7Bx9pL6E++CA7
         b+T9hfu8/HtwMebve7EZFaeVuwT0yoiYSCK0DWKwk9RDagJLsxxGYEnNa78TkIEySoKx
         q4YUXVf97ALnqnLczZnyUBMH+fONcQo6GQ572Gt7Xt9u7a9qGxMx0aH2yjAbj9bJqUNd
         /vxjLW8OgZp/LlBqpdmllmeQZBuRhXuk1ssSJNrITPDDlY/R30CnDqjcz020Ot6c8Jcm
         K+cg==
X-Forwarded-Encrypted: i=1; AL+hErFbBXVNp8IuaT4zPDLsbHbcR0NRP7Unapiqnhs2hERPtTOYpmms/qThEyYopJ2OA5Nv13ta1YTCE3F8XBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DQIc7IGRtgegRDIT5kGzMgZBfa5FVeeapq0c7ZjMm8V96m3Dj
	Mim5z8b6Qqe2O2rTgr2exnNcbJ+GcZgNW0/AutZj7ifqrQhlSpbKbc1GSLQ4gc6tRA==
X-Gm-Gg: AZFdTZeeIQJtmqfA06HRwVLkv1aHPtybdmcvELLp+dht+jJdd2dtki+Ixp1eH0kgN7Z
	063Ltc2ucSL9qRdq2u+Rl4neqlZAZZemcoK69UXR9EClwnN35Cd19NQunO6dcuo9RYU0PwhH60o
	KsKJkh1+UQ/4E87VRa87F533K3RYWo6WhFM6Hw60UBj7qPBAK53B+yOcAtepjpkkguu9r9+OkF4
	qDefROC6WyQw0zd11G7t0zrSZr+8JPpoYOg4O5Ql2kO5wXC2y2fkf1EV5V3tsejD4QmW8he9p73
	HlCL/5yWbpuvWK4797jQiaFxQ0EM5sO6UUqeQpXc03aLXwStjz7haMLXXAPKTQijx2F4iRXWCZI
	ztkCSGjndCBGKjUYZWuqqlMaMEbs3+wocDA9eQ2MlYltTeSoYyPdmsX7KQGjJJzrqw39f7zjiD1
	+w8XO6mwNwA0JtXo7bh7aMTmvqCH5bjyfYxFZyvaUvEUOYnNC5PcjwT9VwjnLVrAAa3vF7lGAgt
	AHBUlSx56/q76+V/t5I5IF6mjbxD94HMZknd/KT1APZ62hppOYZapmtPb4Lp2BzYRNw9z3RB49d
	kp6H1UEOr4hiqVxsSDygNkm6eu1TpWnqg9X6MHbIfwOzuMe/rA22euK6IiSyknjui3V89O1S64J
	tFYun9SQURfW/sLg=
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr15452668eec.7.1795505587840;
        Mon, 23 Nov 2026 23:33:07 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:d159:d585:9ced:38ba])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm48387343eec.26.2026.11.23.23.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:33:07 -0800 (PST)
Date: Tue, 24 Nov 2026 16:33:04 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org
Subject: Re: [PATCH RFC 0/3] zram: avoid copying spanning LZ4 objects before
 decompression
Message-ID: <awU9ZqH74dletoXh@google.com>
References: <20261122-zram-split-decomp-mm-rfc-v1-0-4e69b08c0fed@gmail.com>
 <20261121201511.GG1975@quark>
 <179550336970.2385422.4070914679921452831.b4-reply@b4>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <179550336970.2385422.4070914679921452831.b4-reply@b4>

On (26/11/24 14:56), Xueyuan Chen wrote:
> > LZ4_decompress_safe_split() isn't actually very well optimized.  While
> > it avoids the copy of the source data into a contiguous buffer, it
> > copies every match and literal run with a variable-length memcpy(),
> > which on most data is a very slow way to implement LZ decompression.
> > 
> > I suspect it looked good on your synthetic benchmark (pseudorandom data
> > followed by 0's) only because that tended to generate 1 very long
> > literal run and 1 very long match.  Whereas normal data would have lots
> > of interleaved literal runs and matches of much shorter lengths where an
> > external memcpy() call does very poorly; that is why the existing LZ4
> > decompression code does not do it that way.
> > 
> > To some extent the literal run and match copy performance is fixable
> > with a better implementation.  However, having to handle two different
> > source buffers still introduces overhead that cannot go away.
> > 
> > So I feel this approach is probably not worth it.  If you'd like to
> > continue to explore it, it would need to be tested on different data and
> > would need to be properly optimized.
> > 
> > - Eric
> > 
> Hi Eric,
> 
> I reran the benchmark on arm64 with pages from an Android phone's
> zram export. Optimizing short match copies cut cycles per spanning
> read by 22–27% compared with the RFC decoder.
> 
> I also tried restoring the LZ4 short-sequence fast path within each
> input fragment. That version was still slower than the existing
> copy-and-decompress path in all 28 paired runs. Swap-in took about
> 6.6–6.8% longer with one worker and 3.8% longer with eight workers.
> 
> I'll drop this RFC. Thanks for pointing me toward the short-copy
> overhead and the workload issue.

Oh, I see, thanks for the update.
