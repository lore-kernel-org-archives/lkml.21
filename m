Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705692;
	b=zxWYXr6blXh3/ZJPjxn692EMjTRJWgi3ExWeV3ti9UngHozfLaazaEyWscHnpc0d9MmZ
	 2pBw7KNk8xfmM25+hdZQISjdqV0kMXbruFHE5P3Z5iLbp1/pYnoq297SlMb/p/K3mxLGJ
	 ccZEyCCAzASTlF8RC1MUb6UrePZ/woC2A2jtkzitAYO8ddzwGKjCbIuKUT+WlRiQPovD1
	 XsUs0JKQh17JjxteKXosegvH4I2rUTmNXTyVjzyJhGBIIwU9XdMOvL7vId/VcS/tpK/eG
	 /ikDgkOesWVhYWb2S/FjQN+8g8PHBAPiJWQ4q9JwTreIt3vGHIHGJ6GtAyWZDDC5gOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705692;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aUbZxvdAHyq4ryrKZGnl6ROkEBk3HYBwARaX1t7MY28=;
	b=J2z6Jz3kYCMIS9mSWKIXJv19wsHXCb2CTVr90IHQdG2ZQU+TvxDswfRDi/gGXLEpPXm2
	 zgVmvr07E+Px8Nc9LlRCdlZxxYR+eaybs9GsTX90tpsI0PQMkm/eNZ/DH8ka7Q5a6hMSQ
	 5J/y+2jeoD+Tf7TwyeDYONV5gofvbq7RBfkg8wg9xjG4N5+Z+fdQRSEWqwFVgmgljb/RV
	 Az6TK496dijZjSQ1wreYzsEOb2cYO62lSlCBZWvIRMRv56aJ0YlvhQPSZcdZISXcfCyhu
	 iR/eniHav6j9Vdmnazcy84XW8A4OB4y/hgTwHX2LQUqc9e7NyWEzCUg4tK+ft4s1zeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sDLu0qrt;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D97606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9D97606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sDLu0qrt
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DB331C2B;
	Thu, 26 Nov 2026 07:08:08 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BEC683F632;
	Thu, 26 Nov 2026 07:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795705691; bh=8R4cIdICA/xfw4Ir/UDdVgpJ5yXQQeu3rB34U1uw99U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sDLu0qrtFlPxble7jhv6DnNu2uK345uN+jAqAUxC0+BWtCmbdOmO41ZPQz3dbxPVh
	 lqtkqLpYyyN7z9iPV6662QYlmM+8dtgDskCbERN1ElqSckazwK5b6e0qDp2bS7bgDq
	 qO99QiSzTKz0/c0m+nJIpjsixWga6xK/GeyMENd0=
Message-ID: <b2a0002c-9b82-419a-96f9-bf3a8fe29dd2@arm.com>
Date: Thu, 26 Nov 2026 15:08:08 +0000
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
Subject: Re: [PATCH v2 04/23] coresight: trbe: Check the buffer association
 before IRQ validation
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-4-3f57cf3199b1@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-4-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 17:55, Leo Yan wrote:
> is_perf_trbe() obtains the sink buffer from the output handle and
> dereferences buf->cpudata before validating either pointer. A live AUX
> transaction does not guarantee that the selected buffer has a CPU
> association.
> 
> Reject a missing buffer or CPU association before reading CPU driver
> data or checking the hardware buffer addresses. Treat these configurations
> as an invalid perf TRBE session.
> 

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 8ec0b4c4987f25d10ee0b2f80c27e10f76357387..91fbdbad3676ffae399df0b4d4ddcd603a40e86c 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1111,10 +1111,16 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
>   static bool is_perf_trbe(struct perf_output_handle *handle)
>   {
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
> -	struct trbe_cpudata *cpudata = buf->cpudata;
> -	struct trbe_drvdata *drvdata = cpudata->drvdata;
> +	struct trbe_cpudata *cpudata;
> +	struct trbe_drvdata *drvdata;
>   	int cpu = smp_processor_id();
>   
> +	if (!buf || !buf->cpudata)
> +		return false;
> +
> +	cpudata = buf->cpudata;
> +	drvdata = cpudata->drvdata;
> +
>   	WARN_ON(buf->trbe_hw_base != get_trbe_base_pointer());
>   	WARN_ON(buf->trbe_limit != get_trbe_limit_pointer());
>   
> 

