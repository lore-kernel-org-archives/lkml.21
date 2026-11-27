Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795819517;
	b=45zWJ5FO1tOKqy4tEBZZh7YU0nqMYNokabaKNxmUEx6wqeW6hqfmj2Xr22AMxgtJAFVf
	 pOve+bHD8Ej+45+d7IwGG+KJLxa6Iz9rOP1W/KMbCgFW4o7uMp/014B+4bSCm2Jv0eG7R
	 xVJnHJnXYAnYu1B1/Dd+LA2GWDtOiUEujs+2Ih1DefvFsFPtdr1hNlrmyRTEk+ugRmIe0
	 utkrGUgdr/KUSUOtn8JhsVG/O1etR82mQzdFIeJNeB3T7Lgt3qIB7uuhkrZZ3sWW0OSza
	 PnXScNlnutI/dcBmlAe1HD4HU9Cbu5L7VQgtcOVSLu+bthCdaef5WovtcQ9r+aItl/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795819517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qF+VgAOV6t6D/gtyLmFatVBNJK0mwOBBZcdi4fFbBG8=;
	b=su9XARJGAmzcmzkg0M7ckotbypFZRc3+IkYnwHa+n9WQtZ4kNqA8wdG+PGexPbSK/FTM
	 JnRAd4EezAZTjD/yDAv87knTVK+uKv8VNtSNT6UVpeILvyvqRxMT7jgQrle5xxIFNuwfw
	 A5nkiVIMySLxdIwBlCFEB/dTMjpwUiUbfKbMl55QLkxmwNGTk4TwpmEMyG128eJV2eEAM
	 3CQAcoulN8RWo72mBksx89c4NchIpuYjS4wqncKApiI6ibiVaW0Py7g8Yn/epu7ZqzMQf
	 voOPwVS39mEvijPwAn4heZqAITIVPUxVJGOtEDS96Ze3LA6OPt2gQpgqrkGq8w7rwbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=epmedjQ9;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C31606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32C31606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=epmedjQ9
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-384d74c9dfdso1414659eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795819516; x=1796424316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qF+VgAOV6t6D/gtyLmFatVBNJK0mwOBBZcdi4fFbBG8=;
        b=epmedjQ9K3r2EmYEVvAa0wcz2MnAHPzd7HLUeyGUzBmWtzThinJ0BKA8pg1G9yf1Mb
         mJ7/dNcrncx365Pz5C1tsqLTyMvuSnyzCKPS0frzwk3UxMUT0Wix88P6wwBTvr+jCwJo
         IkVTnStf/ohwBIWI25zFumZt0Brf/VXEZ802Dyq0eJUgd6vOgTSe9IX+BBcRZGaUiJSt
         o7vnG3crc3wl3j7tvKn70jsXdOHYeQoijDKhHCuLhIMLr6hCQjgZwzdyAvFwOqh9fFPc
         eV00Rxwnjm1yqxOCM5EbWoDA82deu+7AlWGNi+11vBDMQ2bU59ZYWaexbmlGO90ZagCi
         8Q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795819516; x=1796424316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qF+VgAOV6t6D/gtyLmFatVBNJK0mwOBBZcdi4fFbBG8=;
        b=GoY6q08ZZ7FBYQDSTYRf35gjJ71mbOXooE0+iXCi9tnyEihT4N3OJnprXopVgG1dBq
         dByf+l77ou8ru8K1vZIOppoEzY9i5+Wa80njXwihK4T5IXbAoJDjJ2+VNImFxH3rm6An
         K+4A71gEa1dxNtD8iBU5LKvmT4Z8Xjo/vLWk4g19Zvm4wFvh7qPuxH0ABBGjkoxeTwAO
         07Aik2PvGVnQzpDEK+jSS9tPiQBI4emEU+ejM58HmvXCHvYi9LuFf6LFdTnOboset+Ke
         e9nCStBX7SrjxdTd6jKAsq+XmpM8v+vBIch1L9lJupU/dYECYn3dCifBMGaa9weTi6o9
         N9HQ==
X-Forwarded-Encrypted: i=1; AL+hErEEBEMzYoKmbDy4kEUIwC9w3kTzhNbF6N4CEZozOTHyhTiLSViE3V4nLaZq5TV5uRq1Z/GXG1prWavB8EA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+glwOKC3fkcBs7jFBRmGsrfK6j5JTT2vBtfRT/f+S1fsPQg97Z
	cDNRApGXQRWJ9Mlvxy4HtwbI5kAzSaDeuzcHGAYj2shqQDOBTuWTXCbV
X-Gm-Gg: AZFdTZcADnoM4NRkGxRzufgG+e+fRZESTQ3mrCtxTjnAiug6h22tvD6oHzNlK0x6fJI
	b1ap/PTCQ3yMaRyHCZCAJZwcVPwOVoIteE7IISQXYnDkMhwo7DaZ3w5p+a/DVeO5Vf5/2xyvp7a
	nSHyUpus3TP67YMTV6YLzU0zLCg+6nhzQ+/bjYP5symFV69oSmrPSu0SA5jslk5G4cZ0kPRmpgP
	9w9CRBlyfQCcdHAkEyOa80OGsDjgolCLmFSq1632PY+z5V/zeS4w6B3KI2udnXFTPknqfg1HANW
	18lgd7uFcjp9W3M1uofyOpvJFEKg6jGfF6htee/fyi56AAAvNKQayRrVCG4aqxHQBXfzZxL4i4d
	1uUwuLnoYF7ULzEtvN3Nl30oT/kl9JbxyokY9/s8lo/fKmM69H5E3/GdDqNQu7+luua9MqBpOXW
	JrzbK/YHvmthVz8bPE3xtNTnwAhFCYYiJZgUe5LT4a+mKbCPWAL5MK4qNXpsnd7DgoIfUdWUQpe
	rPUoCUnz8uLI6jbzG4pU4tr469FtcmNIU88I2f2BmFtBfu1S/8/CTXGZnyHEmzSt5dkNeBhMxWm
	xdRwzb3rVOaqvjxIn7M8Z5gqYffQqHC4lBnp4lkU7fboz5NWzcpURquFRlhnfxaanQUawBe4Zep
	YwMOKNyfz7rS3Is+pu1vH4RagSa4Z/IOb5vbefmFItswQzwlxfOGzVuG33fupL7XqWEYiEQx6To
	CJKP+NSr4V7Wg=
X-Received: by 2002:a05:7300:16a3:b0:36d:5fbc:8c8d with SMTP id 5a478bee46e88-3856ef457b6mr36896026eec.2.1795819516056;
        Fri, 27 Nov 2026 14:45:16 -0800 (PST)
Received: from esteban.lan ([2001:f71:5160:2b00:ae2a:b9d5:71b7:3bb9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm85785158eec.26.2026.11.27.14.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 14:45:15 -0800 (PST)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: Robert Ijtsma <robertijtsma@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Todor Tomov <todor.too@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: i2c: ov7251: runtime PM, non-continuous MIPI clock, and strobe OE
Date: Sat, 28 Nov 2026 07:45:12 +0900
Message-ID: <20261127224512.1813336-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <CAPcTEm9kJwZw2_i06e_vp+hH_KMNO0nP4x57ZEuhebDJ84aC3g@mail.gmail.com>
References: <20261127-ov7251-strobe-ncont-v1-0-cefa8c6c020b@gmail.com> <20261127211653.1675314-1-antoine.pichot@gmail.com> <CAPcTEm9kJwZw2_i06e_vp+hH_KMNO0nP4x57ZEuhebDJ84aC3g@mail.gmail.com>
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

Hi Robert,

On Fri, Nov 27, 2026 at 04:55:02PM -0500, Robert IJtsma wrote:
> Feel free to add for patches 1-8:
>
> Tested-by: Robert Ijtsma <robertijtsma@gmail.com> # Surface Pro X SQ2 (SC8180X)

Thank you for testing on the Surface Pro X, and for dropping your strobe
patch. I will add your Tested-by to patches 1 to 8 if a v4 of my series
turns out to be needed.

> 2. Use pm_runtime_mark_last_busy() + pm_runtime_put_autosuspend() in
>    ov7251_s_ctrl() and ov7251_s_stream() so the 1000 ms autosuspend
>    window is actually honored across stream restarts (which also lets
>    your patch 7 keep the common registers alive in software standby
>    between streams).

Two small points on this one:

- pm_runtime_put_autosuspend() calls pm_runtime_mark_last_busy() itself
  since commit b3db492e8335 ("PM: runtime: Mark last busy stamp in
  pm_runtime_put_autosuspend()"), so calling both is redundant.
- The Fixes tag's d30bb512da3d predates runtime PM in this driver, which
  came with commit 207f4162f1c9 ("media: i2c: Add pm_runtime support to
  ov7251").

Kind regards,
Antoine
