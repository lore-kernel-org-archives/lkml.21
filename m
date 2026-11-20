Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795199667;
	b=orCUTec90fccXRCRNvhNRY5R3pN48t6MPzLtHguOznGgLx4IWtbOCPDP6QbUc3Nl+8He
	 U1Nlo46SicUzY13Yj+xlR9JAjy0qbiG7JPv60D9nh0FSy/I8r9KiYr72oaufgAKmLbc7Z
	 suS0wAUvGgY6iI4V9bEk/0xLCXf90c6rk9eO+2NW1rPo7XkVAR48zap7RZhcs8mYlmg55
	 0injcXhBnUqzt5TgGvHevyARfWUjcwfeBl3Q/uCMDfUz/rLFW0vIdJuFETxJ3BlEfeiQY
	 xT81iyzPWYU4arQS4syZ4ccs8Fu70A5iLBJ/NEPGp1xYBYAFQSypQy9NtG9mQ+2uFMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AV6ebB8Obnvux27kcI15fcbNs/HB+big77Vva+Exrc0=;
	b=3pf8DEx0rzonnxLsFycNQ80YcWKVRaYMP6SXIKc5ORLHZkasNytrsOIwd0CnJhlVmjRP
	 ojAh3p45dHHX++WamL9D/iEJ/jqy6U9CLcX2mpSsLtMNHQRXbDSpFTmQ36mSkT+m2E72u
	 5KanODU+CqN+ByVdFi5pCYMneoRSdQNu1iaarn0luvJ97eK+5ExxZG9eiv+XrlnbCxllI
	 ybn9oudHhbG6yB13tRlBVr36z3mLzZ0GGHQE8Ty2IATGTWGBr9FfH/Bm7jAwJFZIBFHDE
	 lQO0e0+kFFi8dbvQYsbrId8Hu3DW1L8qH7x3lY/JqcG26fVyKl+h+mD5tfecyH3Kunw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t+cEvWiy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E23060A2603
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E23060A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t+cEvWiy
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso273900966b.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:34:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795199665; cv=none;
        d=google.com; s=arc-20260327;
        b=J3sGhVGoAVphmVh1KL1ABkVGzerLg5eSzdR1zlrfXFR1mFfiCLJd0k+jb/QWdz0uUa
         Dp4ms5nLNu0XxGb9McPmhhJdtL9uDN7Uu2cCc0fl2djpvT3GC6o05mk0qSegOa/8dfUE
         49m8vklpQvRDJuGILQlfZynM3RO8RPfW0kUMM6oKL3Yue9SUUO34vgnduMrJFDG3Gd3t
         q8+eLDDPGBmPR4/fxIGXO6pSiSG7uJTvhRtGLSuDtbw5iuPIKv7SdDBXC2cxCX76521u
         OIdQn9yDnj54vEqqOht7zjABimUbaqt9KabQO3jSluU6bDv7EYlCub5DWL2TxSD4VOkS
         snaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AV6ebB8Obnvux27kcI15fcbNs/HB+big77Vva+Exrc0=;
        fh=7pPYzbn/9O86PyKMxabCfd70mKEJ8GJY/xE8eALyH6I=;
        b=Pnma2945XMYW0U4yDB3c67qCfzItT86Z12MD0ATEAvsmXCNlaq1r+OAiXEhCYCchD5
         vasXgO4pm5g/QEt9B0GGBwgxULseunlooQdPHXkyE7mVXwSd+/xPyP0yRalByRyvAJsV
         v2K7sB+qHVJ5V7a3gJb4WMoZOth/6/4+uppKB6Jk/+tgtEJ0l5JMTz4wHWiiD4ciGlZE
         KDtrBO8tZdaRx9jXVolvYZqUOFhp398epgoSPpu5XG76X9aTMxc+WJPu8srFNHrcP7i5
         rDgSYdUPolblqFeXSgOc8NFWa00XdP3GqQiA+S6K7NzA088zdEThkZ0LyeV7WakID/h6
         /6MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199665; x=1795804465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AV6ebB8Obnvux27kcI15fcbNs/HB+big77Vva+Exrc0=;
        b=t+cEvWiyNyEjxMwvkh0Su7z/3d7TF0TGL6sfuK54Ii+d1+KaHteyRxC2utzI/t5zkG
         FyRlhrWSP6SYiX6DP44OkFRMsh8MLQStgbCSvXBN8QRQ2ApqmdvGFNfQBLMXzvBpwHMT
         34ehsBwQg0HYGq253BmC1Q81w2+vmNnzkvn+ykE6CN1OZHuXiNitcZIjhQSSTWEKY4xp
         6c5KcFHAK4Tq9/VC0ni1YBZvQTdBsoOhZHjtmwUE5rQ2YuXgmmdonl7Co7Lup1sDBn70
         8cxE7BjW3cHihP8Hbs4k1m/uatje7giV/0NRCSWustF/Q4tqbntKU7gF/u3RlBUW3Yhr
         lydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199665; x=1795804465;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AV6ebB8Obnvux27kcI15fcbNs/HB+big77Vva+Exrc0=;
        b=rgRA2nRF4yn9txN8KeAzuAA5lA0BIXdkObrpquJ+cOJMrqpRXK/5/mAzFHwm9UE6F+
         iYrvcL8ls+w8gJ4LjfxDJoTiJh/3C+4LtVjSjGU4EOcJl2qM0EM7ocsbzgJbRwHFJbtb
         YJlxntWgM/tI0hKbFzeBKafBwJGpFBSHWbSUciicPs3hlBh2qw3kUJRjOHd3rD3YzuAw
         YEDTg/EJGoCfVjfY1SZKUQXNCiGoWbesJ8ulQn/7KabM+dTpCZYNt96pqP3EiX/t+KHO
         dWc8Aeo17l3ZWVhwKRuzJyGTeP0tj223M1tbmXgcuO8xnkRuvLA9Xc2/REAVc4/Rl9hy
         n5Fw==
X-Forwarded-Encrypted: i=1; AL+hErHst/Sh6m7RlME+qDUP0X3VVRnAD/XnYVtDrPGD1sn8ScBGdtRQIRGUT8aBCQNVDL+9l3oLhvw0KSyf8Wg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jmEzAtccU5dwoE7ftTLS2eHyeS9yGKP+pqAJCoCimyfvrAa1z
	339aLD/91TSrxoN3CApTFU+XwcbkOSgZglHdOjtO2T6hXIjkQxADsidLPrJpDIfAm5I4r9OvCMt
	DhQ2SICSbnZvBzpJ8pfXT3r+jOIMmkV8=
X-Gm-Gg: AZFdTZfSvmO7LB0utYTJcSO1EMdhivih4xcbpaKHs9fgTgfFuBybSKY4WOutbiXqTWB
	9/FRFs0+bcOqSOkF99yR03T0f0bCSnHL/zktchYP+wj3sdCE65zV+nujVdFYl8+NKHezr+U/YJw
	yN4VnO1OPtWnXyed3jsRbKAXrVTvCXgSML9GHnzz4OuxPRJdxcBuJUMr8fWE/b+x3OfRvSJia0K
	b/Icc2C8pQDyuaSRC3I5Jy5H8Sl+AcG/k5JAwbmAfFz+urT7e7Hc7GV3poKSlzBG5LIr+xK3d9R
	gv5ge+fki9lu3HOwxoC1a3031R+691kLYlc1Bk3TmJiTUZ/5fpbefxR/GzZ3T8G11nUbakMSbMp
	THJ/B9XyM7a0QZMU3TbTe/G9VuTrqFKXvPTWSVgO69Ozixr+WL83UfWbcmw==
X-Received: by 2002:a17:907:3f9e:b0:c43:b0ba:485a with SMTP id
 a640c23a62f3a-c513191c4bdmr550670866b.21.1795199664617; Fri, 20 Nov 2026
 10:34:24 -0800 (PST)
Received: from 118528743069 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Nov 2026 10:34:22 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAMas6S2z+9-TyTfFTRDM+Qk2rKpRoYAUJSvmMxEwG6eAnQQn-w@mail.gmail.com>
 <066e8503-2e25-4666-9f55-f62b7592854e@intel.com> <CAMas6S2OpEag7VQAtHaFrho8VF883+EpL9XpO_sTV=ZLpmDJsA@mail.gmail.com>
 <b0db3d3a-4715-4a07-9532-d07ffbf3bada@intel.com> <CAMas6S0sV6PuLUC+gTEaVpHq-imDYHXyRYS_UxDgD3eECqgxxQ@mail.gmail.com>
 <3203b72a-6585-4f65-8eec-a17881ebd76e@intel.com>
In-Reply-To: <3203b72a-6585-4f65-8eec-a17881ebd76e@intel.com>
From: Jarvis <servidorjarvis1@gmail.com>
Date: Fri, 20 Nov 2026 10:34:22 -0800
X-Gm-Features: Aa3M54qv2I7N-WRX33q8n_4_3p-gx6wQE_HguAQVng1qOz4x0a2Xi7-I5REG4TY
Message-ID: <CAMas6S0UnEbo9kHBhZUP0Ur79Rp431YQM15VBDfeMv2zvjadVA@mail.gmail.com>
Subject: Re: [PATCH 0/2] x86/mm/pat: HIGHMEM pages in set_pages_array_*()
To: Dave Hansen <dave.hansen@intel.com>
Cc: dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, x86@kernel.org, 
	hpa@zytor.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hola Dave,

Te contesto en espa=C3=B1ol, que es mi idioma, porque quiero decirte esto
con mis palabras y no con las de un traductor.

En mi correo anterior me qued=C3=A9 corto: no uso la IA solo para traducir.
Es cierto que la uso para compilar y para que me ayude, como hace todo
el mundo. La diferencia es que a m=C3=AD no me vale con creer en un c=C3=B3=
digo
que no entiendo. Me gusta abrir el c=C3=B3digo y tocarlo, entender qu=C3=A9=
 hace
cada variable y por qu=C3=A9 est=C3=A1 ah=C3=AD. Eso es lo que estoy hacien=
do con
esto, poco a poco, y por eso voy a tardar en mandarte la v2.

Que dudes no me parece mal, al rev=C3=A9s. Si dudas, yo repaso todo antes
de envi=C3=A1rtelo, y eso me viene bien. Esta semana otro mantenedor me
hizo una pregunta sobre otro parche m=C3=ADo; al revisarlo vi que mi
medici=C3=B3n estaba mal y lo retir=C3=A9. As=C3=AD que s=C3=AD, sigue duda=
ndo.

Esto es nuevo para m=C3=AD. Me adapto, aprendo, y cuando me equivoco lo
reconozco y lo arreglo.

Un saludo,
Christian

---- In English (translated with help), so you can read it here ----

Hi Dave,

I'm answering in Spanish, which is my language, because I want to say
this in my own words and not a translator's.

In my previous mail I undersold it: I don't use AI only to translate.
It's true that I use it to build and to help me, like everybody else.
The difference is that I'm not happy trusting code I don't understand. I
like to open the code and work with it, to understand what each variable
does and why it's there. That's what I'm doing with this, one step at a
time, and that's why the v2 will take me a while.

I don't mind that you doubt it, quite the opposite. When you doubt, I go
over everything before I send it, and that helps me. This week another
maintainer asked me a question about a different patch of mine; when I
went over it again I saw my measurement was wrong, and I withdrew it. So
yes, keep doubting.

This is new to me. I adapt, I learn, and when I get something wrong I
admit it and fix it.

Best regards,
Christian
