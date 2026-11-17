Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794947299;
	b=4o+OWrs9m1Fl57VGVzqeLInfinDha0ZsU2w46SDaxwJo0us12mj2YuQ78OCXFtVVuoqP
	 Np74DbsRQjbJvw6Mp+9mO7xLuqrAu0p3/67JxgUIn3oTzcNTc09sr11jAGKOyBWm3xmCA
	 fkATbWbBHNdS/BOuaFx5FbOyXP/7MiU+IlEIPJt574dOmxU1tn6Iz1hUJqylJk63gNZSm
	 hpB37F35+94QtWJr3FnryQWQD8Gmi+pyCGs42KtkwufNLOFBmAqFvpWwF85a5N6jjXQpk
	 bPhcn9pMsxZSKU7WHaE648cfvvOI/+0Cf3b69JzNSo9ShHAcbTZUAg11+rNPNzYnBiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jVQoF4RBBvw/4PYTHk8rllYWT3NYnQtky5aIjcCOwqM=;
	b=xdXbiQdeEPxDNUu/QmhQXQLamwYs4RbLjiXINp/uipIjW/OYePkjZdWuaPJqAbPzWaTJ
	 JQSV8veBmQ4JriGjYyblUIZM1q50IbR2BoadF2gExfyWSvUMiQJK1AxyHpbsCbSDMXLge
	 uLnJd38/9YxrlhFBmdpdbKHu+bMBRrLqbtRCQYflwEXb+6zWuV8mNcUZIRNtap/ky12Gi
	 D4gR37H0RBJeRq+49R9ePIfdFCsRS0NTQOyLlpJxEjvMt03/Qza7/LUz8ngtkNRJ9WBXM
	 8+keFMtEDeSiD//tM/RGseE9d+TyfZ15FsTHvVHYHVscwjxr8U5ykXIX6m2JW3o8COQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LyBhKerR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954FC606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 954FC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LyBhKerR
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-54492d8a988so52971cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:28:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794947297; cv=none;
        d=google.com; s=arc-20260327;
        b=sOKl32Tgxxhm4O83PR1KPVBO5+LQRRR1MgqGdxRTFLmMBUOzFj+JMx5GnHHVujwBMb
         UwtkKnA0GY4jRIhlGV75WXhAbHC0RcAI2J+hMsrV5VRcRj8VuWz2vh+oD0zARKcZ71L8
         tpl2sRWjXE2cY/gc8CHz0OHK2LE2Drcp/VGi46eWYJjAXlDgHkTXV1U2VGx+uq8GXHrX
         iKS2n2WMY4myrvbpsbwze90bcOOnlNr7TnK6FCz9MSFMXEU+/4E+mlV9X+VxfsokNMRO
         rcxMOK8rZHJyhVGtO+2cEie3B9W7YDWU8A8pC0GdExsmc32myZeuWVwQ51zOt7UGGlhl
         PTgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jVQoF4RBBvw/4PYTHk8rllYWT3NYnQtky5aIjcCOwqM=;
        fh=HBZUNQl7K10naiiWET+9/xjzrrvJs9jgC6xzOb9l3gI=;
        b=IkKK5muM48Y9Z9HGXUSGXgAD6VX8SG3oT6FDUMsTav67bQY/wiQvOW2/I94gjZ7aae
         GfRy+pXMsdxeBlkkQih/oQFbtLYW0d7gLtQQuIUiaO7iMjoL9C7zWMYw4Yp4dS8q32Jb
         jUIROlqLNeFU8aWld5ro1gxCwXgW1hxNEJ2ISbGWvIhVvGPXcQO3u1DoFhumL9QN8Uqz
         DLwQn3ZwLGg6JKMzz6LmddCKqx4mXitSLIZRF0hry5TOs7j+leRCltaqwZLcl6956r1g
         WvCn3rtaebIWyoAS41dawwYBaICMB9Oji+5xxUR5NuhuDYyTupRUe+SrxqFbrwCwBR8/
         a9qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794947297; x=1795552097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jVQoF4RBBvw/4PYTHk8rllYWT3NYnQtky5aIjcCOwqM=;
        b=LyBhKerRYtuPj3BcqDX6+hcymxHUISw6M9iRDIFKDhl0hzuI7VDwIoryzaWbVmStwk
         55VkApnp+qQsX4X0JKiLJzofoqFfE2OaBypLNlghoHCv9jyGHreheBvOCmCcLILqPhOE
         MLLw9ictrMiqFroCF3sqwCzV5X/IJFXCc48Dpkuu3nkRkPdHltOHWhfKpaE48loayk0w
         au46gMa60MncIuY09Ngnfuv5e6FASlWZmx39RFRO991zQXVnsGbckNz7P1iOTKxzhWQq
         tL+H5JUGu1suqwqhTnIcEeKq3noF3pi32PjdCwJIy9WoJ+D/6vggHiLhJYvZYCmSLEK7
         pn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794947297; x=1795552097;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVQoF4RBBvw/4PYTHk8rllYWT3NYnQtky5aIjcCOwqM=;
        b=b7jAHkmqsl2C7Y0R4DjVuUB22PdaKjvBsVQTI0kqLM4uDUEBLGeHQNoQJvLIq/Gyc4
         9K/uTjj4N0jIGIE4b3osVpx7mH3meUIUt7WyIJyAnXJfYx1RFOfGVKmhkIVpPjMkI4hY
         n/yoqZgdzISeFP3IF/WxZP00wOyuwlZTQZFm4xQ1mxoHrAtrORLQwN7dhMrgqVj1DeBy
         q94FC6s7u36yuv1ASPZwsXfTP/NuRSSR8+l5k99ETsfaYLdjQ3NNTQEaYkag4QIt1cvO
         Zrm4mM4OgS1PqpsClbr4837kN5X+C6lj7zOannWCCoxjMbEnV38nIflpzHecoXfk2OdQ
         YuXg==
X-Forwarded-Encrypted: i=1; AL+hErEj8dEBvSlZn6umX/EIhx9IGq15M2XxDJFdf2sAZ8kNlHMDwrlORtlQVtycEZOyc4Bt9de0bOLZ9OKlvfI=@vger.kernel.org
X-Gm-Message-State: APuU4Z88k1rYuqB6uMf2Bc79YkASF6k/q+6Ldu2PHxM+DB1fwTkOnz/W
	UcQsyhcAluoZt7DEL5izfIyeyxKA2DAH9HvZGF8CvhqWwdqMsMhgNP8pWiPeWoWpGzvBbqEeXp+
	nvz05InEkzaQmAJuUFUgAeWR4PCRY6lKtdmNPR+zl
X-Gm-Gg: AYBFou2gel+xvGkgEfGdsd0nowzh2sipoPUXkepEsdd+z3Rzn1X544seHQyNq9aaANd
	qOvooKVfsez9uLWAY7hqwGWSX7+5uSKWMVAkRgDCtvODXdXgPjCAyAkxuu1AUoxUziEWZoioiHc
	7zLfheTXS5IR7hYDe2whknXwzQA8LIAD5RFFwNo8CpAgQPrkvtwrAbbqTUIqe04uGHhsO8ci4rS
	S5/Dg1pboKU6Vr8jg7pk9CMgp9BKPp/oQrWrtqICTIa0HOPULPqzZ+42ziOlUdTRVNawpywzwdz
	Z+J0vPE5UxmV1RcM5bmARB5HxDb+tmFZSMhVKX7Sunqrvm9aKq5L1RJ1RJR46F1c+0UQv8CS4vG
	pDAuQ9qSq86HxXZHHW+4mOpAsjcjwHGA4HI/bQBkpum5wM4FABgNNkkQ3EYXyqnjYIw==
X-Received: by 2002:a05:622a:4c14:b0:535:ce3:ee07 with SMTP id
 d75a77b69052e-55d5c2cee39mr65141cf.13.1794947296716; Tue, 17 Nov 2026
 12:28:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com> <20261108223913.3624571-4-irogers@google.com>
In-Reply-To: <20261108223913.3624571-4-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 17 Nov 2026 12:28:05 -0800
X-Gm-Features: Aa3M54pKTQsa-oflH9hUV5D2o7s2OGZET_t0xpfakeOUoS7f9VMMcgCU6TwJrv8
Message-ID: <CAP-5=fUUatDonEFfc4bFAPKgOokjn8vEOPUNEKV185-g16U-8g@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] sh: sq: Add missing kobject release callback to ktype_percpu_entry
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Rich Felker <dalias@libc.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-sh@vger.kernel.org, driver-core@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 2:39=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> In sq_dev_add(), sq_kobject[cpu] is dynamically allocated with
> kzalloc_obj() and initialized with ktype_percpu_entry. When
> sq_dev_remove() calls kobject_put(kobj), the kobject is never freed
> because ktype_percpu_entry lacks a .release callback.
>
> Provide a sq_kobj_release() callback that calls kfree(kobj).
>
> Fixes: d7c30c682a27 ("sh: Store Queue API rework.")
> Signed-off-by: Ian Rogers <irogers@google.com>

Gentle ping on this patch (moving SuperH maintainers to To: in case
this got buried in Cc:).

Danilo offered to take the full 9-patch kobj_type::release __must_init
series through the driver-core tree with subsystem ACKs, and this is
one of the last two patches awaiting an Acked-by. Does this look okay
to go via driver-core?

Thanks,
Ian

> ---
>  arch/sh/kernel/cpu/sh4/sq.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/sh/kernel/cpu/sh4/sq.c b/arch/sh/kernel/cpu/sh4/sq.c
> index 908a8e09113b..f33864958487 100644
> --- a/arch/sh/kernel/cpu/sh4/sq.c
> +++ b/arch/sh/kernel/cpu/sh4/sq.c
> @@ -331,7 +331,13 @@ static const struct sysfs_ops sq_sysfs_ops =3D {
>         .store  =3D sq_sysfs_store,
>  };
>
> +static void sq_kobj_release(struct kobject *kobj)
> +{
> +       kfree(kobj);
> +}
> +
>  static struct kobj_type ktype_percpu_entry =3D {
> +       .release        =3D sq_kobj_release,
>         .sysfs_ops      =3D &sq_sysfs_ops,
>         .default_groups =3D sq_sysfs_groups,
>  };
> --
> 2.56.0.455.g6c5a503b38-goog
>
