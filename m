Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416292;
	b=xg4r5P9YoAnURZSqCuuCWd+5Twc0pODyVyfoHdkeAMDLoppFHuums8tuL4gQwadcyyor
	 kase4MD4fmH6oKBPqVkrum4HkDcqZxtDvFo0ZCAvFCYx2ihR4kd7mSqDA5svLzIIciOr1
	 ebd4kticYN5ILdmx8r5VfBxYWCJ0GD502Qieq2DDfewMwwYIw8/JueGJVLiI/Rqrgsql2
	 EAq3ke8fqxlS1CxRj7B61AeYIP440A3tmzKjb4wwh6/GE+Z35Uyz6EDKwsTtWiHfTKVgb
	 Ic8VnsEBvS/gRQNOrLKu5YMWXStzfM6rqXzGyISKhUJZ9YhRs+Yy1aipAMQBD5+xogg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=2SjRi5DA6EPs4N724PY/ZYwEORsvpZ9R0IBDl0iZ0NE=;
	b=toJeoSzyITSZXeeeEwidzfgzP53YkCwjqIPLRB+ZpJLsEFxlzeYw0fJk5GWmZl1Z4QVA
	 wOFzJNGUk8Fv7ovHKw+S4AqKHhrnZRXDDCdW2DuwrilPJngyXaMfDKY7irYml+FRIHwlI
	 5jyJEwHtZlmwYnef29ZJ/ApFZRZ+wKNL6O0MO/bEb+PqLeWt5EYm3QI5h3+1DWhAFZ5AL
	 k5tRLYNeFgLSSJV7OdSIad8yJIt34sHZxZXS7pwdPL/M332t2NPZxwFaWTlXA1DqkFYvE
	 ubmIOxRuG7YzntqeRopfQoZNHgAjaHIQgPQCFdUBaZm9Z9KkEywQILqee694XqMV1vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j4o2xYsG;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C6B606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1C6B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j4o2xYsG
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f0621eec70so15229065ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795416291; x=1796021091; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2SjRi5DA6EPs4N724PY/ZYwEORsvpZ9R0IBDl0iZ0NE=;
        b=j4o2xYsGh3WF/JUZQQOuj/v67/PWJ7hBi2FsjvLLsZtbm29aHoYdH0NO+RcHpADiGL
         2dvXRLuk5oNLY5e3J5y6E54Umcm0YyNsO+tBVTYSYc8Xa+Jk/uS8g20d6XOSmM85q7Mv
         OOvTfnX7Egw7qPncqmwIy1jdpRDl0/Prkna0hyc/JYVrKiNwRkwjCwV3C6XJAL+vV7E7
         rmefry0U/PqpRQnG2xXtfNfXYUkv1b7CidqpNSjO077yuGBXMab68jiF244vxAbttmAO
         b74JQzwV1UZI8H2QsIDxvyqmNgfBnWyrqPslKLrBAFY8wGlBVH7Oxyb80w9pFsfby4Ex
         UGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416291; x=1796021091;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2SjRi5DA6EPs4N724PY/ZYwEORsvpZ9R0IBDl0iZ0NE=;
        b=y3vnomVCuq90xG4RqgVB1iChtzdPUtvYmdRZY5LvhS8UOgd1mdOV28DE3DqeuUJwzw
         ZZ6dERiz8HA0fyWq2c5YDWdkTJWylIoXXEB7XEtp+5CE0Ojbzile+E4qxTq5yvdTs1FS
         DC8erS7cm42wyQnofZDYAIqptt9QPldH9WQpY/+DJdWDTSBWnhjJ6HVmuYb8Jxj6UAKV
         yCris+EdXycJ3q58zhZIxsnhAg8hons+WQqAHuzt4t4mHZaX/CTw9/XUHwg9vKXRja3c
         tAudTA1Au0KAyI3fU0t/aoJQGz3PaT0/rcmeFy8bAdoXVZCDTBAaNxJGZmI68qdhWGkb
         1HTQ==
X-Forwarded-Encrypted: i=1; AL+hErHxSmgcYUFGrUzsne9xJ8VEqY+JKjVwqstNBhoVh42OdjcUakJ2Gj8ANFfzb0Kq6X4bKAFhFN1c+fH9Wrw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iYkyaRkE5Oan2YF07lIlRVep4SXWiH50qr0o74ZtNL9Dbj0qD
	0ZALP+2GDGWC0bGOLRpKlh9Q9axcCbKWT/O6sw6yxHJisNi8ll7sKMDz
X-Gm-Gg: AZFdTZf8UuUzHFc1TGxdYZHNOovtrvjzO5pVSM+7j/qev8T42ZYH5XCj+EE5ISFq1S+
	mYn1MXwUIi6mNCClt1WcaGljYe/hSyhP6Hm+LkP3zcz8u9TvOQ38Kk8XhOYt6nx7pvoFmlniuj9
	gV1KZVJLR50lF5e1um7C7eEUQsLlnFxUAc7XGbaKtjB0rRpHQ3mvmv6otTzJDeUaBG7pbKQO+Gu
	4Y6Qmy319iDIfmebPSKKTvealqYU3A3Also9F5bG8hVHi1i7LsYDvE73bqmj1DQE7fsXvt8bjpr
	egRogMuzXVlkcWghaWTZRLTb/iyuKDBCABmQBuUZuRy55z0CznBK9ikSBrxh5iwm2gQtQkfmIR0
	77ICaXlFrvDk8CK9lfQMYy6vHyDQ/rkPkG2fVYtf0ZBZhk2WAtwtxmcq8LJrI/5dzpj74/ITxmq
	v8EgBGHEUmkFoNpY9r7Zk0LXsPWpeavEzX4EhUT37ldCgBxXK0jBTH/Xg1REIKlqfED4csHXZRj
	xV177pQ4FJEoyMwlGkKq4R139bX+fBlPtUrp91tIyWs/NUgyYmgnuJ4Zy5F4Xc6LgEATxE7QXhl
	M8uDpxsgks7WAmXofrjF6JE4N647G7uv0sjsuPa3JRocAHLQlGGzPkRfyPwcWuLa808tBw==
X-Received: by 2002:a17:90b:224e:b0:3b4:f92:ade8 with SMTP id 98e67ed59e1d1-3b41c7e1174mr10446536a91.7.1795416291007;
        Sun, 22 Nov 2026 22:44:51 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm17835023a91.5.2026.11.22.22.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:44:50 -0800 (PST)
Date: Sun, 22 Nov 2026 22:44:49 -0800
Message-ID: <dea00f90c205f8359baca729d8b0f31a@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Rich Felker <dalias@libc.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-sh@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] sh: mach-rsk: rsk7203: switch to using static device property, drop legacy gpio API
In-Reply-To: <arzKNhmoL6yiGrzH@ashevche-desk.local>
References: <20260929-rsk7203-properties-v3-0-02f84aeb8e47@gmail.com> <3a51385d-9649-4bd7-87b3-0caf9e462b2e@app.fastmail.com> <arzKNhmoL6yiGrzH@ashevche-desk.local>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Adrian,

On Wed, Sep 30, 2026 at 11:37:10AM +0300, Andy Shevchenko wrote:
> On Wed, Sep 30, 2026 at 09:23:21AM +0200, Arnd Bergmann wrote:
...
> > The patches look good to me. I have build-tested this with the snippet
> > below and my series from
> > https://lore.kernel.org/all/20260907090956.2825703-2-arnd@kernel.org/
> > to check that no use of the legacy interfaces remain.
> > You can probably fold my one-liner into your last patch.
...
> > I would guess even with access to hardware testing is going to be
> > challenging, I noticed that the defconfig kernel does not fit on the
> > 4MB flash any more (even without rootfs), and the USB support was
> > never added for rsk7203, only for 7264/7269.
>
> ...which induces a practical question, shouldn't we just drop the whole thing
> for good?

Gentle ping on this series. Will you be applying these patches (possibly
with Arnd's Kconfig tweak folded in), or would you prefer patches
removing rsk7203 support altogether since it is not working anyway?

Thanks.

-- 
Dmitry
