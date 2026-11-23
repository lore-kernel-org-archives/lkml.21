Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475647;
	b=hzGh4p1mNqoaPnUG7PSxGX0ocYHA+JSukj9GA7pFpUEXtt2vYKWxlBv1J3ejolQoYhY1
	 C2MEu3HU7DV2Nm6/ZwKByIgpGSdFCGNmwnyJMRcLu4t0QF1xqeJEBvMquKcsioCYPHDMG
	 945IXigub71T8Hn20hEBEGjfy56Eujl//t7zgG8iSzDn3kRI7M3jY0A1GIeUnT1S0Itxl
	 e4L4lr8v7w8oO0X3b37byuciXMgbUhpJINfI3XdaMCRaF55ZMMI6c8IazI38J15Gt5IvC
	 nRAb68GbTlXrjX/OydodYA/xmNPiAXEbfjwqp8bi8BzQV2Idb8ILPHWbWHYHgl0nxrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C6KwTsLrlwsaKBhMU0WaohccwmX6ZHQZDknXs0RVOoU=;
	b=UVf8NrREZHCyQ5ywWIfh5VAWbJ7eXipaT/3XvMyilSVm747U6zkiR9dpsNuColE33xzQ
	 /El2baCZd1rJ4tmnW4h0DGEGXoD04WC+9VN3YYF2CfwlfhgsLAVgTJvh3JmuWkYPM1LWE
	 5Of/rA+f7rM1dN6ecH1B83TnlVzi6MBUmvuYd/oysLGlBbjan7jNpxlM5i8sw1dU8D9HD
	 mnOL+RdveIkrJFnhM5dLIIBO96ElL9W2+0jR3cM+icWQa6m3IOJ/8SxbT7hMCV1AjTocU
	 XYoH0eOqinQ/tQzrpL3maoT5yIn4hse0b+HD8Iiy73B6j/eNCEpESiGRQPkOcqP+rHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cIpCEZ88;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB383606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB383606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cIpCEZ88
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f0426a65e0so25252625ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795475646; x=1796080446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6KwTsLrlwsaKBhMU0WaohccwmX6ZHQZDknXs0RVOoU=;
        b=cIpCEZ88w+pQmk+ulKPNTfEnMuAxP6vai3E0cBlxkiM2J/XApn/czsHdbN/aKXPTpP
         bWvDeKqOnD7/e/v0nI+KHfUJKLse1HTOLUiwbQYh3iKGbqlsAmPiyUcyKKppy3od8g5D
         OKhjK1wl3q21YovfcKjuBmTpRWD5BBncvPZNU4/nIcQUo8DsWSQJiz6d0R86DXloYb+8
         cI0W47HT8buqyOzp3R7fy88QRAPjDyIU0Mqp6RI0vXG5nhoWc+6rLInWYNmkdjywMrYc
         yyoGJqEkURA8VOIvXYIx7n6qeySHwi6sVNFmcRHwlAwJjpjFcl6qiXD5Lr25g4XeJ6ZV
         AqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475646; x=1796080446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C6KwTsLrlwsaKBhMU0WaohccwmX6ZHQZDknXs0RVOoU=;
        b=Uhgq4qqnLv8yA4lVfJKqCMNlemnA1QRTcteMzP7Qh10naY/laVfAaxJN4yg6buogX1
         88Cmq4Mb3uBFK1pkgLJBdTeHez7ZvS09H9KMwMgM/eaWIDppFPUbwlGFbtkIL7UJs25C
         4Yik8yrGaWiEEyTiu6IJ1lUB7kc/L71Ffdk7KZtnfKPlTutSPH98XWQJrY1W/n7dlmUr
         sAb9U6J2OmtiYdqVNuD63v7jqvy+s7mTcosSFbck/lZRtZQ+Y13f+qtilyDA6sfEkeWt
         LNzWIbM9PkSwwD+O2mhafIy4WAnYjYPUVpAaSHjsFj/KWnHouM6GlIcQ7WZ3UW1juykd
         ybjA==
X-Forwarded-Encrypted: i=1; AL+hErFINE2RXigBacyoNSlWqXVhIJaxgH3DIFe/6IBROcjhc6n1CJk4/1USlmneHpVm/KZHs9qVqQxqN/8J9Lw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m7ksXWRsP9dHgODdAfAStBhyjsictwICgKk99RszzYbtDc1yw
	t4qjxGSm1K4zSaTkGmR2td5ZeKfpG9w+d/Mt5iVi8pWEfy9gMbBr5LD+
X-Gm-Gg: AZFdTZdviWOwyDLuLa4lSUnQ7nv9pLY9P7tqHMfw2HxEQVVvLq3XFB0gIugzQ/BMlnZ
	gVeL2ROx3ZjiffczrbH1UIagA7r3D0O9TsICfFmGfrPkL8JkSESM+1/yzKPFF4KtwBYz2zUU+c/
	Qg4upbih0NuNfQyztiKjnau9IPZ4lscV2pINC4l3PyPqS7yY7f9oi2CGCEcJrDf77k9Cc3drJwi
	aTr+/DzT54lKM9p172ICtfHMzeisBmT5xVHoA5njYqmIS2PeqbGFzD7yL8xnX3r1m4wiMJY1fhi
	w98WJlh0U6qLnO/W6mjTSeWN2S4tSk/kx5eaYPmDoD9AsLFyWKyWXw6zidya5dNWHEra37vkWOR
	2u4IwWC2n5K4O7dCzLgoQXaprXKrbRWhxk0iQX5a7e9lbTRdbXENa/hMgTar0AcWeh2Xggc8/Or
	k2tGMjV/9IJSbkoD8kJYGAxe9gytEUk7AZtSicso8erGTSEt4ZGlR4nBVZe7PO7ojc+rhFmFblC
	G6p/r8S65qQs1R4XZfyTsHdMBFsTHpmSFFwNB+HUM3qu16w/FmCGZSlmAreKkQEx5BZ19Dt95zL
	vy1tn5Vs9g2yK1OfRebOItg8v0M1419/SIrAhNGoKxOuwJLQeFvoO1p7AgR1
X-Received: by 2002:a17:903:acb:b0:2f0:25ea:8fb7 with SMTP id d9443c01a7336-2f03f0c19f1mr111523555ad.3.1795475645821;
        Mon, 23 Nov 2026 15:14:05 -0800 (PST)
Received: from X870E-AORUS-MASTER.kkp-group.com ([2400:4053:d960:1a00:9970:cbea:9dbf:d448])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dc0ebsm58140215ad.33.2026.11.23.15.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:14:05 -0800 (PST)
From: Shigeaki Asai <asai.6265@gmail.com>
To: krzk@kernel.org,
	m.szyprowski@samsung.com,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] clk: samsung: exynos5: fix sub-CMU power domain attach
Date: Tue, 24 Nov 2026 08:13:53 +0900
Message-ID: <20261123231353.3288426-1-asai.6265@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ca2615ca-7483-481f-ac9c-cf64054ec0de@kernel.org>
References: <ca2615ca-7483-481f-ac9c-cf64054ec0de@kernel.org>
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

Sorry, I missed Marek's series. I didn't check linux-next and the
fixes-clk branch before sending.

I'm withdrawing this RFC.

Thank you for letting me know, Marek.

Shigeaki

