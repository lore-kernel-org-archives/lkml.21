Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716924;
	b=pb03dYSliwnXrB5F5T09S44ci6uWIM9hmRtLa6BHanUiMpGC4+++YcdxKyY8WoE0OxNb
	 X+LvMAxPL6ctJgizlp1TYj5hP5WJVfkDcup3RwSsyixK8wzsRlR7h7rdIN7QQ8RIlJ4ns
	 C9+R1GuQ+Y7QB4921xfwoIlR27uu/Eoj3USOzI44BdoCBcKb6nRgpJ53YWQAi7AxNKhAI
	 g/IjdglYSrpEjJtIIVmImcRL77ykhNd7Sxrv353Ed2NDLwL5qR/APSaUod+HAYOlXhHg2
	 g2fMrFZYMPMozAv6yhTpLi3LVoXx5YRffM8US9N8B+XLmWPG9svtT5z3ZY7ClmqLpCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716924;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=cFQo402s/Fz6nnj+eeiUW50ni9vNMRzPOqJuqB/lQEo=;
	b=5LjI336NBtqXaSD3HIOm+AX42qP7fmugPftXBer8t4DbQmKK9xar7OTxatXOvSBhjE6b
	 meU/duyQc+lR9LUA2Sq+YpGtDzd9dxMtv0srXzYQNNwjAjaS/jd/JcaIjBZ2+Y6aLt3cd
	 VbPUTig+/0+3BkIQv3hWB7FVbAP7dtmn0xhENvA0xmeu73XC+heLLy5rVGWHnvv2z7iN/
	 o33i+XQCoEy+lZB/gkeV89O9fwm8NcWBl3qTfd1agGpv1rj9+4kIgxA1FLGvdlNl6kATq
	 CPqu2bjmo+H11wNdzzJ+/8W0t8P3n+L3mE1cCO5DYyR/rOOe5DbHZMyzGLv2+lPRNjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ibgjXQfZ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A64D606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A64D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ibgjXQfZ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 206EF1BCB;
	Thu, 26 Nov 2026 10:15:20 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34E3E3F86F;
	Thu, 26 Nov 2026 10:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795716923; bh=fFLmeqXRVi+pIZg64SKPcWKpICPRmHJIpCmWyIyl1CE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ibgjXQfZuWDo6i5tet1FFpwyi0Q9bZeCLyXXso0ez5znuAjoDvnB0rPJgkTB0SF0D
	 TDV5g54Vs6Kgc5EMutlaN4aMfG6jdlkfnzMjUtz40sa1sqCCDo5TgmPOm2LE4Z1keJ
	 EeJPSrq37ZpN0w7J2fOZZBJep4GYln/jZxchKhME=
Date: Thu, 26 Nov 2026 18:15:19 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: mte: use a folio in __access_remote_tags()
Message-ID: <awh3Nxe_NMHIDl54@arm.com>
References: <20261031-arm64-mte-folio-v1-0-a8bc2960d11e@columbia.edu>
 <20261031-arm64-mte-folio-v1-1-a8bc2960d11e@columbia.edu>
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
In-Reply-To: <20261031-arm64-mte-folio-v1-1-a8bc2960d11e@columbia.edu>

On Sat, Oct 31, 2026 at 04:44:53PM -0400, Tal Zussman wrote:
> __access_remote_tags() looks up the folio for the hugetlb check but
> still uses the page everywhere else it can use the folio. Use the folio
> for the rest, which removes the hidden compound_head() calls.
> 
> This removes the last use of set_page_dirty_lock() in arm64.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
