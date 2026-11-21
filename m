Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795287973;
	b=UGDd7CBZ/4Ar5HNxyqt91NFWVF+RkFs9acP+XvGD4jrKHWnd6aWhusQRpeRbfFhRVzFw
	 q7WSQWu4PBfBwR75bEezRYEChcB/kT0eCEA69Pc0ULUvqyFAYKu0BXjKp9FiXzcqLc+V+
	 mVKyJq/ZbRA0PLajC6oUeGCc9z3z+qovphvakZQ7JpfKYDljZJuCM5Bm47HvnORs2wYwj
	 uhUgbPsO9TK04yF47LNsS2Y/M5PKgUB5MnggS/to3aXuhA4qSfli3x8N2NR7wJGxUREec
	 xA1/N+z4bR6jS1iCI25vk4t2pFnrlfR3s7pom7s+WQ8qm+0txrUQ+E8LLc8nFKCvBQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795287973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=FpKHiV2uYxe7Ki0iO3VWKGByi0ydeGzhGSrgX6lNY+s=;
	b=dpTeN15Rqnc/UwK8LKGAQkHjxtnf8qD0P3evV3VKzKnlOFVGugnWuyaBaU/9+asPlTUw
	 w92yL2GUp5TTMvqNQf2HST1PpmjYI0s/6VszvWW2mY63df4zR3qySLEUqiZMICfjBC0hp
	 GyvKzdYwb/B0Q88SR2ERDw1DhmlRsR8CqIR5Y5s87S4qj3AOTynMj6D2CBhQqOEet/YLL
	 tlyGrEE4FO+mzQptpyKRghxYRCKt68Bh3BG1W+APKsDyqnUjAhez2b1WCCN1vt/ASYEuP
	 +rTwyv7nNpfqdzR1POKZCL8DqaLsSyM3aPmGXAY2U9REFGn/2tZy6wZ65cKa+KG6c/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dRUFuQH8;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81451606A331
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81451606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dRUFuQH8
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so12525975e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795287972; x=1795892772; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FpKHiV2uYxe7Ki0iO3VWKGByi0ydeGzhGSrgX6lNY+s=;
        b=dRUFuQH8w4MMSrEuc/tUiHbAWm2e8J0TZVBrfHQOSMQQc0vMhH6D331bHZwmWI0nW2
         lOwdSLLGhfXzgXbQEBKpcvr4+PI3b7XJh4mhRWqOQcNiR7cWa5aPNcNWAzqLnO4DfizM
         opphh1/ieNCtEuzXfWV6VbBhb4yO6YmMnc8jznq9GO072dx30HONa2zs+cUSQbS8TJxV
         m+4h+3WjdKBDkuVYBJ3KduUxejxMzvESrVOUs2AqVsUZ5dslRzyepHS7zppw82DxZaO1
         rw9OiPKIfdAJwSEUOwttDjkpvJ5P6XfNisG/ZtDNOADkU2kxZdvnT4Ieor0Vy+9lLbUP
         RBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795287972; x=1795892772;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpKHiV2uYxe7Ki0iO3VWKGByi0ydeGzhGSrgX6lNY+s=;
        b=fIndNEUlU0owLPDeGKogYrNuxPj0MNqHwoqtRe/8hfP5trV5Y7HuocxBToHU4sqNYO
         JyT0HtEzUg5lUuDXBuuDK2kxj8K2vMrE/lNhwzm/QYmSiREEkiRokwTtm++5q7aNrtNn
         4wClulvLEWrJO0Xp71PoQ9RBWy0nTqdzmlRjLibO2zCU3Z6Su9cXmDc/WScjkXva1DSv
         Bik2Y+L1p+FD1k2RSJmVc1lsXcQYibU2IbytDiBARdvXhaxHzhnVCoRKKYRfcJTgXnmJ
         NOt8CXNX9ziRIM4nfEzKNT8pmZvBAwUaKJEpdzMNj5yHQPlbeYnk8MFatenftgFV/8sX
         cpGA==
X-Forwarded-Encrypted: i=1; AL+hErHTq+3APxC/gGXVhT/EDJ3pp9aqcTtOOGrlPdWNIVbYrjt7rLgFIWeT8oe+MqgZLZIXdDGVqBX6Y1kZnNg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BgwHHbLqVnAg+cONX9FGbgId5HfVcqB94GoX+L7nWqZJT4Ahg
	oCy8bIpCt7mkVROjAmmyIcCI+JQR5NIAcvNILNTjbE6FCECdNxTltIRj
X-Gm-Gg: AZFdTZeIi4iJi26CU6vzLWNZbgHk+r0mt+tYVfIn16tAhbS7vNnMTNaUDwiKYAbfPMA
	SHXOZKC1pwhDb9GhWhRj3ZJV1JOGFiZtX07YFlBGtbGaW34w20Z3qXkWAM+QPGN5EeuCVg3nqz8
	Y/E7srT6TqcE0MRszyKnT3jbLqHXv9OmZ/gvLzSMYY8qA4F6KcRGCUqNbCCxS+KqI1UmAoVuCVA
	FKwVEyeO0JawYApzQnx1TFxUH8sgyxd0OaOji6ck3myouNfIoy3ngU/rpFJDmdhW2lDQnjRAISC
	nHwx83armayjnouDLUYXuUc0/9bIDyjgnxv5G70vyT11jB2uZdUiyyVamL5wGRcgpOEHcRk4ork
	FGeBnFzvULExTXmMu3+RUcLP4Hpyw1WB3uMgLcuS4YqkHhMK3YvhtcxUU55u7UeDQhyczSYo5xl
	GPSGqnf+uCib/nP9umomXT+JXicp+8qMiqnBQWFK9Pv+LYJeRYMg3DQhlJxuSihcyzEac/9C0Q0
	3mBoESHDX0yS1L/dlC+GLtSd01W5SK4MJFnnfJgcYC5QflhL/dy3KNP+9JiAbeUA6ZbSF3Op1is
	ntLUnMSGfjk25Evvrxb1bCZWxmpvQPkJB5K1bslonO4mRMp7kpEohwUP4zcZCjF8Qxuj0X8LwYF
	G3G1zrYQznKa8IUHkp7VFIlVI/Mkueg==
X-Received: by 2002:a05:600c:46c4:b0:4bb:6a5a:7834 with SMTP id 5b1f17b1804b1-4bb888106damr154232025e9.20.1795287971698;
        Sat, 21 Nov 2026 11:06:11 -0800 (PST)
Received: from [192.168.0.10] (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm148595925e9.4.2026.11.21.11.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:06:11 -0800 (PST)
Message-ID: <6937fed688e4bf1d7cb81b004c179cc4912cf6e2.camel@gmail.com>
Subject: Re: [PATCH 0/6] Add USB support for Exynos7885 and enable USB and
 FG on gta3xllte
From: David Virag <virag.david003@gmail.com>
To: umer.uddin@mentallysanemainliners.org, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam
 <mani@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Szyprowski	
 <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar	 <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Sat, 21 Nov 2026 20:06:10 +0100
In-Reply-To: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
References: 
	<20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-11-19 at 19:49 +0000, Umer Uddin via B4 Relay wrote:
> Hi guys, this patch series adds support for USB on Exynos7885. This
> series
> is based on David Virag's work[1] I had rebased it onto krzk's for-
> next
> tree and tested it on gta3xllte. This series also enables S2MU005 FG
> on gta3xllte, which is also tested.

Hi, thanks for reviving my old patches

I actually have sent the patches before [1], got some reviews, but only
ended up with the clock patches submitted and applied, and never
actually got to submitting these patches with fixes based on the
reviews (which have been sitting on my PC for quite a while).

I think I will submit my fixed up patches (the ones you submitted still
have some problems), and then your gta3xxlte patches can sit on top.

[1]
https://lore.kernel.org/linux-samsung-soc/20240804215458.404085-1-virag.dav=
id003@gmail.com/

>=20
> Please note, I did drop enabling USB on jackpotlte, this is because I
> don't have the device myself to test the changes personally and I
> didn't
> want to risk a regression on jackpotlte.

I can confirm it does still work properly on jackpotlte.

Best regards,
David
