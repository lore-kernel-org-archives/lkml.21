Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795819430;
	b=LzHMck0La3adouy6wCHxl7T5y2+tfABl3pu+FyPYzCXZb4ocoIkyysNRhE2b6ePT1Kw7
	 08ky0d7vbQNl0kRfKfA0JQ1LgSmdby0WODhC0GwY/jdwL/hMEe7K/SUDoiqW8BAB8kLwU
	 ANNJt+LVvp6S72u9pZ5nOjfsL+epyDeDfSkxLlssRTSNu4lYqFEjc5ar+iyw26EU6GSG6
	 aE+sT0dM8tPKe+1GhoA7qpw3qP0ItOJifyGSXqTtL9dE7xPk6sh4EglWqtcFwbpXqR3zL
	 ynIhRD3Q59AfOaF3rfPP5OymFOueJZ65kb2kKN1HXVE6J9bmr2QeLMVNwVoHUYHFlHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795819430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=NZ1EppleD+J66ZPNggQWXUnDL1zJG5Pjchv2xN3g36g=;
	b=Haf9vtU5Pn59VuYutUVZcOQrUJPBPuVPFXKA5jW0XwjL+cJGi5YCNZbTfXsp4J8YEdOI
	 RVHicA6JDZXr/Y2F2JgXIAeeYGkRcbvRLOxLpYOxNj+He55Jo1Xb70bHj5Asp9a6a+Vng
	 zlVfDWO4veoywlJoYZT8fOZnCOAWOTkuwN4Z6quljucoiOdMS2NTelwxvjJv9Mc2YK8Vb
	 nh06Gn0zhmCncyor9SzqF5sp7eK8qMr1ie1+g9sI63qvB8WK3dUhI+rWRc6pjrf8t55x7
	 ZSL/Z4tFxwAORpBymKICm6nFy0G1/7uiDRWUXZm20FF1TF9YtRd2rye1gmhX6Q8allA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Utv679ut;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25840606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25840606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Utv679ut
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f052ae3c86so46591865ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795819429; x=1796424229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZ1EppleD+J66ZPNggQWXUnDL1zJG5Pjchv2xN3g36g=;
        b=Utv679utLO9P3nxena73D5/g3pJJY58e9BQ56OpDR4kLbYgCKerDPrXKx7HJnbufmi
         cXE4Sxng1fCn3Xq0spvU76qJG4OBoll8i9ebwu7m4McX9l2ud1fKjraMll+PCRm2VHLj
         38Lo24iI7l2BjmPP0pNjEyXT96duM+bQz3rQYU8kcOrc6hV0E787P9fMkDdzbJFoyLQ+
         eHL46vRU/znpjC5jW5q1OJmRmX4OG6q70bQz/kBxOIEnlqPaP/uWeuA4KmPthESloCwU
         yYffHGyOSF26HFI+tkcPVh/ABMXbVBHrx+pR1W6tQ9vB8Jxfx4WMkL4jEgK/+GVMpy91
         yNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795819429; x=1796424229;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZ1EppleD+J66ZPNggQWXUnDL1zJG5Pjchv2xN3g36g=;
        b=uVSHLNxmAiDkNpvBSF0jIXWiNlTt3B6wT5cPhdJdPto39KzTJ978/Ll34BY/5ZGdO4
         WnLkn5XqwqN180EcT2y/Iuidc2HdMA4DRfF4V4IfKKA/973IMyOXs1TLcW8JeRKsnb/A
         JnMBZdqHCS7dmC2h/MMeSFG8d7rWJKX+sF7QBrcP6oNXiokKcYWFlY25xvrEXzlr1U/i
         tQP5rd+z1qirUp6pMPjNGC2/lNdOR1oP+93jk/DtmIYWJHLBfNhx3hCEzafZ0kIDaL1Z
         +DRr38xDpT77ebO3u7svCIe3GOe2rlt9Ae+tdWR0jo7AMaNcqmueLNhrnycGcZdEafb1
         rBXw==
X-Forwarded-Encrypted: i=1; AL+hErFlLVZpbIJ+h5q8Zv4or1VNSbYw1pxa6nmSH6aH8R8hoHcrnsgclI6UXjOjCb/Ds2oG566PqvPi/fapklE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hSGB34tXLYx4JeDjMQ7yTQLm7EDLHpXw+pDttzm7C30JTledr
	nuP219O+/j10uLXBqu3vd0DPLwttR4L0gUIQ9E7202kggVBlnJ7yiNDZ
X-Gm-Gg: AZFdTZf0ss/9MrNfm65TNzIDU3J4JGdHi+9tDXZl1bd+CV6iRKXliLjJyUNedrOOFXj
	gDyWJHCPN4g7eknGq1ihpFM4X8kdyr/iLRRgAywbwiBJ71NDEiNpOdQOta897KvRzfd0yv9hOVZ
	9hToU6zKzWMitGXNo9XUaDMEgf+BZfMpMwAq++EJ0rXp0q4IPCvJOqqHYDnin/jh3K+A+5XGbk2
	AD2cmH72QkDrhSWcW6QDw0xKoVZc8cZjIAotTNyQ0v8hvrEIqvTRK4q3CF85tMIsH5smojzPz1j
	PqSkGCuehygjgKDNC5sTOEc80ctQHOXApX5lOXRFnvdHu63ZCFPRfBfpxgd77pfzJqIZey4zeDo
	FpSbsBx1nqN52S7bTRV+yJIM6AQNCN9XfSM0FDqEUZg++5ZnkZn5LaURutV47wbrTwfVNNnRILm
	0QZC6hsA2KqJkdKkI+lkMhBhLQ3TeCV9hffzP94xoh6JlbuIPK7oGpJ//q3ubN6bZQ2KjUbofH8
	j9YhxP7r//UjphdJNaBSDTEGqTKKqgiIi1nMa2YiIORPzKNg8YQBiz9wDWVA+mxCOKEMNMs6kTv
	jS55RlVMiW5aJWPVmLN1vlbYZHRla6b8ScPawYbXi2IU8vDGzq70JhqZ6u1F9pSZXvqW
X-Received: by 2002:a17:903:41c2:b0:2ef:e348:505e with SMTP id d9443c01a7336-2f03f1ed345mr279322415ad.58.1795819429416;
        Fri, 27 Nov 2026 14:43:49 -0800 (PST)
Received: from [192.168.35.60] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm116614885ad.39.2026.11.27.14.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 14:43:48 -0800 (PST)
Message-ID: <2f3e4f6d-d1fb-476a-91a9-86ec0e53a576@gmail.com>
Date: Sat, 28 Nov 2026 07:43:45 +0900
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
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH] extcon: rtk-type-c: fix IRQ request and release
Content-Language: ko
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Stanley Chang <stanley_chang@realtek.com>,
 "open list:EXTERNAL CONNECTOR SUBSYSTEM (EXTCON)"
 <linux-kernel@vger.kernel.org>
References: <20261126132927.39809-2-fourier.thomas@gmail.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20261126132927.39809-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/26/2026 10:29 PM, Thomas Fourier wrote:
> extcon_rtk_type_c_probe() requests the shared type-C IRQ with
> devm_request_irq() and ignores the result, but
> extcon_rtk_type_c_remove() releases it with plain free_irq(). The devres
> entry is kept, so on unbind devres frees the IRQ a second time. The IRQ
> is also requested before the spinlock and the delayed work used by
> type_c_detect_irq() are initialized, so an early interrupt can use them
> uninitialized.
> 
> Request the IRQ once the handler's data is initialized, check the
> result, and release it with devm_free_irq().
> 
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> Fixes: 8a590d7371f0 ("extcon: add Realtek DHC RTD SoC Type-C driver")
> ---
>  drivers/extcon/extcon-rtk-type-c.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-rtk-type-c.c b/drivers/extcon/extcon-rtk-type-c.c
> index da0b3fd3676e..a421ce1c4361 100644
> --- a/drivers/extcon/extcon-rtk-type-c.c
> +++ b/drivers/extcon/extcon-rtk-type-c.c
> @@ -1339,9 +1339,6 @@ static int extcon_rtk_type_c_probe(struct platform_device *pdev)
>  		goto err;
>  	}
>  
> -	ret = devm_request_irq(dev, type_c->irq, type_c_detect_irq,
> -			       IRQF_SHARED, "type_c_detect", type_c);
> -
>  	spin_lock_init(&type_c->lock);
>  
>  	type_c->rd_ctrl_gpio_desc = NULL;
> @@ -1383,6 +1380,13 @@ static int extcon_rtk_type_c_probe(struct platform_device *pdev)
>  
>  	INIT_DELAYED_WORK(&type_c->delayed_work, host_device_switch);
>  
> +	ret = devm_request_irq(dev, type_c->irq, type_c_detect_irq,
> +			       IRQF_SHARED, "type_c_detect", type_c);
> +	if (ret) {
> +		dev_err(dev, "Failed to request IRQ %d: %d\n", type_c->irq, ret);
> +		goto err;
> +	}
> +
>  	ret = extcon_rtk_type_c_init(type_c);
>  	if (ret) {
>  		dev_err(dev, "%s failed to init type_c\n", __func__);
> @@ -1437,7 +1441,7 @@ static void extcon_rtk_type_c_remove(struct platform_device *pdev)
>  		gpiod_put(type_c->rd_ctrl_gpio_desc);
>  	type_c->rd_ctrl_gpio_desc = NULL;
>  
> -	free_irq(type_c->irq, type_c);
> +	devm_free_irq(dev, type_c->irq, type_c);
>  }
>  
>  static const struct type_c_cfg rtd1295_type_c_cfg = {

Applied it. Thanks.


-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
