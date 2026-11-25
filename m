Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795585828;
	b=Ci4o3IHkW8N4FuWHD6v+CnzRT0KiMHeSjh7kuRZyG/67bMZ107aMgbDVBgtf034NfZY1
	 7jlCv5+1O22J1QGM/a4Yz0ZTli+BqFJLog+FlvffIejPjTqKa6RToGhcNPmxsLlL2tGrR
	 Wo9khykaE6s0oU9AWLVr1QfJsurmY6e9hZ0NKAKz6Df8f2uGoXAklI1r91nX/KUPJ3W14
	 BSG9ot8koTRWoaLv6vpboUAjxDjaD5F72VBoeCIkLSq5t63w3lziAI6Xrgw92ovNIQvj9
	 SgsVqX95AW2hrn8CcQwU6gfhD6qip5xSFu33SFGCeznuQAjvxkjRES2v1zPUICdXkKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=h0QzRh8muxydOHGjX2h5cehhw+NrrMdYMgJiE84UVD4=;
	b=JCMi/x66Hhi8M4I/9feKRtB8+UVu/TCQK7aWfuVJv4GjoqvbTADbhwPaZrxFDuSe074r
	 Qmov97hNL5805t9YExi89+MDIOzZCvANoB47HA2fjVDV4zH3OoAZfInsVa+nhsZnSXf+U
	 SAdo2UemFz2KzCHBHQxAHzW3meagvCXsacDkP9Xt+AVM6GLIMguNj8uYl6vgkPpMF00NS
	 cPatiGDwzvmtAoHFjnEXyrbCye5VTjyx8BTogrXyLnVkwB/Vi7aQKnIgDbIPKIggkRC66
	 hQsXbCrQ1cKBYL+kL0G8mIxNhix/1mQnSbnzZ46zJikseUVrFtECIioTllMUagGSVXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b="qvI/3qli";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3140606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3140606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=qvI/3qli
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so3089597f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:50:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795585826; cv=none;
        d=google.com; s=arc-20260327;
        b=pusUBALQ7OCVrd2N/+wEJyfQIdydD9GwfPPFn+UCPE5xWfUwm4Yzm5pYL2uke5e0Dv
         HuvYDWZa/69b4LSOs9wUcNF9+co7GwAk4NtLxJjC4azqjfV6Khgjyc9BDnA8YYeC3ttB
         Cgccg1hdDeBzRH6Yrp3vXh1+1VJfolvtromcdh361xAiEG8Wp6tI9LR8rjMQHPHirPQ1
         M/nk12FnWOMCDJahfk/al4Sn79w7LQcozqc18kNSzL/SwM4Y1LiruzC6SiyqzVzE9Fwa
         v6o0NEkqOIVoCww3CpoFvVqA7nCOZRHH38/dIXNCYYdDM5s2xZP6IsmiKKvRLrhpHb5U
         8R/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h0QzRh8muxydOHGjX2h5cehhw+NrrMdYMgJiE84UVD4=;
        fh=Pz6JzDFQ0TABXj152dshqXsxqd8k9NQ7naOcmBnoyys=;
        b=lo6mlMw4tOkInKgbgboXQetfMQjaU2ubZYE/9QJ4t7edSFXGhvZjRevl4zfiF+GqQj
         qqByFCMZFf5yE9qOINWJRi48uanJARZbZnuOWkJNVGZHSq03qSEXUCGS26CFwqJjA2q9
         2g0aVvucJnp/gPRIl3XZKfoyFqUxxNPaE2slENW8kD/Cku1OwlSXmrOnqAPdinMGjrbw
         URXE9b19xCKsVyklm0q1Mfl8wWtoQ2v8mGuM9jTY21nYLvlGbHcjKYuyH4X36WjAS2BE
         3lYWDElvGOtkSSaen6Dhju02Or4cAGwf7L7SjnbH8E0tGStxMASX/fq3yzr1zVKwIDIY
         OA0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795585826; x=1796190626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h0QzRh8muxydOHGjX2h5cehhw+NrrMdYMgJiE84UVD4=;
        b=qvI/3qlibVawrt3J6HO0mHmcB38ldsVi0ERoyN8hcddPDVGOUsBBPxFi7GtPAzOkTi
         jHIBO5XgIkS8+qSRnSfu4AF8lGN6QtSJjMhDbZ1KsvQD2iwRkNMtBWiQc/J0pUim1FpV
         v/oQaDD3ahh2NxhAAqI7UiKrzbGwz2GqH4Ml18/vQ35P9wrkEVq9Md9WtFNuJNk/1Yrd
         4BdqavPaMAcr8qq2fp96HXbd7ynPJJo9ZiI80vXFwb0NA+s0ibHDEgTDMtVdK+zqXVB+
         QwMZLULdd2+Nl/KZnrZD8+VkGgRF6o2Q5Lriml25R3ZYM4MT3oy9qrhNATOjs0DoaDt8
         0K3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585826; x=1796190626;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0QzRh8muxydOHGjX2h5cehhw+NrrMdYMgJiE84UVD4=;
        b=ZZsAHmluGb+9OIovo8NHqtSO2EWH0ygw7ErBPDn3ZUVZFQSExH5X/bJzA+Je4b8TyK
         OKru5AT/qPE5Fs8rT1sSMqfFod9Horrk2DtlHR1SH5mPmlspKR+BlAVAa0NNazmIsBsO
         YFNSXRVSgCf/eJ9/bu2cK1Hp/AvI1wm+iTwIQl2wHFOvEGW5V3Ti69GtJWUFTbPwnmaW
         cNxailQMEMrJQunSVujrZcCEngper1GRIw1O5fVl1q7hqCOeZ5AcL5ktYF+V/+yDVDo1
         aE8cQ1xH1pA4UzgATYR1VognZuyk+zaEexJuY5cIw9BrSr+Yp8sDpK471zEshp500gCQ
         rTxQ==
X-Forwarded-Encrypted: i=1; AL+hErHKTmNYHrOeG6uk+Hb9gdjU3O5CXWidAd4ODO3Hr4ka4dHybSolwcNdTha59Z7VtRjoottxHOPKm5w0pto=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TnMQOcDuKpJVwDDvDLwBkQRUxWSVY81+Zega0voR0qSUj7xJ+
	D2kpFl9TA3XV+AoQdRV1m59fm9lbXFER9L1KNjfmdmOWKYVw9ZYcOgQU/McNcPFxamZEpZGVdaY
	R1RAbxTrLxAquZpljPcJUyjT4GOcBCWPxbqhzg/GpbNRkJJjs8bvm
X-Gm-Gg: AZFdTZdtfObwTryZJFPTBqIA9eBNhTkbD08UE52CTjiWkyR+FJuxAR6IrOlpyRqpiw8
	6588vqcunBf07oIzdIwoQWwwA0Mao2YzAAEq5qdke2CwSDfn27Q2evNnGDtw2n1whyUZI0emOzA
	QBIBq/m/22XWJm20HpzNgzN1HlPRUxwsdKHdHl6xX0Ghl4lqt0PKlrNl4VckEl12RKcDSplq53o
	nGwI0i7YqNL1mnYEn3ymXoHL9F2eV7c4NvdalOOZI/GyZKbKW5Srhuj4YsoDnph0FYMgIMCY3qI
	iM7EKSqa/klj9A/n1ASgz76fgqK5pQhSJaiuXbn8p8BlkWUbtrLNY04hyqoRyXwYadt+T6odbZ0
	IRFH640iYT8IG1CrS4NvJjvoaCUDpRFzPlxGWcEdWSuMTkPzBEvczmkdEJR30CucFdXHFyhK109
	vRF8LXuguZesn64cdpHkIbDfQfCSKhgeXit06uAr5Nlz1TAMMTtF2w3rc=
X-Received: by 2002:adf:e00f:0:20b0:48e:932:aefa with SMTP id
 ffacd0b85a97d-4abb27268e7mr22701177f8f.26.1795585826178; Tue, 24 Nov 2026
 21:50:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921111402.120911-1-suunj1331@gmail.com> <20260921111402.120911-6-suunj1331@gmail.com>
In-Reply-To: <20260921111402.120911-6-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 11:20:14 +0530
X-Gm-Features: Aa3M54oFEe_Kg5fzllo_hPF_KMY1sHlitMVjRaBnJClbHNybVQLzGtgAKkyplS4
Message-ID: <CAAhSdy3-0fHHE2tpRRimhOTUWrN01Ju8Mdt4=R1UUp1atwsifA@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] KVM: riscv: Age G-stage PTEs locklessly
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
> The preceding patches prepare G-stage page-table walks for lockless
> aging by using consistent PTE snapshots, preserving concurrent
> Accessed-bit updates, and deferring page-table frees with RCU.
>
> Select KVM_MMU_LOCKLESS_AGING so the common code no longer takes
> mmu_lock for aging, and protect the G-stage walk with an RCU read-side
> critical section.
>
> Read the root inside the RCU read-side critical section and check the
> resulting snapshot instead of checking kvm->arch.pgd separately before
> initializing the G-stage context. This ensures that the root used by
> the walk remains protected until the walk completes.
>
> On QEMU TCG with 4 vCPUs, running dirty_log_perf_test -v 3 -b 256M -i 3
> with MGLRU aging of the VM's cgroup forced every 100ms (86 passes):
>
>                               before      after
>   mmu_lock write wait, total  44.4 s      0.15 s
>   mmu_lock write contentions  1,002,092   30,092
>   mmu_lock read contentions   351,937     0
>   guest dirty-memory time     18.6 s      16.7 s
>
> Before, 93% of write-lock waiters were kvm_mmu_notifier_clear_young().
> With no aging, no meaningful difference was observed between the two
> kernels.
>
> Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup
