Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795595080;
	b=OB9s/dlx/Zaoz0QOyYmqWK+zKANXziSLRbtqdhq8qiNtIRCbXi1cER5wpAkdh/SYahUM
	 4SuXU8J/gbdvk99g/VlEzscFWfa59k4Ysd0p0VcT5Wt8EylGjBezZ9Oikr4hICauynnZo
	 eieu5a9Q3LM8PS8N+viMat7p0JdkyJPYKqeLO9l/TPbb8ClpQOTLyBueUGcK5ppTHDvzT
	 Vda6Gu2s+pmaZvpZLnE1OwJL+yHtLVRh3TdvBTFUTQfOHsj7Ek9ft3DYXuhy0IKg/cXy2
	 x+o8bWhM6dcMbq0hp0ee5ci+2pI9XzQtu2owL58oyz1qO+N47wmtK1RVMBbRBQfcqPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type;
	bh=+OgTYY8n6yc3qcbD3zimkqKD2AWn/72ixSa4WihkrKk=;
	b=d8Z4I4iZTTOn8osvTBYH1f9m1kvSSM/kZ+yy/p/W22XvTYbwvSERlnCl4aJc8Th/jCOv
	 OErE0rnQA+Iwt1a6EqBnRTvuwdKcTwogm6/EiAU8olPh1wIJSaprIME4jEHRp0/nejhsi
	 eUAMklTsXwTicIoSQM3/NCcvBxSi+dEoFNVzAyqtPmtNQo2+Toon51vSApPJjxIojnWHn
	 k5X1UwRL208CaZj4gG0EZImtn+MUwMZLmkFAxAJ+BuFV1iV2rDKMoTzBUmoOcZHoytTlI
	 iXwZCc8eyurxZfZ1DkNkATf1b0fPUeicZyLzon5aRKS+9WDTGX/YfHxUiGoHYlkejsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JYnBbibw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3B4606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC3B4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JYnBbibw
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50aaad19fbso603904066b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:24:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795595078; cv=none;
        d=google.com; s=arc-20260327;
        b=eJwFLgmSAAtaYkzfI1uNq4cqA56ACwHhIhLBkk8BbjAJS8c9dcG+iTxwS36BfN5xor
         RbDOO9A81vzUbXZxntuQN2/RFyCCv7zQZLjBC6/c+eBEDQxBI8VFtd4Y1uqPaXCvO5Bi
         hJUWBWeDWMyG1uTLr+qnfVY3e+G0bv00apnfT/1y6oS5InFnhTcp9LPDvMI3ed0qys+r
         ws0HhzY46svwVEmxpQSC5r+HZpcE3tM8mcH/qahMNPUJcy0xFh89FEEu2UWqKuIJRnCt
         ZfS5BDU05o9SdTq0JMkw6sp1QYRcCjLScg1ofVFRWmLGCY+2vSDLL9LFnBeEz0EKJhKu
         Vy3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:references:in-reply-to
         :dkim-signature;
        bh=+OgTYY8n6yc3qcbD3zimkqKD2AWn/72ixSa4WihkrKk=;
        fh=OqB8MYqDrdA3sOrAFtgchRsoyr/nfNk9so60YzhdsDw=;
        b=pjSE/L92L2MCZXxd3RrwMSs4SaE4VLhdcU9K2OHcZ4JQ/sIOiAyLMagfVALtxfZOnb
         gASy6fEpmXjhF8hDwJZxl98AA3yER9J9NIOU1TKlTH0FXiFv0mVnOfxxFU9iL1vSa2Ug
         rWrT+NrLR0/Tjc+MDxO9dunX7j2Vr2ymiVekP6ixuEmdL5twWZ0I3oTlDS6Cgu+mqDjj
         Vv5mTLom+B4uQ2RqcCIoExfrzix7XzS80TJ5UgdTWH7pMhret9Hx/DWtkvS5IIftTl8t
         B0egt9YnDrCl9iV6YEHQEzrApTYaZSYKS99zKa+BnFVR5TgXAR8yg4RKyPn13SDUdvfE
         yVXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795595078; x=1796199878; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OgTYY8n6yc3qcbD3zimkqKD2AWn/72ixSa4WihkrKk=;
        b=JYnBbibwmphUIXBEAUa/kCRgqceDjAv/l0WaihxjyopfKawc6bFPMZ7cTmF1eUTr+L
         TTTNgbOLg/4QD020Cx7XQt8dIw/AjE7UoUpmYOgEe+tNmFWjvyo9bA/bvacvwqZmcTyq
         K1ML8TTAed1Ce7U87SlAAPCyU/VCU9Dy7KoXVTVlFqCPjY4yFZUWcvCvHc/PgjuldAwX
         JPgWJ6HbXqGHBqXuaqCtwdvgJ1326sNr4ew0JiCNoeLtluQUnE2Ri5S5hnGSNlCRp9La
         T3ZJquk487Xd8+GyuVbvi7Gqkn1rVwCQQZRLf0u/upQ5wKeu6zZ3GeQcGzgIa5481Xfq
         gSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595078; x=1796199878;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+OgTYY8n6yc3qcbD3zimkqKD2AWn/72ixSa4WihkrKk=;
        b=2z7YnnS5HqSmd0/wDtG512HEXe0yjsj+NbETqrpFz1qO2P6Z4NplYuBxP7aQxIYQ1s
         yeepAnnTwJUK51/Uj98fWw86ms2SoVhdMV8OmMDm3JUmlY0VJZ2LwqjJ/azFRmF2JkD3
         PfNoA9HQGx6uZW61z5c6HuQL/6VPZJkqcm/tCTzMvMBLwMB3q2u4IWIRVhE0WsDpz0NJ
         SY2hfF8AOUN5Cs7t45PedzNkrFcFXFdFWxUp7nXhbou/v1aEyybsJEhZq4jxjpDEsHf5
         zbXvOyzwoMLVGNtyRtLQ0qmfEfwxi8nZNGEbFg4dMO31G/ytwVUp0dLGbsZh2TOgWW4e
         Oc+w==
X-Forwarded-Encrypted: i=1; AL+hErHiSZsYHrx+Id9bII+bXs0KTZ1bLXf6N0+lRZfbyuYn4rTR7wlkjI2FYIahb4jLuzZiUtkRImm/AlI4Keo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c+Fjv1/bsoZ7acG6pFRV1EE2RYrH98eD4+cCdMqGJQTnZpM/A
	EUzEz6XHaDRDdZRnqz4nZX0fo7FPVgPhbF3NAsFKHc6DMn4ZyofFFkLevPPvXFCMw6d4m0LFHdf
	GaXGtCWt6jK5rgPCMguWMUblErLW7+pXjJ3nn
X-Gm-Gg: AZFdTZfdcAv9zDugtxZ3N9+MU8xGKa/Rag5oYD/q7nrx+ymYKm5HZzzGVVwZa1x8s8o
	23Z8yt7hZ7Nd3OopMZQ6TzdGg2ZRG1LaNfXqdDE7srXnZsZxBzl+09eilX3lc/l0db3iGAjt1B2
	0IX9PPMLTLgorH9eQChOOkL47sf+FBRo0MvqRdn8WkOwDW/oRfPvK+FzPyGhSMEiSULa9sX+kbC
	nhrr/VEgPUjPO2f6SEKZhOCZozuWNpneTFm7++a6tcEk/tWUpx1lGBW/gFgLQlvnJ4ju+TkdZ8R
	EL0d/BdFqa15D0TNOIB3yskebc7PuungjZJ40DARVqj6qdDKOBDQ11rlnyksBOwembibgHkXpNT
	yPuHEglAcpRwLyk10BjS3Jeix4Y49BrZmK46WDw==
X-Received: by 2002:a17:907:fd15:b0:c40:9e84:942a with SMTP id
 a640c23a62f3a-c513aade153mr1426627166b.48.1795595077992; Wed, 25 Nov 2026
 00:24:37 -0800 (PST)
Received: from 1087654160852 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Nov 2026 08:24:37 +0000
In-Reply-To: <20261125-ymc-82yl-v2-0-624bdcb3c50e@rong.moe>
References: <20261125-ymc-82yl-v2-0-624bdcb3c50e@rong.moe>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Eduard Aliman <edialiman20@gmail.com>
Date: Wed, 25 Nov 2026 08:24:37 +0000
X-Gm-Features: Aa3M54o67SCsnlpq9AQJICAL3atDqUTbJibGMy_iK-r2wySf-JoH44j30Oevkfs
Message-ID: <CAA4HgY+tuBiz06+uq0nfBVfzmVCVPatb+9LGdFN8L3jOPSNfqg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] platform/x86: ideapad-laptop: Trigger the EC on
 YMC events following Windows behavior
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Gergo Koteles <soyer@irl.hu>, Ike Panhc <ikepanhc@gmail.com>, 
	Andrew Kallmeyer <kallmeyeras@gmail.com>, Eduard Aliman <edialiman20@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mahir Faisal <mahirfaisalantiq33@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rong,

I tested this v2 series (patches 1-7/7) on top of Linux 7.3.4 (Fedora 45)
with ymc_ec_trigger=1 on a Lenovo Yoga 7 14ARP8, and it completely fixes
the issue: folding into tablet mode now physically turns off the keyboard
backlight, and unfolding restores it, matching Windows 11 behavior.

Tested-by: Eduard Aliman <edialiman20@gmail.com>

Could you also add a DMI quirk entry for this model (matching
DMI_SYS_VENDOR / DMI_PRODUCT_VERSION as in patch 7/7) so it works out of
the box without setting ymc_ec_trigger=1 manually?

DMI info on this machine:
  sys_vendor: LENOVO
  product_name: 82YM
  product_version: Yoga 7 14ARP8

Thanks a lot for tracking this down!

Best regards,
Eduard Aliman
