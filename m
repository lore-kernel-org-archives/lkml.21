Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669193;
	b=hAt0U395LgOahB288BqRmh15vosK1F8M8UCbA96XbJKYWINGljBpIFr9JL0Ysec7Fiw4
	 PboHO7jkH7I/AORltY/6IedYuC9RlPqtxpzlWFzFBwEUvpmMlaZOfRZ28dEN2ztrPTcLL
	 yndwWv7zpBP1U+iwQ4I3oNkrB52fO0ozltlGjoEEmBnC9u31ju+qStX9ZObSgOkrxRmcH
	 eSU5+OLIo63D1xlTq4F2lsD2GaTwhI0FQFPC4LF66YcffzIdwpMnAcriGjdzvnP4wfnHp
	 SpObbMGG2//WWS5D+BnjtXlVLNDta06tmoH1OUjKZ80kDHcxnHddPX0lY7h0XTkjC/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=xeiikBLPBm412p+eEKjwJKkmvAegh7AP9H8VXVhgxBw=;
	b=Joy9tIhl/1Z0tirP+m7ccpHpvwJPB0zC8ermkJSYW8iBcj3MMefewICUCpzmIsuYbWvI
	 tPS6M9PWZaVTnQItJQlFC4F1qCYCwTSiELJLv3Zj9HK8tVH34nUCkHiiNM3arYZun56vQ
	 ufkHDzLRrstozulVqBNORQm53fwZuZPvqKSAmT93OVJ3GwlI4qJCqWoiox81MrKtjYpAt
	 WKMXMQyi1NbWvG3zTH3NG6/S44vy2SboDqaVSRHxxYgTZGx9A/ynFqflmwhWMTmIAbw2/
	 Xb+b/j9HRHAbHY+jazIDz1/vHwjtf6R6FaQniwYx4fER4ZfKMd0ZENXrH84miM1da0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FWM0jOiw;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02F3606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A02F3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FWM0jOiw
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f0213202fdso35286895ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669192; x=1796273992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xeiikBLPBm412p+eEKjwJKkmvAegh7AP9H8VXVhgxBw=;
        b=FWM0jOiwEBSB+lT/KzPX7bzbz5pRuQ16gBwwSR7uQCd6sJB2/D7BAzE8SvJtOe1FYm
         +AXC1AlMNprtTA4x0Ddk52naLr9G+CAsExW4bBBscLOl91V1zSyf4/BFsQ7X8TQd2AJn
         lj7qKJLFrUOumZE4m+kFWJhTpjEco2/V+PuTywkRg11qWiPL+733MHMun9Hx+hUY36pv
         Ye3iI963P4iZPeeDypm2xBw8wTetSYBiBv4zj3zonn0HxBCWr3iLyiP8ugm9FAofUHFD
         /SzD20pH4xvg+j0i6fhF3xD//+1EKx+TRNdJiCtzlUbhdwHOTuvA9YYwvcR//ViK3Sao
         YvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669192; x=1796273992;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xeiikBLPBm412p+eEKjwJKkmvAegh7AP9H8VXVhgxBw=;
        b=yoLHmy5LrORz5GO9tjfAIap8UOZwv3vkFFWyiHkft3aSLQs3p53FaMu6Ms9S8j4k4d
         2XTD3alhJqPR89WAlDuKjY2RKfjqeKVJE5PKyLbEva7QTQZ4gEfc8tGPRNYXw6MblQ5N
         OkDuohhXSK07O36MLwVnVfD6zi/sLt8ShH9YNN0qBIRuepabALT8cvJbuQRZx+L0kxDF
         TUQESj+Tfxh6e35JTVL1L3vHa0IyjVwxGYL93oFJfNF0dG7CAjGQP3lYiFtis21rAfKR
         mn3suOo4cVwodbN6XHYIfemGMcE3h+xWUAgdtDKjJwzZJZuZGAke+PyW/pnHulUZ/7zp
         6GUQ==
X-Forwarded-Encrypted: i=1; AL+hErF8RCeh/3EIt9QeGV4r9GlX0sJn39yY0FjXDVuLPYxvqPDPMq5nYToju+GhnbVrR0j3ls8ZIiY0j4NQUhw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jTCTe+cvZsbOE+qNYWurGLVkwZzVPVgRfQ4nxOPZnp4jse/1J
	K45O8F/Q8QjTKy023BPiB9lV+ZW1TAy/nzd4ZVVqj1gcZ3Oj5kOrQWsl7jNZ7LaIMfISlQ==
X-Gm-Gg: AZFdTZcPbEO09AFrGsF071zvMasbgTBsinKg+y47KEV/hRIDWYRq4v4Ni+r7H99qRkF
	XOY0PMzgVpFbKazSgqaQ8VZrW/ynqbhZ67vCWzb1Myq7kOjt8r1KohT2sKSWYVWa/avGpvRK2R8
	cw7ALvQ/jaILsJ3ktFXHNFVy0sotuA1+TkEkOTHK35JyA1hRHxMCqZuB1gpDgGoEAULZsSumtd9
	trRFxrblM8aY+VnbMsmGw11HJhApfOE2JjIR+5iztJyIihXgzZqmvAanOIUP1TNPJlu6xpWn6en
	bM69nLdhu/E2AqxuMhTA+sWKYHFmee7v/qVp607ldff5ApLmwIqELd2wFmHkwaO2k4hvB9WfZ4u
	EgIEXdJnD9OZIJ84K9owpr5gP8F7VXQGzlaIPc9+obo4kjwZXQaO5eivJZUxMXiqJ6FWWy6yM8g
	aRE9915i6F2kQK8vobD0SAb2pmgTwxqro3NTqfZ4MXcR9O/cfgJXOHJqHKLJ2vKMpInYSkENlKD
	7xfTkuWUeM8L282AUi/gjq5q12mXJA4mbrdYNDqjPzzdJuRRCQiI6N7Aaxh2KOtWPRlrQM3UWXt
	RvWPWEy8mxu+QMkepIFyZRn3xasg6r2hdyZ7MQsG4/l+92B3QUMd7HPD1UXG1nlTYu/llIkHRRc
	jlt+BDDZHO9e1JbCsaBuvr5hNtlM48iCy4ElM2klmPxnpL5FYNhr2vNXwTg8gp9JdJ46Y/4B9A1
	hQaH1GKAuffhQaCvPb1LtDWEnjICG+G7moF1iVgG2THJru
X-Received: by 2002:a17:903:b0e:b0:2ef:ced4:35e8 with SMTP id d9443c01a7336-2f03f1e0d60mr192992555ad.52.1795669191962;
        Wed, 25 Nov 2026 20:59:51 -0800 (PST)
Received: from kapoor ([149.40.62.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f07d6d4bddsm68507395ad.62.2026.11.25.20.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:59:51 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: iasnezhkov@gmail.com
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: inkern: guard fwnode_xlate with info_exist_lock
Date: Thu, 26 Nov 2026 10:29:42 +0530
Message-ID: <20261126045942.518691-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125234827.94791-1-iasnezhkov@gmail.com>
References: <20261125234827.94791-1-iasnezhkov@gmail.com>
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

On Wed, Nov 25, 2026 at 11:48:27PM +0000, Ilia Snezhkov wrote:
> +	scoped_guard(mutex, &iio_dev_opaque->info_exist_lock) {
> +		if (!indio_dev->info)
> +			index = -ENODEV;

Taking info_exist_lock here matches the rest of inkern.c, but -ENODEV
already means "no channel on this node, keep looking" in the callers.
Without a name, __fwnode_iio_channel_get_by_name() passes it back up,
fwnode_iio_channel_get_by_name() then walks the parents and
iio_channel_get() falls back to iio_channel_get_sys(), and
iio_channel_get_all() falls back to the map list on -ENODEV from
fwnode_iio_channel_get_all(). So if the race is hit, the lookup carries
on instead of failing. A code that isn't used as that sentinel would
avoid it.

> +		if (index >= indio_dev->num_channels)
> +			index = -EINVAL;

__fwnode_iio_simple_xlate() already checks args[0] against
num_channels, so this only matters for drivers with their own
fwnode_xlate. Could the commit message say that, or could it be a
separate patch? It is unrelated to the locking.

Thanks,
Arnav
