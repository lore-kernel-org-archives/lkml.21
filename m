Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795214849;
	b=X5VSf1qe+pJTbtqFFLoeqGWSLXpW8R0qEvL6Ujtk8s4FgGYehNSLtg+CY9J35M3122DA
	 /G3ROI+lV9hdO+Js5rCItcjJzx0ZSdbPP1niZORll+OqNr8ue9BLjSI4zCamjeFhnUw7l
	 NjjBjb673y86AxG67l0Dn/675LdA5yWU60eeh7H1BGY7E/wd2ElrzHD17+gx1sMuuATXv
	 qWLWpw7XYzXiWeOUxIVEdWSEFirE7Kx3BFFDE4/N8YRWTW3IJq2dw/Pm8GPzzPqzbA9MB
	 vJxJWjHQ116TSz/y37nraO5PxdliVdWpSboI5WQndP1+LGw2RNgIx9AcTn5+nQkuBzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=hDktAyyJAPG9jc8GPRxfEzIEA8i6qmjQXTURV29xE6Y=;
	b=DWBsQYiu0Gwi66xDV8GK+OYUlFGARazu+wCCuoGS3sjIlamju7ypU9fDpNto2Dzmb5v3
	 Tarv7S33bj/VaBFIG3LCUInje5wcSzsLG+EQtYLVvmaXgqHhdF0urgFNJAY9fTyAC4DCT
	 SH7TqqJ5JB8i5Rc1gRKoyfURFeONSqFeHgMG4w79gEVp2O50GETKMfqY3lrziu9jgRmK4
	 ilVjuKHbF/gRPURsWOQNNKxIChz3zVS2QDkVXxd+5RoVJm1dTH7WqH7UwmkXlYAHhoVLV
	 yNSbHPyEHWbx0TFkFWOosrZE0i8z6+VL06ilbEpOvsDKNnRS6jI8UffpIa1GdtFtVYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YqI6DP+3;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F9260A2628
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2F9260A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YqI6DP+3
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e3b22e971so787959f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795214847; x=1795819647; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hDktAyyJAPG9jc8GPRxfEzIEA8i6qmjQXTURV29xE6Y=;
        b=YqI6DP+3PWKjWwhrVSanSRfoeCtUGdxyLFN0q3WF6JcLPvi/aGITEW1BCBWNIWYDe6
         Hn+L+vBVQ4WjLXv2V4SsPm0qUF1cmmGYAyMip3yyHdLdRPVpTI4m3DcZpfEn+JsTCBTp
         +u7nZpbaKaSU/FkE3IvPShMxjhhBKeDiBhminR/33hzO0JsMRF9Rk3ajRpvRrH+vq6y5
         t/C/0WPgnuT9Rj7IYbKwNughO9V31PjasVWfo2npVPrnCTaOHO7C8QQj1KQYKZyFAOEl
         BqN4IWnY1uYgltPdSKMfzbab+vJZca6gVuoaVApUxSxIP79izKHooXtSL2bRMMI5jrWE
         f7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795214847; x=1795819647;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hDktAyyJAPG9jc8GPRxfEzIEA8i6qmjQXTURV29xE6Y=;
        b=PA/ttc1Vlb9Fjmg5SWJJIY/KaAlyYshILOwxzSUe/2teyyBtGr2VrFpsYcrWKzDo2T
         zyigg6Upt83/p8+4l5Nj50K90Z555Fjz3nPYhj/amnNRRT4bFlOPWw76xXda2IJnr2oD
         RrH3GU3yjC6AlohoYLpotEFQorHahbswSbgZiHYTsEq9QnAK0PUOTRTBgzUqL2eqCrwY
         UVDvJWljK3QFS13vXz9VIDQWMvhmZDzWHPzYPAlYY5T1yXq7N3fi+ThRn9bltt+65OMt
         RGKwpYXuyI4dKBakmGmRVy03xf0ipNaLvwN/Cl7pvPO9lOKHOnQ9l80dHE/dx4j91gyn
         Zxag==
X-Forwarded-Encrypted: i=1; AL+hErHD4pNF92bHlQnoFwKSeI5nyp4ttAwg+/4JfMvJPYie0nhuXOaR5nZxbenJ2iCTCF6ZkxhJxWSuZNdCQcQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/y4RnKcSpGJ4fu4lMIjj13LUmz7kZ6tz8KyFvEfUuWppGCoiVM
	iJKXzmtL545Y7sfe/7atjDlgY0uHBNPKwLqcY0wYTyJVzKSxGT8Inuc=
X-Gm-Gg: AZFdTZesEgbBe+qQce9oNgEWfP4jvaf+WwkgXoeb0Os3qHBiMzEPfebjRJaRI2LNIuz
	O0EMcjSayfUzCkck6DFP6lz+FA1jPpbiMuQ5LYG84p9/MI/QCcRrBHumPTQRr09O9yT6VDsxQuQ
	pvXNe7EF8HxkX4k67pcDlm0Olh/yVwea1zGTHhTJbEnysedT/54SEgl6aExooimfwYn37xcmX/L
	l/6KiLtREpjxXgfEyWYC21e8emT9bvDComa8N494s/lqsFrhGaaO3IcnRTzsqpTjTr72+J6SMV0
	Br+lXCFnJAYZuPSf7+UtPXQpKLiwDwhGq/ZB/gyadzrvGN6N0PeFrPoa/sswbe7QWDEcOOash3R
	tq2aIXOeeTX+hZHv6BAuzlRlcDeDURT3t33d+22ePR7NtT3Thr4XTIPXoXfwKH/RWYlFsr9U0pt
	/orTmvUP9aV9il8DmASEg7LJ6lfEHy2e7Y5kYspNAgWn2o71fvLFDXfdIizhSGJApXGXayqrBEU
	mCTg7VGThuJ6BCJGOii+OrGB9jK5/SisDIF74U9sGu92HYYea+Etgw2icTwhibyvGhiF8jptF31
	8c/GCiyX
X-Received: by 2002:a05:6000:4a0b:b0:4a7:4efc:11d0 with SMTP id ffacd0b85a97d-4abaf740155mr9169550f8f.12.1795214846879;
        Fri, 20 Nov 2026 14:47:26 -0800 (PST)
Received: from debian ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm8148705f8f.49.2026.11.20.14.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:47:26 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 media] media: v4l2-mem2mem: cancel job_work in v4l2_m2m_release
Date: Fri, 20 Nov 2026 22:47:25 -0000
Message-ID: <179521484597.972404.10406015135695575425@talencesecurity.com>
In-Reply-To: <a931e754-ab4e-42d8-8555-9a432fe42a1e@kernel.org>
References: <a931e754-ab4e-42d8-8555-9a432fe42a1e@kernel.org>
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

Hi Hans,

tristan@talencesecurity.com is my correct address -- it is in From and
Signed-off-by.  tristmd@gmail.com is just the SMTP relay that
git-send-email routes through; it leaks into the envelope sender but is
not my identity.

Thanks,
Tristan
