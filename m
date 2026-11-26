Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705665;
	b=15k3Hh1IPuyhwtgeQ+NpasCE0WyzSndWCpzMZZREsnbhbB7Sb3wo6h5VWodV6OkULzp9
	 0ej39YOUz15O5ZyuE5fjdTG6zojE7ig6/+qPO9SkjmXGIbPt3fIw3ZT1HNilmtJuFwhuZ
	 fHCEEIgBljPfrX8akNR8vVXaCLkkgp3gNm9xOzcWjGr4IXqFZuXfVHkQFqK7dFK/BtLpv
	 LX/wBxqZea4QqUSR8NsFFBmC6xY+2dKtJAgcBPIjz0U7NKUbQ5vF/ptVdKI+7sPZinQu4
	 IiMntP/AfNMYzWssJDjyDlmgYRl3ubHCt4N2I19T/y5+SSXCKVjMCVbosLIFGcZZJyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705665;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=dH7CD2rNLFDt4vFYO7CU8n53SbMou6nWupr2ypIPRx0=;
	b=F6Z84aIK7BI2lg2pBPqaHW4yJ59kFd5IpkbjQMidi7B34AI8IPzYb1e3AAm60W2j+X5e
	 ScHLwyxiAXw5xIplAcj6Jxg2aFRx7Ta7MQuOOiVy6JgIjb4N4+B3lRYf2r/w5HK3wbiL7
	 uT0tdpfPrvwdgOOIWkj6rnx5bniCD8FQ6EN1yMUDOi+3wmKsr2pGFi9MRfYVHDjWKhel5
	 QRw9706mqGf4T8wrKXpZuEwMP37qX4/CRbxDtPehqrXfUIpKAXd6mFw14kQBUK8r5vjrj
	 8ducpLxbsVkDEOl0YpJ4cB/KxD/Gu4WgZZXqcGq/i8cY7/BPBPU5Q9C6ioyAFqdu3bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="g/5Vrh3E";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF719606A330
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF719606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=g/5Vrh3E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AB811BA8;
	Thu, 26 Nov 2026 07:07:41 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9D213F632;
	Thu, 26 Nov 2026 07:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795705664; bh=H9M6UHpvj+4BdAxHU0WJzfBL5Pspw+2hpNxMUL97FVw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g/5Vrh3Eq2YfQz8mnrZ+4xscF75eANeLruFw5YYXhXwKi0DJkX751A5Vr/r1O83r6
	 2MUzWUVYF3mdG/DYRi4/y+TcM1BWboS6dvihCgqWAgBsGJfcEjQBo4fONR0EJH9MfD
	 OTNeJrqRXlcqoqw6Nm69GIFGSYev5USnn9L+sWtQ=
Message-ID: <6f5d98b9-8636-431c-8b75-a08eb428d386@arm.com>
Date: Thu, 26 Nov 2026 15:07:41 +0000
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
Subject: Re: [PATCH v2 02/23] coresight: trbe: Make watermark range check
 overflow safe in __trbe_normal_offset()
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-2-3f57cf3199b1@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-2-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 17:55, Leo Yan wrote:
> The current code checks whether the wakeup point lies before the current
> tail by comparing against handle->head + handle->size. That addition can
> overflow when the monotonically increasing perf AUX head is close to
> ULONG_MAX, causing a valid wakeup point in the current writable range to
> be missed.
> 
> Use unsigned subtraction to compare the distance from head to wakeup
> against the buffer size instead. This keeps the check correct across
> potential wrap.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index eca8e13a97447b46a4b383049aacb3fa7ad3c329..02d12445763a86d58c79bdf5143f761827456bc3 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -526,7 +526,7 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
>   	 * +----|---------------|-------|-------+
>   	 * trbe_base		limit		trbe_base + nr_pages
>   	 */
> -	if (handle->wakeup < (handle->head + handle->size) && head <= wakeup)
> +	if ((handle->wakeup - handle->head) < handle->size && head <= wakeup)
>   		limit = min(limit, round_up(wakeup, PAGE_SIZE));
>   
>   	/*
> 

