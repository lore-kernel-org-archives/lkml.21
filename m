Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036591;
	b=XLrFGrE7YV+s4PwiNeYka9VIkxfUfsiLFa3ls/UQzfyMx1i2c9wJTddxhfke/ibukGss
	 uPZTpB+ZHJ0Ek3nuMlC9v3xPGRcyQBxU8FJk7qlDT1gINyRCjPJ7EJNqe2IC7HErAuXWI
	 K1G4P6Z+MoV+UOy7v0UxXSRQv1RqduFRkxEDfJ337OwqWAXZ+53TqdUCkLxBCkF1kH9q3
	 H4EbrsMhxtWsFI7ZZbua95XBirob9XN73n9Sou3Vgm6zWfwkwKR9DRMfWgrrH5i0ZNzsj
	 pPbbFIBVx0fzHMyc87zeBaerJCw5Qi0XCyPZ9ZcGzD54RtnT7piHOMTVOYDKoVx2wzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=y/YHJ2V7TLyLaA0CfPasf19cYxUxIPcmQV6VRFoc+cI=;
	b=wftocWjJrJzJRU6SVRydKW/xzZ8zTOFAWU2exWKdYquFSCWKnU4Q3cluqouQFIVrB8c5
	 RGsoXcUe4rJEj9642/QXJd3gr67vO03nWDoM6r7+F0h2YYNzRgnoqHd+ZYUViByEC1MJk
	 /4jxXdlyNzTZCXA02Xe29fpHvIZoak+4KQ3RGYp4EzU4eYbfesprrX/kt/w2yVcDmRYNv
	 KF0EXQjPaqpHDAGoT6P5g7kzvlxrLCKKdWgOeIsIaqR6gQ3SRTxJ5RJ/I9mYd4qSgRVzU
	 oBGiZLwyo5mnum25FNphQ+W7vecO85XuqVSxrLCEOtV4egJOVHAuBakQ4fYoMLbvo/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tAKIDOon;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5D8606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D5D8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tAKIDOon
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a60f90a924so747941b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795036591; x=1795641391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y/YHJ2V7TLyLaA0CfPasf19cYxUxIPcmQV6VRFoc+cI=;
        b=tAKIDOonM/7tAl+OKNOFPyXrRjlTvzxrmWiMXNZVhliT++H88DRZp4VsIUQSlAau47
         6Spe9kGkx/9/L36JcBVgrovt+2ZIS4Cr6mD4O+TqZXkb+Fs8d3BHkVFjNRYauw6KUOLW
         pdZMZkVm1dlo/rRzE7QAqZrltbbI/Gm+XgjCCSuf3kb6HHmDw61HbQhBPAfAaLim7kcd
         KHhTUjMGyljf1cYXetfpnx+xFF8C6Hzq5WQIa6scbKxA9JGH3dzX3M6mnJbWax5CbQgl
         rVV82iAcZE4+QNEKxL/Fr+9TjwXagcNwTZIGgDnvPrebuhix9W35IoBv55MqzEQgj6nh
         xwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036591; x=1795641391;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/YHJ2V7TLyLaA0CfPasf19cYxUxIPcmQV6VRFoc+cI=;
        b=GxYzwg5gpwbY/DgZ7CgRmWWv6wlIv1aaDvduXYUKQaKUPQ3Qd0rl4XM91WEeLMBTZl
         MigU69ASiuTn5Ypts7UxeFrnk0s7vzAg+Gs54xaWzCC62V951Eo0OnmkmrlD8BeCVt2n
         j8sC35c3czH0iUFcnXpAozxmw177GD3bwrH/erbrtNFhcUx3Zbh0h5NkDMe7HixrQp8G
         s2pqIhvV2/peuQGLVJnIYwi2MjgQm7OqEpuRgYec2XXtxvelXSk9uZTbRN/NvNP/Pd6Y
         x7Btm2eS1J+jv3aJv0cq9BP3KO3t8PO5EEeE5CjCrGdUxC/qE3Bg0jkwkb+MBhN2/Cmh
         Nyzw==
X-Forwarded-Encrypted: i=1; AL+hErEM0hH73m36ArYfFD/6zL80cjNXgdGDk5p4J0gPC6PQirDpQqmdqKZepAWnetkOoaqGUOx9WAr5CaPW4nY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9T52C3tkwiIPTNld33wOwA4ube2f4LbqeX+gjOC5VJ0JFWMHYP
	0mVhCewG7boCBHNgryqG7QLSVDRcNBAXfaghagJ0H4LNFp94HUWnburD4Rhh0Y9URKU=
X-Gm-Gg: AZFdTZdKsZaDm4pFHRzpEELi5jVVxGdkD1snwhdYYHh4JLA7VSx2s2O22itfmYlXgJa
	6bAt2CenBdHzCw4NPiVoX78iO36Rlb+V4uto5ERVxqUF1BNP7JTS+4YXL2Jn1eGB5R9xQ9O/lva
	/VfDOL8PpfJC2kQek7yDquc0uO48tHfgHLyIPZ5HHR8Bmgpk8bORCjBHEFzYbaSPDdShMzGXxqn
	jKWYvTsXuUMm/uPrKCiRQGU6kXm/fRpo209ua6XuESdY4KxHlAo2rpSHyjwMxbe6OlhOiN3VNhF
	oaYz8G/Vwygl/vl3JjXZULU7P8eySmYRmEZZlUPoMAJOSuRx24QsBFl0Azb42PF20kor3qk42Oe
	/RnuuggNXaHC/s9tQDLwhzNqvlIcaiS8zkwGPo+Z0m6OVkKSRT6fy0kB/pZ1XCd4HvrGMJ2lwko
	1gjutPXEaAVS47V9RcdwhSI1HnpuVoqcRp1PviqDOPSeBGDNm2QwQeWPsUVhofbjhGXBitbrsG/
	OpctRHKlWnPnVe5VehVBZ9jCeN7NgQW/vwcjMnvMXOPtsJuBoVF9IY3/InPyWMoSEKkxoEbCSH2
	7MThTvRrIjztrquKBbK4C75pklh/oa6NqfdRE265jTQvbTY3uzgdRF0a9M2bgTWEfrscnZr1FDv
	kLo3hLGMDuZvp8zFmXSa8+Q1Zh9CzAPwIHGQWZA==
X-Received: by 2002:a17:90b:5307:b0:3a8:545a:9e87 with SMTP id 98e67ed59e1d1-3b3d0759881mr3709135a91.15.1795036590739;
        Wed, 18 Nov 2026 13:16:30 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:e78e:f7f0:2120:34e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3f706dd83sm914903a91.14.2026.11.18.13.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:16:30 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sagi@grimberg.me,
	jgg@ziepe.ca,
	leon@kernel.org,
	mkp@kernel.org
Cc: linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] isert: the commands the target core allocates itself
Date: Thu, 19 Nov 2026 06:16:23 +0900
Message-ID: <20261118211623.2526894-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118113905.2361969-1-yhlee@isslab.korea.ac.kr>
References: <20261118113905.2361969-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v3:
  https://lore.kernel.org/all/20261118211503.2526705-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
