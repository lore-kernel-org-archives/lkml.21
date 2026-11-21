Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795259102;
	b=z5nE2AIhPNtCJn3lm+543FtrB13VQ+havnSVq43knhxoCB8Dnp01R0gjvwXufX0M/Qqj
	 5f5a1kO+c1q8J/RfYg4MBd38RFdMbs1rrwfdT4DwkHMfDpbfYZsMX5227d4ZYgEiXGboj
	 zAhD4hCBObDjFepcn6qfthEChHS+DdmSRX7DRpsea2Ut1NbND2AJH3c4+/Idj5ZqAdd3x
	 QvqojCxB6l3QodLfC03uhvrHx1hTxutnd8SknuI4OHEU6Nkn6psl7a1pL3kMZW+dMqfhg
	 0WorzEPAjJd3Hk4W4SGzZo2g36NFwWMRF4ehGKH5VcNQjLC5AwjXrK0VIv5KxzWAaxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795259102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gHLZINtQTEgJKCqXvcXR7R3Zej47yaR3yrL5TOtoLHI=;
	b=ZtMOw0sG2e7rw1EDytqur5YjKLHVJ7nVPz7LxDxZNVvxrIcrnTlj3QgrawlykQ8rZkbY
	 k9YslI3aILu1hh2wum+4/glUO30hhUROsYYOkYBJ0UDEUhZAXLXF+qpdHpB1oG5QoF53l
	 wcI7fPcy42XP09ylvb/rSo6nqaLgxkEfQFNLVJxSLJA0yMvpW/+dQpxfEZO4DwDWH16o2
	 xHpWN6+lua6uVvFENu7EwlKuel9pjzmMIcHhLERaMSTrTz/KgHfC1ArMEAUJIX+lx4/6T
	 6hEnRoQYOo55/jVjMI9UAk1nhCLyvNfR7VwQ4aXwlnuhIcrnStoUx6CZg89+xxDzhDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pqkUgkLE;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F19606A325
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32F19606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pqkUgkLE
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5126505cb3so239597166b.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795259100; x=1795863900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHLZINtQTEgJKCqXvcXR7R3Zej47yaR3yrL5TOtoLHI=;
        b=pqkUgkLEopLnSWl9nAWmTex8sf7ATk5xbpc8NhTaeLhog5YW67uyWLRuBf2cHMLeoN
         tYmROP0F4L5xHorXRjSRLaJYCW72nkpmHnQEiW9Ik7JqTk41C7bKab5BdHAYAW/PfIjA
         R72Vrl4P5SVgoZYT2izQ7zOaNCAE5iC2b1uxCm3jZXWd8jzKtacBORpfVVaNHgBqK8Ci
         yG5k2bA3GhKDQgRuK7G17fvfLtmpHgGNIlfadbuj7G1zbTpnZjpBD5CQnfWq3nrU87mB
         9Gh6K+Zu9Usza7jQb62SEqj0Er0tBJd/MeOzwhaxop9dE/FprZUe0BCoUfFVkaroeghf
         kPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795259100; x=1795863900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHLZINtQTEgJKCqXvcXR7R3Zej47yaR3yrL5TOtoLHI=;
        b=RhGFgdtWg9wq8OWibIhhpzTrAnG5MoZIfiA05TDugnDg3iXL6AJabXtV7LrYZyqH8u
         GZ7iQc2jwh3kI6g33HMDby0124niLPHNSal6j4/I9fSI2d4kT3cGwBfzx5LykR2CEtok
         r+WetxFMIUSdCunbAuc4VL/D1Fsf6H8De3HD6RTC3E4zi5d8b1BzRBPTwahQWf0EQW6w
         8x3Jxu9O//qnQs0sbQAkUsYD3VyDOIUpGLgKrQe7M/jv6kj3WJYdriC5Dtz046VGL7Cf
         4ekvUWaxk3qlP+VQln7PwipwNnn2HzFfox6sFEXAWVjDUwNOJxwjRv1s5w1CuJRR0NOZ
         rgCg==
X-Forwarded-Encrypted: i=1; AL+hErF8ahmvvCxNrT+0blUayFz/yrxv+xxsr3SdaAda4aFPUvZUPX7a44a5vUFB5TX25KctK6MRcyeA5j/l1a8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FECM5DVb8qN+E/Piq3FCucYZxDDGo2suOp79gJEknU+vX/hQV
	/P5HdUmt7ep8SsVxzaGMIABKeHuRHisfCWDIAYzvhBNP7bSB158mrMvw
X-Gm-Gg: AZFdTZfgegYz40DbgXf70NukYY4kxXHK1+qjBW4/EfXurATv0X/cpZ7GYbwQ1zH83g0
	5Z736um4zoLIij+HCLpWzBLYOPbibvXOVaSufH7dAd8mkbOTOd7ayYpaFz5nctfRaD0Gho9H09o
	b+b1bTLNAmGZT28Y9yqmj2ASKoElwKDcbo1dpJbj4/6LsAw+lzMbSx/7zKIE3heR/oRzpODasyL
	3wtXxGeGaop+7bBuVm5exyuZCHEpnoghelUc9J4dscSrA5BdU4hzGaSZXjuRDv5Skwu3xpqsS06
	UINsz5RgYhd0YzcDAgBFK6t7ZENmEfV0MgjPgdbbf3bSdkGkHvHWg1xcKGNn2cDwodqAIwUjjAk
	v5DWHjTH0esY1PW5RYDy4ssbEJS1R4N7IdftHTEbkSrArLgDqODduw5bpf4RgZo31itVSwxvUaP
	Z35IW3YmtLOo/ENbIAso83+p3dXAd7mzUPX5DJWrS0+6ltYuWhK2TgLbnCdBSJrHvfPepJvaB9v
	RoggzvtWcxJbSdldM9PWEp7dZ31p6Q4dq3TBaSwsdLK9oY3uF2GD1xb8txVFxtUqq53r5Ant3c1
	VxyknzkgPvdbVY2uAbxli15rMxoMDDZs+PDdwj/kNKC3N6ajVsVSKQzgqLgRTIZWXduPHhUeVjA
	Q+hk=
X-Received: by 2002:a17:907:3cc7:b0:c2e:2d8c:4585 with SMTP id a640c23a62f3a-c513ab4cd0dmr513379466b.36.1795259100428;
        Sat, 21 Nov 2026 03:05:00 -0800 (PST)
Received: from ?IPV6:240e:47e:5028:61b2:a372:4c2:dce1:98eb? ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm182991366b.8.2026.11.21.03.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 03:04:59 -0800 (PST)
Message-ID: <ed689e5e-95e0-42b8-b1c8-afcc968bba1a@gmail.com>
Date: Sat, 21 Nov 2026 12:04:46 +0100
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
Subject: Re: [PATCH v6 03/43] drm/vkms: Add new lines for configfs attributes
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
 Jonathan Corbet <corbet@lwn.net>, Harry Wentland <harry.wentland@amd.com>,
 Lucas De Marchi <demarchi@kernel.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, sebastian.wick@redhat.com,
 victoria@system76.com, thomas.petazzoni@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>,
 llvm@lists.linux.dev
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
 <20261120-vkms-all-config-v6-3-78ace90f4fc1@bootlin.com>
Content-Language: en-US
From: Oarora Etimis <oaroraetimis@gmail.com>
In-Reply-To: <20261120-vkms-all-config-v6-3-78ace90f4fc1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/20/26 6:58 PM, Louis Chauvet wrote:
> To uniformize the configfs attributes, add a trailing new line to the
> plane type and connector status values.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_configfs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 707cf3578e2d..5f5aa0a1812b 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -294,7 +294,7 @@ static ssize_t plane_type_show(struct config_item *item, char *page)
>   	scoped_guard(mutex, &plane->dev->config->lock)
>   		type = vkms_config_plane_get_type(plane->config);
>   
> -	return sprintf(page, "%u", type);
> +	return sprintf(page, "%u\n", type);
>   }
>   
>   static ssize_t plane_type_store(struct config_item *item, const char *page,
> @@ -527,7 +527,7 @@ static ssize_t connector_status_show(struct config_item *item, char *page)
>   	scoped_guard(mutex, &connector->dev->config->lock)
>   		status = vkms_config_connector_get_status(connector->config);
>   
> -	return sprintf(page, "%u", status);
> +	return sprintf(page, "%u\n", status);
>   }
>   
>   static ssize_t connector_status_store(struct config_item *item,
Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
