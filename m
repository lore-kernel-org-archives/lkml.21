Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175100;
	b=qkG3rSgzWj7n5QXPfFIxuH7s8WI0fm+KWMTxAj3i7RFsCbcp5fbdOgqEo16YIIbDbKpC
	 0nz6anIclaqdfWZ9j2yVphtVirdfgELLnAGAauW+xqh9dhUSZ7UwIMb5CaAfUPyitYdnQ
	 rcumZYTyP07mSPQwJ9MZj/5uYIrIAXPS69mL0cdZ8j4sK/lBwkU/Zw48SLT6WuJVCUYxq
	 JGmJRNNvfKeB9ul0jjihxIg5Cys8x6aE+ZyNF701YY4DM1pK8eNu8UiDYj1yxmJxhrk6d
	 eNv5XA5nV7YeANjUL3vrJU7uNYahutHqAdnEzZLCv6SCNvW59i9vKGGZKFNjV4psYdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=sdsG+eThRvcI9HCYyGBK10hDw1tWFZFbpCUEL03/hJY=;
	b=b6Uz8068PsToe3ZLURXhlkQhb9ik3RtYSsOz2Slq5f6vdajucKLjJKPgnqDsVeXHRDBM
	 JbZ9V+knjK3L+HrWnuAEqNc/K7BKWwd1f7OfaItpb9gy6wl+KhyHW48Rw0Zun7l8rkj1H
	 aJlCCGCFG92QC8UKkz4+yyi9YJAjYM6LbwMrQ6JOrJYUQkgQzt8p+4rYcUNKw+fqzz0Qk
	 WIAT8l94ZHcZVgt83nbGNFeAncKVlyB/0G3oGIVFr3VQS/yb+sXq9vUcgnQocycAf95XJ
	 +GL0lDkf/2bf0o5n1avJ9NHrLzyZ+h37iHKu3+RZ1dilo0zmPThF2S5BY0cgLtQ8PfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=im1KH4Kq;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0264F606AA6B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0264F606AA6B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=im1KH4Kq
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f0213202fdso4204215ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795175099; x=1795779899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sdsG+eThRvcI9HCYyGBK10hDw1tWFZFbpCUEL03/hJY=;
        b=im1KH4KqZiJaysW3dWK10GcRAinqUSQWHxbR85k6cC0mj3lcv2mtEiC3gdJ8jaaG8Z
         eh+O+AvHyg5IR8WYSZTTs1HTYQ2q8jEeFrN5fPdI6bh5W9vWiWhjdyUBdFm1chdkqfru
         SUY2icAe1+EC1gwEj+xDzx5+Q9uz0PN+d6yLNvA7uC+6igBdUqJSsOtaueXax3ELXlw4
         iZEblI0dv2FaMA9f6xqfeplsmQfLQfPuBvUYzefFOEitm7bqhJ/BhPmFOi+qa0+TleFX
         soxdYGWwnyCS27S0/0H90XJvD2i+JXPmLIe7/ArA84YAQSfEEz++tcI1q+hRnegXV7RK
         9E3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175099; x=1795779899;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdsG+eThRvcI9HCYyGBK10hDw1tWFZFbpCUEL03/hJY=;
        b=uaCJxkLia0NBDaFS1+2iN5DGl8WO8iMJpwdFh9bVPLCSob2fDpaqnPs6AZV7bxWEjw
         SjCAB4fmCP3g9BvJGQhWREvL31X5u6TPe3eqlfGb4p9qO0aBnizfdjgrdcmNAQpnnXKn
         Et0X4ocykOwB/ygU7hg/LM4z09qTfNI6l1Ahcfn8gF+SpHcrurxiNizjmfstHBhtilFJ
         l1I63ReSw6GZ6vkRos1pJd4o9bZq34gkbohO8opUlVnpdLXSD4sXh+VYxrGvXXy+VXT+
         81qkdZSUUeFlXjG+MAPwN2xsrOu4Edeg9CMk9ZtJ0msfNKnMm8h7A9lo+XJ9oAfsSTXQ
         oRTQ==
X-Forwarded-Encrypted: i=1; AL+hErFVaYi2DF+YP7LAK1b5Q7Z6RAieUaVXdbZ5ihryxg5FsvoTXEYelsRY1xs5CsgHnm+zAcOgLGulxHEl4Xo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dlXe9Z5tYA4KhoJnt7vvnRIyTwNxxFnSGpDmhKdQI/DvZGU0g
	A4XvPiOniJRjaGTE5/Dy/rRAyPLAttbx8gc+1tst5btXluuE/Bztocly8qPU5eq4dUg=
X-Gm-Gg: AZFdTZdJkQgnum+4AU0oaOstzrUCG2kzCZFs20tkAZDjirHiUWujXPCQXUnAWMj9mLB
	LSbs2g9O5NYzm4sC7Xx/ObupxYWXOckl1E9+xa3GEsKojcz8O1WFmK0vF+xqrWhy8TLqKGJBiYz
	yl6UGEmxmRYGQBereS2tLBhzIk/wNADbsD1MBXnhUNAPnQn+aQsa1K/06QWbemL3vJkndWvi3IK
	RJc4w9sh2LOsdfJefMv1hC0N+1gHTpn48D/NXTmOPfkLrho0dpGA9ZIiqlI5VZKw0MGw6RvKzsY
	1zxkM2dzy0bhUkqJc2yeAZS3fl8agU2dhxb7z2gzeLQRpCuG3jVkR5jl5T8LHwOX0vlY1EhBfHb
	+2myB4E0WEHtIOjgTYeLgDzempPUNnSiN5FsaI2+P57PMj8f6QjGa6GjIHQ9BmSlHtAEbHXVBnx
	UfUqSV9mv2TZWSWze70GeY5iz/bCWJAptLO578RUGHuBL3WLFTNCJxr/MKkQRzggZjNmkG4b15H
	rOTmvNpoYb/g0+zBgpSx1RHHAlzGp5pEId1UfESOgaykJcaR5+kYHsgc4zP9fE1Jqk9jxGWklDT
	XDJRUfBrSIv+K8yuN78Zzh4n7oyB5NT/CEz5KCSj4K9Sl6f3cUWoarwtQ9ie4ghnvSzkhZbcUBc
	M0fvJSvFQWDbtT36WLAxeH22OKqHqGJ6kanFu
X-Received: by 2002:a17:903:2c50:b0:2e9:64b9:a330 with SMTP id d9443c01a7336-2f03f17d2ccmr29212195ad.11.1795175099419;
        Fri, 20 Nov 2026 03:44:59 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm13289485ad.63.2026.11.20.03.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:44:58 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: philipp.reisner@linbit.com
Cc: lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com,
	axboe@kernel.dk,
	drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drbd: reject an out-of-range offset when decoding a compressed bitmap
Date: Fri, 20 Nov 2026 20:44:54 +0900
Message-ID: <20261120114454.3072690-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006035715.354417-1-yhlee@isslab.korea.ac.kr>
References: <20261006035715.354417-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v2:
  https://lore.kernel.org/all/20261006141509.521128-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
