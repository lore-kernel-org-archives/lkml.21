Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707486;
	b=IX4am8kQmLBZnKclY/PrH1oOpzHnOsn+a3TRA6ULN9q7B6BocDXMKbHHD49uxWFTMYF8
	 gr9cnodiHyYOh5MS7zYBnTPj0QjlT9PjJU4GlEcKuuzkfhMah6e7L0+F6/6f4dblmLfwk
	 YL9YHFiF5aw7EzMf0ZNOI9yoE1X0aRDvDIzsPKO0qFVfjbokf1PEKjAsKXMXrP0PMbSiC
	 hk02NfPxY6E7lbyVUoDHHhcv+fyFT5WBapiQeHj2ddFdj69ppz12J/SlqQqf+6Kt367rn
	 Dvhu3E4Ew0ZPQcgV2d25jDLwt9aDZFmB6A4WKFAnu/bfU5AgskYXUdEhYrLC5nZrNVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707486;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=aFjQaGnUmlptpLWffrEp74iYT+06fQSQqhzB/0NW3O8=;
	b=F5Uh26ozvEflJNDfzpmJeV6boSvG/ezEJIqq2n91MSUSepkTHHDuppNVeSC7uAqEk1wT
	 2jECulpPwg81SBz2MySiZWB3b0/n2oV5JrhsvkBXsFwpgZHjegIcIkbW1ZqIKxfU7ct9p
	 OpYylKbsdgD8ZGq0mgrLPQzyXxz0bldsPVX/LjLZ+V6e19RtGp1+kj03hZUqP2cpZFq5X
	 WiqROKRWpfKsbOlxX5ieBCMNm8RWcSLK3vsG0P69bmQHVACIO68p/EwiDZ922v43prkf8
	 iznIcdG2HpKiNeILWIDuuZdMCp2pc4jxlRJctHGE8kz3+yJ341YIpo5ALnEsmgA6aQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=rftm64vbdza77cgdpmci2epy6u.protonmail2 header.b=nWH6KR50;
	arc=none smtp.remote-ip=79.135.106.120
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7240606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7240606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=rftm64vbdza77cgdpmci2epy6u.protonmail2 header.b=nWH6KR50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=rftm64vbdza77cgdpmci2epy6u.protonmail2; t=1795707484;
	x=1795966684; bh=aFjQaGnUmlptpLWffrEp74iYT+06fQSQqhzB/0NW3O8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nWH6KR505JdzmQabJo+ECr4pwDXVoLh36SWJZwzBDJY6Hu3IjjfoUwtUc88w0UWbQ
	 5bbcDPTYeqhurqiRM6rN3fvyH7FcMqWZ9BlI7iesxuUr2LoHdzpPW25iBiwtyhe2BV
	 I7L0Edvp6bdF8mDFDgNIeSLwOpSO4UMNcvlbljeW+ihHoJWVFaIIldnqb5WuqjE50Y
	 0PopXIlUuaMERP8mSciumoQlp2h9opqH1s9+fbiG4CvI5/VIJrj9ww8kQWqWOrWZ4F
	 LJfaWJ1cG5BIVQpF8xjJK/94z5To9ZBG2HWSnZs5WhndzymNc7JEklzLtUaZnrEEVw
	 jCBp8npHBvFZw==
Date: Thu, 26 Nov 2026 15:37:59 +0000
To: Enzo Adriano <enzo.adriano.code@gmail.com>
From: Norman Herms <dockseed@proton.me>
Cc: andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v5 0/3] arm64: dts: allwinner: add A733/Cubie A7S support
Message-ID: <CqGMQaDysL6l016qtEM8oOEnYUMKACgmwLUbb0wruVAzPcwiqrz00WCOhTrhkVEaZt1YB3xfucXdEc-ZFi-sCPgn69RNqtW0v4Gn_HjQZXs=@proton.me>
In-Reply-To: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: 8075a9d6fe42b37f7ffdcbe99ce72b6c0920a791
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Enzo,

Tested on a Radxa Cubie A7S: sunxi/for-next 2ba07dfcd45b plus the five
dependencies from your cover letter ([2] as the RESEND v3), no other
patches. Own boot firmware (U-Boot SPL with the vendor DRAM init,
TF-A, U-Boot), not the vendor's. The DTB has one extra 2 MiB
reserved-memory region for a bad DRAM area on this board.

Our U-Boot starts the watchdog at 0x7021000 (16 s). The DT has no
watchdog node, so the board reset after 16 s until I stopped it in
U-Boot.

- PMIC: all bounded rails are within their bounds, and the PMIC
  registers read the same as under our 6.18 kernel.
- PMU: A55 PMU on CPUs 0-5, A76 PMU on 6-7. Counting and overflow
  interrupts (PPI 7) work on all 8 CPUs.
- MMC0: High Speed, 50 MHz, 3.3 V. Repeated reads and a 64 MiB
  write/readback matched. PF6 reports the card as present.
- EEPROM reads, both LEDs switch visibly, and warm reboot and
  power-off work. No warnings in dmesg.

Tested-by: Norman Herms <dockseed@proton.me> # Radxa Cubie A7S (A733)

Not tested: EEPROM writes, card hotplug, 1.8 V switching, the PMIC
interrupt, EL2, ITS/MSI, suspend, rail voltages at the pins. Built
and measured by AI agents (Claude) on my board.

Thanks,
Norman
