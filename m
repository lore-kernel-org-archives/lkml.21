Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529104;
	b=PZcDMpcRl0MDICOcpsmGxo5tJPstxOxQbTef8b70cBHLv70GmWBWBQgOPdwON7UALfLx
	 DJHmYW2bnb6+TIFJyFenYygLf7/ZwcmG3LXHZKZL+5gRJau6Hur8L//NLDSYsT0eHR4Pg
	 fYPdEMkunf00kMCbcQ747BcbrnESj99LuZYh7/6BiFRaSZB6qldsfPPv6XNjvloyoj70D
	 DnYfkYb4Pixti6WugDXJtZn4HhV0Fc2uyrDXHEviVy24AU9LMojE5j52iWntU7rLVcFl+
	 mAYSf6IBe5yX6At1O2TF8zo38FBTYe5+ghMXRPFeVFvICu0EtABECymestMTtFFQG6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qRxeIQVtFm0RG+YlFLd95lVJGB8ZwXlO3/rFlUGzh8s=;
	b=FgQFzKXHEatlTlmCYE3RRshaCR3uBIgg/loZICLVlDjsBTdElFBbRXgDUxyrbF6ZPkFE
	 +DL+RqQMkSL6gcqheYTPNR79a9AUYOTo/dKtGnw8XTVMb827ub2WJlsEIo8xnOF58ppZh
	 bQNOfwizAG3+W4LhM8L8bazOoE0zdSMO/NnbAb/YzZ3A0VqNQdQhFCmHOAqgOlgvwzZlW
	 fvxq0ZMhgz8fNZNKCtJKJZDP/DuDrFhbHn9qJZE3gSq0ASmQc1LZZr+6L0yUXGDdLmwc5
	 7aNMmuQtCkChyoM2SIykhjJxLFmXp9UwTxBhHSB1ZkqQSSVpedAPk/CF3f72k+35Z7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bR+JMWeh;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7744260784A1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7744260784A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bR+JMWeh
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cddc597d062so2691372a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529104; x=1796133904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qRxeIQVtFm0RG+YlFLd95lVJGB8ZwXlO3/rFlUGzh8s=;
        b=bR+JMWehXBgbqMLi3u84uQem+5jCS5iotKKbd3Wxb5MsH2wa8wEzAKNE1e7xM2nBBd
         jquKKBrCNUJbeljTCMi+KOyIJDCZjUEehUY7ZchGMU99GQLtUxnOtSmquyRWtOLj8ko6
         FTWyXSamVK0ufrEu0gN9QmAM2EsyaSQ3iOvFmr+nk5/89V0L7DLjzkml4hf+Q8QwmBY+
         uCsh4REXWU2ZYu8S+bFimhZ9WUSS6gzxhUyZAv6upKZ9RGj/+fCS77gjrlIr/HMacxHY
         eM0LnkUCEhsSkXm25xPTlsB/qDQvir7gO6PO6Hz9IOzp6e84qtnBhgcI8smO3HrmcKkR
         HybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529104; x=1796133904;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRxeIQVtFm0RG+YlFLd95lVJGB8ZwXlO3/rFlUGzh8s=;
        b=AAfobNHzmJleQv0WDHmiM989mlI2GtyQp3eIMYzuFxwab1TQQo9VkYF+FG3m103Tgc
         3nhXMUFPQJXTerKGv19PymNtGP5fJ42znlewPhtPMPCJGFa6PhzTE62AHh9o5q9rCxxA
         kfssqdFqdwFvd59sv5iJEVNc8PXGioN/QQCuvi+rT3LJmGM4WebM5PDlWO0zPmdXxMms
         EhkFukc29BMPAShPo+5yFVs084wTwReSz1LmorUvvMwNcSwCp0h3shtdj/rYAt0yAzfP
         gglixCSjkb9byTDOdVSEpYyV+iqdihMtQGs9v5dgHeoBQIe/XcPa4ETlZL8XkFNUx4lV
         63eg==
X-Forwarded-Encrypted: i=1; AL+hErEAFKxTo1DGAtbF/3ir+BS2my6H33PHVFxEb/GjbE6BTSiBCyYnPHfUzPwClGhIAllM90dADdCfRpxdTG0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qhLyOzB7s9u8tdoBe0QMRIWgdTT79S57S/o5JXqogxdOQsy6Z
	DFrWIL/jAfPhNZ6xLKkv/SyrkdZGOUZ2ZD/3Tog+Dgj3PWI7dGtOj/Ue
X-Gm-Gg: AZFdTZegn42P6beNKzGkkfW8E/gwNeX1RyNxe+PM9MVPEIi5Q/OhZRuj0h8zxa653DD
	iGD1Vg0xNp8xqrKvQiwuRGP7t1VH7LTCqTLIZcppzKXQ6LSJq07V1kSbTm/N89XQZLejhEcPWdB
	y1WVcwx2SzDTWEisFT2Q24mFzuEHFyGYNJuiH1BJi16EEOPsT+NZNJoo6ljPCV6wOAgUP1xpl0i
	oZNGZj48PXyeV64G1nc4cC7JNsSg40QqJkRhw3sluWuvS3ttDcBcuLO8BFTr5jX7sh7+8LzoKvE
	TRMSw6CEKDevV5szAz5NkdiXm2ikwwz8kIIdWZWga8kWdPtv3ltixA8B5nKR3IRgr1QOdLp6hdT
	di5eV4iYFGaRWN5ps89KyWo7JFuYapX7E6UwLHxs7Puisn5GK5Wn0gYBbhVJ1CwgAdEgwC/Uwe+
	tXcHW71wxGmsXVrV7ypF0FHHreeJLGh8Yz7ZsOHdcfUN0hUNtAX7UAhculxggP/uYOtWuiTi3/d
	qieh48R81yXGmelWwLvSdFz8nWYAalgRqMQcCkn+rrk0xy7SLPLk4uyWBfw0FYb7RxinF9Ntsjb
	Cc7/S9em1ivfdliziD+MLvWDsjN1nmhIeU4PAXQKetZD3T2n
X-Received: by 2002:a05:6a21:778b:b0:3eb:8ae3:e1a8 with SMTP id adf61e73a8af0-4014ee5082dmr13456271637.72.1795529103728;
        Tue, 24 Nov 2026 06:05:03 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bff6sm7287946b3a.3.2026.11.24.06.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:05:03 -0800 (PST)
Date: Tue, 24 Nov 2026 22:04:55 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v8 7/8] gpiolib: let the character device free its IRQs
 first on chip removal
Message-ID: <20261124140455.GA48187@rigel>
References: <20261124-gpiolib-chip-removal-v8-0-aambrozewicz@nvidia.com>
 <20261124-gpiolib-chip-removal-v8-7-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261124-gpiolib-chip-removal-v8-7-aambrozewicz@nvidia.com>

On Tue, Nov 24, 2026 at 11:20:38AM +0200, Adrian Ambrozewicz wrote:
> gpiochip_remove() force-frees the remaining IRQs, removes the irqchip,
> and only then calls the notifier on which the character device frees
> its IRQs. It may then free an IRQ it no longer owns, after its mapping
> was disposed of and the number reused, or from a release racing
> gpiod_free_irqs() and gpiochip_irqchip_remove(). free_irq() then warns
> "Trying to free already-free IRQ" or uses a disposed descriptor.
> 
> Herve Codina first proposed calling the notifier earlier [1]. Call it
> after the chip pointer is cleared and SRCU synchronized, when no ioctl
> can request IRQs, then free the rest. The release paths now free their
> IRQs before unregistering, under the lock the callback takes
> (config_mutex, or a new mutex for v1 line events). Initialise
> config_mutex on allocation: linereq_free() takes it, also on
> linereq_create()'s error returns.
> 
> IRQs left requested by in-kernel users are now freed after the chip
> pointer is cleared, when gpiod_*() calls fail.
> 
> Reproduced with a test chip on the hierarchical irqchip: both races
> warned in 30 of 30 cycles; with this change, none.
> 
> This patch depends on patches 3 and 5 of this series.
> 

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.
