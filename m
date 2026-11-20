Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175094;
	b=EDNmSYhzCrBcpOqznDODtFn6WfSCgSlAxOUYfCMO3/Kn8kCZvo0G3Kr3T9nIaTWLRJLx
	 JXCXoTkjOJcvLwr4R8lAcGY8uaC6r+VrX6AjvJ2AaLao3vFmUY1ROGDJW5WRtPByHXdHV
	 uAXAmXLw9MkUelxHK5vFWPi4owAn2meKTCIrm8cltnv6ParhLczBjPy241J6l7EYBdG1B
	 FW38HRwu3xfBcsYFlPVLNzCNV/Cbl7lfP4ay6Njok5wYpVYsXSRqF2FFpfUepy6hMaDPZ
	 uukmGpUsAdhxGUbauZIQVJNBOcFK4DO/A7pXwjmfPUJFYRveA//lVfkorhHU4spS/cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hYltVfrQnjlF4EF9xtYm6MjuhO3wsKtp0+5xIybN6k0=;
	b=eo+JaXti6baNme9+E1ucj2KZVRFdHrbmvW+AypOdXt5fIveDm7HFpfToOZeHyOPxQAbw
	 rZXH98dVuq0fNB2+N/AAJAxl5JH3qLhAmaV9dQDC4hCF6kADo1eMTTEQF+yTg1oJ2i4Wv
	 XeCLbNBS7ikHbWI2WK7VJ1LNpHMwI+yW89k1VN4KeV0XWrgu4/t6vEIC9Dg5fQL1IaLxM
	 A88tVH9qfaVqHDEX39aT0bk4kwsGeDRLVge3yBp3+dgyG5lmEo6+oJn4CytVSFWcH3z3q
	 jZs5rHhzF2g5fQOjnsc5k/BmLprf3Qe8ikVPusvxGTBqkNP32YheZCAExH8iEMeaMZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OHt0SVg6;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47697606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47697606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OHt0SVg6
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8c70c2ab5a2so381102b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795175094; x=1795779894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hYltVfrQnjlF4EF9xtYm6MjuhO3wsKtp0+5xIybN6k0=;
        b=OHt0SVg66PdzR9xJPkutuMnweOCJKG2rQcpYdUFKRxJAMS00OlcRyaK9FxM/FyL4F4
         1ewzzMuTT9Z/tmuWDvph1FTbSUgUgRWnATs6LwwhgJY1kNuLv261VKDdqNexUVmG9iq+
         wmwDun8u0bIeLKYO9LWkeSP0FAq0cRCBTUeAuGUi/wtXCTuCw/VkYjvHnk/6zwh9dEbg
         yMU4Dk1s6isJiYxTCjvuBlKbjicX3o50rZme4jwcnyGatRmvGXLbHi48ugec5dniXnOe
         5b0/TaESXTYByE37J9mS2lL77IYkhjiylax+tJlHkpBy8NSW3d3gXDgfxKIvh1kXCs71
         mLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175094; x=1795779894;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYltVfrQnjlF4EF9xtYm6MjuhO3wsKtp0+5xIybN6k0=;
        b=PJprARuKhGlwogfH0meqvXDopW2qhz0waiavjs75F0i3lnfMHIH9c9h6J6xuNlMhYu
         iXDhcvbpnX3/OeWjZ/f8rzfRV44TnJYuoZtsuD5BXzPOT8nrg1ew2niVjndvQVQJXseD
         loOreJ/Ji+oAwnmmU0JKnOtgvGgXgXUYhsrI1GVsj9t6QX7ma7m1g2mjNpvOuZBCAFr6
         Z4x2HLvSYMlR1cOkAOIp2WN8KtT88r8nJFMSJjOHbsSHRPeeQ5lH/EekTzGvuUFUthYU
         iJPXbUi3mz4ooPrrew2Vr1rfZ+R1x34SPB16+Gov5UxeELF09uOa3mGtlXjt8WXjunPg
         yobQ==
X-Forwarded-Encrypted: i=1; AL+hErFyNqJ2I+D84fyx5nq6kO6XgT4VrMtHQ5qnI+35zXSxkei6MJnIRSeJMZJR75ibqAQPAP1wkJ5L+zpx+ek=@vger.kernel.org
X-Gm-Message-State: APuU4Z+haNQMrKCjACzSU2KXs7ITAUfd8HjSKhzoBXAHDYEuoWS6addr
	GWofYNG352kUEdIlcwrxZrk22MJMknc190KPqSZxZ9dY1/3U3M1GtMVDZLN5/+O90o4=
X-Gm-Gg: AYBFou1wh598xFtN8zgrU8kBp3+o2PlrjsuLPMeqSBRQURXarATUA1JxcabY48BxBwx
	PstVha48rrm4OwVgiZQngGJ/Qv27dS2TavUdtlly6QeDWGKvTsJALuVjMvhJgjb4aL4teofd9/B
	gjB/lP47J80w8ktGJ740YALevH0iUqff+RZdW+FvI2SjcFBUZFwRM7Y9EWDNpjiYwC4XjfvTm2E
	5PrY2ydaaPrNd/7I2ZHysWN9zbk2kdkfPiI0smYunzsUNPvw3qSRhqQp5EprKADx0iycazL8J3m
	p8ClU3DFx/TQCw0vyBvf0c0u5wSl9YLKpQv906Kw5gjBdi8FZ+W1j5zhX6Ie31QCnqB5n15YsS4
	ejHqkK20VM3vPPca+HdXmLlFjvveFG9T12BHBukL/Nmp9pdCLZFpdvuFKNMY20kJvTpMXPsELWj
	1OEYYhzqUVeeOgxCPzvjPoOptVh4PY9Tt49G2NIYBA1q8Ex6/dvZ3AOrctk0Bz0ylPQDbqc+v1v
	lf9bG6PqPzJFtUZ0AgSyhxWwzsn1paSLb/TfWNFkaPyMBRhqsoO0a2WuZAqSxt0estd84l26aMr
	qPnQ0tOHASfw23INSIJMr+ispRW6ecMM0l1oAMzyn5iy2Sz32NFTqBWCNeraqeDAmxr05vBx6g5
	mJrH0C19xFzAQLZBBjWInVpFH0kV2Ya468UnU
X-Received: by 2002:a05:6372:a713:b0:3de:7bd5:fb47 with SMTP id adf61e73a8af0-4014d1590ccmr2473352637.39.1795175093626;
        Fri, 20 Nov 2026 03:44:53 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d02ba46sm1138936a12.21.2026.11.20.03.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:44:53 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: jgross@suse.com
Cc: sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	martin.petersen@oracle.com
Subject: Re: [PATCH] xen/scsiback: unbind the IRQ before draining in-flight requests
Date: Fri, 20 Nov 2026 20:44:48 +0900
Message-ID: <20261120114448.3072673-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109122654.30859-1-yhlee@isslab.korea.ac.kr>
References: <20261109122654.30859-1-yhlee@isslab.korea.ac.kr>
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
  https://lore.kernel.org/all/20261113110036.146860-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
