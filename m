Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795460157;
	b=3UAQxlO1CjVH+taUelFsDIPpD52TaEoXquW8MjwU6K32eWw8pMIt2vKiHVt8/36YQ1Sp
	 Kw4tOy0/EObs9rGuvMPOjod+inkjwCSZN1po0cq1lWPCVggYd2gDh2YSvhTcaLB9cjBQE
	 XmKvgjq+L6FJ+toit1nNDqPeCVobKaxFupWhsUeFXIZa/JKBazSswy2K2RVPJ5K0IYULb
	 jxxDiQVi7v3wzM/bSa/1hbh4uc1Bg96WAvpeR8w12dysqeR5QfpGKMiOhXHG78z7q7Xdh
	 PLQGtHJ0y2TXQKIg4dtqdSOxZX+FONjby45cObRfxtEcNZNCRnY0jY8hZdHMNXYp7nA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BNSwJg+0HhZxN5eag1txmGeKFOOyqEA8cbyAFIEA6yM=;
	b=E5T6TNTqT9eyejjhaWh49iUJNYq+EkbFwj7Xp+zfv8Gsf9M+cd3yR3QNQzGXqlKsx4zY
	 W9xzogteFcdEOlR98CmsH0cDczITV7BwzLgjRcAFyTpLdxFE3NX5u4kGU/Mm82prquJy2
	 AxvzXfTC7//jyxFDdvkymRJ7qPNbIm583kHCQOf96RK5ekcnbROb+wM3p37RhI5CklCuV
	 Q/K8hqcFm4bfwBkATbGs3HrWdjr2SagEBHL/bomlLYrHhno3ZYstZkZLnIw8xWuN3QSWo
	 J53e+VFNUNnrm0JOEgPUSi1BKB0tCfwbSd7T9w+bEJZT2ClN3xBPcYm6r0OPyCJTnqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SWjJFVer;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEEE606A330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EEEE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SWjJFVer
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4cdc606b47so625098466b.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:55:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795460155; cv=none;
        d=google.com; s=arc-20260327;
        b=XspHxA92M9exkdX/B60ZeuBpKv/AjKQMXl8bsxd8hvDV+xP5yJsRntcicvdJ6o4aaY
         2+0wPYMfvXZO7Bhm25ZtuqFEEAhrcK9rlPjHzqD9V8gQEp4jBly/q5hSAYRhmq0jyK7y
         DE44C8kpG/Tg0wL9Z7OfGVQ7QKq3ZVBQyzv3onm5imrZG2Mh4e3QQMNGteNut2bRLV50
         6Zx11t296XbmNZuPtaSM6TfGXjLhPZDk9qOrujBBKtVsH4HFERRQPcIWIyOavbNAzrO7
         Rmlr9mkPO8X71KnGT9N3gpfPcY4H6CmyXnKH5X+L5XCF6BlK15ZJ+xzpX2mXI8rtre3u
         7FjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BNSwJg+0HhZxN5eag1txmGeKFOOyqEA8cbyAFIEA6yM=;
        fh=8l3UjqI/bkQe3RIm2mL430YrHNgwaBWGzPNp6t6djKY=;
        b=WYjJoHehdW8Ljt/7z4li18yWp2ltSv07DmxjPBWq+EU1ec+sNZ12Kogr1PasunRSwo
         RVsNgMG+3gc5qGcn1p1RY8jBpJDWWzFheEeP7ajGTNHSzLAUbxcIx0+RDrWjcDoCTTxL
         ktV9RX1Hf9GJDfNRuaTKRTz7uutdBZnlIeDY1PbWYIDGexew4TW3GbMfQS1vCLWa6So+
         Oi2ERw0xJwum3FhmIViP8Q4/8GQ4bxy06FtxI1+tVcT0xPMBI1oWqJtdJ9xDkTI4qs9f
         ShOTY5OI6R5PRkK7rx0LPiRuiFwf2TX2SCCBmbkv9l7gcW8or1frrgPrs3VG2FrycyPL
         hc6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795460155; x=1796064955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BNSwJg+0HhZxN5eag1txmGeKFOOyqEA8cbyAFIEA6yM=;
        b=SWjJFVerFZwp5gdpwgSwsHCvH/MuBZwcTTCLGvQ2+MQp4fpwRO1TEnK3PIl5WkZa/U
         4PYBssodVjWkRVnC2iPkYD4laPHHByLLCScMdEpXN4Fcji3zhcktPBk3hTnNfJvWWx6i
         +xT/2XPzIryntCkoeUD40+jQ9uoeFBS1E4DsHtsDFb5r+ZMBj4ulQvwbkFCvxi/wsmef
         tYLPWBzGqaQWWib7PVsEorJgj25Ih2Bn+igCF6imMbkjrGjtnADAPJuPHJvIXnQXn8Et
         jP0ZfP/o/b9OqmZGm5854VD3POC/VDiGbANhdFn7ir5sxDaBdPzx2VSmKpsAU4dHgfOj
         h97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460155; x=1796064955;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNSwJg+0HhZxN5eag1txmGeKFOOyqEA8cbyAFIEA6yM=;
        b=Obgbh4DfICrAGlARcz0husSf7wRtCMlES+PfmKCxGWOpdajvtGYlVsoyiG67P7kZ9r
         cveDAdTUpj6MQYHnJlAjbRsT1+U/pAAUO0LQMn70NUlhUBIZGnwyIRHQPdITJJ3AnaQ5
         yjoUOHqf0LcOI5Su0GM4WS4YN2PA4E3u5+jHfJ8ZWQtU8TecVmZdK+rkBAN9wzSoA7M2
         MmeSoKsccvEYgvLrGfACWf3jh0XrNbzELT8djtFp+ZUluOzS8iKCd5fAa8RImMRPECK2
         FMmB5kxmpG7j/aT82Cg+rAh+zWXOM0lwezN2nkB0mHRPzCwwTHW6lFKsprT+trAomQRe
         CM9w==
X-Forwarded-Encrypted: i=1; AL+hErH8mRYepntJZRI0ua1jHPg6tY4lHTHB801F2maVf89g0LA76HjefwFt6YRe423p5YqbvduKgLBY0ShvBuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z86AQEoIRubgR1OX0w6RPiGYsfEa1MxnG6HSGiQGPXlr6N0QwV3
	Ukar5+7Cd8OXCgZNud2q4Mcdw3PTI7egBofrfmwRi5f4VCgap8jzC2yn3mBQFyRllvQunaMie/J
	KnHxJKADp22qkjS9Q+CYIkIoTefWmVKqJ4mfvr5PvFxosEMosM0FOEcZm
X-Gm-Gg: AZFdTZdLR2qFRGOL923lmax2S2uY3z2rwv/Ar8euVjLuXVp1FTjtAmuuFRb7KvyrX86
	UWk+vux0TQL8RSIqDfGGNWRNIptKadIrkt9Z91K8GzJi7atcFJmB/5LhUnPDEOu2yzni2XniFMd
	U/m1grUIw/kkr1p3zO+wFZbyFMM0K55pcKWHvyFxs9dQOq4StZgTnecWvqHHbzya9B+rrgKs6Jl
	hKFWIHdRzmyc8D68nJcDiXEKvZFyvLAz+dtWX0FdAyuLMINDTYY7hYIfjVTwsAu/p1dDQFvdu4O
	fHJ1/vUFr7mqpTQQa4Gd734cbPBFUe4BTo9Pe3YHBStCuJNUvTNgCAQ25ffwjKY8YwUjAEsL4vi
	VafkRplTTPX3HcuzwbzCv9C1gANyiqt9tynbObZJuQK7mvJM4S/wT8aP+nJ1lioSxr0RwPf3Gk7
	ME563+48RwFsu+TkZzAvJWwJnmjbW+whtdPqiSL6KeolAOcxbiYKhGz77n0lFqwSs0wNSq1Ziq
X-Received: by 2002:a17:907:a890:b0:c50:9432:b7e3 with SMTP id
 a640c23a62f3a-c513aace654mr1151233566b.42.1795460154527; Mon, 23 Nov 2026
 10:55:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123153238.1036972-1-smish149@asu.edu> <20261123153238.1036972-2-smish149@asu.edu>
In-Reply-To: <20261123153238.1036972-2-smish149@asu.edu>
From: James Houghton <jthoughton@google.com>
Date: Mon, 23 Nov 2026 13:55:17 -0500
X-Gm-Features: Aa3M54o3BkLplxoImmTCvpPC5WgG3n0ZneGbPk_xxpY2ZYPc3HauVZVJB5o2TiI
Message-ID: <CADrL8HWj6qLSB4h_JC7qSr6+t6Z6p7zzL7fgVne-m8_cfrHwOA@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: Disable preemption while pushing to the dirty ring
To: Siddharth Mishra <smish149@asu.edu>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Shuah Khan <shuah@kernel.org>, Peter Xu <peterx@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 10:33=E2=80=AFAM Siddharth Mishra <smish149@asu.edu=
> wrote:
>
> Disable preemption in kvm_dirty_ring_push() so that another push to the
> same dirty ring cannot run in the middle of it.
>
> kvm_dirty_ring_push() selects an entry with dirty_index, fills the entry,
> and only then increments dirty_index, all with preemption enabled, e.g.
> when vmx_flush_pml_buffer() pushes the logged GPAs on VM-Exit.  If the
> vCPU task is preempted in that window, kvm_sched_out() calls
> kvm_arch_vcpu_put() while kvm_running_vcpu still points at the vCPU, and
> kvm_steal_time_set_preempted() or kvm_xen_runstate_set_preempted() marks
> a page dirty, which pushes to the same ring.  That push fills the
> selected entry and increments dirty_index, then the interrupted push
> overwrites the entry and increments dirty_index again.  The entry after
> it is never written, its flags stay zero, and the entries after that one
> are dirty.
>
> Userspace harvests the ring in order and stops at the first entry that
> is not dirty, so it never harvests any later entry, and the GFN of the
> overwritten push is lost.  A VMM that tracks dirty memory with the dirty
> ring, e.g. for live migration or to restore a snapshot, then misses every
> page that the vCPU dirties afterwards.
>
> Fixes: fb04a1eddb1a ("KVM: X86: Implement ring-based dirty memory trackin=
g")
> Cc: stable@vger.kernel.org
> Signed-off-by: Siddharth Mishra <smish149@asu.edu>

Feel free to add:

Reviewed-by: James Houghton <jthoughton@google.com>

> ---
>  virt/kvm/dirty_ring.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
> index 572b854edf74..1ed8b8771c3e 100644
> --- a/virt/kvm/dirty_ring.c
> +++ b/virt/kvm/dirty_ring.c
> @@ -221,6 +221,8 @@ void kvm_dirty_ring_push(struct kvm_vcpu *vcpu, u32 s=
lot, u64 offset)
>         struct kvm_dirty_ring *ring =3D &vcpu->dirty_ring;
>         struct kvm_dirty_gfn *entry;
>
> +       guard(preempt)();
> +
>         /* It should never get full */
>         WARN_ON_ONCE(kvm_dirty_ring_full(ring));
>
> --
> 2.54.0
>
