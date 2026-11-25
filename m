Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604752;
	b=Dx7AWS2PbZ4pME9teqHHT11MpaiSab22q30+7IgtgAJoaj8vRaIgrRudV8poSjXxZRLo
	 ZG0Rr00BbI7GBUuILIXSrTGdtktEDa3DIts+jXT+9vc0u2xJ/7EN4DBiVZILbA3f89ctJ
	 ZB4VIjXIZkoH6eBsjuMTVPGryei3LycfNIrQy0kGBXfqSskrkG7PUsaxjpsKkZow2lOR9
	 PWwdmwBb3/kbuDJkEDbBfEhaC7K2++Fsx06jzzZe+UIddgwLw697CSf/+NTIC314PTvYV
	 tq0FNJDa3Q/L3j9AN+MECHUIffdSEcSvxOGYAL5o88ZKJgykloHhCFsgyK0Uc2xNJ4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Ny0ODnWnV6171dn8DCwt5qzCHPJg4PZkZSQUcRv3Azw=;
	b=5Ca4kffguIe8Vjvv8zbtA4Q2fg7AF+DKaQitQCgr80DoZ5ZIBLCidjuQZIa5UE7T0nS6
	 J8jNpYElgHhiVArJ/0au63KBmQGAFGcJ/bn1gSdAskixfvugMicsVFJ71RXxv/rBJSi3q
	 7a299psBMktGdUw872j5fEMbJqLmNl67cT+rBxwWBYujkeruI2OEUk55ynXN2EfqA6YY5
	 Yh3wOVOFuQL6yn0R7GtM9MbfGlrxdhlUaLBrX0J2sp5V56F06xlPCNUqyzFFe0++Kzbhi
	 643wvpEjvM9XytSNGQfiHZATOl7QYYKrLiCj3XRhWYDVmvgTS1KmMiLPvsRIOnDhBFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CEy37Vd8;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757C7606A68D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 757C7606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CEy37Vd8
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492690dd5daso4257910f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795604750; x=1796209550; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ny0ODnWnV6171dn8DCwt5qzCHPJg4PZkZSQUcRv3Azw=;
        b=CEy37Vd8zJASb+oDZFi+hiYjFEVNDIjOiGcpfpT3Bz+OWSOOq0UeZ+YVomAeulsXpW
         w83/oCdoKZo6KaEfFudC4PUWEtBL/bonDnXKMp7z/fcmQ0dq9Ico7a9MBKE18bJt6PMG
         PvIiyQ63vBQfNiAhjYmSnskO+4jgzH65nkzRFZ7I+4KfN2KYeLWTwyTkTwon84/16Ste
         2nXoaT4i8GIDAv3Up0tr08THHvgaOq+Sq4kYzUzs4svaPrclEGNIKGYgaBar8+Aa6ftm
         ClNI3LHGDMLVaEQhfF6jqxa1ma6Oga5UigM8TuOCl4VUlH9FwvWXhvn7osknppCiL8O5
         WOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604750; x=1796209550;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ny0ODnWnV6171dn8DCwt5qzCHPJg4PZkZSQUcRv3Azw=;
        b=zR9iUnqZhtoG3RJCo76gd60TLUoAzaI+vjst2VaXXYjOdXpS4iQYNKUS04RJTJhUPF
         79/DF4JoIFNIqVAa2zHSvjPWDkbwNFM7mjUBHJKJr8F54Tl/PX06Lp/5BuPdctMPmIl0
         QN2nrr1utpFmG52RDIPSBoTOOgNrgLnPvfOy2YYe50pqLtIntF6yFB1Befe2CYS2D1z3
         ViMa1S6gQ4Z2KfA0laGcR26vz4B3SP1iFiu5GRb5n6KoTNQXe0LCXT0bLeS/aSU/4nei
         kA1aUnggCFrBFUOKCoHWEf3Q0c2Kx8lFZxMg1uR26qJfO07ChZRDJ+QiGnECsa1VTDL/
         C5/A==
X-Forwarded-Encrypted: i=1; AL+hErEat2EEnY3TCwyBgUBglvlDA+77x3SViM/aaWt+hp2L+Jhr/w49TB7VNJemmUpgcTyJQjtNEexknmFaqK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xPA0TmxXs1Kr+uGKwuSlrmGd7tigyoSyF3ookmPZHTPF7g87R
	Bu46A6beGnJbVFiMbLM7sqtvQMrN+A7KeD2XP/kKjxweDFVPHd2xCYz3ZK9rBDim5Ek=
X-Gm-Gg: AZFdTZdmNhwcOB9IR5zoWBKqxQEotBqrK71a/kfg9//HcUFgN46GcFCz9DdvX+9FZLz
	SvuAbe5FcHAaavn7smWGwg9lk1ds7FPggjvdi5fhgxEn+VG0uwpE3GA50a2s4hXPtYK6YdiUjd8
	ZKtmRJgrrWrm17h0L07/XnKAuW9DQQ056FSf/hR0uuh3J5k1kCiVbrn6DsVqSLu/KDgVeAeLtMq
	OcI543vcBpXPCA88vhTixYBbL67/zsA0MUAvyes+Y9JOLREF/6xvQCPelWeY0rd8Akn+AjCc7zM
	b/x+MpMJDHSgwooALgycpvFN5S4VmZhlsT28HL+pIfNBMWmkfmBg08eD4/sCT3l7cxAUBzAj1QN
	cJ0ms0zut4TStZiYEJmqv3dudSgkkLpZytRclmdM7mgj6eCoNmS2IQn2zL7ntl1/bR98GUopCI3
	RRDAGmFesDXLQ/XiVYqBoQHrBqZlmn/Y/GppNN7tTINshAyDUAFfOJHwuUnXdltYJSeux61zEC5
	XDzDaooszbdtKzK4WwObEjKxohL/yiZURthBmpp2lMvFR8dzeRlvpzaTD6StQNB5UA6H+t9DH/r
	mrrVdnHlH3+a0lmd5w2Qrb+OdQ==
X-Received: by 2002:adf:e011:0:10b0:48d:f99d:a0d2 with SMTP id ffacd0b85a97d-4abb2168f53mr24522718f8f.15.1795604749846;
        Wed, 25 Nov 2026 03:05:49 -0800 (PST)
Received: from [127.0.1.1] ([151.42.79.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm33775330f8f.50.2026.11.25.03.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:05:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] arm64: dts: amlogic: meson-g12b-odroid-n2-plus: enable
 SD UHS modes
From: Valerio Setti <vsetti@baylibre.com>
To: Igor Velkov <iav@iav.lv>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>, Dongjin Kim <tobetter@gmail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20261125-n2plus-sd-uhs-v1-1-cc2019e68da8@iav.lv>
References: <20261125-n2plus-sd-uhs-v1-1-cc2019e68da8@iav.lv>
Date: Wed, 25 Nov 2026 12:05:43 +0100
Message-Id: <179560474311.1313389.4488537313012289406.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=802; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=oyMGF25BX72C/uylXywl0ei07ucGN60OTc56dWF+k0M=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDNlsB7kc8j+cLuUtWbOaY5GFsNB1qWc+f+zsz+ul5Vdq8
 bZOSP7ZUcrCIMbFICumyMIy/d7vglK1h8YJJwtg5rAygQxh4OIUgInsl2RkuCC+9l3Ms6QtP1QS
 1nHvmyl56cTF9jlrDk78WFz/eeEXnqmMDJ32r76cinf+P/uZUv7zVRJx74WKqz7xPOCOMlt1/Vv
 pf14A
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> index ce1198ad34e4..1f49686f359d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> @@ -15,6 +15,14 @@ / {
>  	model = "Hardkernel ODROID-N2Plus";
>  };
>  
> +&sd_emmc_b {
> +	max-frequency = <200000000>;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +};
> +
>  &vddcpu_a {
>  	regulator-min-microvolt = <680000>;
>  	regulator-max-microvolt = <1040000>;

After checking the schematics and the devicetree I think this is correct.

Reviewed-by: Valerio Setti <vsetti@baylibre.com>

-- 
Valerio Setti <vsetti@baylibre.com>
