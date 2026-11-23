Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478119;
	b=1vqO7czH29ernLt3D6uKgrTjvX/3EVLmFDFoRzsMWz7t2QOsow1uOEgnzh7RCM5NTdez
	 CTykblT2b+87Spnq2BrVnLK+pHbjdMf/Pe20jwHCABsTBZqodpMZOO5r/dvK7Epopz0Xs
	 /cpy0G6zDvW3jfWCMJFKAQyIVfE7D8f3cQryFnkEWYoCyWbtCialzq5s+zj38EuRwkQ+R
	 QdQ8w1XrXCSJOjyf4h/XlzljVBAK/oEXfByq2EV9qT1nDFQ5ry79UOBEfemw1VR6YRM/8
	 9BZHmW8T+s8xEazuGUo6fUwc5to8YRShMHVxAiGlhOODxN1X6cmsDj2OCmA9VzDncZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=qHMYy/oSMlkongpCToMb8VA6CvYEq6WBh/L4ubY/+kU=;
	b=qLBp6gKTIUIna8zd3Lp03AL9MZpyk5GzdCRduoKdqZNbSlS99SQvttb7iWHKuM4FaSnK
	 WGDqY+JN8uZBePXWNe016TxKGQZaIBpqw8aRaknuUIvd28AWwXqTZA3+PoAmyPCorNfSv
	 8uBd0kDh/ulizzZkogAYIBcNUwvECRx5pLyXooKdmPEmQc1Vmb0KnTUo/jJ33SOqlLNG5
	 wDJeZjh5dmN0xdZBkTMiFfi3SARd551HjQqWi16ATV6bry5ssM/Zxr2Z494Jm3gHW1RUx
	 3DNDmGrR+wFS/RdSvdroWxCuSJ/nmK9qTH5nhZbH4IBYfYpPHuWghfEd5Sr4DLwyjBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aur9tjvm;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECF9606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ECF9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aur9tjvm
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a315ed211so4912553eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795478113; x=1796082913; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qHMYy/oSMlkongpCToMb8VA6CvYEq6WBh/L4ubY/+kU=;
        b=aur9tjvmrmBWdMGBaCXGgk6MJeEt5iNGa2qSXqZLmaZBc2Kv8JbEJJBt3VS1koB28I
         wPtCKsMymrS7bcRsinSR6Pps6kUG8TlhWYhgGqFtf++305HmkHiwfHMIJuHdF5Ap6cip
         Rljt5/NlIZ9U9mhtnAmYzUhjNT3aCSRb42YABt/qwncHwyKfNii5c0Tmyed+CL6BD4c4
         SNrJeBXEoWkhMvBsdtQrDHPSWrJVVbf385hkj7Mgqs3sqWHZW4zrQQdrvg6+xWHKhuJz
         hAqpP6+B3jdDREVa4WW3LeGkAnl/k+FgkY0rMRFgWfYPg4TMz1LjwlQP9TfhRpV0t22K
         dgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795478113; x=1796082913;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qHMYy/oSMlkongpCToMb8VA6CvYEq6WBh/L4ubY/+kU=;
        b=GdYkfmf4KXtPzFwfdEV5Swd95SVPuAP2TYnLQUu+x0pjGrDF8ZP0L34/86jpi4olKA
         tU8cnz945NSJ+GVbx0LUqCyXOlyijH5CzvWGsiYCbHYZlL01fxX1X3qoffOuKJsIToo+
         /0jNWNivzfP4VvD3bMWnEClrXMkahWu/NsVsTeB5/U7lfQYhKq9sW0jLNSd8ZFT4UaRN
         qwkRrFdtHOPFZ3iD5VYzddCP4PrqMMlPCVZDd0M58ukCtLZ17E3MmMBZuAOCNcvBG3IE
         N0ibwMdq0y/rVo4Daxtf1ZWGPra4KohgYFbNxuOXITk9GCt8vZBzB4Q7yeRZZEJQHvNN
         2c7w==
X-Forwarded-Encrypted: i=1; AL+hErEtHXFC1seCbQbi9RMwYYDjdQ1xYswKM+JwJzd3TqpnwqZoBdxGlzhoc1B4PSwWGfDnxUogFki+6h31ABA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YOYtLC4mN6F3O3wnExlzhbaJB/QyBL/kq7P9wtgmmrbHy9bOD
	xUMRXtQOfJ+N3OIb1tmqZA6RMAGZPz8Bo5IuU+vJC7eJRxy+d5hncOr3
X-Gm-Gg: AZFdTZc0TbW60/bJjtNcdVdKIxrZkRxyr3+EyUmu50JAv0ig0JENbec/Um7Jyh0EUYk
	dZnjWFDHzNMOCDiHlwXRS62KdcCTTKzj9KO8eeCsNaEj37EqwJPgJD8eyJZQ6itZFbi5fWqwXm3
	cQsU0HkDES8f6AyUHwo+M6/WW7nhOMRE82fodH8+Lt9FN2ITwbU0zQCcbCTLSxhBAwvAb19NsY/
	IcB3vOEXj/+h1sFhdCM2EKUtJnYK/k5jHXhw9ebeRiUa51gKDTeJeexlpLVIIrq4OvcjVzSSsmD
	sddow+2O3+QHItBK3vJ87iW4J7N49UZmlfc67vTCrT+48IWLG2OHhlSpBFbDw7090arJqOTar0c
	jFLyQvlx73hq1wtS60CX+8WMHacMgax6C4HP0hKAbZ5DB4S5jnvWVIUhF7E66qrClS4MGGowfG5
	LHB6l0UHYx7p8SDIwr4ohwjnMwPVBjknzfM4L2N4FErk3qSU0JGy8qfTNCTEhGP3LURsxGCmgQt
	PPJBA3oGdgy4WoBehtEmH0Bpp9yonv5K5Vw8QMAoMmhr5GaNfYNRAHqGxnsa08gGOGPcHTf3Sci
	4YkG91SJ0hVBvEuGyXbpNWKOkFHRw4tO1zz2cagRzqya16c24TEgti9VmtFQ8OHvDhRS7h6rpu5
	ZXF7hKdgNyjX63tU=
X-Received: by 2002:a05:7301:6a05:b0:386:a0dc:2e2d with SMTP id 5a478bee46e88-386a0dc3082mr11090356eec.16.1795478112647;
        Mon, 23 Nov 2026 15:55:12 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm68245062eec.3.2026.11.23.15.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:55:10 -0800 (PST)
Date: Mon, 23 Nov 2026 15:55:09 -0800
Message-ID: <2e4f0d32c05d841feb367741bf8802fc@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Rich Felker <dalias@libc.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-sh@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] sh: mach-rsk: rsk7203: switch to using static device property, drop legacy gpio API
In-Reply-To: <ce838102be497ee6eab490b4454095b96e16d015.camel@physik.fu-berlin.de>
References: <20260929-rsk7203-properties-v3-0-02f84aeb8e47@gmail.com> <3a51385d-9649-4bd7-87b3-0caf9e462b2e@app.fastmail.com> <arzKNhmoL6yiGrzH@ashevche-desk.local> <dea00f90c205f8359baca729d8b0f31a@gmail.com> <ce838102be497ee6eab490b4454095b96e16d015.camel@physik.fu-berlin.de>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Adrian,

On Mon, Nov 23, 2026 at 09:12:37AM +0100, John Paul Adrian Glaubitz wrote:
> I have been super-busy with CVE fixes but I will try to get into kernel
> stuff back again later this week. As I mentioned before, kernel maintenance
> is not my primary job, so I cannot act as quickly as people who are getting
> paid for it.

I completely understand; upstream kernel work is not my main focus
either, and I appreciate you keeping sh maintained in your spare time.
I did not mean to rush you; I mostly wanted to check how you would like
to proceed before the next merge window.

FWIW, I took a closer look at the current state of rsk7203 on mainline
prior to this series, and quite a bit of it is already broken:

- Ethernet (smsc911x) has been silently ignoring its platform_data since
  v4.13 (commit 3708184afc77) because device_property_read_u32() returns
  -EINVAL instead of -ENXIO when there is no fwnode. That drops
  SMSC911X_SWAP_FIFO, corrupting TX/RX packet byte order on this
  big-endian board.
- The RTC (sh-rtc) fails probe unconditionally since commit 689602e0609e
  because sh7203 only defines one IRQ resource while sh_rtc_probe() now
  requests IRQ index 2.
- sh-cpufreq fails init because sh_cpufreq_cpu_init() never populates
  the per-CPU clock.
- Enabling gpio-keys-polled (disabled in rsk7203_defconfig) clobbers
  LAN9118's IRQ0 on PB0.
- As Arnd noted, the rsk7203_defconfig kernel no longer fits in the
  4 MiB flash, and USB was never wired up for this board.

Given how long some of these regressions have gone unnoticed, it seems
extremely unlikely that anyone is actually using mainline kernels on
rsk7203.

Rather than worrying about hardware testing here, I think the simplest
way forward is to just apply these patches (with Arnd's Kconfig tweak
folded in, or I can send a v4 if you prefer) to unblock the legacy GPIO
API removal, and we can resolve any bug reports if they ever arise
later.

Thanks.

-- 
Dmitry
