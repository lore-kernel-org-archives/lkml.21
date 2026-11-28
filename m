Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853925;
	b=E5Mw21lz3KBs2qVe76Qbh23z5BFpuDZya6kRHCAjLX+pr+5t4MO86BI6BTqPsxy3s9Wl
	 1pOw27pANJnZywHDJfsTsFgf7Gkp0KFhgq8u95SDppjVCm/8xeFQ3lJ9CJ7QmdO0uMLyw
	 wvK9RpP9xDz4/Ab2aBEcXJalK/8RnGl8rITBGVTbeaflrBD0y3R0qAJ+zC2BkLeTMQjFp
	 dUXCC2grQdkNlYIqPVS4vKa5CAp8AdGaOpcHZArqgyxLxz2MyCZFx2Fsf1eQyLpVT+Y46
	 cLOnOC0P0KsERht1LXt14Hbb7jZ/6b1RQUXji8opWEy2p5vryDbri4gACaYpiBZHJ6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=RVtSPIn38Q6EIHykYyxSqD1sCWEJoBqmr7bLE8/ZcfJlvVtz8f5q9ctFDUU6MDgWvnIp
	 zBliXUR4xfh6fGj6K6p2Z4VSkh9nMovv81A+n86EFoqZBTlPRO1FeYKP6LB1WpiN38c6n
	 C01yKfxBMStumfuFD2H2RFsBms2ilM4AqiP1cZVSudchHB7kl1suko0I7vh4P7PpVYiDS
	 hMqvrKQMhy4cSUAJLdxk857t0R8md+hQNlwpfCAfC6sV2f/7bQShNPqEUzQ8rFu/XwG6w
	 +/C3NO0yOuNrevgX3B8CW0BTkfoH6FrmYSmebJL3sW7Qm0+WuttwxfRx7gcr0n8epTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nF+rRutO;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8BD606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A8BD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nF+rRutO
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1ae58d17cd9so10127609c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795853924; x=1796458724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=nF+rRutOj8aYEDNdLcB3FhFMtcFXf0c0a4XIw5yxmuSr9Fd/2ERmLYbjETWE7FzRgs
         p/fhHM+Tr+ioXpQXL80S/v3UGsy2qJXPi/do8Vy5ZoFa92dawBO2kK+unxxcf9ws2PyC
         jDpvu0wchBC1LxQ3fYb0sQj2+JpJJUZZMV8wNKUKSLhpWFEL2oOxww7atfQPRtVyF0hZ
         k0kWmAWBSxNL9GqNoeZVHhyuwfKeHa5NEgwrGIHo69gBwspJRQxW72cIqJmOzbm4uaa8
         7aKePbAg5ec0DZ00B/y5LjauB16lKygnSMfVCTqZTsSB8qs4aVb51vim8gNBuZ8XUMYt
         Pg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853924; x=1796458724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=o/NUIF7oZzr+rTSS7i62zgQIlJl5XO1eyWxYW5K36aLBLaexnFs3qTe39m+UWkrGFN
         BbSVMQOHi+/9PP79R/m+o82aZgQ7i7REF8eBUBLQMmYtN3wmBaDnAL74HiNVOWSzsZ8H
         7WYiBJP7YxiJtFCS4p+sr06+lYnestyZChIV84e7JsIevokkCXYALwgFL68+6sttzwZu
         1eTdm2euYHQYXo1nY7x1NE8AHuuqcS2rPQPN9mtg2HnCP5wvZs/PopaE0jqXyLV+0cSd
         9i6+m4VkgqFa9pFZlApyHWS8aYY2mpr3HITbZ6cRMNmuyDsciUqI1acM45W6sfFYnoAI
         u/8Q==
X-Forwarded-Encrypted: i=1; AL+hErE7cWw5V+Lm/smpM1YgyorTHyfyg7E0TJs+OxDBeHovuY2vjkVxCtqqxK6vzevXihpRMM+QW6co4lKvcWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DOapY97wcoOEAfp3j55xHuCedNA2aVhg7bGhd0LaT+WNaf0zL
	rWgfS71+6DpUdBmrdIjKH1cEZUs6wAzo1lRfDE2jN3eioTzvNaxaE/Tw
X-Gm-Gg: AZFdTZeuXSeZFcAxy/Ng0GUcDMNJvQsyt+mKKvCCBvq5/CWsjFdIw3ijgb0WxpU4EMJ
	yzovIxJ7LmFXTTtdmbpq2eKjxk7e+/AkOwK6WYI2M7Q85pQFcH2FcVzO2wDecaGbH7t9LaHbGsT
	oOJNq053xvew2gCv57kOPkj8IaNrbUOvLpmsI3UXNPM+wK4tqX+sHMnavauGf3tdawCpIkqafl2
	inyDqn3GVhoTjpUhxa9V/8/2TH6YArqXCZpZeXgyzRwscBKjBUoI9LcesM8LKRcdaD4XuhOZEeL
	KaM4wrvnJwiN3rnkNHjnfdzdnd2mRp19oXFRrnYrT/pzN1h7W/fleHRc25tFAcg3BQ2tVngz6EX
	QOy/pU4tnQRMM7xk/86/Nsl6svxMsvzWzAMPoXxCN+tcB0YYZRdHeEz4lTE9ucZqRy85qHEPsp2
	lC+asHYCVPo556tCC5V+EYNmYSfOuqB801izii4bXKNR9YqqhNy7Cl/jECXS5M/HjM+X66BR4pP
	qCmJVdHqUowOBoGKYxMO4Mr9JL3enK9VoZBxEtWKQvxpVlbDTKx4lsFM0GF3Gk0JLkIWAFB5/T0
	bNT+gAlY8AKfEvDyKMM3ju6R8yctr0XYBdswmTiamzWlp8wYdvsG2eiPJpqyv5lTnw4n6RXrVw=
	=
X-Received: by 2002:a05:7022:6985:b0:1af:16c4:d06b with SMTP id a92af1059eb24-1b55686d5c1mr33965980c88.10.1795853924289;
        Sat, 28 Nov 2026 00:18:44 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm55344948c88.4.2026.11.28.00.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:18:43 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	nicolas.ferre@microchip.com,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] ALSA: atmel: ac97c: fix reset GPIO error handling
Date: Sat, 28 Nov 2026 08:18:17 +0000
Message-ID: <20261128081817.3132-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <878q2emazw.wl-tiwai@suse.de>
References: <878q2emazw.wl-tiwai@suse.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
