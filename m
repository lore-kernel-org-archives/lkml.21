Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795487936;
	b=QdHpLm6Jn+txz+kdTRYsL6xF62r0hi/87EWhhzCiA+xrQXkSd+C5N3+QmRtf889RmOqn
	 zpu97drGVxhyqBcbtuS8lyhQ3aMEItS3AVVc2DSUlMm25c+k60QuqiHBHfLngYnCd+X2F
	 Ze6AQ0f3tEssm0mR3aLg2bGCUoRNqk3SvPy52LfZtCnNwm7W67jU6g5Ub5XWXIo15/txS
	 UxP5Miu4vhGksQn2HoZPJHvXXxAFZP4NZYRSjXfDObhJagkdxvVlMPEZplT+zl4IImdpV
	 Rc4jy+9rVKLT2uQkcsVGu9lzbn9vb7a0ZBherEDwH/+IZROgTgUK4fiO3o4sfsVnaQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4Hav2tse+6IeayX4eJArYvWYxClzLiqmQL5D/tNprgs=;
	b=21dpmeAUPqGRsNX5/mr9Ohv8KAYvkTYOwFmVnZhsCW2PMBrysbz7vfkTQ05wASiulyxM
	 tGid2f7tPyl5sb3AzN/jlOfvPHLsvoJxlh4r6i/5wKKQBdXhGpiebbdzzUb5Nqtsfk9iO
	 w0m5pXGEu7yRhfd89xI7K+dp7I0qT6Xk+I9qJ8qBULgekbVbT7E6nQcRlw5uU9Sg+huX3
	 1Orm107IImXktUcg2nJBXA3X+dBOrM9QTVmBgA+be1eSj6bDB6TcqEyHwqReEA3FCQ66A
	 5G6ZZmoMJvtbng2eDX+2rLMM6vSMg3zLBkDfLB45BdDvulXb4w8P1lzd/cUgxqPaN3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xoD+G/iL";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE97C606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE97C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xoD+G/iL
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3adfed9a887so36242551fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:38:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795487934; cv=none;
        d=google.com; s=arc-20260327;
        b=GiWZwXOTxD62rdELVkl+G4fmLe3IwlQm2SXQHC06JdjSRcEMKg372y/gFum2fE0fQ9
         GMSu5Nmqv6ixK1dgzFL+gXWk1bXRE6Quf5ulj2bh/S/lyoekOjxxYg3zuh6A6DgS/XsB
         Y0DBo2AvfuhIeLjGCPx8gtH0g+wLGONwLXMzW07geCsVoxkdsueKBz28e38jZzdaClh9
         Uzriv6juzufzLdvbfsuvU6Kj3A9So71ZutRAEsAa++tydGxLLgQkSGRa/YfNlcv815en
         9LyIhdgbGdzB9EzIjUnCw1aaepX2ykxJ+YReoO5YALpYLHXaOGNpT6H5Ti0HzN5dyKIV
         aCNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Hav2tse+6IeayX4eJArYvWYxClzLiqmQL5D/tNprgs=;
        fh=CiYtlA3UagQ8I+39o2sQsiihGwmsCflQZgRsFsE6dPQ=;
        b=fWixGzGS+Ny2pDBzXgML2kgKCbHTJzfVTVUSl+e2u+1IxGV1A5Z8tFyeNiy2tnA3Hs
         7YAYAVISaZVGoG6myulNcLOGPHFSMkp7VQi46lONgNRokD46M5vZgA3UXy35dEDl+Yhi
         JZ1EPMy4O/mS2Tv6WXBL6wbERe/W+7KY7kVqVrs6zQ92g6jY2KvsqTep8KLrdKvwazSD
         KcXqpOq7I0DXW3dYWiV/9Pm5NNmMHjL1tYEuYmUcHoY5wrkauitg+HhTrkV9ymc8SXw2
         JV4ly9NgX7kF6eQBPtiNtub+F/lcyFXM881CCNcuuhSpiW70xqmuNGkjLXWH7OG9MSJl
         /6UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795487934; x=1796092734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Hav2tse+6IeayX4eJArYvWYxClzLiqmQL5D/tNprgs=;
        b=xoD+G/iLC2Qi60bhFhUJSnXDGTaqc34WzPiTT5HSgB5D6PeK9bEHMrEh6LJfIWgFMO
         2tdso5HKdkNqjhedW7aYa1p8BOguqDYzXOWFX6qfzZ7jhviAfKRR7KdCCD+tPoMxQ9ck
         23fnU4g9Wxyp+aiAP6po1VS/Ato3+cG5TepftNKXW7z+2YuWzdAvo4tCFsIwqR8H32Hy
         MQzvuUwhTVHlJ2yv4hKjU3x+gKGKtGoNOXFSGF6fa3ZGTOcr7DL35XsxfcL5tLroxPXG
         dlaAaX7LhPqjLI95gWvpNFcN9hycUENH3iwKJnFUh+29T3ulj1AXlGiwBsxjy71R7iCf
         milA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795487934; x=1796092734;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Hav2tse+6IeayX4eJArYvWYxClzLiqmQL5D/tNprgs=;
        b=Hj8JQXwfOVHakEjNSt515yH6qMT8SV8DqC+BrHnNayXGaiju+AaWiRzVlgx4pMN4hk
         cgalNoC568PYKC9uqiKcbB1QCW7NlwidcIGHgVVZIqI90RfZdzVaPpgQawepAgsYdxkn
         p/VQZhdNOuMhp1jefARyLkMmJiNenK5iXV05Z21lXGH5VGgzcEpeqJEyvesGysZ5t1PC
         NLbhQFMdjBsQu7NRutyXQzWhDodXNKsTvwz/oLNyNlXaGLQ3vrjB2B4Hr/wJMvTbrIlm
         uqA56wh1mIKSsIKkOqpyFphQNRhFhuE8uPa6f5XaXerliFBcuW1Fh/GGi/VfoujSq3jR
         /lOg==
X-Forwarded-Encrypted: i=1; AL+hErF/mDs8wx07DZ+q2xzhBxLTpWhrBQ3WHpzkpUWVYeUxc1IRScrBfn5e6dwaGqYOaXm4FpjeiMRgUdBuSuU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dTv1+KQGnUCz+U3dyUknu9Wgb0rcboV+qInNc/JmgMXG+QThk
	Uvs6I9l9hC/UjEFz2cKbW0WKhBsxgxxA7X+tGIciqcDIfYPjty1P++tm3oEMqiGiq7/FZweDNxB
	HJLjVzpWnqhQ3F2qJJID5OFycm9YYsBg=
X-Gm-Gg: AZFdTZdbgDGxxEoCG/37jNMPVmz8SeJGl3EAINx9IAgQ78+zIEUXCVZeBrGMglDc9rc
	I/huB8uXyw51OCDrpvFg6TApKvYPSQodiFq4w8y8U5KIKYbpZLdCDtgr4rCdGaQ43Crm7du30tI
	VsnGu+DAb+rXIf1Zyoov82SS9QmEZhdpp69Vxp59XJL0n6Yop7hG8J1Ldz0HqWKT3aDxfNwF7b4
	mGkf0oz+OxuKirmfWGk9j1CM7Ar+vXs6fPRwGDLHAkG3ZerFuFiyOqPA2Z9Kg7H6S1KTAk4nYQp
	m9CNkdcw8cqqVJLnEw4HOAa2+YIGwb8lhMidtyHZJnmmwfgrJzhcTQ51Dp5skhxdmwm4c88iuhS
	8ZbCTKUdUr4B9tL+Axk1YKpxHH5Nq4OEKvnuIrhjlMkq/VZZRa7ziLnEHEYN1NJwaFoBEJfIJFV
	zdpli0RETT1QR3VD93
X-Received: by 2002:a05:6512:10c7:b0:5c1:56fa:9fdc with SMTP id
 2adb3069b0e04-5c1bc7ad55dmr3682973e87.21.1795487933842; Mon, 23 Nov 2026
 18:38:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124012837.2071714-1-hanzhijian1991@gmail.com>
In-Reply-To: <20261124012837.2071714-1-hanzhijian1991@gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 24 Nov 2026 03:38:40 +0100
X-Gm-Features: Aa3M54owmmaBS4fvAhNZ-dyZA9dp91Th1OcHhphTXncOy8CVOF5xtAczTloDKLQ
Message-ID: <CA+fCnZc1qd7hpgp1sN00CHw3JzhkhBCtHMjQhw_OKbzfVMeEOw@mail.gmail.com>
Subject: Re: [PATCH v3] usb: gadget: raw_gadget: fix memory leak on connect
 event failure
To: hanzhijian1991@gmail.com
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 2:28=E2=80=AFAM <hanzhijian1991@gmail.com> wrote:
>
> From: Zhijian Han <hanzhijian1991@gmail.com>
>
> gadget_bind() allocates an ep0 request and stores it in dev->req.  If
> raw_queue_event() fails to queue the connect event, the function
> returns without releasing the request, leaking it.
>
> Release the request before returning in that case.
>
> Reported-by: syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=3Dd83b3c49738aea97c0e5

Why does this change fix the linked issue? The syzbot reproducer does
a bind-unbind-bind sequence without raw_queue_event() failing AFAICT.

> Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
> ---
> Changes in v3:
> - Move the changelog below the --- separator and drop the duplicated
>   entry, as requested by Greg KH.
>
> Changes in v2:
> - Fix author name and add missing Signed-off-by (full name), as
>   requested by Greg KH.
>
> ---
>  drivers/usb/gadget/legacy/raw_gadget.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/=
legacy/raw_gadget.c
> index 4febf8dac7ca..33d70b552b6d 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -316,6 +316,8 @@ static int gadget_bind(struct usb_gadget *gadget,
>         ret =3D raw_queue_event(dev, USB_RAW_EVENT_CONNECT, 0, NULL);
>         if (ret < 0) {
>                 dev_err(&gadget->dev, "failed to queue connect event\n");
> +               usb_ep_free_request(gadget->ep0, dev->req);
> +               dev->req =3D NULL;
>                 set_gadget_data(gadget, NULL);
>                 return ret;
>         }
> --
> 2.43.0
>
