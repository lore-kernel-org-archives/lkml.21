Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066426;
	b=LlLRKjcINpI2i74g1HthXd1Rws6X/MdybtHksM1l0UCZp2Cq9UsNlPkP7Lsg92do31gJ
	 TtUkqvIoCUBQwxjQ6/1PgN0pEn9enzR/fXUi7L+M5++5rGj3wTvevLNLIpJdAKkfpEdKU
	 wlNIGITejKiFO7toctCVk3o/SEytlQcUpcHY2IyhayoK/8glu6G/eRuYpXMm8TCNm0D9x
	 q4UzG29VdN+9Gjpiq+UOlauF8XkeyjU7i6vAt+Z7PFwYWT56FZ2bqc0HDbkTNEBVnC22i
	 E+61DTmIuYpuBbtKP6al5hHxaWZEL+FKi8XAAq0LqdP+9pWYgofK1qP500B7YPZ2VJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iEkbUJSUtCTcASmRLkUsS5yQMfRPCSMeWVpSIWZdwMY=;
	b=gSyC0x6TzYO/CRowuiFLv8VTNQLyzODsR4dsQ0DgO50JOMpPLfd+YzMU790XIqDKuCcQ
	 5YemfoF8Hg60+hmN9J6lQq93kn4Lcw+EUCgC8Q/NkB5l4z0YK5Nxe+EsKv1soGG+JpAww
	 TeUG/QnJIW4g3XMTssghiWrU8q5NXCDfZpCbXiid9T49j0vPDtyGVesIlvRz4JYrjr1k/
	 ZwhOcoOFOpqzkZQypdz8DQnvFat5PbkWaCjSUXMH3IlECanPU360i9AHo71wCipZvmU5T
	 gn7KcfZ9AFSRIVAf+cwfmP3kdsDpasgyXUlYzIQ8l3w3R+D9vxCoYMxfJ3dYNf8E2VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U4bqeSVI;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEEB606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FEEB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U4bqeSVI
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so13148145e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795066425; x=1795671225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iEkbUJSUtCTcASmRLkUsS5yQMfRPCSMeWVpSIWZdwMY=;
        b=U4bqeSVI6sYwgNQl2tqf4TOYgJB5GQ+IeqN1V3Ba33JpsePzwWT4hudHgoBAEL2j93
         VL0R0bKHvt9CmeuQAdHAiwPsQ4ZuED8CG3K2BAVXM4kGi8OBX6Tw8muwpz/8a+1YhaxO
         slei9CJH7RBCLw2mg+j5R27MYcWAaFS6e8moLNZUotN8h3i9Bw22Cct5uiEELE3Pic2J
         nlykA9pkGwIWtQgtBE/M8XDQ4jCBXCAqkHO2gO7VWacc63u/l4rEUXGsB9qa4W1MglNw
         njcujE+wieZnJzXyouXe70ttYcLRsnFOW6EPtB13h3EkgdmA+lPIskaJ0/hD2VE0nDBi
         9zRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795066425; x=1795671225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iEkbUJSUtCTcASmRLkUsS5yQMfRPCSMeWVpSIWZdwMY=;
        b=CnluHyas2vYCiAtm6j4bo/UmniUnveobxA4RnojEQXOPnUtUxIlALTcpwxMqJoXLkj
         6j3Y8cCUgkwGVZ05Kzbzo52+bdodSeNze5s85lwm2ut5JC6tfVAg+zZgsdwZss9fw80N
         wKeujZ09mmIcaykYuXAPwsJ9qV6CuJp0RhVst5A1mS03ymO9LQlHnmypUnB+mSlEpzCf
         DZJpULahTHhvwURBPWnEVOJyc0MoocWRa7OnZvo3aw0kwtxDNKrFC7uk+J4OQQSRprSQ
         BaVAvTYZujBfltLY4qbBYPe6/wjFL6CMo0CFY4SZy7ra23UNh3S21jPghOF2jDDsOSQT
         16aA==
X-Forwarded-Encrypted: i=1; AL+hErGDXHHBWPBnD2wTlao4sBLh4hlvSy8sNTjTHM8rhMNuEoDVQuYtJRfrbHzmIH+zFNUnYjwLDpgclcNhIIY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9En5sdI8CLNuQ6X0aqVH+kQH8AhE42XWTpJK1RcB95by+j7y+
	GFx5ggB7vE2i5/G1/dotsysn1ys8C0RnFXdJDqD2E8jP4ENPWFiZXd4hd8WP/A==
X-Gm-Gg: AYBFou2ow2hXogSzWIzEfsMzwH8OwSHEN0ek6QZzDTrm0NH0ClmUEKscxl80FjdvJHO
	oDtm+fdtdh47GJK5xKdoSbcbMeXy0zYM6iTAHTA6wft3NG0HNur3EAFZvUcV2AwHq3LVgCv8nrw
	9Wk5u2Tozg7yH3xv2I2t30/0J5qVt6ZNDMSk3Lq1o9fXTHL+PP0v4WsMXG1L8eT+Px35Exw/qGU
	R++ESMDJ/G7nLSXZOCI51PKhYeEL+3IiiiuAUGfrXLkhYexz2/r21/M6Ik4nFX5/7bC4ej2XPvZ
	P64Ks6zQAyTCCqCGintVBAYzIFUlUxPUUUwe85DZh/vJMhqezUSJCtTn2ku9srT2wdNLSlI/ZbK
	0O/pKJnh6NoFjDA+HGaMiVUQinvzf0bKxvR81wdH2+Oy1MTta3+jBew9u0aAr6CcmKlW9sQ04pD
	wkX4qNscrAcgCbEsX62y+G/hL87Wb38LgUAR4AaEGWBVxybxtbBuzstMK44GBLONIoONVERKJxD
	rvDdeMIGE1ZlPetgRPfhW1e6KkWuF8tSkl6zULK5C8/1Cik5nML9TeUd0/Vsu7na24hoXgSQ/nl
	JUJIGF0hgoM1l0htFBnywdp9S+MSZgxxFn9h2zRBMG5dwMGtgJN3g/uT
X-Received: by 2002:a05:600c:1c11:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb7d57a536mr104063725e9.0.1795066424540;
        Wed, 18 Nov 2026 21:33:44 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8535741esm16530505e9.11.2026.11.18.21.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:33:44 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Po-Hao Huang <phhuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next] wifi: rtw88: find an associated station without allocating
Date: Thu, 19 Nov 2026 06:33:43 +0100
Message-ID: <20261119053343.2435185-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <50ac2a659ca340dda44d63b02ffafac1@realtek.com>
References: 
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

Ping-Ke Shih <pkshih@realtek.com> wrote:
> > Fixes: 96fbb84de4ff ("wifi: rtw88: handle station mode concurrent scan with AP mode")
>
> I'd remove this Fixes, as my comment in Closes link.

OK. Could you drop it when applying, or should I send a v2 without it?

Mehmet
