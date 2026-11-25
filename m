Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593050;
	b=Xc6U98eeoQ/XBvs7KkbdhKtgQpgCWikTJ0JqNaSQr7cbwukuA4BPu0a185joAmp/8+2t
	 EcAXlrNnSrVTZpJ7Z5GhIbRQnnILMKFuQbPnyDQx23HTyFtcglLWSg6fGfUE3k3sEEN3d
	 XLTo6jU5ecdEAgdzArESHtz0RTzrTM+/6iQRm3xfaq3WcL4bgGCz/F9E/G5SjVRWfwrGN
	 82H9Ttfbz1tmGQKRiuQcFriwtrXvN9I4P2KzM4rpTaaMZfEPTBE6vzaoskhog2U/uwbw/
	 xMsxMbflsXnwJ3EPBFG7RpNpM7ip7wht6TsiFib8nxfi2eIezGS1lqJ4kK5oaxqeIoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=DXWZe8PdHaNwmG1e0zrjYh/YQYZCr4fIGS30UdSlFbs=;
	b=NQXct4FNDGzZ1q9afAUkxjVCHuI7Iiejkl9jwIVgCWYwA5DpOwLgaOvqI4ncJrH6ZWfv
	 hZytmJ6h729HvzA0U20kXh7Q9kEmMVyKA7AyrNwJwIE/KPQDrKYnSq0pQX0Ei9rm7Szbx
	 W/axvTFnP8w8G3jfPttrEUFlJygX23z3nsT1EBDb9xXrq59kEJiwdLE78veJZ70BtSJG+
	 ZLcvCZg9RjqlDablAzbr8sDO1KETlglGAB/I7ZQFQ1PpXvMTU/E8W9rCLwu2TyKcx7AjW
	 ksq2I0duyvOtrDj+z0ZWeoyXTxiQACeYDvD2boRo/6Nfp8sfFTDDAawdSuUZhOyMXXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oi6oGJu9;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B00606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17B00606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oi6oGJu9
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c14f7768acso4443749e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593048; x=1796197848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DXWZe8PdHaNwmG1e0zrjYh/YQYZCr4fIGS30UdSlFbs=;
        b=Oi6oGJu90Kw9BlEuQHOAy7wrlo6tE6cgHbPzX5o1/gtAto0wXsq4G8NpB8fI2sMw8H
         xicincIzl4W7JLGLhnS3D3VmZpeQuEvIe/yeOTyUSYbOjNsMf9XiV/TPmCRk1Xg9Mgt2
         Q2iDzixxz2ZvvAn+4SU5KsSzAxODWFCccY/q+LdyeP2HPzobm0zvbQhsaDZIv28+gH8r
         7e/2Nf3M31Ps5wtoduKfyil35o8wTQV1xQlmEjuWAwjhNt+lzJRxD2m1HQOF/onaIeac
         OINZ29mNrJB+UNWWAgWHAkbKUF+7TfnlU8Y8Qx7HQfzKhhWHRQmv/aK8ZgOV9O0nmWZh
         qHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593048; x=1796197848;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXWZe8PdHaNwmG1e0zrjYh/YQYZCr4fIGS30UdSlFbs=;
        b=zERHUyaq/FdHXDSNb8dirljQyxmgJuFru9RgYgpOhvDJlqY/zPCNVktLDfila0sTdO
         6iXcW2FI3yz3ECQGyTN/ZuXH2oo7zEITyIWwL5vkWwn00iayW9dxAZulwaJMrFUzipBn
         eieZ+XbA51yocffkyPDzWBtQRusZV75HPxzOlelYE167hKt67DTwIUdBSm/cTGRFoUA4
         j23ISKGuXjQDj0UwvQsc+iENWsTM9HvVM+R54HfMQRWWsnGglH3DbuwlTacFCt8kUI0/
         iM5ckn1YtvpwHzXepXsuyNqowTjT7IbcfwJfR0sFy7cZz4Wv53QQUxErLDR8eb8IFnkM
         MNmA==
X-Forwarded-Encrypted: i=1; AL+hErFS/QYspNEzTAa7FmgLuFDN56NvTEKnrTEecgZpHCbFdc/6rvQW0djhT+kXrWSFS9HuLU9PDQyNT4CmjxA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bUIVirTtgXTPKkWYEP0l7xAIUsEHiLQpxmyKzt9u3SbW73VaL
	5tXHBBxn+OReYVhobM51XEDMSZRS8RHG77BqKFDm8bEx4eZETAyy2iSm
X-Gm-Gg: AZFdTZeUCZwsbVpyeAIUAWPyqJlFgDAW1m3ZpuxAwweOtcHXK75roys35Jb09HjaZBS
	CuascFtBMMXL3HPkHi/lK5pEbdBkYWYYohnwKw2etF3LY5lie4l2dR81WyD+kqrvfWxc8SoW8oj
	bXc8xo59H2lfE4Cn1fSfrXDAP2dM4yabNUMp6LSwIH5eOY/z1BGM4HjsU+4/qZ2GdP3TqVOw5pb
	JEFxIEY7H4kYdgsajAJIiDrkPuzC/6vD7IQ+YQLslCPdpZ3nmv55SroKN75B49hKhWw4fK8A0Jz
	mlWP84y0RUqBpo0aFV8DvTsjm+TT+LmJFE9cohkQIEnqTIQ3U+f0DxbqvwxlxiUMj98N7esYZ1m
	llI29qgPjCfAAc1rQnjC3rn8+9Gllr+wje65mMp/c7mYYni6m/BykPvQXr1q3nHnj5bpH4dSOAL
	pnZx8gQR9ll2NccY0m8ZOEi5230pbL8sNh3eurd30+LvsSgAj5Lt1mXk7pEtvDGxI1O1SKIbsBz
	lcqmyiXpn6FkeGtMKZAO94i9A1dTE5K+PMS5FFTUAX6EzRjrHmjYkNO2Ai9ERIv2tL0Upoe/2hX
	XeGeXiE8ncHCg1nTnJdRHTv60P4wSRcVI+UQzDi5AXcgu3J1jj/VGTdAGnBHAGck7rL824dnRWR
	BhEQKWQIcbb1DlB8m2vSA2eAzDttwtT+OLYiQFw==
X-Received: by 2002:ac2:4c54:0:b0:5c1:4e18:39ca with SMTP id 2adb3069b0e04-5c1bc7cf9a4mr5041284e87.21.1795593048013;
        Tue, 24 Nov 2026 23:50:48 -0800 (PST)
Received: from yantra.. (nekmmqvppk9cj8danf8-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:f131:5b16:1fac:1214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0776edsm4536622e87.73.2026.11.24.23.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:50:47 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: u.kleine-koenig@baylibre.com
Cc: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] iio: pressure: dps310: include what the driver uses
Date: Wed, 25 Nov 2026 09:50:43 +0200
Message-ID: <20261125075043.37440-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <awU0bh5ChdbAsArK@monoceros>
References: <20261123220649.36887-1-zoone.rupert@gmail.com> <20261123220649.36887-8-zoone.rupert@gmail.com> <awU0bh5ChdbAsArK@monoceros>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Nov 24, 2026 at 08:03:59AM +0100, Uwe Kleine-König wrote:
> > +#include <linux/mod_devicetable.h>
>
> don't add <linux/mod_devicetable.h>. I don't know what made you think
> this is needed, but it is not. i2c_device_id is already provided by
> <linux/i2c.h> without the overhead (and useless dependencies).

It was for the of_device_id and acpi_device_id tables. v2 will include
linux/device-id/of.h and linux/device-id/acpi.h for those instead.

Thanks,
Rupesh
