Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795250162;
	b=EnKRkiA/OLVCzqih5EAaWapNRDJTvT/A44QMvbiJdPwyFs7P4IiKpMD7/BUVoAtvKqq7
	 bDP8EQgtm7ELeij72KoLBr6+93V/zfHiLoimk368UUy1jSj6R8cBSESm8rWnypPOMDF3b
	 lJzlsFmMPja+Q3ykR+gIxEHJfAW0iUk3bmGb2ZrB19Pp2OgmQhs1OxoSW+51ZlCCUXHwd
	 U0fuqyQQW47z7KPGPo32IkNX+fPXw81a0kFSSzZQHCtyl1DmQvi3tpVTICD/OL8Oc8xy1
	 ZJy5X06hCV+s27oNH8yke+OD4x8VH+eYhOckb/UScUUIiCf/ZOxwpXcUjPmDvhm8T9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795250162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=q1d44l4EB5ZU0oAa814zHpO0T89XFHbgu/Aqd5GidKs=;
	b=UelLBh9RggyHz/LCQmcyEyKHvteIT9Q5hxl5XCKjT5jqWLXxvq4b2rYR/U/wcCNHGLr2
	 RH77jBDfMHfvTo4GXwPKPAnFp5lFd+o8KUmj3ZQmYd8pmfxNQzN01wZfTAuy4j0tgf4Hs
	 BEVO3pN0XXjAtyqPpgVGJR5Ir5jlrjDObIQ+OVzqc7TWfoUYo69HBz4OA5Mo7b4JpvXbz
	 0G28jd3hUWY8FSFAXPPOpYOP3Z4IqrMGE8jM5oZcGZgMkZI8TSO8CgiyBe+R4MZJt25IB
	 +GyO6PcneRZC1FtwPbWPddX/ONzzw9Bvxq1nKPwcQThPHqILjUoe4zlZyF5DYO2xwIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fylOpPWO;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D0B606A334
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14D0B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fylOpPWO
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b3d4d3bba3so945939a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795250160; x=1795854960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q1d44l4EB5ZU0oAa814zHpO0T89XFHbgu/Aqd5GidKs=;
        b=fylOpPWOfbB8Mrzaa8jy6O6PqZYCt9WZPTMsgYGA4VPpsQ1Mv1UgBsovjDm+hc71OY
         KZzdpWzTAstESQ8MR6iPswzIo6xcJm2mqUKn7R5liNiKfGLEcJh4re82835A2RzTv9V8
         MSjXeTNCtlafTTYoQyO6X5xMQOdkhDVqBHLJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795250160; x=1795854960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q1d44l4EB5ZU0oAa814zHpO0T89XFHbgu/Aqd5GidKs=;
        b=UECACymkved7NoZWFO1ciQTG8cNdvFLV9gsf17cNiMbZnEby1CR/LF4JupkbJBh1G9
         SD0nUuB/8NQAOgy4dzApxXd9AwKFwm1h6pmi/P8J85Wxren1w007XvP0WufmJMJcdIVu
         2kTyGuvt1ZXHxFzmAuiNqjyv4S0dRwyX/nhrYKykzqoj9GGko4PVCoNIbaN2sPTIRWq0
         lckQCOHGgPI6hosXLSxoq39KcfFMfUG6FkcetDRlGHZKOcfdXfq1Uj9yTAGBUvG9xW6l
         ZdPKRX6MGriBFN6SBVreVagINbBiqSlSaTAbnjYI9ESCbZqJHA6vT8I8NIPQHohXwsbe
         I3KQ==
X-Forwarded-Encrypted: i=1; AL+hErGn93Uv9cGWoV8BAQ8/+UFNfEfodfKCgP3SGzNfpES6RYDBlaRuCSbTJkqAe5f5PXkWzlnpUIX+4BjEj3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YpjLltI1/HZWJswy0QIda6/gNKZ0p//RVkWSxkKpQShsICknW
	H13w6QvFCUYBO2wjGOMjNGhVW17yJ9/lNTIkgdBYVlJHVlHfc6sdgtz4ECp9EOBJfA==
X-Gm-Gg: AZFdTZdyP9P4bBO2NBm9TNbpnuOvS3mldukmKZZkc0No/S0fTABqxGr0EMRd2E3q653
	+IijfMasTAEOpVcDPR2NP8Ghtm985DImCwxfrYX+xEcuv2eT9xsPi7uVnvNJw+aRCKe4Gnamci2
	Fiqrz51ajzP8tac1VN48ZtjsvKaHRFg/rrUXAWxW9DisR29yHpbzpuRSoqnCbN5OL4lowEHOEQu
	bK/w+WOTlnWfR4eYzOHUo9gDaExj/pdurtbJWZjU6n6cMStW29TnZss2T1FuNuKAT1rHl9E3B0k
	BrGj1Wxt5V2cgx+DstPvkdCD4WFVWqvUaAYhcdbp4FMUd5UY9eGBas61/cc8hOyQVpZMnWsRZKh
	a1lCruJaJa3bQlr8+xbwtQSlR+EBoE41q8cw8kyWun32Nc84+vjunVhC22Sotbakqzjv8+qTCVC
	Sze2mlhxe6KnXmGZT6628mx5wUqcRmjVZ4GQkyoFWH3pfl1r9/6XhqvlKgZiSC16nCz9VlZBWUD
	VK0tZyh/eXD2OPEirAYm4tR10aX7EionbWuKcIv8ULQmGnrq91KI29Kk97jU0zxO8HfklbsuPS1
	meumlWY+KSj7uc0gImzdHrtqBHMzteTABPQ/1MUEzit1v6+4kNYcVjWkXWozddJ3Dibdqg==
X-Received: by 2002:a17:90b:1a90:b0:3b0:9941:8d42 with SMTP id 98e67ed59e1d1-3b41c92a1c0mr5014603a91.33.1795250160405;
        Sat, 21 Nov 2026 00:36:00 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:2f43:ed99:516b:8dcd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c42b1sm24237865ad.17.2026.11.21.00.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 00:35:59 -0800 (PST)
Date: Sat, 21 Nov 2026 17:35:54 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Hongfeng Chen <hongfengchen@xiaomi.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Barry Song <baohua@kernel.org>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>, 
	Minchan Kim <minchan@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Yosry Ahmed <yosry@kernel.org>, 
	Wenchao Hao <haowenchao@xiaomi.com>, Wenchao Hao <haowenchao22@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, chenhongfeng0212@gmail.com
Subject: Re: [RFC PATCH v4 2/2] zram: keep the hot statistics per cpu
Message-ID: <awFXOyeELHgLfy_D@google.com>
References: <20261016120927.3191690-1-hongfengchen@xiaomi.com>
 <20261017031542.3504947-1-hongfengchen@xiaomi.com>
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
In-Reply-To: <20261017031542.3504947-1-hongfengchen@xiaomi.com>

Once again, recovered from the SPAM folder.  Sorry for the delay.

On (26/10/17 11:15), Hongfeng Chen wrote:
[..]
> +#define zram_pcpu_add(zram_dev, field, val)					\
> +do {									\
> +	struct zram *__zram = (zram_dev);				\
> +	struct zram_pcpu_stats *__stats;				\
> +									\
> +	__stats = get_cpu_ptr(__zram->pcpu_stats);			\
> +	u64_stats_update_begin(&__stats->syncp);			\
> +	WRITE_ONCE(__stats->field, __stats->field + (val));		\
> +	u64_stats_update_end(&__stats->syncp);			\
> +	put_cpu_ptr(__zram->pcpu_stats);				\
> +} while (0)
> +
> +static void zram_pcpu_sum(struct zram *zram, struct zram_stats_sum *sum)
> +{
> +	int cpu;
> +
> +	memset(sum, 0, sizeof(*sum));
> +
> +	for_each_possible_cpu(cpu) {
> +		struct zram_pcpu_stats *stats;
> +		unsigned int start;
> +		s64 pages, bytes, same, huge;
> +		u64 notify;
> +
> +		stats = per_cpu_ptr(zram->pcpu_stats, cpu);
> +		do {
> +			start = u64_stats_fetch_begin(&stats->syncp);
> +			pages = READ_ONCE(stats->pages_stored);
> +			bytes = READ_ONCE(stats->compr_data_size);
> +			same = READ_ONCE(stats->same_pages);
> +			huge = READ_ONCE(stats->huge_pages);
> +			notify = READ_ONCE(stats->notify_free);
> +		} while (u64_stats_fetch_retry(&stats->syncp, start));
> +
> +		sum->pages_stored += pages;
> +		sum->compr_data_size += bytes;
> +		sum->same_pages += same;
> +		sum->huge_pages += huge;
> +		sum->notify_free += notify;
> +	}
> +}
> +
>  #ifdef CONFIG_ZRAM_WRITEBACK
>  #define INVALID_BDEV_BLOCK		(~0UL)
>  
> @@ -919,6 +969,8 @@ static void zram_account_writeback_submit(struct zram *zram)
>  static int zram_writeback_complete(struct zram *zram, struct zram_wb_req *req)
>  {
>  	unsigned long index = req->pps->index;
> +	struct zram_pcpu_stats *stats;
> +	s64 huge, size;
>  	int err;
>  
>  	err = blk_status_to_errno(req->bio.bi_status);
> @@ -947,9 +999,14 @@ static int zram_writeback_complete(struct zram *zram, struct zram_wb_req *req)
>  	}
>  
>  	clear_slot_flag(zram, index, ZRAM_IDLE);
> -	if (test_slot_flag(zram, index, ZRAM_HUGE))
> -		atomic64_dec(&zram->stats.huge_pages);
> -	atomic64_sub(get_slot_size(zram, index), &zram->stats.compr_data_size);
> +	huge = test_slot_flag(zram, index, ZRAM_HUGE) ? -1 : 0;
> +	size = get_slot_size(zram, index);
> +	stats = get_cpu_ptr(zram->pcpu_stats);
> +	u64_stats_update_begin(&stats->syncp);
> +	WRITE_ONCE(stats->huge_pages, stats->huge_pages + huge);
> +	WRITE_ONCE(stats->compr_data_size, stats->compr_data_size - size);
> +	u64_stats_update_end(&stats->syncp);
> +	put_cpu_ptr(zram->pcpu_stats);

Thanks for reminding me that I actually looked into per-CPU stats a while
ago.  And I had much less code, IIRC, let me find and rebase that patch,
these WRITE_ONCE()-s, etc. are hard to maintain.  Let me find my patch.
