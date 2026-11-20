Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172318;
	b=46v9Auri/Ss4FQ09q7LwnDwDDiHHfubAgTM6euqdzChwe+Nh4uEAeurkrkqrLsJ05jSB
	 fiJef1t40Txee9cSQrpGGk85O9m7jh5XcMRZjq7+cpihPYsAJc2qjYWKeJzx7b70beJOP
	 Flej+Jl1YJJM0TfMlGYYMc97SQzS6HVpGsWC/NQdTHsuoIGBrfB5/f4v49H+snM4MVmQY
	 BoYN3p4gGdQegI1sSENvO6dJ/YjGZcswvEYyF5Vu1yAX9KYc1ZKmKBi+jVVoUFQ3rSHAa
	 nVxkVLB9BxtMScFay4CsQ2nnoYNtWVaoOt/bkclQ/IvX8jOMqaAF+mu2J7ot0LUkrgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ex6Z1jSQ+4dxlVRkCcqyees5rqcGmwfbNgXE+eJUW5s=;
	b=MGrzbV4mgplh22OgIVM1EiBsELSas7zqMiR8+9EpktWyY16wFD4q05sSRxY5Tann8EzU
	 O746A/hnL5TyMIM8Crh1a/0STZ9vCGIfb6+rpoK+ccSdGwiTA1CJr6rDLQnL9RAEpoo/0
	 jujkEtcS4jOJTqw+OyzMMHXBwGdQvtZ63+w63w7MpGIr7XdSAF1B3efG46n8JVu3jBk1o
	 kkiH1hjVmXLAccbRuilh8n5aRNM6QIDVAe4orRSMPy6o6SxXukVgU5HkXD1U4FS8/ShHr
	 P8TUXUKvcdadODj7vSLOC1W8dT5MkQFLyV6TWdlTVvj/GjPpka0aRrMDLu7vIQu0Xbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x4cODoLm;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36EB606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F36EB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x4cODoLm
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50a4a2132cso115515066b.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795172316; x=1795777116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ex6Z1jSQ+4dxlVRkCcqyees5rqcGmwfbNgXE+eJUW5s=;
        b=x4cODoLmAW83GYAIaFRCuxIT6N0LYpC30QEtfS4462cRHjQMTIIVo93y07NiFLQ7Vk
         Zl4qMcypwawUtqxIjo6ePDrcRjR4Tw2KMkrVCe4o2eh6A7vwqfBc9DK2OMua9NvWgsAU
         NUnAaxXIIIj1yG46RTPLzBo9Mj0C+VPk0Wsb91PiRh/RUh7oHP42XCrwkT7+5ESafeVK
         76HwVKAqDkdPdQZeHlDTXGJO9SqtYdgh7T58+NCG732FL1kW2fnOsEvwp9KIFg4FP1iR
         6iXLgAltWtDJswWKlPZTOTFs745LhS8Yknu1Vnk5X5GmSE8r/SjhnJwj4YTQVcLscHrn
         5BxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172316; x=1795777116;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ex6Z1jSQ+4dxlVRkCcqyees5rqcGmwfbNgXE+eJUW5s=;
        b=1vgpNwEqnaFPo7TiaV2gdTLoxsJtuCwm4SN6yuoVKDnk0dV+V5LfRjmpgNa9756Luy
         /wAh4aGKpLMxak2U3xZPf1U0EUaFufY0QQJOgd0ikIW1dvF7xJZuhEvxxfxVcgBzr1ap
         UrwPAxRS/dDmzyWv7s13attiVTzHbiO2MLTNoOUpE7J7erHaVfAogf+PudqMhgVsk5+3
         19q4pXIOvHjuLrixC7FEdeWXZyAlVNxVI7UshKKBqouWAVcLLN+z30uKnx9/IkVMEbs0
         KBOkJF4BUQt9laxUlMLOPY2+E8F0VPMIBagsdaTKpTmq5zv2NQnOf0iEi1wYxSVRc88w
         0fDw==
X-Forwarded-Encrypted: i=1; AL+hErHi2BYUlilqPkwWj7NBCY7vzEEStjZy0yJPrU/nf5Lss1gvqdpjbM88Z4MhW+VZsuCv4p3nZliopwzUbmg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fso4BRPbbyJOvUJ8ClcepXdoH9uYHdYwTAtuR1rnBtd13E3n7
	mLYCC0Rp5Vj6mJ5FTPhOmPoYECdDt5Y9xRbepJ/bmmixzqAl8pgAq56Hg/V7lOjzRU4=
X-Gm-Gg: AYBFou2ZzXBKtdbFap1w3slb/L+5DMFHoAWYk704rNe7cnwF4eM/hQM5WKa7QiS4oYL
	ANaZ7rmWSk99jOPPd7mQOXkrmbaGKvcLMSUnqA5jqSza4NvbU6NsCH5StAoGZaq0PjvuyovvpfP
	mL6XWlmJHjotg1e2qjEw75gBetf9Zkb38pvqQLbZZexQznJe/pnurSFE9LSgpojXRtI93sj8RTF
	vhhKWZksdeMN+mKW7+84PFbnyMRRA1b+9hh7fd9Nv84Db5zbTk1ZsrbbNwuW741pulvYcz9Wnxi
	5uDGwF/cxt2HR5/dDzZk8MWJ/YVRkIqmYHJqTc7JVA2isN7Vn/95hhTgNrf7pkn/o8EXV+BtFV6
	bclBHBcaJW+/ZK4B7n3Ohexl5a0970siW765YG++mXQS7qoGv4ji9yvYazoaYNLvahI2lGiZRWy
	f6mKmulCxz/Fpjp/V4PP7MIRYLFHcPQ0jJvYhk6ckBkAuXRxy3jmzYNhMqBra2Rm2sDmgbW1L18
	EtOPHys68csl7BncbOd0U4xwqLhATl9+y+rHID9tMEmIkQohT80ASa/F/GN9cIV4Nkw8BcP5zUi
	SYa7k7yrzoeLbBsTpB75jUFVzaMv+V8ogZKIzxJJayTIEedWKexg+pWsCwNjQpjTZzU9L00dXgF
	mZWmvNBbyX4sgUkrWCwF1bOjM3avUa99PeT6hGuRsTjA=
X-Received: by 2002:a17:907:9625:b0:c49:c76f:dad4 with SMTP id a640c23a62f3a-c513ab36170mr274998766b.31.1795172316192;
        Fri, 20 Nov 2026 02:58:36 -0800 (PST)
Received: from nixos-macbook (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm86608566b.39.2026.11.20.02.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:58:35 -0800 (PST)
Date: Fri, 20 Nov 2026 11:58:33 +0100
From: Jacob Procee <sn125164@gmail.com>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tipd: cd321x: replay the plug on resume
Message-ID: <20261120115833.53ab9076@nixos-macbook>
In-Reply-To: <20261117124710.GA515128@robin.jannau.net>
References: <20261112113005.16418-1-sn125164@gmail.com>
	<avw1kOqmrUii-msr@black.igk.intel.com>
	<3bc5a31a-ab2b-40cd-a030-d0498002776a@kernel.org>
	<20261117131713.2db5294d@nixos-macbook>
	<20261117124710.GA515128@robin.jannau.net>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Nov 2026 13:47:10 +0100
Janne Grunau <j@jannau.net> wrote:

> The interrupt controller (AIC) doesn't have functionality to configure
> IRQs as wake up source so it should set IRQCHIP_SKIP_SET_WAKE. Does
> wake from USB keyboard work with that changed?
> You might also need to add "wakeup-source" to the dwc3 nodes.

No, it still doesn't wake. I tested on Asahi 7.3.4 (j314s) with a
local test patch:

- AIC and AIC2 irq_chip .flags = IRQCHIP_SKIP_SET_WAKE
- dwc3-apple: device_init_wakeup(dev, true) in probe, and PM ops
  that call enable_irq_wake() on the dwc3 IRQ in suspend when in
  host mode and device_may_wakeup(), disable_irq_wake() in resume

The keyboard is behind a USB2 hub on b02280000. I had to enable
power/wakeup on the hub by hand (usbhid only sets it on the keyboard
itself), plus the xhci and root hubs.

On suspend, enable_irq_wake() returns 0 for both IRQs (113 and 115),
so the AIC flag does what it should. The keyboard stays connected
through s2idle and is still there after resume. But a keypress doesn't
wake the machine, and /sys/power/pm_wakeup_irq is empty afterwards, so
no interrupt seems to reach the kernel at all.

I didn't add "wakeup-source" to the DT: as far as I can see, neither
dwc3 core nor dwc3-apple parses it (only some glue drivers like qcom
do), so it would add nothing beyond device_init_wakeup().

My guess is that the halted xHC doesn't raise its interrupt on remote
wake, and a separate wake interrupt is needed, like qcom's
hs_phy_irq/dp_hs_phy_irq. Do you know whether the ATC PHY or some
other block on Apple has such an interrupt, or how macOS gets woken
here?

Power cost, in case it matters for the default: overnight s2idle runs
with a key plugged into f02280000 (lid closed, battery) came to
2.29 W with wakeup enabled (atc2_usb stays on) against 1.96 W with
wakeup disabled (domain off, device re-enumerates on resume). So
keeping the domain on costs about 0.33 W.

Thanks,
Jacob
