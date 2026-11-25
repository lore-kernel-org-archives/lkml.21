Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645581;
	b=M7+b/C3DcQmWOfM/Vi6SziSO04QWBzsecUCjMOiKBeW3/K/RAuzwkFi0Zy16gUc8712Y
	 nW8vKCPubzz8PQ4Y/WKuNtVO6kE6CuuF763hBTrt49fibLdBr/47y480KbHMUKkuBv3Lu
	 PfmiT6zoi7dfXMaYmYyaiqEqxD5sWxZPperzjNGXUqp4V0WaiFsTNa+HBPiXUh54Q94x8
	 nXvVdm9xOuSLq5vckqQ4NvXFpBD2eAu+JxrytDqieewyp7ucFVyY4A4ldEyGmnFz83wdC
	 R90ZhwI9fEi8WI/skwgiacQg0sCSDux5Mz/fI2pVV9hGeYTuo033zODRQE3Hc89gP8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Wuez8r9Gu63w2n4PILNMjVIjqJqefCtyrZMp62dMrng=;
	b=kTpGe4LUToi1LnBZvYGtFT9KntPtwZGTK6YFtaz3gym5Nup7tCR9xMJMO3PjCnTZelbP
	 RaGXzqYbNBFRDCYMhX+J795y72LzrcebfOAaFKE4KXjg7wyd6m6RY+VHwMc88RbTzdqwl
	 qMi1zlVtCH650kfV8EpsS/Ao/BrwDBPWuB9PuKhyvuHuSpJiVYhsh1wSBr7Q8/9W9a+A7
	 91RF4CFF9PmlrjzahNz4g7C9eRC4tyBdJjzh2qy4w5298YjnYUm2N++ErUJR824g9ThtF
	 owonwhc6gL9QiikYIdKkc2VYBB6oBjfMAu8x64wRiPgfGlUm10bMylTKpMQ23P5+zJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fQ8M0RhK;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC6A606A69E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FC6A606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fQ8M0RhK
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a42b34e930so5509678f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795645579; x=1796250379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wuez8r9Gu63w2n4PILNMjVIjqJqefCtyrZMp62dMrng=;
        b=fQ8M0RhKyNOOnGhbnCuZJSsdvS2ywplR+VJH77h36xzfLAoT3Sb1fcj39NGzdN7SOz
         sHINKC+II5V6KVhG5xSsQJ+Q8cQ0XKfaWd2nsThoPDyslc8HBUSckEQtbdCd/PwLHJ3Z
         eoY4Ake1MX3eat1bX1YMIQouIi5ote4mChiP52hP9yjC+4/zKuXTCiFvosNAwEzpKd1I
         2SLuDdt8vTCG0NePsvFu/VNnU7BI9lO2NHQwIh5qixP9Smnv7rWosZSCrIcBVpOXS6rc
         NHCTmFN+St5noQPvtCFeT7chk3Lwp8CMF4+QvhFsJ+CKCJbwaLZ72oft7IRQZdbdsBry
         CXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645579; x=1796250379;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wuez8r9Gu63w2n4PILNMjVIjqJqefCtyrZMp62dMrng=;
        b=Uz6NIGf8WawVEwiH7DLcUnsP+uuENsvvLT7AApk0t+Yxkw/C60To15GU3Ykr0bcToY
         ND/Q8WcR1IwFxbM3et7Ogzl7+dBPK10PyVfmknY83Unzj2um+3IrYNM+ChfT9bDN0KWk
         +bJh4bQ1sTbGshOI2kWykbptNon3UVnkCKu77wGmCALSKEj9H3UxBOPbS3tC0Y2wHTnP
         NchJynYz0UUIehZazpO0kxv2cXsiNObU9RrXfng2ymW9ZJIPVD58vOIFP/EsMVwyuCF/
         mVx0b8Z5PnjqvmnWwnktCC/I/ZLFLwpnKOsbCiY+dfMvCYfbQ7mpqo3XR/asHqxIULz9
         JAiA==
X-Forwarded-Encrypted: i=1; AL+hErGg/XBhMASJQ1Wa7Z9qrsbD+rojCht6n6ONzIT2ZI7iLyVqJnHES/8pNCtywRqrjSrsgoJaLpPl24CiVuk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AYGqjVcnKA0SIGK8Nn5SMv3bw1YvN3k+34yRogGrxuG+hRZ5C
	sjY2yfxMWCy7L4vZeaDct7PfsxpQKxZK+4yjOaVv+dXUqszRupqNBlE/cCffkOstHM0Q9NfpRMv
	pWhmiCe4=
X-Gm-Gg: AZFdTZc7fkC2P+wVNzN2WBOqKR3P9Ch48lzaGCcNtCJs51WCWpBQi4xphfv6LMoOGmC
	f7SYZbfGZuDdVmL0JzQ2Q9oRCNc43o/y1wu9XWq9K3xHlgByn9o9T47Mgba4YfOzm7tJp/WDveK
	AwUdQuWSWUFI7w1D5+gU8gb44gZAABFiRp3pN92XL5jhDp2ue1S3309C+oJrUM6iPbbis0tbM9n
	peR5mlKdzB9nZliXSwS+n5n4bqV86dog0S+zQU0xWEvZlouanu58noWPTxIEIPMpqW4q1I3kISG
	77DX6jMIh+kkyinhLiId0DploRY8NVwA2P37jJi2bUd1QVCnQb0u+adXwo5YhzDWJUS3MzkPyPa
	KKjqH/2nNGfDHxD2T1Q/QDK+bMOdL7eTBZkb3dUyJjm8MXrDDDtgyKrQHxWUBzKBn9uwuRDiLC2
	NstIXhU1nvf7pxbSkZzcHeBOvj9Jwy8VUmElx5YyPEn+z3uobhywajul7f/qsCZjA5QjXoUSpRm
	95dyrypqqX/dvBApobE0zrh42UgqBT1EDJcP+GFDmtz709QpGJPQ3Lho4TDXNCF5OzO8QWwtmi7
	x01NhV4PRM0UFeukLcD4UcENEy1O5nA=
X-Received: by 2002:a05:6000:4616:b0:4a8:714:7ae2 with SMTP id ffacd0b85a97d-4abb32a3f61mr37314572f8f.29.1795645578997;
        Wed, 25 Nov 2026 14:26:18 -0800 (PST)
Received: from [192.168.3.100] ([151.42.79.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm35684687f8f.40.2026.11.25.14.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 14:26:18 -0800 (PST)
Message-ID: <baef27e7-93fb-4e6c-8df0-8cd74b9aa533@baylibre.com>
Date: Wed, 25 Nov 2026 23:26:17 +0100
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
Subject: Re: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
 <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
 <0949591a-63cb-4bb3-a7de-cf59ddbaafb7@baylibre.com>
 <CAFBinCAjFb7yS4VQp+BqLw2dG61To+iU4aiBvaVE9B9bWe=oUQ@mail.gmail.com>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <CAFBinCAjFb7yS4VQp+BqLw2dG61To+iU4aiBvaVE9B9bWe=oUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/24/26 10:21 PM, Martin Blumenstingl wrote:
> On Tue, Nov 17, 2026 at 12:06 AM Valerio Setti <vsetti@baylibre.com> wrote:
>>
>> On 11/15/26 10:28 PM, Martin Blumenstingl wrote:
>>> On Sun, Oct 18, 2026 at 12:18 PM Valerio Setti <vsetti@baylibre.com> wrote:
>>> [...]
>>>> +       if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin", "FIFO"))
>>>> +               return meson_card_set_fe_link(card, dai_link, np, false);
>>> I suggest using the "audin" prefix. AIU / audin seem close enough on
>>> all supported SoCs that we don't need a SoC generation prefix  in
>>> there to handle this differently.
>>
>> Do you mean using "meson,audin" instead of "meson,gxbb-audin" for the
>> compatible?
>> If so I'm not sure this is allowed nowadays. As far as I understood
>> "meson,aiu" is a sort of legacy naming. 'writing-binidings.rst' says
>>
>>     "DO use a SoC-specific compatible for all SoC devices [...]"
> Let me use an example as I realize that I wasn't very clear:
>    compatible = "amlogic,gxbb-audin", "amlogic,audin";
> Does fulfill the criteria (as far as I understand it).
> What doesn't work is "amlogic,audin" alone.

This is the thing I'm not sure about: "amlogic,audin" does not seem to 
include SoC-specific details (in my opinion).

> 
> The GXL example then would be:
>    compatible = "amlogic,gxl-audin", "amlogic,gxbb-audin", "amlogic,audin";
> 
> And for Meson8/8b (sorry, I didn't get around to testing) I would then use:
>    compatible = "amlogic,meson8-audin", "amlogic,audin";
>    compatible = "amlogic,meson8b-audin", "amlogic,meson8-audin", "amlogic,audin";
> 

Ok, so if I understand correctly you would like "amlogic,audin" to 
become a sort of alternative fallback so that:
- meson8 and meson8b do not need to have an "amlogic,gxbb..." compatible 
as fallback
- the change in 'gx-card.c' is more aligned with what's currently being 
done for AIU.

Is my understanding correct?

Krzysztof, since you already approved the dt-bindings change in this 
series (1st commit), what do you think about Martin proposal?
If you don't have anything against it, I will add it.

Best regards,

-- 
Valerio

