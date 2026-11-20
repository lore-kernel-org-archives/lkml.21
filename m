Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194178;
	b=HGGIP0ZIRYVB97TxHn8Dbi/UYxljKBAlAIGzoiM6b08tkylXWy5FgOJKdm9aobf/AV5o
	 ZSJjVf9YophbvLe6ckNIeKQeAmc663XHrRV6oQj6jGhNn1jHtBTqVJBQYLFyLbNRZ5vXZ
	 wRrZrELlmXY7Uy9P2Y14UpZgOg869YY/E00cl91lfATcvujS3wVAh3s7Mv6ANACYkeKz7
	 z+BW5pgVZJluOb6nlK59/cBxLlhAaJIP+ZRTKo/m6RrS7P/Ngr02706dqlzE1ZHO+hHgJ
	 EM14351d3T6D+adGeWhPgg2qjxhaWCZWUpIILmrB7CqTkflUC2gJRCAaFoFhgbjB67Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zaLrPQqGhCHyL4V5RInTE0OtNu8pSLaiGG5NjxeuMfQ=;
	b=Oa2uIALFElQxUOtDV9mB/QkSlVYqJ3IF7ModO7dztQVkTTfFr6a/9BMGm7cOfOFfksCU
	 PRrc7t5lgeRBWpEXDh43VDglhufGqS2Xx+fVRfdVgQDCQxrOK2LiNEPAxFCwSwfnXziTp
	 oYqab3LfbkJZ9pBFrlH7Dz8MzQsk6zLvzZShtu+XxdxF5AYjgXknXyRLfHiOfPJ8f6xKl
	 xPN0SLStRjBnl5W97eLDXSry2kbXtXLBJYBc30befVAPD4NzJITxqW1LGyrVxCT8nU8JL
	 eO5eFwM7JOXe5yb/+AnlGR/P/zrDqJuFmYpnXlsJ1fBbl+/LcX4XpBsCepQfxyLWyWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zPckSfc/";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA8C60A2603
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AA8C60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zPckSfc/
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso12580185e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795194177; x=1795798977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaLrPQqGhCHyL4V5RInTE0OtNu8pSLaiGG5NjxeuMfQ=;
        b=zPckSfc/Gukj3zaAaxTNGkiGJTsl2RxWYFYBEwLI0CKsbfgKHpZeZnO7CnIA/I2h7w
         AnhCMO6W4drczR8jl4DTPL4Bn5Z3KbV+0tHMPYfEoOFnDBiL1fTn3Sdh/UNKakAqs5q5
         tLLq4zyAouY+UGrnCUz5lOywELaO7jiIcOA3QyjXCPo88nF034rKT5ZeVp/Q3/dK11aR
         MKMaCxt8U63VjywEQjugk0qOmn+/uxJqh/dksEChih2Mm4b6m3kSDACGAiOs7yxU0Y9y
         Cp/nbP76+Ii+qyuTNjxN1OBc7qQO2ZVfWzZujnQLqHkQ4d/v2FUdA+IbUqLG5qSV6d35
         V0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194177; x=1795798977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zaLrPQqGhCHyL4V5RInTE0OtNu8pSLaiGG5NjxeuMfQ=;
        b=DRhz97WbQkyS1kRAyqMEib3xT5hbgHdKDoxl96mrDJx/5cmxA8BMFHaevRLpdYxY9i
         JIYuXCEDkAi+MlMlTZBb+pbRAs3NRY3LiGi6+bbOchuDJirChzbhPlBs43Znfvyjo0wa
         DG5E4AbEQ9Omhr3H08tNuHdgeJlUqpROMDKSvYO/6KTw9AfMdyPljvDYWBDLXksO8ZSQ
         VSG1A408YZ7whKEcQeL29uZjaMd/O1niaAnlEjSOLKBMDl+Vj5qHdSxZhvS7ynYW3G/X
         PMdU9Q6m2YW1gmPCB2UCJm2qtalS+kj4cLhQaTY1RmVMRrxrLRGVyMUrHC2/Mj+NKUAf
         aDsQ==
X-Forwarded-Encrypted: i=1; AL+hErEUU2vm358q7FkgY0JPLnx51rlPwFFs0Sg2C0aiJ1lYfu/4K6u/p7joPhZPgIwPke/UDglCDMxFFgHAG7I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8Vj38J12VeY3sZLCHLTcn/0y3HeZ0LZ26dPjowi5L91IlN3Bs
	TNvxCcHW4fpmmqJGTa4WXGxnQm6S1RVTJs1KOEtUyQtjyOjeUBV2B6Be
X-Gm-Gg: AYBFou1yaE8GCfsL2y0uON2LI2HOJP/kmjcTGVjn8lI8RAF+JCpXwQDz101mjVPC3Ds
	3RXLa4SG2oEOeR3PLmJfHWkPun5dBsSAsI9YGtUusBmOestEkNyvYHLPRmbrKmmDAR5PMWnjCts
	sfzMOvvHx0MG1lUBH2/Vy8PNnHzysHWdg99JJLQZoy79SpReaV/rFoNUEW4LeKNv1Em6JqGrwBS
	aF6/tbovK/n0BNf/Q5HSrvRYu6ooMT/nzQGunbQio9oCLCH/KZFf1FRDnaSsqut87Flqf96k3V1
	rQ0Q96CKJw6HT/eOJIHATT4yYSRHberyKxzDmY48DVKfM8j0aDGtA805ayFQlB0PC7zN5/QtzgO
	3H5zCJK/fUqbjrJjWK1GQePb8JVhW+p0+8//j1FRuO1srMbM2OjnpelnjHUe351BSMZGedWTz17
	45LtL1AXELmz3ZPLROdH4rUh7aFucynYy7OoIeQq/zQS48vh321pcPBVL/7D9mc7p0CVoezY5Wx
	yxSOdz774WoaSShp7I1w2FyLTGJKZ4EQR9wCsBiSx/obfKxrDNqZmnmTUWSv20sob23UDWJV1oI
	0uHwIyAXlgGRjV0dIaCSoRVgtpoG8NraW19ziWnm0xIVscgoS4U3WtWp
X-Received: by 2002:a05:600c:37c9:b0:4a4:4d57:8487 with SMTP id 5b1f17b1804b1-4bb887fe7f7mr74757575e9.5.1795194176575;
        Fri, 20 Nov 2026 09:02:56 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm103258085e9.15.2026.11.20.09.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:02:56 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v3 3/5] wifi: rtw88: do not drop stations when collecting them for an iteration
Date: Fri, 20 Nov 2026 18:02:55 +0100
Message-ID: <20261120170255.375054-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120131000.33858-3-luka.gejak@linux.dev>
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

Hi Luka,

> Does the driver mutex still pin a client that has already gone back
> from ASSOC to AUTH?

No. I reproduced it with a small netlink tool that clears ASSOCIATED,
which hostapd never does: rtw_sta_remove() ran, the watchdog still
collected the client, and deleting it while a test build held the
collection freed it in mac80211 without a second rtw_sta_remove().

> Could we skip stations with no si->vif while collecting them? As far as
> I can see, rtw_sta_remove() clears it under the same mutex.

rtw_sta_remove() does not clear it today, si->vif is only set in
rtw_sta_add(). The client above was collected with si->vif still set.
v4 clears it in rtw_sta_remove() and skips such stations in
rtw_collect_sta_iter(). That also stops a firmware recovery from
calling rtw_sta_remove() a second time for such a client.

Mehmet
