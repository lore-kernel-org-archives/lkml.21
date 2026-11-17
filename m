Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937709;
	b=Q+ttRe/W4ZW1fgqm8qqQtEOrlIhUwyWhjJqXJqipT0mRe0LovKbdrcwUjVNGDNocVlZ0
	 G3t19Sdzdqir+1KpG49XvKXFPywzeN8UW5YvVl/psm0bB14+u0bUi0XvEMnHMva2DZTR1
	 8iHAljf68MtTbGy3ilxJprbbsghz3EeNL0tM82f0mr9fY3MGVOIritW2WzZaZiNebros1
	 1UDC9TXTwSqHRy4HB8co5qLV6gTNR0sHg7oJLY0HOafRnGX+3N1VVHxfFbOrYcQ+nb3P9
	 XaIeL9cQNMxFVHPHy+7e6aCUlLpZVOiGRmgEpqBF4N6NvkH8Y5zSsczcxzYirOjZHBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vgnwr2P9uJ+QpfiPOUlt8DPsw41jue0qV/UrisGiK9Q=;
	b=OJGDrTOHF53HqFfLmrGcAY31mWgcD++NzLMBRwa6BMYRwHuVuPvkHpBYwFQZf3Q/DKvr
	 /XDBKAYIXViEnfTQeqIbUBkrjtEQb7ZNFBG7948BQJorB9aPzSj1bNJmHVSoW6kOBA8Tf
	 tIK/dkMmz3KdbmaHqC8fXe227cNJkS3t58AO8S41+CzYwEDqmc1yNW252hvyVHnE9KfDG
	 1+abul/+nGToXpKoPd4qqSYwEGtRWx1yrdCt79ngLO9lkjbxOU0j+0M6DFfAqzp7TLYiP
	 mw61escSnE0shjjAljkq3z58D1VxVMDO9r2NZ1EddS/DU9iV66dROQuier6fpRO+xRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rqhDE/nL";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355F9606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 355F9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rqhDE/nL
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49465892f7bso27836f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937707; x=1795542507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vgnwr2P9uJ+QpfiPOUlt8DPsw41jue0qV/UrisGiK9Q=;
        b=rqhDE/nL59qzysxrZBMp9N0c8t9CwG3HJ17ynNInH6IzvB7CllhOIxIzhnNEhwyQ9M
         La+lVAWJhd49w76wt8b3GP1Gf+pg1A5PekCQYPlQRLEobpSxBbVPzL9HUFuJYyb0mK8A
         80xaPFc5ypkeyKnMlpVwE6N2+jqJJlj97weqzjO1dxSlKLnQnnFVkn1yQSKsySk3IUKi
         i1bURKp7Xyq3e/tELhQ1WVQV6P0wldRc5pqsuQgg4v3yKD3AzmIVXVYLf65Xa7xBiHhM
         zGNHNKZRq1lWnEEEOUsHgUVljsK5VxdW5fsswg893xoat0wj5uamijKM9ovaCAN1o3/9
         yRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937707; x=1795542507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vgnwr2P9uJ+QpfiPOUlt8DPsw41jue0qV/UrisGiK9Q=;
        b=PeklbOeHg6SrKIq7MLeTkGQWw5i2JH34tN3785dD5I7GjzK3pTTkthjlNvsRrQBe9X
         RqkG6SbjABZP21SqQ5WxtsU6P/vMLGDGEZs49AmC7BHHwx0PVyedpdt7142teGR79Dnv
         hx/as7JgdXL8XFpF+zi5XoDWryDSEJ4n1zXYJZUhJl+TSyZXgVp3sXsVHaT8H6Ut90MQ
         YYDLvGiDB+NaEDVppHv+ikShOYeNKZdQHl7cZLSnSAYXCGbXV6lsJyslmlpn7+XVygX1
         Lpwfgten5bnsZqi32QNMxXwa6q8RHsi7EMDroVicHgtXpaYRLgJmkaO+0TsqPbZ1IlzT
         Z5xQ==
X-Forwarded-Encrypted: i=1; AL+hErGS8R4SjjyrovOlqDrgYwmu4p+tpYLjq7gSXuikhaz3luDTcESajunhN3jFhN5hOYWbi9xSzUH2hs4kmgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iCH7D/wkEtBHIpMzs0EIBMyR0pmgsf9Lb8Rsq2qOP79R6+7AI
	ZRi2tbWaZ4ytIeWY46Gyan4RLuVSieAa/h47M0rvMSjYI65hz550sFUXjhR29TGXdzUzn3Gr
X-Gm-Gg: AYBFou3Kezb5Td3vvr2oJhm7lReFe/vEJt+H9tv9m7i+AOMh/ISePtQY2lbthreqYRb
	V8JcRy15nP+aAc6aM+lVqf6RLWAuCaI2/n0MSOoe8hk4wC7cYfpMwJ4ogVbfN0PvlvQaey05Jt2
	D/LrIFUysX9JXf6FzOIRV1oe9jp+714+yuAOzESUyL4l/l0ao2atL3UuWR1d/gT/M13FzTw+nB3
	w5bFNqOaeAf/a3t83TtAoNiM4vjGYxR6quD0GbUIImZAuhbNLqL/ZQuMy2KCoqMorKb+CRSfC0V
	dtDPl+LsadPhOQGdEa9BTb7J4jTf4yVn6Y4DVBYb564ibtfWuo9ZtMeiwdrzXEfzbzu3MGDco1Y
	BV0m3n7kQAynP2Fjg4UnMBi8LuimRcN2XGb0Uer2kpL8IBlrdcgk4BLekTS8NLpkKSLDGnZ1ptM
	bemtENbijB8RsLws1ZjM+QrNWjL9EcRe2JtZrXIbNbL0q12kwAi9ApAxIss7SNX18vZ5Ca4SWQm
	nX1SgWqaQHJbCP5Z3SZgzFGmSKdnPb6HC9rZFeLyEM4irl9wVTGB6dmoweUiO+A2bwZWYdtF9pQ
	6K/CHaWbVhDpkHBctJXfcT9ewZsjMnxpyEcIBVqebUfBKeA=
X-Received: by 2002:a05:600c:8483:b0:4bb:605d:8e92 with SMTP id 5b1f17b1804b1-4bb605d90f1mr250423555e9.32.1794937707327;
        Tue, 17 Nov 2026 09:48:27 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:11a1:dc8c:1ed6:51c5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d287f92sm413055e9.0.2026.11.17.09.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:48:26 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: mlevif@gmail.com
Cc: andy@kernel.org,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH] media: atomisp: csi2-bridge: Only change the PMC clock rate when needed
Date: Tue, 17 Nov 2026 17:47:35 +0000
Message-ID: <20261117174735.10182-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112-atomisp-pmc-clk-rate-v1-1-d6b3ef392ccf@gmail.com>
References: <20261112-atomisp-pmc-clk-rate-v1-1-d6b3ef392ccf@gmail.com>
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

Hi Manuel,

On Thu, Nov 12, 2026 at 03:39:29PM +0000, Manuel Levi wrote:
> atomisp_csi2_set_pmc_clk_freq() enables and then disables the sensor's
> PMC platform clock before setting its rate to 19.2 MHz, which leaves the
> clock forced off in hardware.
[...]
> The enable/disable sequence is only needed to change the rate, which can
> default to 25 MHz on Bay Trail. On Cherry Trail the clocks already run at
> 19.2 MHz. Skip the sequence when the clock already has the right rate,
> so that the bridge leaves the clock state to ACPI.
[...]
> +	if (clk_get_rate(clk) == PMC_CLK_RATE_19_2MHZ) {
> +		clk_put(clk);
> +		return 0;
> +	}

I ran into the same problem independently on a Lenovo ThinkPad 10
(20C3, Bay Trail, Atom Z3795) with an IMX175 rear sensor (INTCF1A,
driver pending on linux-media) and an OV2722 front sensor, and sent the
same change, which I have now dropped in favour of yours.

I tested this patch as posted, with the atomisp driver built out of tree
against a 7.2.15 kernel, over 10 boots (7 reboots and 3 power-offs).
Both sensors were registered on every boot, with no chip ID read errors.

On this Bay Trail machine the clocks used by the sensors are already at
19.2 MHz after boot: the DSDT lists CLK0 in the IMX175's _PR0 and CLK1
in the OV2722's _PR0. pmc_plt_clk_0 and pmc_plt_clk_1 report 19.2
MHz, while the unused pmc_plt_clk_2, 4 and 5 report 25 MHz. I read these
after the bridge had run, so they don't show on their own that the
skip path was taken. Together with your clock trace results, it
looks consistent.

Tested-by: Volodymyr Chapman <volodymyrchapman@gmail.com> # Lenovo ThinkPad 10 (20C3)

Thanks,
Volodymyr
