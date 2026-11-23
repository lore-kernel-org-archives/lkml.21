Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415639;
	b=z8DMNunklkqZJtosFfgWLqqfKTbI1nm0pnIUsMPKVstfiurnBLUlq1/LM/q3afF8w6+A
	 YXnl5M7p8zG55SuCBwgZGZr7TzJyGKIeLXaGPGp2I68Erfuk9BtfSMqgBGDSdAbgUJRL8
	 gUv5KgZM3IVJtFPfCbYADu/+Xc3xhnPWZAjsGkkYYQ6LJkRw347kCZ5tTiWF0BaMLXjHK
	 TS6rA8LG9ueHBNujuUXWTQV5bZeSUCdkEzzPEQS7qdmwm2umpLvpYYumDfaohwxpXJdEq
	 bIceCnorcshZGuiUdYkMEz1Tb54jpj25hLxh70rpQbWMBq1HDnSYYzaA38dDIxYMcoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=R33dPDMuza4ECLYFcFANy1WXUDU0B8B9euDHWq09YZA=;
	b=D+1L/+Kc7Fbxb76Ptfk3Wc5XBTCNlE/Hxnj589ANa/qMp7bXif1vXPnf8W27nIqI5G71
	 zJPsCwUcAyJotZ8u/kmPhmTvdyef+J084es/AkR1gX/+g4aXCr/3f77sxwSdzyhpkFqQp
	 o4Xyc5b5T4NxQiCwyqLFNvi6Q9RyLeZdPJiKGvJNXxTTG1g72HVDmyNbFbhuxHAfCdVRs
	 mLQzFLIVL6vlWiY/u3vaOKQfi9yYm+xwCJriLrDN13fR4RG9CfpxhmV8qX842M4MngK7P
	 eUgRPUr38E38uWm4RuNeAwQHt8e52oOlnc3Coume316Pm+SO6Cc1M6UeHRvpljgC/Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uEqiWOsX;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D75A606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D75A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uEqiWOsX
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f03f3631b2so15441735ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795415638; x=1796020438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R33dPDMuza4ECLYFcFANy1WXUDU0B8B9euDHWq09YZA=;
        b=uEqiWOsXnHL+ewbkdo7xIx5r1ZiDVhi8BkQXY7iR+QXmWEwfgpRUYFpXHagHVYx9ur
         AUCMJv3qG+dGBHgtE9VZTNQ9pTI64ButO0XmSq3/yTH4zc5P5PFyPVGxOJVXyLpsVgYo
         tm+RlvnKVTW7BJOz1jx4YyWKEB+tCZB0gK2QccBZmJHnrzRFNsj/m1Rp+wfRe1fqPYFR
         wNAQRa8aUmzo5I/RLA7+gTw2vXyhias/qpas18aYv4SbQZF0qCNgV3hW4+5YOISF+B0j
         LF9qo2qs7+DTSKamehb1dKg5/DD9tCNmqy9q6VJE/O0zDRUmlmdkPLWaMZP0blZI+AFp
         FN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415638; x=1796020438;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R33dPDMuza4ECLYFcFANy1WXUDU0B8B9euDHWq09YZA=;
        b=Dz183LQLj+DbI7hETGCDVpt/xXIyA49lyJKUbSWpL95kwfDOZpORREbCzLxdKOmN9k
         PA8xnF+RROZRzm6iS6TreB9+eW70dG2XfR1E8sA51OAtp+0YeS8iOIQ9Udixf0FAaH6M
         xYPHXYdwetRWb/J9YFQK4m4w+jTqjX7WLb1dgLWzwinUPH17pzPqh7wBCAWPsG4iJZ9C
         MsJcSZ55lSL88hW9MHPDbhXy/RBKIoPt/olLesqQVLKilI+lZvU8Wzzhd+N2dxdeGVRL
         FFsbA2eHs3pQapewRcCZREFIeeu68Kf+n7cQVOfcu6wCsgnSXWXezvbYZF+/YRjIVdNA
         N6lg==
X-Forwarded-Encrypted: i=1; AL+hErGV0uDGNwAk3UDzZh67SsjD27mklmLhnSpvAKuxL1My6lo+C1jKqktTU7Ym2scjzB/BEHNOsmwV9ZZjB5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Jxdc2edH6esKy7q21hDAk7IS5OqFI7W06tspwAdTCNXkmKBD8
	0RdGeU8wWIaOfmsxmewlA3I0L2o1a3EsKX84RZqjDLsA1KidEsRB78iJ
X-Gm-Gg: AZFdTZeiERaELDN7422gzgL9vp93g4gknKkf0snn80Mh+xL4T/BsxM1v28gQt1+eGwd
	xVuJsxa2QUxEy84jLC1Fcm6PXlUgHlbiXZwbc8GLWS9MFAYA9ENs1S3IF7cuFLXzkwcybOZwn6b
	QqFIc3y4m9DUB56B0b7sDoPGxanU8SptKzpgOPJ9cQ+YWFoVSaUG0MaZWgE4FpC1t6pco60Fl9r
	hU19gimPWc9BSTEjPn4hHl4mouSNWHtvNqDdkXIMAvehOLIH3R6+OCNOsVqvC78gqx+IM+pXCrl
	UOXZAxzO9Dgqa1n54T4Hw6cseZimtvmGsbfn39Xl1btVbu/tuo6UElhldFQL6B6UZRpxJFH7d6J
	Hb1fU+kuIgatw4BWYaKceSOdp2S1BbmtXCv1M312vsfkd5/paXQM5Vma/vHgQ31ycnCCuzheX3T
	HhrLFHNI8er4HhGxS00zGO0709c5I8D1aO6kclaywfeVx3h1OxgrvGa/nbEboVdioUoo/IK0P7m
	BrsatEEhhl95ck5WEn7k6ci+8+/hhrgXkZWgyZNWrlT7MGBPznhDC0942qozKOZETJtC+/mXMGT
	WhSUk9GYwcSezjSYKrZq9ldT3jc9+ldXIrUmX4CnkGsO+NgHxzccwcM9oM5EJI7dYOcLIRc=
X-Received: by 2002:a17:903:19cb:b0:2e9:821a:5527 with SMTP id d9443c01a7336-2f03f1d85bemr94913765ad.12.1795415638290;
        Sun, 22 Nov 2026 22:33:58 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f122548sm47173495ad.66.2026.11.22.22.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:33:57 -0800 (PST)
Date: Sun, 22 Nov 2026 22:33:54 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jaewon Kim <jaewon02.kim@samsung.com>, 
	Hyunhee Kim <hyunhee.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Pankaj Dubey <pankaj.dubey@samsung.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Input: regulator-haptic - drop platform data support
 and style fixes
Message-ID: <awPeS7mL5KM2swfP@google.com>
References: <20261112065115.1803973-1-dmitry.torokhov@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112065115.1803973-1-dmitry.torokhov@gmail.com>

On Wed, Nov 11, 2026 at 10:51:13PM -0800, Dmitry Torokhov wrote:
> This short series removes unused legacy platform data support and its
> header file from the regulator-haptic driver (as all users configure the
> device via Device Tree) and fixes minor coding style issues.
> 
> Thanks.
> 
> Dmitry Torokhov (2):
>   Input: regulator-haptic - drop platform data support
>   Input: regulator-haptic - fix coding style issues

Applied the lot.

-- 
Dmitry
