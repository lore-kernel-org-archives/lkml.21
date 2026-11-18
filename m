Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035171;
	b=tYzcLFqhgA14NiM5SF7U2uxHhJWp7U3iscAMflQ5twPgF8NYLGYKjy+BxTtA68h5Ka/G
	 X3T3bma+u7zMVujLXOvDwplbWuhYKLhnGvmiFSlJwQH0rkc7mDpl+I2D2NnrDuxiLfkFq
	 GQQM8un3CgZU0/U93BEBNxfi8SmUf7VdzP+HTtSyayv2yr5QD13XHenxd7PTVijHBYleQ
	 MIzkGYiJ9AtGXgqsmBktQz8GSDSEMrwNAmyBp+58kDQx26Hzii3Jb8nZCUqyHAW8wK8CX
	 Jau6ofcpWE3pmJTMplYEYydM0c5V0L4mb/+mrM8E+Pgbuno7pziN2yuh7qsTRfLVI/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a5MhG98OmxdXqTOc5Xluyx99XKwhYZJ2KKliQ9c2OkM=;
	b=P0ee3RkGqa03VofJ+E9v5BOfYgYHHP3uVTYvDFWR2sjyxDtoTRWepPNBEiTs11I19rqF
	 o7i6ZmHW8ySyvDN1J1/fcuACP8yRU/g4KGpGoEbI/+/TZC3nf+xl+jboK2WkT18qMdqFp
	 v2JdGZvfPAGR3wf86+YfCQj2NpV4wYgeZ2W8UHYRjpA/vaB0a8xPkBm3DbtsPeYcajkIl
	 g5ouSOs2MqvDEX7drbge2094KzRk1z/n7ZQg1GDaxpk57hx9yrc2F7ElIHLWR+2InRROB
	 mVMPbPhu6azFklfky8EP+IAzOe8N71+kd5qk+uxjfYVl+R//tEVU3xbZp5FuDJ8Oahw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jlxGHW+k;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE0E606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE0E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jlxGHW+k
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4395d31228so232736266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035169; x=1795639969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5MhG98OmxdXqTOc5Xluyx99XKwhYZJ2KKliQ9c2OkM=;
        b=jlxGHW+kRyHFaEMpeXR4BNALXPsNplbIhzII6rNliHUbcX6NmABOnQ8XTqgppKQz/0
         jnpx4OD9SPT6Kr4gK+6e7zltezYlXyxXT2NfU5Odo31hxeQDHI1/oRoHWTSOtpxIboeQ
         FH3N84C6KLj2Igb3KbWBC2z49+iRGJvp0vB6BJ0/VWt5XCdgR97RAz5PXJN+PoywAORY
         xte54o9ByrMsQ2uilazjjngyPJdALuFEoOaJiHVqDv/lnXYuJF66BDqjNusCCR1GMXJe
         eOgd9Vlih01Qr/4o+siFo0v2a4oF4APKzmmYHrhLbqFeAgDBI043ZSqUkY6x4nruS+yR
         J75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035169; x=1795639969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5MhG98OmxdXqTOc5Xluyx99XKwhYZJ2KKliQ9c2OkM=;
        b=Mvfuv2/5Q5es3BwnkpvK5RV9/k7wa6UDf3B4iEtcB9u8mqgmepOkAlTGkhzK1OAoM/
         GueVaTovZiP8UboNFZSNaIC+nFUfH3vgGuzGyjKXgAwost//Zn7QttcQw1MJQhS78mNn
         HoF0KWPeAIENFCJJIdHU5Ux1biyfbcgJiKxjNYGHyxhI7mBUiodyiZBBIcDx4PjyXtOk
         GPbnAJv82XEJb494YZhZR3fgqpIOinP/cP+iSEDry47mQ7wBTVBIZZCQFLApm2Xcsgkw
         Wo1m6rpSxiL6Tt9a/y39PVzyyo7426PH24uRhu1pUSx4k6E92xqbi+SxmA76woFpgOKY
         4YFA==
X-Forwarded-Encrypted: i=1; AL+hErF6N88/lgZZMMGZVHbS1njm+MSYh/9ztv2eh21zMKq1EULcLkjpbLdKZR/NhvIb1RuDAyE8b0xIlsCOALM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+F7pCLCOxadugUYavU22jMdu5tW6eXsrSfyhXc0aS420lLbxxo
	/EZ638Ee3Nc9SQWWsLTnYwBMmEctx7DhdkbJkWBqvhV2fsXFh/ABiAnu
X-Gm-Gg: AYBFou3y5EPsxtfLrykZ7D356j0GcN5pQyKdghORvEWmu/nzmM1lzPPavpOBogOnxns
	6c23pvOycW7B7vRuMGuz9JwHwQ+bRqFGbEO5lnvbti+Z0Lr1g356ErQ1WgnwxmcZI4w4ejXAch/
	ofXiPBlgTVaEXHbg8KlJ+JTAh6FFzq2Bf9SN84aPGoWhvzZ6Iha2yOzXBq3NwekYckX/JZ9dns3
	VxMqQGYmqFmAIoTJAI3RdXWgTKIr4LVWg9f0ASl89vvKp8MRAfMaC3KJ4Vvt3PquYuCiKfBKnC8
	SJhH1TLpPIZhRN0Y0ez3/0a3apdc0icwT6TRM1Ek52pPlKet4A8kWzwWzUNf7zx8M2XSxTGutbK
	6GbZVWZKiXKzDuGh/QaucXbps8QE+FpAM4RRZgX3tIR5USsK4GrqA9zWQpwXFf/aykbsPkeZN8j
	KL+2KC52h5kz1v/py3klVKJ65JcOgerHXTb4lpHm1q7w0/tFtJ21q+ohi+Vk3rtJcIqyHPfWwyN
	lPcY9sLnisSZdem9HiTegbVu/D00jQn42aUeS1FfL1pHLcVlJQc9+sVMAYtJzqyfM1/v8qpuzU1
	KX0qZWe2h+TzQH7C32tKp+UmK9wABQabW9X7EnTkCc6szeUYhJ/Gu6d2kz+e6ts3D793Dpw8t00
	RFZJUwCs=
X-Received: by 2002:a17:907:1ca6:b0:c50:ac4e:3770 with SMTP id a640c23a62f3a-c510e516a2dmr391250066b.34.1795035168876;
        Wed, 18 Nov 2026 12:52:48 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5123421612sm35303166b.41.2026.11.18.12.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:52:48 -0800 (PST)
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
Subject: [PATCH v2 0/4] i2c: omap: add support for DMA
Date: Wed, 18 Nov 2026 21:52:03 +0100
Message-ID: <20261118205213.88778-1-apokusinski01@gmail.com>
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
Also, I noticed some unused arguments in the receive/transmit_data()
functions, so I added a small cleanup patch.

Kind regards,
Antoni Pokusinski
---
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

Antoni Pokusinski (4):
  dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
  ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
  i2c: omap: remove unused is_rdr and is_xdr function arguments
  i2c: omap: add DMA support

 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml |  12 +
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi      |   4 +
 drivers/i2c/busses/i2c-omap.c                 | 363 ++++++++++++++++--
 3 files changed, 350 insertions(+), 29 deletions(-)

-- 
2.56.1

