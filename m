Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020806;
	b=LmBf8dSKUm1wcWE4rwRnb8yzud1UgGcJfVshdim8yRfXSHYKF+IqsrsI8ctc4a1m9FQP
	 zmbp4Qpy8cF2pEY9gr9Q+7TYtbRPVD+3gz26JRX0AS96PlZUbOjq7svmsboaaocaXycIC
	 r/6qaRjJj2pdoBQWsZQ7MHyi5n08sm1H4Xhd0UzrkYgikJyJ+PwtfT6YLiDWkuqoWTPB+
	 UGI6p8VJn9A4vGRWOSSWDwqA4B8bkvGeVY3bOS4jOOyr2M0AgApFjOVo/FUEh8DXtQi2F
	 m7B6QoU6i0hdfd4BaRIdZKvxyaJo8VIstJKdQ5meUrY5Eso00J3Mn5GC3ChJ0MmEvNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=y5uS4wiSy3bifvFb2xGvxqzue+H9klMv+96lcGTLuv8=;
	b=Lmo/wZfz6NeWrEU0gzxhPm8nQitoNYnxLBbEXAb5z3mJWL6wqbdHkhFmL5nnEzFTnoCQ
	 KdkBzu9Hj33BNope8VCkAgaw5wd2ktOPGK3wstU4qa4J427I5zYXbDVNGQ5KBBcnYBHsu
	 zqMCbg6v8hOm1cvL27KMhk7dKeLA9Gd2ahfFEKYd+Zg4zwrFjQogjb25wEHwamZRDjZQS
	 j/5ALqr2MptJXf43klXHyVvvMK/Im9FSGL3KxZ50cKiLg0nOk83zkYS46Sqr1i5tWOIXN
	 ZWRUQTK/sMEsNMV2fXOocHcifu8FZqStutjOHIlGgH8jgAZSDvb2IiwxRMWcOGNTEsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nEGVL220;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E894A60A2622
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E894A60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nEGVL220
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1101910f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795020804; x=1795625604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5uS4wiSy3bifvFb2xGvxqzue+H9klMv+96lcGTLuv8=;
        b=nEGVL220sfvKHpHVupJv0jxhxCebvL2jxDBbW8UkZJNi38UG1MqpwWxLJpkaTFk8jf
         yoMp5c3ohCqo98+xlcn8svMM0KBv60PSSi56ryiL8ZNHHP4mCfXkdsjmLQNvo6EbwYtZ
         wvXiBynOK+LeZAhK3C8TgzBM7c/3zYyD+fPPYEZNCxS7Ihd4pOYiw9qU+0KfzsG4towM
         9EdJy1NvJoia6VPa7+JOmdNNn65fBtaB79hP6RsB9Bp42ETC7YnmXa8cKnvG+qGZWpqe
         HmVd5F86zSmrgC+9aqF76vNC5DCiom+yHoZKIBZydhfwIYM1UIMt5C0qV4QS/epVwGFz
         c2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795020804; x=1795625604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5uS4wiSy3bifvFb2xGvxqzue+H9klMv+96lcGTLuv8=;
        b=ujU7Yjo+zqMgL00BawCeduPun9tpUI/2pnZtKi8dF/OViqF9/dGVF/9/y7ComcwYRd
         f1XJrWHTfTp9KITon6BpvvUEFxYku18ppb8XaqOX4+7i5P+OlZwkAgAaRYVWnMwV2xZY
         YutdfDrH/lHYvnWhy6siZVI8C3dtXyBtGmFXYCYQWK8muUQIJGx/KwizDvn5V5VBuIj9
         g3yc06arbbLhWvsCbrZbdoFFyTmWcwi55g1914eMotPv+8ResNmjhBdklQfmdp3mkUBw
         B8eDB03zuwwhllW+jpkwef3HnCAOUVA40vfhMKnZSeIlA5o/E3SOEb9nMIUytf4BQPHy
         R3JQ==
X-Forwarded-Encrypted: i=1; AL+hErE79TnPLGEekML3GN02oGPPldboHUjbmdtgNKm5j5m7jLKTzQHvS9UUt70eYik7t1lwIVUhVROy2isERk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kID9pURI45fdzzxM370sdw4QNVQ2RncU9mH4b2CLENAqPeAWv
	0Q2yOJjpWrUMISl9UCWqSwwL7I4g3mdHXsq3sgOkLbmQdTrqVZVCUO9Um0q2PU+RiKw=
X-Gm-Gg: AZFdTZe6zKEUM5ltAdn3Qtx0Hj/YV3caTqyQZVLqxgVc2dHsLZhxk6gLPrLf5UkfZBp
	WH9QG/3O+i6s+UbR/C10swqyRnut7SQR6EmB7eMoWrTX2nG7OV9N0acpFFHbV1Kcgq5z52sEXK1
	OtTJCjwvdQrJyKbsihgRsBURRXv6XCrJa1Zn5Z/smXNmkDrDKkieVe5GkBjbJ6PbB+JAVoHzdH7
	cUQk2nH+UHIJnbEcr+UNDf3XZp4bfVTkp+45EnMCANCqHAfNRS0HTlGpSHQwX8wNTd1is7qYJYp
	/g6FQr5dqWL9zZ0BECA6Qx2KH4JhdpjlU8M5k2epgmU9TDSMKPYUbFr9OxECr6QZm0bCrpfylmN
	eP/TOlGijKB3OgWYknAarjU22J/G76UkZhQiFBQXymnsV1W+lNLjesDzSeRW5W6qg58VVPFNGwg
	mKuwrgh4JSAYCAMlMJu+FCZzsIfDsmw+dGsiurRi5FXvuem/IOk9p5+ZgUTEjZ81Mz9JPyNJT2n
	8H4SJAGK9IA77j0DZD8uMLU9H0irh7xB33IWcJoY2swZIxjOETO0FTOagoUfH9CFM4xs0Cwl3FL
	pkWN16ZQf9w5NiJdwCQCNjSwfqtI5QHTkQ==
X-Received: by 2002:a05:6000:46ce:b0:4a4:856b:3503 with SMTP id ffacd0b85a97d-4a639d16f78mr4817368f8f.34.1795020804143;
        Wed, 18 Nov 2026 08:53:24 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c39bsm5886133f8f.17.2026.11.18.08.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:53:23 -0800 (PST)
Message-ID: <0e81b599-a2fd-40d6-85dd-841bb012f18e@linaro.org>
Date: Wed, 18 Nov 2026 16:53:22 +0000
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
Subject: Re: [PATCH v4 03/10] coresight: etm-perf: Serialize AUX topology
 access
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Qi Liu
 <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
 <20261016-james-cs-multiple-per-threads-v4-3-dedf961aca0e@linaro.org>
 <20261112180920.GM9176@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261112180920.GM9176@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/11/2026 18:09, Leo Yan wrote:
> On Fri, Oct 16, 2026 at 11:46:13AM +0100, James Clark wrote:
>> Perf AUX setup walks the CoreSight connections to select a sink, build
>> paths and acquire references to the devices and their helpers. Unlike
>> sysfs tracing, it does not hold coresight_mutex. Driver registration and
>> removal can therefore change or free connections while setup walks them.
>> Adding a CTI helper can also reallocate an existing device's output
>> connection array even when the device is already referenced by a path.
> 
> I agree that bus traversal and devices acquisition need protection.
> 
>> Hold coresight_mutex from sink selection through buffer allocation.
>> The allocation must also be protected because ETR buffers can look up a
>> connected CATU. Release the mutex before calling etm_free_aux() on error.
> 
> However, my concern is about the locking semantics. We should clearly
> identify the races that coresight_mutex is intended to protect and
> limit its usage accordingly. My understanding is that coresight_mutex
> primarily protects CoreSight bus operations.
> 
> Holding it across the entire perf AUX setup might silence AI review
> warnings, but it may abuse the lock and hide synchronization issues in
> the CoreSight core APIs. OTOH, I'd say SysFS mode should not acquire
> such a big lock as well.

Suzuki already merged this because I had to move it into the small 
sashiko fixes patch set as a dependency. I agree it might not be the 
correct fix, but it's a small change and it's likely the correct fix 
would look very similar to this. We can always undo it or re-work it in 
the future, it's pretty harmless.

> 
> BTW, I think this change is a distraction from the per-thread fixes.

Yes and no. This set adds additional traversals to the tree to determine 
if a sink is shared or not, so it increases the chance of hitting the 
issue which is why I thought it made sense to fix it.

> My understanding is that this series aims to fix multithreading with
> a shared sink, so we can address device lifetime issues separately.
