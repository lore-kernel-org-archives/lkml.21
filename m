Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795400512;
	b=aLMetP6BZhvWth4TEoB17GY7p2cCvQHESaNHuNLG0cn0kkiedRmRIwC2SQaRxQUM5vbm
	 Erb+e7mTsaRX1YwzBM6tOgtBGyjCGH/OLXKFb/NLyOGhrIGJGjVIPTOt1/53DIA8hueEB
	 fm+Bzx9WJTHvrHNfpqRWUbn8x11I7iByhiLIRhJv4Y+L2HgMlWyNdQxhGbIZk3IVOchL/
	 RxYZ9P7zwS92giecCPS+v6alLjp+gftubIQMrS2pXxuQQWWN3tkVJ11E/AkS9KvWfVJig
	 QztgR18++UEioVncWd8qxmiIUtypfUiRdeP/MVccqGYclDpspObZDeWI4URIykjVB+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795400512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=10KSnwqlKa0UugOqK7Wsiq2uHkzToLndOpuQuZAfxcg=;
	b=kAoa1M4DoGB2x5zmMeNDx20RsotNkiI8+qCMbSt8xIpLBmldPybNnfGsErshiwriMJ31
	 Qi7jucB3pAsgQxckSPbiTy7fMJpmF6R6X3k34YJ01G3coRBURjsFt1NZ5OKlvC57Tw1uA
	 PX8lkVlYzMV9ddx6QwgmDMtOhhq1x3EATSgw9kX07cYoy+cqBa/fAPR6By2zyIzsOD1wd
	 EWYsKDDNDujeQPpryMUSDLlU2qoKf+my2AWx+fxNFb8EKRoU3SAWbjYDZqxPGcLUNY7tL
	 cTYLkPqTheZ9WM6yIUebMBGCLp93OsKKNrNP4gFOQoEEWJAJyX2V8YZ+OtPyqqBtkUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="002M/A5m";
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5896606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5896606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=002M/A5m
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so2032512b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795400511; x=1796005311; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=10KSnwqlKa0UugOqK7Wsiq2uHkzToLndOpuQuZAfxcg=;
        b=002M/A5mlpo7SXEuP9PGK/5K9lMVDZ52P+Ii/Wui5IQL3eU4QprBpsPoiolHs24cKK
         iVi79QSmJqydI8KG7QxrwxQhCwL/v7cmqDJOln1JLusPTVlnIthwD1PxR0fM/HoaMOfA
         5jTlZzZJtFq+K1Jpo0SSDOfammwhwtThi1mJ2O6hoh0+3T0dNuST90p1ftVzIJzMTBvb
         fIGrvhjh6FT7WCdKRZe1kOV+7RAhEgesH4MHKEVQJdgZ857q7cMSWTaswG8zM6uoipaH
         7QWmTPRi5RR4k//RPBQzJH9zDZYpDgjw6UlxY1Mkh32xuTev8uM4gTfkWeYt/ys7sMCC
         DLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795400511; x=1796005311;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10KSnwqlKa0UugOqK7Wsiq2uHkzToLndOpuQuZAfxcg=;
        b=wzH6yxv1jbKb6xgTGVw8OsqWJZmdInC+j9C9t1evlukde1I+0OK4Y2whL8qD2vfKJK
         ks/lYsSs/eg3ARzDBuSYl7fzQ3zKCS1J5eQ2pDMp2R6nXo9KUsEPQTbeF05u/wcp5+0k
         ZIdJn4du/ETXJykyRjZ4JGIy1UmLJIqTBfp75g2znxkpq3Xw7DjfPFvp60vTR9j5TuyV
         XlKMV28goxtVN6/HR2r8FslZ/6IekzvnZ7MOzwFz7Y3LXcHpw1Z5rfcCPNXe4mYHwurt
         adCb7i0VmLxQDvg77W6gU41mt01Z7bjSwIXUxgaIMcu9fohBv6BxyviYAQKbfMBnbixe
         JW4g==
X-Forwarded-Encrypted: i=1; AL+hErHM+MFXvanodzv730QRzEPBHXN1b3lqwFDE7gcNdsJnNgcAcPsJ+Yc8dC2xQkzk9BokMEbFApoIqedWSxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZGIDsvtZKAe5H2XQC7GXpR3mwFXoDUlqY1FH64ob43zrBguxp
	Po++dQiiv4S85hTok/YFwy9AXhw4OKCL+Z8xvAxR4DM+52QxDjKJxo5n
X-Gm-Gg: AZFdTZe69l17cvqthezXSR51n1/AW1l1wi6fsm2dbxjN60Mwp9zsAj434q9nO2PVkZ+
	6u9gE+Kk0ynMVfdOUQVUkcn0VY62yenubDOL1jKYCDp6nIvhNgoI7Vl9einrrpGt46Qbtmv5lkU
	pPrSiAp9uuAM7VKTD4xzTF5AFLjBWOG6B+ScbcFca5qQMJ5jvN3Ojp3FzwwrQcVSX+69YLZqx9E
	vT2DRBoXWedVAV7rliF+VxXMEcI11IITej+mCokihqU4ldWbujXjoS6RXTrPz3+cbC7AxDCP/YD
	SxQYKBeqiDcanbrtSMRg4WRLDKs8hm7/cYr+T/4u2Rv3yaTRyFNnuuUbeHs2VGT6jkeIxee74qI
	lVm6BgH4wCN/zavCi+NgZFMbwGnVrf3MDbB383BZrAI1UIWCPhExm1Nvu4URd22R5tyXU3RuKSl
	bOczwcxH8g90SKwGoUCZO+CppBVqWROoX34WQinoCzfq2NFHduCULzw9q4UhBJ4NZgi2TEgu0Ow
	xfoYhaPSvvhys1fQkq9ehHfaIgE/x2NB6NXUbWIsP2gdNLRlP5rv88b0mXt7Did8bQdYDMax/Nt
	7sIFh+b79ITi/rnu68CbUdWtD3M8plpfqHilmbCouHBK++JihqvMEUO2WNlu3JkoxW6aoPeEKat
	hGoAVFEJFK7fPbFLwoMnP3zlxiw==
X-Received: by 2002:a05:6a00:419b:b0:8a5:a8a2:95a0 with SMTP id d2e1a72fcca58-8c87cf2a808mr9481817b3a.52.1795400510980;
        Sun, 22 Nov 2026 18:21:50 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45eccsm4674426b3a.31.2026.11.22.18.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:21:50 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject:
 Re: [RFC PATCH] firewire: keep the request alive while the event is queued
Date: Mon, 23 Nov 2026 10:21:46 +0800
Message-ID: <179540050657.417371.5230551399496711422@gmail.com>
In-Reply-To: <20261122123358.GA500423@sakamocchi.jp>
References: <20261119083205.3437874-1-shunsheng1218@gmail.com>
 <20261122123358.GA500423@sakamocchi.jp>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Takashi,

Yes. Both scenarios you describe are what this RFC is intended to cover.

The queued event has the handle in v[0] and a pointer into the fw_request
payload in v[1]. dequeue_event() removes the event from the list under
client->mutex, then drops the mutex and copies these two parts separately.
FW_CDEV_IOC_SEND_RESPONSE can release the client resource once it is given a
valid handle, without waiting for that copy to finish.

In the first scenario, another thread could observe the handle in the read
buffer and issue the ioctl before the payload copy. In the second, if a
speculative ioctl happens to hit the correct live handle, the resource may be
released even while the event is still queued. Depending on the request
state, that can release the fw_request holding the payload. An application
that waits for read(2) to return before responding would not encounter this;
both scenarios also require a registered address handler and an inbound
request on the bus.

The event currently has no request reference of its own. The RFC gives it one
with fw_request_get(), then drops it through free_event() after the event is
consumed or discarded, independently of the client resource.

For testing I compiled core-cdev.c into a controlled KASAN test with a
modeled request lifetime. Releasing the resource before dequeue_event()
produced a use-after-free in _copy_to_user with the original code, but not
with the patch. This tests the lifetime problem, not the exact two-thread
read/ioctl interleaving on hardware. I do not have a FireWire controller to
verify that timing.

Thanks,
Yaohan
