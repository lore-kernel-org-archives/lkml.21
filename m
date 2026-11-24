Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795492773;
	b=fzMnikY41LWf9VRQ7Xg4Dm3q4iJWtpvjMEF7YFmtkH2UPV0FLGqN1Zrdp4Hcw4tdxYMC
	 rW6/sa1UNdBtpuanUKDKEZm9pY3WH/5UzD6SeGerEE0l2ryby4Jv7yAmw2NA+ezVa7IhI
	 CnJ/zn67dnSGBqZyZzkbiMDcuCrVWYgWjjUUme5kVcVYU2Yr4+HeVm0KxpPms8A5tpwYn
	 7DWC9NISBqbyunv0taGt7HTg5bPIUHbbEaJSNyT/RZXEFNnZDYlobDXrydlbiNcMPG/O+
	 CNtULsrdiGGLDd4uoXGPGrKcymSAZWr/uOewBCYt/5YqMm3lkbmIGG2FS8y8pZH/Mgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795492773;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=nA83iQvRyaruX6IzmNJzRwewMB28MahrmR9i6SAS/Ug=;
	b=23+ltIWZl3zssJhh5gK/+cyer3wlgbrXE8SrZmLlhTFYMB/dOuyQD+/gr8eusLuNInRl
	 b6jVO7viSoCR4+58wFoDdgSle1ztb9AFSJ5f/QrQLXU/9413EbD0LhgshIWJkpwQGz++D
	 SCSS4zK60jwTUjW4rU8V1nN1yjYXA7bQpRA1qBrJBoarS7FwrvhEKl6IH4e0RRhJ4EhLQ
	 i58ZqGANuLe/mjCmIM1XOnHfsgy75VgWV46kbxxdclVfSfgEHQQR1uUiAxU8ZFBza2lj+
	 eeN6rSyqZu5MN47E0wGagIJ56Kr/iiyj8aHcV4cf4xuTFViIFWocsVtKMDKGfV67HYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ewmwo10n;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59690606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59690606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ewmwo10n
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47E90339;
	Mon, 23 Nov 2026 19:59:28 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F05E3F86F;
	Mon, 23 Nov 2026 19:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795492771; bh=Lplv50F+7kFs92k3xJrhQB0vZA6BC/BFMbC8nKa3qaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ewmwo10nvaWDPRnZDHJF9g3hyp3eiP7ZSNUjF5yJL2oz5MplNK0k3yrgpsLUJPBZd
	 u/CaRD4d9th4lGwA8M5d5PnIHZnbmrPM++yc1Ayr91UPjwRP9zP87WOp/sKrTulWT+
	 3X3krAWS93i/6rmQ6DyblMNt4p/Ta/Cr0B0jlPEs=
Date: Tue, 24 Nov 2026 09:29:27 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, Ryan Roberts <ryan.roberts@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH V3 00/14] arm64/mm: Enable 128 bit page table entries
Message-ID: <aqcypbxidjbmjhuiujg2krseuy7v4lofrlq3upl4s7yjiq6bh2@3s4jqisdrkgd>
References: <20261117070613.1183243-1-anshuman.khandual@arm.com>
 <20261120190525.GC1133597@ziepe.ca>
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
In-Reply-To: <20261120190525.GC1133597@ziepe.ca>

On Fri, Nov 20, 2026 at 03:05:25PM -0400, Jason Gunthorpe wrote:
> On Tue, Nov 17, 2026 at 12:35:59PM +0530, Anshuman Khandual wrote:
> > FEAT_D128 is a new arm architecture feature adding support for VMSAv9-128
> > translation system. FEAT_D128 is an optional feature from ARMV9.3 onwards.
> > arm64 platforms with FEAT_D128 enabled will now have two different memory
> > translation systems i.e VMSAv8-64 and VMSAv9-128.
> 
> Please don't forget to update arm_smmu_sva_supported()

Sure, thanks for the pointer.

Fow now will disable SVA with CONFIG_ARM_D128 enabled but later it can
be enabled back with SMMU_IDR5.D128 feature. I will probably fold back
the following change in the series.

--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -205,6 +205,9 @@ bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
        unsigned long asid_bits;
        u32 feat_mask = ARM_SMMU_FEAT_COHERENCY;

+       if (IS_ENABLED(CONFIG_ARM64_D128))
+               return false;
+
        if (vabits_actual == 52) {
                /* We don't support LPA2 */
                if (PAGE_SIZE != SZ_64K)
