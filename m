Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705633;
	b=qA29sHiBCFZqRqQZFl1LD05pc8Tk5zibRMEwH9nhOOYDFoTk+Frd9Qtkddr+le3hI+f5
	 sSEmSnOKHZZqtQGdbZRfVHm536Rgq+3ZZGNmnUVqlG18/OH/gfHE88l6/UPaQoblRReYJ
	 dkSgkh9jINdggL71NAillvg6ezFGXbOpUMREjvndi7rUgWUl57LkTkrQ9EWjAEYKkhAOE
	 ZTVyipE1AGdkRrIXuhh1dRjLnt2BkEnyyE28QHwhUphBrtFNJ6616DOi30PpiPxT1YNyZ
	 79mt4nYJs6mr67LPkSx6oqXhzVhgWclVP70M9ySAk55yTqRxJLMr5yVp9P+DD8dcXMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705633;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=n5CDoBf2Fv8xIfXCbmFk6XgifNpwifpcCpSH7gHISk4=;
	b=PJ4yfR4H4xCRzsw185DAy1zeqGSgowxIPhO32Vb+q0iyp1SrK858PKkOdqcpbTZz39jx
	 xEmx0LU0jzXVIxfT0bgyGVvlBHNcIzp6AbCnXrImJrt4csfLC48k6L5dX6cA6qE4WWsUf
	 sRQNkoz1a3RYuAQGL56Qm3wevbdna2por1u+P0PRoL6+y1GIDGEhMf8Xb9AnhOOEvtjV5
	 Ht3fPWMqQW3KTtWZvoZxcfHtteBXRpce96bw2GvIAaHgMksygU96xKmackxo/C7v4Zsrh
	 ppYeMj/QEnDN6BrAKWu5CqvpASnkIiPOuv4BMxG+DTXe5KjixM8gyzHrVWbHLNy9mFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=a6QT1NVK;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF6D606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAF6D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=a6QT1NVK
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 642272F;
	Thu, 26 Nov 2026 07:07:09 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 882A43F632;
	Thu, 26 Nov 2026 07:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795705632; bh=AieeaMTIp9KHcnC/OuZHb7mJZvRRhJwxM20cx/8+X7g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a6QT1NVKHK8E9Ne7k4nYf4VCoFSZSTEDWJbOuinJ/lHzhY1NS60TACeUnWPy4aPRN
	 LT+jNLq20k3ZSRsMXKH2ImZFvbx6bFU9aoNY9Un1GQb+B5VoPYYZ993PFJ/BGwHuvV
	 ZgvEjpBP20piuBS5XyDMLwa8iTl2IGknV4eS2hCE=
Message-ID: <afa190f7-4e22-4871-ba77-c2dccaf27e4c@arm.com>
Date: Thu, 26 Nov 2026 15:07:08 +0000
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
Subject: Re: [PATCH v2 01/23] arm64/sysreg: Define TRBSR_EL1.EC event classes
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-1-3f57cf3199b1@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-1-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 17:54, Leo Yan wrote:
> TRBSR_EL1.EC identifies the cause of a trace buffer management event,
> but the sysreg description does not name its architected values. Define
> the five encodings as an unsigned enum so TRBE status handling can
> refer to each cause by name.
> 
> The values cover other events, Granule Protection Check faults,
> implementation-defined events, and stage 1 and stage 2 Data Aborts on
> writes to the trace buffer, as specified by Arm ARM (ARM DDI 0487 M.c).
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> ---
>   arch/arm64/tools/sysreg | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 94bf065c8ac71f20f482c91a5147cb6e001dfba2..f68c23dd4e83ee4d00610e097d9188d3a2c9ed15 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -5834,7 +5834,13 @@ EndSysreg
>   Sysreg	TRBSR_EL1	3	0	9	11	3
>   Res0	63:56
>   Field	55:32	MSS2
> -Field	31:26	EC
> +UnsignedEnum	31:26	EC
> +	0b000000	OTHER
> +	0b011110	FAULT_GPC
> +	0b011111	IMP_DEF
> +	0b100100	FAULT_WRITE_S1
> +	0b100101	FAULT_WRITE_S2
> +EndEnum
>   Res0	25:24
>   Field	23	DAT
>   Field	22	IRQ
> 

