Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288244;
	b=Ogfx6mmhWyFNhubf+LWb0ji/EcfFdyFVEJRUS85iTHoeOh3H9XU0G9cGyuM8yP/PcE7v
	 pUqkV2VpTVWg2yNdYrfH7rR7TPQbezfM1NNdSWo1cBidw2UUPpcIpJMinT7/+TBFdWI78
	 CG4ypocoWOCdEeLfDO06BnZqKkfDIaoXCq+Z6Xf++1Z3xSfztzOWQQIbJ4gg59xLpp0rg
	 y5eb3ifLCZwt0UN13nRsP520nyuqnLzJj5qbl+vYEQYaF0KmiW8hiH1qUxmIckLnbojnM
	 /db1jaH83bVO7jFah2k2FbZU5Nkg234grRljuNoe0Km96B/3WydsbHEdDltarDIOudw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=L5OF8cKDgl7yVsTFuf6yQzM67KAU7pgtfoA3oSBKEFY=;
	b=cP60bd+wUpPXdouX7TfHkMIVnQpRZ1XTn5nZidkaVApSav7WRaeMb5VsSwVFdIsDy/Og
	 w6xO8AfeNUshkFD+B5DVPz1fdWrvYI1x6pyidU99fq/6JcusDggdxN1SlUkRLcqPvN58a
	 DkCK/rRD0iWwGEiehvrjXvSJ2AdMwiuZHpMNfigdMXdxu11s4HkG9Zgc4GqmU7UHeTDrc
	 vrfaq2BZz0rTynVkOKyb6Tu/2pMKb/Bz6xE69TH6JUxE+85stZssF2SDwb4YzppshcPan
	 JPw3BIQbRkRWKiAOJx0OhGN9sRaunZmWlvRCS2QDvRxB/EPUh7iE6CRwQ1VMhdJ3vbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBJufFj1;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C6E606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3C6E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBJufFj1
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5365f9a04c5so1102101cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795288243; x=1795893043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5OF8cKDgl7yVsTFuf6yQzM67KAU7pgtfoA3oSBKEFY=;
        b=hBJufFj1Qm0MTosVUdix7CYrg67j4sFwqQyFeUWyKL4F+kVtC07PIqIXq9JSi1b3wh
         /SxqneO5ezTSU4dS5sJZmxsCesQ2MNcfN+fbVZwodKRErXx4tPyNfcNTBdvC8kF0EDjh
         kRXy1NC4XQbhXeZeGiSOq9X/hJp5jx3uoMv/b9kSgmq4DlwhTFJhEq8MwsvoM9hvLkD/
         AOJstP5SehIESYaP/IaV0+ZP0TibC6BN/gynE4O3BdgwCuQ3jA+MmJNl7UxWe3f/Z6zO
         As7O22AnCezZKZ2wHYOvjJDAij/CM0gYuzNitfSjb9RhWwES1spSjOXnMST009P1fur1
         vmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288243; x=1795893043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5OF8cKDgl7yVsTFuf6yQzM67KAU7pgtfoA3oSBKEFY=;
        b=s2vUDl66HDE0x7/z74BWm3sFG3ccyv7HcImVRxz3IMu7hziTEliZq5TBMI4I3u+nHu
         JiVIsPYzq5QgiYDNLoFPgNrY/BOy4UEGglcCm4BZ4tyIlt87AzbeSi6gMNLXa+UeJ1Vc
         cbH2hFW4+G4JMo0tjsQlYTK2X3/mWGEa5Tvn78jFIwcNs6Q+nBINYmjRfASxM1lo8Bou
         o7VXKiHIPOiKJrbfW5lg9AvGXwSy19M0kSRJRC2Lwh0XzcLzca/cVrUvy6KVMlJxIsiY
         AjHxvzGUn5/nq+mQgFfu3BXguMwT7I4+90Up39CXrG/9zHt915RjZFF964wdRfD4idaz
         lu1g==
X-Forwarded-Encrypted: i=1; AL+hErE8jsKFSxMKbeDicAayE/rAAynMnTdtGgPcvQVwznF7adhBs0LNDHfPcoYxYhQcrXDk0I2+luWd/BYtADA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+K0Ekg/7smw32HVps8RcR9UAcfjMsHD+iHVplGrrZlmUct8KD
	3bMXM2WPtkYacZYp+H5bDOpP+AFnJrWiIy8KC9iio3E+gACWSEaw14lM
X-Gm-Gg: AZFdTZe1JWOBeFGJUnioHbRwu/gRBN/aSah5jrCi3l8bFbsZ9TQIOPHTZUsqdLOyPo4
	QLSmwq4BHe6oRes95jSKwoK5DlDKcDYO9PkUr2sHLfcjTrNa6+53pD6evuPxf0HNDhkXkIoHoPN
	gq15XAmrFvq9LKSgNlPwxdgZ8162mDUFrTL3mr23XMBNK2RIQ+1wyB0F7qgAnmzjqCRrT3YQL3L
	da6MroFgM+MzZh94epSZczwqdGRFL7C5V7yfNEDyoLWbwxiWJiCGxEsbwmyl9BHQmnQzCtYAnJj
	7w0xZsK8tByyQkaAqXjAjt4FfFWKt7Qdns0mJXWo04WpSsW7HAdasn90VvcRKOV3/lqiIlW65Vr
	RzMdNK+EIGQqm/TyYardS1gengoa/TprPsXP4r3IJhj4aLGLFxfhea0yN3kg08S57wmfrGE52oC
	0+rQWfRP3n6FdiOXOmb/BzyiOlj6YsXEyQG7qzrUGV0kIGTYwsomlBclBgMscMMpbAei8BSir5p
	CYCSKstU76zZR8XgBAwttqdDtukq26T8KfyyXozyNoPsqo5+AJvg9Vsa04LmufKoVf9TxIMGY0g
	e4XLd8XMZkCLKsLzuYK5tDqYFtwsPI1xjDvLW9BSb5wBuSZmxppUKEV732WQVVBJCUZ9Q5TZS7u
	x8jyXP7KGVZAYEOiDCgBVCmHLDPQkxaYUB8HfSoOyke9sllhi6Kvq
X-Received: by 2002:ac8:5c95:0:b0:55c:8dc9:401c with SMTP id d75a77b69052e-55d76ade97dmr125384641cf.70.1795288242646;
        Sat, 21 Nov 2026 11:10:42 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8b6sm55854191cf.28.2026.11.21.11.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 11:10:42 -0800 (PST)
Message-ID: <af0d5840-f025-4791-b026-139e4e5f490b@gmail.com>
Date: Sat, 21 Nov 2026 14:10:41 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: ov13858: Add device tree support
To: geocausa@gmail.com, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sergey Lebedev <lsa.uz@pm.me>,
 German Pablo Lindo <germanpapulindez@gmail.com>,
 Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dale Whinham <daleyo@gmail.com>
References: <20261018-ov13858-x1e-v2-0-cd35434cfcfe@gmail.com>
 <20261018-ov13858-x1e-v2-2-cd35434cfcfe@gmail.com>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <20261018-ov13858-x1e-v2-2-cd35434cfcfe@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/18/26 5:10 PM, George Neacsu via B4 Relay wrote:
> From: George Neacsu <geocausa@gmail.com>
> 
> Add an OF match table for OV13858 and parse its firmware endpoint at
> probe time. Require a four-lane D-PHY endpoint and both link frequencies
> used by the existing sensor modes.

[...]

Hi George,

Tested on a Surface Pro 11 (X1P-64-100, LCD 5G) together with Sergey's
power v4 on a v7.3.4-based tree with out-of-tree CCI/CAMSS & camera DT
nodes.

The sensor binds via OF at cci0 bus 1 (0x10) on csiphy1 (4 lanes,
540/270 MHz) and streams 4224x3136 at ~30 fps via libcamera v0.7.2.

A few notes from the X1P/LCD SKU for a future SP11 DT supporting the
cameras:

- The rear module is mounted upside down on this device 
  (rotation = <180>)
- Routing and power sequencing match what you decoded for X1E/OLED:
  IR, rear, and front sensors all identify on cci0 bus 0, cci0 bus 1,
  cci1 bus 1.
- Rear VCM at 0x0c on cci0 bus 1 works with dw9719 as "donwoon,dw9800k"
  (vdd = L16B; focus_absolute shifts focus) but it only answers when
  the sensor's DOVDD (L6M) is up so dw9719 times out at boot unless we
  keep L6M on.

Tested-by: Haipeng Lin <jimmie.lin@gmail.com> # Surface Pro 11 (LCD 5G)

Thanks,
Haipeng
