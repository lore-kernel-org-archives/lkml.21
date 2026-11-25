Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596453;
	b=ccq9Tp9fnatEEz1nISPiU6pOBAoyrR0bjFPlYj9BT2vfj8O+nm1smFfbGYG20MbnUeMH
	 XEmjIM9FMiPI4jctxRK/bEOWzWmlg3ZZ+gQ2xmBlNMD4K8HHwXsEGSJm+hvNr+OvKKfIR
	 lKr1p6RMYBkkZWhsM5TeU4jUcjk04vqFgZZYkDdm+2ccbCAXBqMt9SS1KqDue6PpzOJay
	 PeeWSzEESvF/TiLvvCL+hGbTs/S/ry/2AWh3zH9CGUZ+UpTZ+oWId/PFhC5/kQ/rPm9bF
	 3g1RrwhtzKducPPrS01cz7j0iSginGFEQjWwlZS+bV1cMDm6faifA2eRMT17v4Qw+ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596453;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=g2VZTRXJhfP019ydeKL5YFHq+Ono4E72cezNWVIlDDs=;
	b=oIIIgPk4EQlk74rD4rTwDbCciOKGtT974u2UEkcDqn/3JdfnYcG12QqCxAaP4DzjwdfO
	 mPk5dkZJ6W8SMXEV6DOra9q3aCd5Jyuaf6ekCvDL+ujVTLs82ZThsLABpHSFTJ+q51u5m
	 cm0rfiKa2RnxdOIo0CJ0GrT9Fg3/S8gkk8KoorDnjLi+0ctbbXVUIHZvsGGX1DNQpCEsK
	 7bbGBFyIR3LNYTiW7HTuaJ7Lr0Q/G4MMjwAo2byInm2v2JwB6MV42rrHHzx2PcT5eqK3G
	 5xQWZQMgXE4i5ytZH0bZ282w4Tkwgd7EjcXKiePTLScu0fAzjYjhoijVEH32IBzqWvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F40606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11F40606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso1888074e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596452; x=1796201252;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g2VZTRXJhfP019ydeKL5YFHq+Ono4E72cezNWVIlDDs=;
        b=sEPd4AftXLZgn28r3ktNXYckLhuaGS3sP5PyE5p465EJLE0SdLL40DEB+GgZfGe8F2
         SsfNgovDP7soIo8RMoprdjuc5i43axR1epP4aIVPsJRHOToijHpjl95AZPlXvrsbv+10
         +LX5lgJd9v8QceAANhTHe7fBmHx00vsJ6OJAV7yhPaZkADE/IU6cbdhsZE2CSBb0QTzi
         15GwUqPNMJA0Nij4e7PIAVi9VqLAJUlw1WpPS3Z8FANRcnLmWewpzyor3k8nn7Kk+YSz
         nctd6D1WlJCrkZitpbYTBk1F9ga20uWSXXw7dEVWfPgyUZ8eDqjB6bpgxXrjG9JaTLpQ
         aJiA==
X-Forwarded-Encrypted: i=1; AL+hErHGoHX9SgIGFfJVw2hqNS/Ov4zyARWne+6tn+LoJiPkkZ9gik8r+/ZRhfMdikpQm9Qp/n6Xz22T4zNTLz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/s3pvbcdrHeKJ34rewz2CXMa2C+Kxv4c+q+4v4feUnPqXmeH0t
	/gfFMCVZSUx5SGe4Icpf5AFZ/DcGDNntEmRRHP0bCBBV3/X34rBtzQ+b0VLSn5EE
X-Gm-Gg: AZFdTZdzsnY1fpuaRuLesZEAHD/s8/Jlz09dMqkehKmh9necKDwrmx2LKzHHHhBYhjv
	ytXkdZoBDLfeFfAFFZVwliy+ABH1dRJ2xCb5BeqEYR5plRb8n98Q8cBa2UBqgM2jVikbMrWfTtD
	IMDRN9iLNKR53zQUlDjxG7RUegrMJ6y5n8KB+uIr2iKgHYDbeYl6RVoKxyJwy/qj9nau89DoXzK
	2fZnodF882pH+77XRb9wHpUziqP5sJ0Vi8yZZPlf2SrrJuaJ3AfZcLxiPKVXjRzD2FMyeAyKdCj
	B/gPWHvS2sKulA3yc2GT3qQTkVVOGcY5L/stlXLXheyQTiMZMIakSICG5nX8pwUGhbn2PMkmEgM
	W7HjyP1bVYcou/bM7bsDVAx5Rab7lzW4QGZyVZlvzP26Y9+Q7tv+l/ZGqoOsCOUeZ13FtVHTMqR
	ZtBX2KGQL67fF3DVG4R5vJej7GXv1XKMOT/ENxVfdcZeGPzIEzkyzbRXFW2xVLwXAUf9JXeJH2q
	H/W1K0XW/wve1IaGJsk09ikudwY6Eih+jWoK32C7/fcEYWm2wGagaNbseD5gW/VuOIWIkRAOxKw
	2mhOJ8KZnTEIn5rYmtPXSEaAHqc63yhluHBCB/4MBr3kUlDF8921k95rmrj1cjFjiHPj/poOf6g
	RXcgt1FMg8KPz
X-Received: by 2002:a05:6122:1d8e:b0:5ea:e7aa:acb9 with SMTP id 71dfb90a1353d-5ee8aeaa9aamr8773439e0c.6.1795596451949;
        Wed, 25 Nov 2026 00:47:31 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b555147sm16451553e0c.6.2026.11.25.00.47.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:47:31 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7d88baba78dso1410583137.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:47:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFwWAeGDTjYNryQ1YodJVjpUaKJCE9RMYnKC7+527+X8sUrMivva9dWKyr2Rgn6FaXzEQNKa03acSlcwpc=@vger.kernel.org
X-Received: by 2002:a05:6102:cd3:b0:7cc:56a:58da with SMTP id
 ada2fe7eead31-7d7395d630fmr7124513137.23.1795596450466; Wed, 25 Nov 2026
 00:47:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-prep-meta-fw-arch-independent-v4-0-513d1c51f458@imgtec.com>
 <20261103-prep-meta-fw-arch-independent-v4-2-513d1c51f458@imgtec.com>
In-Reply-To: <20261103-prep-meta-fw-arch-independent-v4-2-513d1c51f458@imgtec.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 09:47:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVqGEZckVZMnmKfwpJZ-sT6Jisj7JkL31uS0S_XABCbGg@mail.gmail.com>
X-Gm-Features: Aa3M54oYWwJ4QX4LtZBAQOtixmcWW5HWWBj8NKw1oLcuyKzIqPAFolEjnn9UcmQ
Message-ID: <CAMuHMdVqGEZckVZMnmKfwpJZ-sT6Jisj7JkL31uS0S_XABCbGg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm/imagination: Limit access to the RISC-V
 firmware interface
To: Alexandru Dadu <alexandru.dadu@imgtec.com>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alexandru,

On Tue, 3 Nov 2026 at 10:01, Alexandru Dadu <alexandru.dadu@imgtec.com> wrote:
> From: Alessio Belle <alessio.belle@imgtec.com>
>
> - Rename the RISC-V firmware processor header adding an "internal"
>   suffix.
> - Add guard to the RISC-V firmware processor header to prevent
>   accidental inclusion outside of the RISC-V firmware specific logic.
>
> Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
> Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>

Thanks for your patch, which is now commit 2f42457ad97a6d32
("drm/imagination: Limit access to the RISC-V firmware interface")
in drm-misc/for-linux-next.

> --- a/drivers/gpu/drm/imagination/pvr_fw_riscv.c
> +++ b/drivers/gpu/drm/imagination/pvr_fw_riscv.c
> @@ -7,7 +7,9 @@
>  #include "pvr_fw_mips.h"
>  #include "pvr_gem.h"
>  #include "pvr_rogue_cr_defs.h"
> -#include "pvr_rogue_riscv.h"
> +#define PVR_ROGUE_RISCV_INTERNAL_H_EXPLICIT_INCLUDE
> +#include "pvr_rogue_riscv_internal.h"
> +#undef PVR_ROGUE_RISCV_INTERNAL_H_EXPLICIT_INCLUDE

Really? IMHO that is very ugly.

>  #include "pvr_vm.h"
>
>  #include <linux/compiler.h>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
