Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797103;
	b=dHihYU0hFW2OkhQOl4C79mzudgks8Szv6EZNfDDbY+8xquPcNp4pNOHEudHIHdNwY/T/
	 VR3zXjq2Oe7XkcLuiyKUi9jWxdAFYYGTn3+58ev7+XNdPDwsBHyzAs7TDOtUGeizlJMlc
	 2PhFTez2dJL6MIPqmgNbAiRYh9CIxW5tfjWilT4DI2NdkVKlMMmGyBGJ/m8cQ+v7t52S2
	 GyyP51Bbt06Iz3gCW+51Vrh4qzQov4p3Xz3sFk5pgamBHluQ1OPQM4g6/3ptoKK4GJAdD
	 Boh1Sk+nXcNuGQDtv2AkNE4ODnMBp1pMfwKcM6wxSEiJqhYkYajLfkWzrXZITFpeH6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=5RPYgSF1XDHYafp5XjEHe2Hos/Amzm3Q5tQ+HDP2AiE=;
	b=nm178A1yK+dmPMNgOUxPoBYXsD9S7xjby9nHy9bJd5gOvBL5jf9BHnmMJdkYzLViJPyf
	 1ThxAQvwnXELMHA7cSCsELn9meVCi9z1s/DGRZULTV+AbOeR/WTlWPulpu72cAT0d234Z
	 s5NcIgZluUbPWxhNmCBWdNdzg8zMb22DSPjQgZR1rK3F9DglmUHxSRyfOYYy7DjPN2Kg3
	 or3n2iQHiop1/IM/nQISZx290/nOOBX68tSUAxWdNuuS1Ka/51I6okbZn0UtMy7VYA/PR
	 N5aeeR+ZU9uJHX87/Q/xQ2MdXXbjnI5hT7cvGE30cHmciND+n0Gxhqg2F5VuWsU0SWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p41YKBnh;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C2F606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C2F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p41YKBnh
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-99b49d6a5caso2517283241.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797101; x=1796401901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5RPYgSF1XDHYafp5XjEHe2Hos/Amzm3Q5tQ+HDP2AiE=;
        b=p41YKBnhuyOT+TpvRIHrMxScjBU7bBWKCDfLL0udUkj50hiYT7nd821dY/PTgq6Zqz
         YEgrBb02dHDhK3M8p7WSqluOSGQ94A/hj6um6azi8xgzJmejaGASDlqysDAmUnqIuw8E
         YTAr+gTmSk+g+TKbhv8+qD/tqAklezgjEbwQHVkwe0iQ8/m3qBaQavkXPZBH+NDykzyr
         GsZWI7geCD3MmYYglHrpPSrKlWnZ/y7Gdf8QGZjM9mNuiBR4OvIUI02U+wEDWW2wFJXu
         2GR74dMshWTG+CAgfL+L5QXyjaB2nVMXUIj1nl7jfccm7WQqAdj0hXei0CLhKI1gzf6p
         f/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797101; x=1796401901;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5RPYgSF1XDHYafp5XjEHe2Hos/Amzm3Q5tQ+HDP2AiE=;
        b=yF84TBqBaAcsa9xPv2loqte8wUlc2UNfCNU68r+IAL+r0pfx1zfikISrC479LtXJPS
         ab15CyjVwz0SFf5tyuE2PmFwAKvsQEPZ4rl/8CWVebIBZ6tJAz8mcCiAysVQ+s8hR1Sd
         nTZqN+imkhAVKhPzbMOQ3n29yxWvhu5IJYcK+mim+ai9xjl4v6Ebvo8kjRpnKBbiLTMZ
         CAD2gjOtUXoxmFTPbRiierMj3ihhbgGrqDZKfk76krn3AP+um6BDlyJ4zsQGwZuhNa2d
         wJgW/B4P9kMXc25m3wkXzR4AGzd2AK3v5G1ofinJBPSmfMIimrL0SLvxQ13n15lLaBW3
         UWKA==
X-Forwarded-Encrypted: i=1; AL+hErEoaXxWDNIT4sv8Xw2PI61/gwF2M7GF2iYVN/JvhbJHfe4KRrtv2VMeo/RgA7vSKjeLGYrEcL5Lu7kzMDM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7ovqciMOttl0Ow38dIu+jihPscwm4V59C0j6FSjNDmYeQjH9+
	fAdrHm2LZZe3UwzvNyWkK96GRKRTLPjp4A0hIGnLEJsH6L9zDpWcW+9S
X-Gm-Gg: AZFdTZcBqB2B5W93JZ9vtwlWLl1i3kVY4rCKBunFnfozm0xsH2IvYmkJIvechjR0vj7
	9XJBlJdYX9oPKHPpxRn7QrO5Bb3W2QpQXXdxX696fXevXLWISb/FzDSslXIVyY8RPMpmpVBvGgd
	G58iQNR563D/LUuj8I1af06co2UT0YXe5W8ms0Wr4ZLArsxT+LblvW2TxMgs9yWrY2k2/JMF+LK
	eXxkVtAgg/30QqBN/YO0iz2vg82XyUvIoB2kn94YcKU4tYXSY9pd1DyFwxbafUElRWE2oO1TQi4
	G1Me3L/TGI3YDW+ZNqqnCNEPzy6Jf74KRuI6/G0wtbtdnfbv1DuOrxDPc0oeVomVYbOj99CzLpB
	+CFjUYQv+lotVC5pXQ//AEqaqkA9UiZIN0n+E6N6XXSJJMrgyhhMDROJIJCwv37JTr8U4HF6FI/
	C/9LfzngtRXfRI7dyYlk6DrCph1IHlDv1BPJzINoZr4BmjhCRjknWldxekMQhU8WepcAwyonlDn
	hOVmqSPeecWeIlG84MVfu08t8tt5D5KtBiXRUMR+ccsKo6UMIO5lBScUJomfVvlGyRi8OVlpAXh
	6pfPa9mPRtuatYgR84rT4ck/ZtcRR21l+oDhpnjX5pyalj4=
X-Received: by 2002:a05:6122:3b8c:b0:5ea:f220:fd6e with SMTP id 71dfb90a1353d-5ee8aeefceamr14730581e0c.11.1795797101340;
        Fri, 27 Nov 2026 08:31:41 -0800 (PST)
Received: from ehlo.thunderbird.net ([2804:388:90c1:771c:18eb:ef7b:e7f8:aab3])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99eab8e7b9esm10043528241.3.2026.11.27.08.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 08:31:40 -0800 (PST)
Date: Fri, 27 Nov 2026 13:31:35 -0300
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: linux-perf-users@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Sizhe Liu <liusizhe5@huawei.com>
CC: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 corbet@lwn.net, skhan@linuxfoundation.org, bhelgaas@google.com,
 yangyccccc@gmail.com, jic23@kernel.org, john.g.garry@oracle.com,
 will@kernel.org, james.clark@linaro.org, mike.leach@arm.com,
 leo.yan@linux.dev, peterz@infradead.org, mingo@redhat.com,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, wangyushan12@huawei.com, wuzongyu1@huawei.com,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linuxarm@huawei.com, prime.zeng@hisilicon.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_0/8=5D_Enhance_TLP_packet_deco?=
 =?US-ASCII?Q?der_with_field-level_parsing_and_versioning?=
User-Agent: Thunderbird for Android
In-Reply-To: <b1733f2a-ed03-4f38-8c40-6e0e535f1632@arm.com>
References: <20260908140509.2485649-1-liusizhe5@huawei.com> <aqB37YCMUYKodo3N@x2> <b1733f2a-ed03-4f38-8c40-6e0e535f1632@arm.com>
Message-ID: <D6C7F85D-0A2C-4569-98FD-ADB616FA106E@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On November 27, 2026 12:12:14 PM GMT-03:00, Suzuki K Poulose <suzuki=2Epou=
lose@arm=2Ecom> wrote:
>Hi Arnaldo,
>
>On 08/09/2026 22:02, Arnaldo Carvalho de Melo wrote:
>> On Tue, Sep 08, 2026 at 10:05:01PM +0800, Sizhe Liu wrote:
>>> The original hisi-ptt-decoder only prints raw hex values with generic =
field
>>> names for DW0/DW1/DW2/DW3, without classifying TLP types or decoding
>>> DW0/DW1/DW2/DW3 fields according to the hardware-defined packet format=
=2E
>>>=20
>>> This series enhances the HiSilicon PTT (PCIe Trace and Tuning) packet
>>> decoder in perf tool to provide detailed field-level parsing of TLP he=
aders
>>> based on message type, and adds a versioning mechanism for backward
>>> compatibility both in hisi_ptt driver and perf tool=2E
>>=20
>> Series is sashiko clean by now, has a Reviewed-by, but it touches both
>> kernel and tools, I wouldn't have a problem if it was processed by
>> whoever maintains the kernel part=2E
>>=20
>> - Arnaldo
>
>Please could you add your Ack on the series, so that I can pick it via
>Coresight tree=2E

Acked-by: Arnaldo Carvalho de Melo <acme@redhat=2Ecom>

But you could have taken my "I don't have a problem if this gets processed=
" by somebody else as an Acked-by me, documentation says so=2E

- Arnaldo 
