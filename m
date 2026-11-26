Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711482;
	b=rD/4vtBCSrFK5ogOkc544OdXPSEnA5EwW3QjwnnBIPdHsqBFZbupNNpH5fjIZdWkXAL6
	 wgksnZdJZnio2p1A+n0ViKlwaC6u69YL5KnzXmDYAhhL7C8YVdAI1lRbYg4G1+dmiM3wE
	 xyk0Pn+eyv6W4HdhpHqaLO/vraQv0If3USN/DcTUy7WFsy9f1JsNSHADHqPQnciGKOwIa
	 /vqeeDphDJ/ZTO7phcB82IoHHG7K6gdps+v5s8VzEEou8lqtAGC+m+/d1V+ExeXB3bszb
	 HoXpKeROnp+Sre8nhTEvuUFeWzEtjqnGjg8rJLgMrNwpYZL9D5YMFx1vruCT3H+bLwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711482;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=y8Eg/yzSVCNhVFWmPD8/uMOmYnaralDAmMpwUmNw1QU=;
	b=t5AzXMLGJWcKo1rdqquLVC2wCW7r8XfG+92wirAJDY7aPmwMkmFhUHfobseiBt7QB2C8
	 fCxTNkys/u87lqEQlsgGveB+0idk3sl+sFdtGetyWCo0evOL0r3eMEQSXD+raVNUOsBvB
	 6Q1u5h02rzlUyLFxDn+sj6/fvWHuhVV6AUGe5L4Ji1vEldjII9MpK8ejGGb2own9Fa+cN
	 ekTy4rEZBsu31DFvTdyrdiEWZKKr51vgHMfJwMdh4hoXYznD16PUwcEYBT9EaG9U9FAHZ
	 9anhWKuoDq4LUOutc0y3AH9KJZFbwnbybvx3wItjT4jk6J0XqEtLEOqAIKua7a4WOhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ybm+ZCwO;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D822606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D822606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ybm+ZCwO
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FA531BA8;
	Thu, 26 Nov 2026 08:44:37 -0800 (PST)
Received: from [10.57.71.121] (unknown [10.57.71.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54D5B3F86F;
	Thu, 26 Nov 2026 08:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795711480; bh=NEFJ/kElwexbXWDUkbQAkXiAvulsTSqrsqEn0imaXLY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ybm+ZCwOCK+2HHO6FgbAX9my0/BTun88oGN77k4OSKnowsqqPT1G0kNcnjSVGQxrs
	 hY1K8G6HgrR4cxYM9czf6rU6rCrPBd98bmNsGkL5yJntkuJpHSF3PN3bQ4cHkdkXjK
	 QmS1PVCCCp0ddzDgt33JDReTrm7rr7d47ijybtHA=
Message-ID: <11d4ade4-e7a5-461a-aaa8-6ef1ca5019dd@arm.com>
Date: Thu, 26 Nov 2026 16:44:36 +0000
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
Content-Language: en-GB
To: Will Deacon <will@kernel.org>
Cc: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-1-3f57cf3199b1@arm.com>
 <dfea6dc5-6a2f-4006-8bbd-37844b6b5986@arm.com>
 <awhPHldqbDgiVH8A@willie-the-truck>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <awhPHldqbDgiVH8A@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/11/2026 15:24, Will Deacon wrote:
> On Thu, Nov 26, 2026 at 10:24:17AM +0000, Suzuki K Poulose wrote:
>> Catalin, Will,
>>
>>
>> On 16/10/2026 17:54, Leo Yan wrote:
>>> TRBSR_EL1.EC identifies the cause of a trace buffer management event,
>>> but the sysreg description does not name its architected values. Define
>>> the five encodings as an unsigned enum so TRBE status handling can
>>> refer to each cause by name.
>>>
>>> The values cover other events, Granule Protection Check faults,
>>> implementation-defined events, and stage 1 and stage 2 Data Aborts on
>>> writes to the trace buffer, as specified by Arm ARM (ARM DDI 0487 M.c).
>>>
>>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>>
>> Are you ok with me taking this via the coresight tree ?
> 
> The sysregs file gets updated quite regularly, so let me stick this patch
> on a shared branch for you.
> 

Thank you Will !

Cheers
Suzuki


> Will

