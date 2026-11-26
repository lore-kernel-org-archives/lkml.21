Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656291;
	b=FrIo6Fd/cBr8Qk4bJn0BN4WWI+8u9Ml/KOJAiENyrAwmBRNO1aGGcIPJThdFVSRqxX4x
	 czznV+TPa7mN/NZX54Iemh6R/oXaClShdZB4sxawWsTs0KtXF0Y4hwhgWZ1UkkX4O8AZb
	 PT3NxJlZ0x8CX1OHr0crEXUQKqZI3HNN70BG+BfVYGf1Oh4BAWFpUKciaeLb4eFuTcHk3
	 7K+svBEm42YQ6wNTN28giUwwVAwTMpZfNqxFtMQBAUe77aKHcLhT55HR6IK1TawoMcRyk
	 92nG+7IPa+EHtpBiq4DLcJCD8F4TMoIbwjPyEozE7xSMrBGh4kGBCCsHU+dWM2ENZPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656291;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=OVEs5j0WnAhtqtypC5jMyPc3dpvQm1bZBi4ego186fY=;
	b=j04Yu9lRGw2gZIB6sQNJmGNm2Q2IO0ZBogvYTqlRI5BIFr7TqRGQmBULa66Tw16XdFwa
	 7n+4s7Bv/5b0FjGsYg8DF6gAE80oGL8y+TpoozC/K0Lp85PGIFpTVToTmuTkCrHUdbigU
	 87FPsuoIVgVvKNvW/q/RZsrrMGsgNPNQ1AT+S4CCmBx8p6CBZYxAO4jS5dblpy0l37ew+
	 jKM6BP9Qf9Cv7BojQl9OVQ2ByKpdX+VViA8Gh642TUDffWm1qTOvlT244k9eXfsDRU8Ji
	 Zr9K0bnYo/rLIas629TUFY7c8lL9sPcsOlFYpwkVoc8cA4BBsfgKx86aPF+0S0vD6dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WztpB0Iu;
	arc=none smtp.remote-ip=91.218.175.69
Received: from mta0.migadu.com (out-69.mta0.migadu.com [91.218.175.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DCB606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85DCB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WztpB0Iu
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vCClgcsEL7T6pGx+lymbKbCXTq1W2Hi1mvFjZlOAmio=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795656287; v=1; x=1796261087;
 b=WztpB0IuupqOObnfkZ+GKvUfs7+Y8nOQaM0142geqt1rzs2I+scx/KRL51PYdPeFm1suL+kI
 hKsWQFvpbs1i98aq243MvEo1OODM9DVvH0JdyB2BrW87X9ia5Wh9qAa6N0FP6zqotn/RhL0a1dy
 Aq0vV8Ccvh74Nt2aze+6e91o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b68fbc2c4b6597bf;
	Thu, 26 Nov 2026 01:24:46 +0000
X-Mizu-Trace-ID: b68fbc2c4b6597bf
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
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
In-Reply-To: <CADrL8HXM6Or4_7LM+D0XP9++4eENFt0J4ssShuXQxcmX8mAkoA@mail.gmail.com>
Date: Thu, 26 Nov 2026 09:24:29 +0800
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
Message-Id: <84A17A08-7A1B-4057-9BBB-BE9959A3B74D@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-9-jthoughton@google.com>
 <9487E341-5F59-4245-BE0E-EFDD413E45D2@linux.dev>
 <CADrL8HXPKfUhRaVhVyV6CPoQ2apZx1FCpyqyPMr=p=Q_kF3HBA@mail.gmail.com>
 <0EFB24F3-D3F2-4B28-9684-68CCCC1E80B8@linux.dev>
 <CADrL8HXM6Or4_7LM+D0XP9++4eENFt0J4ssShuXQxcmX8mAkoA@mail.gmail.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 26, 2026, at 00:26, James Houghton <jthoughton@google.com> =
wrote:
>=20
> On Wed, Nov 25, 2026 at 6:24=E2=80=AFAM Muchun Song =
<muchun.song@linux.dev> wrote:
>>=20
>>=20
>>=20
>>> On Nov 25, 2026, at 01:13, James Houghton <jthoughton@google.com> =
wrote:
>>>=20
>>> On Mon, Nov 23, 2026 at 3:50=E2=80=AFAM Muchun Song =
<muchun.song@linux.dev> wrote:
>>>>=20
>>>>> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> =
wrote:
>>>>> +/**
>>>>> + * hugetlb_vmemmap_optimize_enabled - whether HVO is enabled
>>>>> + *
>>>>> + * This only reflects the hugetlb_free_vmemmap=3D kernel command =
line parameter
>>>>> + * and the vm.hugetlb_optimize_vmemmap sysctl, not whether the =
architecture
>>>>> + * supports HVO (see arch_support_vmemmap_remap()).
>>>>> + *
>>>>> + * The value is final once early parameters have been parsed only =
if the
>>>>> + * architecture selects =
CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO;
>>>>> + * otherwise it may change at any time through the sysctl.
>>>>> + *
>>>>> + * Return: true if HVO is enabled.
>>>>> + */
>>>>=20
>>>> I don't think hugetlb_vmemmap_optimize_enabled() has clear =
semantics.
>>>>=20
>>>> Its name suggests that it reports whether HVO is actually enabled =
and
>>>> usable, but it only returns the policy bit set by Kconfig, the =
command
>>>> line, or the sysctl. It may return true even when
>>>> arch_support_vmemmap_remap() is false. This is particularly =
confusing
>>>> because arm64 calls it while determining the capability on which
>>>> arch_support_vmemmap_remap() itself depends. Therefore, the helper
>>>> really reports whether HVO was requested, rather than whether it is
>>>> enabled.
>>>=20
>>> I agree, the name is misleading.
>>>=20
>>>> Could we keep vmemmap_optimize_enabled private and let arm64 retain
>>>> the boot-time setting locally instead? For example, arm64 can use a
>>>> private hvo_enabled_at_boot variable with a
>>>> core_param(hugetlb_free_vmemmap, ...) registration. The system
>>>> capability is evaluated after core parameters have been parsed, and
>>>> arm64 makes the HVO sysctl read-only, so the value remains stable =
for
>>>> system capability and late CPU verification.
>>>>=20
>>>> What do you think?
>>>>=20
>>>> +static bool hvo_enabled_at_boot __ro_after_init =3D
>>>> +       =
IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
>>>> +core_param(hugetlb_free_vmemmap, hvo_enabled_at_boot, bool, 0);
>>>> +
>>>> static bool has_bbm_through_af(const struct arm64_cpu_capabilities =
*caps, int scope)
>>>> {
>>>>       /* The kernel only enables HW AF updates with =
CONFIG_ARM64_HW_AFDBM. */
>>>> @@ -2055,7 +2059,8 @@ static bool has_bbm_through_af(const struct =
arm64_cpu_capabilities *caps, int sc
>>>>        * BBM-through-AF is only needed for HVO. If HVO is not in =
use, don't
>>>>        * penalize systems with mismatched support.
>>>>        */
>>>> -       if (!hugetlb_vmemmap_optimize_enabled()) {
>>>> +       if (!IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP) ||
>>>> +           !hvo_enabled_at_boot) {
>>>>               /* Only valid if HVO cannot be enabled later via the =
sysctl. */
>>>>               =
BUILD_BUG_ON(!IS_ENABLED(CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_R=
O));
>>>>               return false;
>>>>=20
>>>=20
>>> This is a good suggestion, but let me explain why I don't think we
>>> should do this:
>>>=20
>>> First of all, I'm changing the bbm_through_af capability from a
>>> SYSTEM_FEATURE to an EARLY_LOCAL_CPU_FEATURE, which means that
>>> has_bbm_through_af() will be evaluated before core_param()s are
>>> parsed. I could change it back to a SYSTEM_FEATURE, but I would =
rather
>>> not do that. (See [1]).
>>=20
>> Actually you can use early_param.
>=20
> You're right that they won't conflict (today I learned).
>=20
>>>=20
>>> I also don't like duplicate parsing of the same command line =
argument.
>>> I'm not sure if there is precedent for this, but I feel like it will
>>> lead to confusion. (It is news to me that duplicate parsing like =
this
>>> is valid, as long as they are not both core_param()? or
>>> early_param()s, I think?)
>>=20
>> I checked the command-line parsing paths, and having more than one
>> handler observe the same command-line option is supported. In
>> particular, it is not restricted to handlers of different types.
>>=20
>> do_early_param() walks the entire .init.setup table and invokes every
>> matching early_param() entry; it does not stop after the first match.
>> There are several existing examples:
>>=20
>> - "kfence.sample_interval=3D" is parsed early by the arm64 and =
powerpc
>>  MM code and is parsed again by the generic KFENCE module_param_cb().
>>=20
>> - "pci=3D" is registered with early_param() in both
>>  arch/x86/kernel/acpi/boot.c and drivers/pci/pci.c.
>>=20
>> - "console=3D" is handled by an early_param() in
>>  drivers/tty/serial/earlycon.c and by __setup() in
>>  kernel/printk/printk.c.
>>=20
>> I agree that duplicate parsing should be used carefully, but these
>> handlers would not be competing to own the same state. The generic =
HVO
>> code does not need to expose its internal policy state solely for =
arm64
>> capability detection. Arm64 only needs a local snapshot of whether =
HVO
>> was requested at boot in order to decide whether the BBM-through-AF =
CPU
>> capability is needed.
>=20
> How HVO is requested could change in the future, right? Like if a new
> command line option is added, for example. I (strongly) feel like it's

I don't think so. The command line is part of the user interface, and it
doesn't change over time. Ever since HVO was introduced five years ago,
it has remained unchanged.

> better to provide arm64 a way to properly determine if HVO has been
> requested, rather than parsing the "hugetlb_free_vmemmap" option
> itself and trying to keep mm and arm64's parsing logic in sync. Even

Sync? They don't need to sync with each other. For ARM64, it only needs
to know one thing: whether HVO was enabled by the user at system =
startup.
And the only way for the user to enable it is via the command line, =
which
cannot change along with the code. Command line is the only source of =
truth.

> today, although the parsing logic is simple, duplicating is really not
> ideal.
>=20
> I feel like Will and Catalin will be opposed to having
> `early_param(hugetlb_free_vmemmap)` in arm64 code, too.

If that's really the case, how do they view "kfence.sample_interval"?

>=20
> Also, doing it this way, if an invalid value is set, we would see
> "Malformed early option" twice instead of just once.

Yeah, but it is not a common situation, nor is it a major issue.

>=20
> So let's just add that helper to expose whether or not HVO was
> requested; I don't see anything wrong with that. Do you agree with
> that?

I'm not convinced we need a separate helper for this. A helper typically
reflects runtime state, whereas arm64 only cares about the initial
boot-time configuration. That is literally what the command line is =
for=E2=80=94it
already acts as that source of truth, just requiring a simple parse.

Thanks,
Muchun

>=20
>=20
>>=20
>>=20
>>>=20
>>> It would be much easier just to rename
>>> hugetlb_vmemmap_optimize_enabled() to
>>> hugetlb_vmemmap_optimize_requested() and properly document what it
>>> returns. Does that sound good to you?
>>>=20
>>> [1] =
https://lore.kernel.org/linux-mm/CADrL8HUgo0zAHe7_eF1+hfTR6jBbZ=3DUKB1qPpM=
WpksvqbNHsyw@mail.gmail.com/
>>=20
>>=20

