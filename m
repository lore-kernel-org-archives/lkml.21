Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089920;
	b=f4N3gryzgRD6waF5sgDtZO8m7buoGST3KG7+WvSrKuTcXXWnxO1zLUf6Tu5ssaB+qfYf
	 pLGyG2K8qO+/Xpd1A9shKppovPsFu8kA9XRFJlhwmbnc8ulkXa9PYaxoRIcWCs+4TYZ4U
	 mmdD59JkUfjuvxqK4jTpGbq/UAgM9OAO/P//36kjknDMMgycrRox5+Y20cejTOHDCSAia
	 7AcK4/fkRPq/6BZqHr0h+8AI+otDNpWuDiLrlyrw+23gIxJRv6OLIBopaGMNN+m4iWjqX
	 rutqGsgG5YZ7CYj5tUOINX+VkGDUr9APuDwmikKTN/k6uZasrewn3182bRQSfhEq9pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089920;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FBxJcPXeAm8QKAUiFswz58ZNqPTA/e/PJf+hWh7nZOk=;
	b=P3mLH8bIkdVYQZOC0AVMl/7mGFaYVhs7TQAsZwxogbOkQfi/JrZbESi6eRw5ySQ7IScw
	 JN1/aZNm1ymJGz/dn8oy+BP3oHnzdd5tRmdv4ZUx6zoDY8CUSOpeSKHlrF5tVZRwr2dZu
	 QayrAAG9kcx/RQxQIrIFcwJzDUFQ4DL/0MmjNdwpEs7drr/T0qh+0XlnAaWrhhhTPLgFv
	 t6oJg0KxZPnD5fdMAYcrY8Yc2dg9Zhg/utvgyaX2Pjb5rUDkEchrztjuABCM02GM2PRFp
	 HieoC+j+x0I6jYTtTUfgkTJ3129z3ViMpdW6nDiAhyohXILwxJMFw+5l2GrWvCF/LlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F19LKSe7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA66F606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F19LKSe7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F11B1F000CA
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795089920;
	bh=FBxJcPXeAm8QKAUiFswz58ZNqPTA/e/PJf+hWh7nZOk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F19LKSe7uDen+UvWYVGeYYdk9oWw0ri9Y5JIS3d16mhgInPtDp0AyEAPEY0AK/AJA
	 AWBSc0NV1eTlvSs2pabj0ptMpNlbCbQFGTo+bzKE+2Z/wTM09vqSwxUF624zvojg86
	 EE+98soll+0f2PeedrC8zb0l867y9yYGNOgRjexyc+1YqR32fk0DDkLFsqwv8tRKr6
	 KEE8YMnYIdneUSySln43y+p+2irxKQ/JgWo8FKZhtuQyzKHVa6TrxEQX/hckIl/btV
	 A3bUjmy9zwA8+VgRGdOwjPQnu/hlCuA8gGwOLVmEM+K9r6r2AVkKrjpGacHWgi/wpn
	 tChIou+xt4Fbw==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so2938235a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:05:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFEuWlj8Z3Il5vdsJjNlyz77MwrKe8vMC9/0lQC5Zy2B1JBG7a/40Gs28P4FyW3IefQqT/Qf5W7PpBCaJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MLrrZt/b+j+zRZ3TVkrtIBdW/VsOoHSE9GnbQEsnScDZqO/FX
	yhYLu9xizEjYrZBJECL12ShfgOWlldeQVWWsG94CMedzaYHiJBgdT0Gk++TeOLJf2+uaYVOij4c
	gl7pr1+rkKvK/u/mHd/EuSf8Ol0FVqcE=
X-Received: by 2002:a05:6402:1ed4:b0:6b5:5530:c9af with SMTP id
 4fb4d7f45d1cf-6b887e83a81mr4871588a12.15.1795089919238; Thu, 19 Nov 2026
 04:05:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119100216.10182-1-dongtai.guo@linux.dev>
In-Reply-To: <20261119100216.10182-1-dongtai.guo@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 19 Nov 2026 20:05:08 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4pmcV8hah8sPyQn3nR9cO-NwkXMPLeSABAO-VEnS08fg@mail.gmail.com>
X-Gm-Features: AclHuK_cEZcZkwIHDpc5O50alIIDUZZaaZh_szL239OmmvVzzDhSkIejCjgHXmg
Message-ID: <CAAhV-H4pmcV8hah8sPyQn3nR9cO-NwkXMPLeSABAO-VEnS08fg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Allow memblock arrays to resize
To: George Guo <dongtai.guo@linux.dev>
Cc: kernel@xen0n.name, rppt@kernel.org, liukexin@kylinos.cn, 
	guodongtai@kylinos.cn, loongarch@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, George,

On Thu, Nov 19, 2026 at 6:02=E2=80=AFPM George Guo <dongtai.guo@linux.dev> =
wrote:
>
> From: George Guo <guodongtai@kylinos.cn>
>
> LoongArch never calls memblock_allow_resize(), so the memblock region
> arrays cannot grow beyond their static sizes. For the reserved array
> that is INIT_MEMBLOCK_RESERVED_REGIONS (INIT_MEMBLOCK_REGIONS +
> NR_CPUS) entries. Once it is full, the next reservation that needs a
> new region panics:
>
>   Kernel panic - not syncing: memblock: cannot resize reserved array
>
> The memory setup code was derived from MIPS, which never enables
> resizing either. Nothing on LoongArch needs the arrays to stay static.
>
> When an array is full, memblock allocates a bigger one from free
> memory, so resizing is only safe once all memory in use is reserved.
> By the time setup_arch() calls arch_mem_init(), the kernel image, the
> initrd, the firmware memory map, the device tree reserved-memory
> regions and the crash kernel are reserved, so enable resizing there.
>
> Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
> This was patch 5/8 of the LoongArch KHO series v6 [1]. Mike suggested
> fixing it independently of KHO, and Huacai preferred arch_mem_init()
> to platform_init() [1].
>
> KHO for LoongArch needs this: after kexec, kho_memory_init() reserves
> every preserved range, and luo_stress_files with 500 files overflows
> the reserved array without CONFIG_SMP. A bigger array cannot land on
> preserved memory, because KHO limits memblock allocations to its
> bootmem areas by then.
>
> Changes since v6 5/8:
> - Sent on its own, without the KHO series.
> - Reworded the commit message and the comment so they do not depend
>   on KHO.
>
> [1] https://lore.kernel.org/all/20261029172956.20791-6-dongtai.guo@linux.=
dev/
>
>  arch/loongarch/kernel/setup.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.=
c
> index 6fa4a22a58fd..8c33346a123a 100644
> --- a/arch/loongarch/kernel/setup.c
> +++ b/arch/loongarch/kernel/setup.c
> @@ -402,6 +402,9 @@ static void __init arch_mem_init(char **cmdline_p)
>
>         check_kernel_sections_mem();
>
> +       /* All memory in use is reserved now, so memblock can grow its ar=
rays. */
> +       memblock_allow_resize();
Would you mind if I move it between memblock_dump_all() and
memblock_set_bottom_up(false)?

Huacai

> +
>         memblock_set_bottom_up(true);
>
>         swiotlb_init(true, SWIOTLB_VERBOSE);
>
> base-commit: 422e532809572ba1043192bf6a0c653bc68b3140
> --
> 2.53.0
>
