Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024767;
	b=WiURSGD3f+e9X83Plsp9L0i36RX92HMKyLaRiUm66opn+muHN29e+PaGTeU9B4Stw8PE
	 F51kZI5LFI/S9963PtaDcQmi7VhxSP1oxOiHDjaoxLM3TNSYW1TnBCx1Q1NzMKYwXchKY
	 oHh7zFVkmG9X1WB8HWGtI2gvjMDDmsg9McIOY69rHNu3qOPS+/OBQsdvFgdGlrCdbSz8A
	 CYaYNRqUc3c/1dirYoKZKbMZ/V9OZF7iZQwIJAK9pOFwqNaKcR/RozwwKyk1jg34YVUdX
	 3wHUVzbjD56JZSAT3x5dPOVedYxGM/VcCkBHetVympWQpSRRhJIUZPVcx87Lnd7UhzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024767;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=+gnTC7J6XuQNe3AgIxA1ksVKCCNmvsI3infUbJm77Jg=;
	b=K3Y2H+KhliYHZdyxkcyUCxBJKZTqyFutbEeGyLeVwEjZ7xFMSwhOZY59Kp62XsOa6hRn
	 eBIY7bm8w0omIBlKabUkGfO8caH+KmdqgFJoZN9uuVPGDF1OJdTCH1kjOxwl9gyNm6lwC
	 hV5R+AKvDfLd2UL/dVBUN2mOeK9GAOHiMBXjCByUudS2cKS8TMhiFhqBIxY+3BTUZh+a0
	 M+jc31Uj7+/C6BmHsLCyvMmlEr7WMOvS6zqlyxQhhdSTx9eGpv0sRey7lkRivl4vgWj/O
	 0LUAOFTFrIEVYU+9EqVrbVZmtYjgiDaRGQGXTaeCbpYK30I6gipWDOp2V9W6i+WrYmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=W8GsXwyw;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DA4606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20DA4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=W8GsXwyw
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3DF91477;
	Wed, 18 Nov 2026 09:59:23 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE62A3F632;
	Wed, 18 Nov 2026 09:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795024766; bh=GdJnCBh89kOv9bbe6kyAqJ9BHbXO7SU8lXBrgDqy/yE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8GsXwywxidLqvIpu9Yh3/c6OgrC+JIidTlopUe4LXzpaqHhXvZCOZ4JqskNKiXrH
	 B3fIeamvRVPFCLGh4qjsDIA/I3cppb9sEDIVAMZlh4+B+MvsHkjSKIEAzk7/BR9f6S
	 1y6YYsy0l51md5ln2xsHqa/Td2OoN2hPgBx7dX9o=
Date: Wed, 18 Nov 2026 17:59:22 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/6] arm64: cpufeature: Track BBML3 exclusions with
 erratum options
Message-ID: <av3neu-9VTv8RgeY@arm.com>
References: <20261113145022.2592454-1-ryan.roberts@arm.com>
 <20261113145022.2592454-6-ryan.roberts@arm.com>
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
In-Reply-To: <20261113145022.2592454-6-ryan.roberts@arm.com>

On Fri, Nov 13, 2026 at 02:50:19PM +0000, Ryan Roberts wrote:
> Several CPUs implementing the BBML3 no-abort semantics advertise only
> BBML2, but cannot safely use those semantics because of hardware errata.
> Omitting their MIDRs from the allow list hides the reason for the
> exclusion and makes the relevant workarounds difficult to track.
> 
> Add a default-enabled Kconfig option for each of the following errata,
> and include the affected CPUs in the BBML3 allow list only when the
> corresponding workaround is disabled:
> 
>   3043240  Cortex-X925
>   3043263  Cortex-X4
>   3053180  Neoverse-V3 and Neoverse-V3AE
>   3683289  C1-Ultra and C1-Premium
>   3696239  Cortex-X3
>   3696242  Neoverse-V2
>   3696244  Cortex-A710 and Cortex-X2
>   3696250  Neoverse-N2
>   3696285  Neoverse-V1
>   4196850  C2-Ultra

I'm not sure what the benefit of this is. These CPUs are not listed in
the BBML3 capable list anyway, so the patch adds them but gated by a
Kconfig option, default y. Is it only an elaborate way to tell people
why we couldn't enable BBML3 support for them? Maybe the documentation
part is sufficient.

-- 
Catalin
