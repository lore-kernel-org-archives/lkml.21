Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195849;
	b=GRJE+7E/vk09pZlhZUT0FyculNibkA+g/N82wQYays0I4M8G1kqyxsJsxPL4nBhhFJVc
	 KX4VW5VSzGyjvD2Z4xGZSqkuHFyy/coxxkhp7/9lv5wcC9dIwNFeVihbNrsNBN0w/6+7b
	 RD8Tt7O0VSnIaD0DW0fajk/HOHziM9d5d+qHDC+xKfbbB8wzJI9RJMwf3hBkurpqPGyx+
	 L6gCUUIaK1sypNL3+EeVImcaT5nQSm5KxR6/Ghv2k7DI/QlDqJCorb4oUX7haTGO4gGcF
	 LWrAodhTKTYpYREqragg2jku+io0o5QSsVkMiuKehoFwSltaKV/GuKoWZiY67yoInuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YNjONpgW3BzEnvATPOG31tZu3+6J6bJ+/wDP0A0YD9o=;
	b=lDOSmD/GH8ywhpbf2J++MQzoJ8o1eYSmiP33lD3SMAKssXhRBB4CcsNR7+AltDndUAji
	 FnkwmaoOb5OLuT+GL+0NL67MoI7z/Ef2Xg6EeD7JrlfvxxALsi8959S1aIvDevqKbvqvl
	 cbG2NEaCLRbOcv7XKW0+i3X5iEWnwI7KBK921WYnoaEZBhV48UtRD2No7tyCXcHi8+5sS
	 tYonwQrf0HE36O/Mgxi6baTNtrUDuTI7wqCjfoCWrrSYRjnTI0Uf799sW7yFTedjTvDPK
	 NGCW14k1yPcShTMWaSPkIO9OELdDCpOtKIXHrjVhaPBYEvg9DBi7RSqX5uZ1wgjJvWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="KfLmI/9A";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B956606A333
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B956606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KfLmI/9A
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-55be673e029so306561cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:30:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795195842; cv=none;
        d=google.com; s=arc-20260327;
        b=h7QHvM3WulDElFIXU8RimQ1gh+ZtgLHrRLOzm5Us6kxBOU7CI45tUuRsn0hI7r5hkB
         c0n2jGzo+G2cbIN6gArJy2h7RHMEOUsi5FaZGppYEW22DhyTfBCEa+hJlnT00SA4Mlfb
         jlezFhy9yA8Bhf+vL2KaguPNeJriqq+ootWcVj1NDc8aJkb6sENqqz9FICtCYIhs3s0N
         XUMNYF6uXDjbIHEa06SeNDB0J71joS1ipgsG9JYsVMZibxEPs0VLXswMmfgiJVlGV5mA
         hzLo49Pg/4oRO23hJ9MHuaYDRNn8TqYpmdDB79XoMO19oI2vjqyeF3hwTFJpxWWl8Jvf
         j8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YNjONpgW3BzEnvATPOG31tZu3+6J6bJ+/wDP0A0YD9o=;
        fh=rACNXPoC+U6AVgt/D7dZhoP6Huze8GchSsI+ChwoK7o=;
        b=gfb0KaFt7Vl6GHHwmIPsVS47+D1st11+2EvcdR4mA5KvgYAffDvUW4jqCcPm67OFfp
         8e1LBgVY/aMP8k7E5NjDPoS9ZArbpY2TgPJiY5MW0bjim+Yl3IARqKTFeCU1gTiIZnLr
         OPe/r0DQx48MNCLqhsIW+rJ6UPp1LrPU3i06/Ws/LBTrAgmkODkbqolbySPyeTnT73mi
         pMJDkY9yxnYX9SNdyS/bMxp70gVxOgvxHwYzlMh2mBCOcfKQCjzNqzvJrVMQwjahtVjm
         QV1oGnwHKS4E+K2XA2a1iElaWEi0VgNLIUPIJ+Yl6P01qQY1KAOOtuuXgkBSsonC3dyK
         QQAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795195842; x=1795800642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YNjONpgW3BzEnvATPOG31tZu3+6J6bJ+/wDP0A0YD9o=;
        b=KfLmI/9A3sRR5kmyOxDxunGQ9r5NNyUu4pJ4Z0hUMJltuaA2Tu2iKSlIv3HEJsyLJe
         5EZwQijxmoIGMSuvcMbrxRvnSaKRDlR27y/G2fpY8eksg/wBmlWFLcZWtCNfNI5vb7zh
         rE/e0nrcspVaxYa6J0ahiQ7b+oSa77EBYSrEH6Jr2dQbSntlMWle6FsYx3BzVAa39jsy
         fNV1EupEi4+Utk0QDqhMG0bLuKMZx43sx3PgKaS365Qt5VsMD9K2CAbD6D/RYbrjTbAc
         197t5HYUnsHBbPGjaUiZw33PM3pPtPGOnOrq9jfkZ4tyNyOda3NCKj9pBE1xVgOR8giL
         HGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195842; x=1795800642;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YNjONpgW3BzEnvATPOG31tZu3+6J6bJ+/wDP0A0YD9o=;
        b=xSmb8bFve8i2A0cllfNHBtwjFuAuzHX+6wfmVwhhcY5/cQoQ7qvh5bl4ciF62XFwN5
         zaCZLM3Ho+CCNn51Z16LDhhZ5UG4qni+CF70uUrzHKTewGQlSbPn+SBVwQZfckU4id0U
         rzttVLfofASpVp6v4PjLnic53zVEXrLbDbof5Vd7jyIdSXDoPvPkme9ZZH7o2Acllxww
         eTlSWfBV56vA8K1YxftDyXSQ5HACTaklyNYdCOFkzD2KSq0OGQH0rwtFgo1TRcrIyH2G
         nDMFQHiauwztQWbNpObtU1YofFQa13uct7CBdg0kKIxvImRaE57VyVGMt7bjkhUStxyf
         vDMg==
X-Forwarded-Encrypted: i=1; AL+hErHQ7PBDHB+rVPPuAR0dyPhwfmIut6b03ZfmgzgFc0Gba8dvNwCNxBpyeyKVrvbaZfVERv4iMGEXJOQ5JJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2B2suZBS2jpEfCQkOvLySz2en0Ca9DIy0gHONrsoGWdCOPfsJ
	uuZGttaeEDsvkSGq4yI1HLWH+E3fBi1K2RicOOsoXgZXaMwAkz1aAW1rktnH4Q7ffD1R8xd+yMM
	uYn4JXhLqh8CvyIGHbSGv7coB2gd0v9S3L2aqs/Zd
X-Gm-Gg: AZFdTZc5AEj+qhG/DH5SX3+45Pw37FPCxEJFGZqfvdNIPdCc0BNBavFDc+Ld+GFg05f
	Vo9wnlXNced7mo4foI56m6fELskQeBZNPQLowvQirHIHvLYoJZF7uO4ylp2bIbpKRajDow4sMv9
	Htbiwnf9H0LhrbZyv0BxnmkclsYyUsjVaj1KSuwusrmr4fYBrECzg+zapqb1BJi8aP8fix0cMp+
	6PnXlzQd5/KJ9+dTTb7VRnMkFTifaaoEC4RL6yttwPb7uDKWmnQfhaqjBdOb/qvRrOpanYUkzG4
	e5VZFTzDbLadDizbotLNvwpRFft1tFveRx99vt2VNZqNPsGN4mjcMhbhDTXquT6hj3l4p6IcVnW
	3tB461RjA1LFL+ZdAYVZxcLYeKEpcqaqO7SuW
X-Received: by 2002:ac8:6102:0:b0:546:92f2:7830 with SMTP id
 d75a77b69052e-55d7914f377mr24269751cf.6.1795195841498; Fri, 20 Nov 2026
 09:30:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795106955.git.irogers@google.com> <e8d983aa6f81be52ea1bb9afc9c0f47d4632c1db.1795106955.git.irogers@google.com>
 <5fb8ce65-923e-4714-946d-ecaa4ecad399@amd.com>
In-Reply-To: <5fb8ce65-923e-4714-946d-ecaa4ecad399@amd.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:30:30 -0800
X-Gm-Features: Aa3M54oXyhu70SenU9J6OYKtnIDShLY5qmJ7ZZxuUaXwxMEM1-bkb09kjVtb0h8
Message-ID: <CAP-5=fWBN0=KCJcF52-1MrAQjXZBgyZ286_qQtfjN0JzDASFng@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: initialize r in amdgpu_vm_bo_update()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 4:08=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> On 11/19/26 18:07, Ian Rogers wrote:
> > Commit bc566781845b ("drm/amdgpu: stop syncing PRT map operations") add=
ed
> > an 'else if (!bo)' branch in amdgpu_vm_bo_update() that does not assign
> > 'r'. Because fpriv->prt_va has bo =3D=3D NULL and is updated on every c=
ommand
> > submission, userqueue validation, and KFD VM restore, calling
> > amdgpu_vm_bo_update(adev, fpriv->prt_va, false) when bo_va->invalids is
> > empty skips the mapping loop and returns uninitialized stack variable '=
r'.
> >
> > Initialize 'r' to 0.
> >
> > Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
> > -Wconditional-uninitialized enabled; fix and changelog drafted with an =
AI
> > coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
> > -Wconditional-uninitialized; not runtime-tested on AMD GPU hardware.
> >
> > Fixes: bc566781845b ("drm/amdgpu: stop syncing PRT map operations")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vm.c
> > index 82b9b2d5d0cf..091589b2c524 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > @@ -1303,7 +1303,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *ade=
v, struct amdgpu_bo_va *bo_va,
> >       uint64_t vram_base;
> >       uint64_t flags;
> >       bool uncached;
> > -     int r;
> > +     int r =3D 0;
>
> Good catch, but please don't initialize return variables a default value.
>
> That is often seen as bad coding style and often hides problems instead o=
f fixing them.
>
> Instead just initialize r in the if branch where it is missing.

Makes sense - keeping 'int r;' uninitialized at declaration avoids
masking future missing-assignment paths. I'll set 'r =3D 0;' inside the
'else if (!bo)' branch in v2.

Thanks,
Ian

> Thanks,
> Christian.
>
> >
> >       amdgpu_sync_create(&sync);
> >       if (clear) {
>
