Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529327;
	b=BTZcdBtHgPAEmabyeriDvl9z+I+5bMchrOX6IU7XIuzUrXjaFxlfW/mO+JalMrqAWQs8
	 +nq59MQMeWX551dcnCmw2lLYuqZEJYRK9B/bS/b5aaWruNekkYNTavcmZQYntZvO8QCXr
	 FzA6ssFD6lDptOPS0q3cUxgkEg8OYBV4sC89cBoZYhNlZjQ00OBCovMcwqLsNSCo0ZZsw
	 pSYOn5HX6X4CCluQIhw6yugshm0f3DrOT4/RGtc+fdEOflwxYEOSm8T29nxEmqgEiy3Na
	 wxV5DdDAtrI+ZzzbKnYT5u5/GcZeqpxw41PmWM0bqhWlcugK1SwF8rX5U6A/e8ozWQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=65FN/qF7JYjHCZlAD0W6fGx3RFd9NIZbin1HOjy26OQ=;
	b=D3C0NlNriXXPXfsaOFJ1W6FSgnaiCyBBQusS8bYhGdK88UDE2WHY9fHnpImOGuCc1emQ
	 3e2u+41CGmtwoVJqZPHU8ivmFijXO3JZeZJcByG/MkploJHKOvnqkNBO8FNJW+C1dx8mW
	 VI5ZCOA8YWYe8tgpPiU9REKPY8E/tKnv9TsMEvcntM+meRMbDmcnKV/3AmcvM1wPIgui8
	 j8AuswWH0ZEN7PUHu4hRQjjmu0CSAhnGJRQ2gHcfJV0sjMO4PlEaVvv+BXmCSy5AVFkAz
	 exnJW97CArFKZz+voC5pfa3rVjhiKGsXx3WxM6WV+zLmFEEwrtPEAPDfsV5XKG+J/ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ytx4DMHc;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80BB606A338
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C80BB606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ytx4DMHc
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c102ad8420so2404586e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529325; x=1796134125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=65FN/qF7JYjHCZlAD0W6fGx3RFd9NIZbin1HOjy26OQ=;
        b=ytx4DMHcZxycAV+eDJx4Bu9FSJRUaL2hVWbnAhOHg/0jmT0HlixKXzWeppFCO3K0NI
         GF/XkitXvfRzydG6JXRZEz2FNUyRcRtcctxElaWn1dKBZMkueGuDNQLqASSPVsfmBMCC
         0XwbgXDIxtqAeFPuUFN+vb4UmhsWVJ4/81jnPLDdPTtoFRIAIZmQLD9JzhFQAa9I/jVE
         8w13LqtwIkDCcTyZTgzsfjILXw/yaSZDzGspYPS0xKZ5sgDtivgBoKVtzYOCDmD43+Ej
         eUJ8RVKQVQD2RCQzt5GpNbHz6Sq4DpJsiuNhtAR/LVaeDQ+WDEpbMBtHtp3Kuz2Evkqc
         Lx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529325; x=1796134125;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=65FN/qF7JYjHCZlAD0W6fGx3RFd9NIZbin1HOjy26OQ=;
        b=qVZ//8i6vB8hdVjhMQ2y8jqeYV7s/3MNqKEUoDSzuCyO7TgbxVG+Z90oNXDDZQZovG
         bt5HRIjzWDsZOBiR3SSOFbHlRI5+lsYvFEygNYjSiqL91nokIv1m9YE/enNA68mbRFwV
         LsmgWGbL2fM26v06c9Pb0t0l72VwaGJ1D6brnRFtcKgsLwwUZsWgWVpAOfOpJg3wqK0F
         hs+kTQyUfSL+NHm5I5MGMkLgqhatcaAfqZznzxP4a94rZlA1i2Krecd//2QAalTXduzS
         vYYpWzN3lkBpgXHQz7ZF7pU+2N7WD4mmvAx2h6N7ke+D08JYX9wBAC93WhBmJlsuNssm
         Pu0Q==
X-Forwarded-Encrypted: i=1; AL+hErH+1SQT9HufwzmoehZ8IVxA5L0LeE4wWiqrtZBoWyZEpVMoLitvlIk/0rM6Bqq9f5FBi5t9kkLVyTFquKM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8psv7wiOf4NfxkQvTgZHCuSQt+rdiIB2EWDl1cF+abiNdh9X6f
	NvbTfVomyFELnVsF3QoAYbNN9WF7+mgL0vBKRcNO1vtDGS24wjoqgIBl
X-Gm-Gg: AZFdTZdyWoQHufLSmKNuORcUkv3ZMBbvlFJc0npfuvPJMpqpNgTYthVWQEPzt7M63j/
	81KHcgIRzZfV0sHlPiGrzMZGy3KdAlwgcyM2IGCO8SeK8PgsQzRX9h2HlmrEMRKgXkDzBZHQ84f
	9rayfxceKk+50sUdIjJJyS95xJs60BlOROEB+HG+tFVzVR1VmhQuyflZ0CKbVAmvfcShXkuE9kf
	6mR1Mzeg88TfNi3cmVrPjcx75eb+jqVy3AQApHau5V19/LTJjoNSt5QHxgEXc3aO5/hIvGmpiCp
	DfdXFau7UNEmeeKtMA8vCcVL2vbShjNqlGT/K+16P8njDQRi2DxhDMg2vtDihEjvhLAIh0JB7jU
	ke9Isv+FYDZBdUx8hiUrjfSK1mxLAogFOPuax6FdxwHdBx45ROrK/K0xZu9WlujOXrhKMRZxxoU
	ZB4h+lRMxuBcTmGyBaLlfu/GysrbQsDYxsBO5NO3gaSwZmIcGuvfNywvXG5Rp/xwLQvjnL3EcIu
	KysVN0EtiG3qD0bJkfV3kkuOPUjpNLqZcdfJmqsYe1NSmzgrbUoFLnhM9AwPD9DFHDhhdhPxgjV
	NIOdIaZii9nWwuHLDj8JLvL8PNgH/bTrzA9yYXxOH8AWbUzA
X-Received: by 2002:a05:6512:3983:b0:5c1:5704:e088 with SMTP id 2adb3069b0e04-5c1bc80e60dmr4523995e87.47.1795529324771;
        Tue, 24 Nov 2026 06:08:44 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0171d7sm3750789e87.30.2026.11.24.06.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:08:44 -0800 (PST)
Date: Tue, 24 Nov 2026 22:08:34 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Adrian Ambrozewicz <aambrozewicz@nvidia.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/8] gpiolib: fix chip removal with lines still
 requested from user space
Message-ID: <20261124140834.GC48187@rigel>
References: <20261124-gpiolib-chip-removal-v8-0-aambrozewicz@nvidia.com>
 <awVfc9xLPXbkAov-@ashevche-desk.local>
 <7mppll7rqj6425pqxktqcve44n6mxwc5rot3nk4njf762csaqf@vbqqnxu5mar3>
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
In-Reply-To: <7mppll7rqj6425pqxktqcve44n6mxwc5rot3nk4njf762csaqf@vbqqnxu5mar3>

On Tue, Nov 24, 2026 at 03:02:17PM +0100, Bartosz Golaszewski wrote:
> On Tue, Nov 24, 2026 at 11:57:07AM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 24, 2026 at 11:20:31AM +0200, Adrian Ambrozewicz wrote:
> > > Removing a GPIO chip while user space holds a line request, as when a
> > > hot-pluggable GPIO controller goes away, leaks the line labels (patch 2)
> > > and IRQ names (patch 5), frees IRQs twice (patches 3, 7 and 8) and lets
> > > a blocked read() stall the removal (patch 4). Patch 1 makes
> > > gpiodev_release() wait for pending label frees; without it,
> > > cleanup_srcu_struct() can warn, more often with patch 2.
> > > 
> > > Patch 7 also affects in-kernel users: their remaining IRQs are freed
> > > after the chip pointer is cleared, when gpiod_*() calls fail. Patch 6
> > > drops edge events whose line read fails instead of reporting an edge.
> > > 
> > > User-visible change: a read() blocked when the chip is removed returns
> > > the queued events, then fails with -ENODEV.
> > > 
> > > For stable: patch 2 needs 1, 5 needs 3, 7 needs 3, 5 and 6, and 8
> > > needs 7; patches 3, 5 and 7 fix a 6.13 commit also in 6.12.y, patch 8 a
> > > 6.19 commit; patch 4 applies to 6.12.y.
> > > 
> > > Tested under QEMU (x86_64, arm64) with gpio-sim, a shared gpio-sim line
> > > and a test chip on the hierarchical irqchip, with lockdep, kmemleak and
> > > KASAN.
> > > 
> > > Prepared with Cursor and Claude Code, using Claude, which helped analyse
> > > the bugs, write the reproducers and draft the patches; I reviewed and
> > > tested every change.
> > 
> > Bart, this series seems contain two parts, core and cdev fixes, the first
> > (core) fixes are being reproduced and tested in our lab and they are pretty
> > much ready to go. Can we at least have them (patches 1 & 2) pulled rather
> > sooner, please?
> >
> 
> Do you have any comments on patches 7/8 or 8/8? This version has no
> sashiko comments and only the two final patches are not reviewed. If you
> can leave an R-b under them, I'm fine taking all of them now.
> 

This version addresses the last of my comments, so I'm happy to see the
whole series applied.

Cheers,
Kent.
