Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795327281;
	b=zrVV3VEuE/nhthwbHxvGfQiTwygSg4GlxiDhrOrmA3c8eB5KeyC9q52iBnH6IjK2apVp
	 Iw/8rHxK9wyugaJYZYGcbk81sW38q9TA1jIBnN8bgUkKTqkLpyxHsOZWclp/V+B1eyh9I
	 En6g9jWBmPhAgNS9UyLZ3MVfl6J+2TLD0aMCl3pbP1BvsHPDCs62CDAqkNH6X0Y8GAcFL
	 7gWQZ9AbXEI4NHOdIH+GoFAW3VK4/T6wr1i2RcRngbh/hq9iEJqv8VfzfVRnqQ+ybarOE
	 WCykLg7q08v9CvyjXRlOMK1Kpn+iSnJLkuSqnmFmcao1Z70Ee3/LgB/RM9h4B/sRsgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=o+5QUw2PCrKwYeqKNjiahZ51YG2l39veBudVRc5XYKw=;
	b=jMT/mOxVKqd5w7JDcGlQGHHkOSwUFj25EbzMVKLI+STTdsIhkD7gJ+u8gIjLg7QzZG/K
	 Ws2t9lHIrMY4bW1pdM/92VxatAR1orAu0WYNqyZ3P3Sl3aYyDZyIc6c3EkKMRO8sqCFVn
	 SCmeNMIHSp7cHk98fZ+gROEmLowgGqEcLwzGm+ll9xxVrPzAMVRQDBkRiz0toijbCxHKU
	 rXQgEumFz7SgW2SUDX2MJjBzwYt0kJ86DLDALPbVnML5X2WJlZx1tYvMvcwdUaTUyFh37
	 t4pbXb7Dg2hvlPJ+RXpLX7WvY3Ya9NCWGAS655ek2JbPqP6Td9/asmVCwj4KCEaFB6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6899WkA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681FC606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 681FC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6899WkA
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f20b304c0so224359585a.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:01:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795327280; cv=none;
        d=google.com; s=arc-20260327;
        b=fuuSvlHtqDp2CdTejG1EKXlPKyAc/amTxlO/QrfM1wBxhasp0uws7pkvf2PGr+u9nN
         Z7kamPGNgyZsfBwrex3VlEJrtgBxFV14QwlTykYaImqz6QcPt5sAbfTqGLLID9cKf+FW
         GX3nkzNj/6mw1pAQwOhUsyrtaDJ3+skGCKDMyypnyBMEOxMbvNXyZfw72wxhBv8R5FeA
         X45WDG9+dJrzjUo5RKzTrHkPEvDmOGD45rNfQ+p10O15QAKg2s62QrFtqj9qCNluzt0N
         CPcTr0h5kMNuzP/dcXv4/8pKeZsH8xM7HoZRMYelrBYjiyCp6gkPpX5S58Q8c98x1d+w
         ZbcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o+5QUw2PCrKwYeqKNjiahZ51YG2l39veBudVRc5XYKw=;
        fh=KVJCSTTxtPt8wnQZu5YxWeloSjZDA+wh6sV1c7/qRlU=;
        b=W7moZ74s9CYQ+IVApmCsJWFU/IeVqJ1YzIK/rHz3nJvriE1Qx/Od6yS2i+onLITSri
         miZLadpMamYmA9gm+VlIeeZOn0J4wfXcfIg9eH/qq55jxNqLWO1LInk3W7p7gxdE/zKX
         VS17N811BekCfvpkWK+QLtZb4Fqt2GYDqxPyjl0avCpxm9X3YuUqi+Sc6OPRc+UWrqqb
         7zkHnCesMK4H2QUre+C3ZzDtb4iV6iEZU0tZAkQ4deb5wDpoFM07+r82FK4OVIpoWQnE
         YjJsEVpCt/0eFVTf8ntt3uL18No6aZRyKW57o7o6XSiP1dF05QiAFEumVXXTZidvONNy
         4QkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795327280; x=1795932080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o+5QUw2PCrKwYeqKNjiahZ51YG2l39veBudVRc5XYKw=;
        b=x6899WkAzHC+kWY44KXr9gGfo0A3Qkx9xVv6Qn69dxlUyYMpx8/+sL/LHjQsn5jmA8
         nOzF5xI/z9W40rv+Ive0EParCYxsk45env8P3oUndeU19XR9DT4q3Sq/LOVJwPVMWP0f
         jpJIZiL1CYYlq4DLvI3Sy17Y0WdjI9iaHcUDTd0G+9VTfKmQnGLzXDKby1Fy6wxnaopF
         Rq9CZQqYNV315OM/HVR+kXfjlB5kUa7Z/03tlFxI3PMdz/fY8Wc5MOfEMdKmavFZ7QJ7
         1DvD0pqx5PZGrLThaShw2MVS3KL0ag+5iDVR/0o+jbBIOk7ds1ZIW7HDarhswK8T1bhZ
         hwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795327280; x=1795932080;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+5QUw2PCrKwYeqKNjiahZ51YG2l39veBudVRc5XYKw=;
        b=s18GRZl4Si4Ta1FzsmCA9HJXslWQ/BH2mqEylKBnHbRZu4bIeI0/3drxy9fduPlGll
         pMvIOr4YIEwMhA0pfXPrTV+08JL4QRpf6c88OV4UGEkL4pXnlOqhJ9XeupkqYQJyNuLb
         c/b0lioCo0GI86PTGvB+xfrFFalrslnPfse8vy8InWJ+Wzz0gGgkXFGXeCs/pjhYmezg
         HfcwiBY0WB8PUVqNUXmo7cLJEqjnptB/Lewy3Vbf1dC2ne+nX3I1f6f3jCJQJg4myaNo
         GJhHMbfSC8dHn1orK8tOF4y2QT8zi9BS95dasQJEHb1T0FZBS8wpLo5+3RNV5JUTXb0V
         m9fQ==
X-Forwarded-Encrypted: i=1; AL+hErFCowfSKQ374yMZ9tF7tzXDnWojmlVAomDYp7xeI1xZBwW7uzQCs3TxZI2/jSbZJFmBmmE47fnuZwOzO7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BtV7XLK+O/D6UU+/vfaEk04lupAyPSZeP4GAm/vppFgEm58Za
	tpZb+7rfvphdefHkk7+ItPDfRoSvNa9FHt69IYLl2z3B2BNmyONjlILqNOfe5CyfqlJGS+of08H
	j9/uts3IvkA22Kq/SEW8Wj9vpF979qe4=
X-Gm-Gg: AZFdTZeqW/3y2ZbY52zYzGE0ASiAYI1NKJjp6xF/3h6RNPvb9BdpCTzSxjGAq1DigRD
	cvrvRM8zcuNtcUOTWVG4kTtdNH56UHaPDCe1K3KLKnQUzQ9WYN2BLi4U4AXNdkzq+QVaioxQy0W
	386DiB/sA7/P1Hi/gBSoy0j9Y7mCFmyfz+eH7QIA8aTFmvnnjb8Yl49hVIf0AtbwAKw7EiXsDiv
	NEi2edoFjAUspm0iNMxifTm3DdAm0LoU/G5zzlAG4Go1jkIfbPbqPAP7aW/rLggTaS2cif/oyOg
	4pyfBm4VsAf96FN7XokBHWeMJ6Z8K+7HOBFpLWDqRyqQsnCrZl+BBtpPC6Op4/xaGrA3IWzveaI
	UnU8Men71jUrkOqluT+wpw8I2L59rwZfNs5iQGsv2huFHe5+UeCH1MG1GDgyLkKXNCvr1
X-Received: by 2002:a05:620a:6011:b0:949:733e:ddd8 with SMTP id
 af79cd13be357-949ba9ef1c1mr1209539385a.54.1795327280273; Sat, 21 Nov 2026
 22:01:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <5e6ebf68.3773.1a201cf3894.Coremail.220110626hanxuechao@alu.hit.edu.cn>
In-Reply-To: <5e6ebf68.3773.1a201cf3894.Coremail.220110626hanxuechao@alu.hit.edu.cn>
From: Alexey Charkov <alchark@gmail.com>
Date: Sun, 22 Nov 2026 10:01:09 +0400
X-Gm-Features: Aa3M54pZ7IdaxPC9CbQNRh_pul0VaAYHm51kF77R__jgCL4fpz9IgdTgLw29bAE
Message-ID: <CABjd4Yxr9NuLwhsUvvryy-Y5fXhSHUdU239vEW1=M60zVaWhMA@mail.gmail.com>
Subject: Re: [RFC] arm64: dts: rockchip: rk3576-lckfb-tspi-3m: sdmmc0_det_l question
To: 220110626hanxuechao@alu.hit.edu.cn
Cc: linux-rockchip@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>, 
	Liu Changjie <liucj1228@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 9:51=E2=80=AFAM <220110626hanxuechao@alu.hit.edu.cn=
> wrote:
>
> Hi Heiko, Liu Changjie,
>
> I have a question about the SD card detect configuration of the LCKFB
> Taishan Pi 3M.
>
> The &sdmmc node uses the board-specific sdmmc0_det_l group:
>
>     sdmmc {
>         sdmmc0_det_l: sdmmc0-det-l {
>             rockchip,pins =3D <0 RK_PA7 RK_FUNC_GPIO &pcfg_pull_up>;
>         };
>     };
>
> which muxes GPIO0_A7 as a GPIO, matching
>
>     cd-gpios =3D <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
>
> The SoC dtsi already provides sdmmc0_det for the same pin, using the
> SDMMC0_DETn function instead:
>
>     sdmmc0_det: sdmmc0-det {
>         rockchip,pins =3D <0 RK_PA7 1 &pcfg_pull_up>;
>     };
>
> and other RK3576 boards use it together with cd-gpios, for example
> rk3576-evb1-v10.dts and rk3576-evb2-v10.dts. Both groups configure the
> same pin with the same pull-up; only the pin function differs.
>
> I tested the node below on a Taishan Pi 3M with mainline v7.4-rc2,
> i.e. with sdmmc0_det instead of sdmmc0_det_l and cd-gpios unchanged,
> and card insertion and removal are still detected correctly:
>
>     &sdmmc {
>         bus-width =3D <4>;
>         cap-sd-highspeed;
>         cd-gpios =3D <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;

Here you've just used your pin in the GPIO function without
configuring its mux into GPIO. This happens to work in Linux due to
how its GPIO and pinctrl subsystems are wired, but it's not a correct
description of the hardware and is likely to break under other OSes.
E.g. U-Boot doesn't implicitly re-mux the pins used as GPIOs and would
be likely to break.

On a more general point, the reason to use GPIO for card detection on
Rockchip boards is to allow the controller to sleep with its clocks
down when no card is inserted. It cannot detect card insertion via its
"native" CD pin mode in such a case, but GPIO can.

Best regards,
Alexey
