Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795377076;
	b=RpMNEFPukY/D/kbMTBYp7uJXQp5MbEwdEDkLHKqr6Guxqx+SH13jCdDCTcDp2RWQVMZp
	 wJDLaR4BwxRHrwUm0Q36sx47EJ4mxYI/R8dalm4vxV4JGRDh97rfD70oh0y4Xy48yOtus
	 UL9eSc8vWJDaaHbDBVd41KF1TiYW7MhxcLFbcY9sLqMuZVzJHI0ghVSuS91MXF1EkSsN2
	 lMvCh8zFv1rQ90334KuPwMyIyPOogPrbYk1edbsk5WDdp9dq00tJ3cM0Ldc12twV4852n
	 2oS8hjzfuA02OHp+/I0Ul0XyClYnJMoGvW3kJEOif2/uqWDgvRNEC7neMqOiCQaEXzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795377076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dEbNC3pIasfz+1kUIBaS1REGH5134TVv5RUDhMq/bQs=;
	b=LzT1MjE+ONpZjitAbJVPdswcPEc9XwqiJYpRZUEjSA7nXv/OJfWhTr68zDd7fgOEciZk
	 9pPx1I2UCrK3ztmhfD7L26DPWiPs/C3wWlUS2V7ntGVw6ykBTIbZsO3LgIH7YupjFnIGA
	 JXYmL4trx6kmmVD/+8cCsFI0I+jb9bjf3v9JGWPqvoI0RobsN6HWQkjSak1Oav0rUuUu9
	 BOdVe+s5AxZFvzi1Zy+6GtBraGnB8+9944u1rcKij9uboROfRhAV3DhMJvJUJIzST4BWC
	 DfzOhedSpqr8KWCdPX3F+yhjc8lye0S1SfPGMezw05htTEYPrtmYerp4aF+90VuJ0zQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yR2dHYCr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3406C606A33B
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3406C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yR2dHYCr
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67db3a48dc6so2821835d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:51:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795377075; cv=none;
        d=google.com; s=arc-20260327;
        b=iPLJDp8aIkeuGexoq/sR5QvBeDcjOUpoQLbEAWZQWCLbkFCSzTOgpa1v3gR7pg0kxE
         ZsqKf6SSJO1gMmRJbWSyPpsBW98DnUjdjeN7fszHapCSe+rOMFG/+ceKYWeAyg6WUXJK
         4zjqWVVc/cxxIx4oMzL/7JSsClqqhtLHOHIvkVD3z/ty6oQIxavV4PsdSVWYDRilqM0Z
         +el3IW1/JzzZj8h/bZ/GycXK0SbfGvJofbx5LCD6s4pTI96FV9AJjmEk+C1tK6AfKcdc
         2W66URZT37qtQzHp8+SqYCTGfNVnOxqsYeogY+LAxKRo7G1U3yb/Ki5HbJKKzaqsK7qx
         9c9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dEbNC3pIasfz+1kUIBaS1REGH5134TVv5RUDhMq/bQs=;
        fh=VWDOa/6IM6UtJ/D1/ljmfZvFORjCyRa9mMEj6Ueud4o=;
        b=hAf5DrjMuulS7rE3ZWn8V3vj8zFVeDQ/5eoPvom1XWrGSW69twI6/7WQnnSmXyC5kY
         fStqRtmumGvrLNxWzBgGN7DQw5lEJNdmb7Ll3KZqgNaA35jwhefCN5cTQ7jxGf53TlYE
         tV8pJvphZ6iajnLR0p5hlzoeFIpru55feqIK5o5ctY16WLg1sO2gKQ7snZs2J3hONAhQ
         jusV/Cr+K4Tvl5elg8pROdXFyHkt8YHs2tzPldLXKmmSkEH7xFQ/E1qlQ/fDTmhBjU3i
         2WGYEF6hBo3U89UEcpuCBhfhFN9QerGBteJ8syODUBnmtMasH3ZOAIDxv1+8dBrpSrBx
         D7rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795377075; x=1795981875; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dEbNC3pIasfz+1kUIBaS1REGH5134TVv5RUDhMq/bQs=;
        b=yR2dHYCrxUFnSLp2JIQjIVcK1EAUojMT7oiKh4t+QSBbCFQZddYTdyXmrhyuGRoqOG
         LH6r8A4VFgyu87+vF6M04fw4Izlc0HBTdebsYva2fGOlgmJfKuzzpQw0Ggvg3CedltVk
         Q56akEtoTb7pGqKTwcnAWdlqAAAma0ytb+WcpiOhrpF5L5oYx7MzdtwXpkYBEewrfq7C
         sUODzIxwYKf3NbO/S7PTUDCkq4PNE909ur4R5hNzWcARyViau+vYZOJrg+1tFFzxGc1c
         LcEDX+W4QCRF4DXP1xqu+jbVc/MwYZ/BqCX0AldVAYjA1V5x/ECYrs2tYIRsO+onYrks
         swXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795377075; x=1795981875;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dEbNC3pIasfz+1kUIBaS1REGH5134TVv5RUDhMq/bQs=;
        b=pcK+8azhEISUXfSHvrwTr1pB0zYiciM69vH9yzENQsn21Q/OSjX4g4UVp0eUImUtrf
         0bzLuMgxEMZmn6ny/kgSrr5H72a+20DnLphhDoFNOJ4xVF+0P7My7pycfiE7I/K8X+b4
         bL6gbD2LynxGfVwCTAPgrCS7tceWhW+rKqsJrP8ahhB5xGfXz+QGsySIRr71KEtqFBRi
         KiOoMNIZ6ZLZBRRZ+hSq7k4/ODdyT4yith5qFH3yjB/9AeufCC2SWOptDuljN+DmPa2F
         yvV0330q/57nFc+wuwH5A8P7MYFTxbrd7NgGaXgVMD43+3cbBEGryoc5fzsQ985UlCVT
         Wz5w==
X-Forwarded-Encrypted: i=1; AL+hErE+zkcarKcLWGSKUOux6KiEnt2vBFNHrFZP/0OiPmy1nRkLOJHO1+JejACeA4uGHhhC83z6Kt3IBCVqnnE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IQ5vtdOQKkNmUFK155S15o5Oj7qo645rw1aPqYUzzTLi3wkVU
	DQn43GlWynvndAhnC3JsA3MkDrRWmYu+L64QydYs+4ADIQKzpZPXgMg0V6vRJ/dnmzEE91+wfgx
	+Jheus5suj+lJSBf47DUYvTauy3QHM28=
X-Gm-Gg: AZFdTZeYE9vafqlMl6iN/QURsFryJPD60gTt6cQ0TPZ4wIRBBxbMARE5FXg39zSyPqZ
	A/u8ZV3c2qfd7mIkoviVqOyJgWN1kB0xhuUcnMfwFSHdP9AgHHdfbZhOAfHfAtivGSww4Tk0GZ/
	2O74Cm/ARNFDHzgm4ZQlvpWRSdFaVw1WkY4q53tXdPy6f0f9rgWyVrbhsedKflf45ZvHIn/i+Gi
	Mle38o5zdePAqC7t9epKQ0DuHzSAeQgj1CBOBrKWSnET9mrvlhSc+bhACyOmgGvufP0FfxRew+L
	OAAGcsbDUdU8CToCRmlep8IuCvL1uUfeK+erZfNIG3Os/zLijz4NUevpFNb2uSbRLA1V5Dd3Kj9
	3FbjFQXE7di5V1d3grqRmJN/Ez/dTBIXf9z/ADDa4ytQwjLVS7VEex63/jlLKE8ZyHftMCVEoX3
	ppgCS8lsqVnhwOIl22cpLHD1rZDKGPv5JB2Sba2aUxTYXYWiDmIIduRzD+yNDRMi9l6BztM7vLY
	KxxYKw7xw==
X-Received: by 2002:a05:690e:43ce:b0:679:be6b:42d5 with SMTP id
 956f58d0204a3-67df4456982mr1539736d50.98.1795377075124; Sun, 22 Nov 2026
 11:51:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117222224.1465328-1-arnd@kernel.org> <20261117222224.1465328-3-arnd@kernel.org>
In-Reply-To: <20261117222224.1465328-3-arnd@kernel.org>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Sun, 22 Nov 2026 11:51:04 -0800
X-Gm-Features: Aa3M54qSKnHMfRte544j7n37UHVtncPq8-RbJK8w975X-Kp2Zw1xOI3CE7bOY5A
Message-ID: <CAE5sdEim3Xz2SPwsb-xP+gp-+w5TOhDv4JtDf0ZbVZ2XSfK+jA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dynamically enable st64bv0 for SVA
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Navneet Singh <navneetsingh@microsoft.com>, apais@microsoft.com, 
	hargar@linux.microsoft.com, Rachel Menge <rachelmenge@linux.microsoft.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 14:22, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> I/O devices that understand the st64bv0 instruction for doing shared
> virtual access from userspace need to set the pasid value in the
> accdata_el1 register, but in general we want this to be disabled unless
> a driver actually hands an MMIO area to userspace that accepts these
> commands and installs a pasid using iommu_sva_bind_device().
>
> Rather than trying to find all threads that use an mm_struct by the
> time the pasid created, iommu_sva_bind_device() only stores the pasid in
> 'struct iommu_mm_data' and sets up the iommu domain in the device. The
> first attempt to use SVA from userspace traps into do_el0_other(),
> which checks that this is indeed valid and then sets the configured
> pasid before enabling SCTLR_EL1_EnAS0.

I've tested it on Cobalt h/w (ID_AA64ISAR1_EL1.LS64 = 0b0011, SMMUv3
with PRI) on top of Fuad's FEAT_LS64_ACCDATA series and our Data
Accelerator VF driver.\

While testing multi-process isolation on hardware, we hit the SCTLR_EL1_EnAS0
context-switch bug below, which Sashiko's review [1] also highlighted along
with several of the other corners listed here (note that Sashiko's cpucaps and
guest vcpu_sysreg warnings are false positives from applying against docs-next
without Fuad's series):

>
> On machines running KVM guests, KVM already handles saving and restoring
> ACCDATA now. If the same process uses SVA itself, the context is restored
> upon guest access. This only really makes sense if the host device using
> SVA is attached to the same SMMU using a single stage translation, and
> another device is assigned to the guest VMID for stage2 so it can use
> the stage1 translation inside of the guest using ACCDATA as PASID.
>
> This is pretty much a lifted from the x86 try_fixup_enqcmd_gp()
> function.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm64/include/asm/cpufeature.h  |  5 +++
>  arch/arm64/include/asm/exception.h   |  1 +
>  arch/arm64/include/asm/mmu_context.h | 17 +++++++++
>  arch/arm64/kernel/entry-common.c     | 11 ++++++
>  arch/arm64/kernel/traps.c            | 52 ++++++++++++++++++++++++++++
>  arch/arm64/tools/sysreg              |  5 +++
>  6 files changed, 91 insertions(+)
>
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index 7d7b8eb7f72f..e5367344e817 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -914,6 +914,11 @@ static inline bool system_supports_bbml3(void)
>         return alternative_has_cap_unlikely(ARM64_HAS_BBML3);
>  }
>
> +static inline bool system_supports_ls64_accdata(void)
> +{
> +       return cpus_have_final_cap(ARM64_HAS_LS64_ACCDATA);
> +}
> +
>  int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
>  bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
>
> diff --git a/arch/arm64/include/asm/exception.h b/arch/arm64/include/asm/exception.h
> index a2da3cb21c24..7c61b50718d6 100644
> --- a/arch/arm64/include/asm/exception.h
> +++ b/arch/arm64/include/asm/exception.h
> @@ -81,6 +81,7 @@ void do_el0_sys(unsigned long esr, struct pt_regs *regs);
>  void do_sp_pc_abort(unsigned long addr, unsigned long esr, struct pt_regs *regs);
>  void bad_el0_sync(struct pt_regs *regs, int reason, unsigned long esr);
>  void do_el0_cp15(unsigned long esr, struct pt_regs *regs);
> +void do_el0_other(struct pt_regs *regs, unsigned long esr);
>  int do_compat_alignment_fixup(unsigned long addr, struct pt_regs *regs);
>  void do_el0_svc(struct pt_regs *regs);
>  void do_el0_svc_compat(struct pt_regs *regs);
> diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
> index 803b68758152..40c47ee003d5 100644
> --- a/arch/arm64/include/asm/mmu_context.h
> +++ b/arch/arm64/include/asm/mmu_context.h
> @@ -16,6 +16,7 @@
>  #include <linux/mm_types.h>
>  #include <linux/pgtable.h>
>  #include <linux/pkeys.h>
> +#include <linux/iommu.h>
>
>  #include <asm/cacheflush.h>
>  #include <asm/cpufeature.h>
> @@ -247,6 +248,20 @@ static inline void __switch_mm(struct mm_struct *next)
>         check_and_switch_context(next);
>  }
>
> +/* switch to PASID if new task has enabled st64bv0 */
> +static inline void switch_iommu_mm(struct mm_struct *mm, struct task_struct *tsk)
> +{
> +       u32 pasid;
> +
> +       if (!IS_ENABLED(CONFIG_IOMMU_SVA) ||
> +           !(tsk->thread.sctlr_user & SCTLR_EL1_EnAS0))
> +               return;
> +
> +       pasid = mm_get_enqcmd_pasid(mm);
> +       if (pasid != IOMMU_PASID_INVALID)
> +               write_sysreg(pasid, accdata_el1);
> +}
> +
>  static inline void
>  switch_mm(struct mm_struct *prev, struct mm_struct *next,
>           struct task_struct *tsk)
> @@ -254,6 +269,8 @@ switch_mm(struct mm_struct *prev, struct mm_struct *next,
>         if (prev != next)
>                 __switch_mm(next);
>
> +       switch_iommu_mm(next, tsk);
> +
>         /*
>          * Update the saved TTBR0_EL1 of the scheduled-in task as the previous
>          * value may have not been initialised yet (activate_mm caller) or the
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index beb56891fc4f..03ecc73c44a4 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -807,6 +807,14 @@ static void noinstr el0_fpac(struct pt_regs *regs, unsigned long esr)
>         arm64_exit_to_user_mode(regs);
>  }
>
> +static void noinstr el0_other(struct pt_regs *regs, unsigned long esr)
> +{
> +       arm64_enter_from_user_mode(regs);
> +       local_daif_restore(DAIF_PROCCTX);
> +       do_el0_other(regs, esr);
> +       arm64_exit_to_user_mode(regs);
> +}
> +
>  asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
>  {
>         unsigned long esr = read_sysreg(esr_el1);
> @@ -870,6 +878,9 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
>         case ESR_ELx_EC_FPAC:
>                 el0_fpac(regs, esr);
>                 break;
> +       case ESR_ELx_EC_OTHER:
> +               el0_other(regs, esr);
> +               break;
>         default:
>                 el0_inv(regs, esr);
>         }
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index d6391ab20db3..a02dbee8c06d 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -13,6 +13,7 @@
>  #include <linux/kprobes.h>
>  #include <linux/spinlock.h>
>  #include <linux/uaccess.h>
> +#include <linux/iommu.h>
>  #include <linux/hardirq.h>
>  #include <linux/kdebug.h>
>  #include <linux/module.h>
> @@ -543,6 +544,56 @@ void do_el1_mops(struct pt_regs *regs, unsigned long esr)
>         kernel_fastforward_single_step(regs);
>  }
>
> +/*
> + * PASID/ACCDATA is shared by the entire mm, while sctlr_el1
> + * is maintained per thread. Keep things simple and enable
> + * ACCDATA dynamically on first access if the feature is
> + * available and a valid pasid is set.
> + *
> + * After exiting back to userspace, the st64bv0 instruction
> + * should no longer trap.
> + */
> +static bool try_enable_st64bv0(struct pt_regs *regs, unsigned long esr)
> +{
> +       u32 pasid;
> +       u64 sctlr;
> +
> +       if (!system_supports_ls64_accdata())
> +               return false;
> +
> +       pasid = mm_get_enqcmd_pasid(current->mm);
> +       if (pasid == IOMMU_PASID_INVALID)
> +               return false;
> +
> +       preempt_disable();
> +       write_sysreg(pasid, accdata_el1);
> +       sctlr = current->thread.sctlr_user;
> +       sctlr |= SCTLR_EL1_EnAS0;
> +       current->thread.sctlr_user = sctlr;
> +       update_sctlr_el1(sctlr);
> +       preempt_enable();
> +
> +       return true;
> +}
> +

1. SCTLR_EL1_EnAS0 is missing from SCTLR_USER_MASK (and fork/exec reset):

update_sctlr_el1() clears only (SCTLR_USER_MASK & ~SCTLR_ELx_ENIA). Because
SCTLR_EL1_EnAS0 is not in SCTLR_USER_MASK, once a task enables st64bv0 on a
CPU, __switch_to() -> update_sctlr_el1() never clears SCTLR_EL1.EnAS0 when
switching to another task, and switch_iommu_mm() returns early because the
next task does not have SCTLR_EL1_EnAS0 set in thread.sctlr_user. On Cobalt
200, an unprivileged process with no SVA binding scheduled onto that CPU
executed st64bv0 without trapping while the previous task's PASID was still in
ACCDATA_EL1.

Similarly:
- arch_dup_task_struct() copies thread.sctlr_user, so a fork() child inherits
  SCTLR_EL1_EnAS0 with a fresh mm whose PASID is IOMMU_PASID_INVALID (leaving
  the parent's PASID in ACCDATA_EL1 when switch_iommu_mm() skips the write).
- flush_thread() does not clear SCTLR_EL1_EnAS0 across execve().
- try_enable_st64bv0() can return false if SCTLR_EL1_EnAS0 is already set in
  current->thread.sctlr_user (matching current->pasid_activated on x86).

Folding in the diff below fixed all three cases (context switch to an unbound
task on the same CPU, fork(), and execve() all trap with SIGILL again on
Cobalt 200):


diff --git a/arch/arm64/include/asm/processor.h
b/arch/arm64/include/asm/processor.h
index 2f368889aa3a..c7243bd4849a 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -264,7 +264,7 @@ static inline void task_set_sve_vl_onexec(struct
task_struct *task,

 #define SCTLR_USER_MASK
         \
  (SCTLR_ELx_ENIA | SCTLR_ELx_ENIB | SCTLR_ELx_ENDA | SCTLR_ELx_ENDB |   \
- SCTLR_EL1_TCF0_MASK | SCTLR_EL1_TCSO0_MASK)
+ SCTLR_EL1_TCF0_MASK | SCTLR_EL1_TCSO0_MASK | SCTLR_EL1_EnAS0)

 static inline void arch_thread_struct_whitelist(unsigned long *offset,
  unsigned long *size)
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index b52d4f0cf5b4..6a1cfeb28bf2 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -350,6 +350,13 @@ void flush_thread(void)
  flush_tagged_addr_state();
  flush_poe();
  flush_gcs();
+
+ if (current->thread.sctlr_user & SCTLR_EL1_EnAS0) {
+ preempt_disable();
+ current->thread.sctlr_user &= ~SCTLR_EL1_EnAS0;
+ update_sctlr_el1(current->thread.sctlr_user);
+ preempt_enable();
+ }
 }

 void exit_thread(struct task_struct *tsk)
@@ -395,6 +402,7 @@ int arch_dup_task_struct(struct task_struct *dst,
struct task_struct *src)

  /* clear any pending asynchronous tag fault raised by the parent */
  clear_tsk_thread_flag(dst, TIF_MTE_ASYNC_FAULT);
+ dst->thread.sctlr_user &= ~SCTLR_EL1_EnAS0;

  return 0;
 }
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index a02dbee8c06d..be84e84c5fa1 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -558,7 +558,8 @@ static bool try_enable_st64bv0(struct pt_regs
*regs, unsigned long esr)
  u32 pasid;
  u64 sctlr;

- if (!system_supports_ls64_accdata())
+ if (!system_supports_ls64_accdata() ||
+    (current->thread.sctlr_user & SCTLR_EL1_EnAS0))
  return false;

  pasid = mm_get_enqcmd_pasid(current->mm);

2. Other corners (first three also highlighted by Sashiko [1]):

- EL2 -> EL1 boot setup (arch/arm64/include/asm/el2_setup.h): our bare-metal
  host ran at EL2 with VHE, so HCRX_EL2 did not affect host EL2/EL0. For
  kernels booting at EL2 and dropping to EL1 (e.g. CONFIG_KVM=n, nVHE/pKVM, or
  guest VMs booting at EL2), __init_el2_hcrx and __init_el2_fgt do not yet set
  HCRX_EL2_EnAS0 or HFGRTR_EL2_nACCDATA_EL1 / HFGWTR_EL2_nACCDATA_EL1, so EL1
  ACCDATA_EL1 accesses and EL0 st64bv0 will trap to EL2.
- KVM host ACCDATA_EL1 save/restore: regarding the commit message note about a
  host process using both SVA and KVM, even with Fuad's series applied,
  ctxt_has_accdata() in arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h returns
  false when !ctxt_is_guest(ctxt), so KVM loads the guest's ACCDATA_EL1
  without saving or restoring the host's ACCDATA_EL1 across vCPU run.
- Assembler target: arch/arm64/Makefile caps -Wa,-march at armv8.5-a, which
  breaks Clang IAS (LLVM=1) on write_sysreg(..., accdata_el1); using
  write_sysreg_s(pasid, SYS_ACCDATA_EL1) avoids that (and the duplicate manual
  #define SYS_ACCDATA_EL1 in arch/arm64/include/asm/sysreg.h can be dropped now
  that tools/sysreg generates it).
- CPU suspend: cpu_do_suspend / cpu_do_resume in arch/arm64/mm/proc.S
  saves/restores sctlr_el1 across CPU powerdown idle states without
  saving/restoring accdata_el1.

[1] https://sashiko.dev/#/patchset/20261117222224.1465328-1-arnd%40kernel.org

...
