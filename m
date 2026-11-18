Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794977071;
	b=QJXTn2fOi0PLauIxWcFanPH9iFjCFJrJ5Il2kW2tZwnWS9IsLu3chUNM1am6f0WFGFb4
	 YHTYztPJ4TiP8TUSY76RtbU/2xEdPhr6WnFodnfCprjBS0JjQa5dqxs2OJBqfah5gDEOr
	 Pp3IW9JW8u0qaYJFNcIY2YSlgtwUNv+ch607YaX7pfHN/NcIe/4VDp3jK0IG75fr7jcpt
	 hjvQvpiK0UVvu6bdV66+YZutFB/SVyynL4Ww92lVKKfd8LEQhYByO8BNhCHSp3eReBT1X
	 LiSTlrahbPasb9N17/7TahsAG4WwlInJT3j1PWwhlF7zT1xlC20f89tEwV6BMV9TJAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794977071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GzlnWTqopo0YjHkcJsTJjoTbB9TRUt21018gFM8sivI=;
	b=N+J/EJ+3vFjr2gJtqr0GiBD/33v70jieqFoDiMlVDWN+1jCECCkvSs1rBaxhbmBBk2PG
	 ZfvECZvU4edhumet/lhIAMOYAADyprQTT60Mww85SsljCfs4BRFmLuFFefAhBlx+a/6X0
	 Cu5d9nA08iaEaxYdvnzhc8cX7X4B9DjorzsHQ9hOdJ8Jtx0qV12akYRlAjlHzZ0VthVXn
	 mICuM4O9CVjrUrwv0qkwR8thwuhyuxKOKLqqk0eN3QNzsJI6RMV2c9k1IMqI7OAHxExZr
	 mVK4mniKtu1oBRzC0Qv5dD3yXVuFS/17ZvC3YPYHH4vdaJtHXvjkJnCiIO93Hx49LUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z1k7wM3h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686D5606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 686D5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z1k7wM3h
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso8392a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:44:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794977070; cv=none;
        d=google.com; s=arc-20260327;
        b=koczuC7sRjDU0ztVLw3KSDXFrmo5A9pwfFwWCtmsPKQTb5FU4FHSiyt7OqGOMEnk9w
         psunTbqnTXhPykDS7AWX0JfBmr5QbpzE1axSrXKQqIcDzR1qxaq1HdSmS+5nPaY6jKxr
         TpHXHid9Ksg4XE4866FrA5sIqfBnLfVmFEmGwApQq3Abe6Ng1ynYI5uMkZkbVFelhLPb
         0T3rQHNLGrxVNbCDYrjH/G6kDWeYfU779k7AUYDz0tXWgSuFXhKqbLQ1VsAbfv5D9wxl
         U0oyoY4DxS2imJvPMZYuihUc0lawPkbpmXu3bWUp8h/0V5+awu1/zPmyz4/dmJgcsi2I
         O6dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GzlnWTqopo0YjHkcJsTJjoTbB9TRUt21018gFM8sivI=;
        fh=8e5/K2M7Zds5U1o92Vs6dYO96fc7dTxZsko5j+XvP5s=;
        b=ke6NEC7PqBVbJaZdlPYHiMSo/Uu1IYFtg1enPNPEebyigOxPmIPvJVPI7rm3x4x3fh
         f9R2Kr4IxJtJvlaq/yZSE9oqcNS5k4YJ/Hc7KGUQNwKK8k4PDmsS1TlrTock0xi3+J8H
         XIs04odMPM661QQPDtHa7Hnprif/CiEJ/XCxFYvvhvGMrjFS/6fWFF4J7RH0z6iIUQm2
         jL8go9xTqkL7+2QA/h1GTEvTHBOmJEN851LX6WskI6pwfDFwqRJg9xZ9xoXrH0FLk7cr
         /D3s/bLuyvlJ3HU26BTsuqAdpyIuXQTXtyh+T2G+vXm/ULB656XzmaU8Nc6xHliLjdcn
         J0vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794977070; x=1795581870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GzlnWTqopo0YjHkcJsTJjoTbB9TRUt21018gFM8sivI=;
        b=Z1k7wM3hcC2iJciHoW5EDy+//u32xGh36TPLHviEPkB/EOUTOb5uE8daZD7FTOsgQ/
         SvRx3cNhPj+VaX56UkhF8MSctdumBIhexhRR/NKaIdOurhcaNxKy7DCYTKEq3xJ0pgbz
         isCOduvCSei0td9iN7vEcshYJGbz6yblxFM6KzU/vy31/1M4wMSnGcPVH+LiASsFvEEt
         xnKojiBxsXuCBdK0MWJ7tQOCfYGPv5R4hB/fCWOOjPHJDt/8KIO8D2PxAYw1LK3hab1i
         FQVV+mcntRhG+AZP3I4j4gEmZYm/sbWqoou6kFdIhmwis2/FT4UMjk+VeQneJDpRYctA
         W8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794977070; x=1795581870;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GzlnWTqopo0YjHkcJsTJjoTbB9TRUt21018gFM8sivI=;
        b=HvFXaknwVOH2uef6cK5JNG5CPjl9kyRcBZImD6ff17n6y8i0iNCfuu+/jEFWC1pf8M
         fy5yAhif3UA3UkUwgy5vhLtbNp/19F/FURjpW7lgPWMGYYzqfofrO2g3uQQv3Fq4sM5V
         MzYyiHgMN4Q72n0r8ziL9mW3EUymazvyzFiIqeNCHf8HIQvOa2a1Q5HXnXBBna4O/O6b
         PjDJPfDbXrg/G7UryJKdFdcFHEp1yGzbteBmkX5IKRbMjX8g2zrg4vuB+q9s+91J2a+1
         nNeMLcdQKTJhJeR0411TG5xc5vEZBCkhHx2pa+azta6o4pqDVCNFWPV51q5HKDWD2fvm
         n7UA==
X-Forwarded-Encrypted: i=1; AL+hErFKimJS7/u0ak/36JMu8SBJ45p2A761Z3BAko6KEBEdDKjHWtsMjHNeKpeM6/drg4nhHy4bPbTZ084DXEo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bVzL/R17dN8z2xsGhSkHQyHKDH4fKRhruv/nem5i4uYCVswM3
	vYsiyDKMFCqyS84dYcKwSSr6L34ZcX2tHZDl8p41CvpXU998okRWzWOhK0mAsxRPn49KSZnzb3f
	hE6fGNIBwFeitokDXMGpppsAiGIF2KtRWmn+0hiLzolsNdJUYMKVg7chCAxY=
X-Gm-Gg: AYBFou3tPwNahme/xzinJ8V3ZOOukc28jINnmcd+9pr/eic+JV4g3NlCJWrkrwLLLVS
	GcmlK350zunGhZ8SdinySsEfZLNafO9i5ta5S5PXoeKv+BaLDnnmqEQrxEMaUUgdkx7LQqVQn1j
	/P0z1nFxROUstff/P478A8Da1WRjgLWt/Vx3cV3yysvpj9Hgjw4OhQTXj7jmR6Nnry5VoE/zYd5
	cdrn5WTbqdWD5EbFvohr1Ob/KIbk4o73NMVEkDAk6rm2nR7lFEgAygb2QVRjLfrWdePUYclUFqs
	Ww4pnPUGlhFJISkH2wTo7AK4wcWHnB6cUUcwpmkBDEfvOym9ZTdoTa1D3ZrL5DLVADjK5ay9fsD
	sZx11vIJ2cgZBfdBPn6926hTeTW1x5bTGhWGM3r/ouPOxG9/9oUv6B0UVkOJwVo46JHex+CuWXk
	wE8IPTwOidTLwZN31bgLCHHSMFFtXOGKItN2EOoDBjd9aLQzF+207PwQ==
X-Received: by 2002:aa7:ccd7:0:b0:6b1:c3f3:225 with SMTP id
 4fb4d7f45d1cf-6b887def50amr58912a12.0.1794977069248; Tue, 17 Nov 2026
 20:44:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117180310.921701-1-chang.seok.bae@intel.com> <20261117180310.921701-4-chang.seok.bae@intel.com>
In-Reply-To: <20261117180310.921701-4-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 17 Nov 2026 20:44:16 -0800
X-Gm-Features: AclHuK-IG2kb2mtcYBmniiP12M7N304vzxkSKy-lkbeN3KazwLBW1Z1U6rCc830
Message-ID: <CALMp9eRtQ4FLf5YTwwwpLAamH866KBmbVpGa81A-A-R2vdq4kA@mail.gmail.com>
Subject: Re: [PATCH v9 03/20] KVM: x86: Support EGPRs on VCPU RESET/INIT events
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: seanjc@google.com, pbonzini@redhat.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 10:31=E2=80=AFAM Chang S. Bae <chang.seok.bae@intel=
.com> wrote:
>
> EGPRs are not zeroed on CPU INIT. Handle each register based on index to
> support this EGPR behavior while preserving the existing behavior for
> legacy GPRs.
>
> Refactor the rest of GPR handling together as the reset comment mentions =
it.
>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> ---
> V8 -> V9: New patch (Jim Mattson)
> ---
>  arch/x86/kvm/x86.c | 40 ++++++++++++++++++++++++++--------------
>  1 file changed, 26 insertions(+), 14 deletions(-)
>
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 2cd9ee316aad..73bb1d25931c 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -9601,9 +9601,33 @@ static void kvm_xstate_reset(struct kvm_vcpu *vcpu=
, bool init_event)
>                 kvm_load_guest_fpu(vcpu);
>  }
>
> -void kvm_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event)
> +static void kvm_vcpu_regs_reset(struct kvm_vcpu *vcpu, bool init_event)
>  {
>         struct kvm_cpuid_entry2 *cpuid_0x1;
> +       int idx;
> +
> +       /*
> +        * All legacy GPRs except RDX (handled below) are zeroed on RESET=
/INIT.
> +        * EGPRs (R16-R31), however, retain their values on INIT.
> +        */
> +       for (idx =3D VCPU_REGS_RAX; idx < NR_VCPU_GENERAL_PURPOSE_REGS; i=
dx++)
> +               vcpu->arch.regs[idx] =3D idx > 15 && init_event ? vcpu->a=
rch.regs[idx] : 0;

Nit: I'd rather not see a bare 15 here, though I realize that
VCPU_REGS_R16 doesn't exist when CONFIG_KVM_APX=3Dn. Perhaps define the
number of legacy GPRs in kvm_host.h:

        #ifdef CONFIG_X86_64
        #define NR_VCPU_LEGACY_GPRS     (VCPU_REGS_R15 + 1)
        #else
        #define NR_VCPU_LEGACY_GPRS     (VCPU_REGS_RDI + 1)
        #endif

and then this becomes:

        /*
         * All legacy GPRs except RDX (handled below) are zeroed on
         * RESET/INIT. EGPRs (R16-R31) are zeroed on RESET, but are
         * unchanged on INIT.
         */
        memset(vcpu->arch.regs, 0,
               init_event ? NR_VCPU_LEGACY_GPRS * sizeof(vcpu->arch.regs[0]=
) :
                            sizeof(vcpu->arch.regs));

With that change,

Reviewed-by: Jim Mattson <jmattson@google.com>
