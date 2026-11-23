Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436020;
	b=02daKacscV/67vOM3KIeGfC9SrsSQGGQeWBApimVtlmveX1I44loVKeVl1lwVPB7eckF
	 NAZh14Ee/4nC/rSFw3In3Cflmgg90U/yhkVQGyGS9V45ZNEfhFvscwFylNdjaWD7e9Ztq
	 mMfsVf0bsCwqBpDQiik/3SQJRB2pknW1xSuEkdhvgD7c/tbl7BtM0UrN+Oq5K+OpuiSj8
	 BRqAJvsR9KOhPwYUI+usK2mhyWOZt2gT+FVO+xmESAgCwoUuuXbVBJqIShFN1p/skT3Jl
	 flDUAjts6C4Q60AcCOo4Vg/8DMrISfQcY3t/xcadzi3Y+vm5pnfIRQOOongpKIIeHoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=vsGgiE2lye4hbouBWbMldcxgaC/s2n/Qfy8fpJXTtCc=;
	b=mwvqWW9ApaDmvBo+69o9x43U9zfyy9nYrebzdeG6BfJgW26puYibyT1Nli+wmReMHOJe
	 OwGcBLb86bhXyqbg+ddi09TKZlAx+LxRv0SHUmpgrGRc+vN/4OwEOMKZhcyvCxVlem+Pb
	 LmTKoimiKuYyuulmJCr9RYcY8IWPMfg1SG9PZtmmxCayfnnrqT6HT10aRQr9aqvVuSu1O
	 61UAt0KOhy2ff9slAFUj3qmrsk4HdpPIUz+xt/uOjrJwkrYZbE6hkGTA7/CNlRgozL1tW
	 mg+0E3J3AHI3TsV1ejVXoFp/O2W7UDLGxsP35IeFnWcK99Q5JJ1lJScQsTInsrgquvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bHGR44PV;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD86606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AD86606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bHGR44PV
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b8784a3284so4594432a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436018; x=1796040818; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vsGgiE2lye4hbouBWbMldcxgaC/s2n/Qfy8fpJXTtCc=;
        b=bHGR44PVxLG3t2B14cgDrCo2Ck5i4EHcesQaHIz5JBjtcP4OZc8U6jPhFWjT255fPF
         M/vxlBLGjHpAPsUYF3SFhZRN+CCcCiihtxgsQRCSUy8X0aV0Ar9JuF1BOLXQ/71JGRYA
         F4oagLvjNqr0ieuo8CzMea/RE9OIf2BjLN36ltLUGVOkjasfGSd5CMlWaje3MSbBQpXu
         iqAXurSOGSmmFrQqgsOohgmvEGEHrD5MDSVfvDCIbe3+kHp65puY8xMEyoN9wuSWN0+p
         BdYKvquP78cHpuW7MK47qI1IlVOPkVP/7YgnnglfHQLmjU4jcikc1utMqT8zJaHLVTro
         DB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436018; x=1796040818;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsGgiE2lye4hbouBWbMldcxgaC/s2n/Qfy8fpJXTtCc=;
        b=rLSTwVTLIcBBXWpk51R00x0MrZCTglMf+OuV9Af9eJJbSKU3YQqOYRzKm8ootDCRSO
         QVDWngngeP0M3Zb8q+5kH2NHlpz4Peokckc5Bm1abGjX63CYM7vPXaupGvWLGN80zp52
         Y2jOUy6/bsVB/HMqF1nU1y/zM4Mjkc20uhIOXS3QY13qgUgrUPAGKKPDUr+BOvFYMWx7
         Xunz33mUf2IaqXQhcUxzpi6LS7kVga8S215TLBb3tEpwDCRR4pYdAaGfBqk3NJGoC7rY
         mLHpLf+K2VZO3tEI3Ldjhkjf1k/myknqkuGa5Hnu1bBgxXhf8pvrdngry/U4oQ1ebtnZ
         nVXw==
X-Forwarded-Encrypted: i=1; AL+hErFYHxoaFFITrV66ldm5N5t8+o9DvDPjPKpPvd1zhxtCSkOex6hyRvBy/CA/8u0h/1itl/Eh0fiAHDnIJpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VbK9u+qKJSL3X7KtFhVDHAsvsyGby1GJ7XRcqxfT4QrFvRUEh
	79kUxxKyQ9S85iXWyC71k3+SFsRMwk/Rm8D61VvJkE/8WTXunX/ko5dIFcoYmtoU+NZLZBnQ/T8
	=
X-Gm-Gg: AZFdTZf4yaDAhCvDPQu0H9A68UZBSLr9LBTFTsnaPOUrcBzbsdoYPBPM5kHcMX4fAW4
	jqL9j14+nMyn39+3iu9iGDsq68BazoulQ9nI+zFPr9DcF+w0uNEEKEw9BxeSvIip0DqzruAoZBC
	H93Qd7saUE69SkK35sJEbex6Tf/Zvh3WQpLESjCieceAFrn5Q3sUtaHxeb6YgGF1kgBWQW86OAc
	K0ZAWaskZk1/ZDqA9vbxnilyAqAk/HSljLodUcRW2Z+ix+tbnr7bAHRkJSy+zfxMYTkQO24dkbD
	nsssnBKeHc5/liwCzgPu/zHt8/ZIkcX+rxF70uS/MiFS89n1PhUSjYGJNeGranZajP5eKMeZ4QU
	XTWiYEdepc8NUiEVIoUrSWNEEvQ71QpV5cHxxBh+zrtvQ1eUn/TUytPNdjYs/odcwKU+A4lNlL+
	u47VV552tQ3f4b+/ymXIyqefBbj6lXVoXfjhty+TkHfh2n064DKGfmB6V9NoIzrLEEfwlVYBT6g
	GX4Em9UI1/z4PBTN6ttkAq1UOqcs1VNuGPcY+Y8iua0jH2pBHxTd+P6Kt0L7CZbHS/6Wh+nNK5z
	zc9OVFcr08rp6FqFcJdfVZGJ3zemWXUJiizcumSdXhdjPOrfksR0SN+M
X-Received: by 2002:a05:6402:3207:b0:6ba:9cea:5bdf with SMTP id 4fb4d7f45d1cf-6ba9cea5dbfmr2715988a12.8.1795436017691;
        Mon, 23 Nov 2026 04:13:37 -0800 (PST)
Received: from localhost ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fe162sm5443990a12.26.2026.11.23.04.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:13:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 15:13:32 +0300
Message-Id: <DN2KY5MGERWB.3DN1SFL7JZDLO@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Sean Wang"
 <sean.wang@mediatek.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Jiri Slaby" <jirislaby@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Mattijs Korpershoek" <mkorpershoek@kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Kees Cook" <kees@kernel.org>, "Tony Luck"
 <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v3 7/7] arm64: dts: mediatek: Add Xiaomi Poco X4 GT
From: "Alexander Letuchiy" <asalde.le1@gmail.com>
To: "Roman Vivchar" <rva333@protonmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
 <20261123-initial-mt6895-v3-7-95c46597e63d@gmail.com>
 <cYX8v2leizSJfWjS_2dbkU2i6ApgjEKmgar6xjZopFQipSXW6YZNgjexWomHucqKghaTzW7oO5GN_jeNBM1MBy0u7aEDR2ygQ1s7x_L2jpA=@protonmail.com>
In-Reply-To: <cYX8v2leizSJfWjS_2dbkU2i6ApgjEKmgar6xjZopFQipSXW6YZNgjexWomHucqKghaTzW7oO5GN_jeNBM1MBy0u7aEDR2ygQ1s7x_L2jpA=@protonmail.com>

On Mon Nov 23, 2026 at 3:00 PM MSK, Roman Vivchar wrote:
> On Monday, November 23rd, 2026 at 1:20 PM, Alexander Letuchiy <asalde.le1=
@gmail.com> wrote:
>
>> Add a device tree for the Xiaomi xaga board, which is sold as Xiaomi
>> Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i. It enables a serial
>> console on UART0 and the volume down key on the SoC keypad. The power
>> and volume up keys are connected to the MT6363 PMIC, which isn't
>> supported yet.
>>=20
>> The DT only describes the memory that Linux itself uses, which is the
>> ramoops region. The bootloader updates the /memory node and adds the
>> firmware carveouts to /reserved-memory, so their addresses are not
>> hardcoded here. This DT must not be booted with a bootloader that does
>> not do this, as Linux would then use memory owned by the firmware.
>>=20
>> The ramoops zone sizes place the console zone at the offset where the
>> bootloader expects to find it.
>>=20
>> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
>> ---
>>  arch/arm64/boot/dts/mediatek/Makefile              |  1 +
>>  .../arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts | 87 +++++++++++++++=
+++++++
>>  2 files changed, 88 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts=
/mediatek/Makefile
>> index a86fb313b1a9..d73489149ab5 100644
>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>> @@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6795-evb.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6795-sony-xperia-m5.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6797-evb.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6797-x20-dev.dtb
>> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6895-xiaomi-xaga.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-rfb1.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-bananapi-bpi-r64.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7981b-cudy-wr3000-v1.dtb
>> diff --git a/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts b/arch/=
arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
>> new file mode 100644
>> index 000000000000..7bfe0d438803
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
>> @@ -0,0 +1,87 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/*
>> + * Copyright (C) 2026 Alexander Letuchiy <asalde.le1@gmail.com>
>> + */
>> +
>> +/dts-v1/;
>> +#include <dt-bindings/input/input.h>
>> +
>> +#include "mt6895.dtsi"
>> +
>> +/ {
>> +	model =3D "Xiaomi Poco X4 GT";
>> +	compatible =3D "xiaomi,xaga", "mediatek,mt6895";
>> +	chassis-type =3D "handset";
>> +
>> +	aliases {
>> +		serial0 =3D &uart0;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path =3D "serial0:921600n8";
>> +	};
>> +
>> +	memory@40000000 {
>> +		device_type =3D "memory";
>> +		/* The size will be filled in by the bootloader */
>> +		reg =3D <0x0 0x40000000 0 0>;
>> +	};
>> +
>> +	reserved-memory {
>> +		ranges;
>> +		#address-cells =3D <2>;
>> +		#size-cells =3D <2>;
>> +
>> +		/* The firmware carveouts are added by the bootloader. */
>> +
>> +		ramoops@48090000 {
>> +			compatible =3D "ramoops";
>> +			reg =3D <0 0x48090000 0 0xe0000>;
>> +			no-map;
>> +			console-size =3D <0x40000>;
>> +			ftrace-size =3D <0x10000>;
>> +			pmsg-size =3D <0x10000>;
>> +			record-size =3D <0x10000>;
>> +		};
>> +	};
>> +};
>> +
>> +&keypad {
>> +	debounce-delay-ms =3D <32>;
>> +	keypad,num-columns =3D <1>;
>> +	keypad,num-rows =3D <1>;
>> +	linux,keymap =3D <MATRIX_KEY(0, 0, KEY_VOLUMEDOWN)>;
>> +	pinctrl-0 =3D <&keypad_pins>;
>> +	pinctrl-names =3D "default";
>> +
>> +	status =3D "okay";
>> +};
>
> Nit: vendor,property should go after pinctrl.
>
> debounce-delay-ms
> pinctrl-0
> pinctrl-names
> keypad,*
> linux,keymap
>
> status
>
> P.S. scripts/dtc/dt-check-style --mode stricter can be handy.
>
> Best regards,
> Roman

Thanks, I followed the ordering Angelo suggested in v2, so I missed
this.

Best regards,
Alexander
