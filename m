Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795585817;
	b=2UPTwRLyLsqj5lDQZy+ZVRK2BWzjMjIutNZ++pFpkN7mq2kiOLSHETkebMAKK5AN/rxf
	 1jT0nn0Yv1szORRroBnOtgpvBDmho5C5FQDiZImozvDpZ2+sq2XQ1NrX1fE8sPzAt959P
	 3fqB08DybZOkP/QL+RFk7vq1m6CXbg+NF6cIJMpKxrR1f5nvvcpcTLVaLBDCGJ5SoG7Sk
	 ehA2qiIrIysrCDIXK9LVsfGeO8iO5slN6gMUpg+T6CG3jNRxKnpQ8o9O0uSCxOOWTzJ9Z
	 WZoPiJ/FpGD153o1MMlzVO0o1lnHEjdUNdYyYfbGnVasbBrLs0aaxyNIdyFfPaqGpaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kT3tic/d91/ykIxW0D8n99nUbZymWMEwweL5i2/3Bio=;
	b=qTDFbPO/EEwXwDBoWGBhC2Rp0mwOgty6Jb5JK32ehBswT4+LRSpgkq1/G/DPYxRGqPzm
	 euVcT6yv0IC6Ten6PfDlL2z4Gz9sVUZyJbVThzv+w/ZZZHj2y/Mv2k2kPPqqHxw51SuRB
	 wqUmJ7qu0+WnlL4MzaWJZ3XntAHTmHvsuKaawCj8lYRlza0fTE3VBRFvWPe8bVXodSw7/
	 ST15pIGPlrlqagMw7wpPnjpcA97KhiHwHC/XXSsRyOq/rB3NZ0WEIvT2aXzgIVAu2q68/
	 NBjw/qiBuEEbGo/I6HSH8LznP19qfJgXs2TuONZ45ToBmYQrbn3wB3xMFS3Y9UQsXgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=K+2UvfK1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1848D606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1848D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=K+2UvfK1
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-498f5fa5103so3131014f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:50:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795585815; cv=none;
        d=google.com; s=arc-20260327;
        b=W9P3wJk4kbzurD7JVUvbwC7633dmKwuf9xDTioGoYASip8jyPtmSuF5gKT1YZ0kAq5
         uhVnPCk3mOrHqBbD9jw4oi9fl9VfkZNAz662VDC/cWXSaXBkCbj1n8TozsVpJSL4Fd53
         4uHu3U0Cei7oTkB1KQZKuUKgbIUO3NG7OGCww5t8bL3mBOgjCHClYgnLDC7garCVHb10
         yseDFyKAUYAV4/E70Fmv20LOsprapSVdyZLlJ1gDIn/bN86PAE6jJy2xDH7/7CotFMHv
         kRMoQLvTI3TbkzoPCvnT3B4dJbkHZe2dqNodBeOKtGv9CBHI7xyBJYceG9jS9cnD3Ict
         Tshg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kT3tic/d91/ykIxW0D8n99nUbZymWMEwweL5i2/3Bio=;
        fh=OGqYyJyWEbznVlG1w1xkdhOOWCIo2ZfmDWnmkYfpoZ4=;
        b=V4Vnf6vVeQH3x03cNmpJY9zHFFMWEjPcBjCcEKCE8iODjHVGCIP9tgiBZ/L7rfsJEf
         UlyvWtjFxuOQ2M8ocXwuTBWSNzdUVYZ081graF95l0zZ/QwKxI+Ci8e/FYl0h4zP/eP/
         76v91E2V69acCd9AEGNkCFGZ81g6qOzeN6V5OEXAe8AucDocWaHJ2dda5QNhkVdy3e8W
         HKuZ4TmhLDy62BVpc1Tz1O4MnTAdb9wrIGRFVKZsK2juQuB7yKTYqPSGmJnJQZTq1VGR
         v2PNM4k6Nvg3B+t8tWorW5YVU2pbe4Epf5lgeA9GN1OmdKHUE0aqVNFJJuqZPZYS4Tor
         gwrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795585815; x=1796190615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kT3tic/d91/ykIxW0D8n99nUbZymWMEwweL5i2/3Bio=;
        b=K+2UvfK1cwBf5HmQdBywYL5uXo1ci7tIKtFEzkLOJ08wVBn4ZypvJX9+bdyaWIeB2y
         bO06EcyZ1zOeV4zqpL5LJUNDPh7Rx1xdmMijDMwW/8QbZtxz/HD/2isNx2f6PlW9ytfR
         BKW1xIwbuWGI8d9GTmbD35rVf9p4jObioXtvmG4y2cSL03NdvmLuTEg4fGAaBuP1IbLV
         7GRLlTTSJ94aUx6JU02YWFpAgrU42AhrTSckIVlVYKZU0Vq4f1tfzcu8Ptdz+lIGuNjw
         +V4os65oqMMltzRs+fAEqyAYRkF6GnJoy+ydz2O9hTOoAvCF4ex6OVmFxmM+ylTLbrIE
         euvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585815; x=1796190615;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kT3tic/d91/ykIxW0D8n99nUbZymWMEwweL5i2/3Bio=;
        b=dheHr/NiHkWtAFO9glFagB3GUGQ9CdRRlOh9wGTOTDdFhX7qrqGpGFtGkJfwbYJuR+
         dS4popjpSYjt2IzC9Y7Ga3mrZkAJxEb/EOwA99jZ0G8Zer0+ruCx84QemngWksWuGIvj
         atqzdCzlahTYvgTWuemWGKQ9Bd/qDt7yhKcQPufOzf/Sl+66phGRl2GSuUmY4Kfjna7U
         U/cB7nCyMKG7iz7WqQQc41tcmF/Q7ljHAv73S8zZsFFuQb4yw7ZSOakEgmAQEiBQzM7R
         FJCx7co0Z/bjuXUa/5rUxNJJO07Q32En+GMGjfVQKH226GZk7K5Ln9uSGNcwB0cDTtWN
         NpAA==
X-Forwarded-Encrypted: i=1; AL+hErGOV+TIEvtQWXblNzWwofQcz/K8xXtT+YnT06UTDz3EgIoD+RaQZHrigtH9FzFg1Bh1b4a0/MjtbzNd/MI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rTlfis9qgcrpyC7Jo0ldfmon0K+83HhB4vFAjIsy6c8ZrV9gf
	VMPp5BfeGAp/JPF/0MALsKRvjMD0ozJE9N0useHxn/wrwb6uEIwWxUJzpXs70+T/+caRi3I1RFD
	vs3Mc3aCqv1NDzcefHoilVi5PYErqS5Svym07wO8iJg==
X-Gm-Gg: AZFdTZeunZsOVmWg6W7/tnSOAjKNob48nAIFVFPaCDvKvdkkXDEzEhkQCV+HyGyrDDe
	RznL6oh6gLxNwIx72idq8Lb55VFBsrl8TkeT3HfbezXWl2vUgKDCSxfPSrBYzzxFm2FgmxtTPKU
	20xB3XvuIO1kjelaA4cre5QOQqOsSXYy9bM19W5wq17ubf72G0V3KxeqI5SqyUVl7EbgZUZ//mH
	L1odTMZFfxSqzW1J7uBurbKZ8sEHx5Fh7kIhC94pUKnnB+GhoODU2vYqMGKx20UqhV1M3U91cNA
	pSqYlVj12tWeszPyVCKDv8xS5sDlK2/5DBr2AaDCOnB6UGCuhDD+whKie8emzy7uyhDvkCMqcFr
	kp3kM2oAA3X+kAj5KV85O1InvjdN0LN/4Ghkmd38CULAKKbHwwIdETD7MKA8Pnih8YUHdg0WDUG
	R2MoF4WjM50DBDO8BN8DcMAP+erChKwoVrOmB7vJULA06nzkWI7UG4dlM=
X-Received: by 2002:a05:6000:4008:b0:4b6:8c1:bc3d with SMTP id
 ffacd0b85a97d-4b608c1bc69mr9271540f8f.57.1795585815308; Tue, 24 Nov 2026
 21:50:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921111402.120911-1-suunj1331@gmail.com> <20260921111402.120911-5-suunj1331@gmail.com>
In-Reply-To: <20260921111402.120911-5-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 11:20:02 +0530
X-Gm-Features: Aa3M54p30lsdKRUsZb_oZ9Ir_KFeKDghmbl1hKMXGWdC2yvUELIJH6ADrwgQ5jc
Message-ID: <CAAhSdy1XYx+Piha+gkpMNgFprSwQ=P4gT9SwWgwQfLzhP1thbw@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] KVM: riscv: Free G-stage page tables after an RCU
 grace period
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Jinyu Tang <tjytimi@163.com>, 
	Wang Yechao <wang.yechao255@zte.com.cn>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 4:44=E2=80=AFPM SeungJu Cheon <suunj1331@gmail.com>=
 wrote:
>
> G-stage page tables are currently freed immediately after being
> unlinked under mmu_lock. This is safe while all walkers hold mmu_lock,
> as a table cannot be freed while a walker is using it. A subsequent
> change will allow aging walks without mmu_lock, where a walker may
> obtain a child table pointer just before a concurrent unmap unlinks
> and frees the table.
>
> Defer freeing unlinked page-table pages with call_rcu(). The parent
> entry is cleared before the child table is retired, so new walkers
> cannot acquire it while existing RCU-protected walkers can safely
> finish using it.
>
> Apply the same lifetime rule to the root PGD. Unpublish the root with
> WRITE_ONCE() and defer its free with call_rcu(). Keep pgd_levels
> unchanged so a walker that observed the old root continues to use
> matching page-table metadata.
>
> Wait for pending G-stage page-table callbacks with rcu_barrier() when
> the RISC-V KVM module exits so that they complete before the module is
> unloaded.
>
> Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
> ---
>  arch/riscv/include/asm/kvm_gstage.h |  2 +-
>  arch/riscv/kvm/gstage.c             | 16 +++++++++++++++-
>  arch/riscv/kvm/main.c               |  3 +++
>  arch/riscv/kvm/mmu.c                | 16 +++++++++++++---
>  4 files changed, 32 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm=
/kvm_gstage.h
> index a03db1a10095..caeed6de6dbe 100644
> --- a/arch/riscv/include/asm/kvm_gstage.h
> +++ b/arch/riscv/include/asm/kvm_gstage.h
> @@ -111,7 +111,7 @@ static inline void kvm_riscv_gstage_init(struct kvm_g=
stage *gstage, struct kvm *
>         gstage->kvm =3D kvm;
>         gstage->flags =3D 0;
>         gstage->vmid =3D READ_ONCE(kvm->arch.vmid.vmid);
> -       gstage->pgd =3D kvm->arch.pgd;
> +       gstage->pgd =3D READ_ONCE(kvm->arch.pgd);
>         gstage->pgd_levels =3D kvm->arch.pgd_levels;
>  }
>
> diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
> index f7e4756ce15b..fc39d188b20a 100644
> --- a/arch/riscv/kvm/gstage.c
> +++ b/arch/riscv/kvm/gstage.c
> @@ -22,6 +22,20 @@ unsigned long kvm_riscv_gstage_max_pgd_levels __ro_aft=
er_init =3D 2;
>  #define gstage_pte_leaf(__pte) \
>         (pte_val(__pte) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC))
>
> +static void gstage_free_page_table_rcu(struct rcu_head *head)
> +{
> +       put_page(container_of(head, struct page, rcu_head));
> +}
> +
> +/*
> + * Defer freeing an unlinked page table until lockless walkers
> + * that may have observed it have exited.
> + */
> +static void gstage_free_page_table(pte_t *table)
> +{
> +       call_rcu(&virt_to_page(table)->rcu_head, gstage_free_page_table_r=
cu);
> +}
> +
>  static inline unsigned long gstage_pte_index(struct kvm_gstage *gstage,
>                                              gpa_t addr, u32 level)
>  {
> @@ -406,7 +420,7 @@ bool kvm_riscv_gstage_op_pte(struct kvm_gstage *gstag=
e, gpa_t addr,
>                         flush |=3D kvm_riscv_gstage_op_pte(gstage, addr +=
 i * next_page_size,
>                                                          &next_ptep[i], n=
ext_ptep_level, op);
>                 if (op =3D=3D GSTAGE_OP_CLEAR)
> -                       put_page(virt_to_page(next_ptep));
> +                       gstage_free_page_table(next_ptep);
>         } else {
>                 if (op =3D=3D GSTAGE_OP_CLEAR) {
>                         set_pte(ptep, __pte(0));
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index 89568ccce01d..5fcf425f7150 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -262,6 +262,9 @@ static void __exit riscv_kvm_exit(void)
>  {
>         kvm_exit();
>
> +       /* Wait for pending G-stage page-table RCU callbacks. */
> +       rcu_barrier();
> +

Just like TDP MMU in KVM x86, this should be part of
kvm_arch_destroy_vm() instead of doing at module exit time.

I will update at the time of merging.

>         /* Unregister CPU PM notifier */
>         if (IS_ENABLED(CONFIG_CPU_PM))
>                 cpu_pm_unregister_notifier(&kvm_riscv_cpu_pm_nb);
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 342f606399e5..8aed69abf814 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -761,6 +761,13 @@ int kvm_riscv_mmu_alloc_pgd(struct kvm *kvm)
>         return 0;
>  }
>
> +static void kvm_riscv_mmu_free_pgd_rcu(struct rcu_head *head)
> +{
> +       struct page *page =3D container_of(head, struct page, rcu_head);
> +
> +       __free_pages(page, get_order(kvm_riscv_gstage_pgd_size));
> +}
> +
>  void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
>  {
>         struct kvm_gstage gstage;
> @@ -773,9 +780,12 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
>                 flush =3D kvm_riscv_gstage_unmap_range(&gstage, 0UL,
>                         kvm_riscv_gstage_gpa_size(kvm->arch.pgd_levels), =
false);
>                 pgd =3D READ_ONCE(kvm->arch.pgd);
> -               kvm->arch.pgd =3D NULL;
> +               /*
> +                * Keep pgd_levels unchanged for lockless walkers that al=
ready
> +                * observed the old root.
> +                */
> +               WRITE_ONCE(kvm->arch.pgd, NULL);
>                 kvm->arch.pgd_phys =3D 0;
> -               kvm->arch.pgd_levels =3D 0;
>         }
>         write_unlock(&kvm->mmu_lock);
>
> @@ -783,7 +793,7 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
>                 kvm_flush_remote_tlbs(kvm);
>
>         if (pgd)
> -               free_pages((unsigned long)pgd, get_order(kvm_riscv_gstage=
_pgd_size));
> +               call_rcu(&virt_to_page(pgd)->rcu_head, kvm_riscv_mmu_free=
_pgd_rcu);
>
>         kvm_mmu_free_memory_cache(&kvm->arch.pgd_split_page_cache);
>  }
> --
> 2.52.0
>

Otherwise, LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup
