Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795449407;
	b=aMH/hmpfaLbeRSOEoBVBo1UurGDnBRDFJ2aMQKIt6tO24yWBzCgQcTjltmNep/FonpoD
	 2D+U9U7HQ05AMNb5heil7T0YptXQ91S94iEP2KnMxC4wsVgpCgsHa1iMvHN+7NbPDJyaT
	 7vgL1pLxWu6fKnTUfOOUqxpNFCup7tD3qdwIbWMRcQf3H/EmEMr5XOPL+pWL651It+GYa
	 w7r3tG+W6XULiNT4evofd392qLN6jG4U0uFw0HRDwtaUVaIFjVqtwz1IHHREpE66r4Kfl
	 A5gcwgL24sz4pcwnnEtZK1vqe70xYM4xt6ZlRSvnRKB1aYJmJJMQBb55ddsqPwFxmQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pjc8deyObBxLCPa5L0oFhozqeUe19BHaOQG0r1a261I=;
	b=0Io++4+3zWLi73G8lV0g/7CF7FE0ythvwVub2s2fi9kdkLrRuJFXjFV87qMh7ResGVmn
	 xoVml0AYYgVQp9uvbhPLiCi5mfOJfOPi6pwvqmEHMOHl461Cxb/sCvARvQzdZgnbjwBau
	 0R3DuCSXJk5Tya8ylGIDC4XArGynVODLIAaNefbIWiyTCOZ1SWuNRqFFd7NCABcyI+Pya
	 r2P2UuDmC7sEFGT66/KoVvdeWJImw8zJ1Q+kHWF0hx8LJ4+etIdwjP8Z72Noi5TPatjtT
	 IVsXTQXbJNuWqf927JPUsYYzvlPJD5if3titvSXYqFtWOlaOb3DvcZt7x2X5Jrd9wDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UHSVgBib;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AFB606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59AFB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UHSVgBib
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-716f259f52eso153063eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:56:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795449406; cv=none;
        d=google.com; s=arc-20260327;
        b=GXFPeZoqKVhdypMHEDXklQ8Zd0IXyc5i/uAC6QUa1c5ZP20MkACgIpMyi5H11cwSOv
         sihNW/LD4V3TkEvX9f1WQrLJvJcGNnw8Y4bNQL4t+frgXFJ54Eb132SKEGnxxqagUSPK
         98q18hBOfqvCSmU7YxYZ2Ifrdw4QolspybtQgFRa8xpItr1ZHEU7vcfhTYkk7S4DWXU9
         PiiILSu+CfTtB2neWtpUwkw715VsoDPbr8z3Z+bXpBACQKrc+22G5yJemhcuHlckA4df
         6XqGW/eL38pJ9hoKbdBLDX4fVdTfnddi4UEBf9VcI1YeNWtif9/PFJEXPf/fTBBubM3D
         fi8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pjc8deyObBxLCPa5L0oFhozqeUe19BHaOQG0r1a261I=;
        fh=L09vbheVXygEjRrWsCyRQgBBcphWPbKVihCYT2wR0x8=;
        b=my9gakLrVg3TiGcUtR4d7hoDORs39towbR5CKKQoaZHy2sIYjeAGeQMUvmbgIPGIX7
         xvNDaewFOn77jxFRgSnbfq+jqU+ulS010WtwU/D9TdoItujoJXz/IQm6TY7HmEYRs4bB
         UlahLRNdCdWYKwFcsDLFa8+vbVEF63gbalGBuloyy/g+amRFVvoA4hkCOvLyJxZ5yVTV
         8EYrM9wLixTJQ00tZSn1idBVEqd5RNcxbyTFacN186Xeod+dHeLwmc8b/SWjYrias4JD
         +gcOWYo0ouHf/ayaQc7i6StGeMg7sm220MbMW1hP4osPiIBYPEVjcvFkSC20E/BqPpxR
         PlZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449406; x=1796054206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pjc8deyObBxLCPa5L0oFhozqeUe19BHaOQG0r1a261I=;
        b=UHSVgBibyx8xQW2mjSrmn30QRNiqULR2ErLSR0uyQ4DLftJfAVxorvj9YJJ2MWc1h0
         E+G/sgS4C+61BWs+N6b7wX5okye85+j3HQGYNOwqkEEScDvZlCF2YZ+Qnb4cTQ7dEk99
         nB2rilTR8Q9A2L6JrpEYDsJkdv2aUDr4jCmOepenqWUcKFekpF4W1mZjkP+KHw7PCLhc
         +JTQ4py0FJOf3XX1vRsDRXmZEZgdN3E1zK2wtMOQggP1IxdaakdVYPRqMJYNgrqHmXtw
         N4Q71CyHmCzTUdNHqB0eY/FamH17eHBp+FGMc6KLxxCAWR7gWqzUrHkpQLtNTlNpaH6v
         d1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449406; x=1796054206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pjc8deyObBxLCPa5L0oFhozqeUe19BHaOQG0r1a261I=;
        b=B+U9uqyXFmKqTcdeY4yINDTo3tXd7YU0bn2s9JyTtuoS8T0wUHZ2AKFHgWolt9Ecd8
         Oa4kPz0dkL7eGwGsyLThIhGc2Otm0PP9ZUkL5aesA2v1b1ZKgpEOGvFXqhhWGAHdtC6p
         /FpSQiTv2xprGnO73NpJOZNvSgaJyVxU0Jd9f7Y8iYum4v/m/wSoJRHy3rqmwCtR3Epx
         gCUvXMFhCi/52yndj9xlGueIWmDd6GTR47jY2BX09UYqtezSGVHM6ySFMg+l91oMJzbb
         sZ9I4nN/s14BKC2WL/vmYYfwh5ABgbyD5hityn1kTRahYoFbsPwuk3iMvVWuoAMSnxpk
         VtBw==
X-Forwarded-Encrypted: i=1; AL+hErGdPDldZpDhxLcOybbyt0DLXNmOtOV4YlMR+4bKMnPJcAustCE2U3GU9AlWCCTv14/fdBgTOsBteoS7n84=@vger.kernel.org
X-Gm-Message-State: APuU4Z86nctNtfaTCwqa3nOnqJ63nndH44Q7w/hzNbhKZzRDLDWxI/So
	7QUqJfwoisKvyh6bDoGqtR2ZcR0V0OsLtqXp+jvWXQltZMO2ZASWuzCaJs/RGFz64wSOzoRnrm1
	5lNelYDwdbpZ4Amvvbj4VIw4+XNZ9blU=
X-Gm-Gg: AZFdTZfyz6MH3lDTlPWuE9TjlMa4mR5F2JeZC2ntLkQMzRVexRPccxDbOUPKRP402YE
	Ufdj/iOt8GH9jBiYjcDTtjA7Y7hZcvhEUoH0L6Oj2shTucmqM/ld5hlkZN7HBfJ9zRh2G9Yj7qm
	46Qpvd+VrkNxndd0wGyzvlRW+rdSGiX5o8blGLEbKT/ZHrANZk2qj5X3QkiVolGL9s0JjJRYQXt
	PMXx8R/CiDlOSaaq+yFQxBpSxJs2Xc+WF4BFLTcXB1s22PXerD15BgDQBbqTih5GWNcIbbx8oyw
	iZzbA0CJ6HAjn1zva7s9Q/6yE3hzIoUoiSQptwxQMnA3WSx9iemWJmZh06cAJW8Ob6fZ4ahgBam
	eAxQRFKEyYfzDxgzVN9ttXz2hoIFytgJZnWLRRnoiX7yyYRXYaCwQzEZ5gYkoGjvuBJ/NMxqRJx
	l19MVykWnLpRTLZFqL+CvytHvzO6xzsFi9BBjC485yQ7JQeSQSNm0NSmCgBpM=
X-Received: by 2002:a05:6820:a781:20b0:71a:ed80:f0 with SMTP id
 006d021491bc7-71b393836f1mr10039115eaf.2.1795449406296; Mon, 23 Nov 2026
 07:56:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121030250.1674303-1-takano32@gmail.com>
In-Reply-To: <20261121030250.1674303-1-takano32@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 23 Nov 2026 10:56:34 -0500
X-Gm-Features: Aa3M54oXP51OS3sSNkcVOZ1PcWIzjST9HtGcC70qmiIvedZGUxdnp7X_Hgql6bI
Message-ID: <CADnq5_Mhgk-bMxU9dB1gf5zfn56szS0eLC17dj5gWzY1yWdrnw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Document parse_psp_v1_bin_descriptor
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Candice Li <candice.li@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

reviewed and applied.

Thanks!

On Sun, Nov 22, 2026 at 12:31=E2=80=AFPM TAKANO Mitsuhiro <takano32@gmail.c=
om> wrote:
>
> The kernel-doc comment of parse_psp_v1_bin_descriptor says what the
> function does but names neither of its two parameters and does not
> describe its return value, so kernel-doc reports:
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4440 function parameter 'desc' =
not described in 'parse_psp_v1_bin_descriptor'
>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4440 function parameter 'hdr' n=
ot described in 'parse_psp_v1_bin_descriptor'
>
> Describe both parameters and the return value.  kernel-doc prints each of
> these warnings twice, so the file goes from four warning lines to none, a=
nd
> from six to none with -Wall.
>
> Written with Hermes Agent, an LLM assistant; the author reviewed it and r=
an
> kernel-doc on the file with and without the change.
>
> Fixes: 581ada8f9bf3 ("drm/amdgpu: factor PSP v1.0 firmware bin descriptor=
 parsing")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202608210800.S15sl61g-lkp@i=
ntel.com/
> Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_psp.c
> index 82a2684dbd2e..3fd93cb1e634 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -4435,6 +4435,9 @@ int psp_ring_cmd_submit(struct psp_context *psp,
>  /**
>   * parse_psp_v1_bin_descriptor - Populate struct psp_bin_desc from a
>   * v1.0 PSP firmware header (standalone images such as ASD or TOC).
> + * @desc: the descriptor to populate
> + * @hdr: the firmware header to read
> + * Return: 0 on success, -EINVAL if either argument is NULL.
>   */
>  static int parse_psp_v1_bin_descriptor(struct psp_bin_desc *desc,
>                                         const struct psp_firmware_header_=
v1_0 *hdr)
>
> base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
> --
> 2.53.0
>
