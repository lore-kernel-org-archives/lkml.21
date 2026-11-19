Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101370;
	b=1V7u78yyQ/3LrrixtbsCbOv23H9uq2R/Jt3AaopSzMkYE2LElVlpuRDGeZfu9HCu4YL6
	 DO+Qj+xy/XHDw/Ix+Vkn8ngBjFn6ji8jOlUCWUZ9Rstamyj9YU2Q+LXwiWVJzRmsmaxGz
	 KE7t89HFdLV5r14ACRDdTDicLEjoE/RSTw/CVG1345sXP77MJH7t0Fe5SyoZ9hRbdyKb+
	 128ybyk+6yEfS2MuQ6yBNWALDc0zfApZSD4jJkUvZp0BdXR9/9OzM5EYMwHhsJqT1rDmh
	 lXlg5jGk6WlK4h41iTaqnnM0BZmjgmY0tINejKy+TzC2mUy0XDKOe9zOYKEpEOK+AwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=s3CxcG8TjIsNEX3XTQx1RyQJmWbMCHa04pEFIgd8c4Y=;
	b=ZExjNqaTbI7mrNJdWtznIj6v70VJLCZchop9/1mUyywH/2Tn0ZQpPjQkaDp5//EllMlT
	 wqdku4EouFVNlzGP9HpqZoWg2oVNTfx5gw1LGSJnCjy8v07tpKo46eC5IprfKtZibJUf6
	 9978vkjI4ST6CA6lbOCVBMrCbJCPHJUFeIeehiCBOcy2+dy6FlCQzYA6cCP2JWM07ce8C
	 a/rSU9idtV/BiGC+JWaga9svf1t9LFC7NcGEt6IYQqS7ERC2dwzX9ohiZZ0gNlTm5kFGG
	 /X6zp399pnTjQTcchqbgfE5m2QMGUnmiyPAZE2Bgg9YbwSCbu9eHYY1RyIl2j6pg6zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Sj7hk08a;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3DC60A3808
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C3DC60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Sj7hk08a
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a32576da88so1353043f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795101367; x=1795706167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3CxcG8TjIsNEX3XTQx1RyQJmWbMCHa04pEFIgd8c4Y=;
        b=Sj7hk08amywV2a+ldixstVN+k0szBnA3hKiO33MD/5mvxxCEV+XsSYtkR7gWcYKapW
         aJFwfC6w6Wyt92615qCMVYnXzbZsq71rb6cWaFRPnTUoCZPwRd8q15dJiu1VMQEJV+Yu
         VzmpL2HqM4+I//pOBcI16qZ1Qj2Go7Ymjr1mu987B9n6nK769prPkE7Rxm99YSMp/ugs
         waVrlJP0zXXRIpov4AvcUMOigJemMCAGKvYA0tDCZx5tp7NxgOB16OhmpOHGExJ5bxr9
         +RWzfadp9Vj+VeDuPVRZnmyvgnNPVmVQskf0LwwzZNHykDyfnUzu6of3I9gvpO0Ujjgc
         Xolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101367; x=1795706167;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s3CxcG8TjIsNEX3XTQx1RyQJmWbMCHa04pEFIgd8c4Y=;
        b=X0ryymuLTaRyRjyuz5jCV3biNWcalPxzrE9UxTnHBKxg/Hl9OZzNzKcSPYWxElQaR3
         AGThtq8Aam2lvso2nc4eErDPxYrJnn1KOsPCS5KSVUJKhVTRKbquf2dmZGCXCEkw6Mty
         jS3o92h7u4mFijL7C8mYOxdp2XZrysRuWQ1euB+s8B/84C0nrRtAnOdYwOLRu1PyYwbl
         NbzQC/Q80J+ycbN0pT4FiMjdwjgWupcJpNxYI2vusLQqDAvkCc2FONUeynrF/OCu+Lzl
         dba8egloQI2wbL0c/i1Iyz2slQaRRp//Al3MorAIpCqj5tZxYxxyYiD7eKQ5lE7OmuOp
         KGPA==
X-Forwarded-Encrypted: i=1; AL+hErEjlLPC3T/DljpuhdIEqjOOGXxv+RuXRmVv9BgAbL8xTIYPQgyrW8KemmlvRsifBXjHsZ9SLXUVd9d3UVo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HtKFeGGTF8BHBXyFgJIYdeilACn4LixUnKv/fnNC/Lyyr7R4v
	vlXOsTjRNkrQwKROjpgfbA0d9iFw33wyAC8zfd/OhbUpA+KqJ/5JSwj9H9HESeKymH0=
X-Gm-Gg: AZFdTZflTi32dYZVv/7q/x9mn3cEDxb7ykXoYfbGNVQBlPWAgcw8QNNVejEyWshHgmq
	H+UlPFy6LLRGzHYt9O0XJgOsfPglvG+8UIcQWJOXQkL875kJRKJxMXGVoCs1GTy69Jgm/p9w4K0
	c/d9/fgGMxb2HSKEpW0oWbEyerCUnTLYTMcWjAregSCdcG61A6spK9eS9kRdVoVo8nSAGxcH/+6
	dWF6h+hRdUtSgK4iqZeEEXdfm9SifUdVWyJPHMpyeo7qzENluccMtKJp8YW+LGo4H4ob+P+eCfd
	7H7R28k1RHDarQtAbhsucbXT1gpsJfqGLlNmsu8QHq59LnC4/tUkeKHbGklaxJORZd6R06ir12S
	yk7u3Y5rfrvR3JJzajiGtCXnUJbR5CgqKU5hO4+HTMjBTgoUk1bJu+Tu/Gi6DsekEe31CME6T6X
	0dBUx3MaEybKDR3SL4/QLHWycurFqQoss7HSEhN1da3PygBi2b+5ChbEU1uZQ9/xJjknYoyOgun
	8YyMG4kXzTkNbBNGUSX1nWXG6V21j3BNd9gQ8nFiLBZNnsD/iRwAA6kxYD/Ew5SKuPdiyymGP7d
	fMK0dQmYrTCh1FSZZlml6PK9z5sKDzYgNXKxvh2H5XTaCdxpfKDQ+irJeI77XiPYzQ1KnDI2Bu+
	rm+a1JrMMX1I=
X-Received: by 2002:a05:6000:4904:b0:493:2eb8:e7fb with SMTP id ffacd0b85a97d-4a65de20a60mr11890050f8f.41.1795101366881;
        Thu, 19 Nov 2026 07:16:06 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm179261f8f.2.2026.11.19.07.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 07:16:06 -0800 (PST)
Message-ID: <9fc53794-03b7-4092-b190-b56235765a2d@suse.com>
Date: Thu, 19 Nov 2026 16:16:05 +0100
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
Subject: Re: [PATCH 0/3] module: Fixes to tracking taint flags for unloaded
 modules
To: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>
Cc: Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261020-taint-unload-v1-0-d1c764889afc@suse.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261020-taint-unload-v1-0-d1c764889afc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/20/26 4:05 PM, Petr Pavlu wrote:
> Fix missing taint flags for unloaded modules and a data race on
> mod_unload_taint::count, plus move mod_unload_taint into tracking.c.
> 
> ---
> Petr Pavlu (3):
>       module: Fix missing taint flags for unloaded modules
>       module: Fix data race on mod_unload_taint::count
>       module: Move mod_unload_taint to tracking.c
> 
>  kernel/module/internal.h |  7 -------
>  kernel/module/tracking.c | 28 ++++++++++++++++++++++------
>  2 files changed, 22 insertions(+), 13 deletions(-)

I've queued the series on modules-next.

-- Petr
