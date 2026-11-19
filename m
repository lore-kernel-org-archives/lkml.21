Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091617;
	b=U5MCsQeEtJPriKGVHd7OU+8m/TFH6XhBWrps+u/jtpAHagesyTijcJptom7cHCqjoNMc
	 +XmbNCRx/Dt8XdRsPazgCVNrWh9dUFo4RTBXbHanW9RMRReoAC7G2Hy/SxjcTnQeCJYk+
	 wwaDmq1pmCidFrg711DH6o3pYMEDf4SWqwW/W1KPQvlmmqPImyw05CZJmz0ItV3FIiQFw
	 5p1lTepVK/0vih3Jl6iU209Fw+keshSi/R8tcCIT6AcMY1ud8C/bio8BGrHSjYo2wrMp3
	 Itn8PXm3DkItPbOiPJ2oCz+3fbmybhfAWuyuVbkBCcIiUsG6u0bzVNiwmVl6tsbd7hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091617;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=As0pSkQfRuyVRW7pQpIjiCQPFSszS7hItKK7eHAl2ZY=;
	b=c5TvjpTLlv2MqLN0uC9oHs09z4PZF2msLMIvbn3V9v6sKovwMhoNAy8HMGiF7a95uay9
	 9hsQbJTeh1MoZd8RCVAvZAsfPRId9cHTOmzNERMILlP3TEjbixRF7ONsxLos4uxMH55LE
	 jILHnf8zfnt+zYNKyWI0cnOEoV/XZlypSZyWq3Pfx2cnfkyTfru1e3MfSr7AMsmWMJDiH
	 Y/nIv4VyEP4sSzyrmgYBV8AsKbuOXI4xxg9TYD6FunnY6FN7/26BEhzXu/gAOr/mz/BsS
	 RImJRTM8uC8FI9PLLRbYsJ/0oFfpOn7J8pBsMEGQ/weGEXW4QvtWSxsslOJoRn/xt3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TGiY7gaz;
	arc=none smtp.remote-ip=95.215.58.104
Received: from mta1.migadu.com (out-104.mta1.migadu.com [95.215.58.104])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED151606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED151606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TGiY7gaz
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Z7HDvtgI5fJMIwpmLPbYZhshXtdnLS2aVD3lUUBYUWk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795091614; v=1; x=1795696414;
 b=TGiY7gazCxQFjLgL97BhxN/PE5ElPypG2sHIzmst8xObdi7AkyKlhdB00pi6C83V0+QOCgDo
 PxR+HFVRpjlmFRM+Tk4emj9+jwqPYTxkBQBmo/L7Do+j6dMglvrByQOrBqDgvl63bXUVS8fJMQq
 s3S/9apxXoJSRiuE3kHcurns=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bb33c8967035517b;
	Thu, 19 Nov 2026 12:33:33 +0000
X-Mizu-Trace-ID: bb33c8967035517b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so5679e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:33:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH7hqBHlLU1QdTZKjF/DpwQ+M9l9uMn2xHhUCSIdRBmPKXWFW2WpgC6UShmiHfi4fOlG/3okOGm4snAj9M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MrAICx+yc0I1I3ZW5bOcuxTrRAKTjg6SYKDByIw21K9Svlz2R
	omKtjaLDpJtQ9nDNV9j4B74iZTcL15WOkKpkrA0lZPNijF9t6lUmienPdVF6Z0VwmGdQS5sKXWz
	s8VxfzaXNEDtqHQs+fgAQaoECjXynYpAz4f47dUBz
X-Received: by 2002:a05:6512:6ce:b0:5bf:f81a:f24e with SMTP id
 2adb3069b0e04-5c1b6701822mr67836e87.10.1795091612777; Thu, 19 Nov 2026
 04:33:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-14-13c1859e8aa3@arm.com> <av7Ly_iLyiOAXQUR@red-moon>
In-Reply-To: <av7Ly_iLyiOAXQUR@red-moon>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 19 Nov 2026 12:32:56 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxTaEj25Ts-67B6nwxF_x1_ZTik6tg_a4sDbU+7B=FmEw@mail.gmail.com>
X-Gm-Features: AclHuK-kHPtLBsCsAc1hYRee8NulrRKXzvQw07qjT3a5lYkuN2Xo98WRZLt3QVE
Message-ID: <CA+EHjTxTaEj25Ts-67B6nwxF_x1_ZTik6tg_a4sDbU+7B=FmEw@mail.gmail.com>
Subject: Re: [PATCH v3 14/14] irqchip/gic-v5: Invalidate the L1 DTE when
 allocating an L2 device table
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Nov 2026 10:13:31 +0000, Lorenzo Pieralisi
<lpieralisi@kernel.org> wrote:
[...]
>> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
[...]
>> +static int gicv5_its_device_l1_cache_inv(struct gicv5_its_chip_data *its,
>> +                                         u32 device_id)
>> +{
>> +        return __gicv5_its_device_cache_inv(its, device_id, 0, true);
>
> I would highlight why event_id_bits is set to 0 (actually it is irrelevant,
> let's explicitly say so).

With L1 set, the effective value of ITS_INV_DEVICER.EVENTID_BITS is
the maximum in ITS_IDR2.EVENTID_BITS, whatever was written.

nit: this helper has a single caller, so could you call
__gicv5_its_device_cache_inv() directly from
gicv5_its_alloc_l2_devtab() and put Lorenzo's comment on that call?

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
