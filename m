Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464783;
	b=yrBIEGfehwzjwupBTlOKuhGkLup0O03aiL+3S4jIsSvAYqln1L9pOHFm7R8edR2Hz8lV
	 SYke+EGvySXSGam5/JauiWfPOVGVnP7k4xtXkhp6c5ztT9sysj6zn98wCUI2wlMr2upKz
	 +oLho+E3NY6fpz1HvPBSEIKtedGki2BhvaJRtdYH1GXmTDxcgVg1p0zbO14q4haMwxAcs
	 wenuwKtciVGfNk5TiJuzHgKpjKfEFjRFIgOA+efv5km9oSU3xEB6jpPeNJXBygXA90Olk
	 t9p1YleYRFfaeRCwNv6a+8P579lgGIRr+JhOQpDAftfmMMWQXwtyGfwiY1U51YTHBEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Vl+Jr3N/YEqz9NFVbM7G/TwPrthGUN0HgQHZE/6GVYs=;
	b=2AkQE60f+4BbhgAVI5y4TuV0tnDmOUokZ8IyFWuk07+pjAwC+OehhcrFZjZXRFbTkkv6
	 EW8LR+gZ5Kl39yMQRA0KWgV+KNZk4Dt/fmKZzq5emG6J/bqDxk8xRuurIGbH68KdgvtjH
	 dpFwXIWEUp02r2xLYS3NK2Z6TiMqdlRjNZVoS34lSMv3nd3DgxWFmxLM7BlBxM2rJ+3xF
	 xETAln+JDn9TMHfaJfF3wH8PHzcMfuG/R0wnDiUEoFrDdYcUVr9fnQ43PjZqItbKkJrby
	 7HDbaGAHdzaiZ1HYtCMbHU4G7BQiNOLYTfcvZDhtechNCn6iTHyplrDfR8UHexmCFyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBwGTjYq;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34418606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34418606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBwGTjYq
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15dd124bbe7so2889227c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795464782; x=1796069582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vl+Jr3N/YEqz9NFVbM7G/TwPrthGUN0HgQHZE/6GVYs=;
        b=XBwGTjYqQTUhH8gOOPo7XYWKULuUQj/EpvbNDliWDwCiUoZljy6hipnGBLvu6Cnf5I
         QB4eBs8VRrzDPEFIyfvnEECbj62cghj/ipTuo/74QHstzb5WBVfWu4m02MzsNJkRGKvI
         SL8fcrbPP0dhsR+7166QGff/5/sQV76QwiPZ7j97puU4qusj2tHix5UXAB3PKH0FfvdF
         VB7kwwzfXflu7ZjkINak8Hp7mvsdVxjbRWKOPxeP6S6R2nC5D+bm4l+C8kc5KUkVw6fN
         cK8+myDOVOK7fbti9aE2nqTQHnvbOopkfcQ73z56fwYLjpAI07pa3Vv+0MfVvQC4YUsN
         YlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795464782; x=1796069582;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vl+Jr3N/YEqz9NFVbM7G/TwPrthGUN0HgQHZE/6GVYs=;
        b=vGwmbsaBXLGFJ9VvMmOwIUFZSqKmkWg8uqyZYEa8+c3lxUUhwTSZmDQM9AfbrWP+TN
         s6qjwC1mo4yzC8JNP/tJyLcYG0kOS2UE8iUpm+Z7MlBWjSlDEIPuvKLluCZKJPCKKT+i
         3wqysHwLtksAXQSNIcVM1WM2nALOSM5DzDLjdlB7FYGe0Jhpw1EUkXG03jrMaXB8VSNV
         nAC1sUhJNhHgHHXIGN92tpJJWI+goGZcxtNJuj7jsyU2h9YN1IMdvMxR2TwclbnlXhhf
         pXDgDKLziNIpb4djJV4yDxz6pTDNvRJzFc9SPlroFL1hItpfePtyM8DwOAVMpP7os2h8
         XPeg==
X-Forwarded-Encrypted: i=1; AL+hErGpuBm5JtrgsVYgJDXMRzQ62PjMJ00qpapxDiiw01uLDj2LR5xkckYBhqoSdCMaoeYSmQ4XeDz5LNsuGmo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WAwmQmOm8AEOEYlkpJrTi1zpODV/1fH9nD0p+UEyf1RbW57c7
	j17qt5A3ICy8mR8nJzHQXp/WpxDARNbQ8lTYssMVorJayMa6XxXaSIVS
X-Gm-Gg: AZFdTZedP0NsApvTqrg9GyMxGO9IBdvpMTL5gh2VkhDcJKJtaOuATT9frjcHy4Hyyet
	hNnG6uSdZSwAU94q5dhJBS78wjVhHqgqp73Nh1IRXO4Gu8oDdatgpg7kpKwHbUbn14G12zUHioc
	dgmYrKn+6FK4DZ84vKON/cLYb/jOR0DE5fmG/amkmfFd2FIBYLh9na7btumZHgWwxKX7TpfLYnu
	AAajDQIl1hYze4YEoMYl8v3cn37HTTBt6ca2jENOzCzBOeehHKmFsTgRtKFF+mrGu0wJSD3kkE7
	Wi4tokilFTl08qV9GlzSDu9NqcLNWgd6m6AEaz35cPsQwinD1WRVDvd/mawqnJLzb/Q4hquiR2r
	5gY36HY8pDjtvtdNtWbB3A5y8PjnbsdIUt3HWANXpQQboJ1hX2sQtkk7CbkXCI5jsZT7O9lxN0B
	9uSHmXPjSH/Dij92dvvME3svdqbuJNGxNA/sCNU4eoRbZ8yhPJ17M4ke/lAsq0zBrXZHdeU0RSM
	STovHlx3ESKN+Hc/L/S12+XtdUadql8Fs925RMk1GshrVC6vvJtVUPTrzZPOYX4GfVwUEdp8+CQ
	ZAPtRaT20+ztOlMA++lsA6vo2cVqsMeIQNXoQZv3mV8n4IFqNF/+6aI9zVzLPlMlFc/RdVU=
X-Received: by 2002:a05:7022:e80e:b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1b556924b07mr13875087c88.40.1795464782093;
        Mon, 23 Nov 2026 12:13:02 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm34059654c88.13.2026.11.23.12.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:13:01 -0800 (PST)
Date: Mon, 23 Nov 2026 12:12:58 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Marek Vasut <marek.vasut@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 01/10] Input: matrix_keypad - validate GPIO counts
 against matrix limits
Message-ID: <awSdwBnT5bk_BS-G@google.com>
References: <20261123183200.3900004-1-lee@kernel.org>
 <20261123183200.3900004-2-lee@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123183200.3900004-2-lee@kernel.org>

On Mon, Nov 23, 2026 at 06:31:07PM +0000, Lee Jones wrote:
> matrix_keypad_init_gpio() obtains the row and column GPIO counts via
> gpiod_count() and only checks for negative error codes before storing
> them in keypad->num_row_gpios and keypad->num_col_gpios.
> 
> If firmware supplies more than MATRIX_MAX_ROWS (32) row GPIOs or
> MATRIX_MAX_COLS (32) column GPIOs, the setup loops write past the fixed
> row_gpios, col_gpios, and row_irqs arrays inside struct matrix_keypad,
> and matrix_keypad_scan() overflows the stack-allocated new_state array.
> Conversely, a zero count causes get_count_order() to return -1, leading
> to an undefined shift when computing row_shift.
> 
> Reject non-positive GPIO counts as well as counts exceeding
> MATRIX_MAX_ROWS or MATRIX_MAX_COLS, and size col_gpios with
> MATRIX_MAX_COLS for consistency.
> 
> Fixes: 584bf366f8fa ("Input: matrix_keypad - switch to gpiod API and generic device properties")
> Closes: https://sashiko.dev/#/bug/linux-ed4b89af-6c76-4e5f-b140-fb2b107b12d0
> Cc: stable@vger.kernel.org

We trust DT somewhat so I do not think this needs to be in stable.

> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/input/keyboard/matrix_keypad.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
> index 11018382e84e..c2f839a3de90 100644
> --- a/drivers/input/keyboard/matrix_keypad.c
> +++ b/drivers/input/keyboard/matrix_keypad.c
> @@ -33,7 +33,7 @@ struct matrix_keypad {
>  	struct gpio_desc *row_gpios[MATRIX_MAX_ROWS];
>  	unsigned int num_row_gpios;
>  
> -	struct gpio_desc *col_gpios[MATRIX_MAX_ROWS];
> +	struct gpio_desc *col_gpios[MATRIX_MAX_COLS];

Luckily they are the same...

>  	unsigned int num_col_gpios;
>  
>  	unsigned int row_irqs[MATRIX_MAX_ROWS];
> @@ -302,11 +302,16 @@ static int matrix_keypad_init_gpio(struct platform_device *pdev,
>  
>  	nrow = gpiod_count(&pdev->dev, "row");
>  	ncol = gpiod_count(&pdev->dev, "col");
> -	if (nrow < 0 || ncol < 0) {
> +	if (nrow <= 0 || ncol <= 0) {

gpiod_count() never returns 0. It's either positive, or -ENOENT.

>  		dev_err(&pdev->dev, "missing row or column GPIOs\n");
>  		return -EINVAL;
>  	}
>  
> +	if (nrow > MATRIX_MAX_ROWS || ncol > MATRIX_MAX_COLS) {
> +		dev_err(&pdev->dev, "too many row or column GPIOs\n");
> +		return -EINVAL;
> +	}
> +
>  	keypad->num_row_gpios = nrow;
>  	keypad->num_col_gpios = ncol;
>  

Thanks.

-- 
Dmitry
