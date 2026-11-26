Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697999;
	b=5IwKcK/P76MJ06PsT3EOAWK40Hc27mMLdCPkA59te+SkCKE0S1R8PXEdLYts0LHnWPgD
	 ghE0W0uP2mTiJPi8KVY2A5TQfg7I6NMUeZnP5edxBAlwmnlQyI5oqqPeqVXaq9U9QkCa5
	 8UdrKzYYVJqsbWJxJdXBA4jRc0ObtcmMFyJmEm8lQQrRmpUPTnpjK8FXlTBn/74q8qCR6
	 9iycQI7xNXY+2+0ch+jgY4bP2qBdyGyVfOrTzXDPiCQ4To72tHgL/yQLID7Oe65mN8ico
	 ZRH1foR4FVR6iJJVtkLw6Z39N2FSo8YLKiIb7S/MWhH298Zgt+m8i32lKz37ddtiYQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qBf/pzK+uJDQxotO7zZtnUx0PFHSi9S3B+LhgAk65HA=;
	b=pvaajOn9QvS1w24imDm0i3P617uhhKL1xAOTVQBE+ne9OY4q4vQn9+e6ajbnpVtAsqoJ
	 QB/FVIBfr9FyBhjfAQP6qVM9quWVX2HGYRo4YifxmEaWAAQW/I9F9YbVXUDo7CZCdMdjx
	 lo1n5jpqtJ2x5WwwO5IWO0nnxf0IBrq0xhqZcWoz36mvYDIMFmLkJrUXO0oP/y6GOjtTN
	 V8iLrCzfMGkD3xZdOrkExVse65Q+wWuW7XRbGRIEB/qnIs2Gj64bZ6yEQ5dtzJjVAKC4a
	 0MJ5p/Ggk1Qdb5CDnj/naaiu1yl9aWuKINPYrEG+rwteYjwaFuWcpxUV4Mv+x6V9rjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=Ni5icM2E;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C46C606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C46C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=Ni5icM2E
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-71b7b706946so840776eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795697997; x=1796302797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qBf/pzK+uJDQxotO7zZtnUx0PFHSi9S3B+LhgAk65HA=;
        b=Ni5icM2E74nNCK1kkhfleyOOlHVlks2ELVDV8SF+XLnFb2IkGSG86FphXdWme0o72F
         Ee5/PKGCxCll00Nx4gF6NK3jsUFm8/g2R6kV0CBuFOR9+qyfXgzICNnocGA1YS2vOBoe
         vWTxmTShzmkVYayLKrpWJ/z+XJW7tJ85GBfdGNgYWt+pd/IwgecaLttZfz8qHQtNN62s
         fmWP5SvnQIC65/yZKKAeKbBDKCINV1ANPBHCIAZheOe1ulVuoDIanWFoIxaie5fJpTTd
         PI7NMFULQDRzaOzLQawMaDir7XHQL0E1oFHvzTtUBcQ6WZzRcDNRP/GV3rtV5oHBPwBM
         CnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697997; x=1796302797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBf/pzK+uJDQxotO7zZtnUx0PFHSi9S3B+LhgAk65HA=;
        b=dXKpPs5eoHa3tQ1BJpLlIRhW4bfcH1H0SBDYBbafRb5xf4w+7JTWxn9ZlZb1q3Anow
         B3UxM48SBXOULeJfp3zKcFHKBehs86VaQxl7oXmp6wAb6WJ8mTRv2Tp52yZUYFQOhCKT
         9V9PpEjFF/LGTXbF1IlzmehSbqRsaHdRUzNiyBIdLT2OW7ZCmC0HmLa0gfUopAQQDkeX
         3i8KmwEKoWh7Itl1HFXsWWRbrGZZkK/i2bK2GXjJfLAeVFR8YaLvgI4oVZI/F6khYiut
         uIBMjdmqJgV5VzLb/dSbHpEIeA3Qg+SeFm1zN6mmlY6FXdA+w6PEdxnX0L5aVRQvVPkP
         zcRQ==
X-Forwarded-Encrypted: i=1; AL+hErE6X+Ib5AxxtL0ek+KLCZinIT05b875iGdaceSsEKf70g5iyVZZs/vSl4EFeP8oZ1nhsjOfOFoP7HGXM5E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hSUE4IRy+tHVwnlPbLkoUL8PBq35b1JIgfFrOqqU0wDioQG9w
	UdaBScWIUg7nu0bxC2W6jWAVRRcvmbiFA2ixmhreFeHQ3q3sWQRCsvkWvydjJnrWq2I=
X-Gm-Gg: AZFdTZcRy6KE2HWEFG6iKeJs5qBDHnh8fMtuvd+eLAvo8FS4xKlm8Y1hlsyQmBf/0OJ
	LVuA/Yhxzf1M4obvV/RMYZDEJkZSkqYMN/zg0SSu0iNWdS6j+0cEiMltGFS7gLke6t3U8MTj5wr
	vxxnFQ/A3kKwPjNcD7+4Bq7LLlgG9pXdkffCf3oIXzr3s8M8puqdYh482NWtfgbTKf7By3GUyFU
	dZsbUXnxKO7LgBfUeGVh+Jim7myVBUGN1cu97MPZ1NZV+GoDZuJNFl9HutA4mX3TIw37Wi708Rs
	cUT5GCaJRHsQ+vRbn6GVVa/LxM4MJ46BnL95ZnTjJQpbz9pzv/WJowILAPVyRVeryh/r45337QI
	mtniCCTZooH+wENwlD9TVEqMBWJ1vA54SwtA07bW3vvrGddNqGpUOpSwq3FJiVeaSP79GhOrzpH
	KFO94rMMdeO9S1zqQHIw2ljMC5sMabHGm+RE1+n27DPJ+HZ/l6mdmDzniSe4pOxh1BUUBUAQHsp
	a47ivpQnLdpDSn8aPAE+0eCWYDk4i+97niG12zqwIgG6HmKqSOtlGV0yL9mG4DFTOhls0pn7HBy
	fspU6uqSs9eyRC1frwC/A6RGmactE3xF
X-Received: by 2002:a05:6820:809:b0:71b:40c:9d86 with SMTP id 006d021491bc7-71b394b3c12mr14780581eaf.44.1795697996937;
        Thu, 26 Nov 2026 04:59:56 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380c6815sm13831517eaf.12.2026.11.26.04.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:59:56 -0800 (PST)
Message-ID: <e20fde6a-3389-4084-a2de-fee5426a74e6@riscstar.com>
Date: Thu, 26 Nov 2026 06:59:54 -0600
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
Subject: Re: [PATCH v3 2/3] clk: toshiba: introduce a TC9564 clock/reset
 driver
To: Philipp Zabel <p.zabel@pengutronix.de>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, abelvesa@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261125202141.1288493-1-elder@riscstar.com>
 <20261125202141.1288493-3-elder@riscstar.com>
 <579859f0e1b53aa6506492a2e5d073f3f991014c.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <579859f0e1b53aa6506492a2e5d073f3f991014c.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 3:42 AM, Philipp Zabel wrote:
> On Mi, 2026-11-25 at 14:21 -0600, Alex Elder wrote:
>> Define a new platform driver that manages clocks and resets implemented
>> by the Toshiba TC9564 SoC.  There are 21 gate clocks that can be enabled
>> and disabled, but currently only the clocks that are (or will soon be)
>> used are defined to be controllable.  There are also 13 resets that can
>> be asserted or deasserted, but support for some of these is omitted as
>> well.
>>
>> Two registers manage the state of the clocks, and two others manage
>> the state of the resets.  All four registers are found in a region
>> mapped for MMIO.  The region is provided via a BAR on one of the PCI
>> functions embedded in the TC9564 SoC.
>>
>> The I2C and PCIE clocks and resets are treated as CRITICAL, meaning their
>> state should never be changed (and a warning is issued if changing their
>> state is attempted).
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v3: - Fixed problems/garbage in the patch header
>>      - The Kconfig option now depends on RESET_CONTROLLER, and can now
>>        be enabled if COMPILE_TEST is enabled
>>      - The generic gate clock controller code is now used rather than
>>        implementing a custom one
>>      - The PLL and internal fixed clocks IDs are no longer available
>>        outside "clk-tc9564.c"
>>      - The PLL is initialialized, followed by all fixed rate clocks,
>>        followed by the gate clocks, to ensure each clock's parent is
>>        initialized before the clock is
>>      - Updating the reset registers (read/modify/write) is now protected
>>        by a spinlock
>>      - "Unnecessary newlines" have been removed
>>
>>   MAINTAINERS              |   1 +
>>   drivers/clk/Kconfig      |   9 +
>>   drivers/clk/Makefile     |   1 +
>>   drivers/clk/clk-tc9564.c | 456 +++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 467 insertions(+)
>>   create mode 100644 drivers/clk/clk-tc9564.c
>>
> [...]
>> diff --git a/drivers/clk/clk-tc9564.c b/drivers/clk/clk-tc9564.c
>> new file mode 100644
>> index 0000000000000..306781e2f7b4f
>> --- /dev/null
>> +++ b/drivers/clk/clk-tc9564.c
>> @@ -0,0 +1,456 @@
> [...]
>> +
>> +static int reset_update(struct reset_controller_dev *rcdev,
>> +			unsigned long id, bool assert)
>> +{
>> +	const struct reset_init *reset;
>> +	struct tc9564_clock *clock;
>> +	unsigned long flags;
>> +	void __iomem *reg;
>> +	u32 mask;
>> +	u32 val;
>> +
>> +	/* Warn on any attempt to change state of a critical reset */
>> +	if (WARN_ON(id == RESET_I2C) || WARN_ON(id == RESET_PCIE))
>> +		return 0;
> 
> Can't this be checked at reset_control_get() time (in fwnode_xlate) so
> that critical reset controls aren't given out to consumers in the first
> place?

So I'd pass in a slightly modified fwnode_reset_simple_xlate()
as the fwnode_xlate pointer?  I hadn't thought about that, but
it's a good suggestion.

>> +	clock = dev_get_drvdata(rcdev->dev);
>> +	reset = &reset_init[id];
>> +	reg = clock->ioaddr + reset->offset;
>> +	mask = BIT(reset->bit);
>> +
>> +	spin_lock_irqsave(&clock->lock, flags);
> 
> Consider using guard(spinlock).

OK I'll do that.  This will be the first time I've used this...

Thanks.

					-Alex

> regards
> Philipp

