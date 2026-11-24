Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495774;
	b=mt6nbFVXtpp5CzqNfJaQBBnoLrA7WH6qp7PsP/qcNUE3F8Ee27qhuB/ONCjd4whSY8nb
	 EXnXIVp1gDKGmgCfAg94KCXi6JALPJokvTQMQYK9YeUSGxAfsg8vL7sf+9n+TrKlRdOHJ
	 JAMc7Nn5aEHfmzrD/b8P7d5mO6eA+XZlR7hTmfQK+rwTnvaKSNcO2ANGTRZjFj3heyCSk
	 kd1KY9bwljp1ea8Xqwe2mUCAuhZJ//LtimLWpF7wfnIYbvCz6fSWHLbTg7hxbyI9oy6E5
	 rxLucvMqsuf7F2cQj7ZpEwhFG5+bguyp2OYsE1dlFjRqx0irwRG95SXiHsgYiQ9RPIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=q2AtCKrcnRowgK9UMYU4R00JyvBBzeu6djBwCY8oBcw=;
	b=t8OO0a0yY3FbMSsO66YHZMSwzSZKSqFY6UB1XHg+/jOIe7x0XmdG6BQDnmm7E+t3urxD
	 7DJSQuK0s+QeFXHvZpgA63FM3ejbzOXGP1PG77p9RkVmJH+f0WmlwjKSlE3B8JddBUbdi
	 DrNkitWUtzLu524ENI4WWrj4KmQQqrv/vlSEcVzxUuxU17dTj6wbcSAdLFnqgV6jiUrH4
	 joQTYYlNC2r1w6bG1lfpkdbMlBSfLTZcYGlkmTn18hN3iw2ifr5k68vWlATx2w/JC5Veb
	 jNyjK1dX0yXzoA899BquAhEupysLh1SqbZYzBcsQ9qwNOBi09TDCVX/hmCR4ACmR8Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T16l0T0G;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 947C5606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 947C5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T16l0T0G
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-386ab9ab619so3836625eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795495774; x=1796100574; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q2AtCKrcnRowgK9UMYU4R00JyvBBzeu6djBwCY8oBcw=;
        b=T16l0T0GKicmhbZqRU168+261kQqzq5E0ht5XNJJoCO0QQhpcTXbyhHAMZk8Dv+kdS
         Zgx2o2KdXpllzpKV/tDJvD9CSZOSS2Xtuh0nJqQfHth0cjymilkWeV9ugO1W3Xu/uim5
         VJXX794Aawd6Xh9OYL6YaxqC0oNXD03VnrfMpm3mhrkFKTu0SypT3Sjp6UCj3CxbB5T7
         GTnjHpPwMH+iC/Wcop7g+dDTwv3m66TBh80+D0l+WLVQXmqwtolbLZL/9kCT5WnHkkGf
         j7AtHdSBeVSPmf8qpOvjjtYSe8HmP2NPTfBa9PjseyDIs9aKp7x+iUpxvHw7vdEUDW5f
         OYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795495774; x=1796100574;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q2AtCKrcnRowgK9UMYU4R00JyvBBzeu6djBwCY8oBcw=;
        b=fjK1YTpRDgBmKDrZO7Cd8m7RS60PJ+smkfy3y7EapDyRFnpGC67WCgdZ0PjZI44g4P
         wUzE/e8ZM8osj3uiJFdQpSR58bo+rfAOMApewKyOZF5c321kx9Bvr+3I+n88H+GIwM4x
         WCx/Km8NbLFjpxBDge0sE3gpxFx/4S8g4XHPZUUlak6UC30M7id9/T9VJFluyEtAhKyG
         wwUyKs30otx5D2vxq3m/+8IzHf/7aXbTY3LYxdb0C7bz4MBqyLu1RLKSv5K//R3+TYm3
         OiSe3B2Ftr2jKmK26Ea8R2oxzlMzs0HDV8L0FrlC+jkRPvewWjvuTyHA0JbfwwMArL6d
         5Maw==
X-Forwarded-Encrypted: i=1; AL+hErGscKWcioTUfJdEWIozxdVzB3Px5ReEfzyzdvbCjHlcItj0swXZklvwbOkypLgtkHadGatlrGRFLW9zVMg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zD7IY3nGqx5RAxdVbbj8+HOfygdgXP/9B+oEUzEjxC7jpTFsl
	0gjCCBE/3sOF6EqIxfugSENCfliDOfsHUJr39aWnC+hhWFpu4MbWTNlD
X-Gm-Gg: AZFdTZeCP+axpmBxxpbVnzxOpcG+r0TaVprkqPCYdUSeGSly5JtkkUkX6PGnykyiwd0
	xy/C6gKyyg/o9U5aPFgp+r7RlMsxfhn64sn8M3/S2dsn2xvFaHMKT3IqFDFXsqtnZTi7EL3dBLL
	lnrz+HoJgPRA9UNaPbp4uVzw9QGrgMoSMZt3WbXO64YWx8aSRHd+1KFuZ6t3KGB0VtD+C6lE1tT
	45JH/twgdShEnUJIAIH8wbkZhdz6x1R+9KJrQCaIQ9/8ayALkfKhFlF5+ghiShM4+hmtqh+FC3b
	WoM03pj5fZ+44rrjKo4MpnjrYhq0x5W5cJPhlPHe2e12SKhNZJAjN+ckFMeuXGdHhseKmTNm/+N
	K3K0YRzYdKja48CldNHo9KznfIFUV/pXa564UjE/coK/JmeIr4tLVdP0EbKtz5Fk5sE/n9BGuvS
	55X0HCfJWPV55SIp17TvvswIHkumt9uukhX5iBOHL5N1A/kY+byPx6YmXR0C4SHSXkkvZ3o5cZa
	H38c9yu8pCIfOhSknTcAY257uxH4bVAFhvbOb5BBuI54YWODQdAZIlOeb4p2EdsjZSyHrjLkZd5
	8aKMM8EUX9pekfmYVLSwC1EX25VltujHG2gHZAo2orSfDAsZx5bCP3QI4YOJYHS3yO6xV+3SwaH
	6AuSY8hoeS3VmAAo=
X-Received: by 2002:a05:7301:7004:b0:386:c5b8:960b with SMTP id 5a478bee46e88-386c5b89f9emr166158eec.17.1795495773579;
        Mon, 23 Nov 2026 20:49:33 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm37247605eec.13.2026.11.23.20.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:49:32 -0800 (PST)
Date: Mon, 23 Nov 2026 20:49:31 -0800
Message-ID: <3e575d6e2eb90d4a3707319d37134c1a@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Pooyan Azad <pooyan.azadparvar@gmail.com>
Cc: Uwe Kleine-König <u.kleine-koenig@baylibre.com>,
	Muhammad Bilal <meatuni001@gmail.com>,
	Herlangga Maulani <w1zardsec@proton.me>,
	Rob Herring <robh@kernel.org>,
	Jeffrey Lin <jeffrey.lin@rad-ic.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Input: raydium_i2c_ts report handling fixes
In-Reply-To: <cover.1790612085.git.pooyan.azadparvar@gmail.com>
References: <20260927114425.442803-1-pooyan.azadparvar@gmail.com> <cover.1790612085.git.pooyan.azadparvar@gmail.com>
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

Hi Pooyan,

On Mon, Sep 28, 2026 at 06:26:15PM +0200, Pooyan Azad wrote:
...
> Patch 2 resizes an existing report buffer when a firmware update changes the
> packet size. Patch 3 moves the initial allocation to the main firmware query
> so devices can remain usable for recovery when they probe in bootloader mode.

There is a teardown ordering issue with using devm_krealloc() in patches 2
and 3.

When a device probes in bootloader mode, ts->report_data has no devres
entry before devm_request_threaded_irq() is called: in patch 2,
devm_kmalloc() with size 0 returns ZERO_SIZE_PTR without calling
devres_add(), and in patch 3, ts->report_data is NULL. When a later
firmware update transitions the controller to main mode and runs
raydium_i2c_query_ts_info(), devm_krealloc() takes its ZERO_OR_NULL_PTR()
fallback to devm_kmalloc() and appends the buffer to the devres list after
the IRQ. On driver unbind, devres releases resources in reverse order,
freeing ts->report_data before free_irq() runs while raydium_i2c_irq() can
still execute.

I do not think we need dynamic allocation for the report buffer at all.
Since pkg_size is a u8 (at most 255 bytes) and raydium_i2c_read() uses
ordinary i2c_transfer() rather than DMA-safe buffers, we can simply embed
"u8 report_data[U8_MAX];" in struct raydium_data. That eliminates the
separate devres allocation, avoids -ENOMEM during firmware updates and
ZERO_SIZE_PTR/NULL handling in bootloader mode, and guarantees the buffer
outlives the IRQ. Patches 2 and 3 then collapse into a single patch
keeping local staging of info/report parameters in
raydium_i2c_query_ts_info() and switching report_data to a fixed-size
array.

While looking at bootloader recovery, note that raydium_i2c_fw_update()
also unconditionally sets ts->boot_mode = RAYDIUM_TS_MAIN even if
raydium_i2c_initialize() returns 0 after seeing RAYDIUM_TS_BLDR, which
can leave contact_size at 0 after a bootloader-mode probe.

Thanks.

-- 
Dmitry
