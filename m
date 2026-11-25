Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587874;
	b=Brk7pooxiHqLkPRCXLKsf+AFD2gsIoqnUj6KQ0k0db+mt6j5dx+akiyqiCB8rsqG7smO
	 ZJJ1OkDEeJcmbNUp1/HnJ4OoqHTRbWuX8NVeIBLD0GBrtCAJ0ix17fmm6sbHN2dQ1mmr+
	 jJoTLTIERMSdf3QKmZFy1MjCbnB1xSVVTvBxFyRQPHESt0Rr/sntobyzBZ+yBbWYU97Ka
	 Y0G0ucZ2PtSZrfeiRTqXIA0VErh/z7VrXCFRD3dWwHncSZqSODk6C/O3oBf8N61F4zEY7
	 vwr1ZDC360SWdPUibyzizcYt6TGppWHH4QEz/zM9cOo6J/ADsDK68qvZrcu0aTbIAcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZQsWRLmOjI6MWITE5i2BHhTTEhDrYVeR825HJ9sXg2s=;
	b=Vw4Qmhvn3pE3WO5opzUKJBDCKkAl8t5CBs5eCNbwNercmsHeM6kFY6ZKXKsFCMrJkFGh
	 8bMhjh6FmNo8ZMo8T2nOgaIiwaYIDbaMBl+B0W7Lxi+rOVy0cTOMNbug0MVVvwu6gThAS
	 it1UlrTNcXS6t1uz2jyzwvFohBXmNV5kNoGS6u4a6h3krZi/lfiqP06JVW4sP33jlwEVE
	 Ax2i9atNIsoRcltKqXZM5wlNtYlPt+Gno7seNmE6WqB+DdEtWnUEk9WChr0rzplQY8TZG
	 BpH/woy/TGFIA52HJYixwhJGVppv/RgzoGJGEVV+QwKYn2kY2dIFSxaVl5r9HYDEIWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=ArV2ryvm;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD0A606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFD0A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=ArV2ryvm
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so3025619a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795587868; x=1796192668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQsWRLmOjI6MWITE5i2BHhTTEhDrYVeR825HJ9sXg2s=;
        b=ArV2ryvm/qDFsW/4BJC0tMGbCOx2gT6SWvkk2itkNge9rQIPDAYUHGyHGeLQquK14z
         LtDohwxclssuBm09UuyCAuokUt0RIRpXxuQ/zzqQgRqvdMzHfLuW7Q4N8iyTcfVwiaoi
         +WpcIhYtD7BqMB49/MS4wypCCURlt2ttyZUO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587868; x=1796192668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQsWRLmOjI6MWITE5i2BHhTTEhDrYVeR825HJ9sXg2s=;
        b=f8uHA3jxaDQkVjHOrcSlNy8HwTuVOKsATICYiSMCIF0wsS1CX5aa3ME70d4ruVIvWs
         gHlAlFq41Ns6+5fBmc+CiqkuB2TaNJkEAgtp+07ZNGGGHrqlmbW7xbtK1IWDpSKuL2FR
         Bh/Kbq0H5uBh/TLPuY5YVgRysY5D6arQOzJ+e/bOkTqP+tpkJfPuas9fqXUkUWwSMTjm
         HvxSp2sMixBxnui8uRqzHZWLmljTQVTnAIOp/JdrgGwJI77KKPXNHHfzVVjV93bKg/VH
         3UoZ8hslSOBwhi7EhIOhxQXEs7xX7m9URXdnYwm17gixRuKqEWPl6mRwU3Uryo+Nsn/W
         uqTg==
X-Forwarded-Encrypted: i=1; AL+hErHj/eXGhHLA3L3ogbk6mKxFoyyWbYbL8fe87T5/PxrVbHu766YP6m5n5JVCZZgreFdcxHkJjT9QaVYln4k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HZcNh64k+NXd327DFxrw8E4CqmMcZ/fE5c1JgcxcSbcgWimcz
	2ncB4ntCJDIMW9yHtQ/guFeK6OZlIbd1NtiyT6ZcjfsZdZuDBBQmSmdtnavKpN4jaY4=
X-Gm-Gg: AZFdTZfuGx6a5bZ7OgyCGuLMCVHzN32lEYEW/sfzPkBR385Vut3AljChqopHLkBgDI7
	0ct6UliDCGUBVYZT8Q7OyrZdfg8U6mLyPgy9Vh3xa9WJWB4yTEbpOyG/2fIiFpEw7Y9qSvr58V8
	RDr21rB1VvD96EMGx1MVAW3kj83Jd4abaH+wl5Yuk0fpq6RQp+GEkDNm0Q5geIHoCvl+sJ8wanW
	Vc82hCP6hTRex6mDx8sOW0p3sk7GHcWuLjMhTHGrnsIQLlOhra3otd/OLrpKeYYAa1mRbHhEYri
	SmTHTGbOibFGcrDhtwx/k3hgu+EcEgZ9HmJSQk9wKSHWY8DUDEjqKelFKA8I9SCa05rMa0/tEa9
	ToiEt9OGyI12M5t57uEq/ahMs3x0VJ1/ag0mDIne7kf9JHaCP2ZR+pGb9xnwSqnJG6JJrW4RSsQ
	VH9JYSPjGOiI54JL8pBpPJZtyKoEexzCuj+BikiYMAxGXR0ZUOukE3+g0kI2+eJ18SG0SbnpapJ
	ygJtqnSjjkD09SHK/WhDyGtcW62j5iv/J6RGC44L4WK4whD5BXQJ3orWcsHsfk7lrZuOS94w3G6
	4Z4NSJksPB76VSXB6CmbaGCRePWnnaBaGkeK29NWFDYRtz57LGQXAfR0aJ/wML/mM1tXkWNjS01
	jfgiyk5/yyR+tyZVNv09ibKnzXxD9HlT2gQomZj7lWyxHowTnsRwFKbIZtUE2X06KEy/RJPBUsK
	ftLRRHkE1SkQ==
X-Received: by 2002:a17:90b:3d4d:b0:3b3:b71e:b2f3 with SMTP id 98e67ed59e1d1-3b41c95967emr16704304a91.45.1795587868123;
        Tue, 24 Nov 2026 22:24:28 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm29191820a91.15.2026.11.24.22.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:24:27 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: johannes@sipsolutions.net
Cc: kapil@presceralabs.ai,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	piyus@iiitd.ac.in,
	stable@vger.kernel.org
Subject: Re: [PATCH wireless 1/2] wifi: mac80211: do not copy the mesh RSN IE twice into the beacon
Date: Wed, 25 Nov 2026 11:54:22 +0530
Message-Id: <20261125062422.948748-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ac39fb1720fc03069317f8a74aa0f34d86db2e30.camel@sipsolutions.net>
References: <ac39fb1720fc03069317f8a74aa0f34d86db2e30.camel@sipsolutions.net>
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

Hi Johannes,

Thanks for the review, and apologies for the delayed response. We have posted an updated version of the patch addressing the netdev-bot+sashiko feedback here: https://lore.kernel.org/all/20261125043805.883952-1-piyus@iiitd.ac.in/

We also plan to send a follow-up revision shortly to clarify and rewrite the commit message more concisely. Please let us know if you have any other feedback on the changes.

Best regards,
Piyus
