Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795662997;
	b=vbN1Rdc8O5ENXJS3aD6QDApf4hQ3dPrFFmqMQQVxQlTqlUnx5VbvJC3YufQGubW6mzQ+
	 iEN5xXEhCRHR1UXofkD3sPnhSdfoBlnCAJrEqXn4VAv1f2lkWjoh+C4UNt7ohm6G87pXU
	 gV6VARyvcwwRqRxgxwnQNPyzBuBCC5PETXGHRWgdJVMc0oKb8F/UAwZvTdVyBYKSfGLuF
	 x3yl6PNV/cP235ZJ8D6p2xHftBbz2aC5lXKbz55/mcV/eVspvg0ax4N0DTmzYLeHSJbit
	 ltd+HZ/d/iPWVF0VEfU9GMsHFWRhf7TRZuKjHf52DfF8hhfQDdEPxXBw7kEMEacL5/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tcooh5ifHPPkIJoD1PmC/XnuN3ZG+rWbfWXyKgveikk=;
	b=gNMX0bJZQoTO2ioGbATKAZBKIJsYAwOrsnwHY6cFe7B2pV+y6caFNJB32wASjWh4Tw6y
	 EfwvnwRdt1ouBKmIutvl+eMCBMUZRLgbspjpuGfGkbR1PujE5oG9OMj6HwrfFvOnXEhy2
	 nCOVUJAq3EdFfjNzxfTZ5y1viKLOT2or925rVeRPPDe2Lv8yM71IqRIatG3Up1n2DBPQR
	 bodKIv1cK4puMhCtzPAQp+Y178HIsAtnORCdyZ8fTtCfGQVl1bGYk6Y8jNlahHSYCsfsJ
	 BnAzDcOaUVVO8iE20k2YVdrQW0WGOlCa24mxpP87C/Tb/gS1Xo+llVVzoSGgKX+9jJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MGwprOSn;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4C5606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB4C5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MGwprOSn
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so4070268f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662995; x=1796267795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcooh5ifHPPkIJoD1PmC/XnuN3ZG+rWbfWXyKgveikk=;
        b=MGwprOSnfeB2ebxHCrGu72q+crBvJDpFupjkNuVyK9v+4YTB/tyEE0RPUft1NK+eeY
         CPNFTdMGi9ZkR8CHnsgBDxEFwVAWCykYr+Om0RsEcnsLxrn4qSktHEVAytRJq+fUHOmC
         t5+8N3v7p0RJ/CnGUqDjFIuMyTIMlXDUtiogGqgdXlFJXiZqvr+vwNuxOosj6i3S96uy
         4mHoe2sAeBQd5Hrv6jKHLGUmQxrCiYas54fN4fsILHJQzR7/41Tz7D9cim3OVp9hC1PQ
         XpnZgPTiyya3qfbOODjAuFcC8uKfKfOLCXTi3Ey+gIdP9DUU98ZzhJrAYQNrZ63/ZQxq
         kNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662995; x=1796267795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tcooh5ifHPPkIJoD1PmC/XnuN3ZG+rWbfWXyKgveikk=;
        b=XGUXgivHZM/YITvH1nkLTRSk2WXukPgd7GMWa2uReUK8iNfYZd5mgEaZIZgI1jG1a4
         t0MaZwY98PJ9zOlAhDTYnOg5qKqNAUtcMIoB6ak1wqA13GJkuSs1koq7Q2/ms1V5YAG5
         tCQ8hmEfIfY5A38+VKHayakICHAdu3JpzyHGfAspHQyKskIQ59/00xoO1oJnuz5UWw38
         u/Xr4yEppSSPmcM3LAi6FfzTi1HsoVRgyWzyYPO3FW1uFxt0VByL2J46cboWaaCvCIe5
         q9HRh73Rkrjg4gpkvyOOdZFyrQNEDW70/2CXSBFE7uMeOuH2HKPiePdFtYx8pmY2glSE
         ycJA==
X-Forwarded-Encrypted: i=1; AL+hErHDW+GWTzReqAaTyrNgBEz6Torxf1nj926s79cn+Vyks5/n1MN102D1faWmEof2Oy0DZAIFPtuxv9zWP/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tDla8cXT/Vxc5afK1oFqf5dwsOyprdPMOYRPi2WbOj8HlKwJM
	qi1O6JLMZBZOspgTR4POrcE0eyDzgbYxgiBauqPZVLOLCHibgTjrUP5G
X-Gm-Gg: AZFdTZcPqpTYRs+w6uhmQdTYTtJG5cWQ00JEWFx9defwAekavu8Osy2Ur0pjx+QGWaX
	tvNIyMWRuoN42uvnDVIvfC7kC8NJnhwEwgXir/rtsvvEOnKIsyWomMhhyB2FK6bhqPO0TOu7OaS
	jrbZXBooM8lBq97+94q6MHzcZmsD8YLYKIjOrgrjJU8G0PBqmaZWOiaCDG7rZ60qaobFpiOW7qC
	hjpcsKSfnTtLE8vZHu1/uqokfKIus8Akv/AySWB7aWgq2/uqZsrFFGy5u0kpyDMbb6/t5UhKeX3
	yp2pH4u5A7BJQSMobOXRaSIUz3mBBNBPOmzmjeWI3FQta+q7g1B5i9FmGo7ublKdTYRGycRvESh
	VLMJd+utVX3TOrPvIMgqFwbN19myrrWer96ZP2zwZz5ozbrj6HlBaEdA81LkJef9wZMH+TV2wRi
	vQBs//rLjkkrSlVfQBchL11hNSm4yhWuDOgTajdudj4IaBmPoJqS/oF9h3nB2AniiZsqsKGSnVN
	eQ7HmZuj4cfarnVTkXLuSFN3WVTTYXICZ34Kg5XdVFEz7asFNG/pcirOheCdSxNSXVvLrEqBZ27
	woBUOma5Ley3c9XU7U66/GxqVuK0qAefMAwCQdoQcPN/RhqdXvd1r3yp3fPOf7lb0dsQW1qViV0
	EzwvgkAD/dXEG0Q2xOKO+xe0L2kfEW1CjBjsdOS7sFSpLEuqGwgTkM2nI/RG1eBugpyqClwtjX1
	qi88ZEtK0VvAjO
X-Received: by 2002:a05:6000:26ca:b0:4a7:1fca:e52b with SMTP id ffacd0b85a97d-4abb0e469damr39967504f8f.19.1795662995002;
        Wed, 25 Nov 2026 19:16:35 -0800 (PST)
Received: from localhost.localdomain ([31.223.101.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm43323619f8f.55.2026.11.25.19.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:16:34 -0800 (PST)
From: Oguzhan KAYNAK <kaynak.oguzhan0@gmail.com>
To: regressions@lists.linux.dev
Cc: ntb@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>
Subject: Re: [PATCH] ntb: ntb_tool: accept hexadecimal addresses in peer_mw_trans again
Date: Thu, 26 Nov 2026 06:16:25 +0300
Message-Id: <20261126031625.166614-1-kaynak.oguzhan0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126031506.165973-1-kaynak.oguzhan0@gmail.com>
References: <20261126031506.165973-1-kaynak.oguzhan0@gmail.com>
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

#regzbot introduced: 21fbdc4d0b1e
