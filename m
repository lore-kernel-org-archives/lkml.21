Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539423;
	b=l/hQ5ztxRxEJy7+sArxmOQa0epSQR9nVZ1tWeX3tf82+DoU5OglrTuVw0yCmOmaGW2b7
	 5A/nGPLyGuHr7K9MvRJ+Hz3QK8/S3WmXqU+xqDb7dh5i7+TcS3db4v02wteL44DLzqlQS
	 HFxOaR4qz0H2UghaRtEfkDBugfkR6atOY3nU4Y4N1oc8vzAhKK0pH+xwFAgtCaagO5X6H
	 4g6CTSUg4b19S9RzkzotC+EST3Xj01yuaanF1ZHsAL5WSbYkNrkEY/Tffhcgqv/IaIay+
	 bUQZpN/RVlds1GeIiPX3HVaAxV10NPAVqDKPwX69js/eF7jXcZhabbcaEIO4P8n6vQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Q6S+C9lbO9lL4PpPSoKibQFJs/OKawueyScWrx79ojU=;
	b=acJVUET2HGcYiOEHHuiK1g/aYd9vPM93vyiXqhyNDsQL/0wsu2Jb1p3pyACUR7lgLuFs
	 6XEKJa3czbiB20k3KOO8MtFAxqFkcaUhf0fjJJzeb2T5Sdf3PyPcUhSsXGP1p5dRU8kP9
	 8LnuYZJMq5Xr5q9rXkyzhP+ObtZPZ9XGesjScaaxgA7yQLyHmmUrd9Y8csva3v5YaV3tP
	 bbCemDqbods2z/K4Lgsw/jObWyX1MWCjksPKjuYKDg6vUIKk/EMkp6dN8nn4atvWFlVtR
	 5TlT7x/umyhYj84sC5ugsybsFImphXxZfAtgW/m0JhAoCMFpE6nxzr1Oj5pC2E2Fk0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eN9AKtwR;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECB0606A329
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ECB0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eN9AKtwR
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-92107df3f13so46442816d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795539422; x=1796144222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6S+C9lbO9lL4PpPSoKibQFJs/OKawueyScWrx79ojU=;
        b=eN9AKtwRofP4yFvYfSB3nQYJlR2sd2N4zkA/z4xpQkwXpoERzr2vqheisg+3SCIgfX
         RKn9tLpAYs8qUCdx0YsW5aHSxIMbRFDBmAvCk3M7/dQk+EyqhCBU8BsGD5i2MTtc8swJ
         Oq2SGbs8OSaTnBH7VEOV18LNbaOee8WO1NW3DB18NgpFxrtobgF8Yd1pBxPllfBJLH6g
         u2kqY/86tDmtzFHTBLiW+6GfelSF9inpTyOsd5+VdL3rCBmLZiESyfKIAvTff1SP2Q7l
         UlZYIN7E61YweLQ4Br5n3NV89WSY0GVLAH+s6aBWfx82lv9mK1GvVBa202+EwHgT/FAI
         r/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539422; x=1796144222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q6S+C9lbO9lL4PpPSoKibQFJs/OKawueyScWrx79ojU=;
        b=M4L7Ch373iswfGZLV4DHgMwtX14u/gde8H7vu5/XDTRLSi7teQShTnw63G+3RcZ1mR
         WXj0cUh88p/2eHgvl7s394fG0kC4l3uK4zOtlUk9o2Fa/QPgVk8enfsbXMcy5n79Oe9K
         gBn/25JR8rAPc7NWkxTf4L1Kqa60Yi+WNG0mTSnEY09ko5DtryKXa/fpwM6JgkjZah3g
         mVcitTK/yb85NvvTj3H1ylcCsYR6k8VQNnwdQt74mv5hvJmV8UgNEIlKzUfwOUdeZUma
         Lw1/U1ASH0PABfC0v0jg1ehgpFLITJW7vfjjhEEeWw1lTQ8PWVfFxxQociC0F3z7YiXk
         WaEw==
X-Forwarded-Encrypted: i=1; AL+hErGripnI/RB0xe8EkP8chVtJpPBEHYrUQ2kkPKcdwoS0WYjTtOTX+/1Ud/U3Ot+FMgBy+NgfXX1xpCVXcJQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zG+uEJq2zUNMo5UD1icnqld0vSNqMe56pTSRS/gvZNcooYRik
	f+yhiui1Rdbmwgk3FbzEYyhTPQesaG9oEIiGEVW1WQTpExSUIKbd52ci
X-Gm-Gg: AZFdTZfpSppK/69ye0tSn1UVxJ8nuVf7694B5iMgNlOJRTJdd1XYjvMuqTYXbznQX0e
	856e3sxajGM8V+4lrw1fLR0Lnr9kXqEGe/gojLQsHhBePGybNcoeaua4bheBBOuw+ZYp8sk/23G
	ftw1vEYUTH35lBKIdTRpYCu69ITPgt9z64bMiFZW2i5vtzP1HkI3QhsPHrGgTtQwL+ZdrRaPQPM
	b/iDGbsMhXyKLbJ4orowqWM/N2LmNMDl76eeksU2rKPBzo7vr0+8v2y2cnUbrX2nx6hqdzsTsNU
	zdYBeY6qaW8xZi51Ye1kysJ+8A6y+a2vhkDGJSnTJs4b2nZOi8YAb6liRdSOE+pzuEVeip/pGup
	qQRM6a58IYQxqnKoEeuAVDPcva/cjOc5MEEICLC6djCQ1APEP3yvCRrfHHISrZl7n5DEpy8XlCv
	A0ZIRoBTPQJMklaxiHPJCwAAjqtlOHQNbw7vAU0rP+mBJhl+yHO/4BpxDaIscEn/4XE3y2tJrHR
	iZXItH89vy+UG9yx7qAUd7jPNJuuTs9pjhejZzGPvX2yg4X/GTaxAt7QpWndDBKn3Wi4CXpCKfA
	HDsf8ha+nCppZi+gO/Q8l4I6I4KoK7ZvXnQ=
X-Received: by 2002:a05:6214:4108:b0:91f:10b6:2743 with SMTP id 6a1803df08f44-92134b3ef75mr274765416d6.36.1795539422157;
        Tue, 24 Nov 2026 08:57:02 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349ee175sm142108796d6.26.2026.11.24.08.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:57:01 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Simon Wunderlich <sw@simonwunderlich.de>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH wireless-next] wifi: mac80211: replace the CSA beacon before clearing csa_active
Date: Tue, 24 Nov 2026 17:56:58 +0100
Message-ID: <20261124165658.266252-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <26593ae869ed222980ac78ac869bc2745d2c282a.camel@sipsolutions.net>
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

Hi Johannes,

> > Fixes: e487eaeb076a ("cfg80211/mac80211/ath6kl: acquire wdev lock outside ch_switch_notify")
>
> I don't see why it would be that?? Please explain that.

That commit is where the clear moved ahead of the beacon replacement.
Before it, ieee80211_csa_finalize_work() assigned next_beacon first and
cleared csa_active only after the switch statement. e487eaeb076a added
the "goto unlock" error paths and moved the clear up, just before the
switch, so ieee80211_assign_beacon() now runs with csa_active already
false. 66199506fb91 ("mac80211: split CSA finalize function") and
1a96bb4e8a79 ("wifi: mac80211: start and finalize channel switch on
link basis") kept that order.

ath9k already tested csa_active before the countdown since d074e8d54785
("ath9k: enable CSA functionality in ath9k"), so the window opened for
it with e487eaeb076a.

Mehmet
