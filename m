Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795498299;
	b=JhtbfrElQnFgy2cjraJQJKbLiIXgKFQGE7VvbktQttoqIOfjNlDDBh9C6I4yR1hJeLd0
	 oRTC10tcccfuQjA3ok07gGiHOM2khisGouKTbqV6QPD2o+aMUoAJIf71IPl6Xs3buCaAk
	 chlWmFaRFzxgmOxxj/1+5OxUKbEkMc/xdvlsNAq4nUwcjs0rS4bRVPc36GYT3+qMXFjsj
	 YYs2XwDW3m/TPI5mQLkHsTqWfDGrtqLfibYazSV2hH4aJrS1BfEDh0SpVvceFDnUZ6fTV
	 J1TDG6gA8Jv80ivlx3HYBUkUCe5327Rf4dsYirsSf5lRCKHFERMQvT7cfjTXcHMBHHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795498299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=MHGUggYwA3gp5Hl40fLruxFZvaBCGWgXTV8JidRQovM=;
	b=JP3fbk6TRHXvDMfL9MLzpoaLnsAO5r2IEstliLey1v9ChaNcwoBTJ3VDzfyWgJ54lA4x
	 9QAwS9hgjNb5ggZyWMIU3SJwpz+t629FFoSCTTPE24IdwTnbiJgkdHRQ7bdus5hFKpO4D
	 BuVw0mfOkw+0gjaCEqWjcKxywxVnFNuy71TcbomYNBb+5j90M72ejzJuEXVLtFn7hqVkz
	 x38Ay5Glr/jOWeLhDVFZpwQD9zUisYHrdno+K+Ft9gMfw83T/M0LRYxpgkrDnBs795qK1
	 QXmFNgEompgHkXFHtS0Up9TfysMyFoY1nWC2RZnVIW4uyHwtUxvPesDJS6IX8JYkhiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IL2OexmH;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DBE606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82DBE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IL2OexmH
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3b4067446d7so676041a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795498299; x=1796103099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MHGUggYwA3gp5Hl40fLruxFZvaBCGWgXTV8JidRQovM=;
        b=IL2OexmHvHFKYHluRIKtNYMqUEc5MTXHSaKYpwbh+Hj/xk9TMIYcyvQeRcQZBqGbLx
         JvrRAPkJzFw22AtCCgQtKJTaef7PeUHoR84RpieUxP1PXls7QB3w9/r66UxCDpukSGB4
         ReTmmwpM6RYXhALKZRMzc1Plj6nB8PoGLzkzXTS+Cgj4gsrYY+Ya7onI1BmnTaOLPyIn
         3xdPootTOygbq5YGD5Gugw0IPDBsx29+1QlBAEBZD6otGftJu8Rmcb7+uvXGQ/kFU7t9
         t1JTqcWTEoBb/hXzW9xSJk83RaFgh97gpXTz1R8zNB0szVMIZ3akveKMEiYVkKT+PbyA
         +95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795498299; x=1796103099;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHGUggYwA3gp5Hl40fLruxFZvaBCGWgXTV8JidRQovM=;
        b=fz0s9r9VIbpMNhHx8LhN54c1ueJrld5UNp4pOJ9kgDsRoeb/askXG46fWgrWO8YOZN
         UlS1vhM3twasjEZwFnUugw1aoQcuUoylyjGCrxxXFwVxKVUQ81rE3yyVtbNn+DjFpcB9
         ICpw5/8kkWVBb+a6qkI3hcOLumF02AJLJ9oCRaKwnBztX1pDLb+CcAwK4tRPr34Iuadt
         ToDWZeYHsXSTU/yMz+mmNT9l9zHxoiPHlwJMHEwqWV4ZYkL5COQzCTLnHZ4ywVNg8euv
         KJIvkRXRodei3O0ckMX0ywgQGnSwNfLUq6/R3bf8LrVvSUhlAtDcDbagf71B6AZdan1Y
         j7rg==
X-Forwarded-Encrypted: i=1; AL+hErEvOzF4XOqMEc3me8tylfwrlY9jtyZkyJa1EQjxfT6rMqzYMl1RTA5xqCMA4JAqx3pMnsMnPr+o93QwqRg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/r5HdlG1wDcuw1o2aool8jZAsMfLuyL0DA2toUtywLwY4p8p1F
	ba62NjDfQFKCxiiZXsQx+gEmAlLdLoyTIL1Hdu4C1VV7DjLcYJH3RPzW
X-Gm-Gg: AZFdTZdkC303PwpshMLopyqLBIIZq5WQkqSL14AhH5lmGeN7ywd/zqdrS0O/krVC8F1
	sEk1wx/wBtDcAELwqT4NR/C8YS+TlWNfzPDYj+hxgeANVjGUI6ctrJaA8PpNQHET4WLsTFBlWGE
	f0qGKovF6x2foVeWFC5uOIANoCJXX9G6w5GzNJ7RlYRC3EdJuqYYfKpgbV8Xc2fKr9sShCqS97o
	+LXUUxx2nccKR4pyQ/gHI7wuelFTPbXkIVFb599sO5siXT+5njWwoUvSyyWQvhFLfAg+W+eQwHt
	SuE4JStnvsf68IqZshIdTdE/4XNbpnmSIpHJVb7GKwxBoMja2xerXi1+jPcNKynssUZJ7AxRe+d
	Bf/qNAx0plcUqUAWFr1jeIFr1ZTWEPAcDWPINmYPEwn8QKCLnTzJEXAk4w4Ds1eM0AHVe/VIe9y
	oGbIneU6ZLm5seiN91oWAJdW3UB92daC22P1DrDdl/qINsIlLa5ynKGEZat3zRoYi5eXaZ1XjYv
	jT7I60NjMU46A3N9ZspvQd5Hy5r6EewYES/H1b8K0SIhyoB0Adl2z4XV7uaQz1rXU0Dt0Qu3ugl
	3MhxT8l8JUyydV6SyDwRXf+xYMOCKHhp/33c+nJ+OCwUf1lzmdyy
X-Received: by 2002:a05:6a20:7d9b:b0:3e0:dc12:8908 with SMTP id adf61e73a8af0-4014e25b4f1mr12376756637.81.1795498298665;
        Mon, 23 Nov 2026 21:31:38 -0800 (PST)
Received: from [192.168.22.174] ([114.246.237.251])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6c9c7dcbsm6562442a12.0.2026.11.23.21.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 21:31:38 -0800 (PST)
Message-ID: <286b4604-fb68-452c-b131-d3847669726f@gmail.com>
Date: Tue, 24 Nov 2026 13:31:29 +0800
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
Subject: Re: [PATCH v4 RESEND 2/5] KVM: riscv: Avoid THP adjustment for
 existing 4K G-stage leaves
To: Jinyu Tang <jinyu.tang@linux.dev>, Anup Patel <anup@brainfault.org>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>, Nutty Liu
 <nutty.liu@hotmail.com>, Jinyu Tang <tjytimi@163.com>,
 Gong Shuai <gong.shuai@sanechips.com.cn>
References: <20260815102833.864330-1-jinyu.tang@linux.dev>
 <20260815103245.864925-1-jinyu.tang@linux.dev>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20260815103245.864925-1-jinyu.tang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jinyu,

On 8/15/2026 6:32 PM, Jinyu Tang wrote:
> When dirty logging is disabled after a G-stage PMD mapping has been
> split, the fault path may see a 4K G-stage leaf while the backing host
> page is still THP-backed. The existing kvm_riscv_gstage_map_page()
> comment says that this path should update the small leaf and leave huge
> mapping recovery to a later ioctl path.
> 
> However, transparent_hugepage_adjust() runs before that G-stage lookup
> and rewrites the fault GPA to the PMD base. If the original fault is not
> at the PMD base, the lookup can find and update the wrong 4K leaf.
> 
> Check the original fault GPA in transparent_hugepage_adjust(). If it
> already has a 4K G-stage leaf, skip THP adjustment and keep handling the
> fault at PAGE_SIZE granularity.
> 
> Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>
> ---
>   arch/riscv/kvm/mmu.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index bfd6168ebe30..2fabcd409991 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -500,10 +500,21 @@ static int get_hva_mapping_size(struct kvm *kvm,
>   
>   static unsigned long transparent_hugepage_adjust(struct kvm *kvm,
>   						 struct kvm_memory_slot *memslot,
> +						 struct kvm_gstage *gstage,
>   						 unsigned long hva,
>   						 kvm_pfn_t *hfnp, gpa_t *gpa)
>   {
>   	kvm_pfn_t hfn = *hfnp;
> +	u32 ptep_level;
> +	pte_t *ptep;
> +
> +	/*
> +	 * Keep the existing split G-stage leaf and update the original
> +	 * faulting 4K page in the vCPU fault path.
> +	 */
> +	if (kvm_riscv_gstage_get_leaf(gstage, *gpa, &ptep, &ptep_level) &&
> +	    !ptep_level)
> +		return PAGE_SIZE;
>   
>   	/*
>   	 * Make sure the adjustment is done only for THP pages. Also make
> @@ -730,7 +741,8 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
>   	 * so do not promote them through the THP helper.
>   	 */
>   	if (!logging && !is_hugetlb && vma_pagesize == PAGE_SIZE)
> -		vma_pagesize = transparent_hugepage_adjust(kvm, memslot, hva, &hfn, &gpa);
> +		vma_pagesize = transparent_hugepage_adjust(kvm, memslot, &gstage,
> +							   hva, &hfn, &gpa);
>   
>   	if (writable) {
>   		mark_page_dirty_in_slot(kvm, memslot, gfn);

Thanks for your work.

Tested this patch on v7.4-rc4.

FYI:
https://lore.kernel.org/qemu-devel/95fe4c53-fe13-4e0c-abbc-bbb546850560@gmail.com/

Tested-by: Gong Shuai <gong.shuai@sanechips.com.cn>

Best regards,
Shuai

