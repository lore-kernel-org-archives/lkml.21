Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795338490;
	b=arnvVRDtqcOBgssyBmUYp+PFJzhPAeM2208dQd7Bwi44aUJKp56hzQUfytixB76gxKdw
	 DTHUoCccz9nHRPtBUlggbaY5QVOV9ZCMwcv5Ugd6Bnc3zgjl4YI0y9QqveWrTxP/GjQYC
	 E5Wm/bMZ3eUDqR3deZpzTYtI9NFRaDJwhCL5E4sDE8Jc/t6ISzxY41mAfEzTIo2WDg0q+
	 dbVRyjNnA37wz5i0Lmj6Pxwj8vuM//0z8dwChDJkWOtRQ7J+AdIZ6PypEFejYt61DUKPO
	 9CSezpkgikjV1z9poGjPXl/zA/yVDTpLdxof26ysO0lU2G1LP04xlYAil/0kj3qMBlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338490;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=X/ImYYDd3EVaDS4zZsiu8vi3y7LYamjb/4uJ0SjgBko=;
	b=4svPPf/3zZZ6FF4jf8ABvvrokbaiW8Bg3OCODsVUTxQgLGT9V9zht/yDU1KdPxaFTCPm
	 d+elsU8PAG6wMfDuyrNtIvpB0Hz5sokWUeaMsAho1RP1HGbKG9WK60Box2ZLidvseSSA/
	 wEfzNtrl97LXNq5cZdhZd8A+v7JGPw+rV3CY7ldMtN4g+F5i9a/vHQLHqJsHIyKgpXruV
	 iICAPDF1BNZ9uRNSmYooIyaQ/eoVEsj+JJlrUsGoTLQgOREdWXWZBBH0Tx0eIkiQkdBFz
	 XrRsr7Pjpe20t3WZBWNk8z340TrENZCLBxS+S8hoKgZMTII65atNLCI0ioIgyyh2qyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Mfz+dcBl;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D180F606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D180F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Mfz+dcBl
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E14B81575;
	Sun, 22 Nov 2026 01:08:05 -0800 (PST)
Received: from [10.57.93.187] (unknown [10.57.93.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C5B73F632;
	Sun, 22 Nov 2026 01:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795338488; bh=jJiazFe28urFO1ZFl6f+3emwAhlj1WRmNGj87b1Acfc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mfz+dcBlgqLMjD5pjtIV6ikIyQIWy7mUwbWozOE9ZTw3/6Xpc3EBDuV7NrOFpRdxM
	 SzMqY0r5s9atCGMv0e+IiEv+ylc4HFyjn4ttVu5lrKG+8QojRnsnK+bYxfBIUx8S1s
	 WrhayFwuKHMkVVXO+6xTcDRXI8GYTdhmQ1aWxnLM=
Message-ID: <7f466d97-64f4-4b63-ad78-fef11bbbb919@arm.com>
Date: Sun, 22 Nov 2026 09:08:05 +0000
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
Subject: Re: [PATCH v1 5/6] arm64: cpufeature: Track BBML3 exclusions with
 erratum options
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Linu Cherian <linu.cherian@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261113145022.2592454-1-ryan.roberts@arm.com>
 <20261113145022.2592454-6-ryan.roberts@arm.com> <av3neu-9VTv8RgeY@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <av3neu-9VTv8RgeY@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/11/2026 17:59, Catalin Marinas wrote:
> On Fri, Nov 13, 2026 at 02:50:19PM +0000, Ryan Roberts wrote:
>> Several CPUs implementing the BBML3 no-abort semantics advertise only
>> BBML2, but cannot safely use those semantics because of hardware errata.
>> Omitting their MIDRs from the allow list hides the reason for the
>> exclusion and makes the relevant workarounds difficult to track.
>>
>> Add a default-enabled Kconfig option for each of the following errata,
>> and include the affected CPUs in the BBML3 allow list only when the
>> corresponding workaround is disabled:
>>
>>   3043240  Cortex-X925
>>   3043263  Cortex-X4
>>   3053180  Neoverse-V3 and Neoverse-V3AE
>>   3683289  C1-Ultra and C1-Premium
>>   3696239  Cortex-X3
>>   3696242  Neoverse-V2
>>   3696244  Cortex-A710 and Cortex-X2
>>   3696250  Neoverse-N2
>>   3696285  Neoverse-V1
>>   4196850  C2-Ultra
> 
> I'm not sure what the benefit of this is. These CPUs are not listed in
> the BBML3 capable list anyway, so the patch adds them but gated by a
> Kconfig option, default y. Is it only an elaborate way to tell people
> why we couldn't enable BBML3 support for them? Maybe the documentation
> part is sufficient.
> 

I'm just trying to make it very clear why certain CPUs are not in the list. With
the exception of A510, in general, Arm-designed CPUs that advertise BBML2 are
also BBML3 compliant and should therefore be in this list. But some of the CPUs
have BBML2 errata which prevent them from being in the list.

The information is all very scattered internally, and I've personally had to do
the exercise 3 times now, of figuring out which CPUs are excluded from the list
because they haven't been added yet vs which are excluded because of an erratum.

Perhaps it would be simpler just to create a file in Documentation/arch/arm64 to
track this and add a comment next to the midr list referring to it? I don't mind
how we do it, but I do think it's valuable to capture the info somehow. I did it
the way I've done it because it looked like the standard way of documenting
workarounds.

Thanks,
Ryan

