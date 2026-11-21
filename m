Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795236758;
	b=edFV/jA0HHi1GmCAaoYdFhHuzrrsf5sCrUryGPqEZ0DjnvspxB2Lvw0qFvX8QajdgdDh
	 vTlilRdhBlpKWVqQZSudPrQHoi2eWcTNfupjCsAPSj7AjEr9wA3fWymaE6O+R7nRAkDKZ
	 5MeGvGfegURSR2iBnfGbmvl0j8uC8iSAwsubXUZzUNv2gJW9ckDSS6M2ALEapxQgXEamy
	 X1OdbODsJJWte1PJuWtFW/x2gerZtdIs36UU6wiDCqOk7buyCd+OYiGzNh5xhL4cETNqb
	 eYRH4lbzImcc8XhUGNm9lljnYqguWn4Wkgtmq5p/3f3BWadoCX+Y8Eo6wJ+zTSrLavQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795236758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BElOMUrNe0Z5QYnSCoS/+yWntHOMYQVZ5Afv4DN/AaI=;
	b=ifxWpcydRCi5iFIFEVJ04xrm0Y/i8tH1YGFqqF4O9ln18MigI5cwaEyFepjhjZeH10bN
	 R3rNQ5zfe2G/mULHq4JtThvyEAluYULWRL/dLqADZ4Y36+dRzIUo2g4jUuUbSr+6/Pw+M
	 ytAJ3lwb4/b5lDDhDBbyURZ7REz0UK2UZh1uLD6fRQPkoQRS44VLl9eaD5QI2t/zMosmO
	 GyjYJxD9IZOS8Esl+WhpU1X7axQSMKi1GNiFAgmRGysAk0mjcmt4vRHOjO1oKMbV6NFjU
	 ysi7m16NUXLeq+PveSuPXO4Y5Ekse9vfk1MAsfLExxUK4y2olpgQbwcyD5ft5oT886A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=osE5io32;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4808B606A69F
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4808B606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=osE5io32
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f03920c477so14063845ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795236752; x=1795841552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BElOMUrNe0Z5QYnSCoS/+yWntHOMYQVZ5Afv4DN/AaI=;
        b=osE5io32Nn+joBzaP+hIKzyy3vwwae6jNiXdeduuKXzDOQmy/aTxCjtXJ0dVmb2Pyj
         YSmpNyTjqlKfPr1V2DiAX0YDroo6VjWzd101rYQDnedG1vup2EbAhn+3KAXjU+LUnmgM
         gfyPDuxzNdiQYetCoTZr5sVryKmSlTADx81HolfEypNEib998tniFukAuBKuu3pWNXPg
         YbKSJhvUXWnFqCMMwbPe7iGq7BotyP/lShDBV9N345VfDpA8DcLNQVa+izHNTcg39TSq
         yMdYoye2Moc/rnamKzFPQCAJzpUxFc3pqsnjhylsb0Zsk2AnbLs18Y3uK5aVRCKStM/8
         OZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795236752; x=1795841552;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BElOMUrNe0Z5QYnSCoS/+yWntHOMYQVZ5Afv4DN/AaI=;
        b=SOVpxBO1iuLU6Xthaj5iHBlrhBPKuErAAJLnCmXthYD0v7rscPaSbRpZKuQ5jIG2OV
         2/IuTDdCbOyYyyuwnAMwkWPa3WGarCJUr2mYD9mlmjjUthqV+DzkMVmFlXc9y8PM0FA+
         qaXsOjx+pl3UUZHKRZ1zVq5QGg5mWQ9crz1kZEy2egbtsAmg/cWXU7WFTTHQOxBaRmNd
         i/Xa+RR0J41oUPD8qhWbHZGAoBoav3vDdv0cVRXUHjZrE/Wj2aqn9FdeDPXIt714wPxu
         yQP8p6sfX+f7pfJVe7R1KM0qRgGwi23YjxTAB6cyC+/PMf/tKwIAEy9Gce6PYMMIpOT2
         W3og==
X-Forwarded-Encrypted: i=1; AL+hErHL0iPDLhpgaeD4IiVoXCx3MFTdvVcQXL4E3M/hSixFoJtrXLWUcAMGfCAb79/7QEg9nv0mPQLQCPrkDd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+M6SoX0gnQj2EmM2JeiW63Q974tXL63FqpDdFqrLE18fDyQ/zL
	BgU1whXCFNZpNwZL2V5hVFFZ/gOt3HmKtzPz90gfetcUm5IMfZU3eTsExgHXBBLQ
X-Gm-Gg: AZFdTZdJxWFbXtA6Iul4jJjQ0GJYsYHTOKujUxerHA7utJ9SJGJ/6S8YYOjYB4QLp/o
	AeCTgGEnRSErFXRWkjkT73zIswswE3y5j6MoCH7FKK0r+KNLVnz1aFKisfn4Cob6Ljwk3A2R94t
	rCsLRZNWHgOUlHmhWB2RJrUUW2ToRJSQdInliLfUibgGDVbgvfd8oclFvwhtjZr8h74eD5MS/17
	0Fvazc/unRhOd+cHoYjDVpggW7x8oMv1/5P1QAML7JeQ4m5RSahs6CICsz9whr86Ck/bhZ+DKVU
	VblxGVRuljuz3XyVv9lhu38LWQNDQkFVPYpOcG5kuYtJcvBnatkSclXBXQDVgEihEBuQrFD+NcW
	mAS7VvaSXxRyn6/bm87alS2wHQrnKCP9LxwY/HwB7r0pFBxTL/B5dLdm295/2oj44L/RqbOF70P
	/q2E+1pSdnvD5enO+7g4BkHw5pSzGjRaYH0Tguny4hHU8ys0GiQHwMr2YSQb9aKJ2OtwcruuYl6
	GWoI7DB1NJ4B+qqRYSx+8fkOdzkv0gsyFAmZ3AmJFniaGTvWjM1jidpHUr/ty2Bs2TXE40Dirag
	GgwuTY28QZwrYv7NfwaS9TkMeEL5ASQRPEb+3d2lFiPqzmsf1wA=
X-Received: by 2002:a17:903:240e:b0:2ef:f656:2dc2 with SMTP id d9443c01a7336-2f03f14102emr56430895ad.31.1795236752418;
        Fri, 20 Nov 2026 20:52:32 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c2ab7sm21421395ad.15.2026.11.20.20.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 20:52:31 -0800 (PST)
Date: Sat, 21 Nov 2026 12:52:24 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v7 5/8] gpiolib: cdev: don't leak the IRQ name when the
 chip is removed
Message-ID: <20261121045224.GB17013@rigel>
References: <20261120-gpiolib-chip-removal-v7-0-aambrozewicz@nvidia.com>
 <20261120-gpiolib-chip-removal-v7-5-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261120-gpiolib-chip-removal-v7-5-aambrozewicz@nvidia.com>

On Fri, Nov 20, 2026 at 10:13:57AM +0200, Adrian Ambrozewicz wrote:
> The character device requests line IRQs with a copy of the consumer
> label as the name, and frees the name that free_irq() returns. When
> gpiochip_remove() frees the IRQ first, it drops that name and the copy
> leaks:
> 
>   unreferenced object (size 8):
>     comm "gpio-hold"
>     backtrace (crc dc8eac94):
>       kstrdup
>       kstrdup_and_replace
>       edge_detector_setup
>       linereq_create
>       gpio_ioctl
> 
> Keep the name with the line or v1 line event, and free it there,
> whoever freed the IRQ.
> 
> Reproduced with gpio-sim: remove the chip under an open request with
> edge detection and a consumer label. kmemleak reports up to 23 such
> objects after 30 cycles; with this change, none after 100.
> 
> Fixes: ec8b6f55b981 ("gpio: free irqs that are still requested when the chip is being removed")
> Cc: stable@vger.kernel.org
> Reviewed-by: Kent Gibson <warthog618@gmail.com>
> Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index f2da4f2646bc..fdcd315e776b 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -400,6 +400,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
>   * @desc: the GPIO descriptor for this line.
>   * @req: the corresponding line request
>   * @irq: the interrupt triggered in response to events on this GPIO
> + * @irq_label: the name @irq was requested with
>   * @edflags: the edge flags, GPIO_V2_LINE_FLAG_EDGE_RISING and/or
>   * GPIO_V2_LINE_FLAG_EDGE_FALLING, indicating the edge detection applied
>   * @timestamp_ns: cache for the timestamp storing it between hardirq and
> @@ -423,6 +424,7 @@ struct line {
>  	 */
>  	struct linereq *req;
>  	unsigned int irq;
> +	char *irq_label;
>  	/*
>  	 * The flags for the active edge detector configuration.
>  	 *
> @@ -602,16 +604,18 @@ static inline void free_irq_label(const char *label)
>  /*
>   * gpiochip_remove() frees the interrupts still requested on the lines of the
>   * chip being removed, so once the chip is going away the IRQ may no longer be
> - * ours to free.
> + * ours to free. The label is kept by the caller as free_irq() is then not the
> + * one returning it.
>   */
> -static void free_line_irq(unsigned int irq, void *dev_id)
> +static void free_line_irq(unsigned int irq, void *dev_id, char **label)
>  {
> -	const char *name = NULL;
> +	const char *name = *label;
>  
>  	if (irq && irq_has_action(irq))
> -		name = free_irq(irq, dev_id);
> +		free_irq(irq, dev_id);
>  
>  	free_irq_label(name);
> +	*label = NULL;
>  }
>  

The function you are modifying was added in patch 3, so note that this patch is
dependent on patch 3 in the description[1].

>  #ifdef CONFIG_HTE
> @@ -939,6 +943,7 @@ static int debounce_setup(struct line *line, unsigned int debounce_period_us)
>  				return ret;
>  			}
>  			line->irq = irq;
> +			line->irq_label = label;
>  		} else {
>  			ret = hte_edge_setup(line, GPIO_V2_LINE_FLAG_EDGE_BOTH);
>  			if (ret)
> @@ -981,7 +986,7 @@ static u32 gpio_v2_line_config_debounce_period(struct gpio_v2_line_config *lc,
>  
>  static void edge_detector_stop(struct line *line)
>  {
> -	free_line_irq(line->irq, line);
> +	free_line_irq(line->irq, line, &line->irq_label);
>  	line->irq = 0;
>  
Similarly - but you only need to note the dependency once.

Cheers,
Kent.
[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#separate-your-changes 
