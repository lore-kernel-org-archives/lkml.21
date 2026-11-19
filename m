Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111741;
	b=Bzru4RgNAKR2nTtTvD1JjDWNGnUE5j4FSAEAdM2DzizEL0iV3V85C5MEd3/scNb9qT5i
	 jF47lq/GBh1+xFz/WSnfYNGNpVIiX3Kc8oMgBJTdZNlHjz3TVQnqq+donpYvkzkbPGJh5
	 qu09mKpj8b9vdujXLuDwEump78NCOAKXw3T0fy23lrIuPIVw8orTaSGEe19khoLHvm2vP
	 dSQUN8pqtuM0Kq236dzuZj4IIkn8JMBxLc+nZ1IfdSJRhqjdb2tqi0kn4BECC0fV3kHg3
	 LrmgdWp8HMSvuUeSkWDS8Hb4WfdEg/n0JDoDudUy3iXu1+vOf1KA/KNK3sXQxrsaqGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=6LpUWSQfpzuimr5UJ1RUHtokD4yvNzLYRTwB5Co/Fic=;
	b=K/ECsMIDYw9xzD9iejooxhKyjahJtztndOiNZ6qrpG/rHChd0csDx30mX1bC0ppP4Iml
	 scZkKMHMYHWmNueEI3OnR71pjw3RHWF6RgGEYb+/955cG4NB1hMwcX4kIcsCYXnzK6RSz
	 Sil2nIvyPOVWkAFd/p8j/95gjNCSnRY6QRWVrO7r/lgamtAod2+Q5HANE8pwloII9cu2G
	 fDnD+iM+T/Bu01k8L/OobURD6yuPd0zarwnhge0eJiVINegtq0gyUX335WHXTzMNBODKp
	 sLx1QKiWKuVhLFg3AJvSZBwL1hvEQszdN8P7/cz3HtzapZEjy4qiIIIlaFLdOupb/CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0xQrt2+x;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF08A606A336
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF08A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0xQrt2+x
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-490d838b425so48816fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111740; x=1795716540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LpUWSQfpzuimr5UJ1RUHtokD4yvNzLYRTwB5Co/Fic=;
        b=0xQrt2+xsPpTS16h3fqx266qEAuKwmj3GnN9xfruwcUqV+MrIs9fxEifPXtj8vL9k5
         hCoeDv1cNCa63azX5ESc3UsAMQY27+Xz0i5xy4B7RRn7wXZxz4MOXzOwcNFjkYQdY71Z
         Ek7+egVgUh4AqVuPcR768nicgIDH1rOS7Fosc8i0j9PdM1WvutZtE16Lff8ChmWT0PCe
         QpLo5n4HpdcWl/7fE9cFHduuLnuocZEdl6vuHic3lhDwfEPvyzuCqEq5A7MNRMEwWrNr
         l0VmQhyvp0kpDzpiyBsaPjh+tT/yFm36e/LlYCt8KFBqRqODXcx7zJyL3notmpHti1fk
         lGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111740; x=1795716540;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LpUWSQfpzuimr5UJ1RUHtokD4yvNzLYRTwB5Co/Fic=;
        b=fv2ySjN1d2VlYzKb/v5Z9Ub+0cf4d1MdC89iN7FJUAONygA042SjQ+WSwtOHfXt8X+
         e6KCD88G9+6xQq/+7vpxQmq9WIiOiENp2VtKusjCbvkkeG6hqBT+uPcD1IBguyNCbkXI
         mQuVnYpISdptUmvKikb27wPp5KyU6OOYkIa4Tu5OcGTUrAMErPcS+usJHEuhXuwzcQr3
         qTgbg4B8Cc2sgvf/TmXAhEv7AwgNITeVNT2zeCD54tBRkZFJJZnB828Nw01x9FpGgnMt
         qUywBd8wSUzoylyAutoddXiR8iQVFdVsaZNB3GGKPGvBaa1G66DmI2mvh8qapuY9Shct
         1M6Q==
X-Forwarded-Encrypted: i=1; AL+hErF3e0IJBsxm2Hd0THuhvRQmPOnkAfgWQ84JokJW3sNiUH75yKv4UuVAyFuI2eDJwbToRpn0TYbbwJ9M/18=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u60xRpOIKCUaA6k0oXaBbXPlm751hpuajkcfe/obdjyxgqErU
	ZtpMdhxPdlqpBkUJGNeefID/okJVKUytP7PM5XKVjJw53ETj/dUawu2m
X-Gm-Gg: AYBFou264MEcAgrLJt2oDUxM7D68nboQlGRsvR430T2WPRGNft3CQduEO+yqGTGuZG2
	T9fUP9ahdvZk48rPFtGr5OnwEeRWYQBW6l1MXeRfXrzkbptkHQmUT80rSo5rrFnIx5uy59sZZ2I
	KUhc9++Fqqx8nt6qrebk9MijIL54dB4Aa1HRRwJtY8+4alaXaS/SrPMUF751cMCY1mJL0XAOxXz
	qbpqWmgu5kGRePXEZPzcWABhwZeo6W1HWVz6vJrh0ldL4FRIXnRIcGawPVt0IvpYeCjONUN5haV
	wFQ0+bpx1pBz520DWn9gPEjMgN7yIWBNEQ1rTu7Tyt8MHBIeYt69+vsjtcCUPmF7QneyF7bgUg/
	ooyQzfO510iLjm/j27gumMBnlHNOoEDCpN5WxG2B4rHPCjLCsHjgRfMlmBruDE9ZpBCDCVy25Ah
	M8ok6cBvMqUdR53dHvNRo6uhxu8UUHpQzwfiPHNT0avOv/mioZ1EmjXWfH9+CXGNjR6fm4G3H/K
	+RQ5E7QL56K1WkaMPrttFikcStIPb9WXaPVlRq6dLVmGC0eDmdBhS8njdA8YXMCZTmeXxXHRvus
	4j0MXpV4gM/ALtMshyOmQSM4smYzbuSvIHITHWpCPXuzgyp+YnVQuLYmYkirYVNb/ngQ+SsXpu6
	V
X-Received: by 2002:a05:6870:dc48:b0:491:47e1:6283 with SMTP id 586e51a60fabf-4bc810b3516mr386675fac.27.1795111739744;
        Thu, 19 Nov 2026 10:08:59 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc61081159sm452437fac.15.2026.11.19.10.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:08:59 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	wens@kernel.org
Cc: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v2] clk: sunxi-ng: a733: Keep SCP firmware bus clocks enabled
Date: Thu, 19 Nov 2026 13:08:57 -0500
Message-ID: <20261118-a733-fwclk-v2-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <35a06829-dd6d-4ef1-aadf-245d1e7ca433@arm.com>
References: <20261112-a733-fwclk-v2@gmail.com> <2374cc08-fd47-435a-b1e8-c7e9a61954c4@arm.com> <CAGb2v66w9XYO7CUFrvJq2HL7ELABptg=3Bs4XbZxMh7VU0pepw@mail.gmail.com> <124bb855-f2f6-4b10-b0be-99fb53cc2ee8@arm.com> <CAGb2v65A4rAFTFYyB_sZBC9O7fb0TJWE1YRjdGrLeNgwyVzcSw@mail.gmail.com> <35a06829-dd6d-4ef1-aadf-245d1e7ca433@arm.com>
Content-Type: text/plain; charset="us-ascii"
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

Hi Chen-Yu, Andre,

>>> But I think there is still the arisc on
>>> the A733, so this would more likely run the management processor (SCP) code?

The A733 CPUS domain has both an E902 and an OR100 (manual section 1.2,
figure 1-1). The vendor SCP firmware Radxa ships for Cubie A7S, called
"arisc" by Allwinner, runs on the E902: vendor BL31 writes its entry
point to E902_RST_START_ADDR_REG at 0x07032204 (manual section 5.2.3).
Radxa's BL31, in its system reset path, sends a reboot request to the
E902 through the CPUX-to-CPUS msgbox. Exactly where the no-flag reboot
stalls is not known.

> The question now is whether this SCP use case is something we deem 
> useful, for mainline. If it's just about to run the BSP firmware, I 
> think we shouldn't bother, we just don't support that. But if we end up 
> running something like crust on the E902, then it's a different story.

For me this is only about the vendor BSP firmware; I have no other SCP
firmware for the E902 to test with. Upstream Crust has no A733 target,
and the A733 TF-A port under review resets through the watchdog, not
the msgbox [1].

>>>> So, not a fan of this. If the loaded firmware somehow needs some resources
>>>> then perhaps the software that loaded it needs to somehow tell the kernel
>>>> they are needed, like the bootloader patching the DT passed to the kernel.

Vendor U-Boot already applies DT fixups, but the A733 CCU binding and
driver do not accept protected-clocks today. A loader-declared handoff
would need a new binding and driver support, plus loader changes.

> So I wonder if we should just pragmatically add CLK_IGNORE_UNUSED, to 
> not shut on the door on this SCP use case later.
> If we ever only want to use remoteproc, I think we don't need this patch.

CLK_IGNORE_UNUSED would also leave a future remoteproc driver free to
gate the core. Chen-Yu, if you are fine with it, I will test it on A7S
and send v3 based on linux-sunxi for-next, with Andre's comment wording
and a short test note. Otherwise I will drop the patch.

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55200

Thanks,
Enzo
