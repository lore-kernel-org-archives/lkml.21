Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632499;
	b=bAQV0/Y2CEw2Dyx89Mo+8i27zVynX+7yxw6fRyjMDGIFInLDUBr9EC5/yPPeu2sR0JcA
	 Ek25G2u/e8mk6hUQ3VxhTLUqBPvmXZ/xieOzkrsnAaBBeaRfqqF2qaypq2mOSuM830dKr
	 9QuZRvT7YDZruAgxluKj+Btt+yNW0qwj/GAnwXmG4NDCYnyfxIW7p7YOqVQp1kxZ4EjW1
	 zo+ubT33vcMo2PwJBCmMoKTCEGnTdCVHscDPpkAwAEXTvklj6NosOhzLCk0e69dj0nHus
	 YIzVmU2M/66FC87NhbllGm/QGwY3/VMm4wJQkgUFMRtNfKNxC1cJGnaiKXiHbgfqdEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VQW/Ymb8D+uLvIjWbZ057G5GtIuukitNqjLkdiNCMvE=;
	b=F821J2+t4/ldJ++lHNv71C517GfUVBO9Bi/q2nGtoeSS3u4hRKsaur8+gmRmFw+r7IiD
	 tPnbGH9+Z6HG5Lfea29jeR62aHwAleYoezfYrrRtgqxVCw2r4KEUW4Ke15/J+L8Y+Z595
	 By3QIQ4erOzpFvPqVNw0/ycedrGDgdXF9aIOMpcL9GMKN4i2TMGZZcVim2gpb0KQlsp2Q
	 Vgf6HMc9I5j5Ud92pbhmrA1p/1uLjyDituMeJkAAkO56CFtQfYvx8bVjjfM5BdaZsheXe
	 I+eYL/3dVHuwnDm3lgLhNQDVBf4bBhtgGdnEJGDOaW+oasegX4Rq3wPM9I72vJjForA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oNnBk9yY;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24E3606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C24E3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oNnBk9yY
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso150610866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795632497; x=1796237297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VQW/Ymb8D+uLvIjWbZ057G5GtIuukitNqjLkdiNCMvE=;
        b=oNnBk9yYeUkh5s9pJTjawpl5to9WwX7SUukW3RYanpUXdKryi5g59gdyC013GPo5KJ
         44RoaPNMbHUir0M+Zhp87TWdQHbZM4kLUCrIT/znmwvN/7W+plDblEnJSJhJVNx59B1B
         chd0czeEamhlDzqBzlSNWAgl9RqCeMqEu6tglGhHKOhF6wrzB6GX//4va9yD4oR5ChIx
         6K6UWxCkBgpDnKlJT8uwYLnlEsvzSB8A3x8XJ6Yf8H9wGHX4cfSvnWq7kPdJ2YCYmOg7
         RA0MMU1tmW9T8fguHCAFFhimvY97TLhouhiNYSJ0/UyZSjdG48daDEwMt3AoiQ+nHBGe
         C1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632497; x=1796237297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQW/Ymb8D+uLvIjWbZ057G5GtIuukitNqjLkdiNCMvE=;
        b=gunluMkWvwkK2AHF1Oq2DctfOmPv1qNyWCxfGUxwYg7FoIP6+TrAlQIpNrE5lE0rcr
         8VPaGI7h8MSTJsH+X+wCW6O0IWzrfXtUecIXvRCikedsSwjvLTAED1ARBHtQe5+7I9DX
         Uhs0TxwMtFZpkcZGpq8t8ssqAu6wt6gDMygbP8cPPGJV+T9bjbYdhH8WUez53JzEUn/g
         M6wPgL/bOUQMRLqqqj9ot+5+oxaXgth6g+9iUXw0JcmILTo86S30rHoN8ldmBKysWJQs
         tBgUCTSMrwmqEaBYb1mWv9XWUXyo8IecJTCE7h8TUjpVlRzIy1ytw8pYY25rxvTpMxfv
         1F4g==
X-Forwarded-Encrypted: i=1; AL+hErG4S5FdJXRM+YphwktfBK0dzc0pOk/jzcRk5hMhgP1aEOOYkdHQcUrgsk/weuhXZTtSF5eg7OcJvHXPoqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XI2YnoWbFK00vZN/zjmu+ABHgYdhXrpX1Nj4PmOoJPDXVzlQO
	WQtCgQsiXGCeL+UnR/qDCJLPhsg1/06qBxSFGO5JJCdJsN1IWL0MkumO
X-Gm-Gg: AZFdTZeF4YcqIe5hifwnbgbsJqZvwKliMoyuzWiifhYQKxZo+C4iXPDVVH/+JzjPDED
	ZBmj68hwj+/BocKFOU5HJc34OVSPDGBkXuiBWPMRdA22D23gbGV1pYoNp9Nrz+g4RnHZ1cG56nU
	KNQuS26iaY4x7OMDSt/7OU1gpsfvpTYDiKhjHhQt5eOXUO8Hdr3GqwPAerWEoYmWAsuuhM7Z7Ft
	SMKtmKUKcnAMOnfmuzvFjXWuAdP55ZWEHA+BFM5l3b5fb2sF0dTOow/ybRyxCEZOwEDVm9VC+gB
	Abj4kZGA52xnwXTPD1Ppw0zwN0iakTk6Dv8vbugh4BZPgQYLPiwpKz+rH64GRwoE356iP9oJHXu
	9bFixiCjIFWNRa07oB0hOhn3uZw90AVg4bVmXsL9vxibXumM6dUx47f7kOJBT630reNY6YbMG8l
	P/wfBAlyjaPkW0+2EOupWEhfnFchxRkfaWpYxbg+wJFHRxR6ta3thAmsFjeveIT9wpjfLAus/71
	YXjz/65DU3j0+Bf65Dq55zZ9/sfeP5ArYLMA27bGFmUSKseNJ4zvJ0rQQp1zvGmqAPxMt9b1eGc
	vqJs5jjh929t4sPaMXYDdmS0viknaOSWOR85s3w73MshVXfBRX4uXvK9Dvk=
X-Received: by 2002:a17:907:20e4:b0:c40:9b75:84af with SMTP id a640c23a62f3a-c513a5ec7cbmr1173636366b.8.1795632496938;
        Wed, 25 Nov 2026 10:48:16 -0800 (PST)
Received: from antoniarch (84-40-239-22.cgnat.inetia.pl. [84.40.239.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc73d3sm677226666b.64.2026.11.25.10.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:48:16 -0800 (PST)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: vigneshr@ti.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v4 0/3] i2c: omap: add support for DMA
Date: Wed, 25 Nov 2026 19:47:45 +0100
Message-ID: <20261125184750.57866-1-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,
This patchset introduces support for the TX & RX DMA transfers in the
am335x/omap I2C controller. I tested this implementation on AM335x 
(Beaglebone Black) and things seem to work fine.

Kind regards,
Antoni Pokusinski
---
Changes since v3:
Some minor changes to fix the issues reported by sashiko:
* resize_fifo: changed type of the `size` argument from u8 to u16
* xfer_msg: fixed style of the REVISIT comment
* xfer_msg: implemented fallback to PIO if DMA transfer setup fails
* xfer_msg: disable the DMA request as the first step of the cleanup
            (instead of the last step)
* probe: introduced intermediate `dma` variable
* probe: all DMA init errors except EPROBE_DEFER are now treated the
         same way: dev_warn() + fallback to PIO

Changes since v2:
* dropped patch "i2c: omap: remove unused is_rdr and is_xdr function arguments"
* added `omap_i2c_disable/enable_pio_irqs()` helper functions
* probe: added `if (omap->dma)` before the DMA free
* xfer_data: signal DMA completion in the case of NACK interrupt
* complete_cmd: signal DMA completion in the case of bus error (e.g. AL)
* xfer_msg: removed incorrect checks `if (!omap->cmd_err)`
* xfer_msg: added handling of DMA/IRQ cleanup in the `b_hw && stop` path

Changes since v1:
* new patch "i2c: omap: remove unused is_rdr and is_xdr ..."
* probe: added `goto err_dma_free` instead of `return`
         in the case of failed `i2c_add_numbered_adapter()`
* changes in XRDY/RRDY, XDR/RDR interrupts management:
  - init: do not enable the above-mentioned intrerupts
  - xfer_msg: enable the interrupts before any non-DMA transfer
  - xfer_msg: disable the interrupts after any non-DMA transfer
* xfer_msg: added checks on `omap->cmd_err` to catch
            NACK or AL error occured during DMA transfers
* general: moved scheme-related macros to the top of the file


Antoni Pokusinski (3):
  dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
  ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
  i2c: omap: add DMA support

 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml |  12 +
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi      |   4 +
 drivers/i2c/busses/i2c-omap.c                 | 377 ++++++++++++++++--
 3 files changed, 370 insertions(+), 23 deletions(-)

-- 
2.56.1

