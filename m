Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.229.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795097293;
	b=Eh/xNGUH1LztbgSnlhwPWL4GG3KywSr6Wbw6IVPPLufNkEQ7Z0hQxic5iwHBrT8ISt2x
	 7fRQ/I6x7MgXy7S/sETGtSUjOTsGarnsXrTcOtmDofJrzG7Wc1qEhfH4LrW4X3XYtFaC8
	 ymIXVASo4GAZaWXahG8Koaj6mpgEBajwONJooT9IlwU81d0IqEUV0ErC6G2QEjN6mMtJe
	 cCa/Id9VSRQEr7Fcb/P/BDaqVU7F3uZB6zUk6BkgoZKhRddpnrlaqAlR6Fcqgje6M0bB5
	 gZyIrOppay6tE1DkmPK5P5YCoth4Ol5+b4Acz2VFeeaZTaOx7HiHECDGCylJ5gCE4OQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SAtgjovQGOJhJVDA6kWd6ptbxhHXvNBnvWsIVbDqIls=;
	b=C0Jd7IRQXOxrlSLVbOOpnXs2gWeq/Q5uAv8JzX31F4Osks6NGybYd+2l0SCeOOUt5gdX
	 FHgk1hZLENrDtEI2851Ei1a2MKRBKCJggQuFFAgsTNv3akAkKAvK+BICdsMrt1tTl/wOt
	 M1CckT5XZPhYZjIkqT9l+eXBXbe4XTu6WGuf9s4urW4DC32eYQ2WS/lzgmhh5A2DSDpaq
	 2IFBqKy03R9SICXfYgz9qY4rLceQK6a00Rn3rur0qUyU9hXgETphZbPna1+USWdiM0/X+
	 oB3Nkfe8xWZTOc24bqyeHlkcV6dS+pYN/Ac7ePhzaaawl50VFQQ8fo0YMZBi2dtp0rA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SORAkYSK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CBC606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60CBC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SORAkYSK
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36f936424f2so530787eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:08:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795097292; cv=none;
        d=google.com; s=arc-20260327;
        b=k+Cw+ZsFm3obFDdbizhEIEpL1t59LEnIiqNlMlNaNgrF5r5fsZVRW4K1xOfKGbdNpl
         +zHb2CzJwQMcMy04LvtS92Jsc/N7vvyTScaPmDpL56NJksGDxWJ5QQywyt8YIBpip48N
         RClNppgb3Imss4axOSlLhPYG57wRijVW58XlAXtogdd7BlJGpu0sIoNZBGWno7zqCo1Z
         5UDlRiDv927thE+zvuzrx02Ac18CJTPuJ9vgryOrGTanQ7XYPHw8obyZSQ8F1LiQHVHV
         h1X0rbKRU02YW35gnSK7WIidwY3gS24+MbKscgzNaJEJi6McHsIIbtR6zYoyBMTLCbBd
         0vZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SAtgjovQGOJhJVDA6kWd6ptbxhHXvNBnvWsIVbDqIls=;
        fh=0FaCUp+sGB+UsK5ilHLShGFzg9lI5Ou80xCu5+qxbP8=;
        b=K3nyUPHfAP5Im5op0vlocKKq2C4/eWSYs+p7dyYoK2QGsS2pRYFKhxqO/wsDyp5sND
         UFs6jKWbF94Kij5ik9K2mMqhDsnwvNOqWZE/PFcHV23xw64oTxVzZhscmU7p7M+TWz11
         Cr4rzo+is1IG8DmoHFAyjuI1z+aDC5fz+DMbcuJenchGZuf7ikDMOO1cOvWNQ3tEwJts
         oCmyTubRlKf+QI27bmrul82vyPhjKvXBXkIY7VlAFMm3ushr2H0GVckmIFD5i+Nn20+E
         jzPHWuC1/tNhE9OL4SoFN3/YKQ/CwV0wo5zcVraE7dqiTwA9QlLlHk1qOxbkpOv7rcjy
         u8Vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795097292; x=1795702092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SAtgjovQGOJhJVDA6kWd6ptbxhHXvNBnvWsIVbDqIls=;
        b=SORAkYSKCiBsVUrC6wYAux2lJSLp9amBQwqx5skGYkiwTFG2WZXVtaOUfuh3riWI0U
         xBMC+ktwOrCoH8FRmgPw51MHlQKW+tgeA/LHkkZdch7xpVtF44L4da4KEjEoM1AMRDSy
         pOIXtEQRBw0xULgMlHho/ySW1f+OsK0ZQGdNRQ9fZ8SzDdQvyc6aqpPlMU3f9UXKNR9N
         0+17NquvtilCFrEF2VERzhV5vSOxbI4TU/9+q0FNcD7ANZiJphEQfrGci7OqhtuDxe21
         dTgOmlQbAz017QaLMCgeIkkq/g23I4xvGGdgaIIQgUV074Qoh0rzPCC+XyukoLXrFilQ
         YYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097292; x=1795702092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SAtgjovQGOJhJVDA6kWd6ptbxhHXvNBnvWsIVbDqIls=;
        b=mEpe+8adK3y2uQiQkXgz+k1QT56HQc16Qt5sjB7zpVPwxnJx71QHlVW8ACIwpN5T2i
         H+p/H2vv66VWvmLiyzsCEwZfjd4SvyPgtiUwyu39orzxv7TqtfJKkbsyxAuFT8v5Pxec
         QucMx2Uu9qtM7jAgK90gU07uVJH5q17EofKEhEQBOHiSgO4ryYW9JZNxmLpuuB35EYFH
         qkH4/KDWMVJknJZIFPNJQSR1ll+Y5CVdCjlYQJQ0zmxS02Mptd6iEQK3AIBuVIheu+Oi
         RNml6UjX0wtFIaOzjWi5NM3tm5K0FVmn0piuRY1NSFQkKYgaYITrgWcfQ4iS1BaGOHzo
         BTBg==
X-Forwarded-Encrypted: i=1; AL+hErFvW32vHsfZySK9vbhBR/4LmK9d2xKr1r+ivg3iL6XWMviPhUpfiTgy5xmmXUvC/6ulEnZGd44hvy5v36A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UhQ5xzW5zHOSB+X/l/Sd5/0rq74zP25le2AS17ZRF4yiJ6q82
	f90UOVDLIdfEIqrAQPcPXM3ALzyyive16NYj/3cxn2xJZpV1yF77ikgpIWPf/S5iYOtLcUfRXVg
	GnXu4Ej7Q7s518UdZB12nZG7DDj4wTLE=
X-Gm-Gg: AZFdTZfdVFZ34JIuaEOv0sV7nmFQ1w+Pf61t25r5K+OrSpOKhRcVJ1N44qhRCm1rT3e
	mhakfnRH+pQqZnKtIv4M5XHCyGS+x9y6xPrgnbx7tQlUMIIK4pdtkzQFwES3flKoaRXyQMsc7nP
	ttNjywPdMQGIAkcfyH5BWS7bmspCCQ+GgUZVNIQ9kAyJ1kQ7g1c5x27Fjxtn2SoP91RprKHiL//
	5A7exR2gE4zt5vyH57msmYn98QbT+0m8RhGQQ7OsswqL+PYQ9F7DypNR3FrOA12qZ3s+yiT+517
	pJ98eFiMK1iQdVSoonKjGN4Ot71po/DjDhwLlW1/meA9IEJ8gwGzAfIBf7JeK1KBPRYKnr5nSFj
	P1gAsRMg+yHOPycMIpHk3PWeG7/9PFtlm8giMUA==
X-Received: by 2002:a05:693c:20c5:10b0:376:e950:873e with SMTP id
 5a478bee46e88-3827f98b78bmr5050359eec.12.1795097292380; Thu, 19 Nov 2026
 06:08:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119125125.75912-1-pengjunhao409@gmail.com> <7e207fea-8aae-4271-9e94-331464442ae9@kernel.org>
In-Reply-To: <7e207fea-8aae-4271-9e94-331464442ae9@kernel.org>
From: bill Smith <pengjunhao409@gmail.com>
Date: Thu, 19 Nov 2026 22:07:57 +0800
X-Gm-Features: Aa3M54qmdi0dWKA475ui43FuP9edDKAvcfBsoIojmaQTyA24HpB57Hb-KN3eZxo
Message-ID: <CALbS5L1moAiDADSoFrXruB6jdendFpwcyjQNb=OV0MTQeuYEiw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: rtc: haoyu,hym8563: document vdd-supply
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:20=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> "The submitter"? So LLM wrote it for the "submitter" and you just
> blindly send it :/
Sorry for the noise. I re-read submitting-patches.rst and the DCO
section.

For v4 I will write the commit message myself, describing only the
hardware rationale, move the AI disclosure below the --- line, and drop
the version links. There are no code changes. I will send it tomorrow.

Best regards,
pjh456
