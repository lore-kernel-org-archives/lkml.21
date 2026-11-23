Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423831;
	b=3Zgo9pCvmDxncauCwUNWNqb7ZI9dT8uGxaskyaaT8XVPwtqPTSTIbW75/Pn3EawokQhV
	 x1o0qX2lzjHdACFZ8+xQs0gsL72sWiVKI85CmND0roUP/yMzCpaj+jjLaa0OUGnFXfPMF
	 unNseistscPhCIitnZOG+X6A8ChP3TemaYB+90qQi8ChPIAxJKyMVmLnJnxE+Pi8/l4CZ
	 IqRMKkEcGBfn549OTW+ls+C9D+qruwasDDs12OGnIKh0ViCh4UsHJXDzC1ZjVrqLbLxKR
	 r0OZu9Pm+51NB87ftu3S2FPIyzxtMOnkDe/8QaxfJGGLLUlQNhgLuAnYjLCAVnKejKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423831;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=DhKo/mTgQNmy1TND9VoDhX7AEkKALreB7zrtq8JXWBs=;
	b=f8MIiXP4LKPVq8R7V1tM3fGoONYIzweYXPHxipwLq6RPg1TMYAki312pL8v8+RNKRD2O
	 KIVDHmMbulR40sx3MWpt1by4QQAmxIVYSQmWB84wFr085zxzjBpfAOVVT/2PdXPSLLd35
	 L+yYX3be2SBjFVmQA9GUIowD7/pE2+B2LGfjdkolULG7rrpbTsZXPf3Vz8OJpbdStTZwU
	 8TTVfvW9zFBa01sSJCIM5aAFbaGp35rUkw433lOw/ZH+bscdSgzZVeQzDFinWyu7DNa+W
	 RzHRILQ74vss9UO0dIni9ebUKDn0jVoMxSbUGdFTBFY5vrBa8/TD1j+Olj8bsVM4wNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iF+Q3JbD;
	arc=none smtp.remote-ip=91.218.175.246
Received: from mta0.migadu.com (out-246.mta0.migadu.com [91.218.175.246])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2625606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2625606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iF+Q3JbD
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=m1gC05qoAzSqrKBZhxUCZhwdUcmJIoFGJPSk6HfoVlg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795423828; v=1; x=1796028628;
 b=iF+Q3JbDboEuMrexYvOPdaGoWPh2mCTq/LUfgJeODfNfLYhS6rX+a7/pHCV+jCc86cKZLmpK
 RvYGsTjzh/Ue4ryGQZhK7poWn9ErH5uavqtbvmJhKinR27oYVn2q5mgB2BIDddWogC2GMR2+rYx
 Fytq9Dzh4y5M8IZjj5Lw4Vt4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4f7084d3f2b6a81c;
	Mon, 23 Nov 2026 08:50:26 +0000
X-Mizu-Trace-ID: 4f7084d3f2b6a81c
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 08/19] hugetlb_vmemmap: Expose whether HVO is enabled
 to architecture code
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261122184453.2668189-9-jthoughton@google.com>
Date: Mon, 23 Nov 2026 16:50:09 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9487E341-5F59-4245-BE0E-EFDD413E45D2@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-9-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> =
wrote:
>=20
> Architectures that select
> CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO may configure the
> system at boot depending on whether HVO is enabled, e.g. arm64 may
> require all CPUs to support hardware access flag updates only if HVO =
is
> enabled.
>=20
> Add hugetlb_vmemmap_optimize_enabled() so that they can check. It is
> declared before <asm/hugetlb.h> is included, so that it can also be =
used
> from inline helpers there.
>=20
> It only reflects the hugetlb_free_vmemmap=3D kernel command line =
parameter
> (and the sysctl, when writable), not whether the architecture supports
> HVO.
>=20
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> include/linux/hugetlb.h |  9 +++++++++
> mm/hugetlb_vmemmap.c    | 18 ++++++++++++++++++
> 2 files changed, 27 insertions(+)
>=20
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 0d5414392d87..b2a6441bcd84 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -22,6 +22,15 @@ struct node;
>=20
> void free_huge_folio(struct folio *folio);
>=20
> +#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
> +bool hugetlb_vmemmap_optimize_enabled(void);
> +#else
> +static inline bool hugetlb_vmemmap_optimize_enabled(void)
> +{
> +	return false;
> +}
> +#endif
> +
> #ifdef CONFIG_HUGETLB_PAGE
>=20
> #include <linux/pagemap.h>
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 142f2975846b..fb6da64bd80d 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -452,6 +452,24 @@ static int __init =
hugetlb_vmemmap_optimize_param(char *buf)
> }
> early_param("hugetlb_free_vmemmap", hugetlb_vmemmap_optimize_param);
>=20
> +/**
> + * hugetlb_vmemmap_optimize_enabled - whether HVO is enabled
> + *
> + * This only reflects the hugetlb_free_vmemmap=3D kernel command line =
parameter
> + * and the vm.hugetlb_optimize_vmemmap sysctl, not whether the =
architecture
> + * supports HVO (see arch_support_vmemmap_remap()).
> + *
> + * The value is final once early parameters have been parsed only if =
the
> + * architecture selects =
CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO;
> + * otherwise it may change at any time through the sysctl.
> + *
> + * Return: true if HVO is enabled.
> + */

I don't think hugetlb_vmemmap_optimize_enabled() has clear semantics.

Its name suggests that it reports whether HVO is actually enabled and
usable, but it only returns the policy bit set by Kconfig, the command
line, or the sysctl. It may return true even when
arch_support_vmemmap_remap() is false. This is particularly confusing
because arm64 calls it while determining the capability on which
arch_support_vmemmap_remap() itself depends. Therefore, the helper
really reports whether HVO was requested, rather than whether it is
enabled.

Could we keep vmemmap_optimize_enabled private and let arm64 retain
the boot-time setting locally instead? For example, arm64 can use a
private hvo_enabled_at_boot variable with a
core_param(hugetlb_free_vmemmap, ...) registration. The system
capability is evaluated after core parameters have been parsed, and
arm64 makes the HVO sysctl read-only, so the value remains stable for
system capability and late CPU verification.

What do you think?

+static bool hvo_enabled_at_boot __ro_after_init =3D
+       IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
+core_param(hugetlb_free_vmemmap, hvo_enabled_at_boot, bool, 0);
+
 static bool has_bbm_through_af(const struct arm64_cpu_capabilities =
*caps, int scope)
 {
        /* The kernel only enables HW AF updates with =
CONFIG_ARM64_HW_AFDBM. */
@@ -2055,7 +2059,8 @@ static bool has_bbm_through_af(const struct =
arm64_cpu_capabilities *caps, int sc
         * BBM-through-AF is only needed for HVO. If HVO is not in use, =
don't
         * penalize systems with mismatched support.
         */
-       if (!hugetlb_vmemmap_optimize_enabled()) {
+       if (!IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP) ||
+           !hvo_enabled_at_boot) {
                /* Only valid if HVO cannot be enabled later via the =
sysctl. */
                =
BUILD_BUG_ON(!IS_ENABLED(CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_R=
O));
                return false;

Thanks,
Muchun

> +bool hugetlb_vmemmap_optimize_enabled(void)
> +{
> +	return READ_ONCE(vmemmap_optimize_enabled);
> +}
> +
> static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
> 					   struct folio *folio, unsigned =
long flags)
> {
> --=20
> 2.56.1.809.ga0b61035b5-goog
>=20

