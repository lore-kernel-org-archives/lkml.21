Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509119;
	b=LuXP9EwijMlQxC25k2FQkM0Zh/hhtl9ywmPSlAeZVSts24gM13RiqnZdYqw//9sgWSIA
	 ni0Wvvmm27mzmrRzn09G9fyWGfzV24uBR1zHVcJtVBrdp6fglurmzdRDKni90RniQaLxZ
	 GvS4aRA3peYwxllQvTcz7h41gQ2oyBfAv2uExJkXMVq30ZBF14ZQJj8vDosp/JwjnW/0e
	 tIlZth/dbgpMccXaGa6ddYrGo3+V6xbcBTdWoSEUDEt/aQnGUa8lwGvv1QlqRR2B9hvpI
	 KRBgDeDRYamZ1fGWdpMH5C2Q59HHF8hPCU+T/xg37L+qNVNbCedspo9TVBhF82ldOhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wgNX0IE7lrAHlNokQcYly2H9sy8SXHVjq0j4actrlb4=;
	b=Z4lTig6f0nTOe4wgZT/C0Hs3cM+WXRXs+cl2F/cok67zgV+DPco8U4hdzW4IlaI2xvVL
	 iYxE6bxT8rhdlzrKLstQBCrpDA17f7+V0OHTStuKBza2y/Ohg5y2qsiMy7e5Q08CFkslG
	 +HEQ+yf9jhOCOEXNvJLCGWzURJvD+T0XxtLLkITz0afmhRj+cASmkQrCG3PffjyHM3mzq
	 2Oj/j7toficI7V9nozpq0+rJsEd0TaZq0IYq5kLS/VTFpmuqm3qaNLuXFf3O34payX83d
	 8G0q5WTjpdeYZU//Uow4KhIQYjttapLLNQI7m1fOWNp5LUxH/KW3b9lZv/sSsaIq6qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NH6JinNx;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564F9606A699
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 564F9606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NH6JinNx
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492690dd5daso3184779f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795509118; x=1796113918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wgNX0IE7lrAHlNokQcYly2H9sy8SXHVjq0j4actrlb4=;
        b=NH6JinNxaWm/M6cjlCkLE8VSCVC2k0dlsVonkb4Pd+T3o8IKDWpbMdRKBGVUnQR4vP
         fDTH+16uF6lCUAeAqA+48pMS+rbKY0J/NyqdMUwUa6jCfSX8VMMQ+0cKJTyuqCehBrqu
         vcccjQQ1HGBzAQIgLsVDW80K27vwOjW36vKkGPSIKiN+T4QOYYa7zYgegUu01nX50eN8
         +f1Cq4W380ZYuXtZjzd25+7y50pWEOPPUnSvnSE5BNpZYRBGiydfnPJj8zFuS1jQWcxV
         U5CwaZWVMvehUkw8TSfglibHwmUP4fUztWtKKkXg/i+Of2qlHKQ69nw1quZcEpULfruz
         Y37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795509118; x=1796113918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wgNX0IE7lrAHlNokQcYly2H9sy8SXHVjq0j4actrlb4=;
        b=v+9xO3m3xA9N07SGsLqA+iY/vvn5TxFzcp0zzBJ78eIfPvoN/SLxzat+rvq5W0LrdH
         +xlbmNcCqdyAsCxn4efe2axy53qVoMW/F3bhv6lQQXXDCNCNv2RUl3SYjlnSUNQQvrYd
         Tr4t/BOfmHRLU4BYKL02vg/w9GKDy1cqJd/jfa281I5DdBk83x/LmBWCTlI9sxfBYhEY
         cxDKzzEumg9oy+OhMVeL6LTh+T9cX8aDw+2vTCziqWiK0H2UclQC1CQiSouqcPlOYpNc
         cx5ASKfz6Vfde96Gdx3oKMeS2YtW8TfTUIiKxPXroBubGFKoNEtkinnqG0xMJUEn+Okc
         igtA==
X-Forwarded-Encrypted: i=1; AL+hErExult/HTAIH9RibvLbTcDxKjCLxlS0NAC6mRUwGgCVdjM1ehxr7l94T61WNTPvwpZnUzc29L0stbq/0as=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oo4eA9YXf6IP68uyx4gg1cIUwQ96VEPXQlmibzClzl8pf7Ryj
	RZXH8kFgfXVHIS/M3qNns2QiVN8ifudHl8+MJECc2Hge1MFR23cqeWARHebuWbW8
X-Gm-Gg: AZFdTZfMtK82+ytsrzmCw61H2oiydO6OWVyGRW48SsV5U/g49nbQ/WX/03VzNYaX+vT
	aUZhmRhDgaV73Ch0PJ7HA9hoe+xwgAcpeoz+AkFIU4d3JzQfrQkIrsONkluFJS5nhyz11YXA/vR
	heDW3wVnAymq8KlzjBKCYA5bB2WSuBXotpKCOaFh49TmxymtZ5bs9CnRXjtVuu4QHFAbJam2MRx
	Vke1rG34KZrHuO6NorM0uScI3PKRATy1HY03fU/8K8bgAO4jLAfpLuJLRZQbYhYkazyd5r6rANz
	sphNwn/t9+XfArvLJ8tYGb3vKHbzEJtxDfgyGccD1aVHSPe5TLUGgJ1PZWmCc+KVZ70z+n3+g/8
	0qi17y1ZLxo2UUM/fI8Pl6INXN/Dr8Tg2R9k9P9wTqwXrny7tJktKAo/LtQMHTOa0BE8TTC2tfE
	g9HuywVV372cZa3msvJgUFo044betKw+epn/6xuQVD7xfKJsXvtugTHgkblRRWm5oZvsxciBeRt
	5SuUG5c52WjVf0XryFdw0/nCvQhrk+8fHDYJbypdy0SkobDXpUkwhWc41DeNTV7BT9kONhRQxaA
	1rXMzCcZXDU8Tize1ybKZy3SSF1Ux3iMGEM=
X-Received: by 2002:adf:e19b:0:b0:49e:f905:4698 with SMTP id ffacd0b85a97d-4abab6de682mr26643613f8f.2.1795509117340;
        Tue, 24 Nov 2026 00:31:57 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm25681121f8f.56.2026.11.24.00.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:31:56 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v14 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Tue, 24 Nov 2026 09:31:56 +0100
Message-ID: <20261124083156.206506-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124002437.213112-2-luka.gejak@linux.dev>
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

> Could the wait for the safe part of the interval use a finer timer, or
> could we limit CSA to intervals the timer can reliably handle?

Agreed for short intervals with HZ=100. A finer timer would not help
much on USB, where the download itself takes 6 to 17 ms. At 100 TU no
count repeats (model with HZ=100, rig with HZ=250). If Ping-Ke wants, a
minimum interval check can be a separate patch.

Mehmet
