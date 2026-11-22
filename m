Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795358598;
	b=vLwhVNKNaI05lx0AyTe/1kVnlLYXiQcUpW9Q0kQjzqfW3nq8XPciW9ufiRWClt14fDha
	 6BVvagRZN9kyku6vJN3wnHrgObpwSjDNJ5+vvfPs50BCLQJ9ttHl4cdMIYB3POg2TeKPf
	 rosDjZqWAhzvNBj/tw74OWbKGh0Tex3fo7IJkoNimH9juRKXONa+fD0MIS1Aaz+bguO6e
	 H5tuGQcjM2e8KX+JRprOpoRHWKYpZ6K6WGQ16bN7oGa05mjkr5wffOx3eEvnV9+K5PY/H
	 iN6zDCyREn1sEtnmRNHyoIkMrRyb2xvcn/9kBRETfkFvUF4dYKhkoFa1jWNBEyLn3tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795358598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=thouv/Iugv9Ibk1c9KzTk8Zsgx+FoM9fM+m0l2bDqdk=;
	b=j6BhHoji/5KJI9z+xuoSg3PZrqa5iJXHPxkJgDgx4qd+GG0q2Y43cR441loQ5D4EZ+sT
	 1OJG35Si977agFYgcGz89U0sfAJ9pv/8Ta3+TYF80UzpvFdzNrHRX/Kq36LyYp3s2eODd
	 vxSVgz5IhBsT90bip+98GwA6DP9r33aiBoFayrcmyss3CRQjmdXkDehrBXRPVQ1WnmbrN
	 pXQ9DnvTgJYlgQNQMQiJ/8JTs+iueRWf6Z9FtG6TOxJmsF2m8nmohG5Q6+mkm/KOQjAUl
	 +6GpVCGrVSNFjg2nfvT3o/hEj+/aVcIocFBKSFyht9B++a4ml0YBigdMeCgAS1nPO4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=oApxSGR3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDFD606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DDFD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=oApxSGR3
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b335ef6441so15700737b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:43:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795358597; cv=none;
        d=google.com; s=arc-20260327;
        b=a1LXdFRVjHqwEzzeZDeoqXTKCvjNQEftaFFEzKEsHeMnqVSP39Jz9RrN1IytR3S8qV
         X3mIrvV/AukIHywikVm+bEL4NDUEofhUNpRbrh+Vlo1kPucXJDhgQ6m+3q7XfH7/6j8a
         ptgy0ZF5ooeHaKjtLVHmA7Kp5/+PCboXMlQn9pozVraKzd2efrZbgEC7pu9FpTw/Ezbv
         OVdy4Ly4ZIDICeyShkiasZIZSLPm2pM2jqfrpTRwalEOgTZ5pmT1kh8AR1ZL2Nm2k9WR
         Ciwl+kWRkzxinUBpbkrJan2iQ831EtGErheD2OjKq4K88CnsVMXgRh/6PCSSymsiWGWJ
         hh0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=thouv/Iugv9Ibk1c9KzTk8Zsgx+FoM9fM+m0l2bDqdk=;
        fh=LIpRYCzQuIQRy9Wz/KeI8HkJU/CLSXWJGwtxiAIrKdc=;
        b=GrQcH+pYSEjKCwBSerNolyJDYFlaEe8MrhKC+u21EI3WMuiE9T7pwDvfMxgMySZOsU
         ulr6BYtAHCcjWNxhO8OypVewlt9ejOgwtQ9+CJ991ULnXSrFC2PM8bL7RVZO/bCitG5l
         l/Hf3vZhH1yeM4abC4JOc2tTLv1HjqNKenodJ8942kEvZHTJK+UtILVHD2sLR2cGGiBP
         kxT3s82MJi9Xoi59zULH+K6O89f1eh+hA73S8GuCTm5paADPGqysykLpzpucJmIyanse
         /ZkueBiE86KnlswSqR4v9EVMCQ1bp3nmA05NHEwZ+oSK0CSVbkjfmJhVPHj3E+xYkpC6
         Xg1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795358597; x=1795963397; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thouv/Iugv9Ibk1c9KzTk8Zsgx+FoM9fM+m0l2bDqdk=;
        b=oApxSGR3RW7p6aMboPcZ4zlCnsXwQlRMDPxKQ4y5OTtqmTm1t+oIBhNBbJ/RiFfe4Y
         x1cdNEYp5PKLXsDTJ+W8Pzy0KDwNTn+zjfTl21BBISAb2XUYt+Bh2VbngVuKxSrS7qiL
         /k9oR039kq1SvtmVShAgHEhtjDl2JGO2JWtSk0DjxdzLd3F8z30pBJmOUfStCdt9VQTJ
         yiHqVWEPjCyMXLOHSIG/aHrKTvYMo4pwTMixDhhtSjnO1lCKGWJP1Pn2TZ2L4H6tMN0p
         z75dvIJTHMLMZgfzjWiij5Eg6/FkL3oZTlirn0RNEbJMwUZBCq1yx8rniqILIHHOroBn
         bbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795358597; x=1795963397;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=thouv/Iugv9Ibk1c9KzTk8Zsgx+FoM9fM+m0l2bDqdk=;
        b=Khup4ZI8QQoewwWY4H5bV2VpNlNkg8YE+MMiek36ex9K8FO9PpX8hquBKw1VWL1pn+
         J2KoRFEpJ+zj5dJCM7GdxKua0hmY7tMhXXqsuJUN7IkT6eRgSwLso0A3IlXOrdzW/W2g
         XsSZ0FXqsQJILesbzWwG3lZGqUy4Wy+NrkVtFJbzBAr2nf3jD0tXld9ubhWJ+uZ479bw
         gANeIlNuV1PZu2X+1xnIkSloZD/qLfLFW3dRwOiGe3mQat1jHAJgWBZYA+8jsqK5yvh3
         lqWbeNRB7gTzA/R+CoZM2VeoN8P52B6NuPtffrH+kavi8uGW2Z2ApzdHkYfn9tA8e1tP
         i6Sw==
X-Forwarded-Encrypted: i=1; AL+hErGHol3eAVwbqSs7/RRP4fbU4f9O5wFYrp/FDfn7YzD9SQ5SxLIEacXgtJVS12NcXTMR18UNGEQOi6DvwQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9casQ9CWFEoydvOny6obm88BdGVCPZMAOtwHsl1kuuFAm8m7Br
	4DbP111gVTIUo0JsTIGjbjYdEnkbU6+qZwoQES/tri8tGHUELpUOfJ5JioC86iLY6w23OXaxNGu
	r1/Ig0P9cXC2PdEZMgCkorcTXuyxD9sKDbGgWxJKi
X-Gm-Gg: AZFdTZcmlH2kzgE3HOfe1XLA0EO95RzaNRJ20/EQPcJ91qQg/w0vXyOEsZP0GKTg7S7
	H36VMHp1LR8ar1gWnjMoPdpdp/tRFxtG0HfykDm7h6JgGfw7S6IUQILv4+ChdGbVjDvjurl5LYN
	W4qkM4vdTIgyZ0/S3POS4pqKzew78KU1JTu0/cUC1mFInQy+jDpjpFOLHvHRARWpAL+3LwIE9i6
	8SrKnUMuTbFNd/x1UxQe7rpu3jZtW8K4Tz81EbeqLOtDIG/koO+WeKBKT08mDrY5vNf0OyfwVEJ
	jk4tXbVAqKADYPUbsgqt1Z4QLytZhaFwkWVCbotBmTyNGNzFqYTcg9RcCfTnLcECVArMiMYt0Rq
	qyOs7mllro/ky1VYvmqv1ObyHdqMiYJa1EgVvDHTatjPFleREdQVUO4ivJCZRzZUmq9LXPo+PSj
	7H+/i4Px/wx1uXwZ0jHir+IgApWf7uZYGLUFfIDeDKvntUoD/N2IiVGEcQuzITHsOd59W2NqhQB
	A2/Uiu40X/7kSNEfdOmP+WbHVaXovZI2SNKnJ7/iyeAN2fvquQTutscR6u7/RoXl9BNgE0FnFAe
	Nod7i0PC0dnssAABbzjEZ5HMtRt8Za9Tu3KJRDVARyvSzfbtrYMeBRoBsj5CkvyMzvRal5c3RCG
	w8QEjnHuPnm91KJAtOb8QlPNlQy3mPxA=
X-Received: by 2002:a05:690c:a:b0:8b1:2db3:b845 with SMTP id
 00721157ae682-8b520435b3emr29200087b3.14.1795358597254; Sun, 22 Nov 2026
 06:43:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121175402.644803-1-julius@bairaktaris.de>
 <20261121175402.644803-2-julius@bairaktaris.de> <CAFEp6-2bg_2o_bjNNsAA8WNUkL8Xng-tMoY5awJa_OeHd0rp5A@mail.gmail.com>
In-Reply-To: <CAFEp6-2bg_2o_bjNNsAA8WNUkL8Xng-tMoY5awJa_OeHd0rp5A@mail.gmail.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Sun, 22 Nov 2026 14:42:43 +0000
X-Gm-Features: Aa3M54o5gEPUswAYHgd42TPsZL6s492wQ5gYbnXvCBHvlFH15c_NQ64WYeVIsGI
Message-ID: <CAC1t37JxedSiRn4rjGRSV9a4N-Wm0mvGQW_WGhpitq9qJSgs3g@mail.gmail.com>
Subject: Re: [PATCH ath-next v2 1/2] wifi: ath10k: release the PCI interrupt
 mode when probe fails
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kalle Valo <kvalo@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Thanks!
