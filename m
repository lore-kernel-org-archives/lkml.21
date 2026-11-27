Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779871;
	b=Q1d2AfacSPCGKm97+4DMa4ai1N/oW9b/wSgQ+4/J5JhwVsBeKM2NO/0riOuDYj1BLc8z
	 BShqBxU5bxNRml25WUqQu0T5RxE82nFJoF/hacRnmvsyB5Te03gQD7UvKMd0v8/mlnlKj
	 vbqb8vIrPiY4afXqBnWi+jOKEEedkyLWUurEzm2a+nqUEPDnrXYwkv6ydf4QOiBSzgob9
	 LNGmjzo6LwvzufrsMdHNsek+Gw6+YJrDcX6Qzc/ktdzGnQEJ/Krcx7UpcIF2KwSxHGrHM
	 lE0wm8ByC4RlU8tRQgvfhxDt4YKUhWVuh7EtzcIJD9p4ao8T0jkCfh+9HSTqVDA403g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779871;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=z8QPTJ81+fZJS4M7LndXTeeI+QYCXyZKcBukwunJ0Mo=;
	b=KMzK4hFenOZ6cxuIXt43Bmnd6PlgsR4oWHtTFzktRboD6m/6MuytjtIUamOklkppvq2C
	 REICAUi1muqI8xTM2FTElE8gCNUr81dlU7ysU1/BI0/2U3QChBgRH3mIJp6QRKfpY3eQs
	 d6R8su2Y3qsmqZqqzsDC17LV0kPA+ZtBQQvTWTrMFI6PS48VhpXdcTIFeFLaoM6I+O959
	 d1bIir4QEDv+Dqijbjxg/tvBgKD8myFuDtBCpdQD5wqlC3R8mYN97swwAwP6vv283b3Y/
	 dcVBEFSqsR2P2Mq1cBnmo5RerzfZH2ie97YmFjjYEKW8GN8a3njtwIhyA7c20ltHWEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DsNaMaqb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4261C606A326
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DsNaMaqb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F191F000C1;
	Fri, 27 Nov 2026 11:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795779870;
	bh=z8QPTJ81+fZJS4M7LndXTeeI+QYCXyZKcBukwunJ0Mo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DsNaMaqbQhqgZ/Ezt8T6C+1adAo/0rtq5CADL6dxzf/QkEB7c/m7S8QChc/XnLxsz
	 fbSljDXqtZoWlZgu8kNR5Vymo8xdeDLYdQJs0O9rt8+8QNlcV/eGc03YVXMBkarHkE
	 4uwWBRN0hsVbvzwzvjjb7C1sQP75k3J2tqP+U2JoIRUH7Y89bmvP8spWfrRgQ+bcwe
	 2xU11M+u+CTevLcbES3AAiW7795x86/9Lnq5hbK2gzNYeN09xEYt1ZXZhJYlP8VHZm
	 xCQss/DAPkmpp2+jQXv5xJ28NaYbquwrhT8wUJr42YxYOA/ctxaGiYXJxUCeFnEPIN
	 2vuhDuwMW3Y1A==
Message-ID: <1c9d9335-14d0-4870-b83d-a5b69ba8d633@kernel.org>
Date: Fri, 27 Nov 2026 11:44:28 +0000
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
Subject: Re: [PATCH v2 0/2] nvmem: validate access ranges and fix SPRD reads
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>,
 Srinivas Kandagatla <srini@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Freeman Liu <freeman.liu@unisoc.com>, Maxime Ripard <mripard@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>
References: <20260921165055.421933-1-sanman.pradhan@hpe.com>
From: Srinivas Kandagatla <srini@kernel.org>
Content-Language: en-US
In-Reply-To: <20260921165055.421933-1-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/21/26 5:51 PM, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> Patch 1 adds a device-size bounds check to the two nvmem core read/write
> functions, so an out-of-range request is rejected before it reaches a
> provider. v1 open-coded this check in the sprd driver; this version puts
> it in the core instead.
> 
> Patch 2 fixes sprd_efuse_read(), which reads one four-byte block but
> copies the caller's full length from that stack variable, and never
> advances past the first block. Its provider-side range check is removed
> in favour of patch 1, so patch 2 should be applied after patch 1:
> without the core check an out-of-range in-kernel request would let the
> new block loop read past the eFuse region.
> 
> Both patches are compile-tested only. No Spreadtrum eFuse hardware was
> available for runtime testing. The bounds check intentionally permits a
> zero-length access at offset == size and rejects all ranges extending
> past the device size.
> 
> Link for v1:https://lore.kernel.org/all/20260904003815.462352-1-sanman.pradhan@hpe.com/
> 
> Sanman Pradhan (2):
>   nvmem: core: reject reads and writes beyond the device size
>   nvmem: sprd: fix out-of-bounds read in sprd_efuse_read()

does not apply cleanly, can you resend base on nvmem-next

--srini
> 
>  drivers/nvmem/core.c       |  6 ++++++
>  drivers/nvmem/sprd-efuse.c | 17 ++++++++++++++---
>  2 files changed, 20 insertions(+), 3 deletions(-)
> 
> 
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935

