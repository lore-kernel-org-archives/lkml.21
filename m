Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195897;
	b=q6BxDdw0+gESzrGZl6Mb6mNHMBLbsDhqZnlopkit9jMSTKW26kiynWGy77ZXO8t8pX54
	 N0MnKp5tJjtNAcIw0tDArHYG3AEvV0fKwGXheXfT03DPmWiCy8CNXuWdy781vBuZ50c50
	 rDq9qIq8sPYK1ERuBeH2W2h+2aRNy+pd+BNVYhHbhkWxUcv2CnzzfTctpMnD/aEESUvoT
	 jAYonB18AonoM16mEBmR2HivbnLPMb069gGoRwKggxw0IRA7K021ufQ/tNUYfF8AfumxC
	 +ZJ8+RI4E4Y4kZD6MrYv6fUBDe2ZzrwPg6b1WYRZmS1Lo8Ry8GaDqi7wTescCUQdabA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TI7DZVXU6YK/vkfYgR8KztTLGwad0zi129B1pm8/11Q=;
	b=bMpUsnYPdQBporA3pNs8+uecd6PZW1kileLLuEPN4l6SMbdTHZiQixeu7/7CNdi7KZee
	 yYF2TxG6BXq+eD32Movcpu9KbaOfCFh0gihBCiqCXE7N+xKXnxOWMVE5kcDKGALiyHqgB
	 +iqm69IUFUWK06E5+/ExFiYkRCFlil9hdt3/zzLf2+gJZtILBsjJfJ2WG8CQUfOyHGpxk
	 IocmeDfedNfAVg+AvMw4PeD+9SoirNH3oHqXGukTyzsWS/7n+3PGqt1wB5u2+rVIxuCT6
	 6jpANGhJuclvepN6knKkQHyEvlBJ+RWsKI19ee221auG1po/BNyhtKpGOsHP0SIeK1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ak2bScaW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DAE606A334
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5DAE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ak2bScaW
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-55be673e029so306881cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:31:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795195896; cv=none;
        d=google.com; s=arc-20260327;
        b=P7ZAzCtsm+2MALlZxkxcDI+P9NIdPsHxnPRBbLTYaq7Olgxpt09B+tk4sVRdLTnwPW
         Qwr1lYfOAtK/akUM1PcFKw3sbDkomOfrjIuVV8Ft3zSrXOLOMR6JQAIWRIpGIQm7e57r
         nWVW46t19tfagdF6fBNORUf+6wta5NabPld6ciTq4XWT1/7n5vk5YuTxR/3lHITu8vpv
         xbWenhJb3/saLfnuY1r5YF2fOo7c0WRwKVxFvUdZil7GiM8u9o6LDe0JqtNQ3ihZUxJA
         xz6Z3OX7EKTlxInqcQeUY3TW5eh9c6BadE1v90KzM9IWv8bCiGuJQPB24aH3YvuVz1PP
         q1ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TI7DZVXU6YK/vkfYgR8KztTLGwad0zi129B1pm8/11Q=;
        fh=1kLi2YkpEEjjjs3Tp2YYJFOhtDlrpy2/CAS+bNXM/F4=;
        b=MUanhSJQ4w6s2x45Dyio/KlaEfliACjeGPRK1szRIOITpasKVfZjsiy5L0x2tJDreE
         eXzxdPSDqgv9PNdW6mVcvfzgErhjKHxAOvjcmlYgL5Usvs04pC4tukBXrkjcaNqErmJw
         D5aEVSQOBL22/ZJDJUA55R8AlNfC3JZxIpofZDTTpwpjr9pvLPTjNaAvLTNty6LgXpKp
         3SVRxQ6TV6l/FhRnWpf4fjJ6GaluRyB9iJx1uJWcrRhLFKatlp7uPtptTP2Mm+FLOGea
         VHSTDA82VQer4QzR5RfN2wAg8YR6aCYfwt/Q6idYShWiFeGGd40X9635VQXd608Gd93W
         PChw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795195896; x=1795800696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TI7DZVXU6YK/vkfYgR8KztTLGwad0zi129B1pm8/11Q=;
        b=Ak2bScaW6vSX2LPooTF9xOJxipWuDqeJY+5z6Fm3/XnGHm+hcCcUn1ya0lMqJ8eZNO
         2Sy/BqBLyjk2loT5tU+RCsvAD6UOSKuYV8+GbvmPMYbxq+hqiOncqq2q62Cz1dND6FVk
         lz3g0G40G9MdjrGAsY96eeRz0jZeIgcz66Rxa4TYjOfRk3dPsTWDuPJyk3GvNDkRgqXJ
         hcKk+CDLGQSb6AEmlCKSfhjt1RhxNkq5kvoFqVUIZdU3MxN7Un+w56Vz/M/LthMzryLH
         SzbRr24Go5EuaX+h9ao03wgr0CdFr/pfTjNtUdLsZWJj/tp4VICYKd0Atx8vf8piQra0
         4iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195896; x=1795800696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TI7DZVXU6YK/vkfYgR8KztTLGwad0zi129B1pm8/11Q=;
        b=Z7egOckvBIZcLAND+nHRFSSD+5Of+anIqZFKsbImvKrK+tJWjO+/VJXxLCt3pAs7+X
         mk6wzViHVzdtJxZj93zgpW5yE6/F7A8RFIJIHZ7wNn/47ihQvR3EmC2YFKYNCLAFtiSB
         kMpE/4A6VyaaHR9KX/WmC8TdjN2YpixPINE4B30pvV9OSAI6IZAdPbxRFlbt2E5aSept
         gf4D4LYjEIyFbsI9xRtCMWiMBvODl7RxqwsmapQw4xR+St4ZNbRXg2UP+Wd6CFH7tIi8
         peonqFehWVbTMDsn5gf+0iBSGk4+DBCIyCIWrnrkTYJVfqYFvF1c1Qr7HwmDQ/L2KHRZ
         IfbA==
X-Forwarded-Encrypted: i=1; AL+hErFZmk7qhHY0QviUQD8vnB6UyU/C8P4+xQCxOU5/AwueC/IXYWzCNGMd9cII4RfAsAzUcdCiGLqRDB2IAQQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hrzlaywRP3Vzgnso8rplIuz7eEYWT2//uWNniUz3Xj6jd1vU5
	GRE01qA42HTkWhSEjwh4og3NgB9kLYDUjJoHq00U+Sa6eLhik5LyQgsURvIxFY9qYfQXR4OwOr5
	5o1zAAIRrR93S//l4D5JOprObsxdl7knVKM31qchv
X-Gm-Gg: AZFdTZeHqlZatPNkdQJZWjkHP/f6+y+aJcBFcxtIRNWfpQVtQObQNlXYs/SL447Uans
	xdGZV4BUulJg31qNtCQpCKJkWKxD+3iUD3ddgcYEpe4wEvQziZSqWvVB5CXAdJv/5Fhco1GCwuf
	RttkZLEqEXNJ2b4m6DDK0TGIbL6S2pfqHLJAMG1hKM4ynt0I8REPjyMkCEM9Chy8ZKWSkOaOoKS
	waMaKEYd5FnpfkVCYXVCjjx19sL+/9N96c1HSv09qxK50pmDMfru7GNZXRz1CgBcsw3tJBwN6uf
	FhyeIMBPpbwsKfYfwM3nZYsAeuoEcGpXACv9eM4fY0SrTQnHv2IQ/rtRV0/ov0siIU+8TdRF0V2
	UOEJe+US+dbqRECuz3TZ1O6qmFcabJG9B+oeT
X-Received: by 2002:ac8:6102:0:b0:546:92f2:7830 with SMTP id
 d75a77b69052e-55d7914f377mr24289241cf.6.1795195895205; Fri, 20 Nov 2026
 09:31:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795106955.git.irogers@google.com> <6fcb1e5c7545f8bcfee9ac9a3abd296c475aa1b7.1795106955.git.irogers@google.com>
 <dc491d12-68f0-4297-acda-f122fec00288@amd.com>
In-Reply-To: <dc491d12-68f0-4297-acda-f122fec00288@amd.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:31:24 -0800
X-Gm-Features: Aa3M54pYUkUhv-1L_RAm3wzkZJVptY38X_B1tSpjk2kKiiLF52OLhk9KXrZQJlk
Message-ID: <CAP-5=fWN3zHAtixPSbaNwXn9WWTcxd1+XJO6uUb-S-FgNzrUtg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: initialize r in amdgpu_ttm_clear_buffer()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 4:12=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> On 11/19/26 18:07, Ian Rogers wrote:
> > In amdgpu_ttm_clear_buffer(), 'r' is declared uninitialized. When
> > consider_clear_status is true (such as AMDGPU_GEM_CREATE_VRAM_CLEARED
> > allocations) and all backing buddy blocks already have DRM_BUDDY_CLEARE=
D
> > set, every iteration of the cursor loop hits 'continue' without assigni=
ng
> > 'r', returning uninitialized stack memory to amdgpu_bo_create().
> >
> > Initialize 'r' to 0.
> >
> > Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
> > -Wconditional-uninitialized enabled; fix and changelog drafted with an =
AI
> > coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
> > -Wconditional-uninitialized; not runtime-tested on AMD GPU hardware.
> >
> > Fixes: 23bd7e67961e ("drm/amdgpu: get rid of amdgpu_ttm_clear_buffer")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.c
> > index 0f86777250fc..280fcdfb9cca 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > @@ -2675,7 +2675,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_ttm_buf=
fer_entity *entity,
> >       struct dma_fence *fence =3D NULL;
> >       struct amdgpu_res_cursor dst;
> >       bool vm_needs_flush =3D false;
> > -     int r;
> > +     int r =3D 0;
>
> Please initialize r directly before the error label, apart from that look=
s good to me.

Will do - I'll move 'r =3D 0;' to right after the while loop directly
before the 'error:' label in v2.

Thanks,
Ian

> Regards,
> Christian.
>
> >
> >       if (!entity)
> >               return -EINVAL;
>
