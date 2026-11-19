Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795067159;
	b=VZGUu5UKWpSi39c3KJpHQID2iN42VPgTG7DQ7OmysU6shekgFLpmEK6qG7P5hOxG+Fn/
	 RgnBM+QJdkby9m+5H7fG6a5S3ZfN6WjLCNreZFqmM9TWa3NA6cijnn78KWHTxJmgnB8Az
	 U3QbHQUSuBpEvsMiTq+Rxm27mDtKvlmszxchq7BdWzSXUHZB7k0Y7lrfswjwAp5dwZPLG
	 ThGPuedQNuOFR3oWJuZXa+j6o7oJ+aOBy2FXjowClUIKwcC8BLc6QrHI1FatRyoVidz84
	 uLsO0iev0GW2ZK8+q8czxGF18ch3TEBOIpBJ0wHnZkvSmmJ8j5DNvM1SzHv6BaEQurg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
	b=ksXhF8PvYwxNk2DLzBS/C/ABSwQ0XUHIC0vfsThScFrA+txAWRssS5urg1irgnvjrj8x
	 +bbLvtJ9JZdzL+qyROupbJTGctXDMcHkVtQ/QP9hEhL5LGUpZKtR4Ds42/03OwVPpS5CE
	 iXxwI4BISjdvxV50DIK1FeFPt20qGDe9qgfGemAGYVo0GRP2ZgDMqJjJ9inm5QA7E0uth
	 TwJQWqnR7wPdsggoo2r/sNH4vxeQmFEtRBRcssKUzqqgeRBk2OTOXBLB7Wmsor7XvymsR
	 W77L9NQ4cntMyW0WtBGnveUYk0Ykq+3wG3aF2Vipgtl/dlF9NeIHZQrCjm5PA9RZUhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G9sTcZLh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BEE606A338
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63BEE606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G9sTcZLh
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-55be673e029so117461cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:45:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795067158; cv=none;
        d=google.com; s=arc-20260327;
        b=sISKA8XnvfpPWqgh6fus9keTIMLcZcXBVjIVxt1Vj4xKFbBjuyvdQj0FizE/iz7DnW
         kfbTiMwU2dI4Qk+c0vFjLhYESZ/xCBT922WuLCUk6JS3zRzkKcejEhpPBX0/MP1XMKIS
         SP4M6/gmF+YDUiKDDJ302e+zmm9zvGVK9TzkPeEgKV5P07OeMJEf0RSdd1KVYyNsjh+G
         ubMQGROAJ/Nf2EOxHcxL3uiVyrycG87wI2DubQoxb74Mm/KGDFv8Vm2ZhdDiyOHWvwb3
         f81yn4zjOCC+yDrSEH+GpGkfTVzB2MHVt7xTmc+51Rrpt3eLwxrdgxKAEf3trF8Es2z7
         E1dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
        fh=BoHlSHxKFV7PRICUFv+oG/u1Ny0tUMplrMwevqmn8JA=;
        b=bjyRRXZUFPkap0rawz8Lnjv2DM1pTJAOM7euLcLu5sWF5vkFkVBBer4uXkIi3xZXeA
         /C7DfwnWeZMWmsF50U7T7lR0VSl3L4WFKodgdTgpv0kSJucvWotU8OeJjZ7ij3ruDNbV
         Jr8lk2zD10NTrbG05zNSGFTbOJTBicxGBbOjvuOJQu7SapTNylJ7gpq1m4XDRTtY2E9c
         BkOVO+PHncdDGUYNWXNz0xxJORbPpQ1jC34GD914uCPN/XgZJwWegHtlZF1aDO29ppDX
         r1veK1VTRxiTjfUCZpw0GtAcBEeTjYlHts2cIdWOcRnPVmeH2Pene7RZG2rWEIeYnTTS
         jyQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795067158; x=1795671958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
        b=G9sTcZLhDZovHsgCx5Yv7CDMxJM8G5FDawL5JBd36y8NAy88YZsvFaSPGxL2OJDQWl
         D8l1zhaslplXpC+LH5CUyVM6fiya54hKkm3044CoRWwH6cYkMSxwEs9IE4R9vJJik3G9
         PaGymfho5RIhVhS+d5TUg18WON8Y60WBZxMM5gYyXKhy/KCwkwn+iT9No3gldijeO5tx
         xp5Gg8oePFUL/bdSJWKKtm4OA3cKKfEuUGn9FzCr/u57K1nN+6BjTy/XuUfYpf49AuBU
         GF3mrNTIV4ZWpGu4KegbuhUlLkOSriAaKH7KHmdnomUVdJlrrfe8QiZH1hsMd7fqVOCf
         HQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067158; x=1795671958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
        b=fspY/0MGwHRYSFebHrPlXzZf4LPZ9uva8kx/8JJ7VOFBlLY/sRNsAMLdpLWKlVjdM8
         YoWIKj/P4mELEUdA8/Ypk8dENvpG/tDIHiD5QqqSQvp0Jr1RQ+pLp/HywHlm9KFAPKLO
         rPIrMQLlNbkjq3vYjsUgcPKMXLnvDs0Ky63k+YoQTnHC1RYbrddCk25nzPiJPS/deAFB
         zoBl5ecq1UfCHIzO5Bg7g05RMJTGP7+HcRXM/JJ9V/Fm4tAAm+IEl2I8FpGZttTzc70p
         tsHT7AVOOpwW7hx3puYIkuvgq+x2/xILcrcr5/s1Is89bIIphIrJIxfcJ7VfTVQDgz6L
         1MQg==
X-Forwarded-Encrypted: i=1; AL+hErE9duU+J46Ux20GMzRJQwIJsrWiVaTB3BDOvbszVifJw57kNeNj0r3cNQGM+yU4ppmg69GJLPaLtAWj1/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QupPm8SQ60qo+uL4FDo/UXK/oBC1r3xpPoGE7IfQokGzx0qDb
	Hgcz2mY3aUr0u5yShNVFLR1+Bz5FoMRvTXxNhw69Upsf7s6Qgledki0AaI2SuKe77PaILCn8c5Q
	DG+nNGKrsL32VAthCN37505Giq3XHwV1PAuZYrHiR
X-Gm-Gg: AYBFou16sW3iPoEc56bitIs5sbayIjoPFEfcK828ybcFt4BdqA52bDu0dJ1BVBvxdon
	dmQn0EhvfFdpzBsy6GwJppmdvE1L2y37RXDdANLXDrMsQDPn2MRbjHhWL0HS08aD0Uk8ssPDUwN
	aAICgvR0Lnod7yqHrqRYeXL8UygpS8mhBiflthTaY5g5Yo/h5QLNjIdAk+8wTLWll+M6vPf2/TA
	9nK+lWgj+ZLrPIrkxU07tu7RfnxF4dgRdYPuYTdDceZ0so1WsHqwgB5IFVTEw/cQeTjDaXx4fcj
	s/ErCxw3v7LEwCWVBtsiqkpcCYl4via0mnmjOQq1anW0QhjeqdSLR//URPqLsw5jAcdXsDjZeYU
	eY6Rlifs2nyio3eiXaxdw5ke0BxPmaWSVnBMP
X-Received: by 2002:a05:622a:4808:b0:536:934f:7da2 with SMTP id
 d75a77b69052e-55d6c7995f9mr6557911cf.2.1795067157461; Wed, 18 Nov 2026
 21:45:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com> <20261108223913.3624571-10-irogers@google.com>
 <DMYN979QJFNV.LM3T6O68OHW6@kernel.org>
In-Reply-To: <DMYN979QJFNV.LM3T6O68OHW6@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 18 Nov 2026 21:45:45 -0800
X-Gm-Features: Aa3M54p8GzPfKDPQ_HJcPbdLHGq3vwK7n9VGnVvnVB1ODjbFHeHwrlgOfVCaaEo
Message-ID: <CAP-5=fXrMyfLFXq6CiqwWMSbtYVRNESxuDo-ddqNwDmq5Nm4SA@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] kobject: Require explicit initialization of struct kobj_type::release
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Srish Srinivasan <ssrish@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Sumanth Korikkar <sumanthk@linux.ibm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 1:11=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Sun Nov 8, 2026 at 11:39 PM CET, Ian Rogers wrote:
> >  static const struct kobj_type cpuregs_kobj_type =3D {
> > +     /*
> > +      * Pre-existing: info->kobj is embedded in per-CPU cpu_data;
> > +      * cpuid_cpu_offline() only calls kobject_del().
> > +      */
>
> All of these comments carry a =E2=80=9CPre-existing:=E2=80=9D prefix, but=
 that doesn=E2=80=99t
> distinguish cases with broken lifetime management from those where the st=
orage
> remains valid despite the API misuse.
>
> For example:
>
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_xcp.c
> > index ab14079d1c42..0847134a1391 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> > @@ -797,6 +797,11 @@ static const struct sysfs_ops xcp_cfg_res_sysfs_op=
s =3D {
> >  };
> >
> >  static const struct kobj_type xcp_cfg_res_sysfs_ktype =3D {
> > +     /*
> > +      * Pre-existing: xcp_res is embedded in struct amdgpu_xcp_cfg
> > +      * rather than freed individually by kobject_put().
> > +      */
> > +     .release =3D NULL,
>
> Being embedded in another structure doesn't explain what guarantees that =
the
> enclosing allocation outlives the kobject=E2=80=99s final cleanup.
>
> Could you please drop the =E2=80=9CPre-existing:=E2=80=9D prefix and make=
 that distinction
> explicit? For broken cases, describe the lifetime problem and mark it as =
needing
> a follow-up fix. For cases where the lifetime is safe, explain what guara=
ntees
> that safety, while acknowledging that omitting release() still violates t=
he
> documented API contract.
>
> Also, do you plan to follow up on those cases?

Makes complete sense, thanks Danilo!

Auditing all 17 files in patch 9 with that distinction in mind:
- Only 3 built-in sites (arm64 cpuinfo, ACPI hotplug profiles, and
s390 sclp_mem) have backing storage that genuinely remains valid for
the lifetime of the kernel.
- The other 14 files either free/zero an enclosing dynamic or devm
allocation without waiting for final kobject cleanup, or are tristate
modules that unregister static kobjects/ksets on module_exit and can
unmap module memory before delayed cleanup finishes.

I've dropped the "Pre-existing:" prefix, documented the specific
guarantee or FIXME lifetime hazard at each site in v4, and yes, I plan
to send follow-up fixes to the respective subsystems once __must_init
is in place.

Thanks,
Ian

> Thanks,
> Danilo
>
