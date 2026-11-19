Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795059331;
	b=gCuwu1J7c+UHLNn2iRY0BrSkBlekOqgObqBKTLcOoOlqKRQpwqqfE3LGly2pTACrD+kn
	 xmI5T3YHBPCThPy7MSwpTzHRXizlsjY2pVXcXrGo5IGicwkv9IINYQP3wptN2GpouwDpi
	 RClH89LH1uIDXeT4fUCgps8Ri3gWiINHmniLtInVO78MV1qw6pPOIEw+g0G0ea/KSsGx+
	 KNCs1O+71LAJz5uyXQcpMeggkK4gTmg/Ni9zNRzBbRuUmR+k/GH6ocacgAK9R4o8dT45V
	 DE48BiO4400VgevtIMY7MYGcdxX+dvCAHhQkSDRhPfisNwK9lPTXJe2hvu0de/dxwJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dTwcKDHMNVZfmdNV5lW/CAgV1zVqOVJlSSJv03x7V3c=;
	b=kOgYOrrBlPKvVYXNPzUeyG+X11j8pq49QDzv3png+EiyiJDgpDhrLXCPf0URg/QQbtOX
	 XURsl2cxcVah/fl+21FsfhYPeV4193OPGUCqwvoT/58mtojQ0Q5O75Phfk0WbXoP+AsP+
	 +KN1VXuwr/bDJKLeSlMew8hyN5yWUjZWuaPdTiyMY1sxMK7Mn3+1j2mwxyK9aDgzMjT5/
	 q6cJKsrwgdxZ5MlRg87PUuolp8zlCFjhDYXppRelYZS+R7RoVc5A3LXn40t0vSfoNxMf0
	 Psiu8efF7mhzsfL0eMFp3KVids4GtzrsQ7qTMlgSvBRZilPwYQP/5d9VBLxjvIycdIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p5q8k2MG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7ED606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D7ED606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p5q8k2MG
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b335ef6441so12354117b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:35:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795059330; cv=none;
        d=google.com; s=arc-20260327;
        b=SAFwp+tboFx8TR+S/lqwaqdf9kiqnHU9oyKCSEzV8sqIuVLqVZlmXTA01bjFmVVbnA
         h1pXK+SMNIihSPTbMoYb+IdGmlz0tD8+nTTYa+LkB0krub9NxdRA0VHw4ad79qTuwgNf
         Dep5a13kdQTJaWvvvuRj102MSsl0ZmxafYPs9G24M1IqHHAQTu/CjBKuRvjW2qW+GnCM
         1cIwDmNwcYB7gmIr/lAUwDP2UIxFlOM+PjCuIcTdOyhMoNL4KQNXnogWVm4gcSH4V3dZ
         2QNCNwhGI/12ZVoPnyTEdbTkFtRKHi/kPTRSsQUM6qqGkGaLIkAusgYxF31NVQOwZVNy
         6wvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=dTwcKDHMNVZfmdNV5lW/CAgV1zVqOVJlSSJv03x7V3c=;
        fh=rHF+H2eZoSLi2nSJ8OqWAHFzcQIJApEUXyIzqyyHS14=;
        b=Ca7R/lIJAKdLX4XvLYGPlGo7j4apgk5d8Xmqkv/Mr8dbiwlx6AIasMqtmQYB/mC8Yh
         4d2EwWKZ9QWCJF5STlLDtVqO1m6DUZiXGG3p1SrfsZstCxsz5n1EyBd+6+elyq6MHDBA
         wnLw9jhlPpRmKzXG4+Aqa9Ktw/rEt6T9gX8vVqAjeaDaxS9FN6VI6VM5JfZl1ceRJYaO
         Jg/vvonQir/So06w6UvFRm3O1BSrJ+IwqzAyTHyE3masHRhHrUIcFvxP/KNBlgDtfuRx
         RHWRnsODP/2Nl3C6mIELXHsiU7/0at6k2I6knkfG1/TkATbKSwXPE+eCod9JLIrl/xUa
         nQow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795059330; x=1795664130; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTwcKDHMNVZfmdNV5lW/CAgV1zVqOVJlSSJv03x7V3c=;
        b=p5q8k2MGUuOpnGEfJtZuofAX15eghfaDILRuOeZkucAaOsg+vRtDAJ2izx3UD9/Pfs
         D4ac6oVbUepQrfGqPpSPWFAp/vQnnE5FqLShnB4NQs3Ba2MAj7aRm53o1PKjTOgS6l5+
         dsD3vJx4Nba2Tppke8XNi8TWF1AJLi5NiSWJjzQj3pX9shQf/Fe8khddbTCxOLNhZObN
         Rxc28mSwtkcL65i9/ZzADsOmDtxJ1DuH3gKD5bvH+kjHeYEUNlt5I4/hoM/QwEPC3OI7
         ViOp9VvclE2wzJI/M5cTh2P66NYDRkOQcZdh5eGNMtSuBaWHQamo9uGXZo5Nc4z9N827
         vO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059330; x=1795664130;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dTwcKDHMNVZfmdNV5lW/CAgV1zVqOVJlSSJv03x7V3c=;
        b=G0qJuWMxb+tREHNeeL/Vn4BSJEfVnvvHiUXulratG9FL+WE18u22SgjoKw38N3X8bS
         OsRxPoDQ3qQtHQNX+yeywfksQe7hrqXDKE6P9DYbsDQnJnIgYvQfkFIf3Nz5rn1KSAWP
         GNKHLAN94CGWynMANtqGcgTDuos8BdEMvab9oSAOH0Yg5181AnZzh277pUJAGannD227
         vy28MSp2+hO8wKwtpcKPfYT7Wei5a8sBHPVL8AqgJJooXOIBBf5obHZNuR/rrnLKdjhP
         A4Cg+3IKHFjg8G/fUx/pFIJLiVWVh8s/DGe1hxfgB2Y6+c131Jopg+Gd/m4fNzc31qqP
         HKHw==
X-Forwarded-Encrypted: i=1; AL+hErFI37mCISZ8e6KEul1XoG7A5+EEOwxCimWLXh+wCfZaRvxEMsSdc4nOPkMFHn6fKXE0GK6JnOJ/uzmk+sY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8hV29ftNuGw9WQAa35v3qPzJDyuzvFTlXov2yUJ7TyWQR3Dcm
	ncz11FZaOfxVvLI2yxKF25/mY2DGmpY7PoTgGU+kgwcn+dUC7944nSak/1zM6wrrTks3/bXpH32
	PJ+OXDPxHXTVn2x/YQq7kqp3Rp0RXyIpINpAE6dHj
X-Gm-Gg: AZFdTZeenTNj4cb99MFrPp+Z4oXfGTSgxc4zSzecL4LKqrs32CJJQZQaBdpn9zBWsVH
	qGC/04kMS+8ULb6znaVuStL0uZnZpAWWDoKoSknk24D0oMWmsMX6AxtSDOcONcOh13wBrvkjmal
	ycUKdiNNkkb3NOnTIua74rLWhugXZXa8aMimf6OrzZTmYEv7TgGMd/V3BUI5NAtUYOud01hDbq9
	/EsxwXGBK3MNV1b2SVoKAlz6pKoEKZ0OKe+FqkKsY2TltXZysTKt49gZhu1D1CFX6sjTtmWd6h2
	YA36HYKP7ssXYTeiUtsUiPcvO5vaA9yFqka8/nRGrRC7oWnYK7rNDGcTj8QNQjA6mjh1kPGnael
	ju49Ft55BxM/+Zmq1PEo3Nk9niTVSmscaElNwS9ki+mjERDLTKa2faBzYYJKuuEqeXNvQn5lCAj
	27fkYkArMTtRLXPmfVkqJ3p3+1d2JFMPlG9NMrst/riozWxXP4XZXDGJ1K0M2496sMiuVH
X-Received: by 2002:a05:690c:b85:b0:8b4:d554:3267 with SMTP id
 00721157ae682-8b4fea7b90emr18155827b3.0.1795059329731; Wed, 18 Nov 2026
 19:35:29 -0800 (PST)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Nov 2026 19:35:27 -0800
In-Reply-To: <20261105030843.3319056-1-wakel@google.com>
References: <20261105030843.3319056-1-wakel@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Wake Liu <wakel@google.com>
Date: Wed, 18 Nov 2026 19:35:27 -0800
X-Gm-Features: Aa3M54rGVyaPN88KSs8RaBBU3XJWLg8t07Bk5yW9RZ-7pR4m_ECj9go4X8bhqeU
Message-ID: <CAOcRiAF6kacjWRdUq=rETV3bO30yk272_PZV7sQn=t31_4ww9g@mail.gmail.com>
Subject: Re: [PATCH] selftests/memfd: Rename local union semun to avoid bionic clash
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Aristeu Rozanski <aris@redhat.com>, Aleksa Sarai <cyphar@cyphar.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew, Shuah,

Gentle ping on this build fix for memfd_test against bionic:
https://lore.kernel.org/all/20261105030843.3319056-1-wakel@google.com/

Since b24335521de9 went through the mm tree, Andrew, would you mind
picking this up, or should it go via Shuah's kselftest tree?

Thanks,
Wake
