Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771542;
	b=em7uXoeKmDgJN/xyEiFFW2mZSOaV4tyBmB9Q7ELWKoI86bR1Lo0AZWaF1YvIpIN6oIfI
	 viC3+Uk0feMDfGXtR7Gf8CI3ACTPPpEl7PYXLQG572L5XGjl88q+AFXbZkmy8+fJJSZk8
	 25K3Z9v+00482xGvzlvT5aAxPx3lJxOe3kRFmU0GL4XwEf0QAcXm9jDirOKetzQefkgN+
	 l2NJHpoXj4LH7gsJRd8iOxhfemUT9Ad3ZIYVxEa0PfyHnkHay9kIKpI6I4pmdMnVdkyvr
	 85eQp+fSPOafz93Qt7159XcfYtZaG7oGt+h5rCl+werjM53jVjn+rAFCO4VHLh6JTRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771542;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=kRUs7ZAA7rua9kayF2pDKhc5cHCXtHDqEJmwG/etACg=;
	b=G/EYs3vxUoW6fgp++4J9hLSEUrMsIOAv8djELRlNcim9U2yRXD5i2YK6FxCcS4d+r4cG
	 DANjoC90jkZDj7IKYshZtfm7ff1z1DhbIfmfEogf+cAhybyCpokqgaXNiGBCGhUfAHWK6
	 9QrYXoVfmnkCFix6fQJcSSmeL6xgVDbGUe/4ez5d8sxPU+AqDzd7pNts2AKxmYLo8rFe9
	 y+6PtOGT4PqxaAKCqs35r1v3sQHE7eO+CvLiL5qPLUX4qmn79jaAPw7C5Y3781sU4VDrT
	 49jKOWOgeJ7qOQBO3og++o5AU+UXUIwggStHytl7Bi8brg6boB5UMf46CpVgLYfxNJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=qSwD7ArU;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FC7606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7FC7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=qSwD7ArU
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26D5B1758;
	Fri, 27 Nov 2026 01:25:37 -0800 (PST)
Received: from [10.57.71.121] (unknown [10.57.71.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D74C73F632;
	Fri, 27 Nov 2026 01:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795771540; bh=YSVAsM6E2UvKH/5A+IJHT62yGjSLzdtkY7GEKsxCbj8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qSwD7ArUfrns96Uw1W2Xa+LsibwtUL38fvGa1XA+o3Eb9WK1PWh0vvWyS25qzXIVE
	 DFzPx8Q+CthlFKA6eOGCTMr/0msCmiDMzHxA/VDblvqpAGzy2czZqK1WBlUnnNfKqw
	 B0dH1N7W29k/ong6SVwymn1QXfAEiwJV60Rr9Ozo=
Message-ID: <9e4fa895-14eb-4770-8248-ad1da1503ddc@arm.com>
Date: Fri, 27 Nov 2026 09:25:36 +0000
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
Subject: Re: [PATCH v2 00/23] coresight: trbe: Refactor buffer and IRQ
 handling
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 Leo Yan <leo.yan@arm.com>
Cc: catalin.marinas@arm.com, mark.rutland@arm.com, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <179571394630.2992027.10346522745976163448.b4-ty@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <179571394630.2992027.10346522745976163448.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/11/2026 17:56, Will Deacon wrote:
> On Fri, 16 Oct 2026 17:54:58 +0100, Leo Yan wrote:
>> This series follows the earlier TRBE buffer refactoring posting [1].
>> The work is now split into two parts. This first part contains fixes
>> and refactoring in preparation for wrap and trigger mode support.
>> Support for those modes will be sent separately.
>>
>> The patches are grouped as follows for easier review:
>>
>> [...]
> 
> Applied sysregs update to arm64 (for-next/sysregs), thanks!
> 
> [01/23] arm64/sysreg: Define TRBSR_EL1.EC event classes
>          https://git.kernel.org/arm64/c/9d3009259f0a
> 
> NOTE: I included the asm/sysreg.h change from patch 12 as well and added
> a comment noting that the BSC encodings only apply for "Other" buffer
> management events. Ideally, we'd be able to namespace those in the
> sysreg file for each of the MSS2 encodings but I couldn't figure out an
> easy way to do that.
> 
> Cheers,


Thank you Will, much appreciated ! We can sort out the auto generation
in a separate patch. I believe we do it for some other sysreg already.


Cheers
Suzuki

