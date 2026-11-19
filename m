Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075313;
	b=I7sB5hElfFB2n23JbPkE4Hbmi+vdEerXDyjHBIxvIArIt3ls46QTcYriWRTrqWbMT4/H
	 qlmSkzK1E/yEXHSwz9jvkhws4bFTXrG3Zg/WfeWzbgS/xZY0qkYsMjBLNdScqm5kWLsEC
	 vgyMRQ60JRNXumBx0Uq348yXiRxn287iqGxNtCLzy0o2Gx9BOJ0IeByrLVQSxvb7g3awN
	 TxrxzeHNmf87ZRZOw73ZVQneknwfvon9NCKXV0E4CWmz4iycFIG+qycOnOtgRIUF/QO3p
	 2hxkO7Zp6RzCh+rso6O4DBi1YRBYWhbarLJB9WI56Qo4+VR8d9gAZGDhVc3A7tzwSvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TD/zLF3BPhys0bLsFUd/QjGu/MrgT1KFKv1kQ2YB9rY=;
	b=HHXR+nyZ4Qwcc1zSqKu35V/ih6/0bt1pwXmH7Y+s+ioGQl1neV2ivDd/mzoDOHfDCaWt
	 THyZzTsXKLDp5QlMQ1NJUpR3GLYd8wsY+yBGnwe2I7x+2PdzRTrUtmQg4yrHUUcFNq1EX
	 CQQ75CLQLFCxVBAeryZIBo9BOn82HcxuDovTQvLhKOlA9voEixgvXDW9a1/zzA4MQ/MJo
	 9ELuZP5GGrMUf7j0e8XzCYrmQ8rtmLDATmWtDXp4HlAaYH2wxEF9lit2TJorFaO16Lr8v
	 EBDDz3sXhhyajUm4v6GLZZKmxNkPxmtqVF550Y4tP0XCXKswNbaKWla7T+Tgp8HbMIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BK4bejxK;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA94C606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA94C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BK4bejxK
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso11705305e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795075311; x=1795680111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TD/zLF3BPhys0bLsFUd/QjGu/MrgT1KFKv1kQ2YB9rY=;
        b=BK4bejxKp6bfg+rlmfHbvR0WRH8DLm7OIyQmL88s6htTL8QwtlbMJf2amfKHNLYb/m
         +THmOr0kUpc6yjG332lji9eHZemK6mCMg8xHAfWF/rfND/mEws65NnHT+jE+ZgOyl6w8
         8aKThkcT/KyxicHGZ+sEnU2ExYwuN2B1oFZgX7kLIGL7gF2ebsvlBtpCHmZp/j6a1Xwb
         jPO8zJPErjuaJ5vxzx89n6ogNlEJwYHGAj9Hx0zgFCUlafuWwY4AMOTKm05v5JnY51bU
         s0g7fawnq9LzBeGp1WJQTLkG/BEFJXqZcHXagbYUFi3QBYY+6GPo89YOCC7KgufAz2TN
         5A9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795075311; x=1795680111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TD/zLF3BPhys0bLsFUd/QjGu/MrgT1KFKv1kQ2YB9rY=;
        b=H+bl38Ah/DXG3k1yUsvghdPqAY86SkBvmfbTtNeGZHOXQ4i8qtjve1yBpdFjA6H0rV
         SEfD1dhLmijyz4mBdiq9idyghUAuUH7mo/cxCpUw9c8oR6TK5V0n20hLah2njjoF4EA5
         36p/XZZeDnk4vskm03EGUKxV3InUZAbEKDzNvzq1u1CT0V7WWjVgtDbbJXaEzggXu9SU
         KL6cJ1QZ2rouOZm6d9dl+Bqw14r9QXnaBSaVS8zBZlVFlwCn42VRUMrsHXNuXr1ChblL
         U1LhgzasUCnFxxmB4JeIAq7YIDRYgHBkpRjN1dP178GPDMbwgS+e1S6Zvls77IDqF0TJ
         JB7g==
X-Forwarded-Encrypted: i=1; AL+hErGJDFvptrL63lUTU/S4Qo9khwsGSQtqNrSetZ3KDEZbqdwcXzuqC06i2EwlPAk3YKNKfqHCBklKHiSugdo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NgB5Lgvu0jQeSoc3VnTw6wq6WCtmz9PVGasOwdv6yDG6POtgw
	CM4IZI2nIzN+MXU0zNIVbCVncRAOu46T+OJfS0YDn6FD8VNyIe/UoGYc
X-Gm-Gg: AYBFou3Fo1ICT3JXCTeGxKL60KIghnZHFzrP5d8vnHOLH2ZExG5x+PnKy6tKN4MLLbG
	G2nfoTA9ZvHIVkw6o4qlXL1XNb7VISRidGldoscnEvptYoVNwx73vHeYEKPKsp9ZPk4Jm65AADx
	+xJJnQpgmAywfnqRh7sSBZlIkkQpmpmHIhPRfrXY4/o0TtFN4WMjstneB4UVtGO9tBxffVjwgW5
	psnEcdV3uBmgbC3tIArysVagl4NMUMz6ZL26+WuxWW8M4j0u7x8msuN6JHhOwnqwucxmvY3immC
	CUlXKzvi8RQpHYhgWzEdQpkDCrK82ERAmGuMGS3NoRpijXzEIACKr0V5Yi0hm6Eg0hX3amHC/WA
	8xQnlH+YFsi8q0TR97c7wWpTAcu1+fArwCqQHp0+OOx8z9X25cr9W0+dMKfQ6wVFpRQSXmAZ833
	Du184Jnj5E+MfpyUqdwOL8cNaTI5VUHFL/KKO1x5WC9E+JDO2Cn5tPtmLI6JOAhXL/1hU4AM0io
	++8HAvMLTwRRvN9vaJX9jLv4/Z+39nrhN5+E/3aznLhYyqfOJq2mBal1os1RyNf+PW8fdKuS/Hl
	cdsUQnW2BzYUrypa0yLLyKkRZ6rq1zNscGEVODbyIl1TWD0euOiyrrQA2EixRdR4rydUXRIzXJT
	GsIighPcRWIY0WNcqYRHUsswpMd3AqLTjkU2L03D6TUqn+zk=
X-Received: by 2002:a05:600c:3b8c:b0:4b7:6942:39bf with SMTP id 5b1f17b1804b1-4bb7da3a68bmr107159555e9.28.1795075310807;
        Thu, 19 Nov 2026 00:01:50 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560882asm9602389f8f.27.2026.11.19.00.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:01:50 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dwmw2@infradead.org,
	richard@nod.at,
	miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] jffs2: reschedule between the data CRC checks of an inode
Date: Thu, 19 Nov 2026 08:01:49 +0000
Message-ID: <20261119080149.311902-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <sashiko-outbox-222025@kernel.org>
References: <20261118214045.107562-1-orgads@gmail.com> <20261118214045.107562-2-orgads@gmail.com> <sashiko-outbox-222025@kernel.org>
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

> Should this include: Fixes: df8e96f39103 ("[JFFS2] Improve read_inode
> memory usage, v2.")

Yes. Before that commit, the loop in jffs2_do_read_inode_internal()
called cond_resched() before each node it added to the fragtree, data
check included; the loop that replaced it in
jffs2_build_inode_fragtree() has none.

Richard, can you add the tag when applying, or do you prefer a v2?

Fixes: df8e96f39103 ("[JFFS2] Improve read_inode memory usage, v2.")
