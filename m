Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792823;
	b=rAR3Bvmy2NuUCB8KrjpRv6w2OU/FFNAwLTNBVnjAmej6pt6o8AMQ4eloQgsC1GhhvBPo
	 EC3rIw8M0G1A71kYFvi3xp8tDGWiCLm2HEysuXxBvIXBk63dW/oDgZ0O/BCDUzGSMeFmj
	 d+vC3cdHTOfY+vIeDx+xCBdo3XnlFwxj9QemKfsrPn3526fz5CJO3VaeuU0lqEUtpmLRF
	 SFw2A1dUt8MlQwscn5f4o36cUwBCeK3raG7jig+Pb9HjZLFcSq25a1f/96gqD6Yks2xKL
	 f79lHjrlhuYtSZ85jhPL7O0vxHXcIMrxoFyifMKLWVBNgxCgYfRNGw5Nec7ovy6ydaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792823;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=OWE29uFtdXjnPVSYrt1Bh9uULEOob+YcjPT4yEGlz2I=;
	b=iK3AvlxhqJYYNstYWIQcSYnuInarihmpHqnvcVtKsVm+2b45ojnOCqOk2sK2ZpxdC6XZ
	 Ccd1IR2XBZsshjJ/MAlYligJDBWVk394jKEypEHTmWNIjIOIECnZPwIXspyBOz+l2SHeY
	 9I/LE2VFL0sxYqqC/20LJicshvTfH//djUb10sTH1nE+10B3oKnnaOGu8K7o+eLphfl9W
	 fRxbBvkl/Rq5Gh1BIDTBvg12kBgdbsMKEqk3o2jK9vqchCWLUcLDcrYIW3X0l69mwIkVr
	 c0C/mxzP0lNf5wsP3ep+XLvMzr4SLttrbvdTckXK8BqKyKtUxT2VtH8JqbrvODPQQNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=g81XMqwr;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA3C606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DA3C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=g81XMqwr
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6EC9169E;
	Fri, 27 Nov 2026 07:20:19 -0800 (PST)
Received: from [10.57.71.121] (unknown [10.57.71.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91D883F632;
	Fri, 27 Nov 2026 07:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795792822; bh=ZlKtMOJ/8yeG2xhi4j9uF/kBsbs+sWEiMz6tTAhsT1Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g81XMqwrKio2yZfop3Ht1FXPVQTLBHirA5+NO9yNBCbebB1/h1krLrSNE1DRXYO4k
	 eJ1j4Gc0Er1NEXjGs6zCmHcg2EAQYeWQzDIdxQF2iJcX5b9OBIvNijtfbLL1WXXR+K
	 zN8hCfWlbPJ0CzBix3BPU7vfHNB2A4ly+aLNbPPo=
Message-ID: <e69b3f22-f9a9-4cf7-83b6-95dcc8799c6a@arm.com>
Date: Fri, 27 Nov 2026 15:20:19 +0000
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
Subject: Re: [PATCH v2 12/23] coresight: trbe: Decode TRBSR status codes
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-12-3f57cf3199b1@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-12-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 17:55, Leo Yan wrote:
> trbe_get_fault_act() currently handles only a small set of TRBE stop
> reasons: external aborts, trigger events and stage 1 and 2 aborts. Other
> TRBSR_EL1 EC/BSC values are reported as spurious events, which hides
> useful failure information and makes the status handling hard to extend.
> 
> Decode the EC and BSC fields explicitly. Keep the normal fill-mode
> handling unchanged, but treat unsupported or unexpected status values as
> fatal and report them with a ratelimited diagnostic containing TRBSR_EL1,
> TRBPTR_EL1 and TRBLIMITR_EL1. Use %p for the buffer pointers so the
> printk diagnostic hashes their address values by default.
> 
> Stop using is_trbe_trg(), instead, use TRBSR_EL1_BSC_TRIGGER_EVENT as
> the unsupported trigger case. This keeps the stop-reason handling in the
> EC/BSC decode path, the driver can validate the status fields safely.
> 
> Move the TRBSR_EL1 BSC definitions to the arm64 sysreg header, and use
> the common TRBSR_EL1 EC/BSC names in the TRBE driver.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


