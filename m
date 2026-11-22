Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795306142;
	b=aNshW5uph/00Co09zP9k5Zoeyc05SK8AymUcgzlAkW6ig06MvMGLvKzewevuauXmea00
	 S/iPrQybwsBIqsJZBmp25nWyQUgnjJVVjHUN46TrCziI5OO142cLx21bLnEvXewiphsIq
	 Hq7hLDP34buG6NJB/Ttb6W1Fhy27T1OJZ/T9uh11t04cLi+O/4VxLHjkKLd6arELLyWwN
	 BibpXjZB2/RnCmRpAOftYxldygBQqX/4Zk9x2mYKmItQvhy9ybgXO4ScPX0Vw6Qq4L/T7
	 F+MOo8vmXk/OACgMZf5YScAX5AqyUI3ZNwh2TE+brmN3ryP6fNgdy+RftkWITlfwQIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795306142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type;
	bh=cTiziDbYvBIexr1IGsni9s57LM2lqOe23xZ+5bZWnE8=;
	b=KVEraVVKJIs0xk3k0eywET90HzX+lbFfM+AoZ18tWhU268Blz1Uc9fHAorTldtLvkvcC
	 NPcj0S3zWPVavTuYN/ft5s0dSI7GIOz/24uwcIHfpfA+TcXs8EN3Zq/mcREH969s8zPKy
	 Upy4EZ4AgUAWhrH+JPeeovinZTmdN91kTAsSxR7Z35x/xz2G5FwdHevMA/OanBFGMEhUv
	 xqvLPPSCGfavViBElz/58R/T+v/t21jeUR7llY3VJm945o23tE3jYcMm9Jc5cY06HH3LL
	 E48iRlEA7ypU3v16nSN6QwEETdEv5S7exzDrXcubj5Ob8gxIw3T1KrRGRKDEKImKs3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IzDeR6xH;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6B5606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C6B5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IzDeR6xH
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9f6a16afcso32255ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795306141; x=1795910941; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cTiziDbYvBIexr1IGsni9s57LM2lqOe23xZ+5bZWnE8=;
        b=IzDeR6xHjIZDTCiohGZLb7oFRse2AgINXumQvdI9hWGoPyWsZfudELYgPhUYys8a2W
         hYW7/EL2QuiPLCWHpl81sEp0aBVQkijiCrifwPW/zdhOBGc5yIdF00ZxuZRGYlGH/f55
         rPkHtyEui4Io8cLwyBh3gCVeeBFXDEdKkn5bHo3VlBtpg+bmPsDzgXsH82RnmwqiVpvl
         KF9HjFM3XiBAdAzHh7dhorXCIA2msZGDkefZ/BawShle0NlgWS40r9ylzWTLkyQSB72a
         PzPadcz8RWIY8NGSKqrKS93RJpRp8zdQ1cWa+UWtdByyo7nHQEY9W9hQmOuga0ee85hr
         vZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795306141; x=1795910941;
        h=content-type:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cTiziDbYvBIexr1IGsni9s57LM2lqOe23xZ+5bZWnE8=;
        b=vE+Yhz4e7nkUWlOLMibwLtMITQg0mx7KLoBt+O5AGT8rzlPsjE00iVtRoTvkgKYKvs
         7T7b/Oh27NIuWCv+PneXHfgeAG8aLPpOTqBxBP8PoMYYgYjBEL2d1SjWifO/Hd2lCv43
         0EG87D9z68GGLcvmwvzlW4dKSxk+JalW37agJE/2jNA/11uZM/a9Bm94w7pCkpyCa8EY
         7sj3rL4NwfakLxJDckQXjTX1xSSEkq9zI8+6MDq1EZtn/0G0Sb2BMI2kX4LFRLGjDemY
         vTvGn1nHESMZ6X7mPyu+5KvIDen5b+YNj16NtEJxR3WzpxaaRcWi8b8OvVbjW2gej9qo
         Dhpw==
X-Forwarded-Encrypted: i=1; AL+hErE+poCyqgKdIJsZSfSWJIFcKzFXy9VarDlmn3FXeQQ0WXf5v5Nrp25VjGiTSXo+zMZdTuyMDb/vG+MA63Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4Xc99bIv3QUEdY9GaGDGExLPDMe+S6RxEPj2cJ454NyFPrqk/
	A6K8y/Nh+ngZ4+l+HU+AnrJ+QZU+yjRsN/Ls+7zo4DtEEdkO1tmmcX7yF549z2d/Hg==
X-Gm-Gg: AZFdTZdGSP63ngogBbiNrB44ob7IxKC1Bwt+UJff7wUy6ImDCBsR9/J/pb6oOECpTi8
	bAzyCT7XeJ1EDsPJpmJRK1u45AM9Bwur7Gr5Hwl13x7zTaRamtibd2qm0Kl0rPAsszssgvXcNlq
	vAPxF/yhuxx2wcBPyGZ0tFySYXyDkEn9oX8h4oo4Pfl0O7ur6CcQ4BheTl96vPgmmVmOweLVH5T
	wDm9Cy3Kv0naZMP/9gaDQKqztdlZFeRx4xqkA5HjLOsTwPzcEq0Trmsl1Bz8JCA7ual3TnM3epP
	lUZk4kQYmbsUatzflgHBelUIri7gSoBu2l9QpEbt/Jzgf5kCsO+xkb8zUOKotJsmBBfnrAfbqmT
	qQcVfk8QT7wJDB2XzlBXSLyKuNHGO/K6SoZco1bIC6aJ0aDpUiooi4SGBEHdIhJoBXHscBRicNp
	C702dHDR7QIgXEUpwNkyA8TPPBZS9u+g/xV/PAEHa3ooTAQKhEsvK97uGxsW6W8VuvSTk11bmF9
	I4DU1wUrXdylP9mxRtcM2cJ//B4U4bj3QHJJeGLobvtHrBQQ0E91Ty/CblpmkeUhBbBEQF2rUml
	WnA5ZuPQYVM9o4iKrirvwuBg1DEYtMSePC5hO7YzVtqe2+mbB8YRocXYX/g47yDPVSuxqd3zD0R
	qMW38vh8w1pfoAghrVQ5zenqOMZYnC2u9neQH7jan+aSvynlZAMToF4OF9R9CaaW8In4OFd/UzP
	1U42tLJvNUnlCTkSN/4uS4nXg+zmeCHmFbFaM70ZaJGkMy
X-Received: by 2002:a17:903:2ac6:b0:2ea:1fa0:8068 with SMTP id d9443c01a7336-2f066708e45mr2976855ad.16.1795306140790;
        Sat, 21 Nov 2026 16:09:00 -0800 (PST)
Received: from [2a00:79e0:2eb4:9:575c:af4:36d9:d404] ([2a00:79e0:2eb4:9:575c:af4:36d9:d404])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cff4c1asm2958778a12.15.2026.11.21.16.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 16:08:59 -0800 (PST)
Date: Sat, 21 Nov 2026 16:08:58 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
    "David Hildenbrand (Arm)" <david@kernel.org>
cc: Christoph Lameter <cl@gentwo.org>, Vlastimil Babka <vbabka@kernel.org>, 
    Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
    Sarthak Sharma <sarthak.sharma@arm.com>, 
    Johannes Weiner <hannes@cmpxchg.org>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, 
    Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, 
    Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org
Subject: [patch 0/2] mm: kunit: complete the 2009 mm test suite trifecta
Message-ID: <0cf294b9-0ce1-dc6f-7cac-b589c9060271@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Follow-up to "mm: vmstat_kunit: add synthetic benchmark for mm stats"
staged in mm-unstable.

These are two additional tests from 2009 that we've been carrying
internally since then.  They were converted to use KUnit just like the
vmstat variant.
---
 MAINTAINERS                 |    2 
 mm/Kconfig                  |   26 ++++++
 mm/Makefile                 |    2 
 mm/tests/page_alloc_kunit.c |  490 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 mm/tests/slab_kunit.c       |  614 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 1134 insertions(+)
