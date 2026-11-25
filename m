Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795620945;
	b=By4BJka/eQc2Niw9Gjgo8p937R9QzTxK98kT6VxZO9MMXTdRoyv+28CE3Kdo+1TQ8f3b
	 BOCaeMjyOK8nGtVE9Cmkilsu9HRAxOlLc2stA4WkAOEs/9cV0hd4o6fwM+FSrTFxwK8IW
	 GPoFxWccoac2/11blne7qCn6VQSdbQ2JKJ6v1aY1Tb+KNOx1CdOaVQgACihzI8BsQDkoQ
	 IbO1FaFQEWI6G72srTRrqEe1T4LDOltqNiZHVKVHGo1C4XjjZ4P7QbqxQ6+cE89wl9dXK
	 Waqr4s5kSy01zEhV3lI4vQ3Lv+Dvv8OblOssaQPQDAi0QfKge5wXvWrYdmfsXX9ZiAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eR/tiRX9GFewYsayqztCCACOfK3phuUQmHI7BlMOyHI=;
	b=kaQc4p2bDycMe4p2Mfyri+wGWo8Jo+6aRIyt080y7BGxxQIJRuIg/oVIfq871Su3F7Bw
	 ANLbxg61WwFw01wRNk0DzrReOxBJcJ97fzkH3fhza018lGIgZbiZSegbwehiJLUA/o5uM
	 xwhrAZjqsSJF8qY+1ehx7PQhExKkwpKM4Wtbc3VG8KiziEIF3nwHcDAXzKPJyGBF8DTXc
	 /VxPxQmoNyYNRtJZWZ9PjWsx0km7vAhopcf+zGvsFC1yWhsw82iAWQvc+s2fWMasFSwsa
	 RpR6ozwGuI6uCZAgW+r5nL2nYXQ/vkj6dtcrzXnz3EmChvTMYEilciTLvfEVABUJnwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=v1mFAf5J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BDC60A3813
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38BDC60A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=v1mFAf5J
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so7860166e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:35:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620943; cv=none;
        d=google.com; s=arc-20260327;
        b=dvj6UEr6Xk27TK1BzTryFED+O0bEuBE6xbNU8Y8PCZjjS8XKHwAjef4kGvwimQRLrK
         TDlwfbRUZBR4rkdQw+5TeH5Q1IrVNwJC4iSJyFz0h1I1OgZOP/IbE1Kxg2tx+mVyuaMT
         N4cNKRett44YbCLmd1AlwxBs7+kiZXgTjugWDBFlpEvdFGi6DMoCPudAbuak37sM1Jfx
         Pj2dgFe+mmoqcvIaecdDGfDIRy87NM3B7erxRb+1M2Jr98YbBvLfc0airTS1SqvxOSMX
         j6oFG15HzJ7oFj+Uk0dceenMHSuUQnFrnInVjg49iov3u/Yuv7fExE+sGk7CBZBflQuO
         8/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eR/tiRX9GFewYsayqztCCACOfK3phuUQmHI7BlMOyHI=;
        fh=wNe10aOm105QQGAB0oKAfLl+exv6lSeGgMZuPjqXl80=;
        b=UcgPPX2R+aXnLXdGOvSZggUuWcIBotJZUWO5X4bQ+6N19cb8x15B4I841IcT2wSulm
         lyP5uQT+Vg1BsQIk/gf0V9leXdVGg3Atnu/OA3e8/c42Ne650veBFZFEtk7oSvF0aEv9
         8RnHyuJc2mVcy0nZyywzziaRsYuRU1pJQMLiSZAJz4cr6iRIw94jjcpF35j6XKLWBIef
         4qMSEqLQf/O3iP23LqWXCTGAf1C7JkLqhiVxEFVMzWota12XI0MG5vPwSwed1h5CUkL7
         HEZXelm75GhJPciqwvr0M0KMFTt4dSUN92XJeTBLOfewCx8vpzDeLkRc8cvq+1ThT+Us
         00Uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795620943; x=1796225743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eR/tiRX9GFewYsayqztCCACOfK3phuUQmHI7BlMOyHI=;
        b=v1mFAf5Jl87YzT0sEYvcgKKxSdpZMrI3/TqleME3WU7+9K/fPLgzTUr+aKMWCoHXIl
         wFLwW5JqArehUd0YMMMFxBmTJ6uLsUmCoL7htwt8A6BsLsiCA9V5nVmI2Q+SM9Owyu+Z
         YMvVI5XuvlUxDAugD9si8D8/VJIyMWqGUtzO7d2n3p6gcjjFDuq295vVPThMKrL4V5yk
         ZS40MfOqTYmPvfh1woOGAl1CMbXRoc0HLVAj4ktcMS99Mt+mOcUJHCrwG71TvFsJHltf
         +4r7AAwMFNNNbC4pCEGQKQdoOy7eEyJ4lmXWHw00yUeDZztyBUkvRTAUbhYddKp1pTmZ
         78pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620943; x=1796225743;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eR/tiRX9GFewYsayqztCCACOfK3phuUQmHI7BlMOyHI=;
        b=C8o0Aa9iPzWvYZd05EU2MZsipiUw+mvBnnh/oST3ql+wWbggdYX2L71B6Glnsk2HX+
         c98RshiYr7xTQYe8Loyuum5PH0Qa/6AIHC46P7mi/CYhs0EIgpNvzarcUtja8WbftoVj
         Ac4sa9l2bIeHR1Dx4z+GL8fbIsTafqDPsh021yIZhpvBf2Hah9sBk45RQhfu0UVrgqut
         l402mi2fB/LoF9B8przcENVEu1EmENMmNBZ/wApifbBbRxSKvONRhwjmlyE7zm5sVUWz
         FWBTqaXlbSXHyyLEjuzKhJzvh9cY070UKQIgoLo6dwaA9azK70qBEHUZ1P0E99+QVD7B
         r1NQ==
X-Forwarded-Encrypted: i=1; AL+hErHJeyQhlfI/GvPnW3vnDP9nDWYfb7A52IF2NKzW5T8ERm01whneVlATzYc6dQWkRuQDd6MidjiEtWueKCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0jo3I8mvNhZusZK0S7n00GybXMg9b+DAwDG6IoEcFTIh4JCcm
	ZR2bpNad1FSFaa6OHXbSKWxd0tr++gXFUQizoDzzFQy5mVkrsO3IL6eBQsWyLU5uxM0ffrak9RK
	pQvzgeUSuI4EFynh1wBQXtib6/yxcobHU1z1i9PQwCA==
X-Gm-Gg: AZFdTZfzca2Su98SbjxEEQKNE5OGItLpUF1NE5kJWAi5bCCrmzJ+5NNcuhTWw+ceGr8
	GBbW43TXBHlUcEBtwBSvBOzPwmQbrBdPWRsb37XKNumAvGU7E9WyxCJi9UNmhoiGDJqzaoYyipO
	NzF1Oi1qRbvqPCs4QFN96hDF5Yz3B2SuWCUSBtyjSxRRew2rsQJNngas/LIVPpI02FXDPiXEYea
	bgbDm2UnAH/hBZrPn3TEjDE9llpuEvIeHCeGokAD4p7l+sIoG9+UuPWQgaKgzzoPKT8YxHAkv6c
	glZ6//D7zAe6lZEuDZnCYv/bTKJnPnaFozrx5He3JYTlx99t5vz6M8wDEKMCv+PTBgS4Tp2qPl+
	36AlVxmOmqtYyZWdppVzC90IIoB9ztPDc8BZ8iB9Emv78isMEuxHRdOLLQBT2VTkPOyh32uWc4w
	3dGs7txtfgRk2hvW00zlVhBm9GAFv51WmV7hqNHs0xFoNzVJZqN2vh
X-Received: by 2002:a05:6512:688b:20b0:5c0:a4e:5cf5 with SMTP id
 2adb3069b0e04-5c1bc7d10c3mr3567435e87.26.1795620943192; Wed, 25 Nov 2026
 07:35:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260924-free_bitmap_initialized-v1-1-4cfb73a0d04b@kernel.org>
In-Reply-To: <20260924-free_bitmap_initialized-v1-1-4cfb73a0d04b@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 21:05:30 +0530
X-Gm-Features: Aa3M54oJBm-fP-yPqacXbdiaITq6or3sIYt9H8e38Vy7GvqmmY_G97lMunRikYo
Message-ID: <CAAhSdy0cfbfufYYhVCz6Tq0_1RrS0DEi5yfKyBJr=WhUnd+QZg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: AIA: Initialize per-CPU HGEI free_bitmap
 only once
To: "GUO Ren (XuanTie)" <guoren@kernel.org>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 11:34=E2=80=AFAM GUO Ren (XuanTie) <guoren@kernel.o=
rg> wrote:
>
> kvm_riscv_aia_enable() may run more than once on the same CPU.  The
> per-CPU free_bitmap only needs to be initialized once, from the HGEIE
> width discovered on that CPU.  Perform the HGEIE probe and bitmap
> setup only on the first call, and set free_bitmap_initialized after
> the bitmap has been populated.

The per-CPU free_bitmap for HGEI lines only one unsigned long so
I am not sure what you are trying to save by skipping one unsigned long.

Regards,
Anup

>
> Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
> ---
>  arch/riscv/kvm/aia.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
> index b3b466e4db33..a65748321f7d 100644
> --- a/arch/riscv/kvm/aia.c
> +++ b/arch/riscv/kvm/aia.c
> @@ -610,6 +610,9 @@ void kvm_riscv_aia_enable(void)
>         lc =3D (gc) ? this_cpu_ptr(gc->local) : NULL;
>         hgctrl =3D this_cpu_ptr(&aia_hgei);
>
> +       if (hgctrl->free_bitmap_initialized)
> +               goto skip_hgctrl_init;
> +
>         /* Figure-out number of bits in HGEIE */
>         csr_write(CSR_HGEIE, -1UL);
>         hgctrl->nr_hgei =3D fls_long(csr_read(CSR_HGEIE));
> @@ -634,12 +637,11 @@ void kvm_riscv_aia_enable(void)
>         } while (!atomic_try_cmpxchg(&kvm_riscv_aia_nr_hgei, &aia_nr_hgei=
, hgctrl->nr_hgei));
>
>         raw_spin_lock_irqsave(&hgctrl->lock, flags);
> -       if (!hgctrl->free_bitmap_initialized) {
> -               hgctrl->free_bitmap =3D (hgctrl->nr_hgei) ? GENMASK_ULL(h=
gctrl->nr_hgei, 1) : 0;
> -               hgctrl->free_bitmap_initialized =3D true;
> -       }
> +       hgctrl->free_bitmap =3D (hgctrl->nr_hgei) ? GENMASK_ULL(hgctrl->n=
r_hgei, 1) : 0;
> +       hgctrl->free_bitmap_initialized =3D true;
>         raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
>
> +skip_hgctrl_init:
>         csr_write(CSR_HVICTL, aia_hvictl_value(false));
>         csr_write(CSR_HVIPRIO1, 0x0);
>         csr_write(CSR_HVIPRIO2, 0x0);
>
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20260924-free_bitmap_initialized-abdc94a528fb
>
> Best regards,
> --
> GUO Ren (XuanTie) <guoren@kernel.org>
>
