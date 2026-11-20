Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175008;
	b=CV6M40m0neyXxnmM+bQK5B47YniQ3xxtNmimOm1eoV+rcaKFjw+6GcO+pPLYeO4BMWB2
	 IvLjQlBy1JTcDHDPZl1D4d8BCpKqyDjW11a1R4I+AUW9qNzLB6OLILTvFswywCkSKj5kj
	 3K0ZT4+b+SOn8q7+MYS8THDvT34FimZ2XWJsjHWCKnyCej+O3FHwkj3F1MvnEBm/9hylY
	 WztO1JqBsDGpU3NwgDB0dEeEEnuPfK6OTDdVmbwWH1KEBSgW4lL2c5/MCX3Jz7WyFBvAY
	 vazlrvWF+p0dHg+uP2T48wUnTlg5UjcuMxPx6BXrJl0K3OfnXqj5NW3bQw/JYHN1i2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JKVDcVP//zHkOXKk7Ur0sLupEhR21nn2onJ9oD0549c=;
	b=cD88PRa7DVtLpRYOOVTT/rPtw3sAZbP1xnNR5LRgXYM64loex88bGjxpTayrMLT2J3cL
	 duemBgBh04Qlj1F2S/CmPp3TGi3yrj+mNn3bsf6JVYNn6TPux6ua3TCcaj5bm7hqGrci9
	 ZEGCK1n+okiuKErstIcpfwZBvw/vEc59215S0zj8l60RxrdeHyvl/f4Pfk32RQzrFzxEp
	 8mQ6vdkqkSd20Tbmx3LW4KVnaBCx8Hgmrc+jsxKdKlqmV0gltIvAmPt7sn5P0S5l/xOpY
	 b/TjTI9aH6ibEC72jfO3yDIWi7ceRVNu0L9dYLvgpp7xn17EZLXZdZGohYS7FXdCF0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AmM4sbW3;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE8D606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BE8D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AmM4sbW3
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so605986a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795175007; x=1795779807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JKVDcVP//zHkOXKk7Ur0sLupEhR21nn2onJ9oD0549c=;
        b=AmM4sbW3wRajBmV9K6JUL6vMeLGGO6EWJdTN7X5AVs8kxX87RwFGIB+xoMZxp+klCb
         gcfca9AlZ0SEertuYHf/jDXqdSPlzqFzMh1drmQjoC5i7eTskdtKsrYP4R02qCcwU7Vj
         2mukDvcfU1LOEMCimjKYkwxCUGQVLmvvNVyPpM2KTkNjfvdqHhRwseNCyoxYVVGAxD2/
         WAp8o57ZalU08TJBnw9oUaliqhd3oXMifMCw+sqXTvBQOAol+Tj7A66Pd4BVDXeyoyqn
         L3U7Qz0gNv5gamICdvRNHKSNs8t870u+miv0CHimXX5mjFkFj64e2D2nySngfncCW5TA
         Rojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175007; x=1795779807;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKVDcVP//zHkOXKk7Ur0sLupEhR21nn2onJ9oD0549c=;
        b=z5lGhV1xe/IbuutnbLy+H3b92A67QUPlMR1tqWgCogEM52tiIgwLcKzbqv+/G/00XO
         99NrhavMFz8thjOBiJ6rE6/CST/2TB8AdZv7VEnTBemw3bB1J4jMnheZBN/zdYz1pbro
         RKwjgvO4J6ipbc74wtb04KV2iuRBTvqlaPALaYlz3DUZjoqmuvUjZicKEpwDcpNzDTpX
         jFu/ONGk3j5lxU4u9u5nEnqBq7ajZp/jkTKTXOBDcBO1Q164yBxEMOJEMJm53fG87YEu
         +3nxg+9rDOLweQ31vd8+eb5yXCoPBuhSCV/FyqMRkb7Lga0DlY5b/46qr5N/ZSUglvmQ
         apzw==
X-Forwarded-Encrypted: i=1; AL+hErGyXk9zZPA21qsHurn20yJ4BEDMR0MnAOvfNuKRKSVPvUmgP50ZYoy4BURXvWC45xH2d8dwcbTF/eMP0/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ut7I4O9eP3zpYLYpxqa2GdcLTIxSjeE1wHNJAAyIExAxpdCNj
	GIoj2QgMsHMq9VZDpEifbTsaBha5GR4t9+FB0HE+uVxOxWYTygO65Znc7s457Mu1BmA=
X-Gm-Gg: AZFdTZevu/ZzBbQqQ5I1n3C6Uw1Q+NG+gUWpS54B0rhi/0xeWIn7SmkRNgYokvTzoF+
	A8/31Nxz+gvqRpPL2ZF2TkHOfF7oZB2yy1y13Dn2RRs8ZCN1drntwlpwA+8BvYhOS1araA7NL8O
	fhj1uXWbmlFNFUrLssT7wBW7LCRPSDc5J85D3I8WmkaSJluOEi/E7z3saqiFNNwEIvWYX44Z+07
	hImWYJPH4N+IZwYqfLP3KNnIuEra0NuEUgUpu0tzjwW/vXfghHo8IuXox+Ba7fRFG3ehQ3qKee+
	Y57//36N/8bI0y+I5dqlqV/3nUGtks1znaa/8h5mqDrGvqFO2iYmhUIrfiasKQl80fNqGxTnGHg
	sO0Jy1D/xv4tBwO9yvtrMi//gO9Hjf3SkV3+FOUcEFSiLoiTh+dsX4Z0Dx/aKwkXr531vjduuDF
	oED1XkWO9REfMSy96phmtUskWO+EA9xQRRTsRoz/q9x13Cl/pmUDdWMUt6j4hW4cctlyf2b+XZq
	FcJcEoAiCI2tf+M7nOFnqJE/RF/S3k4xPTfPQct2JuV3RNVKkX9nYOIkCh5VHKkGGO7TksfV7km
	VHUpb1CbuAgskcJu8MMzgUB/RZfFOvUivhwQPIxQO1HkznwqFf1cOYaTTiMuZRDdrYuy4KAAmwQ
	0fCGDB9v3puji3SYgqicame4Qx1hHa3YO2lUi
X-Received: by 2002:a17:90b:4ec4:b0:3b1:7329:a127 with SMTP id 98e67ed59e1d1-3b41c8fe148mr2267683a91.20.1795175007508;
        Fri, 20 Nov 2026 03:43:27 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40548711esm7500917a91.0.2026.11.20.03.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:43:26 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: justin.tee@broadcom.com
Cc: hch@lst.de,
	sagi@grimberg.me,
	kbusch@kernel.org,
	linux-nvme@lists.infradead.org,
	nareshgottumukkala83@gmail.com,
	paul.ely@broadcom.com,
	kch@nvidia.com,
	jsmart2021@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet-fc: bound the FCP command data length before allocating buffers
Date: Fri, 20 Nov 2026 20:43:21 +0900
Message-ID: <20261120114321.3072318-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013104038.3078601-1-yhlee@isslab.korea.ac.kr>
References: <20261013104038.3078601-1-yhlee@isslab.korea.ac.kr>
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
  https://lore.kernel.org/all/20261013153316.3178656-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
