Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853799;
	b=dFGwy51XWz27zC5GIUYEtaf/pMqr6SCliSO+5bEaSGbu8pBm/Admz+02A5/IlH/rF+Ns
	 N7WVeeVwLZAIZWYNwLnZH7Qz9o6UnvwxBEeeienCXHrWC/iasKAJnxPBAkBxIRp9MEcE8
	 k2r32lAixv7FgjOsIZAm4oY+twzvHDsuFnJSEuJbu2jPZxE8HOuhjnraDiD6K4TAuzA0z
	 Xf36RD7JB9coJNnPyOrF1SL5y2tQYDsUWEXcFvPRqtyzpPpNKXD2ZdAeDbtZ6TCFNGo/9
	 0ZftprviSJLQnLelANEmAF40TvlymLo1EGonKpYSySUppN6nIwv3PCGWaktL+WQ6GOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=qbKDQWUnoUeHnoFkhzUI12Kk6Fiq3/8/qM0C0256Q6pbUpg64qyr/ApJMk5re6rZKlDc
	 SRYRVgo31nO8hCnDDOe7ShtESaga6o8w1WvNK3zG3xlhyZnyNNFh3Dh7KdkWkyubqwndx
	 avcraUeT9DIuGMtEHV8G355/Ndt3VifYEmL5VzCrAoe6yI/yJc3HFgeBpaEEBwmZQziET
	 hmDvfSS33lgCuaVLw5gqvPG5wIZzaWwGrEcnlH0fZVrcffXTc7QNagD+adUVzNti3wbuD
	 km3TNGE8VPv5svBGLL5Jl8Hqd3ZAKRofrKFzkhaYVKl1syOYYOKqlVWf1ypvXoR7tRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ulv1stUt;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC99606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACC99606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ulv1stUt
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b546061d58so20736364c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795853798; x=1796458598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=ulv1stUtqpRQtsCqjEdHlIZAi7l3/dvdBPm4zrW3i/KDRbOi1q+/HP7TpeWpckp9Jp
         NVPZ2ibQmUFlRtNnSEgBgQ10SGfVPGFaAikxdh54UDoUcKz60vOwghLJbAlQkEd0HBxt
         iLrG5/GMKoK6dvHNy3EBI8dhgd5THdmoO6cyQ4FcZ74EKAbsT08d7LSDPaUx4MJNrNkH
         S8WqBZ8hmXsVqtsmH6VTBtWtEK/MzH3hKlEZ/fOnkPGJhWFvWgZujjE7ToKZq9L6nG93
         YEXN49Unr7fDKBXgCDIcZ07vDcM0YgOHFotd63hshtol6pthIxXEwCTC82xgkpyBHW+U
         FJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853798; x=1796458598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=a7Gt/boiVyM2XzG//FV86SLj9xOeJ2pBd/FNsKBVLmCfVSdLOQEAixoen6ASxoB2NI
         NU4TwJmXUFDObXwjT0I9unMMRI9PjrPzSy0/uHNvg2q4ZdMND9YWj2pAZ8yYfqyr6JeL
         bn4cV/Y/fpYsscS2TO9Bcw9tMUhtL/gZDL6b/OKhf02Ir4634GEpfNUwyTJg/DznZmCb
         oQBGGHijOb34NyzEMO8C0/XsAPgrEH0tThpV/5WUYUoSsSnoQwEp5lRDL+6PaFNx2ywa
         wH+0iIRxG54D8OFwuo6RqQhrFd4SM/B7+9SKMhag9+uUIkTfjeeHcBq1dU7n0BhH9xzi
         nvPA==
X-Gm-Message-State: APuU4Z/ePNAC5il9sIUgWgPGTnNs1hNWWUwqdEXtTZs0oR57ZAMIv4pL
	UpouSwJHC5erXoalXVyiLUE9UPHbUmTHfvq+rKcR++KwKATzKQFCHDh4
X-Gm-Gg: AZFdTZdVEJNEglEfa1tfgEBeLmL/uz8cyBHFwJToT94GypxxS5JM4jBEcVFUt9NZbIx
	vpz5a+gKyPUMp0FtMxJtVPKni2KyWjMQN/6KUDY52XwQCFHjV3xVlRdiiiF477Apah+9DIxUokg
	VWrnKHsHJcJdaMNkKEmoDZhCbz6/9s3DuPGhuHcnh6l22cAN19zQ3N51ckIzKzFmBHaVd0F9U93
	2fE98O+YDgoFC74hxgVgMGkAG+TlI6BHZKQQq8EnMJWUGP1IBade3yNQmD3vycZRnNVDnZOzOLd
	pP2UgRbAmcP0g0wCT4qMiNvSwlNuyPNg/6wy5xNzy+SlqN35dYnCkVqlPoXVqraByYvtll/hw4g
	tmtJRoyQdoA71n6OaJ/WFNoJmmhTNgmZPRo9Vt6x1cXSZrHRM/T4Q+PCbTreov/5eTqRHSpoLmk
	DOfIulAtou0kDPyGoaMqak0le81ymuPk157feb4uMKVbsGbiqXkDZ2iqa2jkmUZjOoWF8SLehhL
	oX8Q9oDLRle6+X4cqaDblDBTavISoFSKtYMnPTJikEgAP5G0ByZ2atuI8t6+8A5ny9NqcbNnKuM
	qF3iXwPB/OLzH5X699Cr0PSfdjVme93RSoNduYqIgnxBLbivoUTW
X-Received: by 2002:a05:7022:ea46:20b0:1b5:23c0:4f15 with SMTP id a92af1059eb24-1b556918196mr25488342c88.39.1795853797765;
        Sat, 28 Nov 2026 00:16:37 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm60323430c88.3.2026.11.28.00.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:16:37 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH] ALSA: vmaster: Check follower callback errors
Date: Sat, 28 Nov 2026 08:16:13 +0000
Message-ID: <20261128081613.3067-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87h5h2mba6.wl-tiwai@suse.de>
References: <87h5h2mba6.wl-tiwai@suse.de>
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

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
