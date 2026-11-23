Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412342;
	b=B1bO59kJmEZcTJxEGGplC+71HgxXsn39U0/ecaxWTw8T5VUUnRDfocFwxpcM2yrVQCCU
	 E9KFi4Sj8GnLnjXz4kYQ7c5wY3jNrPJGBuXPX9/zWm9sjGfpMcJa8RXg9etZ7rHwpbr5e
	 FhHh75qpNR7E34K/ItLjH2LchYkMDd5tQNe/tyQAH+tHE4IFexRKkWC83Y7M3NcTpM0wP
	 7Y6DSN48JOEUA0K/+hA2/iQpSuZc7ei18jGTGGvUCasfuRu8X1tQJ+bF+46SJMGHLbzfC
	 HKkpTLf4lZP514XfYNri9LMcvIRfKF4KayBdv6ETn6niKG9CLPCuc6HijDdnItlfNvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1clr5r2wO4r4dTZUcOGCWEDQFMnWEIuiQe2vSyPXs6U=;
	b=KglIpy9prsgCmvNZwk8FOTXOX9YGNSjh7flyaVVr6IVHpGJhRvQ/Nqa/fcejfjCvAA9f
	 qgrnKxVTP/XMyyUguJjtJXZohzpEzxHudyT9hdm3x3+902qNPSEYlg+emb5GRfPwCFKVX
	 0Df9mmp2abJRIGxoMJPhL0wP6tynjo7c5YySWq2bb+S4Jb+YfIilR1mg3MdPcSn5tKcsR
	 jhGxJtgMOsNP/M2y84cin1cxbouEecPuyFIn61AV/7RFZHf1JuFvkW0k4Pj42CGtQgTU2
	 bmS3vibPkQWux3nhT6PxoyEmktAI6Y2xxu9DedLZpYjYoX6vkiUur/G4CVka21JZRqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JfSnrCNI;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3163E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3163E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JfSnrCNI
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f037bc348dso24013975ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795412341; x=1796017141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1clr5r2wO4r4dTZUcOGCWEDQFMnWEIuiQe2vSyPXs6U=;
        b=JfSnrCNIKPICj0RrhiN+MnxvrazaYg8GflRhbxQTTHfkuFTNW3UWYoQHRpFBVw0FFW
         CusggcdbmunQhXC+CVemjVC1B/WnKrWhr0v02iPfmyfaSLz951gCOlra3Ih5p3FeIF2O
         ibz8+H8V3z1WuViw6wcap6swTO8LDUGYEVWts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412341; x=1796017141;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1clr5r2wO4r4dTZUcOGCWEDQFMnWEIuiQe2vSyPXs6U=;
        b=Lu8xtkM3IVch5p+9+ZMvVWkF0znSGqH48USLj3kLuFAolQaHrizen/7+A8GDdZxDt8
         z66XsHeEnery2WDsuHtr4OGosOHNK4L4A76unr1rs0nMl1HiUAfHQs7j6HssZaEmvfMg
         zzh3Jwsp9FATTr6VqSN6Q506JKGS5nUNr21xm6q6h/dH1qPi9l1ma1MClZDenMhN8Q2w
         fs1C/WT3cVU/pwe2sK8XxQvUeiOynu3Ph4zmf04QkmU7mATgpHBiv3tNbpuF+kWQiaQs
         cBmBIMJC129wchgcp90eQKDlM4lbmotSBkYGpzm7BBDp3l9+HbTDckfh9kwZMwjEK6H1
         FTxQ==
X-Forwarded-Encrypted: i=1; AL+hErHJtRHiQcT2U5/lBgbcWvcLiKcByDlUSG3/3lnbAu5VV6cmNIek3skLgA3I+6yS7vshV2fguV0RK5QPogg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/N4aqiZUAFaDc8yf/vUHoMrnZAtCzIMIBefFCjDsTQSnvjfav8
	ALOqDCHGAwaDHPK5S+bVtiN1yqUB7AdY4LNxyvCH35PSJgftNeYaPyYvMPk7o3/Vjg==
X-Gm-Gg: AZFdTZfqcEMOvJPwjP/ZFWrwhxooeavm4Auy7sLPv3syYJiArkDViiyg4J2w62Q6YcD
	EAVoLS7zDivptAvvEhJp6AqC8iQW3ZBZs47FGMIrAYKqeQskKRR/RiBH5ltuBZF6EoAF6IKxsu5
	E1hUc2zFMKDq3nrem4N4JVb3EQulf9PoWgkrkvPhtsqO41+D0VYQ4Pg5LPHcYbUByfBChndw1nV
	dIFRcd+HrQ3qAi3VkFbwSqIsLXIx4c/xQadCD3baCkyPRZ5YPldER2OzhBdJQ9bw4aC61UlXP6K
	apgs5U2t5LpDPgqDZz8BLNyiFC4DEVPeswVPsY8b8Ss0Xy4o9gYXIjNy4x2B4FAHtKk1ul849qH
	W2yRJORPDXyVAEH/stOl09DG6e0a4a6HYuNyv203En4MQacgzgKwEsOcB885zTgFdMvSlfAGeLK
	BrSRPnxKPtv3kXXIxcleHP6qU1iHL7XATx/YvNcE0E9rJKVOafR/KIt2aId17WVYgxkGylYCpp5
	iAGdwmTQ19QAvvy1gNqkCLibMQKRbH7sJby1R0I7FkujsZXOb5/ErBipFhyYVv7+tpyj0WOlUWy
	ZG1s8KA+qkaesylLAB0hNC4etV6WfLsi1J1+grwlJebY8/EzC4AUygf54PK7cBpAiX4xdQ==
X-Received: by 2002:a17:903:19e7:b0:2ef:e8f2:ba28 with SMTP id d9443c01a7336-2f03f249c83mr98893775ad.36.1795412341632;
        Sun, 22 Nov 2026 21:39:01 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:d8fa:c511:e415:e0d0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14fc8csm45964775ad.74.2026.11.22.21.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:39:01 -0800 (PST)
Date: Mon, 23 Nov 2026 14:38:57 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>, 
	Hongfeng Chen <hongfengchen@xiaomi.com>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH v2 2/2] zram: keep the hot statistics per CPU
Message-ID: <awPRKEk_Q0wRhZx1@google.com>
References: <a74aca7a3d27333972782b29786c7b33861a56f1.1795412161.git.senozhatsky@chromium.org>
 <cd96ecab2cfbb9a50a0b5141c09f9fda086780a0.1795412161.git.senozhatsky@chromium.org>
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
In-Reply-To: <cd96ecab2cfbb9a50a0b5141c09f9fda086780a0.1795412161.git.senozhatsky@chromium.org>

On (26/11/23 14:36), Sergey Senozhatsky wrote:
[..]
> +static u64 zram_stat_read(struct zram *zram, enum zram_pcpu_stat item)
> +{
> +	struct zram_pcpu_stats *stats;
> +	s64 sum;
> +	int cpu;
> +
> +	/*
> +	 * Other CPUs keep updating while the values are added up: a page
> +	 * stored on a CPU already summed and freed on one not yet summed
> +	 * can make the sum negative.  Sum them up again then.
> +	 */
> +	for (;;) {
> +		sum = 0;
> +		for_each_possible_cpu(cpu) {
> +			stats = per_cpu_ptr(zram->pcpu_stats, cpu);
> +			sum += local64_read(&stats->stat[item]);
> +		}
> +		if (sum >= 0)
> +			return sum;
> +		cond_resched();
> +	}
> +}

Oh god... and, of course, I forgot to quash the clamping patch...
What a muppet.
