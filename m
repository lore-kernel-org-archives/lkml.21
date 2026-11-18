Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988522;
	b=dkoj4pyZYOxqS/WDeEPNV6y2XrOM8B8LfrsyRj3gKkAQRaWk6l8DCAZnuFHR4cDy8ulO
	 1b5a3x/4nzuw0kgJa4AlcZUEXfPZ+KY3x8ND6v0hD/spa64Xya4xn9qjxCoTAJ9K7L6YZ
	 g+wme1driZQolUXKT/FKtB5iPTHYGhMWXpLOp82Qo5005stClTpW2l52RfePoTKdgChSX
	 C6d+9xFBtViCCEjskr+cKac53UYdSiVCE5+XX2qyJa/hCFAgUMVweFjeHiJo0jUxzoKt7
	 Up4cZSHTn1ay/ypxLdng3u5WRkRVV6iEpVD3nUl2E5xJnBXQ0d7pUddxwQb2n5Nl7gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IixbFQXdCcNRV05zhO0CILF5CYB7LhreOsOHyTa+xbQ=;
	b=lqHaUZ2ZclqJG2j9Bii77Ss1gZj6gT6KPikmFGE3AQjbZbGEnYbUg+F9x7eQ1dKYd9lX
	 5sRb+cXjf9NNRinX9dHaWz33rJn171wNFHKM/n5k5g5yXutWxk1dy6FWwl+ZeZG1NeHcG
	 LwPh2k/p/McyaHt4x6bmUplpDFZQiJVfDcaV9ZsJU0i1C+ixKE0NvMVqErgZcM0GCb84k
	 7wkP0YtzHCtvCtzNPYj++cKpSRbbGYDSqKKqhjbpx7t7IUIpHJSx9ODrkYpoicB5+/1sA
	 HYiS1314eyE5ubikg55j+JYyxVTYdIXBetlQACZVmwSr4oRrDi6vsxbc7fAL6T/zHww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZPCDWY5K;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DF0606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19DF0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZPCDWY5K
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so5037815e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794988520; x=1795593320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IixbFQXdCcNRV05zhO0CILF5CYB7LhreOsOHyTa+xbQ=;
        b=ZPCDWY5KjboLv2qiUQJNLCrhqC0b2RJNEadIMQZ58PFpt3321ldzzVsvZzPH4eVXAP
         U3z1HuiF3fvO+h48mcpgMzs0HC650MBoJDLQ6NUTwzhuadeOeElBj9VpCc3FrnKAR5IE
         RW1Pf5c/skEH393lNme8Zv2sToN2m7cd261Ls/+7FKaeWPpbmc1VSDtpwiBGnEghvVys
         EAnqdmdtOJe6OQ1goXrBZUHqpCApIlegH5C98NIjrk/+2SExYNyncT8V/QWd7yVBhR58
         7fv5fzq2nX13eAWbMOc5srgfrNdS0oVRpvziEgkLve3vcYiV5/3i7i47h/MGXduqyMxA
         LZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988520; x=1795593320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IixbFQXdCcNRV05zhO0CILF5CYB7LhreOsOHyTa+xbQ=;
        b=F9PFjR32YctO2RnRzOIgn1bD39ESUM46SNWQjot3vAJvOPZoYCDmQTMxeWuDw+/9VN
         xJh9X6muSnQ7mKDDAScNjibluN/PAYoibXoX1xA5A6p3QCDtEnLKFWeDsZPDttvp4WAv
         S1wBjnwlf3wuGC1bu8BKYTS4T3yMNL5xiN6qUsViD0rl7YASzktUA39LAjHAhrlJpNp9
         YeOLmtC0xxKEkylBQl4PXtSz0doNr2AOhnRForYMMwV9LimTceDwoVdGtRtMU7q7EWjh
         ZishrsLngar9ZRlweMTIhszh9fl1q9PB/YiqxeESDJdLNppmUwWK0QSOHRZjeTr9a1MO
         Tv7Q==
X-Forwarded-Encrypted: i=1; AL+hErFBjRK4NS7FF/4e6wSbl41VpjHSQZKc034yDppWm2Ia1y4kz0kRqdRJKlJE8R5il/7ldrYs3NAvPvIUmW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z96JF9JKFsjiChZdqB3T18zkS/rhbmowoHx89bwV9SwcVAK5IAP
	TwaLhU+3TNB6oACnW3E7IRQsz5cOIK0U3B9xnM2xnC4EQWyZkbUrE/ZZ8uPye331
X-Gm-Gg: AYBFou0dveQ2r3pXI9lAIAKMwEJUEYeSxRhhZ3GnYYpzCRF+Rxysjn33vDLyzciHGTG
	rAf+aju/hcprCjYy5LtcqtRH+x1E/mtB4o73h9hs2dQmyV2yXhV9TNvrmp3IkVS0aUi7Ou1MesO
	NeTP4lNVmAfPAv/zl1VDOswE1OpTk/r/tge1v/7+DYidhoooJWSRBKD8sY8B8nBG6ycLd7IfmYr
	pIVgRrtatZiqEZzngg1IAI4YBlRuplOq51QaxSXK3dguMh2hEQx+m7UMkNhm+chL2cxVFnm25c1
	jnH+LG24iDZG5nLbEouMJr7HSyhJr7pbJckmxVHwcKJRVeEa/VrEcvq+TtL1doJY5i8w5mJxFwY
	NyFN7rSIBGFr0/JkDMrlrbnIQdvDkjonxbjnbaRePZdOkvRixnozMe4xmcfYVVH2sYkXQw1F/h8
	5+8Vx1vsL49gtQg1URvndG14NbKEzLxqYrj8a5Uqo4TgGjwZfZ5pj0MKbG4snnwyXQ4LTLqMYa7
	29VetAw4uLS8JvEgmVahVIqGTDNVkAudv5UgKnj8NdyVtVsIiMxTzSWmyC3sOn06UjRiS/lZPSQ
	X0uEI7D+Lyla+gGb/v2bt6QHr1GDC3DWEVnQ/PFyHMbZKnPdyhOlY10+
X-Received: by 2002:a05:600c:8710:b0:4bb:6fd3:5aaa with SMTP id 5b1f17b1804b1-4bb7d6d1dcbmr31055095e9.3.1794988520307;
        Tue, 17 Nov 2026 23:55:20 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e59834esm15865035e9.4.2026.11.17.23.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:55:19 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v12 2/3] wifi: rtw88: support channel switch in AP mode
Date: Wed, 18 Nov 2026 08:55:18 +0100
Message-ID: <20261118075518.1980526-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117232624.1956815-3-mehmet.fide@gmail.com>
References: 
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

Sashiko found a hole here: if the download of the count of 1 fails and
beaconing goes off and on before the retry, as for an off-channel
period, rtw_ops_bss_info_changed() restarts the countdown with retry
false, and the work finishes the switch without the count of 1 ever
reaching the firmware.

With a test build that fails that download and an off-channel period
of 40 ms during a countdown of 2, this happened in 9 of 20 switches on
an RTL8822CE and an RTL8822BU. Passing rtwdev->csa_retry there instead
of false keeps the retry: 0 of 20. v13 will have the fix, please do not
apply v12.

Mehmet
