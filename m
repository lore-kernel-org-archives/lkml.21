Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688661;
	b=HU9dGj92R4PIRyZb1LdRADmLrUGU2Q9k5k/RMV1SfLixx1h50hA3zIp9AAJiXE0b/8cj
	 TeRvNKPMIIZyCVT1QUyZbb8HNIkMXI8YFn2Yag5xjHdtzwLZ9Z/xMFkDfVk7saPLnrvKD
	 d1+qDysqlVXfjNeGG1Nw+Pq9q6nULH0GIDDL6heHjuWGqf7BJsC4/VcN8//MEPHR++Leh
	 DBcjMGo/TSqtDNnb7rypYFiJKF3ywqe1jCuh+VrSdvNpdtrwaHKN+gL04gqCJdU0Qv4+O
	 F6lWftwmU5WBK0tTXWS5z/x7rpL2E7dtWwvcaBe/jN9jm+v/hXRiZ64Xy4FyF8ydD8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688661;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=I+ew5cOEbDh/QLeFMJP76BK0TfrUPvpXSZGqyop1UAM=;
	b=yhx9Evcb5THnGJkCXyJ6ZMh75vKQdLM6blVvjXHjCGh+bGRrCLq3bZ7ABMP5Gxfg/QYQ
	 P4d1hey9cN098u0oeU6eqWnEVSvK77ty4p9gUtnYVGuy6qScszRK0XBQsafRbJcY+VtK+
	 OsU3RG/sYxyxjHOojMas6BbZT91mn0WUQO2uqNayBimoE53ajK2YptIB5bslj5rsVHcPB
	 IRcgriP/UpZBGukPQFJF94/qGrms+vgHpMziWfO56ZgADQPdBLcKfs4ftIaJSs9/vwIiz
	 qH+hAxEMh9jdDp35AsnLNWVTaX2Mzi6gzyDsHUrU1xuideG04kaY5bYMLgjG/F9VN9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="JNB3n/3T";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C3B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33C3B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JNB3n/3T
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B63CD1BB0;
	Thu, 26 Nov 2026 02:24:17 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99B8F3F86C;
	Thu, 26 Nov 2026 02:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795688660; bh=wQ9WA3KUKppIPPOGHeAfDQAVdxSATD/CsMT0ApV5e74=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JNB3n/3T4XoK8AOUq/tL2QQ0AwgNH3fpXW7vRZlP5hX6lAr6TM1j5mUGn9yobBTpn
	 06ma9Y1JdQzYArnaiB3L46VCBd+o+RqlAwLdvsVFK80A4d1Qthi3hiSnDMg+1Vbbhq
	 gw8GRnXrFDwhqHEXvE7WxGgxTFESpI331en0Zoho=
Message-ID: <dfea6dc5-6a2f-4006-8bbd-37844b6b5986@arm.com>
Date: Thu, 26 Nov 2026 10:24:17 +0000
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
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-1-3f57cf3199b1@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-1-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Catalin, Will,


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

Are you ok with me taking this via the coresight tree ?

Cheers
Suzuki

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

