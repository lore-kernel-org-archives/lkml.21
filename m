Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070610;
	b=bVrjM9yyOsnvxEuhS3R/AzlNjTd0Eh96GtQLStYs0TPQ2NiOOKasbqSsu6v3drlJr076
	 r39yXLa6lIQCTco1NgUquZ15IbiO0vuYAzgirKayZhUBHEsKtnNQz6MC/KDX8NCsGtTmf
	 H/2z4lVaXw7m0aoQeN/aYbmF0OJ9L7V5GNQfzE2wt7J0GRHhhen/w7O23dtmSv+Lu8EGf
	 hJL7TkN/uoamHaKCBwn4dfTyD6Dt60EaenJxZmJOIoP6sIWfP8bTFT8keEn7z/ts4dGRJ
	 owwi66D+BBb6QAB1Al01tqWiCMOtU5QZWwCjlfabvxT/KD6P/+irXRoqpbF85+zeeNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tlw/MFAgR3dlvJ1uhPp3TNx4s72LXZKJq2RTq8GSaTM=;
	b=mzz4qdZoLkZM1fHOTBjSW3ptV1ashlm7+h8B8VhGEffqRVQszVy3lD43z2JqKfSX3egx
	 JanFsnrisBjAMzESnpNsfkfABvcK5eI6qjQKLsrI5oOXxqQVV7iOE2CbtOeyvtXyYBitZ
	 /jTziqApBc7kRsuBBBHsxQgP4T6dcvBY2AJ6O12E6sg8kUp0dRtQAVrE+d/gp9aPGZQ+h
	 XKatdwJs8jlmJf3V6akHG1ndKUNCg72tAk7mAp273dK7cxtptZYBBLVh9qI3YL/Ng2oVu
	 cGO3R9gLSdDXPlk/qxsvVc8Ze50tRyxWKNZA9v5aGlKFQOd8M11nWHhN05dKa3Fha8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="M791bM/E";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47673606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47673606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M791bM/E
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso748691a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795070609; x=1795675409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tlw/MFAgR3dlvJ1uhPp3TNx4s72LXZKJq2RTq8GSaTM=;
        b=M791bM/EJ6YDr7z6lKX8YSF22UffBSA9Fa+DCJFUleFbxsXZiFoAi/xfZ9BehWd6M3
         WEGlD7o0/6flrw6VTWLQkXt321yG8isfrs/CcFfMx0n2hH9Z3F9mRMVUazJ2yfBiCPWS
         hH/FT7nomy0RwanfVtrUClrQHnca6PGaz1ifwKiOmPzFq6oeij7XUORx5LEnN7jw2Rqs
         IoF99aZldktmoceKhLx8wl2r6RWj4L98OcDS79PkOqsLhTjOradqe5FH7rSiQl9tvu+o
         5jQsjGa7plxWJoBYUjldy2c6EKvRuSWUm9jTMCXu+uTinAH+/xOZUFtnIExS0EQWCjAU
         tdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795070609; x=1795675409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tlw/MFAgR3dlvJ1uhPp3TNx4s72LXZKJq2RTq8GSaTM=;
        b=rur06RMOmmHgrQyKPTNV4/zYjKAoQbWKhKuHNMG+6bl1yIsHW2BbJeaIWTT1kCt0WU
         gygzDtUSxTx0ExRZX4WgZlukmxiiVWh7WkmNB5cn1aQuGTVjVwTtfTmqQ7ED7jWwm89J
         FIbAPTCqzEYHRk6Fvs9SIHho9ERXpfnucmHtNDTvhORVD/zoz+mU9rO5RPIKgADQW2/H
         bFNhVPeMRTiFojShqDJPOJfPDZiCMvIIs79hYLTU8U3hkhb6ujSnofqxXLxfhN8ePy9W
         ZHwM3uratDYGDPKWERShAcYHj5qqLa22u54Qa0xUpghqZMCnDE0TUMaIbFGAkYzTiLcR
         BcHQ==
X-Forwarded-Encrypted: i=1; AL+hErHqjTTnlhEfuAaw3ix6HkhvLSxKVTRltOe5N9vuboQjKUFP2qlWRKsyXgDGdixmY3LnnL72HxFLWYEuLCQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DuwoJH/u2l7SyRzDb5hvBvmSJbiN4Q+bKe7IbeWcxdXelzpuq
	K3Vga2aoJi7lJVgoe47BGAs68EmbXSTvVSK4dywA047p7L+YfFP5H89r
X-Gm-Gg: AZFdTZev2iZUcdnwMRhfR7bQPTU/9HDIh2J6z5Bij6KrFbIEAChhrxhoRWbhUw4KOm4
	8ZdG9MkujmFDM8+OwJUfriIeswoQWirSdr1a1wU9B7k8Wmx24nh/rXgSflg/8zy+VDtxGOOfQoz
	mnEk8SQKvwjcVs5EW3/iTzwgB3dUsRDgctvQZeEVBgQcOdn62RHXV/OVMlwCGPsIskdjsKBGmdk
	gQapBgTuRDcPCf8OOUGZNKrF6AwOKjg+FEhA5sDPlBHLJFLcDKn6yPrAydiEkHRtIYp+6AtFsJQ
	pEhtZJrG/YfUO4DdIW4tgN0/HAo5dwC4n3Gya0Pa3eqVH2kErYf5TmM5O+V9p760/YnH/c8tSdr
	gwojXj4aXHPNzprTukzSvqlidqb8Xz2R5lgR9qkdqFsqcbxdydApGhLvlU3CEzvvyM8ILKqrFWR
	6WWYNN4TbyFfwdBUIdzXMSLkIpqrdLM+ssaxyw4xPBV7GDUL5aVpwAUPO/XS3AV8EG0TGeBFVWT
	Mcl+zrOfFxzTxs3lB8iFsjtOtVjJsLnjaVVnQ19iwFcKbHtD0xI7vDUeSx+7GCN3MzHaZO8CNZX
	vxWrpmxy6OboIOm2CsYEE/jQiuAMyJ4zJExykHLiyEGw15ZFqIejSC+t5bagXNDItZr+4Ii1j4w
	h31b7lsefbz0QBnR9rsh3st8d14IeIEDrq4Hai3E=
X-Received: by 2002:a17:90b:390c:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3b3d07bfff2mr5487494a91.56.1795070609562;
        Wed, 18 Nov 2026 22:43:29 -0800 (PST)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0114fd607sm13890335ad.73.2026.11.18.22.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 22:43:29 -0800 (PST)
From: Wei Jie Law <98lawweijie@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: andrew.smirnov@gmail.com,
	bentiss@kernel.org,
	e.velds@gmail.com,
	gideonheinz02@gmail.com,
	hadess@hadess.net,
	hansg@kernel.org,
	jikos@kernel.org,
	lains@riseup.net,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stuart.a.hayhurst@gmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 22/33] HID: logitech-hidpp: shut down G920 force feedback on input unregister
Date: Thu, 19 Nov 2026 14:43:02 +0800
Message-ID: <20261119064303.274901-1-98lawweijie@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110-hid-logitech-hidpp-v2-22-30743e91d83b@gmail.com>
References: <20261110-hid-logitech-hidpp-v2-22-30743e91d83b@gmail.com>
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

On Tue, 10 Nov 2026 22:48:20 -0800, Dmitry Torokhov wrote:
> Force-feedback teardown currently runs only in the force-feedback
> destroy callback, which is deferred until the last open event handle
> is closed. If userspace holds an open handle across USB disconnect or
> driver unbind, device removal frees driver state and destroys the
> command mutex while queued force-feedback work is still active, causing
> use-after-free errors.


Hi Dmitry,

I was auditing some HID drivers and found this exact same use-after-free.
My analysis agrees with yours, but I am replying as I think there is
a stable-tree gap -- this patch does not have Cc: stable and your cover
letter also only explicitly mentions the "first 14 patches". This UAF is
worse than a crash and can lead to LPE if exploited.

I realised this patch cannot be applied to any released stable tree as-is,
which explains the stable-tree gap. It needs ff->stop, added by
ef166ce08801 ("Input: stop force-feedback timer when unregistering input
devices") in v7.2-rc1, and it also needs context from earlier patches in
this series: g920_input_open() from 03/33, hidpp_dev_groups from 20/33 and
the reshaped hidpp_ff_destroy() from 18/33. So the UAF fix cannot reach
stable as this patch, and each tree would need a hand-written backport.

Every LTS kernel is affected: 6.18.y, 6.12.y, 6.6.y, 6.1.y, 5.15.y and
5.10.y. In all of them hidpp_ff_destroy() still destroys the workqueue
while hidpp_remove() never drains it, g920_get_config() still runs from
hidpp_probe() so FF init succeeds and the workqueue exists, and none of
them has ff->stop.

Note that I only mention LTS kernels as 7.2.y is EOL. 7.3.y is a special
case and only needs the driver-side context from 03/33, 18/33 and 20/33
since it has the necessary commits brought over from 7.2-rc1. To resolve
the LTS kernel gap, I would suggest writing a minimal stable-only fix to
resolve the UAF in the remaining LTS kernels.

The alternative is a hand-written backport of 22/33 plus its necessary
context (ef166ce08801, 03/33, 18/33 and 20/33) -- which seems like a mess
to do.

If you'd like, I already have a patch for stable trees that I can
contribute. Let me know your thoughts, thanks!

Cheers,
Wei Jie
