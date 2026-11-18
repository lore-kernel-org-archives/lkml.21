Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795030273;
	b=tRjo/Ft+JSNN5xTuZR/uenbnM2nXPhLY4qLTarNaX7TiVk2zVaxdNSQ/8h6S5FZujD9H
	 LZSzIynbjZzskg9XnOptSTvgJuQGDx/200MR/fBLRD1EvxD6CylNMm1KkSMmVIKvfh4da
	 u2cVTb/c9N1S6TZ17NGHX1FE9MnF3/1iIRZ6Dq6M4duQQFMwCUp90p/8axWmVpGRgELCo
	 JThLsCNmmz3SdaXM5P3HlrQecjCwGY9hpM1gH155h7LJr2bIxdc8llvGmM0b/ntW05QLD
	 8A7hC1MhlPgV5VCgceF24P36sbX8578uBM+YyZPOMmmlYXinkLz6OCeYRChITDqNpzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795030273;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EDD37NjjvJNIfpw9KAFA+jcN9aRZtu7RwLQr1pxz0OI=;
	b=Dks+E0FoYHXDKLq4elPpZU64Rb+Ry/Od9iutQ36ykM7f7APv3WRKmQUpd+m65I4ux+ux
	 M/bSOUkKeOp2fRQ/romtLoyBwDRrEAA64VGOGzBoMZ8ITC9f2WGSZne+NJ3ktcwcM8d8W
	 97J/O1Jsw3+qQcCgFN7WqDRbdOw9/dA+BH4yQ2hfja1K0jMgLHZm2UMz8jprpYtQDoe0T
	 lroYJdC19N+wjImn1/R6gfvTyTHm+9dw9Sv3/1qonPqtXN+gyp7oDZpLfVlM4rfkZBUNS
	 RSjhnIaaPnuRTLZ63tyfzNaxAUiXX72rD6VzgAbo0oST9RYAGpkEclpB1xIxgHwBT7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zo6mxFGv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2E9606E7C8
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zo6mxFGv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A2B1F000C9
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795030273;
	bh=EDD37NjjvJNIfpw9KAFA+jcN9aRZtu7RwLQr1pxz0OI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Zo6mxFGv92To40pzc4PkJphlPw0S8B+GnmH04f6BAnRRa8VVDehu9hnrJsDD/f53P
	 pFRTiHnx7yN1t69bvPTAd66+YXOTT0XQWWIk+U0BWaLl/plvwuWYHlUEaxbZKtKXg8
	 snJ8iXco3PlIh4OjvxGcgHJwpeYM+d/K+e0yOD7C7PIVzk4v3XDF8qnCkvV3bC0rzY
	 b8Gx9jcCrHqCL+h1APsvgwf2KE1ADBIfTOoJ9tUEZOqwt+HfmVlrCRuuP5kTR1/iZ/
	 8uKjUyJvqNv3XvMBXNolr0oKnsNXjx44l5Rp6tAdqo+9CZGFHPRI4AMzIAqIrb2I1Z
	 AGDBSJ2wP2wGA==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so211599966b.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:31:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE4aEggDjrL7Ep3mHTTPKqeB480PhwYBugSE8P62vy0qEgcdYy5m5z9UTaSA9BAVZgeguAVdqu1s3CKVmo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YVS1S+/xnqA4vIZRGfYFX89eATgVgdveinJHUxMjKJzng4O5n
	Nxk1vUqqZ1o+rDdr3amyMcU7XJMb9iqP6d6kVP0HiB8P6m5k28ah8LoOn5zbB4S6BRHiGj6Oxpk
	aQnrZp/VkSbV74kGFfJ9wwcm4Q8B1Fhg=
X-Received: by 2002:a17:906:19c2:b0:c51:24eb:4de9 with SMTP id
 a640c23a62f3a-c5124eb550emr56887566b.34.1795030272192; Wed, 18 Nov 2026
 11:31:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112203227.289379-1-zide.chen@intel.com> <20261112203227.289379-16-zide.chen@intel.com>
 <av3O9YqD6iW4UT9c@google.com> <bf360695-18f4-4fa1-8030-6df2471dae60@intel.com>
In-Reply-To: <bf360695-18f4-4fa1-8030-6df2471dae60@intel.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 18 Nov 2026 11:30:59 -0800
X-Gmail-Original-Message-ID: <CAO9r8zMXda60R7OrE87k7x-LJpAR14o34aUJL3CVNST-JW-84g@mail.gmail.com>
X-Gm-Features: AclHuK9q5YNaR422g13fk9iinqVwmj-uwtSYeCa7KEEQi75iphAK3gLDpm-B2ws
Message-ID: <CAO9r8zMXda60R7OrE87k7x-LJpAR14o34aUJL3CVNST-JW-84g@mail.gmail.com>
Subject: Re: [PATCH v4 15/21] KVM: x86/pmu: Clamp pmu->version to kvm_pmu_cap.version
To: "Chen, Zide" <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Shukla Manali <Manali.Shukla@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 11:19=E2=80=AFAM Chen, Zide <zide.chen@intel.com> w=
rote:
>
>
>
> On 11/18/2026 10:17 AM, Yosry Ahmed wrote:
> >> diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel=
.c
> >> index 5eac64ba8832..0be9956810ae 100644
> >> --- a/arch/x86/kvm/vmx/pmu_intel.c
> >> +++ b/arch/x86/kvm/vmx/pmu_intel.c
> >> @@ -574,7 +574,7 @@ static void intel_pmu_refresh(struct kvm_vcpu *vcp=
u)
> >>      eax.full =3D entry->eax;
> >>      edx.full =3D entry->edx;
> >>
> >> -    pmu->version =3D eax.split.version_id;
> >> +    pmu->version =3D min_t(int, eax.split.version_id, kvm_pmu_cap.ver=
sion);
> >
> > Why not AMD too?
>
> On AMD, seems pmu->version is already constrained to kvm_pmu_cap.version:
>
> 1. When vPMU is enabled, AMD has no CPUID version field. KVM sets
> version to 1, or 2 if guest_cpu_cap_has(PERFMON_V2). Userspace cannot
> force version 2 on a v1 host because svm_set_cpu_caps() clears
> PERFMON_V2 from kvm_cpu_caps whenever kvm_pmu_cap.version !=3D 2.
>
> 2. When vPMU is disabled, kvm_pmu_refresh() sets pmu->version =3D 0 and
> returns before vendor refresh() is called (!vcpu->kvm->arch.enable_pmu).

I see, makes sense. Thanks.
