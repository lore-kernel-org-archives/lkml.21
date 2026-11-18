Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992127;
	b=BBdReX2u32fTUS4FL/J5Orao0xhNC91ZabNqPInG0ST4zw7qPHVA0HRbJ5G9dj9gYgWM
	 6B7ULL8k377dH2D+UBKe34v09FhM52OlAW3TyYIF5cSvRe0eTzqzOy7ZHDpFcfBcXR7iJ
	 7PM/CZ+MUZScyh41c+FCFVABRP5Rq9rgWDcm32FszhRZcApl6CpFAOJ5e+47gvkULDszG
	 gYVVEprenDMduXLgHMtb3rEQfxhudqZJrVB+3Ek3JFFa9hqbF+SSSxdM7VqHT0bC/obRm
	 OvWHVYZYTWYfQngGNc4qP2FLzHr0i/C9WrBtQyJMjwkUbchyOFm5hVQibkMM9et3lsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sdWZuaGLpzVJrXvF7W52XeKg9YlJvmOJLlOUHYiqWro=;
	b=RCUwlsMf8izl8sfuQvsedrczF5iCFznzr/e+uOcmEV5n9JWr31B8iUYTgpKkiVuADKgC
	 LGUlNWrFbD+l+NanGHS/BODsr2xeFtgW/RZBl7q1p0N3pf6No3aeA83YlU9Faq0tuK4ls
	 48JaIMAHdibSZANYsKd3+5k4yIbaTwjb009OZ32uaR5c8Cy+PBrC2VMLh9FAvvxE8H9Sw
	 r80iyA5qgq/PM70bUPw1ZPa4q5NIBKGk4X3jP6eLzWvImNA8lh8X7a3NpG9hdHLh4V9Da
	 AMDSEUZUSNUhbNtVhDUf74XiNYrENtK42k9XvplJUsNVrshUZrzUAXxN/sQxEXoboMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x70HA1Dg;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FA3606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8FA3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x70HA1Dg
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a5506f09f5so403099f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794992125; x=1795596925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sdWZuaGLpzVJrXvF7W52XeKg9YlJvmOJLlOUHYiqWro=;
        b=x70HA1DgtnpmGR1m7sA+GrsO+ZrKeNqJXFLfS1g3OWNz1tQ+qbQJXvy3op40dvOLIy
         J1cFK9SdTJUPl1iYwWPZRnhV4PBV0nhfVxbhhC+MTWr5/3VuuoVHHfvDyt1691vmuNVO
         bfHyZvW95LrkNSsVQpJAVZVKVUxGLi+Clsto8pNI60v30uzgKFWnyFXYiH1Z3L6fnxIR
         TtmhIjbLEPL9h2g8pDEqnLnA8434yegE8Yh2iup0PyC5QiYIJ8QzVZMGGpGhexnOuAHS
         /ktQFGxvibQU7mrX1ZldNHhFlTsj7Q5iX6+fgl5mo+DOcM5w3hfVwuxDA2fxiuaYM8K/
         JsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992125; x=1795596925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdWZuaGLpzVJrXvF7W52XeKg9YlJvmOJLlOUHYiqWro=;
        b=YraRtB7lx0Xus/metocKTyX2OYqnML4jQpsSu2RU20m2OdN/rV+CYml0xisc5dGlIu
         QFOPoCCHLT9xKAoGNNPzhoPfdI3Mw0J/SvG6wLuk5bX+Q8UHyAifsJbCWaFsUcsz92FE
         z4p5fy4qvj5T3vgCPhwyJ/vA9ylO6Zc2ffCiNcnMzo4BKFa4szO3ROCL+Up42IZJpSBt
         JXAru8bd5hk/D4cBdzy7uGFQ3hyA4ijwFn+DcNmzYZoHppt3Y2DXOJUjUZ5gUE2VN+LJ
         92D+++im76vUgCeGxtJQmgzVo/OwwTJR+Mm+HjAPkdPCSn2r/A59GrLGe3p22+al35tZ
         uuEA==
X-Forwarded-Encrypted: i=1; AL+hErFF52KoMsL/UpUIRyuFdiy0u0CJfAVqKBmDGsBu/ylDu4TOZ/0iHWaiZ3o5I7qCbu9JurLl23W/3Ij3qQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LI7Voim4Ahbe+J8ylxiQ+/f1xPSSy6oePXuRjo7jXBg5RLRQb
	yyXbaX8A3mxwFB2gh7SoxkQFprfBqqyPDY5Ka/SHO4vGzs6j/sgzsFtl
X-Gm-Gg: AZFdTZduqvxPP94HcstrC/ZqFKmlzeal69OiRG22BK9w6QCwR1BBN8LjxUy/w2GukfY
	b/7fBtcSKwssAapz5dUAgFvfmXwRHAPgIVowXEbSu5xDcznCMXgqQKkHY+eMz2sCo8oQigrp7RG
	NNtT4NZl6de+ySiI18D8Nxti5SRnFzoawZhDskO0sxoJFmprKHtBBvwVfSazyiQHSNezHSC4zFg
	b/1UU8g9JiS8jKivT5X7j/KLjmiwYQ1A6vuVpm2/qfAGr0DOZYI6ec3IN16EjIZ5AoV9Gd7hPH6
	Kt4Nx4bW9YYPrjCvgbwCyJsa+adQSZwa42GJNWDpQXIXpMZY7MjsMJ/C4fQ2pToKIh4LQ9HdaBi
	ix36sUhzaADS4RSLcOdChn+pCeUhoViNBDQ5x/JE2O9YJKaT96EebZV+J4hSLh8l3uMBm7cYXNl
	CVXkqfRnF/EgO2AU9ztyclZ7s3JsrtwEiZtH9ZpRRsIsP9P973gc8JAg1cpF8h1Ys7DBW7FDA/5
	cVz4wmJDlMKSIHRtob4cFP/CYDivDMLtK5ykyT44mqEYf6nAaDxBP1NyxBoUPorAipFUfr0mnjW
	1/MdJL/1D2fxRDmAzHK3rFL4YhWahjmGMVVL9PVKq+yWDv7PwyAeCNISohLLjgSTLK9qIXrlinC
	YRlG0uJJ1I+t81JHTs8EMp6iWP36TfV+Wu7GKH5IGxdSFj4ecfICiiaTULePlMx2FlUNawk3lsL
	OEEHtk8Pk2FG3V
X-Received: by 2002:a05:6000:46ce:b0:4a4:856b:3503 with SMTP id ffacd0b85a97d-4a639d16f78mr2630507f8f.34.1794992124965;
        Wed, 18 Nov 2026 00:55:24 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c39bsm3571713f8f.17.2026.11.18.00.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:55:24 -0800 (PST)
Date: Wed, 18 Nov 2026 11:55:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Chhabilal Dangal <yogeshdangal66@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager_module: add terminating
 newlines to sysfs output
Message-ID: <av1n9wRjlQ5VaYAi@stanley.mountain>
References: <20261117171015.218177-1-yogeshdangal66@gmail.com>
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
Content-Disposition: inline
In-Reply-To: <20261117171015.218177-1-yogeshdangal66@gmail.com>

On Tue, Nov 17, 2026 at 10:55:15PM +0545, Chhabilal Dangal wrote:
> The sysfs show callbacks for name, vid, pid, intf_id, ip_devices and
> op_devices print their value without a trailing newline, so a read
> from userspace runs into the next line.  Other sysfs attributes end
> with a newline.
> 
> Add the missing newlines.  No functional change beyond the output
> format.

The output format is a functional change and since it's somethng that
user space sees it's an ABI change.  Just ignore the tools which give
wrong advice.  checkpatch is just a perl script.

regards,
dan carpenter

