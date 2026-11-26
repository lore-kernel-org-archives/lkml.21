Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717702;
	b=B7jL6v12OCj2/+CWUe2Q6MIZ8gHFBERGILl4G4kSj92B7gqllpKCWer/H6VicMA6q5EE
	 78nuj6+zl/Ory/skqosic43KrG9gdJLHgsoadCibuLQq3S5ugStbZ10dX3M/UqJ61PkUG
	 cwjwQ3SmgRZtrh2pzlz4DK+YuLOiusSo5okS8J5Ba1HWJxUflYyXwB0XwNZliN5DhaWYz
	 iHewChlDuFHNBo3+onrNMzqQUvu+kMkVYPijXB/yDdngPzy7tdv1F7MEHnmoHnjN1J80f
	 peSYVPRNWlUFu4/XygzkOA/6TDoKSMqFGhLZkKbHLjneeMI4KXAM/86pu0PznmopeJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717702;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=SgEXTnV8G+RJXc5Z7bgG1FhksN70TN1v7tDQK7jcQno=;
	b=T086o56meZ1DT16eF+Q+rWs0iuzj+yOQ+EcNuyH88XfGLWzgyqTA5k8SXzW9eHs7rGHF
	 5ddi0e32Ajw/10NyB4ZtszUGnHh5XO7ZgY7VmKfDMDmljU/QwDDSuxvdNdrEkqOUnn0t7
	 7gU0DAJsXPe2uNIxddtdsqZkgOThUACAZTweOqRHy5qyPTIXZ8sUFv67kGwCBN5/uvddE
	 3H75vL33C7Vmv5sWSZD5oLemHfzQW4zJj3opt4OiiWS8MBqVLSuMXl1hPpY8UJ8fAIefV
	 4AmGgnRL2ON4D1zR2SwJseX6S4krMG7rGA5dMXdKa+0lE/pKiKLz0HCisBpjZlg3BOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=rjHla4Zd;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BA9606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42BA9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=rjHla4Zd
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4FB61BA8;
	Thu, 26 Nov 2026 10:28:18 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C864F3F86F;
	Thu, 26 Nov 2026 10:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795717701; bh=ECKrBhRZGoMv8l0eh6hXdfHU+etv5qKLM+IN744ApMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rjHla4ZdxoOln5FT9RBk4AKTaSFTot7WAo7RH/foFNIjZNiF7/1FPToatwqioRhTR
	 APrFtzeA8oSIktJtLveVYom5CxtQQ7BW17rgUv9SpsSdxR+q82qCuRja+tTjPLT7DW
	 FcK5JbXvAyUPJSPYCow1FkWACmcDttWkoiglznWA=
Date: Thu, 26 Nov 2026 18:28:15 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: mte: drop the huge zero folio check in
 __access_remote_tags()
Message-ID: <awh6P5njoJ3eOVlI@arm.com>
References: <20261031-arm64-mte-folio-v1-0-a8bc2960d11e@columbia.edu>
 <20261031-arm64-mte-folio-v1-2-a8bc2960d11e@columbia.edu>
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
In-Reply-To: <20261031-arm64-mte-folio-v1-2-a8bc2960d11e@columbia.edu>

On Sat, Oct 31, 2026 at 04:44:54PM -0400, Tal Zussman wrote:
> Commit adfb6609c680 ("mm/huge_memory: initialise the tags of the huge
> zero folio") added an is_huge_zero_folio() check to the hugetlb branch,
> but the huge zero folio is a THP, so it is never reached. It doesn't
> need to be checked in the other branch either, as its pages are tagged
> by __GFP_ZEROTAGS on allocation. Remove the check.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>  arch/arm64/kernel/mte.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
> index f8d39e70857e..8615732567e6 100644
> --- a/arch/arm64/kernel/mte.c
> +++ b/arch/arm64/kernel/mte.c
> @@ -483,8 +483,7 @@ static int __access_remote_tags(struct mm_struct *mm, unsigned long addr,
>  		}
>  
>  		if (folio_test_hugetlb(folio))
> -			WARN_ON_ONCE(!folio_test_hugetlb_mte_tagged(folio) &&
> -				     !is_huge_zero_folio(folio));
> +			WARN_ON_ONCE(!folio_test_hugetlb_mte_tagged(folio));
>  		else
>  			WARN_ON_ONCE(!page_mte_tagged(page) && !is_zero_folio(folio));

Hmm, I added it to the wrong branch but it wasn't needed anyway since
the huge zero folio has PG_mte_tagged set. Patch looks fine:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
