Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778334;
	b=ihT78npvsMu//UxZ9AjB9PBA1BT+oUq9nZ5NItgBtbX1dKNR6RC0Qdcw6ufOCFeO/n6x
	 0JzKA75Va4KeQe5zQY5xQfw8Qs4a7l0qdN4rHXek1HjlgSj91Mz5JwVqKaxbgy0d0Mgib
	 az5X71gIoZZ4/6RzEtpoP3axK2u/OdD+GT09WCfz3CsR4HTzEXotONmeVegdN9X5BcT3N
	 /vOlu6H5vwqL04s/54MsoYp+XGPOiRr40e7qJ7tCLmvdfhHNPkdiJA09VJTrD2m7LnrUD
	 LZTqpl1EKbdz9Mxihv3Smys0QajslZSNSPQhbN5m47ARSFjVOGQgLhDDMEB2EkO4nNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YUvt7IIoKlvtxAuCyE/azMUHT33NEIjDoKG3KGZFhmU=;
	b=GewaDqKmE7hugoSXSy6V6AzovvquDB8aCw4kLW7gUdF5chgdpj0/tOMjZTQtWKOSe1Ur
	 NPT9P515bflglkO7NHcCsBw0mv3UNZpQ25kautk8U5zzO2NydXFntyrwF32NORyQYkxDn
	 o3fyLTW0gitA1J5g3rcdkLMO79vNAZlj8a5NYBmmO8b5nYgkH0rpYvyek1rZqrk/x11Px
	 COsNvBL6WPkgYzonhXWYSZ93PCwGLyfZch3+j1rlVbp5mDnr+3474A4OSRz97c/uREYFl
	 yaNYWrrrni/uquSLe8GDrcSaXUuiuHbdv8CK5BfVKiwdtNbcq888EVEzL0V9GiCnROA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HiKlg87E;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EFC606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67EFC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HiKlg87E
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so5142340f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795778333; x=1796383133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YUvt7IIoKlvtxAuCyE/azMUHT33NEIjDoKG3KGZFhmU=;
        b=HiKlg87ELb9Zhrb1CEclmwOisyUz2XrSpyonnCP47KdMFy74zOoMh5e3u8JcKW3lFp
         T6EZV+vRO5KM3CvKZe5LyBKqgSOCWQA5foGJME1jHZ0urxHfMXHWLBp0MBDSpIDQYhMf
         PVzGoC6efqMlSIvCXTeP9aYmIM6JF7alvn0Fd1G91M4IvHFUcGDjl+8xHwYePxTD6xYN
         9HqdzU9YVOD62o5NvEpU1hl81QmggDBbSGLSSVJKW+NIfvK/3DChE9EdlhBTOwU7fAav
         4KBIdRcrOtsRJ+kazOgkrSGqrlk+d5OT/TSPo20GntN4voZWRYRlNi5cGddds8MxdjCm
         61Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795778333; x=1796383133;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YUvt7IIoKlvtxAuCyE/azMUHT33NEIjDoKG3KGZFhmU=;
        b=BOEyuYzbV73+eJLqCzdqNq/OtejuHlg7/kmpHsGQI48tFWiqqZVaViCfon7wFTzFsx
         7OhyEdP7cmucFU5cG18Ug2DblAOADJDS+WJ4h0gXkD9pQ2C1Ce2ADvs2HOscQM+MigEc
         BwcOi7gDFUVmqfQnPp9SZZnHvnJCtngGtPatsfJq6nbi0VltranVjc3hewgTXtN/h9/R
         T4SCUcNRs7kwCxFzjAHRI0AyOYxQG0I36oHzOG9SyWOyy/JXL2GLS2+BPmb4w4DGLQU9
         /Aqc33nzfP9kafGmnuOF5C2UAZcUGfBcVOJ51AKV5DcbO9EK3lmH/BmKLqNks5ZBIMcV
         SB4Q==
X-Forwarded-Encrypted: i=1; AL+hErHKCZszckR8qWdXSrRROU29AWRNR1kVNtIOeva1Vw4c1v4wKAGRBaj8EhlmYggcy1eSlhvoWRK6y/6lj/A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/e29VodkyGPn/rp6VjZdpgCU0dkNKQqILceU6DRxzKL1R2yyJn
	qhSQAGn193Dp3DM//arSiJ7QGCEyFYLCn3YH4dXAEyMQ+3jwEsTKzOSqmrEJN2gKLiA=
X-Gm-Gg: AZFdTZeJRhJuDU4KXAhlR60f++YERuOzzx44N7PPh8nnuF0cAhEPfZdY3ZeLr2WNWXl
	YrYa4w0heOLWFlQETPtmru2t+Y7XZsMwQf1H5CyIXrYmsL4FUHO81WM4TkVEuXY08u/4KXufGuO
	jqwV6+irrNiejA2eH13JIAdQuAb6g0HpMoDMVwlYoDDJ8Ex02rvhbMxBoD4U+gjHVnk+A1tW6Mp
	gXeeFAypzRnmQGWTbD5NSWCzeQ2xrk/x/gaNewDBsnfKZrrc15wPr3BgS8m4/X7rg08udnJnaPc
	LqL4aFaU/Nm7ZCjyibJTVMHeKxHgagt6HyvX80p8GifEiTDYcf03cEFMdRh26lWOHiv0Rklbnof
	icA+djN/0Qhg/GB0hr0VA51A1l+VQZgWgYB5lein2Jl12yCkDu2j6ULZnToZqNs++kVJr8+gK11
	m+jPEvERWWXM31KjLWyjxSv46lY/b+Lyh7bAK7DquLWrU5xZQl4iaYp0o2rb+eMwoUtpfCp+8V5
	JkqzUPjF72SFsewwb02QpfDKVBK4o9Q5mL7GXz+sqxxUeQZdaNdOQlm5qUR+hMKRY7YEQ7Scr3D
	3ywg38j9P+H2zPVaZVYb5XBVu+3gLrpDjvwJuq59BkBYuXjRyXqkjGs=
X-Received: by 2002:a05:600c:4313:b0:4bb:643e:3b8a with SMTP id 5b1f17b1804b1-4bb86162fc5mr365706495e9.17.1795778332871;
        Fri, 27 Nov 2026 03:18:52 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab9cf005f2sm38560547f8f.45.2026.11.27.03.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:18:52 -0800 (PST)
Message-ID: <b83bfb3d-d654-4b99-8ed5-ddbbf90fa6e1@linaro.org>
Date: Fri, 27 Nov 2026 11:18:50 +0000
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
Subject: Re: [PATCH v2 2/3] coresight: tnoc: Fix fwnode reference leak on
 probe failure
To: Yige Jiang <yigejiang86@gmail.com>
Cc: Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20261126-coresight-v2-9e483a5f35a7@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261126-coresight-v2-9e483a5f35a7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/11/2026 15:57, Yige Jiang wrote:
> _tnoc_probe() parses the output connections before allocating driver
> data, enabling clocks, mapping registers and setting up the trace ID.
> If any of these steps fails, probe returns before coresight_register()
> can take ownership of the destination fwnode references.
> 
> Get the platform data after trace ID setup. On either lookup or
> registration failure, return the ID if the AMBA device acquired one.
> The platform-device variant does not allocate a trace ID.
> 
> Codex helped trace the two probe paths and draft their shared cleanup.
> 
> Fixes: e54a52a28a36 ("coresight: add coresight Trace Network On Chip driver")
> Suggested-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
> ---
> v2: Add the TNOC fix identified during review of the TPDM patch.
> 

The threading is broken for the patchset. Check out the b4 tools, they 
handle patch creation and sending properly.

