Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795814632;
	b=YkUl4txtaLwRIlA8xC/jVd8otLFk5XSe+djTS7r/YkRIaadk2hV3QVbYctd+9bNDbQn6
	 Kr6VQx9juAsJQU9iT4FVbETrxdXBOTUkyjdJ/UXPftFHffjzilzbrlFxoXY4knUA9vWwq
	 OGxtaYhfyOe1yRETb6W+9L6KPi55xlZOnXJP5x57gA7yKqhqJMEYL3x6DiHy5k7DG4CIX
	 cBCqp23XHX+PJ/QslRnHp/C9yh8tb5lm8ITV0kfXAK00kCSCEGGwvKXiZf/cEcw4454RK
	 A531CIo0HP9sodT+r7tya+NXtRKVdLE2ndbskLPE6/5zheTXW9dPf6qZopBEWZNiKUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795814632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=cNSMGlp0irpC9bAH2t+r59w7Ev5xHGqvqYmhkEEKr+M=;
	b=RaQHpXxvb2H2AVX27cdAOC+LD1R5L8pSfydhJ6eVRXIkqDWTVrYY7KeiskOc4vrs6KHW
	 LsH3LeDrMWQAtHiJyblbS8De/4V0Z/ZAgMC8qWR5liRceq1+pAR/YML8aTgDnyKzmKCG0
	 tSLZTdXp7lTKwPo4WVIlarv74Oxaf2P8WZGTYaxE+UwZwWi+asmkZcMRYULCCpG/MruWo
	 AcoIn1dqzbJ3QwP2FzQ7gJSH3bHvJ54DJ1n1PqxZoPE3KQYGsKqrMLMkKmoOH79tzmICv
	 ageU16fqE+CzCFV/nXYQYC5hzTmto2rNsojh9MOFh1yZtOEaEkrWeQUKB+UxBF4FUpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IijA1Apk;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D73A606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 21:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D73A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IijA1Apk
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so82409915e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795814631; x=1796419431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cNSMGlp0irpC9bAH2t+r59w7Ev5xHGqvqYmhkEEKr+M=;
        b=IijA1Apk/LX+GHQL8a+IPGwp3W8JtVJOoEiUSZiDxVJQ6TGFrl74k5qMbEYi5yLTRJ
         uZkmgKaEwwtBy6Z6bnNjSGQKpyL3DQb3DvPWjnlzf9IkhjzPCMmhrNH4WvvChhDUhDYP
         YcFq0JMH8xJvyiLml7KiR7Y3hg+pXnq75RvcEk2g4Ow8c1e2GU4e2lyHt86GzOoDpFtY
         dlJDYdKdQqmWoAQUMENrdqtq8gWbHeKFZydqirshnnrb8a3THj/EDIu+x9/i1mLZpdXK
         zNmvjXVwc2B29G/e5zmGBgUl78GOMivpfSgAYZUcupc5t+aNtz+137DEHgiZ4wI+uOQ2
         nraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795814631; x=1796419431;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cNSMGlp0irpC9bAH2t+r59w7Ev5xHGqvqYmhkEEKr+M=;
        b=216hPsgLbuMlL+ppZoZPIOc9VmEWOKxhjMGSW+BVOTIQ4HQMGIWkNLHtMFFtJWRpPC
         n9g3W4gRVnSjRSdpftpvdJy7NY+aoDSMbCevGewiAlIdi8Y03K5W8lSgu2yvn6mKptlN
         U/N6vSpM087pEGog68cA9tK9KG5zy2meXzUwyFYR5WmPwGFLJPorYvacH86XiMFk8ZhY
         4TolaodE5WkHy2ypsEYerWuYqtGPfGzKcebg9s2/hxuopGb/3GGvRd7sanxDk8/YgVzu
         i4geWXi9x/SYFZ86uNkwSG+wDfchVN8XbbrOJFYBG/JQlXN+YRKWyG0m1NqnZKtY9Lrq
         lSzA==
X-Forwarded-Encrypted: i=1; AL+hErEKuQ5KCJecQr/XT+cpCOqnELHqMyVt7xR0YdUHwInq7OMXgPsSd0xjvw7QHyJw3Y0KdNtxn8ZfBpx0FGY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YOR2C0nHC4objz5fVb6O6hHGby+f5Jgo6+yj3+q5LYSTSrqkM
	PhE4hIniHiYO/+eF5YjvmNfq9+/ucB8NX7iXa9mIWeE+/iPzTL3YCnUC
X-Gm-Gg: AZFdTZcBVa5Xrbvlas2mvXkcZ+8y6dSpmRmc6YvlTWVN8vXXFN6ggO7AbEIA4Wj7q+C
	70okdsiSnZUfprkfXwXfKbkFttLiAr3GU5EFXm9aIvw+moxD415MG2Vr+bpp50el0D+glphEaad
	VCfNPFnlCS1fMCvss5dPSdh+7JSf/TDPiZ7e9UyBvRAAOZQLe2RCObfh5xuC/WlANDZvvdJQDHv
	hFr+FPeEaEQPpGeDa8B5p7jW5aVqxPMAvypIHOcwZJsCnuS2yM7HW08v2EZ4qeucRYKS/uPKEy1
	H+99pCdHokRuxey4mmpuMZl4B9XDpQa6KbjpE97UuHgoCTz4pMNYvnRdo2/rgQT/XvNevraonX+
	eFj+X/hNOULKLuIPW1R38lmqtNuwzR9VaayJV22QbiDk9E+B3cxQve1a8RIkIiz0MAQAqNQQD2M
	OwDuJIKC8iNsOJQjbrdVtkuEtSFOEtmaiOnGNVpxGpYztgep/u9QIuUey42PwPvNDN+T8IL1iuj
	hvqJ5Qo2mM7Tu8O8RN7LIIvVkRyBQPu8bCG74TsBemQ6+MrCTOClrBMH71yFHW/R9HDGe5Dg9K4
	5g8xOrFeRDk3OwXbWlZ1+X5XaX4CAc/3BQVnoMC+9bwuP8h9aoYnPQZWXqFHgdVzgg==
X-Received: by 2002:a05:600c:3b8c:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb8881d019mr511383095e9.10.1795814630486;
        Fri, 27 Nov 2026 13:23:50 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm478848635e9.1.2026.11.27.13.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 13:23:50 -0800 (PST)
Date: Fri, 27 Nov 2026 21:23:49 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: console: use isdigit() in
 usb_console_setup()
Message-ID: <20261127212349.1b393b5b@pumpkin>
In-Reply-To: <20261106090304.2410-2-blum@kernel.org>
References: <20261106090304.2410-2-blum@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  6 Nov 2026 10:03:05 +0100
Thorsten Blum <blum@kernel.org> wrote:

> Use isdigit() to replace the open-coded implementation.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  drivers/usb/serial/console.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/console.c b/drivers/usb/serial/console.c
> index 29f09190846e..25ea57c8fd3f 100644
> --- a/drivers/usb/serial/console.c
> +++ b/drivers/usb/serial/console.c
> @@ -15,6 +15,7 @@
>  #include <linux/slab.h>
>  #include <linux/tty.h>
>  #include <linux/console.h>
> +#include <linux/ctype.h>
>  #include <linux/serial.h>
>  #include <linux/usb.h>
>  #include <linux/usb/serial.h>
> @@ -70,7 +71,7 @@ static int usb_console_setup(struct console *co, char *options)
>  	if (options) {
>  		baud = simple_strtoul(options, NULL, 10);
>  		s = options;
> -		while (*s >= '0' && *s <= '9')
> +		while (isdigit(*s))
>  			s++;

What was wrong with:
		baud + simple_strtoul(options, &s, 10);
Seems to do just what was wanted.

David

>  		if (*s)
>  			parity = *s++;
> 

