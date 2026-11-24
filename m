Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795505057;
	b=G6107nSW3PBLeG4432gm81GvcIVHhBP+iVPcRu0GgRhD9evBAd2FtxgKonAKGw9ffbV6
	 95ANW7tvS0u3DngUSwg9mbns5rvJTIatlg672smaUfZ970FJ10Ybbbb5Zlz/Fk9FDlf4r
	 9q/WcULHZYIP0fc5IdoWkVsng59xhdI36L9Iwy66u/aLq6vV5fxUoAcHuSzr0htXswwIh
	 L6jCHqkSdnv+q2U+X24LTTou6U6SCT01K29N8YyU3e1+Qy933fNHFravkOLF+7EK0wbOv
	 N+7GJN0JngLN9Teqvsrw7JSOWa4F9HEb70bWe6IhANrAZiWwaO8dYB1smoLx3M5Gvqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zQkMMF/iZtl8nyKPPF76wrTKqWng+NcxYhzPMVXCFxw=;
	b=ghGLyqJfgWzTSgeYgBW7F+Tw1/AxSvuZrxHdzscWp1fZ9rLjNo44kySv2Sf+t6kAB1QO
	 F3XQoDuwKmAKzflKRchZwp5YjLZtETrN0Y8x3Givhap8kkYDPwV4pYw6aLZBQS8Hk6Kw4
	 MZcxaQPmEok5QWtxV0kw0gahqOjITfpnGM8v/BIJujJB1YHKqdV0BSvbzwZejMyB6L4bw
	 G6yi+MURqLMCkN/HqCaTZRTajVSTUK8g53EzZXHH9Bxg9mELBh11r8GTA0uYJvsAO7dO1
	 JrD1vInlDo1wbCya5v9gJ5c9qIuUacsDp8klBVZOPReEc//KEgv4JiHXaqFiJfJielA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VSYZIOCv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243D1606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 243D1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VSYZIOCv
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so3406793e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:24:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795505055; cv=none;
        d=google.com; s=arc-20260327;
        b=lPIvppXQdafMt5qq4OtKZ0wKL7Ipa+NYQK/R+crOztHxbvSpH4Adl7v/dEdB3CJNWL
         EOJSSGtDsS3WUZW9Mj27csx3/AGxIwzUOJDAf0vZccZr4rfCmQzfJ5J3xsGsTqBYKCNa
         NRPLN0msCUxntYX6Jq0uzV86dtLsEi9PJtxsGa8XkQ5HHEDEh+1o8wkVEguOvNBI6O6N
         7cAZlVKx9NzYTo2d7WQNL8guG8LnoG19czgnwlkQf+C9hfnhi1D2ekyaf/Kit56s2HZ5
         NdzbsPe0yaze5RVbDo3tzuilPsiGOBVTCcwFdULjMj9Pt8pN91TBDO1ePSqv5sK4iHuI
         RY2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zQkMMF/iZtl8nyKPPF76wrTKqWng+NcxYhzPMVXCFxw=;
        fh=8Ti7wRvuV3zFUhT/DuhNl0If+TXb9bGgUo+HQKD1Zus=;
        b=QxjaRXxRZvSx+VmWf3CvYo3HZ0LJgvVCHFJFlo0ahZCEIk2VUg3qlAaICC4014oEul
         a3NinSmwUxl713YdJgKNB1Tp91WwPISy6YWDxPCgDnfKGnH5d5avMaaYOum+ZuYW440I
         IIGwMmHnsXZTOhiU6c1A/dqOShebXVCjDJZVnBywtWIjo9V5weyPm7Q6RusDxClrplUO
         DZkjHJk3F+hUcDOVq/mwIWQrNLXm0IA59sY111cTL2T306Yod6vLdfflf1pfIYSnLaU3
         3JZXwWfhhsQogyc/t1NPUWktVhBRJHr9PtIajiL5FdYqHRrHWGp+rWPIvNvfFOZtqaq/
         4ykg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505055; x=1796109855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zQkMMF/iZtl8nyKPPF76wrTKqWng+NcxYhzPMVXCFxw=;
        b=VSYZIOCvcOvQUj9LYsYZPmOXjBqaNi8d51XoM8nVac28LKKpjkdLS77tVczSFJaKZB
         fW6v97jHKqvUr8LbRep1I7vKYyPWsyU7X/5yzGLyF8hyQd9AFnZWr9No67QR3DG6j4yI
         D9vLoNuTLHHxIMVAFs7UuuuErCf2lDJFLC7qbhJbezfduFywYV95CVzH0phdnjYZSeNW
         kW1JcpnXP6yZK/5cGHw0efH10VszwGCyG9i423p7nsbJFlOzLL3l38e9ufTzGzjxuYUE
         1iU4DG9GQVh/bk+7bPe3r1kigtVLn5oFrYDOK9FvyEeRoJGWvvKLBh7ySc5svpxOqoXr
         73gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505055; x=1796109855;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQkMMF/iZtl8nyKPPF76wrTKqWng+NcxYhzPMVXCFxw=;
        b=LuZi/6ffynkjecufSZb4LhjtIAxzhXzlV3KqARaKxZM6RZGFQtsFIkaHOz5fL0pTiC
         7lr26zVmSRLFFOwU/8vjp/jyVFga7qWN0BM9vEPqfVEkokrLC4ND3SsjomS8F/AU/x0Q
         NQGU5cKdmIZv+2E+fgmRZqxW9ckIEMrbPPBZkoPkPRfjs56y/XpHX5yt0WFVdyMjeYcI
         c8iCUrdQChom5hMJQw/VgsvEgy+r1I+Gt8i0dkKH7NpxX07Ehl9MJ/0IN6cJG9McI7r4
         J0wb0PkhjS1BsCas3TUpT0C9Wa3OKMjg8vm/ROdPuvM/WAuGldOFhZvb4gyE6IeRCgv+
         mlRQ==
X-Forwarded-Encrypted: i=1; AL+hErG1lQz2h0J6WxmzLaT1u+tqE7aBvDfvnBfx+mYYKHx+jWoSwVMjVauHSsLibKjICzfDNDDAuPLdGPrnt2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jYBPl2Bje+m1/ITygtpj3WF0zR8+dPoYAm0v5xmP6z44DhR22
	/kWOKPZUtzUBYa7ise8xTChNZ+1Vjb9rjuitPJ+hgRcIpnDUQxL4ibQIJKHjmmQbFEclAPfqfl8
	YtNgLfYPB/qP0H9QWi9P34A0TEsRyDn8=
X-Gm-Gg: AZFdTZcjUDYtt6/Da/3yfREFE9K1GHipOhq9U/P/LoEB3q7g4OU0Cr2J9nF7Eyf2qlH
	FFwCJeojQGcvNVDUZy2YcpQv1576/d607DT5176q39f4PyLZwyAOvJ9wOk/0xbflRuqFbe5X0UT
	ArHLokB7TyUu6lGDi1maqULqam2KOshYgXXf40rLcSJ9c4vuoH2BfLdJJVRSRVI8gayo5cSgnlv
	KsslDOajrgBCCZ0Oaa6d+fR3/YEgcSFJypy0umCvbd+iEdaQPV64iovdnSABArAc+1ztETmegPq
	hc+eSPyW7hol3AmGhW7MPbVPQc13NhazcRq6i8ZiWWizvEEgGozYomnFqhIguvJ4PjVAfe648dG
	vT8aGpGjRGlkBtf7db1dqJbLOap6a3DyQFebeA6mtemeAzxncXXdXBW/N/y7kQ7uYeTKn8IWZIc
	RPG82PwUD1nm5PAPc+oLeXWQ==
X-Received: by 2002:a05:6512:10cd:b0:5c1:a96d:9120 with SMTP id
 2adb3069b0e04-5c1bc89c0d6mr2930509e87.19.1795505055133; Mon, 23 Nov 2026
 23:24:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103084638.1190232-1-lixicaicai@gmail.com>
In-Reply-To: <20261103084638.1190232-1-lixicaicai@gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Tue, 24 Nov 2026 15:23:38 +0800
X-Gm-Features: Aa3M54ookgLsrqjSC6-F_GMLxVqJAW1i_-P2hir73PZVimwmsAHCWTB2AmYUUTI
Message-ID: <CAJhJPsV+1e6=o+yafDcxet=W=xh0xkPH5GJ7riw=BMyMs1NXnA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dmaengine: loongson1: reject zero-length sg
 requests in prep_slave_sg
To: Li Ximo <lixicaicai@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, linux-mips@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wang Haoran <haoranwangsec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Could you please add a cover letter in the next version to provide an overv=
iew?

On Tue, Nov 3, 2026 at 4:46=E2=80=AFPM Li Ximo <lixicaicai@gmail.com> wrote=
:
>
> From: Wang Haoran <haoranwangsec@gmail.com>
>
> dmaengine_prep_slave_sg() forwards an sg_len of 0 to the driver
> unmodified. ls1x_dma_prep_slave_sg() does not reject it, and
> ls1x_dma_prep_lli() then builds no LLIs (the for_each_sg() loop body
> never executes) yet still returns success, producing a descriptor with
> an empty lli_list that is queued as a valid transfer.
>
> Reject sg_len =3D=3D 0 requests early; a zero-length transfer is meaningl=
ess
> anyway.
>
> This issue was found by static analysis.
>
> Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> Reported-by: Li Ximo <lixicaicai@gmail.com>
> Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
> ---
> v1: https://lore.kernel.org/r/20261026115113.3359939-1-lixicaicai@gmail.c=
om
> v2: split the two independent fixes into separate patches as requested
> by Frank Li; no code change.
>
>  drivers/dma/loongson/loongson1-apb-dma.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loong=
son/loongson1-apb-dma.c
> index 89786cbd2..e7eb40584 100644
> --- a/drivers/dma/loongson/loongson1-apb-dma.c
> +++ b/drivers/dma/loongson/loongson1-apb-dma.c
> @@ -302,6 +302,9 @@ ls1x_dma_prep_slave_sg(struct dma_chan *dchan, struct=
 scatterlist *sgl,
>         dev_dbg(chan2dev(dchan), "sg_len=3D%u flags=3D0x%lx dir=3D%s\n",
>                 sg_len, flags, dmaengine_get_direction_text(dir));
>
> +       if (!sg_len)
> +               return NULL;
> +
>         desc =3D ls1x_dma_alloc_desc();
>         if (!desc)
>                 return NULL;
> --
> 2.30.2



--=20
Best regards,

Keguang Zhang
