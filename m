Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011935;
	b=Q8/qLBDI0em3DHCD5EEop9aNDC0KAC/GJT20qLjRwXhOlzJQeSaJjQR4b20KKTY9xfyN
	 CmHq4rXTrlL8zGxZT9GYEByno2h/GzcgaKwuRaRGa/fCARbyBgfCh1ZAIzc5nPXo0aloA
	 mzA/akaNwyKMTLH+X+ozh5xvhUynP8pt0Q7aA6ud7v6kZwd4l6cL628ZqglIyEM+8Y31m
	 Ewe3wLvpgnphgHs5r3hfEfi+l6B7HHhvQpsVe61F1Iqgh8cOZByiotR2L/dayAtAH5t1r
	 71/L9fczfjg5wdKjZXMXapecWyq4hMKn25ckVSjeZe6txG/LSpPEgq1vAjGgtz04pvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pJYLiDvG/cYZFF912St/REumGAtAgeyVkr7S9k0zDxU=;
	b=bOAc15SH2OmskFn2djGZOZSpVS/7q7ztauM48JcZQvcOd+ef967lCPEzFV/SYCSm1H1K
	 Hlx51SbaX5ruE68/iVj7U+FuwYPotJqCVUkpA7J+G1n9/wjtdj/t/DhRG6UMSmNiGSYSs
	 kfu3bXwCRlM8qfSWviCXSmjMeXbDLKEOQtlengSivxO3zyL1IxihdGdaBtAB2HvWhgbDn
	 SZaDy59njNNnXOsXEFLXuXBMpLE+DDdaq/7PPilSPMnhbq520SCsDYydO+BgRdiS1M3m8
	 b1AbgeYCeTKodKatO9QQZUppzPo1C+WHs7J/t9sfSZ7XKZGnd9harHoPOYdgaQS88lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YWsghDxz;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4888560A260C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4888560A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YWsghDxz
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so649362f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795011933; x=1795616733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pJYLiDvG/cYZFF912St/REumGAtAgeyVkr7S9k0zDxU=;
        b=YWsghDxzg2Lux99YESfzYQL//XPPR3c++qr0/GzYkcNYDro8cgiReMQckNPZDMaZe5
         Fy78fBYyrj8P3E5n6pISncJPDrlaVQQw6k6EIJ1Sn4S9s6l36LqQQbvArMcsZ1TjHBu5
         RpUftePyoNYJTIhyU4zqoooMUYzzmHrDdcpXXHxVGrRCTf3fuviCv4WsCNx2dyiK5lNs
         pCwxCkJOyZCg82FV5cx6diVUiJdkfmU4wXQh8mgSsYyxHtYznFrrQc7xY1KxEYtjKUnk
         N9srdBfTAJwd8igqqgJJF+w1xRbzs8Z09V/3XQxXp+Ntz+H0q13gocZMZXDsq1MEA6JO
         GLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011933; x=1795616733;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJYLiDvG/cYZFF912St/REumGAtAgeyVkr7S9k0zDxU=;
        b=UJZiNCj1Ojc3uwYpRFQx8Oaqwrnu1VfOSQWypdUahklwUfBhT9KbsZajY8QUWwe4jX
         qDHJpVX6xpw56w+wOgqZivaykHLP83E6UaXxLxCLX9PGFtXrFOTszXFdew0diGkosnQa
         7awY4RTZegqBNEP32RPRP+KXpnaiAg/8Pp4cg3DJ2DHZFfe7bLkvxz5s2zVbiza98UnO
         I1a75aav3CGoc1Qu969SZPS0bzJOnLfOEPiT5ZKDb4q6pqvZkoovWRSbl3d8onjkX+Vs
         ntbrtkndlGHcZEYrFDNznY4porYQzu35TgAPal+spyuDJ5Lb+6UmzBX2tkqDLKFNfsrU
         ALAg==
X-Forwarded-Encrypted: i=1; AL+hErEA1rppOkafnTEbusRQYotcSaN+cyGAwoMsFyMLfqSn//P5lc0r+azEp7PGtCHzHke28zRgOQceIHexkAk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vEumXQO6UpXPGEaJPNUJofmcHAf5y8X/W/8K1TVQPDn1DpGx3
	qWkTPZEwtaaaos2hif5FlmuELNbe7Ce4f1h74CiC20iION7EhY2b4K7BFbdo/la6bko=
X-Gm-Gg: AZFdTZeN5X2J3qGLMTQ6F+hPNXhXSbBlRs2HMjXsxhIpAwdXbmhz//GPtYDBhoY5a5y
	fhTVPEafgLy1gX4V7FGVTR7r/8zh57yL3LebsZFL1sXc3aewaQmdJv5cUXfr296/GCMwQnN1gia
	u2mPFSoxthkAC4JCAh3iqgEwG2eKrkTyi/eDKOiPtvNBM2eG1gqLXNKQ47Co3Ngw/8d/u88wdK1
	A5I2aFrURg41p4WSyiyQxOydIqyOTqcDljmXf7mu8DqkKCPtHq2dZTGvdgeWag9oMh/HWnX90jq
	06CMQrrD9Fgfg8OOfZoXifrxbSmihnX4r7AKP0LauAXiCtXww9G7rn4S43yDPuZs5/RM7r6J1Wy
	v9YPvfsr9o4CwGXCMSn/PYrsZvqhNYAKeS1L37YIwfOyxdA1ERVAM2EJV25bmCazVy7rco8vv+7
	3WGs61gETtSs4B+2DsRRDgVfPPa4uxQ908xzAvUMnUYsENqjzANNUSPBkLWW7OteEFXMEM7rNEP
	jlnwldg4plPelnYZzNGT5L7dvVdiY8HcZkEsu0Ku3yvPmbgWZuT3JmAH+Cpes8txuDAujOY4bXs
	F0S0gIipQZd3FH39CpQgo/rofU+0XYeCPlnqVH/W//2yIQ0SSA7UqsgzOZ50n5SgYQ==
X-Received: by 2002:a05:6000:1a8d:b0:48e:d36:77 with SMTP id ffacd0b85a97d-4a633a63e82mr6580907f8f.4.1795011933441;
        Wed, 18 Nov 2026 06:25:33 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65541f3f7sm5346409f8f.24.2026.11.18.06.25.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:25:33 -0800 (PST)
Message-ID: <6f402ad7-8d8b-44aa-8333-0c647a9dc295@suse.com>
Date: Wed, 18 Nov 2026 15:25:32 +0100
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
Subject: Re: [PATCH] module/decompress: Use ssize_t for the zstd decompressed
 size
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261115145559.262878-1-pmenzel@molgen.mpg.de>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261115145559.262878-1-pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/15/26 3:55 PM, Paul Menzel wrote:
> module_zstd_decompress() returns ssize_t, but keeps the decompressed
> size in the int retval. Output of 2 GiB or more becomes a negative
> value that is not an errno, and output of 4 GiB or more can also be
> truncated to a positive size smaller than the pages mapped to
> info->hdr. Declare retval as ssize_t like module_gzip_decompress() and
> module_xz_decompress() do, and print it with %zd.
> 
> The Sashiko AI review found the same bug in the proposed LZ4 decoder,
> which is modelled on the zstd decoder [1].
> 
> The x86_64 build boots in QEMU/KVM, and finit_module() with
> MODULE_INIT_COMPRESSED_FILE and module.sig_enforce=1 decompresses the
> 237 .ko.zst modules without error.
> 
> Fixes: 169a58ad824d ("module/decompress: Support zstd in-kernel decompression")
> Link: https://sashiko.dev/#/patchset/20261113144233.193782-1-pmenzel@molgen.mpg.de?part=1 [1]
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>

Looks ok to me. I've slightly simplified the commit description and
queued the patch on modules-next.

-- 
Thanks,
Petr
