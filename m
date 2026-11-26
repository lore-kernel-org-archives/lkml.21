Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693263;
	b=UCm+mlrw1dipM18BtH0zcORUfLIk1nuJU/dOybSOG30QzDeIpmZyYTpFr12gNY993TYD
	 nRMoOvw7gmJb7IdNV8xxk3J6YOyRi/RKBFYS7UwUPrh9XZkIqZiNRD5kmVjZL+ngzOdWk
	 sasxA5iYw2t7maG+M/h3p7NxUBm02aZDaOfv1kI0N/H/18SfG00bsk12BPOBUswluB8mY
	 HOJzWZkhHxvKHe0q3IZxAbAhSudeQWkIlHPGKRb6opq6kl27Co0i1lufSyANK/EUzK3yT
	 hXKV6zrjM/rpWIAM9IpPWI3dwQ54acKZytnoP27Sa0h532/XgrBmF5Jj1AZkunmnjUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type:Cc;
	bh=uxM1VmLjZ2nxPUWhti3qYeNXknEDXlY7brHt5kBUuxQ=;
	b=Qvf/2D60pgwhuFA1Xk2I3lBtILsRpzIFl14I5G/xaHIos9vZcD10kROkdOVNxiB5WNdR
	 5H6UnkHIcMl0C6BtvYEMwJG0IrLkeI55x19RKmZmDAIuOip/jVRFW03nuHuHXnQxfRLft
	 sI3qJON5LaQNk7kqVX7ynsAwYH4MFF2Cc/pKh8K3nkXUwnlFuxqLN+HMunLbYkFvxys/4
	 A3zQYsxkudL9sVgKOfuw2jHKhU829dasZ5vOo7jtiFLegHwufFqXJz0z1W9GoeEwOseIK
	 qwh1Rt6B3HN5P9z4M6h0fOkabGy/hoaygEscaPdarWdgpViToXqS7DKIGgX1CZ7A55g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s7MVX8Dc;
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F59606A339
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29F59606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s7MVX8Dc
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ae0a5c1715so69759281fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795693261; x=1796298061; darn=vger.kernel.org;
        h=cc:content-type:mime-version:content-transfer-encoding:message-id
         :date:references:in-reply-to:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxM1VmLjZ2nxPUWhti3qYeNXknEDXlY7brHt5kBUuxQ=;
        b=s7MVX8DckHQUo/rJSqIhTusO9NO6ZbOfaabeSgRRNIo0GzyIdVGfS+T8dndnj3Vpz8
         mk4Y72ou3B4lbLRpKtUMqvkfaNeIzScnQ79Q5nY//ZIbM32F9EUWOV00lewsm7NFhdbb
         gpX+z/mnzp0FznPcbuYReEshmW/RajNIKjXoTU8V1jaDhN9W9TQ5lb3IU2S8WY5EUvJr
         mznWf33Ak6i0SaOCyxt/FxhBtoRO/i/8bgXtNPz4j9RqxFbkTgZK/Aa6JTnxknCAfkaG
         GAOxjefzCKxpq1Xk/O5SxYCzMi1Bzb99D8a5+bqPCL2A+V4eCJBgYRDAYdQ5TaOAnT5Q
         OyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693261; x=1796298061;
        h=cc:content-type:mime-version:content-transfer-encoding:message-id
         :date:references:in-reply-to:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxM1VmLjZ2nxPUWhti3qYeNXknEDXlY7brHt5kBUuxQ=;
        b=D2JIVUCNmcWqg2RZp4ur1lTF2DFS69i6698Nbd7kOdvwwOhj5xmF/p8xzPUxL/OTfM
         wOSdcSagElpcSuFuVsqUmKowLvARqKcEZWzMZgxXslnZ5CWFiZ4UX7Dvc6ijOvW6RqbF
         bKArHJziMIs6im9rymZZMvHEYXeohxRtAF15Zqf59Tu6BNemQdzJut115ijplWhDwphu
         5kxjvhY85z3UYuzl/WDCr7n/WJiJSjLWAqsmRT68R8k70q67kpUjQwFaAEZyAgPhnc9m
         W4MLmOLRotzZeyKmbzCqOZRIDbRxjpx1vvXnuktKMXm7CxZEcAY8zDlr1Lm3ZEffQP/t
         9dzw==
X-Forwarded-Encrypted: i=1; AL+hErETN2xVhFa2JU18XIFjjbGA+G5hNkVIl2+Xs5wIT8x/lO8IAV8GcRzTdNNjDEck8iOWwzIvLXExrHAOoME=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Qh9Zp4hneuBmIhUdOzBxunQFWqit7kHlEoBJVFAJm472JFDAx
	n5Yj2isLjUQgj7Yy6qzeHhaUxkdO1ArCBGALOpZAn8YGxjeaPwBWiuckbiqfbrMXEP0=
X-Gm-Gg: AZFdTZfFiAK6QhpOq6tkYq3GrhiEZEh4t2LFq6vgWT2ak2MWeAZu91I0NVsET5KeHor
	w2KCcIYAkiysuINmAITpNTMIDpZwOvPJ6zc8SuFYzxAFfO0VhGm4X39ICUvCRp3xHSjTKnbDYF3
	+XQZjeTjHqRhxH3hJn4HY1514L6vRWOJGpwRxfTySI6gjAAOBDl7b3HSFprW4UTP5Tc7znaNl/f
	1y3A45ptIQ2FxTpWmIIal3Q7i+p4FgyGFhZ12QUdszOiFNTOepZxEDHqp+b/JZ23JGLZJvzs68W
	BCmmrg1SXu0zn4J2a+zGr/pf0jLbmJDXbRwS8Tiu7eMMrli801cYa+LV86Ny0OGWJhEzDjSgiTe
	25sXTai1vHQpryfQfF+fm6tuF5HkWqJ6dquxxCubZXtXxHYSyj9VZPVQ7g+j/L288z2jKuHTXrT
	WMwS7vMUbVQ2cQ5VK6+7UVEdpeVui7HTcBynsxbpVm7W+z3izWaxTSnpykDRak+ny1M6C0Jghwc
	rxzq2rDUYvG46WxOIGEJSiQSEsvMNNOFpo1SYhg6pUssJ8ZRZTis/qbdtB4KHKNjF8UCvvhlGP3
	ucg/20aI8PZt8pvF5Q5dM3HZG447GeYtmlDPFug6eefK6RPVqixkBlR/jWKeMoLcBd252nB9Iz6
	W
X-Received: by 2002:a05:6512:2509:b0:5bf:ce43:979b with SMTP id 2adb3069b0e04-5c1b7c0725bmr5707863e87.21.1795693261054;
        Thu, 26 Nov 2026 03:41:01 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0419b7sm5153112e87.55.2026.11.26.03.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:41:00 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject:
 Re: [PATCH v2 2/3] mtd: rawnand: Add Cortina CS7542 controller support
In-Reply-To: <87jylzyi5g.fsf@bootlin.com>
References: <20261123-b4-cs7542-nand-v2-0-9d9f08608534@gmail.com>
 <20261123-b4-cs7542-nand-v2-2-9d9f08608534@gmail.com>
 <87jylzyi5g.fsf@bootlin.com>
Date: Thu, 26 Nov 2026 14:37:51 +0300
Message-ID: <179569307151.4.4443063730583761343@gmail.com>
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
Content-Type: text/plain; charset="utf-8"; format="fixed"
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Miquel,

Thanks for reviewing both patches. You are right: I put restrictions of
the initial driver into the hardware binding. The SDK definitions have
two chip selects, 8/16-bit bus support, Hamming with 256/512-byte steps,
and BCH. I have removed the ECC restrictions and described both chip
selects in the local v4 candidate.

The 256-byte Hamming step is intentional for Almond+: it uses three ECC
bytes per step, or 24 bytes for a 2048-byte page, matching the stock
layout. The v3 hardware test read the existing flash and wrote/erased a
temporary UBI volume with that layout. This does not imply that the
controller is limited to that ECC configuration.

I also found the AXI bus attachment, flash IRQ at GIC SPI 18, and flash
reset at global reset bit 14 in the vendor sources. The updated binding
describes these and the banked data aperture. PIO does not claim the SSP
DMA engine shared with the network engine. The driver retains the
firmware bus timing and does not pulse the flash reset at probe.

For the driver, the local candidate now separates supports_op() from
execution and checks the sequencer format/capacity rather than an opcode
whitelist. The Hamming callbacks use nand_read_page_op() and
nand_prog_page_op(), with their commands and addresses passed through
exec_op(). Software ECC uses the core monolithic raw-page helpers.
I have also corrected the parameter alignment and run checkpatch.

v3 had already been posted before these replies arrived. I am collecting
both reviews into v4 rather than sending another partial revision. The
ARM build and tests against the real core operation builders pass; the
new Hamming register/data sequence also agrees with v3 in the host
model. I will check the changed path on Almond+ before posting v4.

Thanks,
Fil

