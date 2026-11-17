Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794940051;
	b=RxnKlIRocMu0ucKmzq7ppw2b6WEpRslGlzIjz65KfSxsYKKbLXaEEhTioVqrgAotBgo6
	 OZYJn3S6S45bM7aZGecqTifb6QQdisJezGCawRmDDIqgmoKM6yBWD35HlRxy9Haw6lS8O
	 GlJJe8xGdv3+LiMT3d2ByDoEaKUL3d2ocSFMPO1w6b1Ro/7s1P96v6uRg/U7o7+DCZVwC
	 2kXGqPcvwgKf5p+qdc2o8hpbmfZTGvqeFLS56+teos0ZNdgHu1ltADUzdx16Fs+hkutMr
	 xXH+Mkw/eGU4IOf0+Sunf8jblgID1PqYxUzvC/6eZKR6pblfIX3dwD/0GyfUZKkm6Bw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type;
	bh=Ono9E1opT8JaFJyEmNrBRx7Uw7yYbLKTsou3aRgc7Is=;
	b=3j9EIFn/7bn7Jc3ja4b+Da3IbcoCOTrWl+g9GZ9oZf+psXgDVEWbgWfLp+7vTWp/FQDY
	 W0OP2XRD5z6uHGQVCHwTAqP18nVJ81mgRSKwRcQ5sYH3H99pLrOIDiRAoXlgjqGElsiHZ
	 equZj14Kxf2xB582DKlg5XUF2fJIOhNc/a9o4oQk7KnKwDF3imBPdsooxHdwU7Ym9DYsY
	 dg9d8o0i1kgUOVHplZmcndwOR1+YR/ZfsFKOZqq3otKCc8kZk6Uh3ov0szfJY2Xc4xLP3
	 Avc22I3wquBuw6ywlEkDxr0+BV5NDrx3euAZ2ILUXR/GaScKGIfrKI0wxQmjE4u0xlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BvZDrDGn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C0B606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27C0B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BvZDrDGn
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6798eb0d190so3826669d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:27:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794940050; cv=none;
        d=google.com; s=arc-20260327;
        b=EOmMB4FlLz+YXiFrKswPtHi9ksN8Gqj39On4VtFhZaYQm9IKFBhBO4ZVbFkfmymHIF
         pIW0UAiIQ+BlZ829Xompbe9W8bb0DPpyArs3zdE/Ac3qB8a89xGztuFZGbl52RF0quHo
         mhxR9PuquO5MWTNyX7U8SN0s/6jCPbFlky8Oixvvt1kPA+VSe0sYa/SdP6MCKiI+ylhg
         1YP+J2kmHm9NLiy+OVnLE978cM/nW+gnyvEbWqMX3zntg6QYXQeTmQbhqr/qjSunzXd2
         lA3JgXWMN5rjLQVKvyodvC5d+0RCivG0Q3YopHyobSoN2/gOgmA9BI1bgMu2bpR+P8vB
         /7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Ono9E1opT8JaFJyEmNrBRx7Uw7yYbLKTsou3aRgc7Is=;
        fh=UGtG10oDchyOUv/0+axeOtRKgK9Trow/evfdo5ySSFQ=;
        b=FVAo0M7iAhx7EjOsokw2PSkag5ZmtNEuegbudE2kJiA8/sHrEYhX95xmC7DTJuq74F
         TBpVwP45zkLhLbS2jQ89g/Ofn5kJFbwdxDqEJvVG03yLl+8gMPjKXq1NO6/6cngBsgla
         OxdXxAV8NxztwJaEmPJD1T9nrqbt8LhedZ9ewJMrIQSjQJG9rAJev0p5KPbgNMKoUoXI
         XV2aFud1FUgAMJGk4EBmn+wt8QoBJNAOipA+pV49XmZGegbvF5eWq8mMLoBYCWS6Ds4J
         zvkb7zi/U7WTynslUnJdy90CmXjmgEE19iIeJkixGP+AEmH01AEpL5i/KSvxv6ZVgrMW
         4xGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794940050; x=1795544850; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ono9E1opT8JaFJyEmNrBRx7Uw7yYbLKTsou3aRgc7Is=;
        b=BvZDrDGnbVIhIGqiLzY1/S+PkC3X4QadaVcXkKqHcBfAulFtJP5MAp+m2X70IotA+Z
         57CbnVh8+dpGMAKynLnYUVJGnS5JswhcGq0USxKUN8pVfTZh14Pdns5CdXZr+Uol+JpP
         y/c+FhQfUu4/HAWu6R+g92DUsm/gz/HM+Je/YpC73LArF2HAvGtm79wsarJ9z05mLyBI
         81GWCjBZsQA/y8za9+yaekBpwVLioi2bCqTwkolA4OaTQqqmsjljyjoo24jSPokiLgI3
         lRu+SFMtTNDRo82Am++LQDVy5icDANIoQFP7IqGf8v90Hm0wQvXOw3YOfClhWytFgY18
         xgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794940050; x=1795544850;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ono9E1opT8JaFJyEmNrBRx7Uw7yYbLKTsou3aRgc7Is=;
        b=1erwEI34gjQFqmJUNAM0vOxlbQnXgrwE50GGWfmFlgUw942ofFsZ7Vqdv4Tiq163wT
         Kbt7Ly+XBnzWG32j3qdUaPAF0KxM425Bq2UTQeufP7jJl/js57YuepERWApcYOB/F6oZ
         TPl2ocmf4vzaOrV3X/IEeg/LrZOgCcu5zN5D318nvtynuDytBBUDpYvx7wN5ogJnoEiS
         zQ5H2b1I6F+9JXQi8pjdxU+h5qP5PH4pguPAuhtLGWuzQI9Ef9qIbnFBjj2BckLRNtU1
         4uJC8ohojy26dJOJe25BZmbQEIcgZeRoPamy6smLHUpl8J0kHlCHFp+eUEI6tVxcszkJ
         +r5A==
X-Forwarded-Encrypted: i=1; AL+hErGS3oZE4xY/aekAGzUCxeQ1j4hyjB3A6/XDk6bVrELBFQoUraHFdxCe9CziLI97Xg7LEDv2ljgLE99ApPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zeZwDJ1tiX6T8jwf2OUk37/zbbRSlgeMaFN8ga/x+NfB4wvwx
	hHMoWeGVdSiiJszcxDsChIPa+zACWttmiuysZ1aEZSS3VN+vTMEU9NncGOOaQ8zetEuv5JjHbDe
	zOxX2XgfV0YBiC+IaIQuv5HePaJxCsDo=
X-Gm-Gg: AZFdTZdQCZQCb48XZB+Fp7C8s9rtrErzhhRgxKlgyjzraxdk+sm6iCgMgtKsz2gKTV+
	yhpom9UTMAZEYk0Ibi8OZkXW72gYPziImyN/UOOvyaEVASa/uQSagEaIMLHROTIIMUQT58PFz+W
	fQp2BUZB1ehjih49ulAlKffFeWOx8v+5PhojmvSCNaCNVsv6QvXc5y6CzRtEslN9xxz6jUItmMX
	f3EbNRo1Nhm/O4HEX8VL0HIK8rO6JihCQVf66EfvETrbH4WvdgVZy8RfEgaHCEB25EFw/Hw8bm3
	4XQK9LJEam/F24rEe55RKKG0SiABrySwHRt6s55FVWMaNBhaAGlLR4O2dUeOtz6u8/vWpnPtKj4
	Ev9ZXbFJG+6tSFg7q5DSRofgqPG4bD5oze1tKWD3p+PD1g6OqQwECehz1hX5cYX6PLb4=
X-Received: by 2002:a05:690e:450b:10b0:67c:17fb:ec8d with SMTP id
 956f58d0204a3-67dd3f1ac63mr164188d50.27.1794940049825; Tue, 17 Nov 2026
 10:27:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103194410.6632-1-ansuelsmth@gmail.com>
In-Reply-To: <20261103194410.6632-1-ansuelsmth@gmail.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 17 Nov 2026 19:27:17 +0100
X-Gm-Features: AclHuK8Bn8CUkBXh-_M6ikN4qkk1xw_6av3oEY3utHhv9XplUveKXs5p4Y_0xOM
Message-ID: <CA+_ehUzi7gp-4u6J6J3R_u6z7osGUe+2-e444a183fuQFDMpsw@mail.gmail.com>
Subject: Re: [PATCH v15 0/3] airoha: an7581: USB support
To: Christian Marangi <ansuelsmth@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno mar 3 nov 2026 alle ore 20:44 Christian Marangi
<ansuelsmth@gmail.com> ha scritto:
>
> This is a major rework of the old v2 series.
>
> The SoC always support USB 2.0 but for USB 3.0 it needs additional
> configuration for the Serdes port. Such port can be either configured
> for USB usage or for PCIe lines or HSGMII and these are configured
> in the SCU space.
>
> The previous implementation of a dedicated SSR driver was too
> complex and fragile for the simple task of configuring a register
> hence it was dropped and the handling is entirely in the PHY driver.
>
> Everything was reducted to the dt-bindings to describe the Serdes line.
>
> Also the property for the PHY are renamed to a more suitable name and
> everything is now mandatory to simplify the implementation.
> (the PHY are always present and active on the SoC)
>
> Also other unrelated patch are dropped from this series.
>
> Changes v15:
> - Rebase on phy/next
> - Add review tag
>
> Changes v14:
> - Drop blank lines at EOF for DT patch
> - Fix SPDX tag for move patch
>
> Changes v13:
> - Rebase on top of phy next
>
> Changes v12:
> - Rebase on top of linux-next now that clk patch got merged
>
> Changes v11:
> - Remove clk patch and move to dedicated series
>
> Changes v10:
> - Rebase on top of linux-next
> - Add review tag for DT patch
>
> Changes v9:
> - Add spinlock init
> - Add ack tag
> - Add review tag
> - Add additional comments for phys on USB 3.0
> - Add extra logic to make phys optional for USB 3.0
>
> Changes v8:
> - Squash header to clk Documentation patch
> - Address comments from AI Bot
>   Link: https://lore.kernel.org/all/20260520150912.11614-1-ansuelsmth@gmail.com/
>
> Changes v7:
> - Rework to double PHY implementation
>   (suggested by Rob)
>   Now the clk driver expose a PHY for Serdes port
>   USB PHY driver selects it
> - Rebase on top of linux-next
>   Link: https://lore.kernel.org/all/20260519220813.28468-1-ansuelsmth@gmail.com/
>
> Changes v6:
> - Fix kernel test robot (sparse warning)
>   Link: https://lore.kernel.org/all/20260306190156.22297-1-ansuelsmth@gmail.com/
>
> Changes v5:
> - Add Ack and Review tag from Connor
> - Implement Ethernet support in the USB driver
>   (testing support for this Serdes on a special reference board)
> - Use an7581 prefix for USB PHY driver
>   Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/
>
> Changes v4:
> - Rename PCIe and USB PHY to AN7581
> - Drop airoha,scu (handled directly in driver)
> - Drop dt-bindings for monitor clock in favor of raw values
> - Better describe the usage of airoha,usb3-serdes
> - Simplify values of dt-bindings SSR SERDES
>   Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/
>
> Changes v3:
> - Drop clk changes
> - Drop SSR driver
> - Rename property in Documentation
> - Simplify PHY handling
> - Move SSR handling inside the PHY driver
>   Link: https://lore.kernel.org/all/20251029173713.7670-1-ansuelsmth@gmail.com/
>
> Changes v2:
> - Drop changes for simple-mfd
> - Rework PHY node structure to single node
> - Drop port-id property in favor of serdes-port and
>   usb2-monitor-clock-sel
> - Make the SSR driver probe from the clock driver
>
> Christian Marangi (3):
>   dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
>   phy: move and rename Airoha PCIe PHY driver to dedicated directory
>   phy: airoha: Add support for Airoha AN7581 USB PHY
>
>  .../bindings/phy/airoha,an7581-usb-phy.yaml   |  61 ++
>  MAINTAINERS                                   |  11 +-
>  drivers/phy/Kconfig                           |  11 +-
>  drivers/phy/Makefile                          |   4 +-
>  drivers/phy/airoha/Kconfig                    |  24 +
>  drivers/phy/airoha/Makefile                   |   4 +
>  .../phy-an7581-pcie-regs.h}                   |   0
>  .../phy-an7581-pcie.c}                        |   6 +-
>  drivers/phy/airoha/phy-an7581-usb.c           | 559 ++++++++++++++++++
>  9 files changed, 663 insertions(+), 17 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
>  create mode 100644 drivers/phy/airoha/Kconfig
>  create mode 100644 drivers/phy/airoha/Makefile
>  rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (100%)
>  rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)
>  create mode 100644 drivers/phy/airoha/phy-an7581-usb.c
>
> --
> 2.55.0
>

May I ask why this is still in this state? No report from sashiko, all
review tag...
Would love to have some feedback on how to proceed with this :(
