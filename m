Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795558579;
	b=PewKeyEjPPUd8kvxG8RVZwmsslaaKZmjWnAUgzLxNHojNdml88FhRaGPoeXjIhPV1j+Q
	 bTrhJbwIQfkSURkjoA9jeC3hch1bpKRnpggsmaLBjskoMhgZNl29LR/It/Ych5HMAQHl+
	 0A0NQ9uVT7s/2mTQ8XI9j/Zk1ua/cscEuULRezXEv998GVi+EwZJWeboPdeuZ3elfTn92
	 sYBTOPpiFFs7cosM7cWZTa05gbryGnuNOSiaJBpUUbP47H5fX6x0EbgNQd8eoYKgJyF2w
	 vlYsLAy9NtlJqMLqjczkn4HzGFxLX9Z24Vw1HLmWN1YGhBz5BeIYt32w9s9XUv/if+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=oIkNeebV3bBNTky3/G9aQsRRQo/i+uLeVgZIMqhznFQ=;
	b=kqwBTTn88RetJbeSX/GU86g2NZ9zCQXyc2svoumoHH6RDV+BHuD87l4MOOBRUKoBssDo
	 PFdU1yPRAVqwV59z5f4DYsXwRehdP6PIhuSi22RsgciFo5Yl2DUDV22pT9mxx7qflKpE1
	 XglBFrV8h0RVDijuAJgB4w1sThGdc+Hz06txoheYNEGZ2tbrSz26DqbQO0y1bDaD4w3zc
	 0ct2DkBaboZInRX4I7FWCbVNqnmtNrTJlFYKukAj+dTMWI1hleFGXRipv6SEQiUVKRPVh
	 eNYQ2YzkyA8xxqhl97xBd44541TG7bqPmWpPzPdMVXT5oHHOPqhiNqCHaD5/lLpUS4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F+B4GdzA;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC22F606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC22F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F+B4GdzA
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-851f720d7afso3132861a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795558578; x=1796163378; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oIkNeebV3bBNTky3/G9aQsRRQo/i+uLeVgZIMqhznFQ=;
        b=F+B4GdzAmM66lBpyh+fvByyg37qQYV9YEVLkPzVoqCbR+PKh1/Rt2lLToih8WyVjXV
         zafUeLcRBIyxkfYx3/G8LaIjl0Qx5i9ChPmFsyMKAKa9hfABmZqg4UksjPQuSLvWBCJ5
         VFXOmw+GY1LrJaX4XaBm88b0Hau0/efT9T/Rwp34AMszlRGsDntTIi4dol5aLw3+GWwI
         oEU0h81PrDuMhe6MepyfZ1Lf2nUBiChf++ruFdDUPknGEvj4FXmdpNUipkUuViO3cCjq
         MpBhZFZqwRz7nrFVJYEjATPW2su9TDlNXnGc5KZgY1YDJDPF9r5DYQRKFRva33Wdyq5I
         BzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795558578; x=1796163378;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oIkNeebV3bBNTky3/G9aQsRRQo/i+uLeVgZIMqhznFQ=;
        b=0bjIDF3NVpdY0OFs0QmVDN/eVjsk6hPGFTvSEPHBELPCJlk2lCkI49cvSVFZjbGjIP
         GAF+N6R4K4BKWXIerGA1Oi0pdo7MNO/fkfEW97CtKIM5+jWiNZkdMerP29BUZUPMb+zx
         MA8jHjfbbFCeFR4agezqRTC4hj92R4Or7Buwbhs3GtHweUktxiUl06SoZZL1cpk72/gw
         K20d6Vg6weqpnoolfVLa3vcwO1o15en+D6mfQhK8gr4Pcc9JDLAs92gNaNZU+h18IKVj
         q48fbSCvZEzIO4JK+/blmllU1qc0UgQgVtps/rauygTN0xYwWkwtN65Bvn4sxliYndfd
         Ts/g==
X-Forwarded-Encrypted: i=1; AL+hErFytQQz52lER90q2Hr2FiMiBeapurPPEO9sEDV1plA+JH8VuaCwGdbMI4yH4cGJ2Gz0ON2uyezjSP2VcaY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2JdRiIXZYywT78a/0KljiWNrgj2oqLaO76FwirpUU8koul5ax
	pLA4krmlazce/AWIi0JROyLNa5YGQEgwoFkkwMDW+T1UW8bGAski4R7VY95V5ZAz56JuWFHLnon
	KL0H3Jkspj3P3dXkljvC6b9tr5A==
X-Received: from jaaq28.prod.google.com ([2002:a05:6638:c01c:b0:61d:1a3b:cb30])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:180e:b0:572:61c7:bee2 with SMTP id 5614622812f47-57a06a1a79bmr18783520b6e.1.1795558577535;
 Tue, 24 Nov 2026 14:16:17 -0800 (PST)
Date: Tue, 24 Nov 2026 22:16:16 +0000
In-Reply-To: <87a4my7yhg.wl-maz@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123232647.3733149-1-coltonlewis@google.com>
 <20261123232647.3733149-2-coltonlewis@google.com> <867bi2z87n.wl-maz@kernel.org>
 <20261124202215.3731849-1-coltonlewis@google.com> <87a4my7yhg.wl-maz@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124221616.4155034-1-coltonlewis@google.com>
Subject: Re: [PATCH v2 1/2] KVM: arm64: nv: Discard undersized TTL hints in compute_tlb_inval_range()
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Steffen Eiden <seiden@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Dan Carpenter <dan@pereq.eu>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 20:42:19 +0000, Marc Zyngier <maz@kernel.org> wrote:
> On Tue, 24 Nov 2026 20:22:15 +0000,
> Colton Lewis <coltonlewis@google.com> wrote:
> > [1] only catches TTL hints smaller than host PAGE_SIZE. It does not
> > catch a hint that is >= PAGE_SIZE but smaller than the mapped block,
> > such as a 4kB L3 hint on a 2MB block on a 4kB host.
>
> Why do you think this makes *any* difference? The hint passed by the
> guest is utter bollocks, and the best thing would be to not invalidate
> anything. It's just too invasive to do elegantly.

Architecturally [1] is fine for the TLB, and before guest_s2_mappings
landed in v7.4-rc1 clearing the block was harmless. The problem with [1]
is a host memory leak in kvm_pgtable_stage2_unmap_tracked():

1. L2 faults in a 2MB block. kvm_s2_fault_map() installs a 2MB block PTE
   and kvm_record_guest_s2_mapping() inserts a 2MB
   struct kvm_guest_s2_mapping into both interval trees.
2. L1 runs TLBI IPAS2E1IS with a 4kB L3 TTL hint (4kB == PAGE_SIZE, so
   [1] returns 4kB).
3. kvm_pgtable_stage2_unmap(..., SZ_4K) clears the entire 2MB block PTE.
4. kvm_remove_guest_s2_mappings(..., SZ_4K) skips removing the 2MB entry
   because a 4kB range does not enclose it.
5. L2 touches the address again, faults because the PTE was cleared, and
   allocates another 2MB tracking entry.

Looping steps 2-5 lets an L1 guest leak one struct kvm_guest_s2_mapping
per iteration until a larger unmap or VM teardown (I measured 832kB of
slab_unreclaimable growth over 8192 iterations) and turns later TLBIs on
that range into linear walks under write_lock(&kvm->mmu_lock). Patch 2
avoids exact duplicates for the same (nested, canonical) pair, but
remapping the nested IPA to different canonical IPAs still leaves each
stale entry behind.

If you prefer not to touch compute_tlb_inval_range() beyond [1], another
option is keeping [1] as-is and dropping the cleared tracking entry in
kvm_remove_guest_s2_mappings() when a partial overlap leaves no valid
mapping beneath it (zero cost on valid hints).
