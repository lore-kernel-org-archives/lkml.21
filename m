Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083566;
	b=LnjnXwEWRUmRbRGQjuuvroTokTFJ24ZHv3+p1PbHQ1kts5eD/aQ9xkyCuCvjQ5xJ+PY6
	 JG0rCquT11NhILMwE7Oa4sFhvi2NVg0HfULvveDbMgQYTe9xUBaSghhoO8T8MUGV4pbgr
	 eofhs4TfHcS9XGcyuIadiZehEl3KMgStSWztp/3TIUKmkJNPlf8EQP599VTTtHZb/MiJX
	 vj+5Wfufmg1o2B1xGieHSRG/RZBwTOAkF02QrSKqeQmub/druhJCToU0iCUiueQ6gBQ4x
	 3IwiqUxs+xrr7E8u4BzHm9db5FtInzV0yGSY2nFS5CoYcPhdqAGz8Z6fUO9YTsHDTpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083566;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vAomtNjZ6UsJD1I1HKFswE1FILqWm4Za1n9fpztySms=;
	b=hAF9UhBffgD2tkD007nuTTqp0YQdN2CoNerP5FTILVVsZxYvbRp+CXgwpGhZJ+FYP5V4
	 KUON7Sn3KtI9YZPs4OMtIYlvn5GrYybwwknx5TJBdKsfT6m7q3bfDECq/SkFVFen10BI8
	 KoygXl7Gu/r+mGT+S5BJUxTdSBVoWdWwkxcHNYG+s2rb/jq9Eo0sZj8aH3ljsrDJCZ+9I
	 BFycjBNgZHzIQoO7zheRhMCxP20OxoGVuX6yvd2NHNihEaSINIvbLRgfs6tJoQwKWfa3Q
	 6+TxGF+Fi4tiloAJSGfoXlEIjwipDj4ilgC5/Ni9DrfF984LXpnhvHQXgqqvnwVUJ8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dvTfUc9n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4A7606A339
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dvTfUc9n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 791E41F000C7;
	Thu, 19 Nov 2026 10:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083566;
	bh=vAomtNjZ6UsJD1I1HKFswE1FILqWm4Za1n9fpztySms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dvTfUc9n1ambzTAdvzY0tsRxI9pLS2Ve75ZZ5K2gCs0nu9GFyxsdMo09xE1cYy5Qd
	 N7gi3EqiSfeTX7NTWoSX58YTpi1KAwn46Yz27NFBuK5Ihb2+a2eL8WcP0BFwE2l/mT
	 f2iDJNs45s88/Lz0RkoaB0z4k2TB6zqwSc8VW3Wd/sJjPIftIPsOyNcrDsNdVv9blO
	 YbaxkAewiSN5xorMa4zGC662YKIggku9Wlq4ETSufnB3tEwJl87lys4tvz0gm9N3oR
	 7Zaa7015rTMyIaWDnC64DZ8Xr8hwHwzQfa0FVgTy4vU0ilhlJBnB/gS7NXgx79tle1
	 S/VTuUpf7z8dw==
Date: Thu, 19 Nov 2026 11:19:21 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH v3 13/14] irqchip/gic-v5: Clean a level 2 device table
 before making it valid
Message-ID: <av7NKUmQdYabpjK7@red-moon>
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-13-13c1859e8aa3@arm.com>
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
In-Reply-To: <20261118-host_gicv5_fixes-v3-13-13c1859e8aa3@arm.com>

On Wed, Nov 18, 2026 at 05:35:42PM +0000, Sascha Bischoff wrote:
> From: Fuad Tabba <fuad.tabba@linux.dev>
> 
> gicv5_its_alloc_l2_devtab() allocates a zeroed level 2 device table and
> writes the level 1 DTE that points to it with VALID set. Unlike the
> other ITS tables, the new table isn't cleaned to the PoC first. On a
> non-coherent ITS, the zeroes can still sit in the CPU caches when the
> ITS reads the table, so it can take stale memory as a valid level 2 DTE
> for a DeviceID that nothing has registered.
> 
> Clean the table before the level 1 DTE is written.
> 
> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index cfa86aa68bf3c..7fff2db9ae08e 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -415,6 +415,8 @@ static int gicv5_its_alloc_l2_devtab(struct gicv5_its_chip_data *its,
>  	if (!l2devtab)
>  		return -ENOMEM;
>  
> +	gicv5_its_dcache_clean(its, l2devtab, BIT(span) * sizeof(*l2devtab));
> +
>  	its->devtab_cfgr.l2.l2ptrs[l1_index] = l2devtab;
>  
>  	l1dte = FIELD_PREP(GICV5_DTL1E_SPAN, span)			|
> 
> -- 
> 2.34.1
> 
