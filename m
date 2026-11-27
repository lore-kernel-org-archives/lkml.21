Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821489;
	b=VOY4d9lPWuPqk7CZ7kKKV2bFxgf+LENBILBTcBtPkFMcZ9gnjK7KtRNA3DbZ3qVtaHPj
	 V+fwWO6ysp2cuXCtrfJmdkxdUWhodByvY+qo8Z+kPsjdYaYvMZC7W0MLig+PQr6YRL6HC
	 8vLqqmo/aC3AcNG1wXc2ChTyOpdbIfdM4iKS7GmBrpo+ERoORCz1U0GWFkc0Ezw7YXFf0
	 b668Sd+Wrl/ugysn55IxzW3C8ZfEmU2FaOOHzGeYmnpYp6Y3fIEXw0sWZ6ZoPI7IUUHbN
	 id6TgO506UNbina7XJeShTAHBVmD/UQyo9d44uytd14hrz2+vIDbbLvjQSh4WcH2SOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Reply-To:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=dRBwepvEc84ti5G0r6gYv9Re/mpBE70ISEuNrETw7+I=;
	b=vwCirTK+7LqL40LMuZL+S6UBo3VASxY+1dS28zBtSZOnCEuHV8288g5zUYBjK5j5WBqY
	 e+FzCir60FS5+G8tDdiG4mdZT0PRw6hyO+4mi5TW0eN2TFBW+7wJF/to8hw5prFro1kkp
	 1w5eXt2EEdc8XxDLXM082Hdbo3VYf5rUb3wD50MuSeuQWGp3uXZRjDkU3t/nVPuwkh4/K
	 RSBi7aPipMHQCduTOFgZCjtfRpaY9YGMqfJVHdVRKE56afj3DgUJbYQpSW0beUDEbGmWS
	 B1VL5fYxyBiLVi6e0deL2XywdoB+7U8GttiwPbQtYE2ZqoN81Wzzqr3f722pDzaoOzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aYcGZQ4q;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7F7606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C7F7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aYcGZQ4q
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b43d30822fso4562535a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795821488; x=1796426288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dRBwepvEc84ti5G0r6gYv9Re/mpBE70ISEuNrETw7+I=;
        b=aYcGZQ4qYJMTjQ92Mj7CrJi4JY3WuxJlaEGJWgNmBHI5uCPMZOaNk1+vXlS5F065GT
         25XFspQnPc31reH9ZxaW3wXdWlnkcxxcTB7jDSgcSjLaZFi7aZjgz9C6uCPwnI2ud3HD
         GQMb9paibGzPCPeEyCTh1ZwSREcJEJpg5FiXyyv07UklnOKhQGUItz6UDvIYiWzkNxzF
         f0RAMjlqiAOsmq5Lhh8BBJLLoymf9MDUQvnqW1eW34NDqTrZb/9TJ0Sm+tgzuLNx1pXP
         +ilgIy8legcKcdMI0BHFGpXX/8NJrj2Vyy063xaR8Ubf71+6yEE3HQViijTM+WwW3Zlq
         xxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795821488; x=1796426288;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dRBwepvEc84ti5G0r6gYv9Re/mpBE70ISEuNrETw7+I=;
        b=kgrWVcI/Zn+3nQEUJlQUF5G3eWOjUyPSu9fO+TEJ1xC5Hhl12k1ssj/ORTFVfsRJO5
         gmJLjT9vxGT1ULNpq9nSVnFsc28EzQnvlxzA1c0JW6W2wT4hgTKYaFStwjKdePzIH+Dj
         0zzvX7f5VBP8UB80nm2Ycvlujq/AUIfh7uSRnEkwJnlbJIUQ0EfTrW3FEvFAtxv0SpwZ
         EvH5gcYXWwr9FDqR+8qYHW+guZo+5yq7Q5sUFBs9qYqgeOfJ0cbeGEKwCPg7d4LQntx2
         X3Usz0dKtoS+QqHP/VpDtuSqKiAEaI6UtitwMq16VZ+ccPraRpfT1qGfMoymDy4neRsK
         hJLQ==
X-Gm-Message-State: APuU4Z85kixSFRAA8Wtfp2YNUB9JQkYyyNRY4TvX67pU44joeybfMPl3
	eW4XMQYYTesX0C4CN2MEb0ie+LJmm37AO2cyG6Plrx8HOe1JaShvQauU
X-Gm-Gg: AZFdTZfgVmgQGj6X6LMIg5NVSLjU3f6GlHYE3o13zBGTbcmim5SyqswlsEafGuGKfs1
	YxFFPqGl0T8J8TkB0NI5PRF/dc+04MAS9NKntR1woGpnATGZHWb8NtuHYkqECivRjrptzJaIwzv
	qKltr1S/ky6ToOMyVaiea9PqruA1Oj/bNeTNizKmH4C70JG0EozgWdOD1hDLRaONrXrqtiVgEt/
	SH6Q/LQQrnvOPaS17PKeZaW8wDgrTIUPJUxNSo+TxxV8R4OHOprDgH2OLzKJ5HJZdbygn6/HiTo
	dB9JMPEtr+jS5rDv3idG29w+srK9TzSVT7YNraHgSRPEn+biAXpeojNMzdBESlsqme5ikno9PF/
	ac0tclkWFSYLAsxxbO3P2tzO5V/McTL2TFMFo8EnWc3CcLcYmiCv2cMaq0RDSXDKze2EVA7nq7K
	GNJU6XaBNQ+ko0sig+X4LH7YXOFPYRDQ+DLGxrET1Xzw7xDH+wxW7DR8VoT+USoibSY1WR5JMlB
	UVkaP30oCYVlAJ+eKCbJoChR1dOb8zRoTad/D2HOPb1fxHj1XurE9xTtdfTzaSVwz8AFp7IY9Bn
	dWOeR80CSTtGqyGfbvWmGGotHd3FOko2Cs6xQ6OyqpUrI3xbzvnvAlE1gc7McrysJCI=
X-Received: by 2002:a17:90b:1b0e:b0:3b5:3606:f7a with SMTP id 98e67ed59e1d1-3b536060fa4mr4512968a91.1.1795821488334;
        Fri, 27 Nov 2026 15:18:08 -0800 (PST)
Received: from [192.168.35.60] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d135e9sm42857690a91.4.2026.11.27.15.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 15:18:07 -0800 (PST)
Message-ID: <9f51b843-148d-44f9-8910-79cb9091f17c@gmail.com>
Date: Sat, 28 Nov 2026 08:18:05 +0900
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
Subject: Re: [PATCH] extcon: fix typos in comments
Content-Language: ko
To: Hemanth Selam <hemanth.selam@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org
References: <20260904110622.16766-1-hemanth.selam@gmail.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20260904110622.16766-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/4/2026 8:06 PM, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/extcon/devres.c              | 6 +++---
>  drivers/extcon/extcon-intel-cht-wc.c | 4 ++--
>  drivers/extcon/extcon-max77693.c     | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/extcon/devres.c b/drivers/extcon/devres.c
> index f9d52e8ec5cf..01da069ad4c9 100644
> --- a/drivers/extcon/devres.c
> +++ b/drivers/extcon/devres.c
> @@ -113,7 +113,7 @@ EXPORT_SYMBOL_GPL(devm_extcon_dev_free);
>   * If extcon device is registered with this function and the device needs to be
>   * unregistered separately, devm_extcon_dev_unregister() should be used.
>   *
> - * Returns 0 if success or negaive error number if failure.
> + * Returns 0 if success or negative error number if failure.
>   */
>  int devm_extcon_dev_register(struct device *dev, struct extcon_dev *edev)
>  {
> @@ -167,7 +167,7 @@ EXPORT_SYMBOL_GPL(devm_extcon_dev_unregister);
>   * "old_state", not the current state. The current state can be retrieved
>   * by looking at the third pameter (edev pointer)'s state value.

Thanks for your fixup. you better to fix 'pameter -> parameter' together on this patch.

Also, there are remained typo. Could you please fix it together?
~/kernel/extcon$ git grep -n -e specfic -e negaive -e upto -e pameter -- drivers/extcon include/linux/extcon*
drivers/extcon/devres.c:168: * by looking at the third pameter (edev pointer)'s state value.
drivers/extcon/extcon.c:908: * the current state of an external connector and the third pameter
drivers/extcon/extcon.c:971: * the current state and the third pameter is the pointer of extcon device.


>   *
> - * Returns 0 if success or negaive error number if failure.
> + * Returns 0 if success or negative error number if failure.
>   */
>  int devm_extcon_register_notifier(struct device *dev, struct extcon_dev *edev,
>  				unsigned int id, struct notifier_block *nb)
> @@ -223,7 +223,7 @@ EXPORT_SYMBOL(devm_extcon_unregister_notifier);
>   * device resource management and simplify the control of unregistering
>   * the notifier of extcon device. To get more information, refer that function.
>   *
> - * Returns 0 if success or negaive error number if failure.
> + * Returns 0 if success or negative error number if failure.
>   */
>  int devm_extcon_register_notifier_all(struct device *dev, struct extcon_dev *edev,
>  				struct notifier_block *nb)
> diff --git a/drivers/extcon/extcon-intel-cht-wc.c b/drivers/extcon/extcon-intel-cht-wc.c
> index 99a9dfc62e2b..0f2168150a98 100644
> --- a/drivers/extcon/extcon-intel-cht-wc.c
> +++ b/drivers/extcon/extcon-intel-cht-wc.c
> @@ -145,7 +145,7 @@ static int cht_wc_extcon_get_charger(struct cht_wc_extcon_data *ext,
>  	int ret, usbsrc, status;
>  	unsigned long timeout;
>  
> -	/* Charger detection can take upto 600ms, wait 800ms max. */
> +	/* Charger detection can take up to 600ms, wait 800ms max. */
>  	timeout = jiffies + msecs_to_jiffies(800);
>  	do {
>  		ret = regmap_read(ext->regmap, CHT_WC_USBSRC, &usbsrc);
> @@ -192,7 +192,7 @@ static int cht_wc_extcon_get_charger(struct cht_wc_extcon_data *ext,
>  		return EXTCON_CHG_USB_CDP;
>  	case CHT_WC_USBSRC_TYPE_DCP:
>  	case CHT_WC_USBSRC_TYPE_DCP_EXTPHY:
> -	case CHT_WC_USBSRC_TYPE_MHL: /* MHL2+ delivers upto 2A, treat as DCP */
> +	case CHT_WC_USBSRC_TYPE_MHL: /* MHL2+ delivers up to 2A, treat as DCP */
>  		ext->usb_type = POWER_SUPPLY_USB_TYPE_DCP;
>  		return EXTCON_CHG_USB_DCP;
>  	case CHT_WC_USBSRC_TYPE_ACA:
> diff --git a/drivers/extcon/extcon-max77693.c b/drivers/extcon/extcon-max77693.c
> index 2c567e0b7b7f..2839f0c946c9 100644
> --- a/drivers/extcon/extcon-max77693.c
> +++ b/drivers/extcon/extcon-max77693.c
> @@ -689,7 +689,7 @@ static int max77693_muic_adc_handler(struct max77693_muic_info *info)
>  		 *
>  		 * The MAX77693 MUIC device can detect total 34 cable type
>  		 * except of charger cable and MUIC device didn't define
> -		 * specfic role of cable in the range of from 0x01 to 0x12
> +		 * specific role of cable in the range of from 0x01 to 0x12
>  		 * of ADC value. So, can use/define cable with no role according
>  		 * to schema of hardware board.
>  		 */
> @@ -708,7 +708,7 @@ static int max77693_muic_adc_handler(struct max77693_muic_info *info)
>  		 *
>  		 * The MAX77693 MUIC device can detect total 34 cable type
>  		 * except of charger cable and MUIC device didn't define
> -		 * specfic role of cable in the range of from 0x01 to 0x12
> +		 * specific role of cable in the range of from 0x01 to 0x12
>  		 * of ADC value. So, can use/define cable with no role according
>  		 * to schema of hardware board.
>  		 */


-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
