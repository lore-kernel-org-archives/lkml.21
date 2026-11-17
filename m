Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938207;
	b=kf0NSoC577vqGXnk7ZBeqZ4/Zx1Mw2e07P9BO4kqrKg9cDTyB5sZQEl2FB7has0B+kfD
	 YMCcE9KhzrM0rbdS4Osw4Alu/c1UvhHnndpsV/XbYLofMsrGCfx7MwcMo7NEKgZTTA/94
	 huR31ooUrRjZKsF4jGr67oworV3ZU/LNddne6IyfU9bBiJiPEbK041fHFu9czAC5qSN4W
	 e+kOEEdoylBoirmxU8YVllvzaCazl6+yJ9pVn9HWQf0+ZXeGL4PlAXrmv8D4eqcLQirCB
	 hqxgr0bgfTdn3GyHCWoXsPZyES8IYsflM+Dek8r04/GMKoI5eOChiYIEkZqinUFrR4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pD8vNDgtYkqY5yb1vjvicd9DBKj0i2pqXmdMkGJ2JPs=;
	b=H6o+xHU6blnFdoJ42A7kYaiG0YUoJRakOTXbMeAAh0YlPZIbFuF9aZWGoeBPXpyzpCHj
	 XVcFGj8UP6FkZEIhweXHfpantKnPd+J49ST10z3j0cA4/5Hv6PMeibiukacZHfoykqOiS
	 pIYOPkyj871od0x/i5T9c6t7QcibdSpDNrq+9AIRZTTm6sQY9HHDcqouFkn6JfQTauafY
	 SAyAq1kk84FC0+P4Ad7JjDQ2YIiC1uKq3q46UWvWfAyZ7AeFzRdYST8ilK7XKNompXlZB
	 mXoEOXoynbgCbi1u6qPwBIuzaqLpyOWjoNe8PC6TPahFfyz/8dv1Om9gIAyBfoq/RSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iU/sirU+";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73456606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73456606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iU/sirU+
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so1056105e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794938206; x=1795543006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pD8vNDgtYkqY5yb1vjvicd9DBKj0i2pqXmdMkGJ2JPs=;
        b=iU/sirU+F0zi2E3I7tubksI3ZnG+s1ky371W+kT4xc5sPQdCBLussGOH1HjbBjS8ng
         pDIHHQktP4m4tUiIiarGkzoaBU50QCthCYedutBM4Fajmf61YCNwkIY5LMM3Ds+WiCwJ
         wT36xAr+PLyUmdEIs33GRNFcnK+CXGyNK9QqRUUZm76pmunhUS/wGSgPl+IjxKqi4UWj
         c10sGmJo1V7Jhagn7LgBH/j3hxAiEybMJt4MwUKxFpoLIH9dWms5ZlQKilNWcg7Md7fX
         G2BRKOVQo0OOHMVX1FWrtGtngNgqfSFdtCw+fHv3g7DvLF1HfWM+0Xp/i9l+iVZBiz/f
         bHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938206; x=1795543006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pD8vNDgtYkqY5yb1vjvicd9DBKj0i2pqXmdMkGJ2JPs=;
        b=rH5x3a7An9YlgBi2jBaqeXEFHhiLkS1v+LvMPx5kmzE+JF6GtMgtoGiVvs00WIet+x
         jPf+UyqoQcjiK/jE5c8YfnA/+lGj/bZO7j4Ir7MncR+ZBYd09XWPDil5+aRx2M0dqXuW
         nrCvCB5+m/vlGw65wFD/eLA3uGKxXRjo2Bxte3cClii8ok5aGxv12sLlLCHASiwrnwRc
         2+HOe5kPMdf+gXjx2f17gQKjqvz27DxlcOVRucXXiKiXXElO2IYWfKAbtFFv50TZcXa/
         GsfpTdC7m5uqSl/WTCSBxYMT/46QW/OPKFhwwewRl5zQniOOm2GKCg7egks7SaWqvSNj
         bj8g==
X-Forwarded-Encrypted: i=1; AL+hErG7hPcPfcDiSkCdjkJrmEjtbgk0qyUc37wj/ZOtsAj+G3o3fekm1M7xtYwDr9MYy1bOcWHDZ6cXZvjDjRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j2TmFMX3QFklExzq9qEF2Od+jR7oH4ZRY1Bdnulr7gXUOx9uv
	HiJDBO8NQ6wo8YBTfb6r6101Z1s6gsk3slEMOzEQhe9vrUKIkLXN3IfQ
X-Gm-Gg: AYBFou0/kwzrlwcWufMn6VuCPB0Tb+Hgox7GUHaQGZi7ydcy+gMO5mw4Exmr3/hZ+W4
	TeXhGhJgHh8vYRRT2Rqt0qat256OTqJ9F4tE4Tf3TnjgXnVGa91flNt0YJb10wRbyctkmjZA9wp
	6cyIMREQGo+71rYzM7s37yM95qf5X5+ZEQCDhJOFnld+wHwKPqUrz+CCX3Sr2wtpHaZWSSBlw8r
	3sQr6lVDtGQijmGm8ULlImbByeXOyib3u7fA+A9H49TxObWmQIFjJarZ/uzdyoD/x7/B6cRSZtG
	Ef0HiAJiKlw7z2uWkhykdkpcxz5scr/bF/20IlkgZg82XrORftczA2Cv9gyBdW0DXLWZ9jGRpTP
	7I3wvuRvOdGDKVj5XWoTS+lO+cxOZ3pV3bd3lnHng3DXhijhUzkYHMM9K4MBieoPH/UhedqtDop
	Dp+TM4j00SyR9kh7r0gxPwjQSEo849KAw7WzLkPJEe0fLZL8wYtp4M0ZkriYr9C3r2oIgVrqboi
	+FdMNSlTUjBknP1bfwfIw+AyBDzR8cL4t8a58bsM254OQBWoHfpYU4HPIH5eg6iMld6fbXy/z/J
	09FeRsMDa9DYeqGtm+IbWKQ/0NCNAMXxjGVmdS6divonfA==
X-Received: by 2002:a05:600c:8b57:b0:4bb:6118:4f57 with SMTP id 5b1f17b1804b1-4bb6118533emr268214555e9.18.1794938205744;
        Tue, 17 Nov 2026 09:56:45 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:11a1:dc8c:1ed6:51c5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b74d6sm1292895e9.9.2026.11.17.09.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:56:45 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: andriy.shevchenko@intel.com
Cc: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: atomisp: Don't enumerate frame sizes the preview pipe can't output
Date: Tue, 17 Nov 2026 17:56:35 +0000
Message-ID: <20261117175635.11790-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <avwtA3b3XMkGXPfZ@ashevche-desk.local>
References: <20261116175750.21905-1-volodymyrchapman@gmail.com> <20261116175750.21905-2-volodymyrchapman@gmail.com> <avwtA3b3XMkGXPfZ@ashevche-desk.local>
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

Hi Andy,

On Tue, Nov 17, 2026 at 12:31:31PM +0200, Andy Shevchenko wrote:
> So, what makes us stop implementing the crop support there?

atomisp only uses its crop path for sensors whose driver supports the
NATIVE_SIZE, CROP_DEFAULT and CROP selection targets
(atomisp_init_sensor()). The IMX175 driver does not yet: in his review of
it, Dave Stevenson suggested that binning, and possibly cropping, should
wait for the Common Raw Sensor Model. Once the sensor supports cropping,
atomisp takes the atomisp_enum_framesizes_crop() path and this code
is not used for it.

Even with crop support, preview mode would list nothing larger than
1920x1440: that is the largest entry in the frame_sizes table of
atomisp_enum_framesizes_crop_inner(). This patch applies the same limit
to the non-crop path.

> No need to repeat these two paragraphs, make sure they are in the cover letter.

Of course. I will keep them in the cover letter only in v2.

> TBH, this feels like a hack, but I'm not v4l2/media reviewer/maintainer,
> so I don't know if this approach is legit.

The intent is to make VIDIOC_ENUM_FRAMESIZES match what
atomisp_try_fmt() returns, which already clamps the size to 1920x1440 in
preview mode. Without this patch the IMX175 lists 3264x2448 and
1624x1216, and TRY_FMT for 3264x2448 returns 1624x1216. With it, the
IMX175 lists only 1624x1216 and the OV2722 lists 1916x1076, 1616x1076
and 1436x1076. Every listed size is returned unchanged by TRY_FMT, and
for the other sizes I tried (640x480 up to 3264x2448) TRY_FMT
returned only listed sizes.

Hans, Sakari, would you prefer this, or a different approach for the
non-crop path?

Thanks,
Volodymyr
