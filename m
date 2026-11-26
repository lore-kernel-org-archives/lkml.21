Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705606;
	b=CvdkUPnk+BAf5Aan5/5uULJ+Y3d3N44XsvO1bppULWYmx+XRzr4KOxiAm7WvUYWCAqcC
	 8ScruB+0x6ocFb8Z0YI9ut93tEX0EcmSX2iWHFzbOZ4J2vPV9AoRop94drQXdZPJulURB
	 nGDk3Ymu4MFjXjK0/Mh92mwqMiZWQr5O6VCcC56uFQGBi0CsfgEtcTuxjuUlqKv03jtmv
	 AvyAWXlzH2MfPimSHyhsQ+jtjpcxZvwjbESaw01F4bJwrPps80xqgQWxL3o1RP2+bg9k1
	 GA2LusbFrIzo9HZ9qU+mrYNTvV2SSRwkTATo119ayXHnBLZwNa6eo5z4YyZO07PCN3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705606;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=yHJjnqdL844yp5/3cL/zMhtXYOJmPCTodyX0lwRgvCI=;
	b=WkaL/fbrpq9fG501nIIV3FUpwIRyOlCDcmPp7Un/V34y+t9AQ5l5QWXmUPk1HVlVusB0
	 apE5d2ukqZUemVaEfL7ZtGcrEgf22fETW1QWOz2i0GJNpoAFdpBNWCeZMuDVrxWmQiyJe
	 OEC5sHNCT+8zc+1sOzjOR7rtGH0AZRjCE9JvnJF44C3h2Tn/I9jehh8+YtueKvwRLlzwo
	 w92z7KrmqJDeNJwWbUhYaw2NXsx16TEBElqH8poLlgtWZo6X6TU+R0O0O0Gg15YU/SZBg
	 NA5PL2Ny4XM4uUtMm7f+EVRyFhBbJNW/fDhHNKFdNQrc4ADyW7A1mzjTFmT7G92bh0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=N2hGNppw;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFA9606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AFA9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=N2hGNppw
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F6641BA8;
	Thu, 26 Nov 2026 07:06:42 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 992273F632;
	Thu, 26 Nov 2026 07:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795705605; bh=SmA81HTz62BWhHQAqzcRjjxEkt0pI5eNKUkgvke5O/U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N2hGNppwOkMZ09t++HZR2nuE+A9Z3b8AJjGcYJeGzC3uXEMBpLoEeDj/ntiRCU2Fa
	 0pzG35ttAnBovAGIXxyXKxs5Xw1mjwIW5Z5rFzn9wLnAHA7ycxPQnnLwIthCrzf1Ow
	 QngSq8U6ACLXbT9rzuHOa6Ci2tLWpBMqFIpG1dKw=
Message-ID: <e44a9c55-4fe5-438b-80b5-f2ebf09dc1d6@arm.com>
Date: Thu, 26 Nov 2026 15:06:41 +0000
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
Subject: Re: [PATCH v2 14/23] coresight: trbe: Treat access not allowed stops
 as fatal
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-14-3f57cf3199b1@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-14-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 17:55, Leo Yan wrote:
> Arm ARM (ARM DDI 0487 M.b), the rule R_RRCNN in "D6.11 UNPREDICTABLE
> behavior" permits a buffer management event when the effective SCR_EL3
> security state does not match the owning Security state. This can stop
> collection with IRQ=1, S=1, EC=0 and BSC=0 while leaving the other
> status fields unchanged.
> 
> With EA and WRAP clear, trbe_get_fault_act() currently returns SPURIOUS
> for this status. The spurious handler re-enables TRBE without clearing
> S, so collection can remain stopped. A retained WRAP indication can
> instead cause the status to be treated as a normal buffer wrap.
> 
> Recognize this architecturally permitted stopped status as an access
> not allowed error and return FATAL so the fatal handling reports
> truncated trace. Check the syndrome before WRAP and do not exclude
> TRG, since both fields are left unchanged by this stop. Check the saved
> IRQ bit to preserve updates without a pending interrupt.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 4aeed1a17c4bf1653fb41731ac15f31feec7ed2e..1c585b6123df2f20d08747678d836742ce9564cc 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -708,6 +708,14 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
>   		goto out_fatal;
>   	}
>   
> +	/* An access not allowed stop can leave WRAP and TRG unchanged. */
> +	if (is_trbe_irq(trbsr) && !is_trbe_running(trbsr) &&
> +	    ec == TRBSR_EL1_EC_OTHER &&
> +	    bsc == TRBSR_EL1_BSC_NOT_STOPPED) {
> +		err_str = "Trace buffer access not allowed";
> +		goto out_fatal;
> +	}

It would be good to have the conditions in the commit description
listed here for reference. Also additionally, I wouldn't mind adding
a wrapper to cover this case or even adding an alias for

#define TRBSR_EL1_BSC_NOT_STOPPED TRBSR_EL1_BSC_NO_ACCESS


Suzuki

> +
>   	if (is_trbe_wrap(trbsr))
>   		return TRBE_FAULT_ACT_WRAP;
>   
> 

