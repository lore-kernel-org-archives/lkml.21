Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795013716;
	b=a4b5kAduIlrs1U+R2zB0Bsf5dSC4/tFqRBqPS+vC79ZBJoUjKJdtq1I4AuGnj1KpPCWj
	 rOAXETaz7rlx9SSld4JvRBRoOmwWari1hzOoQtD3oFQw/BfFmKBBNFeu4sTGdZjL/XGl4
	 y8UekPa/qOJBvI0d4QuT6DG1iPUTKB8o1UcEHsWFKGVhFbusd+8T9JayaX/ADRl/e+BOm
	 /32CyUlHE3QLkApznWW0QEKoKtQdx9klV+9oLJmg6Pl0FeMUhI6nRYXxgT6jsI6/HVUFD
	 k2ipcA48vj0l4OJhgHGxxDHotdJSl7BeBTwiWMKlyNF4TTYNkt5dm5Dp0mZ52r5EAGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=U1ksmWxzDVGM3iNAt/5EvAOvVOC66Qy74DTy36/6+4k=;
	b=UxZMppwagk3H0IwSUxgSrtj+MuAX/jph4QBtpFn8jJwgu7QzKzzYN+S+rviKt6CkJPHh
	 3J/wYcLgv/D1Dbez2nEtkqAWWncDzkBkr7Ti5thszPhDJbdzaKgkKYoeWoLmQoJp7DXnb
	 xq0n7CJW9ROvT7OJngRNTDfwdk0hj442rBIewOxl8GlBn6QAr+Htt76Yyleov3EZe6Jrq
	 j/X3xotCtW4ca4mnh7/aACvYqX+E+p1FvkV0P5fkwMaHXRCVGBu681LAwH5qQvV6u5izp
	 fyWDQGIm/2NeIc/Rp890FdPzdjyu9iAVUJR8Dt/m6A8saEWO6T06NKO+rys6aoxM4TQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BqIIzbOP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A50606A335
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A50606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BqIIzbOP
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4f8a223a097so17735b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:55:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795013715; cv=none;
        d=google.com; s=arc-20260327;
        b=ADtxSYz3Aa4hcYbDawAuxnzdYInlhejXCPEiylfdFUS/OLIF0uo28zD4x2EdWa7AFP
         RWrk//ZpxDVMOzc5W7OxbbGFapxpAXLu1yMvnHrDgtlfvrBSBh2gZMUljqdkQgsMk26T
         KlfRytS72P3vmpZgCaRq2eAhKuk8Zy1eEuloinH5ljKDh67K3FD3U7ujjSt/f7OKvkpv
         h+uqySpreJsX6WKYxfIQ4DhkRSPHomt8GR8f+H1/BF3OBzTk282wpKxRmaQ0LWqyoq/Q
         FdD9hAWeDyFQlNHHW4eEhblFd1W6TQhab0OwrojHZ3h75PPwCVMOhVcH8m2qvNUzaalC
         VsfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U1ksmWxzDVGM3iNAt/5EvAOvVOC66Qy74DTy36/6+4k=;
        fh=+vKdUMv+kNxK7H1iV/t2RtwLV819gNuq61huU/7luCw=;
        b=bnuoLnE68bgUCAUdsF5B5YywfI27dyn34xdVBZ08RJKiYDprxiJpmGCcQF8XG3C38j
         1WpvN1t59OllJ5F9lk3BTho/0FeIQQmme6lCDBe7E4DjCSj0NfkUQy8dTpe5sIb1PByK
         EoMNj6te1iwXSoIcLVlmUFLcPhl1cjLy67MP7Hnb13RbAdWTlodQPDlgOxfLEJsK2bZm
         itHesVcC7Oe2mL8Qnu25gpRbQSulDm33yAc1UwR2g86YbWzKEkFDhqhtheuCiAiXlsbD
         1awmp4D+8wAu45KQ5NAayBNvYrlmR2j7YFbMlzx7q0Qne9HtS8QUH1IVxQ/scKhSP0Nd
         p1aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795013715; x=1795618515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U1ksmWxzDVGM3iNAt/5EvAOvVOC66Qy74DTy36/6+4k=;
        b=BqIIzbOPMtMst1CXNnjveCisnBBg1oba3m1HOwykkRakXGBWpWqzcvkPziMWlUacJe
         64orpT5dn2zhH1RyryLQFVvvo2feScRALfYVpynxVz+ANURisgHYxav2jkKWMR+b5BTc
         F8q6uOS5ou6fz+/kXhhgIAijenk1a1/W6EbUjbE2Nn7PV0iKO4f23sIZ6QLOQQYV4Skl
         YdD6pGFfBU/iuwhHICsRTHPzeHqSvm4hXxcvbcmPYbqsGQ4mDRU0+gqYySPX8c3uDvyS
         9vCS8q5l5O+PAXsXl3azWMhAnvuUuJJiAxSHaaq9AmFCPmwRudgFXhb3rrSajJ9ucchX
         w9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013715; x=1795618515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1ksmWxzDVGM3iNAt/5EvAOvVOC66Qy74DTy36/6+4k=;
        b=ZQBZ/0gs3NHU+Sdxy0hO1758gNZqOdZcujP3MZNg3SBmSMbe8aLVF7Gk9HY0wppXiy
         i7gWddpsQi/wQFJKl7swBFd3eEaTVdydymFuFdxjePfxWV7aK8FS5045FIUZ1bt86+kX
         8TjfgjYc65kaGoQZKTLPo4I6j0C8K22OwwpYPI4oVXCKjLdcBDrWcswGc5SjBKZmb3S5
         rDtGXZrsSOo/k8AlV1kTwv3G/w4mtp1OI/pELVekpn8NyoOc9TOAud4bsEEO1C1TaOqQ
         DcQENtnccgHWO92pr9ZZ4kxybLKy6FRjNAoz+SRIfQpGGgbSJTbr7jPYAxm6UDo0cUqE
         9V6w==
X-Forwarded-Encrypted: i=1; AL+hErHyxtGTDaYdJauANck45kuRydi5hpbLZCgcHhJAPgJQLB4yLOlIw73Uj8M9sbAlLTF2CAatJ6dNyEXxLGA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Hr0HK651RXSb/i5OzqNwtp6Op90uDsQoYx0HfI3oCl0ybECj+
	aVTDHPGfpx/hhk1gxsQ2iZhQGlcPTe8ayMjo4dBMjA/qVYlzQ9FDkGGBdziAuyDKD8cNynNVL+A
	r8MG8MxVhZG+SRZ0QTvvdzCKunxU67U4=
X-Gm-Gg: AYBFou0FdHZPMsT6fq2seylGEw7IDxK/ksqN9gWKudCZ9c+vlbfAMHDNNsn7QyNTPqs
	aO7hwNYodtYm1tCXouvKqf+wVj7cP0bbhDEtn4dIC8LN9hUI6smsr++UAqXTH4nIsVKNzfLDL5H
	5kpCk9c1DP+D5LK1kNRD6e697mHR7eo9ybUy8sYGHpyRq2nT1kFIITGfe+zKmWmlpZBU0gDNmfB
	5rTuAe26gKFriBv9TihfOM0Y+ZoS99W2RT5KfMhWluouZ28lQTLaFJ/ZMvH3Qv5Bui0Qk6+Dhru
	tsxZ32mzhGPp38rx/nmQgY8XUO0b+JMZe8boS0a+DyQ8aBDf7ssNAOmbKxx4Zgv8tcsOgvK68eQ
	VHGBdGroBdmq/dXs5NVRBK1+HAteY7CJYMEy3ElwI3W9DGg/gtneXaBBrEbJS4A/xBEYg/gbbMa
	MTXS3jGIB2qus4vTb1INxvr/OqBs38hi6PpfFd6wru7XFpP5ut/KP8GyKBh+ILMu53VUx8xqqaN
	4SLDjWG
X-Received: by 2002:a05:6808:50ab:b0:4e8:b729:3ebe with SMTP id
 5614622812f47-5773cf28fa9mr4891107b6e.4.1795013714673; Wed, 18 Nov 2026
 06:55:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118144923.1100-1-pierre-eric.pelloux-prayer@amd.com>
In-Reply-To: <20261118144923.1100-1-pierre-eric.pelloux-prayer@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 18 Nov 2026 09:55:02 -0500
X-Gm-Features: AclHuK9S-4vVMS6uriyFTd2kN7_cTAz3DiLGyu1_3jE2ITmklct8mvSQoJDun6g
Message-ID: <CADnq5_PM+gdgDfBQGdYLOYZ3OV_ka2+1SPrNCh0YLTUwvzQSRQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/amdgpu: use a single clear entity on some chips
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 9:50=E2=80=AFAM Pierre-Eric Pelloux-Prayer
<pierre-eric.pelloux-prayer@amd.com> wrote:
>
> Workaround to fix failing tests until the root cause is
> understood and fixed.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd=
.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 8dfa92967b63..d5c1d044403e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2411,6 +2411,13 @@ void amdgpu_ttm_enable_buffer_funcs(struct amdgpu_=
device *adev)
>         sdma_ip_version =3D amdgpu_ip_version(adev, SDMA0_HWIP, 0);
>         if (sdma_ip_version =3D=3D IP_VERSION(7, 0, 0) || sdma_ip_version=
 =3D=3D IP_VERSION(7, 0, 1))
>                 num_move_entities =3D 1;
> +       if (amdgpu_ip_version(adev, GC_HWIP, 0) =3D=3D IP_VERSION(9, 4, 1=
) ||
> +           amdgpu_ip_version(adev, GC_HWIP, 0) =3D=3D IP_VERSION(9, 4, 2=
) ||
> +           amdgpu_ip_version(adev, GC_HWIP, 0) =3D=3D IP_VERSION(9, 4, 3=
) ||
> +           amdgpu_ip_version(adev, GC_HWIP, 0) =3D=3D IP_VERSION(9, 4, 4=
) ||
> +           amdgpu_ip_version(adev, GC_HWIP, 0) =3D=3D IP_VERSION(9, 5, 0=
) ||
> +           amdgpu_ip_version(adev, GC_HWIP, 0) =3D=3D IP_VERSION(12, 1, =
0))
> +               num_clear_entities =3D 1;
>
>         adev->mman.clear_entities =3D kcalloc(num_clear_entities,
>                                                 sizeof(struct amdgpu_ttm_=
buffer_entity),
> --
> 2.43.0
>
