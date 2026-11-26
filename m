Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702458;
	b=rsc329Tb9Q4wIV9Q1JWE0g0N69gsMs4U/D5+52VSgF7LWNw5l+qaRHt+QPBH5f5OLrkg
	 XKENQtdlKSelokZUPbgtDiTJ5pmrh57TZA1T9b/9m3knb7049WlrqldmjAlhPfbOwzzeu
	 zZCZyeqBUEkiFpZv2LbvLsGAi9bVpCEATXeXDbNPdSblPg9sRK/NghcmwDFcpbasawzvp
	 E6Tkgc/95R8OFwVnh7MNwLfMK/Y386Bw0cNIOnXYj+TLGLzRHh7rUlXFN8fb2M1+Ki1Ja
	 IZDWEtqJ7DXhFJ6vnZhShCYYycuOqyMwmbi+pblmoKIWxovA/cbj90SHTXZifmplENw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version:
	 X-Developer-Signature:X-Developer-Key;
	bh=QR2Zep7WrET0CztFBu6FKrEoP6m4586wAVNxVzFnIm4=;
	b=ghnvXSrHDvUWEr0/RTOlIQW73nZXYQZstbm3B30W9q24ReyN8CjLTQUA88Lbxsm+p8rv
	 AfO3/G2XhdC5lEqUInpe8Y8KuG3oasUjDq5h7p+1DesCSO7dW6idcKUGnGoATJAPHqOsz
	 d49VzE6YD81POtwi2NtDhAROgf0MVSfAJhQt9QQnyp4t/TY0bJ8zWPq946lZ3EB+LR2OZ
	 zh9+1b5RTkEBZktbtrDK3R3mq80mEVVLdeYlKaVQFBipS4Rrfc7+BLynkjHe0J3Z3fflr
	 BfMITJmQcptfSKB0V0Mzo2Y4bZcE8WmyyV526pyf0H80uXVYVhekKlY+rzusgepPdPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K0idu334;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D4D606A68F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39D4D606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K0idu334
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so1176313466b.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795702457; x=1796307257; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QR2Zep7WrET0CztFBu6FKrEoP6m4586wAVNxVzFnIm4=;
        b=K0idu334bSpfGBR0F0IYK/uVGrqCZPY4ujKWd/VHRNCL6NYtr43SwKrpbOq6N+8JRB
         qmbbsU/prQpWdMGldd3KQsHz+ytZnPm/TZxBRcOV6Zu6f3B5ok6GXyiw8F5x9x6YcVON
         Y2FJDG0Qu8jskxNrJRQ78B+SyWI57oQTjBX77Gp5Q8W1SSF6qJOxSFUEAARog4F3JUWY
         4DfohQzZfUHVQ35szCWkekHUIvSagFIsbINmBhbrQH9Ia9t8zs49X0vnaXZl/jbUukd8
         p/Lne3QK2xDEE1jE6Syp+ZFqFbj84qD3K37CZ9umUyw8mVJczAh8YCiNY9g86zDeWBQw
         U42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702457; x=1796307257;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QR2Zep7WrET0CztFBu6FKrEoP6m4586wAVNxVzFnIm4=;
        b=Ou+T5VRJ3I+9z0tkQeb/5xcgfzhfZx0DOTdxTbbCv5ynnhZwhkT6bptHNYk6aFTG6a
         NbE5j6p8v67nyskKmpMTOWUDjtqGS4BF8OWw9FhPberOm9oi6oR3cDsxqX90x+3JTyTX
         CUCXcrJlXxWXm2Cy9qNvIGxbpHbyxQshcMyoV/UCwL07ksvEA9rLE9UDzBBimh7GibrU
         43b4aOoovj4L6178BnmgrBldhmmqsJLaV6aMY5akTHacRxofZkVIriq+vZQFCarkN2hB
         trx0ODsvN/v2C5EM8XIitSCelRDSEQhbTpHNI6OYTHlkd/eg4zpleoTGFM6gzPjYgcuX
         7xTg==
X-Forwarded-Encrypted: i=1; AL+hErH9dYcOGNaMfakzDNi72sLH7eMrfwB8YItgH0ZIP+8tMpKofEjivXjfsC+WZYg0lbVvzRh9DJuEjympgT8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+pZt8KRdgXlepGt+tnvoF0wn1QdT07vZ45wR8HZ8elSIPKx1C
	W9YWbtYKxdFA9u7dFJpJWJAfZmqIXzf+yTmc3+bMMKsyJgShiCiIYoYU
X-Gm-Gg: AZFdTZdNX3JyzjUD7NI+ZdtKPvW9AHVzg2fgTxhIxHc3Nink7qxekCuzpw/QSMLyjkX
	5CkMLHNz7AJp6bEE67CCzbUc300KLsDzWf9kFuc0M4yqZ/hSUwrmayoLqnhgg1ZehtQeVESPkWc
	VYIa/RnjtMENnx5hCN+/dx1NFVqB1mcMCchW0z/OWKkw06F+l4bxMDlykjMl2i9mv/VKGhXWToC
	L68Kkro7eb90E3I2MpAWnQ8B2D3zfctQnsXQQyxcEPpjarhZEcyJMqfYFYFS05kMqTVjjD8MWeN
	XMfumrxsW/xnif7NYRHd2f3EXTHgx4a7GGu0SINqXiK3It9jpml3dXjdXtfdarWOa/H7DrStgvb
	rR1C8UPlYt8LSfBI3REhpoNduGeAK1DoSN70OXqziu5OQ8wTzzd0aYqdOBrly8I6fnUS5gCmkHr
	KbbeXbWGS76VekTn8OBIAGAzmPgAks1AXsPbUavjwkcs1OkeOz6+0ivUNfeFDTVZeCYUZvBjcCs
	kPTFwINskGTdh51v+F2wR3coMuaDH9nG6mzQh50egABo4g9mrQUvQ4J9nZEUZbARtHx6iGFlaDX
	lbyZrdn50tp28z3xylP5UMDVyB1nMxYHorRO+jhOovfoVt+EgeaY/Sx1Yx9iDg==
X-Received: by 2002:a17:906:c413:b0:c4c:b4fe:c9f1 with SMTP id a640c23a62f3a-c513a9ac859mr1344463166b.35.1795702456400;
        Thu, 26 Nov 2026 06:14:16 -0800 (PST)
Received: from localhost (184-9-209-87.ftth.glasoperator.nl. [87.209.9.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea6e29sm743886466b.43.2026.11.26.06.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:14:16 -0800 (PST)
Date: Thu, 26 Nov 2026 15:14:15 +0100
From: Robert Ijtsma <robertijtsma@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] iio: light: add support for ams OSRAM TCS3430
Message-ID: <20261126141415.116a2eb352e6@gmail.com>
In-Reply-To: <awg91DruXE0fZ8l-@ashevche-desk.local>
References: <20261126-iio-tcs3430-v2-0-6c5329d20919@gmail.com>
 <awg91DruXE0fZ8l-@ashevche-desk.local>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795702455; l=1816;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=gNevY/tPkIzLk3f0o6o4Y7qPPhRcZrsoVhWvo8HivFg=;
 b=fy1yfUaLT/e8BPA21k3+df6KxpJ4Oki2qY+gQEouQ+efr5runxF1u6NsBA/iCjPw2G6SgtOEs
 03WFO+EA3ZrBzOXEJ3/mjxBepVG5yd5YfpvMM7X3RK7fjemVP1QW1xF
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=

Hi Andy,

On Thu, Nov 26, 2026 at 04:10:28PM +0200, Andy Shevchenko wrote:
> On Thu, Nov 26, 2026 at 09:11:46AM +0100, Robert Ijtsma via B4 Relay wrote:
> > Add Devicetree binding documentation and an IIO driver for the ams OSRAM
> > TCS3430 ambient light and CIE 1931 XYZ tristimulus color sensor.
> > 
> > Tested on Microsoft Surface Pro X SQ2 (SC8180X), where the sensor is
> > connected on I2C at 0x39 and used for ambient light sensing.
> 
> It's still unclear why a branch new driver. Can you elaborate on this?

Sure. Compared to the existing ams/TAOS color and ALS drivers in
drivers/iio/light/, the TCS3430 differs in both register interface and
sensing architecture:

- tcs3414 and tcs3472 are older TAOS RGBC (Red/Green/Blue/Clear) devices
  using the legacy 0x80 COMMAND-bit SMBus protocol (register offsets
  0x00..0x1b), different ATIME/gain encodings (e.g. tcs3414 fixed
  12/100/400 ms steps; tcs3472 countdown (256 - ATIME) * 2.4 ms, max 64x
  gain), and RGBC channels.
- as73211 is an unrelated MAZeT/JENCOLOR XYZ/UV sensor family (I2C
  0x74..0x77) with banked config/output register spaces (0x00..0x08), a
  1.024 MHz clock divider, temperature channel, and 1x..2048x gain.
- TCS3430 uses ams's direct-addressed 0x80..0xdd register map (no COMMAND
  bit in register addresses: ENABLE at 0x80, ATIME at 0x81 as
  (ATIME + 1) * 2.78 ms, CFG1 at 0x90, ID at 0x92, 16-bit Z/Y/IR1/X data
  registers at 0x94..0x9b, CFG2 HGAIN bit at 0x9f for 128x gain, CFG3 at
  0xab, INTENAB at 0xdd) and outputs CIE 1931 tristimulus Z/Y/IR1/X
  channels plus photopic Y illuminance.

I will also note this distinction in the commit message / Kconfig help
when preparing v3 (alongside adding MODULE_IMPORT_NS("IIO_GTS_HELPER")
for CONFIG_TCS3430=m builds).

Best regards,
Robert

