Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010695;
	b=tCivQzI+PLy6MhWjMiPKFvI44dxjnjZ3XnEB9lCC6pHLAlBp54VoeYT5IcYo2H/KPFE6
	 hH/HWu8cHqSn0XtLqPV4boF8tFr5SkwX7pDoX2h2aLwQz3SJ6mJOY8eYJhv+u337HsGo6
	 KKS3GY+7H5/dq0VCVUJCyREOHzkbI3XVQcJGAvIvWAx1596JyGmuYUr3tTyH1KpcZYp2f
	 zmmsR5shr5dVIx6GM0A5cjXNQPYk9hqpEifaZ4V8C67fv3xTJmE8jjuFp/v6cscv3L2GP
	 zZxI8cA+bxYtp6jCRTp0VCLsXD5palem0zLRykqVO+5fit0ace3AIXhb2iD4RJYC/rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=mh73tfK9sDn7RbbTRMru9Vf8rP5PE3uqjzcCQ7dBz0s=;
	b=TFjwKg6Ntu3/aW1DeF7+UOI+YTLHQsQSBR+CRAWMKfW9Tr/3uBFvBSnbs9BRU1ak6lko
	 QILohlGjJVgoyqhTr1r1eX35y0GtU99gqyO4ZxnON+d8iV49u7fyMEYMszxVaVpJ43ID7
	 aT3b+uNv8LhvSj+3rkmfr/q3BNOE4rOjo3OaWqBt1vUNCKTvnSNZeVZqx7/SPmjqynoRy
	 /W3WxcX91rWwIonQSQ4nEBr1HH4pcGwgx3ZuWMYwViYyBXFW+e4+c8vfOiNuk4gVpoFmF
	 cxwdlUCxDaVcjeEsG5vL1rw4Vnud+FoU82isQFcGMYtr31n0Ie+17H4JPDeO87Lpsrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N24soTvd;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE83606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DE83606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N24soTvd
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so10680085e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795010693; x=1795615493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mh73tfK9sDn7RbbTRMru9Vf8rP5PE3uqjzcCQ7dBz0s=;
        b=N24soTvdqlDz0PGGx5sxSUmVDBiBTW24zhrE+/wkAtZvRc7gEspfmX/lQV3jv2fAdr
         KLQuvL3HWz/HQPe0+gkzB7ITjoaPO35TLI7C+z2xTZKMLs8URTCMBDuCl2BnPdwEB5YB
         yUTmb542FNa7Q2nPm/44n/qYllq28HYUCUeBDGpuNvyH2mAsTy8/8ydF17TfeA9w6TQc
         XnsoxEtJseUXMHx4bkkmHwY6BaxTSIfCwwj0CHulQ/V8aiOh4NzDN/qTqXaqqAZWmVwo
         ULUJyqZsvWFNoz4WHGEpRmiEIWc2/WJSDye9PkG4UeJ+aKr/rGm5Z4n+JsPVIEnDBaCb
         rIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010693; x=1795615493;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mh73tfK9sDn7RbbTRMru9Vf8rP5PE3uqjzcCQ7dBz0s=;
        b=pNEDXzEKecWGpgHwGEU5PeF8PQ09bXrndRWfQitl+RJpfw5ZZTRrKV5/NWBmQVSycp
         Ryt3DZqEXM08Uvc/fRE2aDbTudFalE/AjwSAFQ2JFCnoJkhIw+SdhF2Z0mdsCk+ZTnlc
         3YWnvBNsgKLOV3L8LZquwaOaoXMep/5t7x2p/X7xJZZwPf9NSzghfdJjHn0BZ1pEC99j
         FmdqqbhIGAoAwBpJzBTEZhqe+z8SU9aT+6sj6X+lVIOjZlGS2/FVdaSj0Gv8ZnQw3kFH
         kg27bfa2hecUEHLak4Rrk3fXIBYqk/mqNoolX4R4K+eHeRG2VLsYhakHKKLKeK+xbYDo
         nxUQ==
X-Forwarded-Encrypted: i=1; AL+hErFH7Oyja3AreExGL+ZX1WyJX77hwDzQ8JO8KO4hKv348LM+Y/cLLx3a7JZnHUuS9y5dam5YN/LLZv7bRpw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/o6Pa49gEs4Orspya2crOMK6oVNZPNwflORMyOT5L6lt69sYQp
	4ncsNy17/Rld4dw0N8t5dKQ16+Vj6lt1eVjORB4G5D/OtF/STBh/MiXw
X-Gm-Gg: AYBFou2SRCKrrZBHQQYl53njlCsjNT5jzOPgyPbEg57vnIQE0yozWPh+GuCd+rz3TNY
	i1dgDKTuYj0r7WjaeTKGI4GrXq7EE8aRitQRPz6PpH2XvLID9kQvYqrwMxcEAW24hnBWw9b/MKh
	xy4A85VrTPEQ5GGAbIK04vAXhRWtN8qiON/QNSrV47S9yV9HhSlhCTsVsre1BVtdRLk/HAeh2Ka
	jJsMl2qDAdqRhm7FPgulW9K5eAgg4N1S8b8p2wl23/Itnc5pe6XkBzkekagKzm2Q0L5kA2oW6XM
	dp9mQTc+izabhe5xkfkDlSR1wszH4srCooWv6TMgjQkx+ln+9wG6TZgmTrEqTIXHnFa24Hl9i3n
	LlLLBJJ9Sw8eUSPWzvGeeiviNLD7iyzagGym93T1voPxuA8TmhgJiE1NYWfyKXbRlQkq7+c1DKI
	DIxhRwpcLd30LyT8kKfCA6bU5nDMrhkPYeWGnSImEkBqd4+QFjkcoY8bx2iMQb0WrUehJnhkLC4
	LOyu0f36drDI9HhIJfnb+uV453w+vxg7sW82AkNh4lyEzwkJ3rvW/GIY0e75O/VQRf3Xsjjdt2E
	XpSlffvkKmrzJlvLtip5WD9jkjK7G8Hhq3KJa6JWrz8+5nLNFu0/eThamIG2qF97Vvn+7iF/3Ht
	uJwAdZTmfHRyj
X-Received: by 2002:a05:600c:4e44:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4bb7da12957mr49320645e9.9.1795010693113;
        Wed, 18 Nov 2026 06:04:53 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:8839:c4ed:3a87:cb27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b74d6sm68201545e9.9.2026.11.18.06.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:04:52 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Benato <denis.benato@linux.dev>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	Luke Jones <luke@ljones.dev>,
	Joshua Leivenzon <hacker1024@users.sourceforge.net>,
	Ivan Levchenko <me@livan.pro>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v4 0/7] HID: asus: ASUS Zenbook Duo keyboard support
Date: Wed, 18 Nov 2026 15:04:51 +0100
Message-ID: <20261118140451.100089-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020092423.36380-1-p.pisati@gmail.com>
References: <20261020092423.36380-1-p.pisati@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jiri, Benjamin,

Gentle ping on this series: all 7 patches have a Tested-by, and all
but 2/7 a Reviewed-by.

Could it go in for 7.5?

Thanks,
Paolo
