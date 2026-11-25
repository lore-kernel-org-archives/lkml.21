Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795585840;
	b=5W6ZHuw18Kol9vZvULE5v7n9NYK9iYGWqAVrAgQkHJshahWs+2l7Fku0iB3AH4ZRomUQ
	 5euZ6i243gzdMGAQHlJXk0Tvu/9UrEDJfsrtpq9vRFY/tCUZCg62lu6oJ3XvvKybj0ye3
	 6HK8ewcESzV9SV5YDxe1tITKbqQgpqAL1k8GtSKVi1+YDIL8JOpxpBCkEukz4/NPehwXB
	 8ltKQbkuD39gH2nm48kLG0UXUTZvBvecVWaH6mc2Fh0y6NYoH5iQeRQP9SgPF9fBzMWOv
	 Qt4FjI9B/3XdJXTVa5duUAixlTw2C3zrISS/Id4aiQjb39SKlD7NYFOD7Fry5P41Ofg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/ey3VoMnoIASJUisM8PXIjosjBIaHmMcX0osRpbhk3U=;
	b=ApTIBdPtf7QvJtdWBwxQOicePTgtbL17ItPH4zep5sLzaM8ygYQYsqBAAGsGAtNdRqCw
	 mYcd/PzYxIgX4XkJrRtoGJ85KuSs7+l8ygZRi1KX5aZNUCOMGjdj6PuYJ8mVc2dnmBUrM
	 rAAnR9MxeeOyk4a0cEKrJnXdAGs9zmY81MoO2UbilYoJ+H6eeaTyYfE9kbrpVvM2gr2ar
	 Fo4a9kQE9PNVryiBin8X2hbrbCGLwt9P7MSAcrPqphbMZ5nWcqiVvxHH/zywLv/K5GWZu
	 9YuJdbCC+fOjbKzMiOH57VQuCW4grtwV+wd9PlPtxykxF+NTka1Zs8hmwkuPM7IyN2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=nZYWhBA6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D95606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88D95606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=nZYWhBA6
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so50560405e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:50:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795585839; cv=none;
        d=google.com; s=arc-20260327;
        b=L6qdydU2cGmB3nn2VUKDnysyyGUcVs3ZCvfD0MreiBYrRJ+7JwkOuFvmu4KemXv3zz
         Mo5rz9jTymJrbM7n+QDMGKQMr+tpTnTLeCmqzXcQ9Bcsj5/JyipynohL77dlZg2MA/mk
         Vj4q3oNjO5z7n7K8Oh2G+Gl2KirZsZVy8vnr83hY8/bh3Py8zrPB3zyxE0SPEsmQwIzL
         31et8xygkJOFpgfkjsVFeLc87Lu+BJqH5aVFxGzZ58uvCAxuXCR+7ytQv5o3L2VZDvrf
         s2l6MWrDXJCp3xXWxP8rx956OiNjRiNI8i4HQr6bc29faaV2wTPfyKJO6v9B9yGM/n9z
         Klsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/ey3VoMnoIASJUisM8PXIjosjBIaHmMcX0osRpbhk3U=;
        fh=vkDsvqQ2Gm20z2Xl2drcIim2a+i4sVII7Ctnb7NQMkM=;
        b=VXghRFDWoCq3oDpzMTLriNs7ujqK0u4CORNTdzIuzCRzsqt5u9IoBTNhsItxyJrahm
         mnCAdlVcoEhUDjavljiTxs7d3BIelDID2Kx77jMrUCmTXxEzPtgCMfiLOEm4Q1K3oQXo
         gmybOqiSgh/kr7re86MENAk/ESDjD1EE8VGvNZo6s24PWfaSicyrWWH4Ya1BP4u7fGUe
         6TgEB0nFyg2885nBdXIO8Oz8DfdfcU+J3kY7c8tAlC9UFNVGaLMjOEXFfS17M2kzuzpI
         Rs6N4n1guIjIfNWu3oX/PtS+sOs7qCXmHvNC5q/jl2lCb8mWUfXzpnjgzVDmMD3nRmuM
         jVvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795585839; x=1796190639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ey3VoMnoIASJUisM8PXIjosjBIaHmMcX0osRpbhk3U=;
        b=nZYWhBA6uLmFCmYkRj6Hb23eKcgz+JHE6oXpmo8lQPu5j0NQNzkvAn0y9O3zkGUHQn
         4hZ1p6FNvTHUaM87r8QtUCCpkBQseohuL+Fa60VOcnNm+t+yfxzZDvrFKVAH40V3Mf/m
         jBWf91OCH/yXDz74Rk4/qXYVtlcfHVi9RBl4xKo3vpN/o308lpx2JRAcNhmSJdLNKabU
         efkCwWeBxDIbRtCnNLNzwrjolMrI2ArAnLMLpzRx41JdiTzynlcj6ueKqVl4mbUDyG1K
         jnQKFk7a9UQHUrpiOGYPgzH10Zp8DeOGC14Ux0n5HKfgDgG0lCOX7W334NWU2IzQI0Gr
         XeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585839; x=1796190639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ey3VoMnoIASJUisM8PXIjosjBIaHmMcX0osRpbhk3U=;
        b=l6BdQ4XGKX3aJostawhyPHn2hxVj7i++/vJhw452aHjaOP1x3rORIiMx74acezsCww
         sPxiQ0bPuOrlycV7Oxyp5rAeGjlnwaDbFBvUu93I5IEXJIjPb597UOFgdaaxS3gDN8q0
         A8BrsGYXVE0Mnk4by35gr7WTJ6F8qf7OXUOZbDrMbdSDR+4Zf+v9Dt4cD9949+YmIXW9
         t88nl7x0lZYXNhZAQz2zIQDLcONquhq7dFYUiJsJW70KD6hHVyqvNwqDorp+tzJ3URyY
         GgAG1ZCvCw99pLTgsUjI2DkAolEVL1aGkJBg64dyrfvrHQWQH85G9q4HpZuZMrvS7H29
         jfzQ==
X-Forwarded-Encrypted: i=1; AL+hErHY+y4oW619GBcNdGBsZREXInLG6HZg+xuUm/+UAcDcA9TPEzGxOHxBrEIrdSh6UT9XD+Tqztl6Frr6rEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s14QF4yyjYkSZaeng2KmqnCucb1vTNxKLOIeMSn4v1t5rmfSe
	x64w9T/lb/l7Ocs/ReRFc1TVom12PXza5I10C0oUsefXqgYLAElGzT2C7bS28p87LPDS9548uAH
	/2ns9GdKdYESRrGn8HfyxsApGu93FtUIk365clU4hkg==
X-Gm-Gg: AZFdTZdmU29646zYj2guP6XXlR/njv9DItHxmvH0Ge3m8lrt0SOKKT3dhE68Z7jNreR
	rWkyM+C1+NzTV2g7psUJgF2+wm6yDVG0KI5W2YnUt6KyrAUE6/CbjGS7nTl8lljiRgZ6jg605mv
	jn0Em7vL8JrH1ptv/gfI28k6XgNHUKlWow1D9pMBdeYfZu/9IAruf65jXx4J8LiUMx+DLorF3uO
	onMRBFXYnfkYu3I3c+9ooZjm30bf+XTx4X2SDxejG/zAyaakrJfg6+zGxQIfFXSb4cl4N+7YV8z
	n3RMSzlVv5P0BL0ZP1p/uCbn5+Lh22uDD4YdWBXCj0tTpDkqHp12kBK1ILUsTc0ydnfg0+z44IK
	dPjsp4hkvdDlGCjgaY5v7eomKI0IILwb4W7hnmcguXwj1Y0iJbP6NcAMLQ4XzYX7B7XmOmygda3
	Sqt/Zrl1igWdsT3VPqvJh8cksaYfn/XtiMEVi1hblQW+geUBcxpuE7Zn3fpw8IcFHzRYUAX+ysr
	9V+
X-Received: by 2002:a05:600c:46cc:b0:4bb:69b3:2b42 with SMTP id
 5b1f17b1804b1-4bb888277b3mr355988315e9.16.1795585838954; Tue, 24 Nov 2026
 21:50:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921111402.120911-1-suunj1331@gmail.com>
In-Reply-To: <20260921111402.120911-1-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 11:20:26 +0530
X-Gm-Features: Aa3M54qb1blyKaEVtKNBi5ctu8cJHJ3FLqTUOGiPqQSapaUrHW7z2azgq7gQGnk
Message-ID: <CAAhSdy2BkWEY3+FDpcLwFtrP+03GSfJHCmsCmu5513M8AMyPpg@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] KVM: riscv: Age G-stage PTEs locklessly
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
> Aging G-stage PTEs currently runs with mmu_lock held for write, taken
> by the common MMU notifier code. When MGLRU or kswapd ages a large
> range, every vCPU taking a G-stage fault blocks on the lock, and the
> dirty-logging read-side fast path blocks behind aging as well.
>
> This series lets RISC-V select KVM_MMU_LOCKLESS_AGING, so G-stage
> aging can run without mmu_lock while protecting page-table walks with
> RCU.
>
>   1. Age all G-stage PTEs in a GFN range
>      Bug fix, posted separately [1] and included unchanged so the
>      series applies on riscv_kvm_queue. Drop it if already applied.
>
>   2. Read G-stage PTEs once when walking page tables
>      A lockless walker must derive presence, leaf-ness and the child
>      address from a single snapshot of each entry.
>
>   3. Write-protect G-stage PTEs atomically
>      Aging will clear the Accessed bit without mmu_lock; the plain
>      read-modify-write in GSTAGE_OP_WP could clobber that update.
>
>   4. Free G-stage page tables after an RCU grace period
>      Table pages and the root outlive any RCU reader. Root teardown
>      keeps pgd_levels intact so a walker holding the old root sees
>      consistent metadata.
>
>   5. Age G-stage PTEs locklessly
>      Select KVM_MMU_LOCKLESS_AGING and walk under rcu_read_lock().
>
> This builds on Jinyu Tang's rwlock and cmpxchg helpers already in
> riscv_kvm_queue. Wang Yechao's huge page recovery series [2] adds a
> second page-table free site in kvm_riscv_gstage_recover_huge();
> whichever lands second will need to switch that put_page() to
> gstage_free_page_table(). I can rebase the series as needed.
>
> A possible follow-up is to run clear-dirty-log and the general fault
> path under the read side of mmu_lock, as arm64 and x86 do. Patch 3
> provides the atomic write-protection needed for the former.
>
> Testing
> -------
> QEMU virt, -cpu rv64,h=3Dtrue (Svadu), 4 vCPUs, TCG. The host kernel
> was built with KASAN, PROVE_LOCKING, PROVE_RCU, LOCK_STAT and LRU_GEN.
>
> After each patch:
>   - dirty_log_perf_test -v 2 -b 256M -i 3
>   - access_tracking_perf_test -v 2 -b 256M -s anonymous_thp
>     (2M THP disabled and 64K mTHP enabled)
>   - 20 VM create/destroy iterations
>
> With MGLRU aging forced on the VM's cgroup every 50-100ms:
>   - dirty_log_perf_test -v 3 -b 256M -i 3
>   - 30 VM create/destroy iterations
>
> With CONFIG_KVM=3Dm, 5 module load/unload cycles, each with a VM created
> and destroyed immediately before module unload, to exercise module
> teardown after queuing RCU frees.
>
> No WARN, KASAN, lockdep or RCU reports were observed. The kvm_age_hva
> tracepoint recorded approximately 65k events per aging pass.
>
> Performance results from dirty_log_perf_test -v 3 -b 256M -i 3, with
> lock_stat enabled for mmu_lock and 86 aging passes:
>
>                            no aging          aging
>                          before  after     before   after
>   guest dirty time       12.5s   12.4s     18.6s    16.7s
>   mmu_lock W wait total  0.15s   0.17s     44.4s    0.15s
>   mmu_lock W contentions  35k     35k      1.0M     30k
>   mmu_lock R wait total   0       0        7.5s     0
>
> Before the series, 93% of write-lock waiters were from
> kvm_mmu_notifier_clear_young(), and the dirty-log read-side fast path
> waited for mmu_lock 352k times. After the series, aging does not
> acquire mmu_lock.
>
> Absolute numbers are inflated by TCG; only the relative change is
> meaningful. Under TCG, the atomic write-protect change in patch 3
> increased the clear-dirty-log time from approximately 16ms to 30ms,
> as TCG serialises AMO instructions; hardware numbers would be welcome.
>
> [1] https://lore.kernel.org/all/20260918072622.284188-1-suunj1331@gmail.c=
om/
> [2] https://lore.kernel.org/kvm-riscv/20260914055936.3672758-1-wang.yecha=
o255@zte.com.cn/
>
> SeungJu Cheon (5):
>   KVM: riscv: Age all G-stage PTEs in a GFN range
>   KVM: riscv: Read G-stage PTEs once when walking page tables
>   KVM: riscv: Write-protect G-stage PTEs atomically
>   KVM: riscv: Free G-stage page tables after an RCU grace period
>   KVM: riscv: Age G-stage PTEs locklessly
>

Queued this series for Linux-7.5

Thanks,
Anup
