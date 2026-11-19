Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105461;
	b=4FJWLnKJJ28d+7TVtMwd1YMeyvYydL44QoU6xck6Bx4vwRHm5CxHBFZgqLoCxOcVthSU
	 jf5HHSJacFpOPdpQ0Kk+sazj+tWCpylOzCYFyxQ9h5YtFNLpAHZbTbnrJudub7Wggk9n2
	 EaV5XwEu3bx1ZPP9f4s8v5TXpPOuS/SdgK78EqHNDwlaTQxXqnOTVoptHtiKsloZmMvkZ
	 rgZyCLImDBZsquNyx4wiN03SKSt5c+a8bxTajnIBOr5i7jOQ+Bf2+MkI6+JdnuJNeq6vi
	 NwykFLnqqgJI9bCDJsOetGTBw1Ft0j4r8YURJ5f368Cgbnd0JDtzysKUhqxlOPocCYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=veD1Lv1Qc2uM/q6Ciz9j8weM3Qao0zuakaCteeqyqzk=;
	b=pYgq+3cH77fXB9+NhJVzkcmfOAhm6gvkQUihG6wB6BeJsjmBAQXG0B6sPUztVnTVI4xv
	 xvakrcvBNXI3P4iJVibCqIxT5aHo6VnXKRA28cAOcqUBBf0ICn7JFODjrFNAt4doS0u7S
	 SD+RL7DbtvTuaJGgHSw9kxlL7lRe/ubZWkmezYgOyHHLksKrziRoRmd1hIdGd9NtO42BG
	 VOT3vWgAgOkGytcWDYLuvQ21hNHrNH/dgx/Bgu0eLSzOA+PQVe2v4EeIwbIy0ZshMwS45
	 7VmJflDVJ36wV66nfDEwIa2IK0VDhYWd1HOrAvjHTA/UeF31NjRqe9V/xcdRdUjFcog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xuS6skz+;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ACD606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3ACD606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xuS6skz+
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-372bdb942dbso3443531eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795105460; x=1795710260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=veD1Lv1Qc2uM/q6Ciz9j8weM3Qao0zuakaCteeqyqzk=;
        b=xuS6skz+90cnCnUS62h4GAD/2HJ83iQYwaJwnlTZkBvuk6lpo8GkLOpnWjiFIPcMqf
         l4Qt/WKVQQq8KT4FnaL3kIUGvwBIpK7O86K2jVFx0pLxOJxvjLcPfwqSnFTd9ZxTLYIW
         LYvkskvYMOWHHdI8e0BdISlGqF5seDXgKAEGAWoCu/6Pyr1RkDdxYrOuttc0s9EuMQBH
         anSoElhJoPPlKKatVDWlNAWUe3EqzRTnG0u8EuMJnkuY69g4wMQVJ+9Un6CKdshDqQe9
         eUdZJJe4Xi/3mQTZv8m8eXlTYi7vmW17OOKGxRttopcQqmZeO2VKei/MpHLGYU7snxVs
         5OLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795105460; x=1795710260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=veD1Lv1Qc2uM/q6Ciz9j8weM3Qao0zuakaCteeqyqzk=;
        b=aEdTx5+VngDcJhJe+sHRE9lLxgR/mhW4E2rDMKLQhnewA4WMz/6s2QLxjbE3ILLNpV
         uDpHZyEe0yXUHDWzmLmXMN0+nDLO0bRdO+48Ys0aY7mJTJoQJhTeBu/aaC5yINulfaql
         og+t4G/rR9o7cFZpVPyNfIYTWvpMHGqpHh5Vswztz5lt6wf0vJ9IjoPjedd2bibMtMeC
         ssQOWuqSP1fXTZYwhuHN9Dk4lOvsYiNRcnOC+8Ly0zynRYwz6s8rs2d4//hYZWtMn9+I
         s0gOWMXDblQ6GD5TmMNnSRfFP4KMWUxATRvePwQWV1Q8UJygjEpn3ikK/aNlO8JdkPlm
         82RA==
X-Forwarded-Encrypted: i=1; AL+hErHDmbJIvD6hpjkq8hAHvEyRpjrKediaMTnNUApVghZdg2wpvxSGFyVDxsox3vr4md89Oussw+aD9/SgMbQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UtR9D4sgTw8q3z9nnO6NTF7Zvqi4XFmIXzhvhHI23CFnM0jtK
	nu9JvKmfjOPpLK/R659tOAskGfjObm2ue9QoAT/iRAjlAG66XpIJwGZ8
X-Gm-Gg: AYBFou1expgcwWRmFNrlStu11cG3wiasCLAXnlcQ2+gnY9okPqAJlOQH4ZsIw3jGDKA
	R8M3cm9J+Z6zHcgt1R1GVecKhkEzVScRz/CjOok9wx4buW1JQVxx0i94TynKKVrscbRhs2D4EQa
	TNRTa4wgTiQxOl/yCkpN9aVf9ClIlNqlv1DnV7S6XA+Kcm1JBju1TtmcwRyLFWAiZ/SogADqsYM
	RHocXoq9BmZzcI6/1mha4+9aAq7xKvaFkqlyrWRNw4wtzR/QApR047CLZxNo2jFKe2Y6Su9+nYh
	pGIYtmw583ogby9+D1Q7adeYI/6IeZKULkdT6rnrjPo9Pr3iP76olpPGU4YoCEJL6cLtVmLvSpn
	gMYnkEzzIdmZXse5rCRNMGfRfstmxto7IHL7VK0y96AzMa7vtDHUKfdXlM4E3VTF153o2EZg8B8
	ZmlHkcefgW+PSze6V9uuLDm23t0akL/OM7mlspairwEDg66cTqbD1cEsYBgw8E+YWSEQsXpSLjW
	zliHlhcCCAjFQYM9lcTU+EX1PmOeB+tQUbwMDUHnTNCguIdMkiTIClnd9nSMvIFcA9jpR7zn/nf
	j/sp4QR+KFCsj0XVvoaV4sBUeBdmRXjbgQNFk42j8w5a
X-Received: by 2002:a05:701a:ca09:b0:176:2095:1ac4 with SMTP id a92af1059eb24-1b5568cf673mr130993c88.18.1795105459828;
        Thu, 19 Nov 2026 08:24:19 -0800 (PST)
Received: from evo.www.tendawifi.com ([103.98.7.209])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm302840c88.8.2026.11.19.08.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:24:19 -0800 (PST)
From: Archit More <architmore303@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Douglas Anderson <dianders@chromium.org>
Cc: Akash Sukhavasi <akash.sukhavasi@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Archit More <architmore303@gmail.com>
Subject: [PATCH 0/3] drm/panel: Use lowercase hex literals in three panel drivers
Date: Thu, 19 Nov 2026 21:53:50 +0530
Message-Id: <20261119162353.12962-1-architmore303@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Convert hexadecimal literals in the initialization sequences of
newvision-nv3051d, kingdisplay-kd097d04, and leadtek-ltk500hd1829 to
lowercase, as suggested by Douglas Anderson.

Archit More (3):
  drm/panel: newvision-nv3051d: Use lowercase hex literals
  drm/panel: kingdisplay-kd097d04: Use lowercase hex literals
  drm/panel: leadtek-ltk500hd1829: Use lowercase hex literals

 .../drm/panel/panel-kingdisplay-kd097d04.c    | 242 +++++-----
 .../drm/panel/panel-leadtek-ltk500hd1829.c    | 426 +++++++++---------
 .../gpu/drm/panel/panel-newvision-nv3051d.c   | 286 ++++++------
 3 files changed, 477 insertions(+), 477 deletions(-)

-- 
2.34.1

