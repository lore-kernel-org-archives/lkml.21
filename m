Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795428763;
	b=VxZ/3OHTl9ULjxzhxSH6Rtl4kbiHYEr1RCIALR2vM7sg73iG5UWNP03NPDJ2owqYbuMq
	 /kUcluSyxEZeRAeIJmWTKeReNQ1NNo1c33CeSJJzdBt2Gqr7gfl6UXh1sdeYf9PBTVc6K
	 CMUdT/cgrf0vYUUm/gYlcjtImS201iGG3TCeMHjWhaxuIHimqlAlncuv6xSN0hZ964Hu2
	 JpT7KDJw1FTt9RFEHBSW+rg016yp1cIgLEpZYAwQB/Gkcf2S9OBcIzOlpSY3LGZJ1u+y2
	 ZRYgQGv62SQTKLEcYIO5Mc/9Ao4JpzcmnxvEfB+wWk6lSidfPjicSo7ZDmOxjiCWaHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z6PZb3pWfu3DBOMyeBvBYRTT0i6m3apihG5iiqFet2Q=;
	b=pEKdVwNomcxw20A2TzAT69zqOhC69eT8aV85KP8O34IadX4/5BQIew7ddN+FHXYNzwxn
	 HB2QX19slXoCjTnkjfDJrix5zDQyqQ71vOzge6pHAwJbgnEmJVvTleqwIPz6uLUrHiV8c
	 Qkl3hgMhaKTu7/7XkaHtiA+7UIZVcmdJnMmqLi1PRhc1wICNqDICTqCYHozAiZuyac8cF
	 ozpK6C9Vg6+nFfWZCLOQENOiPZImNGse1e4fgSHhzX7agDEDEAXiqrFBUUD3Mrm8txqSG
	 1eylsUP07rydqHgkQ+sMnRuAlREAqMMYNzS1SRyptSDs32MKi6tr+3lxD9yZx66wnRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=MqfY2WR5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8CA606A330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE8CA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=MqfY2WR5
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so503852566b.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:12:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795428761; cv=none;
        d=google.com; s=arc-20260327;
        b=hFGYdH+hrTNUkCrXONcQGl2myEuVDw47G1KqElYZvcnS2mUPWmsCM1TZR/UdOKPGLx
         JOyMtIF7nYF34RRP/HD99DmUwdOMPCeQn1Lz12bsKnGIaF9H5jvjdHCAXgPTtrxgdX+0
         A9eJk80FdnvFNtILjJVEhAhwN4y6Ou+G8w6o3DPDJ5SXWU0Enl5bgEEuMFCPHHkP4Ew4
         326Fy2kREBTkOspznM9a2dwubAG6dr0avcUMGsRoL9LGsVrbQMo6N1JyEnuVFi/c8jCG
         Nc2pFGsIRvH/rMGFY3X2XpsldGaPNsRdlNw6DyWnIN2AMTEBWptzDFXakWusbYaw49yM
         jVMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z6PZb3pWfu3DBOMyeBvBYRTT0i6m3apihG5iiqFet2Q=;
        fh=q6ZelaEQjZ0k20iyA7tcpB4DCVHTEZALfUlq1tExBcw=;
        b=Vl4G6Zl0caViY7L35FB1KmBAlp7yEhV45Mv18hJWZmgbZCIOD6yiWBgF4f9Df+xcPn
         Xkr58vlHMbamEt6vAp28BTEZ8moQZHfkv6u3MxxdBjEXgEByENfOAo/4Ee7J/9+UJlST
         bO2MiXBgsqBVZMjdVE4US3Nzw+1Q2oESXGvdcDqQZLlesadN4XbVdA17S353G3By91AQ
         9mH6VVZ5Db9z0QXjBLNlXvCTdb4/DdLIBM2kg4or/Dtf7jIprj5+9zYSbDN4UM84LUrM
         JIar9p9QsXxgnp0X44V7hWwaB9IupjNbKFDOuApiXrVJ23kKnefwwmtoLRb6Mz/3AFW4
         oxag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795428761; x=1796033561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z6PZb3pWfu3DBOMyeBvBYRTT0i6m3apihG5iiqFet2Q=;
        b=MqfY2WR5A+tGruAVHjRKrDw5GIaiKkjvwm6WEch6FTIYRq8BLizWLXn5zpDnFwRRwA
         kwN6xPmj02C+f4K6Pesc/ipxTUWAJ/jX7Z2eV2g3S3/G9Ri2i5mYzwiFBYWE4mKlYNib
         JaEKi9jzGkUyZfJGjcv+VdtMrCTPstBpK7aXngyyd0uzeK44uGws21jQUKMvEPyX72E9
         nu0okVVQrxrFvL6Nj9PKzFOum9ntDS1PavLl2r5c/4y05NfY1cHnTTw1MJUAQvpESx1Q
         qXotT3VmYjML0hmwFGL+p+w5OsqphEiy5AfG0/ACGnd6E2yJhxynpmSns7W94umSVVpc
         w4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428761; x=1796033561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6PZb3pWfu3DBOMyeBvBYRTT0i6m3apihG5iiqFet2Q=;
        b=mi/slZV2lKZaXhx+R1T5UyqNzGf9I9UL7Ugmf2BoCG/ivszb9Mz8MI1QivUoa9qRUE
         8J90cWx8k60PHQDOXj+9Z2eA5pS6LiVD21ZSkIOZkNTiUTZC3CrpAi2f1KnZmwD68NV7
         YGZzCDecx7BsglO7wNe4tp/tKDDIq3cvz9gtluyJIp0l5ratjii4f24xsuUrWQ+fBZC4
         YQMF9h+chPcUrCFvrMerXPl92C+tVrPLIoZ3+4jky7eEdBI+dgpw7aZaidqR3o4ZLBT7
         n7l6zsxpJ1FPJJUTaBaVQzBgScc9Jv4eUrN8vKE1vHE/8WHZPw2/KcwgO2jg/MiqmauY
         NCyQ==
X-Forwarded-Encrypted: i=1; AL+hErHJJAKDM4vQifUtiiUKPnY2amN38WSEFQ3wepPx2zN087fhDaGA5NewrZTmKbaQzzvlf+sAG+8BUiv3ZXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YZd8OWl2yErK6QZZ1x7ZcgvOsrKbB9bH5kQqKpU1XlUORMWgo
	hWAyU0CB2m72HbU2hDnndYtBl2yLgJ2qNQv2jfDbNMtAjmg/MwIiy6vcWeIywvEco/0PeHxasCi
	z0ug/xmRbNRSth5ivT4gKV+xVdNL0ymLGT6kWwQTomWPLdA5aHLTp
X-Gm-Gg: AZFdTZcTJVkqUDTViNvOapzV8sTl9kSxtCZO4XNLJw+p8tz6v2EtE47LFeJD/wPjdrD
	mJ0xA2klks0vcUjs4z085jyIO6W0DeggEDYPP4BZaJc0SQ6y8PnkEedD9XEYE6tk1KCHqhtA1RQ
	P2kZ71fIvQBnmoPSOwah86bnrYX3vrUGBnIzDvokCQMPutm3TG6Z9TwyKd81ghLO6CXUHGhpMzy
	gN7O/vvtvxgRq573Uhm9UcPY6dQZ5ejZ9jOvCP5cSwM2o6tUv86x1OmcVNAdfI9ohLqR+xxJUEX
	R2dwgB5P6u0x//2Jx6OZLPCnIRy1UfxTDSwa0v+EUwAeDS7dMTDaB676pWx0vVFlrYYVadZdkmS
	jttl0xKP6IxmXCSvafVVOANIZAW0dkuaqGsUi2ISPROn0i+6VQJN/42fETOXdj+91mfcZ3JnaHM
	4sHGVzgRl01OSNkZg=
X-Received: by 2002:a17:906:115a:b0:c3e:ee86:d2c with SMTP id
 a640c23a62f3a-c513a866684mr820899566b.27.1795428760997; Mon, 23 Nov 2026
 02:12:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-pcie6_fix-v2-0-2e0fe615d90b@oss.qualcomm.com> <20261122-pcie6_fix-v2-2-2e0fe615d90b@oss.qualcomm.com>
In-Reply-To: <20261122-pcie6_fix-v2-2-2e0fe615d90b@oss.qualcomm.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 23 Nov 2026 14:12:30 +0400
X-Gm-Features: Aa3M54q-Xar7VXEu12WPkFbFHzHu90UHCgQbyjxEoWpDnyAZhVgjhAvqOSDzA9E
Message-ID: <CAKTNdwEuu75UHA2_r9FLmximPjXVHp05Aztk201AjnFGcGSXRw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] power: sequencing: pcie-m2: Add support for PCIe
 M.2 Key B connectors
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krishna,

On Sun, Nov 22, 2026 at 10:46=E2=80=AFAM Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> wrote:
>
> Add support for handling the power sequence of the PCIe M.2 Key B
> connectors. These connectors are used to attach WWAN Adapters to the
> host machine over interfaces such as PCIe, USB3.1 Gen1, SSIC, or USB
> 2.0.
>
> Currently, this driver only supports driving the 3.3V/VBAT power
> supply along with the FULL_CARD_POWER_OFF#, RESET#, and W_DISABLE1#
> GPIOs as a single "pcie" target, since Key B Adapters expose only a
> discoverable PCIe/USB interface and no non-discoverable bus (unlike
> Key E's UART-attached Bluetooth device), so no serdev creation is
> needed. The other signals described in the binding are not supported
> yet.
>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.co=
m>
> ---
>  drivers/power/sequencing/pwrseq-pcie-m2.c | 70 +++++++++++++++++++++++++=
++++++
>  1 file changed, 70 insertions(+)
>
> diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/se=
quencing/pwrseq-pcie-m2.c
> index 56c5d51293c1..8af4a059b596 100644
> --- a/drivers/power/sequencing/pwrseq-pcie-m2.c
> +++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
> @@ -39,6 +39,8 @@ struct pwrseq_pcie_m2_ctx {
>         struct notifier_block nb;
>         struct gpio_desc *w_disable1_gpio;
>         struct gpio_desc *w_disable2_gpio;
> +       struct gpio_desc *full_card_power_off_gpio;
> +       struct gpio_desc *reset_gpio;
>         struct device *dev;
>         struct list_head pci_devices;
>         struct mutex list_lock;
> @@ -135,6 +137,45 @@ static const struct pwrseq_unit_data pwrseq_pcie_m2_=
e_pcie_unit_data =3D {
>         .disable =3D pwrseq_pci_m2_e_pcie_disable,
>  };
>
> +static int pwrseq_pci_m2_b_pcie_enable(struct pwrseq_device *pwrseq)
> +{
> +       struct pwrseq_pcie_m2_ctx *ctx =3D pwrseq_device_get_drvdata(pwrs=
eq);
> +       int ret;
> +
> +       ret =3D gpiod_set_value_cansleep(ctx->full_card_power_off_gpio, 0=
);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +       if (ret)
> +               return ret;
> +
> +       return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 0);

Can this signal be exposed as an rfkill device instead? Otherwise the
pwrseq driver hogs it enabled with no way for userspace to control the
radio power, and WWAN power draw is quite non-negligible for portable
devices. Ditto for w_disable2_gpio (GNSS).

I'm also wondering if the WWAN-related signals should be skipped
altogether for non-WWAN module configs?

Best regards,
Alexey
