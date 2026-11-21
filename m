Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795258647;
	b=GUPJb5u9ntIbDx8wEVt44plLDGdqcqE2xCSr5J+ZY6p3088Qd/fl86GF6uyr9XMOo3zF
	 9BI3gIOj1HetEUV2/i/DMiyKhIqXReHITcSOVRT9p3oX92hXG1MMWgZ+UTPJ6rG4JKgo2
	 nwS2VEkpvjO/Vk6fM1WTbpWk8pFOTeR6x09lyNt1DaJBNb7JVIbUU4pRBNjsLaXFFb56h
	 25LdUoVQjxBFCnGquOCOhAFJDYv8LNIN8PqHTEN/3WwO6y1i9uEZf9nXcyniyN/gpYgH+
	 d6YaNSw80pfhD7EmaHcDbR9xOm0fDZgAmppr0gQc5QQkSOx/y2DcdxdHlQmzfDUhBRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795258647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=s6L/5zARcCLel44kQYhmt6hmNx9yE54W+X6j7p6+kLI=;
	b=OreeO7CzyX0j0SV5HqlcekGoD9ydpGMxAPKQl5KZTfarVtq8XRrgcUx88RzPtoEHJmLa
	 qJX7Rcjn9XZX1FYTlDr+s0SGxl6/aQMtwa54kUfrwKoxoHLKQtxwBUC3NLh0P8HFpF1rC
	 /EqazlX0T1pSksaHAIl48s/UK/Sv8VW2UfFJlIqj64O9MEPyuIYIyEJXWH+h+uEtVjOe8
	 wrpadRLa3rB+StECoA1NsXeU8qsngmlXZK6eowNs619RYUyzThhhUBxRvRphTkezfeSfS
	 IABFV2xl06PooJFSE4/5fegVFb0qcH6kro+6Ty7n25todHqXzgfX27JOHnqNkbiQJCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dl1K5RFT;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38422606A325
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38422606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dl1K5RFT
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so12222705e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 02:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795258645; x=1795863445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s6L/5zARcCLel44kQYhmt6hmNx9yE54W+X6j7p6+kLI=;
        b=dl1K5RFTCSe2kAPnf5pSeGyQbRBAIKoZLylyiET1vIjPURjry+i4R8z6hmiWzV/b6+
         MXekc+U7RQ31imRzbp/I0Uk5+J+mVsB9KgpJi5OUXgtiC40DzTCDf08Da8uukxfD3jnX
         3SZad2lG6jKlvCeC/gDmPMjeE9GgjccOx70vlXLeZtRLgKI1S3mMKVJhUdvMuYCY1+Ki
         EcmsEtPYVEcpdcSW96BA5oUv717CfBr7kPCRtv7dzD1ocl63y9r5Wu+Z8B0FtWeboPR3
         bvGsXa8dIOO9UE0etq5yCqqaO9buv/PPgSrDIx/H5rCCmOmLTNSFVifDq7Nc4wfznRrF
         2zTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795258645; x=1795863445;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s6L/5zARcCLel44kQYhmt6hmNx9yE54W+X6j7p6+kLI=;
        b=aj2cOE1cXcJAUTSSw0Qw6aiQ/UXB9g+8zgZOXstmkPCYCgd998TeO3no2BxPO9BDCZ
         n9I34aIuQYhy9m1DwkvyyO9YXSqFWxfKSF6L1mmvnbkeOmG3MYkLCEQCHqT4cg79rl4x
         C+jbDZ9B01TOy2WGDsxY+h03MnLW1hhLsqrxnOCrCu7sQF9BbQj+te+b0JqeqlplzitG
         eFwGZrrON4XwxbInHs65vCtr2pbpM7X+sK1s36gfcAM2sxqUhX1Dv5+d0nGJL+tlKWTN
         ZHqGxLpFbzwPvb3PRgo4lwrmxL9aLnl/sybs23eHdKBM3WGquh9zrDmb9EuB7EWqHjSu
         m6VQ==
X-Forwarded-Encrypted: i=1; AL+hErHyrnj88mTgmD3g3z1wKL0yfxpV7KonjIp0U49+fUGEcofyXuqVLNAa71pstwSx58NWuNq0lgWnYUoYWDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UbIoIfWuTa7Vkm+u4CrbBNYxqOYTBu4ujRBF4VZuo18d8rOzu
	Ci7FnAd98ynUDGx/OYegTxDpAW+xhSOlqIHuKVhM1Y7BUv6aEscoN7kV
X-Gm-Gg: AZFdTZdd0vKq8R475A6YvEwtFYhUc1UhPW5LOTvhoho8yaFR4psiB/WH2C4vbV57uS5
	Jceo1nWuZKyFXfQbhIU5r8HE0VpjRZb7vtygPZVVfD9bv9uy1LSlnqliZWvYadbE65HV0RQE1Iw
	LCazW0QxXEP9e1HvNyOmz1JCu3NQuwOChdjypP8bhb83KRv1zZZ/P6CC6tGC9i7aXWebDjiohPN
	7hPjR+NsRuJmTpBu8hxNQEmHixa2Uriv/1OO7ee2YCo4+GWB8VDepGI7SxXydorb1apWg0R7vic
	Sg+AHJ0Jqi25za81JVblneT1f0+zF8LdFSDXVBpemMNpwf7lvYkeDsBcWp46eZaC3My82Yn3XfO
	rzSmZjg9YYznhRYOW4I70hBmc8Bbt57CLSQt1lMnbT96/cjkjG1F6M5GFfqMtscvl7qfRYOBB6F
	thr7ZJQhBs5jJCfZXt4VnMUU+OrF3GEkBS9nfdEtB9YH1eHQEzaCQAByJcr8BSoUwq2XvKIG40f
	Ckb3UFI6n/6cem4xhCynH0tDnW4liDwJL/8c9ZYHvC4aKQi70IxEpFECc2ATOLZoOncRxRyoD6/
	3PLgeSwXuNZ4Gvyh08qMdeif3sDt+IMGchn6Vgpys7l+4XEF/Oh/ckalkc8P9KFYfHF3vJDjZg1
	/8A4=
X-Received: by 2002:a05:600c:46cc:b0:4bb:69b3:2b42 with SMTP id 5b1f17b1804b1-4bb888277b3mr133199515e9.16.1795258645328;
        Sat, 21 Nov 2026 02:57:25 -0800 (PST)
Received: from ?IPV6:240e:47e:5028:61b2:a372:4c2:dce1:98eb? ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm163775135e9.7.2026.11.21.02.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 02:57:24 -0800 (PST)
Message-ID: <9b43c3b6-02aa-498a-9287-b1c9d9027460@gmail.com>
Date: Sat, 21 Nov 2026 11:57:09 +0100
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
Subject: Re: [PATCH v6 01/43] drm/vkms: Explicitly display connector status
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
 llvm@lists.linux.dev, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito@redhat.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
 <20261120-vkms-all-config-v6-1-78ace90f4fc1@bootlin.com>
Content-Language: en-US
From: Oarora Etimis <oaroraetimis@gmail.com>
In-Reply-To: <20261120-vkms-all-config-v6-1-78ace90f4fc1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/20/26 6:58 PM, Louis Chauvet wrote:
> Debug information are mainly read by human, so use full name instead
> of raw values for connector status.
>
> Reviewed-by: José Expósito <jose.exposito@redhat.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_config.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 5a654d6dead8..48c60930302f 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -2,6 +2,7 @@
>   
>   #include <linux/slab.h>
>   
> +#include <drm/drm_connector.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_debugfs.h>
>   #include <kunit/visibility.h>
> @@ -367,8 +368,9 @@ static int vkms_config_show(struct seq_file *m, void *data)
>   
>   	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
>   		seq_puts(m, "connector:\n");
> -		seq_printf(m, "\tstatus=%d\n",
> -			   vkms_config_connector_get_status(connector_cfg));
> +		seq_printf(m, "\tstatus=%s\n",
> +			   drm_get_connector_status_name(
> +				   vkms_config_connector_get_status(connector_cfg)));
>   	}
>   
>   	return 0;
Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
