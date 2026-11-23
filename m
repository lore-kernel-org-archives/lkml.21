Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399090;
	b=QR8EAjFgg524nn905pgg8DgW/fHjYOHr7/e+MHxOjSQUsYU/MGky3bw+e6JuXyweVhl4
	 PUNZUObr1+xhUY08h7bQtzP4QtHVjiud2ikhXC0KtkWJY6HrI8x5f+GF/trjeebKK9ZlA
	 +sEaFkbvLAM/cRi2TWxR25ORVzfHpyARbpW24ggU7BaBWcfAFThqm32W1H6slp48dnFc/
	 C6YrPyj4WSXCrIH2GsnQOAneoI8EtlDOdFZTXYL4WLaFEjShVS0nR72/00XlXWzxCbfOp
	 EbRVuo/p76ZRmXpOGjv38mXhVsLWnExxy24mvDNfke/fGQNyri9EJqNdm9u7ejuDbhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/6m9oG6/G1/S0puY4RqRayaqVyRy90+VEAnpcpDQ9Iw=;
	b=4RyCAghj2W/7E8FzOM3Pg90D71y0me7Y0AvPy3MCpc4JUTj6NEqySbJ8kz+CRWcASS7K
	 NKHEPgEBizevhlKkLSyAdcXEzKzRnNZhAuCf/p8c5/qRQR5VDlzZQyKg9LxB8D2Qsg4og
	 VZKyUK2CVFRsvYGa5gD2Ww7SrOykaF4cwiwTAo0lzolZI2j93gPaZdVXpaXIdQMu31yVc
	 W+G2IdM7/lm7PxEkoon6Mmi6Y8fzD1rmfaB9GvLwYOkMlCxyFB9MJJdgl3yp5qKdW8b90
	 wal58hQ6sO23WXqLImdL+N4a/oU5zOlQQr/yeZYgiFV1H7M07KGSDJU1UWv5YgdT5ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KoaGNxhb;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD4F606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DD4F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KoaGNxhb
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38190551625so5858398eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795399089; x=1796003889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/6m9oG6/G1/S0puY4RqRayaqVyRy90+VEAnpcpDQ9Iw=;
        b=KoaGNxhbWXMn4T+/msTNtl/XwQZly12OOm9gE+ST+YG7+TM7gWn54hU/Ozmi4jkYxL
         81VD09Dg/KTZLmdsTDgws5EczLVb8WqYb2vsX7qNvQYO14VWrNAlvdn6t865nxnjiPVZ
         lEzBfDpXisvBmRNWwCpWtCzwmeR7qTFIRnR5bffYhJ2DqtDcXOof/+GK8Jb5WeO1ozJ2
         CC+MY7T4nZ9Ep9L8D/ZzyD04q36Cdb2JyFaq4HPcr8qvuASDWBEwcNeStgolH4A7OX/M
         hIHPZo22uM7PzDQzegM9CV9a1O74WiI21aog6DrSfUxLVP/65BabyMbwy/Tk5sYBlOGy
         oKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795399089; x=1796003889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/6m9oG6/G1/S0puY4RqRayaqVyRy90+VEAnpcpDQ9Iw=;
        b=sHGzPPc1ZHaSHjaeJUh710pjIFZ+qURtfguI7xg9jzo9CYFiHQB0RvnQoBah0EnlWq
         lNlB1z6uShyAkD/rIUylpfSco24BxW76/ztlIf0dFWsge197MXKC/45Dvdga6RlPFKTz
         AXUdz3mX79hthxTGHUAd0L/vuBJaaEYye1T1OAnsCSlP5K1mJwY7YM/Gk91JRz62Y/70
         HdBu9DnzqGBPHNEuckYFzu3srwuiTxYEQuANLV6xy4UGBK2p39O5MzBUAo/gyD7vaMoY
         xBgsD9CVR1gU/ZEKtT8O+RR2z35op1ZXA+mMHmiIuBufXK95OJv/mcDi8mHdPD9iFiki
         F9iQ==
X-Forwarded-Encrypted: i=1; AL+hErFCxUqPXI3lE/ASsMVRyctU7lzpT2X8871dITInpekMk4pbdiIRmzv5M+a1rJK8RbBet+pdDhk0HH/RcaM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8takigAK4y1cQRDd6Acdy8df0bO2FOw6Y0iGj1SDlNcADP6+1u
	kiwk6j/IT0jDrBjt4P73xnhxBnrv7JMc4JffcAnsYMFxWppU9RNLz2Sa
X-Gm-Gg: AZFdTZdXuGvPi2uALMrQ+5dujBpKZp/2B65IGoDHjCOPXJewNiCJ6m8HQRuDqFihJjw
	VVUu55kdmjhQGm5G8bPUrefFFR/cf3C0y37ZImLZqGdm8DEIfQD6dL5TOxuugIxmRkuDL+o0wD9
	T4L8PbrSJt8RkfYZa1MfljaZUMiKiT8+HuNKtuR1jfIbfTiGt4Sjd+4AQZekCL/XNKAZInTyQhf
	/yxj5RIt8AqOu4Gj+5J+mMfQe8P1hid901iwLFzop7KW/fzAooVE6m+5ai6hayfa6Wkni8IUYc6
	fUI+Lj8k6vjxqo1DvvESFwULs7qH/UHlWnd65st5uyJocFH6eMIKDw8gO513GcyJZEJxwVFlCo/
	osa8W9ZLOvtgx1lh2ix6ATWo4tSb03V4grlDY4XcEiEhM8Y4NbHWp4t1FnVam66184NVCXc7zG4
	7S+/6arHYqEtLCu7wug8335/bAF0mJqIWyaWyj4+RHuJPkIyF3kw2zbxZkPTjB9uzlwazKlV6Rq
	INo9KXkXT+Au87sZSr8zXJF+TxGFniqzRIRyOtPtG9CJgGifFviitI13vsdIUArSZ+f4X2ixV7q
	krYg9wPUwzbsH4jzHQBu6Ma1uQD+sEyLYoGrHUAyfelolq6ZwIvgMjzmPh0uxzM6AZTWVVZTEN4
	u+UU5hIh8hc9Iw5+rRHyOHKIazpMFlZTmK9tQ4X41FK8dhmbV7q1SCehtvcfIkeuJu8mHW2BB
X-Received: by 2002:a05:693c:8642:20b0:386:9e22:ca4c with SMTP id 5a478bee46e88-3869e22cc7emr7180886eec.35.1795399089350;
        Sun, 22 Nov 2026 17:58:09 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3856456e6c6sm27647281eec.2.2026.11.22.17.58.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 17:58:08 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	pabeni@redhat.com
Subject: Re: [PATCH net 1/4] ptp: ocp: prevent timestamp rearming during detach
Date: Sun, 22 Nov 2026 17:58:06 -0800
Message-ID: <20261122-timecard-common-v4-e0db4ab1aa-r5-ahmadexp@gmail.com>
In-Reply-To: <179538006639.3135.15219639487891578509@kernel.org>
References: <20261118-timecard-common-301f823ddd-1-ahmadexp@gmail.com> <179538006639.3135.15219639487891578509@kernel.org>
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

On Sun, 22 Nov 2026 at 20:41:06 +0000, netdev-bot+sashiko@kernel.org wrote:
> This isn't a bug, but blank lines separate the Fixes:, Link: and
> Signed-off-by: lines from each other.
>
> Tools such as git interpret-trailers, b4 and patchwork only treat the last
> paragraph of the message as the trailer block. As written, is
> Signed-off-by: the only trailer they will find, with Fixes: and Link:
> missed?
>
> Could these three lines go into one trailer block with no blank lines?

Agreed. The trailer block was made contiguous in v3 and remains so in
the v4 draft. Any new personal sign-off will be appended to that
same block after review, not separated by a blank paragraph.

> Could these move below the --- line so they stay out of git history? If
> the tool assistance should be recorded, an Assisted-by: style trailer may
> fit better than a paragraph in the body.

I moved detailed testing and revision notes below the separator and
removed the repeated cross-patch workflow descriptions. Each commit
retains a brief, patch-specific validation statement, including the lack
of physical-card testing, as required by maintainer-netdev.rst. A short
provenance statement also remains as required by generated-content.rst.
I have not invented a new trailer or added a reporting tag not supplied.

Also, this report is on v1's mutex/stopping-flag approach. That approach
was replaced following Vadim's review: final channel shutdown is handled
by the PTP core after interface removal. The latest revision uses
explicit timestamp-channel requests, leaving the pin helper only in the
pin-configuration path.

The five-patch v4 series is posted separately to net:
https://lore.kernel.org/r/20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp@gmail.com

Ahmad
