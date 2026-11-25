Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621649;
	b=0t8pVSfHXbIS0pWMXtJipTJvGoRdIlPdpymrd53D1G+DkocqNsI2ZV2mBVrJlwq3AxmP
	 mnmokMv0NKv0vsWs6HLq9+CcA3KKtFPyrz3h2IA4I/U1D599a6VSK0r3cZ3srtvIxK3Wa
	 a4HUZKS/voPYWS7cKCn0FfhCGmNLhoQPnmYgm2mtRTsJVteEqdef9Foro5HsFePEYsLGP
	 2183kTgqgDT0wwiT28t3//LUJ8ESeNeQ/sHDkeXFjbXVhldHFDxRzm/p+Q3AutoHwZize
	 DLTcduLXefV3q7DTPE6tzOWH/66bRlNKTu0TvkMAmBisCl97FhXNiKosfuUA1JdmmZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Hdtm1Cjt8si2zXvxnXIwwBJ380UcY/zgg0civLIThwU=;
	b=N8g80QnHuNgELeKpvrQr4zayv+6nc2HRzgQfQyq7X9wHuw+g9Ja8k56mPHZdh0ZpWZvM
	 MTRKZ/v66V576ymRC26hfrXB9hioHqjcmbDSjhoiJ7rquU0eqNTOMq8w4xpgUi1SGyrok
	 rfa0mmWYJj3PL3K4+UCn3G3YQ/N/4QNJHFeskgvfhxi8mPKqu+6+F378+3wjpiHSjw+An
	 c91/YyyoXz/tX5NLoVfSLs84sjy+AjyPWhtUZ2QE7n6Rmw3zQJ0OvViuP0ym3a6RzrfHW
	 WQt+KR3JI+B+MbbvMTLgWuBJ44k9WpxSs6BJTLAnIMjPsxp4dMm0JA0e8ubpkL3bpzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jGDGjNhy;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C5B606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32C5B606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jGDGjNhy
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so50644015e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795621647; x=1796226447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hdtm1Cjt8si2zXvxnXIwwBJ380UcY/zgg0civLIThwU=;
        b=jGDGjNhycbGEqS5V+G1uw7ArrQPCLOtIxJ9T8nofWVFLDIB9iL/uLCYJYB1rnQ+Y4p
         MEs2oDSVBXLZHXCwAXJWDZna2kdsbf5U7M10aevHRzfMCIiJsSUp8q3StKfmpnfsvSsN
         JPxqaVy6vLyVS20Gt4qi+JUX4z1wQvgzg4oakV/9sQFh2onRtrZhx1fe3/J5GPcTO8Rt
         1Q82SzgpoPE4CNrb1AJMk3gOt/oRKkMQgI+1m7dvAmPEZ31PjtudfzI6c2JkZwiOKL0g
         lFcFUdzQDsKpouOIO7Ze6GsTnB2tmK8bA/ESronJIpxzWWL3ZMO4REqHDjSehJcOHDLr
         maew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621647; x=1796226447;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hdtm1Cjt8si2zXvxnXIwwBJ380UcY/zgg0civLIThwU=;
        b=OBdCRmRFue4Og+sGKNQyzxmMZvjOjnDyUC0kg4pre8iW13/2Bj371UqYC3QmLu9TQY
         cH1XayFDAGoSla2AIYrBTBvYci8pI64PJZlGN19S5Sh21h4Igln+SsaV2YTlqJnVJS7o
         tIR8SMA3DV7lCw1XLcezl+D1zmIZJfnhxgDCsn+xpFQlxxq2dkSf0tGvIHJHk20kn0d9
         HXAhtLFs4OZPtwRdPbDC4b0ONCdbR1/53KMout3e65+PzZ3QALEF+86zR2Ys8Bg3IjyA
         N97ni2Vv2B79kd9fWaE7KfFqd4BMi33uM8JD3f5ehTFuvz9KbBVLrxf8lbBnOqhTuqtm
         Ucew==
X-Forwarded-Encrypted: i=1; AL+hErE47HHlHRtMBhOtePzY39uEEkKEtPQZ4AUr30gcU9hqogwh8ccntILh8B5nZgshBHGpUqCx2DIdbhKxlBo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cs6k0qNMxgv6dpmqQGrC0E0m6xubYMNOf5l1aJoQ4WI9MePn1
	MJmRYXcN7o9+MNxVNGiAHdt/6s93MBG/BHtvaqFN+pnMwqaNX4a0Ik1WRs67Vzfupng=
X-Gm-Gg: AZFdTZe3U22yMKKiJCj6I73Bwxfwwy00XmMWeqnYnkuFwv1pHkJySimlzZwgfkYx5Al
	7CuIPGHS7HN45j6EresCdhmv3McTvr1pCHtcECHbDNT92qr8Hvrydwr3R6ENrDpn6COsQr5WH+J
	caXcy6MfUScRdAa51LsTpQ29GlmCISQuwr/RutyPREC97UePE+k0ugjLM90rjn5YRUZIrrMY4jQ
	Kfj3d+CRYuZrwW9tIi0c7Ay9T78UisjySAWA7PpNcu85zbRL+qZAV8YclI9seHam8DU+c508wwP
	KQju2okxqb6x4yvMQgYQHzYeqGhtBv12bmX/oyWoClyjTeJhY7Zg5ietWOg5l1QEu3XSRAWbz2b
	MaooeeLMdi4eOmnMNWbgP5DJl1cPTvb/4VJSr2YrtHYvIN/QDwyepcbw7OS+TW0IDiANdtqZ+IP
	Oq+YylqzGI8WVRha9kuZe1n4g6M4CjHr36iEnTRLbhulWvKLrP6Xdy7XJtJL01ee9igcujvngM3
	Ph3k4sPF0ulEBOGYZ/JHknJAYkr9puAkA3h8Wso5mQjVonAVU/Sy3/Nm52XKHZQ0+BYcHmsaH+l
	xnJy7V2J5mHP1ZkObgctcZEssWTByalDvw==
X-Received: by 2002:a05:600c:3b8a:b0:4ba:761:c0c5 with SMTP id 5b1f17b1804b1-4bb8880f0e0mr374641285e9.5.1795621647405;
        Wed, 25 Nov 2026 07:47:27 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm485293665e9.12.2026.11.25.07.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 07:47:26 -0800 (PST)
Message-ID: <6a874faa-04d0-4c8f-aa23-2a80fa1fa379@linaro.org>
Date: Wed, 25 Nov 2026 15:47:25 +0000
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
Subject: Re: [PATCH v10 00/33] ARM64 PMU Partitioning
To: Colton Lewis <coltonlewis@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>,
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Mingwei Zhang <mizhang@google.com>,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kvm@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
References: <20261119185215.632334-1-coltonlewis@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/11/2026 18:51, Colton Lewis wrote:
> This series creates a new PMU scheme on ARM, a partitioned PMU that
> allows reserving a subset of counters for more direct guest access,
> significantly reducing overhead. More details, including performance
> benchmarks, can be read in the v1 cover letter linked below.
> 
> PMU partitioning is controlled via the KVM API using
> `KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION` and
> `KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS` vCPU device attributes. When
> partitioning is enabled for a VM, userspace must explicitly configure a
> guest event counter count strictly less than the maximum general-purpose
> counters implemented by the PMU (leaving at least one general-purpose
> counter for the host) prior to calling `KVM_ARM_VCPU_PMU_V3_INIT`. The
> number of general-purpose counters implemented by each host PMU is
> exposed in sysfs at
> `/sys/bus/event_source/devices/<pmu>/caps/num_counters`. A QEMU patch
> demonstrating how to use the uAPI is sent separately.
> 
> An overview of what this series accomplishes was presented at KVM
> Forum 2025. Slides [1] and video [2] are linked below.
> 
> v10:
> 
> * Rebase on top of v7.4-rc3.
> 
> * Add nested virtualization (`FEAT_NV` / `FEAT_NV2`) support covering
>    both an Emulated L2 PMU (`vHPMN == N_L1`, `TPM == 1`, where L1 keeps
>    all `N_L1` counters and emulates L2 via L1 `perf` events) and a
>    Sub-partitioned L2 PMU (`vHPMN < N_L1`, `TPM == 0`, creating a
>    three-way split across `0..vHPMN-1` for L2, `vHPMN..N_L1-1` for L1,
>    and `N_L1..N_phys-1` for L0) (Oliver Upton). Because ARM64 provides
>    only a single physical `MDCR_EL2.HPMN` field, hardware can split the
>    PMU into two counter ranges at a time rather than three. Key design
>    decisions and supporting changes:
> 
>    - Keep physical `MDCR_EL2.HPMN = N_L1` at all times (`vHPMN` boundary
>      and event filtering): Lowering physical `HPMN` to `vHPMN` while
>      running L2 was considered and rejected because it would move L1's
>      hypervisor counters (`vHPMN..N_L1-1`) into the same physical
>      `>= HPMN` range as L0's host counters (`N_L1..N_phys-1`), where a
>      single set of physical `MDCR_EL2.{HPME,HPMD,HLP}` bits governs both
>      and breaks host/guest isolation; it would also fail for
>      `vHPMN == 0` on hardware without `FEAT_HPMN0`. Instead, when
>      `vHPMN < N_L1`, L0 keeps physical `HPMN = N_L1` and sets
>      `MDCR_EL2.{TPM,TPMCR}` in L2, forwarding `vHPMN..N_L1-1` traps to
>      L1 and handling `0..vHPMN-1` plus `PMCCNTR_EL0` in L0 directly
>      against physical registers. This preserves L0 isolation and
>      supports `vHPMN == 0` on all hardware; L2 events still count
>      directly in hardware without L0 `perf_event` scheduling, at the
>      cost of trapping L2 PMU accesses to L0 and rewriting per-counter
>      filter registers on `L1 <-> L2` transitions. In L1
>      (`is_hyp_ctxt()`), L0 emulates `vHPMN`, `vMDCR_EL2.HPMD`, and
>      `vMDCR_EL2.HCCD` via `PMEVTYPER<n>_EL0` and `PMCCFILTR_EL0`.
> 
>    - Dynamically multiplex `vPMCR_EL0.E` and `vMDCR_EL2.HPME`: Because
>      both `0..vHPMN-1` and `vHPMN..N_L1-1` sit below physical
>      `HPMN = N_L1`, hardware gates both with physical `PMCR_EL0.E`.
>      Rather than unconditionally trapping `PMCR_EL0` and `PMCNTEN*` for
>      all `FEAT_NV` VMs (which would penalize Emulated L2 PMU where
>      `vHPMN == N_L1`), L0 dynamically enables `MDCR_EL2.TPMCR` and
>      `HDFG{R,W}TR_EL2.PMCNTEN` only when `vHPMN < N_L1`. L0 keeps
>      architectural `PMCR_EL0` and `PMCNTENSET_EL0` in memory, sets
>      physical `PMCR_EL0.E` to `vPMCR_EL0.E || vMDCR_EL2.HPME`, masks
>      disabled sub-ranges out of physical `PMCNTENSET_EL0`, and gates
>      overflow delivery per domain. Trapped `PMSWINC_EL0` writes (also
>      enabled via `HDFGWTR_EL2` when `vHPMN < N_L1`) flush live registers
>      and reuse `kvm_pmu_software_increment()` to prevent cross-partition
>      chaining.
> 
>    - Bias 32-bit counters on mismatched `vPMCR_EL0.LP != vMDCR_EL2.HLP`
>      (`FEAT_PMUv3p5`): When `LP == HLP`, physical `PMCR_EL0.LP` matches
>      both domains directly and `PMEVCNTR<n>_EL0` stays untrapped in L1.
>      When `vHPMN < N_L1` and `LP != HLP`, rather than ignoring the
>      mismatch (breaking 32-bit overflow interrupts) or falling back to
>      `perf_event` emulation mid-flight (requiring reservation teardown),
>      L0 forces physical `PMCR_EL0.LP = 1` (64-bit overflow), dynamically
>      traps `HDFG{R,W}TR_EL2.PMEVCNTRn_EL0`, and biases counters in the
>      32-bit sub-range `2^32` events below 64-bit overflow
>      (`0xffffffff00000000 | low32`) while tracking their upper-32-bit
>      offsets and re-biasing outside interrupt/NMI context. Because
>      `HDFG{R,W}TR_EL2.PMEVCNTRn_EL0` is a single trap bit covering all
>      event counters (`0..30`), L1 counter reads/writes trap across both
>      sub-ranges while `LP != HLP`, with zero overhead when `LP == HLP`.
> 
>    - Baseline nested support (both Emulated and Sub-partitioned L2):
>      separate implemented and accessible counter masks by using
>      `nr_pmu_counters` directly in `kvm_pmu_implemented_counter_mask()`,
>      masking trapped guest reads of `PMCNTEN*`, `PMINTEN*`, and `PMOVS*`
>      with `kvm_pmu_accessible_counter_mask()`, and ignoring
>      `MDCR_EL2.HPMN` in userspace `KVM_GET_ONE_REG` / `KVM_SET_ONE_REG`
>      (`set_pmreg()`, `get_pmreg()`, `get_pmcr()`) so saving/restoring a
>      nested vCPU paused below EL2 preserves all VM-implemented counters
>      and true `PMCR_EL0.N`; preserve host counter reservations across
>      `IN_NESTED_ERET` / `IN_NESTED_EXCEPTION` transitions to avoid host
>      `perf` reschedules on emulated L2 traps; read live hardware
>      `PMSELR_EL0` in `check_mdcr_hpmn()` when untrapped; and forward
>      fine-grained traps for selector-indexed `PMXEVTYPER_EL0` and
>      `PMXEVCNTR_EL0` to L1.
> 
> * Expose the number of general-purpose counters implemented by the PMU
>    in sysfs under `/sys/bus/event_source/devices/<pmu>/caps/num_counters`
>    so userspace VMMs can query host PMU counter capacity when configuring
>    a partitioned PMU (James Clark).
> 
> * Make `__vcpu_rmw_sys_reg()` atomic on the local CPU using
>    `try_cmpxchg_local()` to prevent read-modify-write races with GICv3
>    pseudo-NMI PMU interrupt handlers (`kvm_pmu_handle_guest_irq()`),
>    which are not masked by `local_irq_save()` (Sashiko AI Review).
> 
> * Construct `mdcr_el2` in a local variable before assigning
>    `vcpu->arch.mdcr_el2` once in `kvm_arm_setup_mdcr_el2()`, and mask
>    GICv3 pseudo-NMIs (`local_daif_save()`) across hardware PMU context
>    switches and `MDCR_EL2` updates (Sashiko AI Review).
> 
> * Prioritize kernel-owned pinned event groups (`is_kernel_event()`)
>    ahead of userspace pinned events in `perf_event_groups_cmp()` /
>    `perf_less_group_idx()` so kernel-owned per-CPU pinned events (such as
>    the hardlockup NMI watchdog if toggled at runtime) are scheduled before
>    userspace pinned events when `perf_pmu_resched_update()` reschedules
>    events out of guest-reserved counters (James Clark, Sashiko AI Review).
> 
> * Move `kvm_vcpu_reload_pmu()` from `arch/arm64/kvm/pmu-emul.c` to
>    `arch/arm64/kvm/pmu.c` in `KVM: arm64: Reorganize PMU functions`.
> 
> * Add `kvm_pmu_is_partitioned()`, `kvm_pmu_guest_counter_mask()`,
>    `kvm_pmu_handle_guest_irq()`, `kvm_pmu_host_start()`, and
>    `kvm_pmu_host_stop()` stubs to `arch/arm/include/asm/arm_pmuv3.h` to
>    fix 32-bit `ARCH=arm` builds (kernel test robot).
> 
> * Allow identical VM-wide PMU device attributes
>    (`KVM_ARM_VCPU_PMU_V3_SET_PMU`, `KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS`,
>    and `KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION`) to be applied across all
>    vCPUs when userspace initializes vCPUs sequentially (`CPU_FOREACH`),
>    validate `kvm_arm_pmu_part_hpmn(n) < max_counters` (requiring
>    `max_counters >= 2` for `n == 0` without `FEAT_HPMN0`), and restrict
>    `kvm->arch.supported_cpus` to `arm_pmu->supported_cpus` when
>    partitioning is enabled.
> 
> * Centralize partitioned PMU hardware register dispatch under
>    `kvm_pmu_direct_reg_read()` / `kvm_pmu_direct_reg_write()` with
>    preemption disabled (`kvm_pmu_part_on_cpu()`), guard lazy ownership
>    transitions in `kvm_pmu_part_overflow_status()` with
>    `scoped_guard(preempt)`, avoid matching `reset_unknown()` poison bits on
>    `PMCNTENSET_EL0` / `PMINTENSET_EL1` during `KVM_REQ_RELOAD_PMU`, and
>    schedule `KVM_REQ_RELOAD_PMU` on `KVM_SET_ONE_REG` writes so
>    `vcpu_put()` does not overwrite userspace register writes (Sashiko AI
>    Review).
> 
> * Support configuring 0 guest event counters (cycle counter only) on
>    Partitioned PMU hosts without `FEAT_HPMN0` whenever `max_counters >= 2`.
>    Writing `MDCR_EL2.HPMN = 0` without `FEAT_HPMN0` is architecturally
>    `CONSTRAINED UNPREDICTABLE`, which would otherwise prevent userspace
>    from creating a cycle-counter-only partitioned guest on CPUs lacking
>    `FEAT_HPMN0`. Instead, KVM programs physical `MDCR_EL2.HPMN = 1` via
>    `kvm_arm_pmu_part_hpmn()`, reserves and quiesces physical counter 0
>    alongside `PMCCNTR_EL0` so host perf continues using counters `1..N-1`,
>    keeps `MDCR_EL2.TPMCR = 1` so trapped `PMCR_EL0` reads report `N == 0`,
>    and enables fine-grained traps on `PMEVCNTRn_EL0`, `PMCNTEN`,
>    `PMINTEN`, and `PMSWINC_EL0` so counter 0 stays completely hidden
>    (`UNDEFINED` / RAZ / WI) while `PMCCNTR_EL0` remains untrapped on
>    `FEAT_FGT` hosts. Also clamp `MDCR_EL2.HPMN` against `nr_pmu_counters`
>    in `kvm_vcpu_read_pmcr()` and `kvm_pmu_direct_pmcr_read()`, and extend
>    `vpmu_counter_access` to verify `PMCCFILTR_EL0`, live `PMCCNTR_EL0`
>    counting, and trapped `UNDEFINED` / RAZ / WI behavior on counter 0 when
>    `n == 0`.
> 
> Tool-assisted development note (generated-content.rst):
> Several v10 additions (nested virtualization sub-partitioning,
> cycle-counter-only support without `FEAT_HPMN0`, the userspace `HPMN`
> masking fix, and cover letter text) were drafted and verified with AI
> coding assistance (Gemini) and pre-reviewed with Sashiko AI Review. All
> patches were reviewed, built (`arm64`, `CONFIG_ARM_PMU=n`, 32-bit `arm`),
> and tested on bare-metal Neoverse V2 and AmpereOne hosts (and under QEMU
> TCG for the userspace `HPMN` fix).
> 

Tested-by: James Clark <james.clark@linaro.org>

Re-tested some of the old bugs and ran the Perf tests on a partitioned 
guest on Orion O6 and N1SDP boards. Also tested some basic Perf commands 
in a nested guest using your QEMU patches on the FVP.

Had a quick scan through the patches and LGTM. I'm impressed you managed 
to get the sashiko comments down to just one for such a big patchset.

