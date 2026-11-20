Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194206;
	b=c83B8PUPUPsC/IZKHPfYAmOqVT8yUfqxGmdulFbGC5Fbd8Xlm6o1ukPp2FtvzUcuX9tN
	 HYxyDhY1h9fMqWofPk4xhrT6PaDzHcf0PjD3sL2xQcipCgfiA2j/Ju2OZ1JtbWznbrfPO
	 DOSiNCdafM+aIikEVl1dtXxXjsu2b6s0hrwZBJSWWqlYE8IFXHvEAzeEgd6Zg0YHKM5T3
	 r4yHmnQqIEm7mrVzCP4NHTo+y8Y49lH9bXsZw7fPWk6/D0RRj9FMbhI6IW+DXzkLJ22F3
	 tbDyk/HWkSEGw678WkHcV/L43CXmZrq41L4iufMZH4h68ZhrrJh+WQBQHjfyLc7+Bzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r6uSRZqIL57UK72bcNqqu1ABAmOYAhrBf3M+ZeDZmZs=;
	b=xxhoivCmHoCjPSFB5pOK8rBXmZMY1GMfWIdJi8glW5d8WuaT3hfGhgzNaDl35jeab2Km
	 1IjUVmHBIC5POt9+FElvAw11A98uCmF7zA1POojiQyysRQJzXiVkG/Co/vpdjOe4YcuYt
	 4H1Pf7Gr6oaw+GG5VxXh95WtBlvNCavUsfXT2wNphugvOn0xYZlpJQwh/PuXtd6gUhJ1X
	 6OivHljOmcxsmqhhrW9PaG1SbaJ9+FlwQlLjfnuI4PoTJ/B86/K5TFs77c+R/Z9czVkEB
	 FSxnV2H/SpnqDStwQ0MKNDxveoB0LTmsEGiiY68mHd8YvV3Y4cfXZEmI3UeUl3t2l7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uswgotb1;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5854606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5854606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uswgotb1
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so11357865e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795194204; x=1795799004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6uSRZqIL57UK72bcNqqu1ABAmOYAhrBf3M+ZeDZmZs=;
        b=Uswgotb1vpMIIY+cv3aw1m5pohAcxOB/t0T/jSPgFt9SOkzYv7XaT7b7c56Jxu67+d
         QK4XYLOi5jUf8ZFJFB/j/me30mONakYngZtQxD1PIdTtTPJkqvZH9RxSO8M7FJKr8035
         Zd7fEuFJGedwBbH0U/3GJrWqpkYFfY+RmxZu8qhlkCjzIcTznZXIZg918gsrUcnvQQET
         poQNwWSzqRZoJJ5sWFQmMCstvMr2ZmF6A5eZ0i6dDBlVCJPooBsAkt6q9k02K1lxnhv1
         V7mb8Yic8MNjmBrswXhF3tHB4qsHU4M0RCLOuc5GOEWHhr1Jl3D7TXjKNqNYlVS05cEe
         tCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194204; x=1795799004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r6uSRZqIL57UK72bcNqqu1ABAmOYAhrBf3M+ZeDZmZs=;
        b=Uk33YNPpgLqiQz7xnqnAJcQNaiWfmb/z2gKNZ2uP5FqHvLuB/JkhHdYdd1a1AxTx62
         iVXH2xl9LH9Eq0mArupBlDrBPCmTEi9nkSXpHOIN95kk6ClSMrn0nAKSp1RiIgno+Dx7
         H+G1ejG/ZsL7BwhU7Ud5jx4wZzJ2N8myPi+f7hRihERossyrBDkOpcYobH1suzE2B1mm
         rf2716HE+erIABlLdnBpk7Gnj2gNgeM0iP4d28GyetpfEcEeobtz9+ak0HxiM1XjsWt7
         tKL2cKcAhZtXL5scio9BOjdHr6LvPis/9j9nJI2lFrvtOLfXv5qnTrmMG/8EBdyWq530
         9WJQ==
X-Forwarded-Encrypted: i=1; AL+hErHxgz/Jk0ncFEFKMkit6eKPKT7Le/ccsSg/+Gz275ZmzWlKf4JyDIfRk/gQkHAP1kO6c39kOwFMI4wj0tY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C+TelIgSM35Odx7Vm9BSlpdvbwlkdNcORckkE2yeY4pEzPwO/
	hBB5UELIYxWnyRdFN4cS9/EfEgkqNSxmyf7a0RDzDg4CbIyJ1QLjHrxT
X-Gm-Gg: AYBFou2hGw11nQkbrNj82bJ+saIWh+pImFjVeASgcejoxCdC/c1QiDnqYm95X8Q0KwE
	UlJpBkejXzyIxKXP/BOepB9c8cv35gOQZj9geP3/fG4UNy2cFcOUelH2b/5MFiunuC4+srhnrBj
	1T7O5d8MsubQkWmySXKdnTT3+gP0l5DTdadSfhqwDAlp5ZL7BlArZ6kKPiDpF1yc4UGSS605X3I
	123x21nLcJNNtACfG3Ds/sWh2ea/wt6lMmTKmhkTgbOHH1T6in4AF0TgXhBZtMcwBwS6tQ1r+Rq
	2yT6SYDmsAYh7Lxv5ka3Imf9tqYmOkJbzMXwWIvGjL5rhmFeujAe1FyPfoaqyVtcvJWTIpZ5TfG
	kjpXntXiPaqs2ADGvA0SK74o+UDSnrMVL9hl+h3Ug/KK9LcNKw3m9BslbiF2ij/BAOc7T67ZQLX
	+LGpTZfO/+eVMWOVAnmWhHt+qmBXhmKqi28d5ThbLQ0cVw7ak5fz6XT8kSMfSAhK5G8MJS1GhnG
	wMYI1sXoM9l8CLvMfw5PXARaGRKDxnEfC9t9Yotn+or/ofCzfT+T8AMHu6WUNqoAPbIdubzEDmK
	GGWBqzd11sW+tC6fyHm4uXO44aoniIaT9Fk=
X-Received: by 2002:a05:600c:a087:b0:4a2:5267:3cd4 with SMTP id 5b1f17b1804b1-4bb887c9fbamr86177205e9.3.1795194203876;
        Fri, 20 Nov 2026 09:03:23 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm6239126f8f.26.2026.11.20.09.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:03:23 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v13 2/3] wifi: rtw88: support channel switch in AP mode
Date: Fri, 20 Nov 2026 18:03:22 +0100
Message-ID: <20261120170322.375333-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120141554.68116-1-luka.gejak@linux.dev>
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

> I think this can finish before the last count gets a TBTT if the work
> runs a full interval late.

Right, at this commit. With a test build that delays the step at count
2 by 150 ms, count 1 never went on the air with 2/3 alone (0 of 5 runs)
and always did with 3/3 applied (5 of 5). I kept the TBTT pacing in its
own patch to keep 2/3 easier to review. If Ping-Ke prefers, v14 can
carry it in 2/3.

> What happens if the page can never fit? On RTL8821C the driver has
> eight 128 byte pages.

The switch would stay pending, but hostapd refuses such a request
first. On an RTL8821CU at 2.4 GHz a beacon still fit with 778 bytes of
vendor elements, while hostapd could not build the channel switch
request above 586 bytes ("nl80211: Could not build channel switch
request"). That message carries the beacon and the probe response
twice, before and after the switch, in the default 4 KB of
nlmsg_alloc(). No chip has less than eight 128 byte pages, and an AP
next to a station interface is only possible on the RTL8822C, which has
16. So I would rather not add a reject path that cannot be reached.

> Could we retry the first beacon download after the switch too?

[ ... ]

> Could we queue a retry for the station if this refresh fails?

Neither download is retried, like every other beacon update in rtw88
today. In about 2360 kernel logs from our test runs, a reserved page
download failed only in unbind and firmware crash tests, and with one
experimental change that is not in this series. I would keep both
paths as they are.

Mehmet
