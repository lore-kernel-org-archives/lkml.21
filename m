Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428924;
	b=bEMK45sFGdi7cHOSLfdJQ+rFbTuu2/NYaa64TZbNirZ1v3CdAQPtErBOqR/L1hoFRDTA
	 ckbp2vHEDin6J1KyHdJTBZ8EsZxgkLdq5R9s+H9UkDSC69w8ezTtPC7Z1hF2x2tKhbvOs
	 5oXb1JiMS6FJ7ZtVeBqWLdZVFd6/FcsFCedfTCJj16y3j8lcuH1CQTyjtxU9qHs4lNX76
	 Q8g+KfLXlrYeCJI7RrBcdxj46GLwRDFvpdZZE2+q1QhbHb7dXnhmHEyLzjlbLXJuliBdq
	 PK0ycroB8n6B6k3LINQhHk1Fu4F+8F5H3y6ezSjqvK0ykDCXIioKpTYfb2nbZ4GreeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YEmk1VDoJHLEYSmDRdBwUZmDsqu1t/NGQfUH3rocZOw=;
	b=gQD/tlkQ9BqSQf49Sj1gD9A+bA80hQROTEJRs9qPkA2ZqpmmuOdavwu/+jBfeBuUQCfT
	 I+C68//AbFQgBiE94qVp+vnNhSKhEuinVWW23+wDd9VmIykXKjQcsvajyEFs4g8kTxGqA
	 zg9jvBOi+IVLsgFLX/LShp9LbtN4KHfdlkhq55lDE1wtKaZfR794POFT54adq77FFr3BW
	 wpc2HSymlkqBlzv7GvcNtRrWqJj7IPwHaPlFV7kXJlujToTxPEJX9+N1BCBudzZPFL6yS
	 A+/9RJ4cJiMLE9sHbOsPdEJ8/zG2Hse1klJO0BnzoXo8vxy5DvDn6G8QHA0sT8UEqQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Tj1tka9c;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5C5606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB5C5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Tj1tka9c
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso21691475e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795428922; x=1796033722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YEmk1VDoJHLEYSmDRdBwUZmDsqu1t/NGQfUH3rocZOw=;
        b=Tj1tka9cwCfSWVyOhNY4eRE05/jjgj461r/WnGC437Cg+uv520KTUAtreYXE4Uq4SQ
         VQPr4yG2Y0WusL/sss7VMDxH1FpnVaj07Df/tNh17yAjcNGkwUdYLutIBsU9wv5Br/Fp
         /3EHSls/7CqlnJcqVnP6DNcbP/cZtabyzOy7yIPtVQ0HUdS0h2pLtqRSxH33sUWzR4Bl
         VeFDHbK2pSt1RXv0nj4zGr0S5c43fOYQ5w6zOWGj4gda05ZvKucxdkX5pEkLO1PMgYGZ
         73Ko2Dj5NxRb64zkKdjz+wIrcy2vFOpvHLmQ+456M/dgvqKUIaFLpDle24Wwoad8e0pO
         MsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428922; x=1796033722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YEmk1VDoJHLEYSmDRdBwUZmDsqu1t/NGQfUH3rocZOw=;
        b=1eD22ntTfB5yzoRIUd0m6V/XLqKQkYbaHtUwsDmhRiXu03Y2OLaO5HPEc2RNtmXNUN
         Ht+cgZ+1i/TiJv0Ce/2OoSrqPkqBuxidhSTU+XXh/nbZ6niHKDEISDIDfVrI0aCilM5J
         vVEexUi84zQgSb/GSOI0VobVdb6iVs+mAowX3dkzmNxOqZBWHWbCK25m3Vr2CW1Oj4Lz
         0au75eCIK46JUIF8nJbQ2dr5F7aDm/MOhTXlLxjCbSkBo5n1hYFBc1FfusOuqblHWq5F
         LYEZ0+i34qVUWJ5ECeejJL/cpczInAigr1EIGGpCkT1DLOr+RDIIqCUDSGJRHafbiXY7
         6kJA==
X-Forwarded-Encrypted: i=1; AL+hErFJhvx+NtcZY7fjKZ019MgRM1MUVakh+08B/3j83M415m1WooZw65LqZr8HKKVzucanLtoU6hCxtyrmz7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ltcPVzir6qVtEKPMS6tmhsT0uS0GhPKAFt18ohY5Cbv7uj1eo
	BjKZJabIuAN+KjRfRsiYRGg7aZ6xAizCPRMrapKirnAqfc0Bbnx0J26dxFKbBQ5vRKI=
X-Gm-Gg: AZFdTZeIHhY2GAxIZqWe6TnOA57lJxltvY7HXOEa5CvQgwEx1T3HumsK/7P2/PU8zDq
	Z5I4BrXIpNl+eYIx+bkJe1ajOlbdDwg4j1kVKfL5q3cYn3Yb1kJ5oBm3htrhjtZAHUrKR2eYvLD
	/v5TzR/903UC6GuRG9BBwLLRDR07dtjDUAHqq76ye8mk0VQBLdKT7P3UE0AU8iD394CNSdL4CFX
	CxDqSIyfV4xzDcpaB++jqjEPqU/Clhiei5a/4m7AzRZt/rETQx0kzNSfziRDqLZrOiUoXTGBoy+
	llOBsK5Hn7AddU2wMMcJslBtSZeYsdWb+Pa7uZDb6vfK2hCFaqLs0YTK9wNaS0z7iXMwVS/yDWn
	ZPA7kEgaK7GwLRInCtdc2V5CJb7RlQqf/SpcCVNKofCbERm2L7zJoBCQvD+wEekbf27jdoC81wu
	gsOy3aGvvGGfOgT5U1uNVsuqbmbtM3bFDU9eDSd+mdmqh1ZXYoHSCVHAUKF6Ghpr8VSP6MBnpO/
	EtIWrHnqM2HRS7gRD9AgcW7od31gKeOhq5iGFpLP2a2igVSPxfRjXLwRjW/1Rvguf/w6OKmO0yL
	UBoboUIO6VNDaTus/8NBv2XeKj1MtI1HwDpglfQLdG2b5AbdrMx4
X-Received: by 2002:a05:600c:45d4:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4bb8880988cmr238927785e9.6.1795428922043;
        Mon, 23 Nov 2026 02:15:22 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm381534625e9.12.2026.11.23.02.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:15:21 -0800 (PST)
Date: Mon, 23 Nov 2026 11:15:18 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	Yafang Shao <laoar.shao@gmail.com>, Shuah Khan <shuah@kernel.org>,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] selftests/livepatch: skip the tests on kernels
 without livepatch
Message-ID: <awQSNi8Ex6eOcFOw@pathway.suse.cz>
References: <20261110161050.2451750-1-sashal@kernel.org>
 <20261110161050.2451750-2-sashal@kernel.org>
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
In-Reply-To: <20261110161050.2451750-2-sashal@kernel.org>

On Tue 2026-11-10 11:10:47, Sasha Levin wrote:
> The test modules can only be built against a kernel configured with
> CONFIG_LIVEPATCH, but the selftests try to build them for any kernel.
> 
> KernelCI builds the selftests for many kernel configurations, most of
> which do not enable livepatch. On mainline from November 8, 36 of its
> 69 kselftest builds fail to compile the test modules, for example:
> 
>   test_klp_callbacks_demo2.c:23:16: error: invalid use of undefined type 'struct klp_object'
> 
> These are arm and riscv kernels, which do not support livepatch, and
> x86, arm64, powerpc and loongarch configurations that do not enable it.
> 
> Do not build the test modules when the kernel in KDIR was configured
> without CONFIG_LIVEPATCH, and skip the tests when the running kernel has
> no /sys/kernel/livepatch.
> 
> Fixes: c4bbe83d27c2 ("livepatch: Move tests from lib/livepatch to selftests/livepatch")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Looks reasonable and seems to work:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
