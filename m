Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795715789;
	b=0ItuLi5VOn4Y10MyxwsRwP9CLWiPDXsN9x3PohDc6QEolgMtzdMuAQ2XGDjV3oFI3SvY
	 +D1Ay3nNdswJKYD1LMrSIxgFvufd5jWA4103Wy5Y9cJQCrjsxoEyTN4xPPloME7PsVgZW
	 QEqBRrc6QK48rYLC+Fk0tOmZln1O763y1TVKphdG6r7u4on/61B54RrMZp/DXZTj9aYnx
	 xDZUkB41yuGod3UG4ic+Wy66DeB+NjkBlo0oonLR8x7eSScl8WNXIsrLOX/IE0SOGox22
	 fnjNG35b9pDXV+HCsKT+ZaMbwq9JLntacqc4DtUTozWzw+f9rNOW7ngSwywTgu83bvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795715789;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=opoQKkMaSFKlIYNfJJD/NSwL+CLSL9USTI2LdiHwLKQ=;
	b=Mr3neVNOq5UXNszHZ2ngfJNNb3IA00rmBCSwjgbrwBrbuxiewOL6bwsFuN3ZRnn614a8
	 INx8rjjGfmv3GZjQb1PL6FT1WJxi1fXDLrbm67FxQ2+4oIJA/+FpJhtXfpOBCt2rETqVA
	 BuXVkrwp1wQyBbPM4vHd8IHryIy7K0PlOPueWeUOffoa6ufhFS+c08PqSRZ+kazf/Uu3w
	 zYl874/Xs+rRJdBupvqeMI5kvI69YksadUV+oXZN3+umzTNBGqdlQUn3CpivhEU+X2z2Z
	 YpI6BtlC6tkUFVEavwmIF6Uk142z3Urc6AhV/TZ86J8yXrg8lk+Y5uBVhChSJN63e7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uuxTBL0D;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B49606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64B49606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uuxTBL0D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0E961BA8;
	Thu, 26 Nov 2026 09:56:23 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62D303F632;
	Thu, 26 Nov 2026 09:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795715786; bh=1nsm/TtIfs1fFv+oARaSnNfpbfDJKckMkAWjRr5+/9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uuxTBL0DpqsO947FQTHtPwNUypCGX5mu9ZhLQJoL2QZwA/lc6f2WNQuPyh0++DR8n
	 ZZYrHDlHcGyRQPKlX+oBZR1TlY326qmGX3Ew/IzwVJwwp28d7rxiy+ysJoRXg7gfh5
	 nSMdOVMw8rP6Kydxx4TfooMsn3PwT1V+PWeKxPqw=
Date: Thu, 26 Nov 2026 17:56:22 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Daniel Cashman <dcashman@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Limit ARCH_MMAP_RND_BITS_MAX to 24 for 42-bit
 VA
Message-ID: <awhyxoPzCmO0grrN@arm.com>
References: <20261111042027.1541604-1-anshuman.khandual@arm.com>
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
In-Reply-To: <20261111042027.1541604-1-anshuman.khandual@arm.com>

On Wed, Nov 11, 2026 at 09:50:27AM +0530, Anshuman Khandual wrote:
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 1075bc661833..8d8b1331178a 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -300,7 +300,7 @@ config ARCH_MMAP_RND_BITS_MIN
>  config ARCH_MMAP_RND_BITS_MAX
>  	default 19 if ARM64_VA_BITS=36
>  	default 24 if ARM64_VA_BITS=39
> -	default 27 if ARM64_VA_BITS=42
> +	default 24 if ARM64_VA_BITS=42

Why not 23? The comment above this config entry was meant say it's
calculated as VA_BITS - PAGE_SHIFT - 3 since commit 8f0d3aa9de57
("arm64: mm: support ARCH_MMAP_RND_BITS"). However, you changed it to
"... + 3" with commit 51ecb29f7a65 ("arm64/mm: Define PTDESC_ORDER"), so
you may want to fix the comment as well with this patch.

-- 
Catalin
