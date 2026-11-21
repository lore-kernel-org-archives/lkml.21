Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795249131;
	b=zne9sCqp0wtHxPthRjHZMjz9BUf3+jE4clKJoweJRfvAbR7zfWTF8mhXrIrc/dltG09o
	 rCaajzdvIupow2K4G2YcIE3JzrI0Q2mMqRiZRgV4YCbefVrj3wfNYltDqwOLWwGal56tT
	 y35GROsJmWc5RiqyhwlQJc6r5tXGOcjPpthBaeTKSge9zrUgB59N6P0nE6KMUT4B2ByNk
	 uLI7zjEX6MYARW2X/SWmALuF7Jy3RNvNhlqlneRre+cFUDc6JCY0ifZL1ERnesSNYyXVH
	 YUxKNTqdg+NL63kfq69eiYVbUVIOcgiibFqvV/4xpWa838QBFikvTiA6veqT+KuS0YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795249131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l/s2mh+0qArJcTg26JMF7Y1HXG8MTRz+pIaOko7+DPQ=;
	b=O5BttcGmgAk/vsxcOIpVBu6+C7a6d3mjn0nMNjLWRtBvGicmUzcryXrl+CMbQLd87yD7
	 orHhOxJw/QbClUpdz7ysBKkGh9f944tRvlNOJKYNx3cnpd9vnSXojVPEQmeemWvM/8m/H
	 deGM0iz1/elNwMQL4iOMFkEY1FVlvCPxuSwnz7a5P4JQ7EQI2LeVLPAL03IetfJksD9CT
	 DgKtkO/6qE59NZfPiy4pnXlYrquz3d96UQIrP3E8T1OLNtv54taWZ7j/Tus+uhyt9No7F
	 6pzD+lvzpdiDQjlygeLaEDADUgRHlaevV7QDm3pdvBfyngmHp1tWYr8nZcJaCjnTNpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FqcKrp2o;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC36606A325
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DC36606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FqcKrp2o
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f0426a65e0so11002335ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795249125; x=1795853925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/s2mh+0qArJcTg26JMF7Y1HXG8MTRz+pIaOko7+DPQ=;
        b=FqcKrp2oXPr4tOHL61pgnws0WILpsCSBx4JVfp1wB3NZZJoM9TtnCcObKsT4TvcGBr
         6HGYHqn0K0uu/fb/VlUOPIaD/zN4pNzNcUn2+LFtR5bMWk3zFRY5eJdtrfB/8qeVJ5us
         JN3XtGmfE0tydPRRPPQZsbWW6bel+wI33fVd3HkO0LVfrs+PfJc4qqSQwIqG+lXm8Iby
         JfRu8/ksXhVQvYQMf2FmvSCTljLrzvA7+Y6onYC+l1Nd7CIIx1TeKY26nVq24OomxbH6
         IQEYOtI/taJFk27eGrNdkOvoOkj6rswQX5EtgP94IN7g7vnKq+EuR2Z2WHM/OeuzqPpv
         w4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795249125; x=1795853925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l/s2mh+0qArJcTg26JMF7Y1HXG8MTRz+pIaOko7+DPQ=;
        b=I3o++POSzRECPr2s71FFlEw19SIrRXbaRYh04PUktAa8OliyModHMcHVVrhIjePOCI
         5oKWUh+jqF+0FZDlSjl4lLv9DQB/yfzCqYxvO9YiPtm/hEZlRHZmXvSNj9Nx0hUJdzGF
         C4jcftsiYzoj5RU8xXUbrqDlxBevV2FDKqLUHO/V+eyVCgs3mOkoxI1FNEiCo46is/hy
         QM6LWIxj9fGKY//GanjPICvymBWxXoVjBFyQu9ZqBDGv2095Hy9Jv1oG//jq1I9puZ2m
         idaBOeRkyIA/lTU0eBQ4PTcR+8bqVjVVN4f4ek7obKXz/ZPOIl5D7N/vhW95vgOinh3N
         /qng==
X-Forwarded-Encrypted: i=1; AL+hErHVFUCCzwq+3z8f9e2bLWnoGFrw20s42UMO5UGaWqwgW6NJAHf7CNqOcD6Xymx51+4ArPJGOo5yxjr0ebY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/l+nby8wxeLeIfndjR+fEbQn8SULy7nPg1AAZOkYQianAIA31
	NG9hk9lKPGmsJezhpaGGscU7NLo6X7Qk9mdSzKA6HHR5WlZ72x2YaFENJCM9Kux3nuU=
X-Gm-Gg: AZFdTZd+jH3nZ1KuVq8OhoELYeSPlFhIZrdj2Xl4PtEXzRthsQxfLvLG/9dgiyLeuZ7
	/RhIS1kICMf9JRUVmeuaGd1d3o0tKHDiMgeIosjNqJSTbXaB1Te+uWXAvCtprL1uYHdn25tHCrR
	x1Kd4ae2OQfQxJzNlyRSkx8SQn9N6sBVLjXPpj1BOF17adLFyqUlfsxy8XzBJ2nMdC2wyEqamTg
	WxHaT6FDN3BYcrhYoBwZibI5qiBZXyk6hCNgRD3jsqrfCo7kfCfSmops+ihaDRLVFlvSr79AoA/
	sx4jrLaRaCzL8Aj0NipRolj+QyZeb+vmdnH7+LkX+IapWs7gbBKTzF8CXzFc3VPnS8lB1HUfhD1
	SkBFun4n+ocS179Mf4+KZkbcl0UPd64AvS8c1eoTwxvTMhGwWf5JJaZZ4TBkVqbnhw+87QQbQeG
	Yw2JPU6M7277X7UtgatepLvolTu9tlRwC5d2fKpoXAkJ0dDSJafZ+jdJMNJ8EliQqeaRtS3KiG1
	UoPckKu9IhF6uOtUP9BdzsVM4IRda94YU16g39HT4yC4Wx+LXnQX+uBEeFOzUXv61enSXhlqTMQ
	ve+TCjJSp4ERJqPfkUPWmz6S8t3al/hrgHFZ6eG6Mb95VKrRFGteD+pGKPAS1YqSgeN9vTWnIIN
	Gqvt0L6z7mS+eXA==
X-Received: by 2002:a17:90b:17cd:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b41c9d3111mr4310485a91.34.1795249125252;
        Sat, 21 Nov 2026 00:18:45 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm7548983a91.0.2026.11.21.00.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 00:18:44 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Oliver Neukum <oneukum@suse.com>,
	Havard Skinnemoen <hskinnemoen@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: Re: [PATCH] USB: cdc-acm: refuse writes after disconnect
Date: Sat, 21 Nov 2026 08:18:43 +0000
Message-ID: <20261121081843.4065887-1-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <awAtdlEpSLc1ges1@hovoldconsulting.com>
References: <20261118145636.3534234-1-william@wkennington.com> <awAtdlEpSLc1ges1@hovoldconsulting.com>
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

On Fri, Nov 20, 2026 at 12:22:30PM +0100, Johan Hovold wrote:
> Thanks for reporting this. I assume this is not something you actually
> hit yourself but rather something flagged by an LLM?

We actually hit this twice in a kdump I got from a machine doing some
usb reset testing. An LLM was used to squash the bug.

Trimmed dmesg and backtrace from the first vmcore (the
second crash three days later hit the same PC/LR at 51s uptime):

  [   57.197371] usb 1-1.4.1: USB disconnect, device number 9
  [   58.287013] usb 1-1.1.1: new high-speed USB device number 15 using npcm7xx-ehci
  [   58.599405] usb 1-1.1.1: Product: Zephyr CDC ACM sample
  [   58.676523] cdc_acm 1-1.1.1:1.0: ttyACM1: USB ACM device
  [   58.797838] cdc_acm 1-1.2.1:1.0: ttyACM2: USB ACM device
  [   59.026611] cdc_acm 1-1.4.1:1.0: ttyACM3: USB ACM device
  [   59.324421] IPv6: ADDRCONF(NETDEV_CHANGE): mctpserial0: link becomes ready
  [   59.378147] Unable to handle kernel paging request at virtual address ffffffc009fd5000
  ...
  [   59.437892] Internal error: Oops: 0000000096000047 [#1] SMP
  [   59.446523] CPU: 1 PID: 217 Comm: kworker/1:2 Kdump: loaded Not tainted 5.15.167-yocto-s-dirty-4ae9335 #1
  [   59.456085] Hardware name: XXX
  [   59.462436] Workqueue: events mctp_serial_tx_work
  [   59.474127] pc : __memcpy+0x7c/0x240
  [   59.477711] lr : acm_tty_write+0xec/0x1fc

   #10 [ffffff8001f03cd0] el1h_64_sync at ffffffc008011250
        PC: ffffffc0083e94bc  [memmove+124]
        LR: ffffffc00859ed50  [acm_tty_write+236]
   #11 [ffffff8001f03cf0] memmove at ffffffc0083e94b8
   #12 [ffffff8001f03d60] mctp_serial_tx_work at ffffffc008559924
   #13 [ffffff8001f03d90] process_one_work at ffffffc008059118

In both vmcores, tty ("ttyACM0") had count == 1, ldisc "mctp" attached,
acm->disconnected == true, and acm->wb[0].buf == 0xffffffc009fd5000
already unmapped by usb_free_coherent() in acm_disconnect().

> This isn't the right fix though as the line disciplines should not be
> calling back into the driver after a hangup (and this isn't cdc-acm
> specific).
>
> I've prepared a fix that restores the ldisc to N_TTY when a tty is
> reopened after a hangup instead.

Clearly your patch does it more cleanly :). Thanks for providing a clean
patch that looks like it does solve this issue

Thanks,
William
