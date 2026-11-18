Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017381;
	b=UR37/ysTRws0uObL5PqZU2raLYjmvfZWE+QEltb7C7NLVNYVc55pfSgU3CiKaYcxn80l
	 owOdtWxDgjro9HCTFBAga5t+3DJ+c4iCuB05ZSbhArLpplMgLMjrWkMRhkbt426jKSts+
	 UGKDszRqNoJ5y6vcyxWJfuDFuagNIqgRyU2gOO7LxU+0N2HUXHbESAEeGSo6zoam134gi
	 dt3uwZFbmOaWkFeqIprc0p1ij8a+xZHI2xS8k1CAmf2JLqsG+PQpKIAjY7PhZClk78WMT
	 DFnzQNG57f+LkzRDeHWuy3u/qxqENR5mo7L/QXbp1ZdVsuw8aZYseKw98xua2Se48WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=14Rrkj1zzHeLghewisueOdMH2DyN75ASzqaxxjdbHII=;
	b=e8FjcrnXp9iMZ6a7nHYgRfQm6mkDzxgC8RNKrVZRNPAalNavC4nW+dZ+x6OXDx8tHp6F
	 gQ//XtDwnj9UUilym5y3OtMJxLJd3dUSCB8P3qR00wSLVypgZ3x+6B3U51JmyNHPlHeYi
	 3dUvi0LeEIQVxquCSVbs2iR5YvbsCugQbFhUc78hRt0eScrGvEsDhAVlk/wDnfH3KwDcO
	 4vbAS62RyQ6N9c7AL9vrlYUc2v50OEsZpX6CT+LO2TPlKwaMbPmH938oLmr6QvJ+H1XLC
	 7R0G7Ehp84Q2s354vJCTqOMhMCwb10geY7IqUEmljjKi9MWW3VgIaAXegwZ0klQX4vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNpXJrNj;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCCA606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFCCA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNpXJrNj
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so626887f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795017379; x=1795622179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=14Rrkj1zzHeLghewisueOdMH2DyN75ASzqaxxjdbHII=;
        b=nNpXJrNjgKX0g/k/8W9uTi0ybiMY9Om5fZndrOSFdhShxcIomGz3aBxaUmAZCrIq+5
         VgD0UrFWXEsxqzNgG6Lpt3XJoiRPno05Gm8vpL+P06cGHajtkW+xtd3DBzNacE+KRmbc
         iscxt+USh5F6yVuVukaxhsHos3Sb/DexpU8XtmIdBHGk1BhwQDVv9yKSO0Kt8RZlMqPO
         uTivgyS5PepaJkovS9dOvTZ5qWz9VVDq2Y7BJ8jPJ0oNrJsBCl5OMHT3aK54As4ntA+P
         QQMK4yvMVFFZAEkG3xmK5TljtSnT82f4DFeNhF3r8VnJg7eMCHStokTQLS8yZfO6Ivmr
         3aYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017379; x=1795622179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14Rrkj1zzHeLghewisueOdMH2DyN75ASzqaxxjdbHII=;
        b=QEzvDjoVPgfy8KXMYpJ9lBJ/D3DovLc1+lT7kN5mgd4z0gz/L7sQpd794GhB1oST4D
         MAuguaGH78wp/ChVnNKO8eHa9zyo8EF0HbUhtf+TqkpLgppeebjdivXbIHxa+5oNrPug
         Ho3DwMhkV4kobNiyvHlAmv2OpB5/ayuTWnktb/EZNOTuiicE66ZlG9St0jjeUlnY8mXt
         1c0BieV5a8hI/dxxA/Cgn4P/FS4DuFYP/RxKyNBkxdmhmu4F32jEs06yWPoCl9jQmXMe
         5EWnTmUGG8LIebX/9kcj3yvqm1HtWjAV/04lS6HtE4yhQhGcR/c90Y9P2qYMrC1/iCAu
         DHCg==
X-Gm-Message-State: APuU4Z++sbaEu5K1YrD9IIz4f8sAucv7QB/bvfgKvjjAofx569GIrz74
	7egq+z5GKEV3I4doB3FtUygqfiuKZjI4v+9FlYOkGlRTEiMglI0QAfEHeAUjMrb6
X-Gm-Gg: AZFdTZdbWX8FS/Ttz9A3RLm+s6ZOPg1Kwqg2Xp22SCm32T7rFTxxQAwYZmogSuzgl+T
	6WqF15VCjfl8xC6GE2zTEVfYrUq16u/+9Gh9bAI9TIpZjKcMiimR/svGuAp9qdGXLlOi0itZ6U/
	qxmmTPFCrAVxFnnJYAU558RA1nlyAm+sFzRHzH7RzDkRXwyFvgzgxlc7yX2iZyfek7elBGvJEsC
	ObPSLuXZIhKQVrFnJTEPf+3R3G2dcI2NwP39fqvedNUGf0DcBiA7WRN83mZvDUo/6G8OlpJFaNP
	imv2/zn+alnBSvG9AQS/2zPltrqXtkF1cZ5gsQfI3znmzDzykwP9c14M01O20Ih7hbXpJlRa0Hy
	18UQJf2amK0NGqw2wMMJ1iv8FtSBscP+JqQWwKwOTE1ThFl4KTiUcNbMYzPsr/2G43dlzYBk26E
	z8+caoYmQI/O+bMWJ/eCzhvm/K3+Xyd36xZyAfVOxR4brnOancWqvf8KTbMvSyOh2aRWYN3rqOf
	sPBheTMkF4hIuI5bx9ZI8KT5zRK0KTxJVHhRWd7PqY8ZIAzlqKMO1LsQ0jA8IS2e1qojpYFTciH
	C8I5PnrHnaDfMm0LoYDI+FFPfoh3kdYBlmC1P3w=
X-Received: by 2002:a05:6000:461a:b0:493:fdf6:14aa with SMTP id ffacd0b85a97d-4a63c657ca2mr7054638f8f.56.1795017379082;
        Wed, 18 Nov 2026 07:56:19 -0800 (PST)
Received: from [192.168.1.50] ([188.27.124.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c11f4bsm5644289f8f.51.2026.11.18.07.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 07:56:18 -0800 (PST)
Message-ID: <eac5da81-b823-4f9e-ac85-add330c03b0b@gmail.com>
Date: Wed, 18 Nov 2026 17:56:15 +0200
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
Subject: Re: [PATCH rtw-next 5/5] wifi: rtw88: sdio: read neighbouring
 registers of the 88xx chips at once
To: =?UTF-8?Q?David_H=C3=A4rdeman?= <david@hardeman.nu>,
 Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>,
 Alastair D'Silva <alastair@d-silva.org>, Luka Gejak <luka.gejak@linux.dev>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20261116190145.2736364-1-david@hardeman.nu>
 <20261116190145.2736364-6-david@hardeman.nu>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <20261116190145.2736364-6-david@hardeman.nu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/11/2026 21:01, David Härdeman wrote:
> Every register access costs a full SDIO command, about 40 us on a NanoPi
> R76S (RTL8822CS, SDR104), no matter how many bytes it moves. The
> interrupt handler reads HISR and then RX0_REQ_LEN, which follows it, and
> a free page sync reads the three REG_SDIO_FREE_TXPG words one by one.
> 
> Read HISR together with RX0_REQ_LEN, and the three free page words, with
> one transfer each, as Realtek's driver does. As in rtw_sdio_readl(),
> this is only done while the chip is powered on; before that, and if the
> small DMA-safe buffers this needs could not be allocated, the registers
> are read one by one as before.
> 
> On the R76S acting as an AP, TCP throughput to a client goes from about
> 170 to about 190 Mbit/s, the other directions are unchanged.
> 
> Signed-off-by: David Härdeman <david@hardeman.nu>
> ---
>  drivers/net/wireless/realtek/rtw88/sdio.c | 84 ++++++++++++++++++++---
>  drivers/net/wireless/realtek/rtw88/sdio.h |  4 ++
>  2 files changed, 78 insertions(+), 10 deletions(-)
> 

[...]

> diff --git a/drivers/net/wireless/realtek/rtw88/sdio.h b/drivers/net/wireless/realtek/rtw88/sdio.h
> index ab366f82d92..6aa59ed3db2 100644
> --- a/drivers/net/wireless/realtek/rtw88/sdio.h
> +++ b/drivers/net/wireless/realtek/rtw88/sdio.h
> @@ -188,6 +188,10 @@ struct rtw_sdio {
>  	bool free_txpg_valid;
>  	/* TX aggregation buffer of the non-8051 chips, under tx_credit_lock */
>  	u8 *tx_agg_buf;
> +	/* non-8051 chips: HISR + RX0_REQ_LEN, read by the interrupt handler */
> +	__le32 *rx_regs;
> +	/* non-8051 chips: the REG_SDIO_FREE_TXPG words, under tx_credit_lock */
> +	__le32 *txpg_regs;
>  	/* one writer at a time between the credit check and the accounting */
>  	struct mutex tx_credit_lock;
>  };

By the way, you can call them "3081 chips".
