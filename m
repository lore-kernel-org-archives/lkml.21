Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532448;
	b=ckqovMkVClJDyBoy17HMJ0JlZ92mn7laSVqYH0Tt18j6VjQv32ilZ48IHBj8eh72cqwz
	 HbOuRuaBIuqlQXBgvQLou0MItrGQ+20yqJAJ3nk/7YQxHuBBTf8jps1h0cIYJNShuydRz
	 TNPcjDP0/vJlLIo529C+wvrdoBQvj29N/xPTSxYYkmoxWXnrw3Gt5eUsxmVCgKRQofmwo
	 j0Iowzeffd4ZKpfiUAVCPrEzCX7VA5rFPTTx2irSjDlDsycfGc4PB8a7jfs0j1tn6sET7
	 APrWwtqHMqxi76yC7IwaMhVwA5A/p3mr1ICAnWtUjPuE2XG81fu+Uu/4QzcFhqqApzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532448;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=b67nSDSKlbaduyToerD8/iZoRWrb26B2Xt6ysm6DMx8=;
	b=1bfP/mzlAHEkkwK25g/ebL+GOvFaCqLgcZvGTQuJyU0gWnGPWeg22FOXSgK2Qbn7bLgQ
	 Vl/bdo7L0gx+cRVaAUCK7p8RO72/SEpJuhlfOA25rjW9SkyG+qyiN08UaGyiiX56YK6dB
	 uNcZu6m/PRiJxO1zUUyxpnuaukkpp3o6ForlB8/lvmlcUAnL94HdBtfqIoaelDzLT4icV
	 EZhoKlNx7NPDZvqsVXZP11E4HKClm728TRNRA8uFhO3xL09v1Eg7mpxenCptVXS35n46y
	 hdn1mAW7KORbwC2l+chg9V20KsKfWPN2tj8FocX2oo7Wd2IqnAr2xy1rM2Siw8WTdCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kS2U9cG5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D954F606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kS2U9cG5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C011F000C6;
	Tue, 24 Nov 2026 15:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795532448;
	bh=b67nSDSKlbaduyToerD8/iZoRWrb26B2Xt6ysm6DMx8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=kS2U9cG5k3BNOeM1o/Yw8hJGE4Ji6v4sydxvExS7m9RLqCcI+DPL31/kMICv4OPKV
	 vT6X/Ojuj4/KkoVQe8jcYVfNoTAVTh9kzW/ZHIfxij2EjaVjkstoeTjJ1vJ/7Byj6H
	 yBLe/IthXY52U3iCM7C+3lx8RJSOjU5X6E7XjPTPNIzWzB1wQspciUisUpVJvuYuPp
	 bl3gy2gLxsc9Sz7KjRuViLZqHHCiZ6Y4dIq3512Ho7+NK8XI6KIVe9EX60TRMjbi/V
	 4S8e9Qa4TowZySUM/kgljM4hQKMHkrgmNlb+xWbNjcUW5XXqslgi+4ezi23RvsYDVH
	 ZJOzpag+LIKeg==
From: Pratyush Yadav <pratyush@kernel.org>
To: "Srivatsa S. Bhat (Microsoft)" <srivatsa@csail.mit.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>,  Baoquan He
 <baoquan.he@linux.dev>,  Mike Rapoport <rppt@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Pratyush Yadav <pratyush@kernel.org>,
  Alexander Graf <graf@amazon.com>,  kexec@lists.infradead.org,
  linux-mm@kvack.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MAINTAINERS: Add missing files to KEXEC and KHO
 subsystems
In-Reply-To: <20261124-fix-kexec-kdump-maintainers-v1-1-79c6a6144de4@csail.mit.edu>
	(Srivatsa S. Bhat's message of "Tue, 24 Nov 2026 01:37:53 +0530")
References: <20261124-fix-kexec-kdump-maintainers-v1-0-79c6a6144de4@csail.mit.edu>
	<20261124-fix-kexec-kdump-maintainers-v1-1-79c6a6144de4@csail.mit.edu>
Date: Tue, 24 Nov 2026 15:00:44 +0000
Message-ID: <2vxzfqwqz337.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Nov 24 2026, Srivatsa S. Bhat (Microsoft) wrote:

> Several files related to kexec and Kexec HandOver are missing from their
> subsystem entries in MAINTAINERS. Hence, scripts/get_maintainers.pl does
> not currently recommend the kexec maintainers or the mailing list for
> changes to OF helpers, IRQ shutdown helper, purgatory header and kexec
> selftests.
>
> Fix it by adding these files under the appropriate KEXEC or KHO entries
> while preserving the existing Device Tree, IRQ, selftest and live-update
> coverage for these files.
>
> Signed-off-by: Srivatsa S. Bhat (Microsoft) <srivatsa@csail.mit.edu>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 012a21e4afcc..bb4d9c20db06 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14775,10 +14775,14 @@ M:	Pratyush Yadav <pratyush@kernel.org>
>  L:	kexec@lists.infradead.org
>  W:	http://kernel.org/pub/linux/utils/kernel/kexec/
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git
> +F:	drivers/of/kexec.c
>  F:	include/linux/kexec.h
> +F:	include/linux/purgatory.h
>  F:	include/uapi/linux/kexec.h
>  F:	kernel/Kconfig.kexec
> +F:	kernel/irq/kexec.c
>  F:	kernel/kexec*
> +F:	tools/testing/selftests/kexec/
>  
>  KEXEC HANDOVER (KHO)
>  M:	Mike Rapoport <rppt@kernel.org>
> @@ -14791,11 +14795,14 @@ S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git
>  F:	Documentation/admin-guide/mm/kho.rst
>  F:	Documentation/core-api/kho/*
> +F:	drivers/of/kexec.c

Only a small part of that is KHO code, but adding it here is still fine I
think. Thanks for fixing this up!

Acked-by: Pratyush Yadav <pratyush@kernel.org>

>  F:	include/asm-generic/kexec_handover.h
>  F:	include/linux/kexec_handover.h
>  F:	include/linux/kho/
>  F:	include/linux/kho_block.h
> +F:	include/linux/kho_radix_tree.h
>  F:	kernel/liveupdate/kexec_handover*
> +F:	kernel/liveupdate/kho_block.c
>  F:	lib/test_kho.c
>  F:	tools/testing/selftests/kho/

-- 
Regards,
Pratyush Yadav
