Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090086;
	b=kcJiCKu4/ZPiEy4mpTkFSFvFE6OlJjx28mLozczAeLOEzJiNBsnqgMHclJ17iDvm7Jtm
	 Fl1JIfFOqdMp3WGtk5+85asbK4DL2GcfeeiKl+jXZkBjsXPEtrKMjHbAMdve6BnvZ90Zn
	 Ly61C+rWnS7ISSqVpqrLyzCkYXuSiEmKLn/DkUpbZssXeWVthikGQp+MGhuJXP6CNvkxq
	 tRnNyemL1p1Wo5liNASxIQmeFijErRuwP+tnuoiC7H8WoJCMhZW62kCfU9qjjPlvtvNNB
	 8w5o4Yt9JpyvU5/Cnf6ViCMUHc5L84/gqmvDWmmurZ+3Le7M8AurUarGCOgN1/Ga+cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090086;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=UxFEXeB/Pzb/ceZWieldlDl9uSZkIWZBPtfFh0hEfJM=;
	b=tRSmrQoUl2/cVC2oVpOOL44XagQ7dL6xlIsgvE4913mRtsqic11gqLJT+ip2LFPNQpz+
	 wIGYNd1mG5E0z+AjukzvITKHu7LN3AgxKFOciLYvy2FZn/vkTvnpDi2jUB7m8wW30J7Bs
	 OU9Kd9et5haE8zZzEzRjf9+WFJsqSee+J6AKAgMrvn7oar+w6nYAeBJOZIxsfN/l8OtRj
	 FQKbdutM3I0gdZRtEOOS+HMY9qWMcQgNFwehEuWImCX4iPz5WEhNPeZonTK08G7FZkDJk
	 XtuvErpcTh8r/V3Vv2cwtm4L8hsxYjP4GR2Y61JQT6iFbenBTuGretihXRx+3mXC4qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GYAYUUyC;
	arc=none smtp.remote-ip=91.218.175.220
Received: from mta0.migadu.com (out-220.mta0.migadu.com [91.218.175.220])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7E7606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F7E7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GYAYUUyC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uvou6fvzsWx7brWg2uRljIGCw/YRWGhDfGuc7FjFWDw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795090083; v=1; x=1795694883;
 b=GYAYUUyC4YQo80DFiA5JGszJPP9ze5+NcoV32BPqsscwjvWtPpaB+3kON2X78vD5+EpgVx1E
 MzHVvP1XTKWYf71GZ0BHfnUNmsyyjcXzBG2N2F+ilSH2oF/JuhsRm9WUbC9Z9MkksUbQtcBvquv
 nGpQ6SepGneI5Tv4oUslm6lE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2d48ab7dd774df7e;
	Thu, 19 Nov 2026 12:08:03 +0000
X-Mizu-Trace-ID: 2d48ab7dd774df7e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so5500e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:08:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEKcE4I/M3O6u05fTwNtzbvQqBxQUkDa1rxARalgOsxeo7tSvtw7ReVHmV9o6umPgBNNGid2K/8wEf5x9Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YBOBg5rk0YTcDjZACB5JPo39t28qZExEB7Ca81Ir9Wc/uZR08
	oexEDW/cVe/ZT4INleH76iIGR1lGtGNT6sAqnwT2+ftK1yw7kmmYo5yiSY5bqB6jwijY5pC/IYO
	B4tpBKHZa9xemRcYJuhf6ISWb0T/sUwNB29U47Nz3
X-Received: by 2002:a05:6512:b86:b0:5c1:4cc8:2f22 with SMTP id
 2adb3069b0e04-5c1b66e7f30mr61719e87.8.1795090080312; Thu, 19 Nov 2026
 04:08:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-12-13c1859e8aa3@arm.com> <av7PQ4iniwWC9goF@red-moon>
In-Reply-To: <av7PQ4iniwWC9goF@red-moon>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 19 Nov 2026 12:07:23 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwYexVk5tgHNorQVHwxLThT3nFzjYz50oYp=xhrd1LXDg@mail.gmail.com>
X-Gm-Features: Aa3M54prNB5a7w6aglbYUO3HHB9TG1Y0B_WAoNyRQhIl_db8bZOox8P-QBAm1hM
Message-ID: <CA+EHjTwYexVk5tgHNorQVHwxLThT3nFzjYz50oYp=xhrd1LXDg@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] irqchip/gic-v5: Retain the ITT when device
 invalidation times out
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Nov 2026 10:28:19 +0000, Lorenzo Pieralisi
<lpieralisi@kernel.org> wrote:
[...]
>> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
[...]
>> @@ -570,7 +570,9 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
>>          its_write_table_entry(its, dte, 0);
>>
>>          ret = gicv5_its_device_cache_inv(its, its_dev);
>> -        gicv5_its_free_itt(its_dev);
>> +        /* Only release the ITT once the ITS has discarded its references. */
>> +        if (!ret)
>> +                gicv5_its_free_itt(its_dev);
>
>         if (ret)
>                 return ret;
>
>         gicv5_its_free_itt(its_dev);
>
>         return 0;

In this error path and the one in gicv5_its_device_register(),
kmemleak will report the retained ITT once the caller frees its_dev.
Could you mark the ITT allocations with kmemleak_not_leak() on both
paths, l2ptrs included for a two-level ITT?

With that added:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
