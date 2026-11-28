Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795867026;
	b=KGkmVaA530ozzMLO4IVVlcS3dzlqtHUnpZ/E/2scv/UsfMXfP171qIpsLA5c6dRMhJX3
	 gWb9qPvNj5tlT55XEs/RcsaeqnnZhznqKKlhhTDeit3IpYQfKkZDe3rpo5DI3mTu2DQbQ
	 AoPYkhObd41UkVP31n61RENnvc6naLGohUizbQO0yEJzzBTAcUAE91QbV8Ro8mIlRNa3j
	 ekjJVpGmbWaI5SbiWh55j5iCHQS6ywWFFJqFxjA1Y++CftZ0vTMUlvgDkuvVwOPo8Pn5k
	 VQKkLjDBLlStpbwpnfybcJ4DXZwoB4tl0F+x/BZZp9eCLCWA5mw0VvZzQN+JYfqPyqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795867026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pO+fkVAr0bqXpqb3slH6WVkeYcbxuHUYXnMSGnc23Oo=;
	b=I6PH1oLyUYGw+jLW1Q2TXrChmUFOluN+x+NwDgo80LKKjh/QNyMywvI+QpT7QiZZAmMC
	 HdfviIp3oG2abHc8/aDRTxRKPQaDhWS8tE8aWhrf0C9oIrBnu8ECXUARSacDpOQT+iY3b
	 BzEGb0aVDmgVdLBBXRqCOegPjx7X7K2sb1nVojn9Dj4ZozunGdPScoHyfHVN4gm5v2dIy
	 khpHUsqVCCDyHuEdsmeKqzJ9xlUcSibMjRzOKb/ajYTapuZTKsZMRM1na1mTLBedXJJfK
	 s8j7GJ2w8qAYG8175d1vAetj38L7ye3Iq63HF2PuBIAzU6Xr2VWwlXH71+KoKFfvylA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=tomeuvizoso.net;
	spf=pass smtp.mailfrom=tomeuvizoso.net;
	dkim=pass header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kb9GGC1z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551E7606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 551E7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kb9GGC1z
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-921276742e3so80121856d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:57:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795867024; cv=none;
        d=google.com; s=arc-20260327;
        b=E6PWqnn88h6Z1V81NM3dxC5U3rezlwET+zLlt8F8ajaqxC1pqxsHoeg6rbc8NgZfBQ
         JTqDT0c3i9eOLlrLpeKMI7RPA7Lgc5PsRfNLSHCnIhRt3+VG9YggQ3T9i14cvG8dhE6C
         k2AHQ0jfonGpqTCjuzqoB6p5aTdkv6tZA0fwIhbOqEr0lqck/u4CbDYrKqLd5iuvvee5
         EA8I+59BKR1YH4ktRjNl68nup3Abo4HYPBqnABqLJcwI08ZK0Q4Gj1BCp2GvxutPNq2e
         GQOiueIh89ArRSgc57JpLzmrRTvAcV8yln12+NWa0Dcl6pGJbbkZ0sgjwU0XLtvdaLrk
         1lsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pO+fkVAr0bqXpqb3slH6WVkeYcbxuHUYXnMSGnc23Oo=;
        fh=wH5U/KuSDpOXQdZjsczi1zyvUiQ86sdX76PjytJAicI=;
        b=XDQuon3XNxzeGuoLw2DtRwZflbVbWGEeTGhpc9QtIO0bn1Z3ih7WL/tfQEfHH6wHl4
         yYtKF21SV64+nt2hEccEyGCrG1P71WJoJ059VZgDMHNnqMYFL+DI9/Np2aUYwdfA+Xnk
         qfEpPrMyob3Z2vR3Lg8tGt1/nTJTyBKCfzbb8hNYTrmPipZ1KduNj06S6dvwoj/YLEND
         9RvgNGnH8y+oNmXgtrXD7cg6Y9Og+5JrQu+LbtXoHhINb4ffGjUSrfYpBXmFd9mZgkZD
         +kt+tUa4ARmvdmp/WPReN3PrRTY0fH4XBuVVaNmMukr6U2LN6dnBvLj8IO0CBwQE5qDA
         iPNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1795867024; x=1796471824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pO+fkVAr0bqXpqb3slH6WVkeYcbxuHUYXnMSGnc23Oo=;
        b=kb9GGC1zfon7OiQDTIC10GH9+r9zFH4KfUqMRnsH+suM1/NpoQU6PAd2vA8fs3gq9E
         Zr3aH5AwuUYrcKOfEvuj7dSuldVy/gaT3X2Ojj5zgQrsQx6hmUPn3bPr6PjPjFqeydAf
         5MD/wiS8Vt7iCl13DTIITil/SLi43LtCkH2NF+0O2YKoRnpx4lCct90vf9WxVO3PU+eN
         qPQRTjBeDp5ZIQWEOzdNrzycKOBiLaeE5DOE0ciSxixTXHdNOdHTZVH3JGq8UOh4WYBX
         5oJQl8G3DPAFTz+mscPeknLulHTZFQ6U4Guffb5XVV6qyj/uaIYaJk2GpxgL/FtuGlIs
         mG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795867024; x=1796471824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pO+fkVAr0bqXpqb3slH6WVkeYcbxuHUYXnMSGnc23Oo=;
        b=Jb9gksrM8K78WBSPC7ftIGXUU6AlOHkGzbBy/1l5GN7eROMplSuhHZT1iQQz1KnNN0
         rZkTl6K/YuMxExVR9FbGwPWmbzRXmOHbjmQv1ZwJdR3smfcscrSWRtOQK6jQyhaN8qwT
         gRe/fN1MpgbdpvXnJDA+NnO5Ky9vFqxJI8JP7C0G7UPxkQ+3tRGgQSCPScUdlDYQpDCp
         vgRwER2Z4pEAI1ii48qfvOxAuKKfgTpoY7kWGpfjPzD5oMX/ABINbqXm2tFPuuN90yzH
         FyTHk0mQDInsn4fOjmjSn8ehhuXamCf41787iGAIJniHUrwh0gRaU8yu4+j6EfqaSdWS
         YtMA==
X-Forwarded-Encrypted: i=1; AL+hErGZtNKhG2sYoinQnNAWRf/ZK/MYeCVUAvLIX3MGtwaz1ylTE2vt+zyZfL+LkCYXllx7+M6ueJ3vWjhE3sY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vKyJ9SbLvrYIW8grC696lvNDKEk60DslQitlP0NG4gzQ0JevS
	ZSMuFIvsUIzhhNjpGcHevmWAl5qz47+VpY0IPM+D6sau4Ap6fUd0W/okTKlsY4gguNIpAJDjLRO
	e0z0ymR6ga3whC6fBW04Xr48dMdZjI5HCkjfB2h5xGQ==
X-Gm-Gg: AZFdTZfTIPeMUUVH+sWB0k8agbnyOCEsziVxU99L2s8nutMqOwfx4YxzcDA/9VFZ8OV
	Fe3Sw1gXyD8pJXXBDImqxUpOv9HR7Lx684gmtQ8LnTmNcCdkuaPaW/cFKweUxLNwy+kNZFWMiWU
	e7Y2uVt/gS4n9rkSVi9FhR8ISuqszyeGmQUmB9YfkTUrkSxH9wJGtEogEOvErsfAoi0m8/7EkNk
	UP5SXQ+lxTWaFwtmFbR7UeLct7zyTYgvYLcNyn39gMLlLcAG1vuTfrRndSR2mbax46QRfm9WEcL
	KYavDGYvCvvKEn/TmDPIdolXOQV0dJAS5lx/kCXNgHL6QhTKjlGxF5xhtKT+8XMRi0nVJlEqGJR
	HtSuyIG2jquv8yU/Sva9DLN2SS2AG5sbTGQYWyd4JfRKfRG2tloHwhIOyU4/1IXHUGXl93m6tTC
	yUoR/5ESWPR5cjZ/uGGbVESg5n2miKJIUmu5vksnyX
X-Received: by 2002:a05:620a:44d4:b0:944:a46:5c1f with SMTP id
 af79cd13be357-949ba9a3cddmr4674349185a.40.1795867024192; Sat, 28 Nov 2026
 03:57:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
In-Reply-To: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sat, 28 Nov 2026 12:56:53 +0100
X-Gm-Features: Aa3M54qNBEqtPjZ7TGseKLEMTlgJZCDptZfVFaaN0whu0pURN15ayQEVcC1qRrs
Message-ID: <CAPsqS2TFHzgZm5mdpQbS+H2za6fmHGinTR6sgzgOSAVW9evgvQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/19] accel: ethosu: Cmd stream validation fixes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Oded Gabbay <ogabbay@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, Nov 20, 2026 at 3:57=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> The series was getting a bit long, so I split out the cmd stream
> validation fixes from the error path, close/unbind, lifetime, etc.
> fixes. It's a mixture of AI reported issues, different solutions to
> other posted issues and fixes[1] and my own fixes. It also adds U85 OFM
> transpose, resize and IFM upscaling support.
>
> The series adds rejecting OFM transpose in cmd stream, but then a later
> patch adds support for it. I did this so the rejection can be
> backported, but maybe supporting OFM transpose is small enough that it
> should just be backported too?

I think we should backport the whole series, TBH. Some of the patches
you have marked with Fixes: depend on others that don't have it, and
as far I can see these are all fixes. I have also run the series on
the two previous stable releases of Mesa and haven't seen any
regression.

I don't know of any other user of the driver, so I think it should be
fine to backport, specially as these patches close security holes that
could be abused.

Regards,

Tomeu


> Rob
>
> [1] https://lore.kernel.org/all/20260717061145.1478139-1-zhaoguohan@kylin=
os.cn
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Changes in v5:
> - Drop all but cmd stream validation patches
> - IFM upscaling also supported on U65
> - Fix U85 shared DMA stride mode and mixed contiguous/strided U65 DMA.
>   Ignore stale bounds for inactive weight and scale streams.
> - Correct resize bounds for signed offsets and programmed input sizes.
> - New patch to reject U85 IFM broadcasting on U65
> - Fixes for handling multiple weight streams and U85 fast weights mode
> - Handle accumulator size mismatch with IFM2 size and ensure ACC_FORMAT
>   is set.
> - Drop "accel: ethosu: Account for kernel dilation in IFM size" which
>   wasn't correct.
> - Link to v4: https://patch.msgid.link/20261029-ethosu-fixes-v4-0-4aa25e2=
2578e@kernel.org
>
> Changes in v4:
> - More patches added for existing issues raised by Sashiko in v3 and
>   local runs
> - Combined the 2 patches for unknown cmds and unhandled parameters into
>   one patch
> - Link to v3: https://patch.msgid.link/20260908-ethosu-fixes-v3-0-490fe21=
5286f@kernel.org
>
> Changes in v3:
> - Address Sashiko comments
> - Another runtime-PM fix for driver remove()
> - Add a fix for NHCWB16 bounds calculation
> - Link to v2: https://patch.msgid.link/20260904-ethosu-fixes-v2-0-3767738=
756a4@kernel.org
>
> Changes in v2:
> - Dropped first 5 patches which are already applied
> - Patches 11-17 and 19 are new patches with more cmd stream validation
> - Add fix to diable clocks on PM setup failure
> - Rework the runtime-PM to suspend after initialization and before
>   drm_dev_register(). This simplifies the error clean-up in probe.
> - Handle quiescing jobs before scheduler teardown
> - Rework the cmd stream register initialization tracking to use a bitmap
>   of registers instead of relying on initial state values.
> - Handle U85 DMA 2D/3D modes correctly
> - Link to v1: https://patch.msgid.link/20260827-ethosu-fixes-v1-0-346f9ea=
8791c@kernel.org
>
> ---
> Rob Herring (Arm) (19):
>       accel: ethosu: Prevent command stream export
>       accel: ethosu: Move DMA mode to src/dst struct
>       accel: ethosu: Track command stream register setup
>       accel: ethosu: Factor buffer bounds checks
>       accel: ethosu: Fix NHCWB16 bounds calculation
>       accel: ethosu: Validate secondary streams
>       accel: ethosu: Reject unsupported commands and params
>       accel: ethosu: Validate all feature map tiles
>       accel: ethosu: Account for feature map element size
>       accel: ethosu: Validate convolution parameter
>       accel: ethosu: Validate accumulator input
>       accel: ethosu: Restrict dynamic IFM2 weights
>       accel: ethosu: Split U65 and U85 DMA length validation
>       accel: ethosu: Validate OFM transpose
>       accel: ethosu: Validate resize operations
>       accel: ethosu: Ensure cmd stream is multiple of 4 bytes
>       accel: ethosu: Require active weight streams setup
>       accel: ethosu: Support IFM upscaling
>       accel: ethosu: Reject IFM broadcast on U65
>
>  drivers/accel/ethosu/ethosu_device.h |   32 ++
>  drivers/accel/ethosu/ethosu_gem.c    | 1009 ++++++++++++++++++++++++++++=
+++---
>  2 files changed, 961 insertions(+), 80 deletions(-)
> ---
> base-commit: b4d01c788bfa50dc65ffb5fbc9db4135004c0e01
> change-id: 20260827-ethosu-fixes-ee58386e9000
>
> Best regards,
> --
> Rob Herring (Arm) <robh@kernel.org>
>
