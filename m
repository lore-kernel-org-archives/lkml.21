Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264690;
	b=ISDsiCx0wAJDg9+q2kluTSt75E5+UXuNlldMrH8KO2XOlHliMNpxwi6Ox8OxkFk7jc8I
	 FbHFI/Vin7kPAtNjXhKBsra8/XXGUFPKmFF+HjUV73A2HGbLx9cDACZ4L1ZVBkkh6bU/U
	 oK2YBchNazdgB7jTeOwl3356lyKv18wgQ/9hQLiaoQWVJ7vdgUoBVulPrNDrSBJe0fPo7
	 D1/ITR1pZCQ++MZTgGybl4Lcre1OZ78NifLAUdtUVD2W//naNooGwuw5Fs/JH/zuF2RM+
	 cbKF61YwrOdTl2xFvnZQINMwp40e4i3AuENj2aVBDDxwnFCXaw69H6T7jt8HR2QDBcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264690;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=m5G/QICZ24fNOzMfjvXjLK2A3CcIHloqOJ+RgXtyUT4=;
	b=g4RUndIEV4AnIl80Lmoonn4RusWSN3rWaAbwMEoaqQ+ElcVqp3VQqvnwZOgvuO0TPM9J
	 Zm313vnaUAF+cRcmpEjdz0NJatup8OKfDTny3GNuvxziowZctdfPC5IybBD3P24y/Bz/J
	 KP5QJjK5uxN9lKDC7teZUQvMosGtWWWKVXEgbZ2HppRtfk1An7xHXqlkOpOWccBeMpxJa
	 KfCzTNCTV5juQt6VhyeJZcKCfAnG50UdPzMnjBrI4leO78kcLkx37/QKDftn3Oht6vlCQ
	 uxapMC6/vQ/hC8XVArzXrufKWdQBaK+1gloAvdnBSXDBoiRD+5PKoumGyDoR1ujnzfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BVd7DUyo;
	arc=none smtp.remote-ip=91.218.175.180
Received: from mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CFC606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2CFC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BVd7DUyo
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rRoUO1ekAv/EnBw/LqUWxSkU357wwykHVnVwqfZsCKg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795264687; v=1; x=1795869487;
 b=BVd7DUyoNQtYHAc4AxDOU+64n2ZFVG7Y9IswXb9+GmiSj5osvIXrsMxxPTJYs7PUDcCsV5L7
 jJL3bm9/PTutt5R29GggzbveN3rBIOYTNJUAEIIIxDAzfmGYxgzDqf1DSZ6WuUVth46xQ5ngwMk
 nw83sHH+nTiiOQbBQDGuw4H0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 51c69ba41e2b6b86;
	Sat, 21 Nov 2026 12:38:07 +0000
X-Mizu-Trace-ID: 51c69ba41e2b6b86
X-Migadu-Flow: FLOW_OUT
Date: Sat, 21 Nov 2026 13:37:29 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Tomasz Jeznach <tomasz.jeznach@linux.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Fangyu Yu <fangyu.yu@linux.alibaba.com>, 
	Tan Chi <tanchi25@mails.ucas.ac.cn>, Wu Fei <wu.fei9@sanechips.com.cn>, 
	Zhao Qingye <zhao.qingye@sanechips.com.cn>
Subject: Re: [RFC PATCH v3 05/10] iommu/riscv: Add nested domain allocation
Message-ID: <awGP5H2JdjxW8WXG@orel>
References: <20261119132744.396426-1-gong.shuai@sanechips.com.cn>
 <20261119132744.396426-6-gong.shuai@sanechips.com.cn>
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
In-Reply-To: <20261119132744.396426-6-gong.shuai@sanechips.com.cn>

On Thu, Nov 19, 2026 at 09:27:39PM +0800, Gong Shuai wrote:
> From: Wu Fei <wu.fei9@sanechips.com.cn>
> 
> A nested domain describes two-stage translation through guest and
> host page tables. Iommufd exposes this domain as a nested hwpt.
> 
> User space needs to provide the guest stage 1 configuration when
> allocating a nested hwpt. Validate the configuration before storing
> it for use in a physical device context.
> 
> Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
> Co-developed-by: Gong Shuai <gong.shuai@sanechips.com.cn>
> Signed-off-by: Gong Shuai <gong.shuai@sanechips.com.cn>
> ---
>  drivers/iommu/riscv/iommu.c | 153 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 153 insertions(+)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index f2305b953f71..4f8ce579ef08 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1698,8 +1698,161 @@ static void riscv_viommu_destroy(struct iommufd_viommu *viommu)
>  	ida_free(&riscv_iommu_gscids, rv_viommu->gscid);
>  }
>  
> +struct riscv_iommu_nested_domain {
> +	struct iommu_domain domain;
> +	struct riscv_viommu *viommu;
> +
> +	u64 tc;
> +	u64 ta;
> +	u64 iosatp;
> +};
> +
> +#define to_riscv_iommu_nested_domain(domain) \
> +	container_of(domain, struct riscv_iommu_nested_domain, domain)
> +

Please rename the macro parameter so it doesn't collide with the domain
member name, otherwise macro expansion replaces the member name too.

Thanks,
drew
