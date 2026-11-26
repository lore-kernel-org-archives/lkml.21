Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696122;
	b=u/800kqp2X6mkXnqP9jNILFA57Xrk2PyN/0EoxahUtQSJoLQ+YQ2CYMteASNWSttk1HN
	 uuiubFBX/xDlukl8ieM2/cWuxUnzY9PO2uBECLx4DwKeBhvGEaB/+sSZ26RTUKJhwV5WV
	 qkkBTG6arkpX9Rkp+w0ghF0Q1aZQYaEaST3Fi5GMDtAPsXwi4OVfPbcodQId98r757vue
	 +rf7fcvndj7sVVUuXuAmctH/VZjv7AHe3rqggYT4d0ENlAqG7Zu8JcpmKGIqMBFvL8vD+
	 SQaNQ9tBgvuAeRlYeaIIyoiIHxQod39p+cdiVR7+2XTyiRPvxi8CIBOZtu6qBbIaqKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696122;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=By9wjTOOe34Y8ZPHcZz8S+BrpYassCrx27UhnbbGrAo=;
	b=U3WqFQW3aGdz+heaXVTwtZX3OM7+aU6HLLQL5sr8Tgv+/alEMcBT+r0z2Q9DumCWuZUc
	 5omJk8w3LPeT1h7DSYVrYoMyWxT9FpAEUyv68fVj5D68R/jA7Q9po2c7HALFhWLKY6roC
	 i9Ok+Bv9hz3yzWZzVdCxBqFaWoRDswnVXRJNUtAJRZftE1AHoauy89V9irxFEWB3KefSG
	 ZSCcdnAZ+ooZyh0zB51/gLqNxv/OD9kMfp982TUEn8FB0/4TdSY+01CyKcbPoe0xUPrYJ
	 /l16UseGWb22l297aKsRsSATSbA9LpegtNWE58ExuWlWyX8J3A55JXB5LBhcfAZy4Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mH6OniO7;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00DA606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E00DA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mH6OniO7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6334C1CE2;
	Thu, 26 Nov 2026 04:28:38 -0800 (PST)
Received: from [10.0.135.195] (M0PRX50XMG.cambridge.arm.com [10.0.135.195])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 899483F86C;
	Thu, 26 Nov 2026 04:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795696121; bh=CtDIZY5JfDH8M7wFqXLRqQmiO0o0aXHpOhBaAPWYw8w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mH6OniO7ipWHu4LjDcvnH1nWgIka1lJfMVDZffJGFhJK0o0t4XeRJVYF/UjOOHR1U
	 1pllDDVm19c61KwnqFpy4p1Xb93d6HpiIBN7DvxdrFwfjva93Dqc09F1EFnF+oDD26
	 jy5I7p7sE4HF47XGhPTOW2JE9lP0fQro4Wb7aDCQ=
Message-ID: <06effdad-0a76-4d73-9542-cb628a40d887@arm.com>
Date: Thu, 26 Nov 2026 12:28:38 +0000
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
Subject: Re: [PATCH] KVM: arm64: gic-v5: Reject an ID_BITS too large for a
 linear IST
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Fuad Tabba <tabba@google.com>
References: <20261126100023.1286902-1-fuad.tabba@linux.dev>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <20261126100023.1286902-1-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Fuad,

On 26/11/2026 10:00, Fuad Tabba wrote:
> Without two-level IST support in the host IRS, KVM allocates a guest's
> LPI IST with a single kzalloc(). The guest picks the IST's size, up to
> the virtual IRS_IDR2.ID_BITS, which userspace can set as high as the
> host's. With 24 ID bits the IST is at least 64MB, more than
> KMALLOC_MAX_SIZE with 4K or 16K pages, and kzalloc() warns when the
> guest enables the IST.
> 
> Reject an ID_BITS for which a linear IST would be larger than
> KMALLOC_MAX_SIZE. This applies even for a Linux guest, which
> configures a much smaller IST. Userspace writes to IRS_IDR2 are new
> in this cycle, so no release has them.

Thanks for catching and fixing this issue. I agree that we shouldn't 
allow this to happen, and what you have here is a defensive check. 
However, I was surprised that this was reachable in the first place, and 
now see the mistake I'd made.

In general, we limit GICv5-based VMs to 16-bits of ID space in both the 
CPUIF (see vgic_v5_reset()) and in the emulated IRS (see 
kvm_vgic_v5_irs_init()). The userspace write path fails to enforce that 
limit, however, and only checks the hardware capabilities. I see no 
reason to allow a vIRS that supports more ID bits than the CPUIF.

Maybe something along the lines of the following in 
vgic_v5_mmio_uaccess_write_irs()?

/* We limit the CPU interface to 16 ID bits, so match that here. */
if (FIELD_GET(GICV5_IRS_IDR2_ID_BITS, val) > 16)
         return -EINVAL;

Are you happy to add this (or similar) to your patch, or would you 
prefer me to fix that up separately?

Long-term I'd like to remove the hard coded 16 in the vIRS code, but 
that's a clean up that's not appropriate for this patch.

Thanks,
Sascha

> 
> Fixes: 71091136d1452 ("KVM: arm64: gic-v5: Handle userspace accesses to IRS MMIO region")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
> 
> Notes:
>      Tested on FVP, on VHE and nVHE hosts, with and without two-level IST
>      support in the IRS. The vgic_v5 selftest passes. A reproducer that
>      sets ID_BITS to 24 and restores an IST that wide hits the kzalloc()
>      warning without this patch. With it, the IRS_IDR2 write is rejected.
>      
>      Based on Linux 7.4-rc3 (aebb727447640).
> 
>   arch/arm64/kvm/vgic/vgic-irs-v5.c    | 4 ++++
>   arch/arm64/kvm/vgic/vgic-v5-tables.c | 8 ++++++++
>   arch/arm64/kvm/vgic/vgic-v5-tables.h | 1 +
>   3 files changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-irs-v5.c b/arch/arm64/kvm/vgic/vgic-irs-v5.c
> index f73349c02656c..97362caef4433 100644
> --- a/arch/arm64/kvm/vgic/vgic-irs-v5.c
> +++ b/arch/arm64/kvm/vgic/vgic-irs-v5.c
> @@ -648,6 +648,10 @@ static int vgic_v5_mmio_uaccess_write_irs(struct kvm_vcpu *vcpu, gpa_t addr,
>   		    vgic_v5_irs_ist_id_bits(&irs_caps))
>   			return -EINVAL;
>   
> +		/* A linear host IST is a single allocation, limited to KMALLOC_MAX_SIZE */
> +		if (!vgic_v5_lpi_ist_id_bits_valid(FIELD_GET(GICV5_IRS_IDR2_ID_BITS, val)))
> +			return -EINVAL;
> +
>   		/* Min LPI ID bits must be greater than or equal to the HW */
>   		if (FIELD_GET(GICV5_IRS_IDR2_MIN_LPI_ID_BITS, val) <
>   		    vgic_v5_irs_min_lpi_id_bits(&irs_caps))
> diff --git a/arch/arm64/kvm/vgic/vgic-v5-tables.c b/arch/arm64/kvm/vgic/vgic-v5-tables.c
> index 8f72704209b0e..ae5f380fa783c 100644
> --- a/arch/arm64/kvm/vgic/vgic-v5-tables.c
> +++ b/arch/arm64/kvm/vgic/vgic-v5-tables.c
> @@ -1207,6 +1207,14 @@ static unsigned int vgic_v5_ist_istsz(unsigned int id_bits)
>   	return GICV5_IRS_IST_CFGR_ISTSZ_8;
>   }
>   
> +bool vgic_v5_lpi_ist_id_bits_valid(unsigned int id_bits)
> +{
> +	if (vgic_v5_irs_ist_levels(&irs_caps))
> +		return true;
> +
> +	return GICV5_LINEAR_IST_SIZE(id_bits, vgic_v5_ist_istsz(id_bits)) <= KMALLOC_MAX_SIZE;
> +}
> +
>   /*
>    * Allocate an IST for SPIs.
>    *
> diff --git a/arch/arm64/kvm/vgic/vgic-v5-tables.h b/arch/arm64/kvm/vgic/vgic-v5-tables.h
> index 89096926563f7..ba049978157b1 100644
> --- a/arch/arm64/kvm/vgic/vgic-v5-tables.h
> +++ b/arch/arm64/kvm/vgic/vgic-v5-tables.h
> @@ -123,6 +123,7 @@ int vgic_v5_vmte_free_vpe(struct kvm_vcpu *vcpu);
>   
>   int vgic_v5_spi_ist_alloc(struct kvm *kvm, unsigned int id_bits);
>   int vgic_v5_lpi_ist_exists(struct kvm *kvm);
> +bool vgic_v5_lpi_ist_id_bits_valid(unsigned int id_bits);
>   int vgic_v5_lpi_ist_alloc(struct kvm *kvm, unsigned int id_bits);
>   int vgic_v5_lpi_ist_free(struct kvm *kvm);
>   
> 
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3

