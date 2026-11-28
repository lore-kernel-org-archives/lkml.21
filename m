Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795848086;
	b=V18doeA5whTRVFQl3z5lGUSxkg+4sFEZYsJwamP40J16HyU8HWA3fTcr2SJr5XbdNH08
	 GTImffvAHsI5KtCSkc2hZR97ncgw7VuA03vJO4rkAO2zywNRsjbFNzHx4pDopAGu/q7eI
	 jo51+UC0i3yZZGbdTh+IUgbJObK8L8w+/PTRgssXQE+qA6FS2WAh0ngAfWecYn/PA+LGz
	 /4DvwcLr83geSHFvbyGdPU0NIL8MB0kvewq9LjmWDKY4Roi46B4/c5Z0wTdfKQcGckcUw
	 iqN6mlsQOKk0iZ/DH9a+jUouUd972Yq8VUuptdXoAcfY3SWjE7AevXu+N/7xeEJvmew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DaFVHHbnP7WSmycrEiEtOlZLUw9d1JnCcfaRLokMDkc=;
	b=STG75ZTqq5K7X8sP+oFOOeI7QVN6Io+sUoe5ihzozP3MmnoM691VN+SugpijrIwGB+tQ
	 piEYW4875RSr904RZM30SLy7Zye+WX/fJ/w00C9Gr73UKaWIEd7vwrf6sTar+rH7yrbWl
	 UtbxREE5Qyrc6OZDSYDG8MD969uKAZ09QneU/ZWVIlOACFFP/XI5ypt9xkF/HXqlGFMBl
	 5Rulbi8Q6Z8B/Vny2ZeshZmwN4mlzEYSdcgMlGkrGWag6NZ8ovAXjn19G1EquOOjb3RbJ
	 zh0fy5AXleo+08WlgEzCIO6RfZcerTgz9bJIHWIp5miSpl1rfIusp4+nR+ZJv4+nDgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fQybSDtB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0207606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0207606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fQybSDtB
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6bab377105dso7793179a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:41:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795848084; cv=none;
        d=google.com; s=arc-20260327;
        b=SwlQItCPzLPDN+UASBMYpWD+OVMwCNW6bHkocJQCzbPknjQeOesFsaVmdeceIXKsOv
         s8V+yQhhAkvyDv4zDISmfKpJKZvOs1lfIhRw1VL02lqj/v17rP2xBjz45rYg593Wotij
         eAR8y1Z2u5TP1GpUtoAre92ei4V9S1OGt1AQEdjxenJeHHl3Lf1D164WQAlNioKgW/Lq
         RoTK1EqZ8z2hDaoal3ZXhVwft57pwL2NvOkZiTK1AzVWJjR4Scf5WZoN4kAM0j0yF0p/
         DvQxtbdO2UIoGiHpdlqgvGAn9NEIGV949Y52XZpA5aI8z0f0e88SaxB74R9aghHo/GD+
         kstw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DaFVHHbnP7WSmycrEiEtOlZLUw9d1JnCcfaRLokMDkc=;
        fh=/1OA48FRwMKnFc2xYw6rOGAZYnTbMP5ImQzIgi3zpN0=;
        b=BBElG+NjJtyzsCXHhIb7fRPIHyTA2p+xPh3hLmed/QOtoqYBjz5xIH+ETRw2mZLVbt
         bgmV8jvwkoziZPsLpRqRvQbpdBs8DSO0JflV3mPFsz7c+AkbWHFKoACHUDtr42LTiqyv
         4Zm/64U7IksGANnmGiQQZ0wIPOAhc6w5pkhBK2l8IJfqK5Hy5iQzFnVFGb0FmLlSoPja
         eNUWe982Qvm60qVIJ4E9C907xcOaBle5KJTmGFgX+WWiQbjbJ69dkJW09026muILVS0K
         U6OEQWxALCb13bUNd7I8jHZ3qff1wUcZbWnwxWvhg3blMxrmRYEPo6UsqikDY9kpv3hE
         vLMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795848084; x=1796452884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DaFVHHbnP7WSmycrEiEtOlZLUw9d1JnCcfaRLokMDkc=;
        b=fQybSDtBSYSP63sA+Dhuxd41ygwl9HyMUjLHfuzEEzy4HfDfta0h9NlZ+MbGd3jDjQ
         MyrsS+RXPcHsempSKS0motl9CACsouVxDgMXbq1dq2Vhtwwyv4EeeBmVwyPuUgCIGvvp
         tZ8/vd/AsFYeKI32awrvcw/FFg/w/xTkxRfcU0pnFjRmDZ1C9fGcP3AnvUHPukCIQeDL
         ft7io6FRNzfgUHOicVdUImV8FKvqrIkeuanuyCEar/uoIzuuC8CWbjFo/EmnKJpYtjqJ
         Szq27lTFmatHrESkiNKOSl7USdwnaalYXGD7yIwhcanP2igb6w44ESO4D/Yvkj5DJ6iL
         RoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795848084; x=1796452884;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DaFVHHbnP7WSmycrEiEtOlZLUw9d1JnCcfaRLokMDkc=;
        b=P4dM9yaQn5NF4JxCnH8bTTSRkd+1glPSoB7CEGqWoCAVw6IwV6FpDFSU7IA+QyYgTd
         bWXumJ1SRQvyAET+f0xhNeqnF39EcWHcedcTWGK9NojXsfWRxRhO2jZ6qGokvq8Mb3E4
         7AU7L3WcHRr6VQB0V/OuGQ8hMbWq86iG55c70SDqvcqt+opUuz37/pY9v0oqJxSdF0Mj
         NrEH/dy9FYvngU+MbZ2q737lhKiSTHzcBBVlLkylVQI9StluACLj8Alz5wqNV903U3Q6
         a0uZ23EuOsbq7TFSfdfUkqkUTquvjX93AqxNtooE56vvTnrxYuFE+g2b4d7yIswGZUKJ
         miCw==
X-Forwarded-Encrypted: i=1; AL+hErE6sA/pH++u5DV2YSa6HV+4+SzQh4SP/DBSnB7ns+pNzl99atSwRt/lW9JwLXlx6OgO9CQfjGHENCS+F1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kdsfASFLwt0qcjjY/YujwvQQeaihG7oSthVRWt7xuqhCTf7rS
	Zjm4tqhQ/bNRp80wY+ZjdzVw/PCzLx0fwPjzNBBXt7suZT/BGZxN8xH4hR+y9NFnfgmWqql0K0s
	kmjS7wK/W4bjl0uJJ/px7P7ZjwcjSXYbHHA==
X-Gm-Gg: AZFdTZe/6ueRA+LGB/6OsBuA3kDcPL42B5fW7xEx8LwQHrsa8H7no6h+vc5rHA4Uzvr
	M9EHvf9OIe9nGXdZrXWaB4vnuvCKplA0UIBC0GoO/3XqF5R/aUwotzPcHePSkmLj7Wb5G437Usi
	QP5eOXaSGAwBpIrXu8O7kxNgvpS7+OuR9pTbBMiynh2KfXGg8qVXTffBtHU0cy1sd82qVWeHL2A
	tQt+A/qiu3MLoMCPLigoW8LTYIDkmbrvUDBeW7HWf47/9idA/S1UM2cViAsSamT9+kqKcWlF0zE
	WBKdOuOFlTXiuZshwOMHigY+AabJ79t4H+sy0l3Y+ER8LeuSKI6hDpTpP2FbhlGvGkHa3xCiPfi
	oTA9xTAGTZHonrKcMcyJSI0ySqx1RL7qe++CpzDVluMRE8/tdBuBZl4d/eD+qP2eFAA==
X-Received: by 2002:a05:6402:400f:b0:6b8:f674:e099 with SMTP id
 4fb4d7f45d1cf-6ba37eb3c34mr18985707a12.34.1795848083935; Fri, 27 Nov 2026
 22:41:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CA+m4KrC5=QzYthdWOyeJy68OrgTCrKdYFRovD3vRC+V26NkqGw@mail.gmail.com>
 <CA+m4KrC2yADABquJgRREJCfX1dXihqV6udihHm=WUsuuGDnYaQ@mail.gmail.com>
In-Reply-To: <CA+m4KrC2yADABquJgRREJCfX1dXihqV6udihHm=WUsuuGDnYaQ@mail.gmail.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 28 Nov 2026 14:40:39 +0800
X-Gm-Features: Aa3M54rIbBUc2-WSIwCdRQCLMBJaGAzOY1ddUipy-U0olltRp5nyMORY2PJkeYo
Message-ID: <CAH2e8h5B5x_5CAvLgZz737bgYPL9MMhRcck1bdsy+PyMUKW-LA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] platform: arm64: huawei-gaokun-ec: Validate the
 PAN ACK bit index
To: Lee Youngjoon <getfeus@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 3:08=E2=80=AFPM Lee Youngjoon <getfeus@gmail.com> w=
rote:
>
> The UCSI driver passes GAOKUN_UCSI_NO_PORT_UPDATE (-1) when the EC
> reports no port update. gaokun_ec_ucsi_pan_ack() shifts by port_id
> before checking the sentinel, so this normal path evaluates a negative
> shift even though it subsequently sends a zero mask.
>
> Initialize the one-byte mask to zero. For an actual port, check that
> the index fits in the mask before setting its bit. This preserves the
> empty ACK and rejects unrepresentable indices before contacting the EC.
>
> Fixes: 7636f090d02e ("platform: arm64: add Huawei Matebook E Go EC driver=
")
> Link: https://lore.kernel.org/r/20260607214621.9586A1F00893@smtp.kernel.o=
rg
> Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
> ---
>  drivers/platform/arm64/huawei-gaokun-ec.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c
> b/drivers/platform/arm64/huawei-gaokun-ec.c
> index abf05e7ec..95e867596 100644
> --- a/drivers/platform/arm64/huawei-gaokun-ec.c
> +++ b/drivers/platform/arm64/huawei-gaokun-ec.c
> @@ -458,10 +458,13 @@ EXPORT_SYMBOL_GPL(gaokun_ec_ucsi_get_reg);
>  int gaokun_ec_ucsi_pan_ack(struct gaokun_ec *ec, int port_id)
>  {
>         u8 ec_req[] =3D MKREQ(0x03, UCSI_REG_WRITE, 1);
> -       u8 data =3D 1 << port_id;
> +       u8 data =3D 0;
>
> -       if (port_id =3D=3D GAOKUN_UCSI_NO_PORT_UPDATE)
> -               data =3D 0;
> +       if (port_id !=3D GAOKUN_UCSI_NO_PORT_UPDATE) {
> +               if (port_id < 0 || port_id >=3D BITS_PER_BYTE)

This is right in logic, but we should follow the hardware fact, this
tablet is designed with two connectors, even if a new product with the
same EC is released, it must not have 9 connectors, so using
BITS_PER_BYTE may confuse us.

Best wishes,
Pengyu




> +                       return -EINVAL;
> +               data =3D BIT(port_id);
> +       }
>
>         refill_req_byte(ec_req, &data);
