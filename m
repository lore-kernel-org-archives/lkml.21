Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186825;
	b=b/vUun/b8Hy8hXK6lpvlHCS8N3OvwcR7UIZCuhI5X+tvFubpb6JDl7f5APQxwKOV1fJ8
	 GBoe3uyWl84bNiV5i8LQNnhrhY/w/KAWrljGFTRmle17A1Moz8gkpNxBhJ+k4mXEcD1q5
	 05maXFopb9UkHC1oqOJOetOkg8ao8JAC+sBSjQfCjwzqoYw4YJHkci+Uc4NNOQH0X85II
	 /YyEHfph+t8U/BAOltJ8cBdR0w1ikvczZXXnyipFua1yEI84egWKddIF259UP30jM9BmM
	 Bj9lzm38xkTa9OukP+lBAgAKsmjQp752WDWIpWR7DFvehxeAjaJKfxlzTGVgSQOqUVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MbM7Fb7F7HpKuAgEbvtlhFE/2bMp/g3djRx/2v2Yl7k=;
	b=F1guXlD1M75vPcjxXINU0wIp/Yqq2SR++9f+f288FOWq4vCsx834AsvY405vyuylVwek
	 4d5QMIXtSDda/03/UcZcVsJJit8yPNZgEnk00qzJTXWeu3uwLxT57ho/jJjQ9Z4Hv55H2
	 4BiKT/1rKgXL1G9bWk4EFcYQDVFASDIPlI3dQIzq7UlCQ5GijLVyLpSNhbzT/J0ujM6Rs
	 W1A9dVG7zkpXOu2vJI5XlkhRXRG/jSK2LCYdcbrFl0MWf9WI/khtP3bOWuSOjEOWWfpQJ
	 3kJPhn3vSzAQnPQXRYxAi2nPpR0Xjkx2IL/jWtmyajTEj955OpywW/ds336rY2XmYGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=S1I3kyPL;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEB7606A804
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AEB7606A804
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=S1I3kyPL
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so780680b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186824; x=1795791624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MbM7Fb7F7HpKuAgEbvtlhFE/2bMp/g3djRx/2v2Yl7k=;
        b=S1I3kyPLTe8T/pezAwNA4crwXZzTfDU4j+sOCte0DyHzOUGh4uMxkuK3ucpKsQWDII
         9e5b7bKKBTMAuIwro9lxfy6/Og1ur6s8uxVOpeFG8MeAYGUO8txU0wvPBkMlOAu0cZ9q
         qBGdU27/qHOr6WWEgG4uH06w/Oo7lvsm01x4+J9L/FfC5MDcWNAMcwM+QqaFF0O+viv9
         hSpjKw1mVFVHcwuee4FL/+K6GXYX9CR6c0906AyqccdncIyz/NFLCN/SA+ewmtepp8ha
         G454Uo476LOwm+FXOilzQKYAZdFYb4pb6Dy1rM7l+p8aoNo8hGIyWvwe+oOq6HzmAiWI
         6T5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186824; x=1795791624;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MbM7Fb7F7HpKuAgEbvtlhFE/2bMp/g3djRx/2v2Yl7k=;
        b=dSxrKWgar2/P5z5QFqtySepVMYMQJ+hnKUBAYQ+jH6ZqLSwAZc/Ji85mBD4RLC66gS
         xn3+P+Ba8hbLXNe6wLUS+DMUqfveDXspHnwa32grXn2qRiUA7/zO1OwPjkCtCvJCX54R
         Au7KDxd4+pQvWs4d3qdipMY1QUaTpexOmTaUMjP8vwI1wZAyjOGIpstVmngQISQo+vQ+
         MX4Yt9BzaX53VrvceV4pIFgwhTYC7woESl8XmGF0pcsIE8o8y1DRIm/LC1iW5k/pdY5/
         w1JgOh6yb0WTTgRVheK+cVZs2wDNxR0UtW9+pSteysaDrKT5wRvTK5A8herG6wbanAJC
         tjSQ==
X-Forwarded-Encrypted: i=1; AL+hErFjMrEvDqBH8K06N7SxClqNp8vWg7OCJ5a21Qgmixza9jKYC3Sju/JuYhskUsSsijkVYNPzboKDqjZ4OOI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aRxYS4gKRj/k3WIOPCDXshkbYWkUzrLxV/k55m/0hu1ECRWeN
	qsje+smKeD1xp5jHrsnFFES60/7Y3/JtnekdQsaQwCa2cPb0Fp3WV1TLnrSm/5a7UJLZHkLL05k
	vameb3M0=
X-Gm-Gg: AZFdTZdV6Y/esbrYJ/gZ4pPiwbTAj1fXD/7yFBTESFK8nPeXmjlOrzsTLgr76ZvAspG
	XlMccow5EyJiNWJLFU2ftSXNyXXWb8pk23XIanzQFx7GTkIfqQklB/sI78BZbh/rNqHGvWTboJH
	EnrpmmpkgW1+f1kh/BbUl22QIqoKtRZw7t/lWUt62baEdIhssqoRAMv1zKbBFshnMtKcunBZL2L
	lWO7xfzn6kqnBFj14/gRFWJ/7C404w/OxI3FwQvUs0Xx3h3N31EsqhD7quJiKCqCwupenKaamwZ
	U9rqiTCG5shtJvwMXkKg8+2knwlbCuSUZbfRo+FVjN6EdVxtyZjRdGDPL7JeiRpN10hAJLM9y/R
	2xTljlMtIriyn7VjBkK39yYpdLzP2qmlVrJbOXsvKOOryndn4u0wVcJrYOEl9AofHWHe3Fsbfm6
	+gz8O1sWl12H9Q1Dg5Kc9xJrtdIorFPYsfBcuqHXyQZdriHAaasX2hBasgkM0Yk8J+X/w7RS69X
	ZCOsGOvONf2fvf8hwFrgOnBbULekxTLwgGY1h/jN0/kqyISpwbXAe3rSoP0yiJ1NkP9991Y34gC
	02lq1zljggoJat0Ntc/X9dJD03aBlBIy8EoGJwgZZJB4EtS35Ln/Hk9gl4h3Fo4+vjGbKdOj78M
	lwCEMhIwPKeZdaJ6qCnHSbram1lnTBD4ixJFq
X-Received: by 2002:a05:6a00:3d12:b0:89f:3053:9af2 with SMTP id d2e1a72fcca58-8c87b4eeb69mr3337079b3a.12.1795186824478;
        Fri, 20 Nov 2026 07:00:24 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cf4fsm1598490b3a.49.2026.11.20.07.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:00:24 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] scsi: mvumi: reject handshake sizes that overflow the list allocations
Date: Sat, 21 Nov 2026 00:00:19 +0900
Message-ID: <20261120150019.3128161-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014021919.3486362-1-yhlee@isslab.korea.ac.kr>
References: <20261014021919.3486362-1-yhlee@isslab.korea.ac.kr>
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

On Wed, Oct 14, 2026 at 11:19:19AM +0900, Yehyeong Lee wrote:
> mvumi_hs_process_page() takes max_io, the two command entry sizes and the
> list depth from the firmware handshake page.  The entry sizes are u8 fields
> used as shift counts, and 1 is an int, so a count of 29 or more makes the
> << 2 applied to the shift overflow an int; a count of 32 or more is
> undefined outright.  max_io is a u16, and the sizes derived from the shifts
> are multiplied by it in mvumi_init_data() to size three unsigned int

This is superseded by v9:
  https://lore.kernel.org/all/20261015045213.3975845-10-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
