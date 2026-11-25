Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621185;
	b=rSiyMouMZ3gOrqevJq/r+R0rVUfD2W7//DI9zCgINvPOWKtlL1TlGk2kHGNyKYZU0LJ2
	 zQJkuvjPvNSnaZ+JwC7bawavP0NkVrX5PsjoNzW0DPdz5aRSw/SfzbASYT0t7vcWFgy50
	 HqdFoMa68Y8OhUKeviceahDAxhdtfDSKSyXwLy88upczQpZemTVZheFfpzUb5L5HKRA6n
	 xIn54Tw56yjKZTdeJq5YJDYHpbj6honB4yVic2RcfnNReBGABRKs4PBW0GiFh+Av5bcUG
	 zodY243ZmxLnPPHbktHA0RjTaLAw7j7bcUZ01EMt4pEX9B0GT3dzUDGlt0jAGrdhXoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=03OK5Wux5qBQjFwf+S+X4PZ6SO+iKxNmDWiFlrnb6so=;
	b=shW3tadQZFmBWWoxL7gDvtrKMDKHCY88FRrtxr7BYjlTPws4FBAbkqocxBSIVx2iob1x
	 ITwVtMH+CDWQVVx8cGPXPg7tumUt0NYAgdJAjUkMXQHZDPpA6GW6bcDvpwwxAuglrMf7s
	 Vj9ZKF/8aY2Cft5k4ImJPBIbhWkYsyNLzpS88b3j0WVn/VgdX8JisEgBJRoRBMVciLhjB
	 97YbsomcjW4ZsAs6TP9aNCoHcaJq8h9nFOhAmWvaqjEMJ391Sy4h/KgMhL1u01h8omaO5
	 5qhZO1ZRavwSlgxKrUdYzxhAlVTKPPHaQ+/colcaaOJt8C12g2mm3D6QCtcKFNRGWMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hZQkKpXf;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BB5606A688
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4BB5606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hZQkKpXf
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb72b6e1b2so4292345e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795621183; x=1796225983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=03OK5Wux5qBQjFwf+S+X4PZ6SO+iKxNmDWiFlrnb6so=;
        b=hZQkKpXfoPCNOyIPGt3na6gHRDhBZ+SSP/SQA3rJHJZdqSm7Rqn+twjMd52AxubyQy
         vFD0Pnc3F4zWRaYn9vD46oH+u3j/NCE+HNKmR1h2U/ppARV1FO/vO2BXMGPp/imJBe7u
         CvqNLaHed8HmgawaaW54JlJPeoQuqrxdGP/0oHfFzObIHwATnPXumKuRH8eMi2ZyEhZ6
         qP0qxR9hxQZg2cwbh3S5OEBOng0kR2oEwMCPDOam3vgu64CMxGn4YxodQgsb4zQSAWWB
         wr6OLfgnXVJ2zeJLop02n0YA29iRtXdPDVrr2CDA9IG/r8zn0oKNfI/MqSZEr7K/Errl
         bQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621183; x=1796225983;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03OK5Wux5qBQjFwf+S+X4PZ6SO+iKxNmDWiFlrnb6so=;
        b=am7wzWtvel12QglWapYBmFf2GjUXAXuPW0donzq2GBveLlnBUG5LJk5yZsCQBfQuOb
         laVRkaUVh/iyVxyD/gMtudTr7LPxA8lf+xeZzasnN16w0UIU2Y6oWSiydAlBBzvLMCQD
         g7kxWnZgy5f+QNgFF+EOLdXT6+T79g79YztV1tq42HpXSTtP1Gdt7dUTQSisFHecq2Aj
         QPH0X7DwaAvHtc+kWe+0icV/tgegZFo9issOjr+u2cL371l6QreAdYYjSyBKmX4xMBHm
         trIijFadmWCTDuppdljnPxg2WOxSYJHhQUpdX7LU5n3OmUS37kwJj8ctxDCEOrma6rOE
         81Gw==
X-Forwarded-Encrypted: i=1; AL+hErEr3fjrnSdhWJFpCri/A0oZS/Kwf3cBzpAHqRkpk5oEleIdq4vA06m/z2IevYbtxUTWmVgfAaK+B4CTQ5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RGU7PDw4j3dfbIGG5c7t8RYvs31IFqi+YlD4rTzxAR3cNs0bK
	gj3Bpf0HdgRa7FzSMAhmcCn7ifmMhHw9JTohn2JYYLu1FCItk+fCiLLv
X-Gm-Gg: AZFdTZd8B/yhQ5MCHmASedjR9h6nEkn8yCAoyUbin2oCgU5NhXbUt7hv4oTrYMo3JWE
	7ts/VfvWX0WnDHDU6jbm34OqGigyMxnuDvmA3vcqYNUMTDfWaurUI9s/HTI+AhzIis/JAkXkJ87
	U88JEKM0CCE6BCPGY84nCU7qrWquUeULVVM4JhQCcbKXRQ7IpCoeltuqg/vzuoesDTVmr9vs7o1
	szNljJGh546D4BTgFwKRoFB+woTNWdQQa128R3DZ/JgSxgMHqgurA5YTnvAVepWjq0YUY4GObTd
	n5MSgIAd/yBZPgBtb3sLjvLcBa4S4wdYYOUAUthvaMmiCLaEWyRoeaNduvfvzN2UE5YOLNHHYMb
	roGYS1Maj5ouGWSesx0MZfTtmr7PUDdTtH7IaX1eGWSn6dU4SlungoEwXKpUZeMzMyDgkSF/Ie5
	AClSxZi8q0fDGU31/0bGzu4f0F6+GcioNywVcia63GOSQ9AWpVtbN+R81ufhreCV1WrJrgtsO/G
	/Av27XLHZ0guqoJMOeygXfebtKTN+rn0zKvHk7SAkwFUYfFr/BU18EK653SI57Eq5+FF+xgbFs6
	RoCTH3AtQjY/1dQNJNuaKusHnbA=
X-Received: by 2002:a05:600c:828e:b0:4bb:7ad9:2f22 with SMTP id 5b1f17b1804b1-4bb887853e1mr340731425e9.0.1795621183256;
        Wed, 25 Nov 2026 07:39:43 -0800 (PST)
Received: from skbuf ([2a02:2f04:d401:2601:d3cc:6bc:a861:f9da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm474497565e9.9.2026.11.25.07.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:39:41 -0800 (PST)
Date: Wed, 25 Nov 2026 17:39:38 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Aksh Garg <a-garg7@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rhys Tumelty <rhys@tumelty.co.uk>, 
	Manikandan K Pillai <mpillai@cadence.com>, "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Hans Zhang <18255117159@163.com>, Yao Zi <me@ziyao.cc>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 8/8] ata: ahci_imx: Use bulk PHY APIs for calibration
 PHYs
Message-ID: <awcBID5pfFm2FadY@skbuf>
References: <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-9-inochiama@gmail.com>
 <20261125043639.249525-9-inochiama@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125043639.249525-9-inochiama@gmail.com>
 <20261125043639.249525-9-inochiama@gmail.com>

On Wed, Nov 25, 2026 at 12:36:39PM +0800, Inochi Amaoto wrote:
> The i.MX8QM SATA PHY relies on the first two HSIO lanes for shared
> impedance calibration. Store these calibration PHYs in a bulk array
> and acquire them by name with devm_phy_bulk_get().
> 
> Initialize both calibration PHYs before powering them on in lane order,
> then keep the SATA PHY initialization, mode selection and power-on
> separate. Use the bulk helpers to release the calibration PHYs after
> SATA startup and to unwind failures without repeating power-off after
> a failed bulk power-on.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
