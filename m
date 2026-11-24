Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556716;
	b=hJt+R/UvhGAy9v5k0N/feSg/rqZbqG3QQT1zreVZQ7+dkv971pV1F/A+kefdw1t3fv6R
	 wdU2HafmKavaKfRXv+qMVuxY+xVQVG/BZ3QTrE9A35aS5ex6ns9ljnAcn80lYZsreDWyr
	 qlVGHFacZKlXrU9w010Y+MLRmPV5aGaMDHLYOLG1OBzXf7oodlGu98cQoz7lU62Cf4z98
	 C42UVUwZbmlb+ns4RX8bXM+SLOZQWdmytzq5iFIOgWUXT84tNyeMl3giC2S1huqBg/ySh
	 JDeT7BTOUXUP20IiG5EOmEvT13ATLpZhvLZZ6UhSy12eNstoWDf7c0tcIC8UhTEHZYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bTez84NgMvGMhhtSTu0NJdSFRdBYeMlDyeUBe50JSsA=;
	b=N9JVmldaZAWCNF4u0hqdrUDNTcF2WIq685PeKhx9fQJjZT+URGa3C+1HjeAHPsC/Z4uk
	 CrsbxqHIreXhRWdedBI1w7vu950Rucfv5UiiIdS3r+6DkyH5y7QN3le6H4bQ+d4Zvx2GT
	 51MAqkAIHn8ghT9VXuyCKM0RUs+DHMwpvetadEA2kq9wjhPeERf2G+YFbiSCxFW9ztIS0
	 7iA0W2N3UbP1n2lrQc/d50NW24KAC1bxQPzOVnQchMULDVmoxINy1+R/Y/IIL/xU4ncYr
	 ov6brjwaKC68LTY27zi0C5l/a9p6Sr1aTxWo7Ut7DxCgvR+CFutjZnx7zSiIJJ4Ze1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m/Pk4GYk";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0234C606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0234C606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m/Pk4GYk
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a511d8a394so518796f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556714; x=1796161514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bTez84NgMvGMhhtSTu0NJdSFRdBYeMlDyeUBe50JSsA=;
        b=m/Pk4GYkd4a0n+3Ofirfb5f+ITK8dBGDcfib4ub3zN7yISODpaZZ5mJ5xBGmohTMYt
         HC7ka87JswHaOTPQyJ2T/rBoIAHPU9Kte/ev8XNaH+LB9KAFn6P/J5WfJaMewXaCyVEG
         +3yJrJ2m3ARt37tDdBCJe3Ox2Njb1uwPHBdgPNxtWDoFpF+iLv0VEeCkzKO9gPk5IDyH
         q6AngNbo4UkQsLr0pz0cnQuMxwod4OQDXtRK7gTiOmWsqCUJKO97VGkdDcxNG6QVk62E
         XC1LvLd9nXySVrMogVq4z3of5DmjXxYhi61MhUGmzZ/xNFo3niBYWfIP+9FY1iLgXvmZ
         V8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556714; x=1796161514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bTez84NgMvGMhhtSTu0NJdSFRdBYeMlDyeUBe50JSsA=;
        b=AKCb89JSjHxMAWyL4e48cq+t5ccDSTsQjxitwtXm+QTKQgd3PL+wY6M0LEGorUxdOj
         48ukHNdNWzQpe4SxEc0Gu/rmfFRNoIF2lkSj0PDWYsLepsgD4bLsls8IVLJ5+CttIm4S
         lsFWnkXEco+VVAxhTq6Yx305BxX2HWSFyV7/H6FasHjffc3fKa7kUDfKkCPuru9kjI1N
         FiVdiDOV2nt7UtNpLEgpxmV9AurcLAi5tJn4KdmCzv5mVV3x0h1wBNGx5iB+VErIPJdH
         ooyU80nnSARuVTC0+jEfTRdu+qHTQRpJi80tyEppKWS5Mx18x4D5ZFuFthc/nFEKOR2c
         LQQA==
X-Forwarded-Encrypted: i=1; AL+hErF/8NatbOjoRpFOErZ5TGJmzanDA17otg30sk7ywodicodYjuftbfURJc8NY+OhNUT5gPiFPVg5lY66ZyU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+S+nAtH/JDR63co8qO8Ak9BF0AR1sV9VbY0TIvee+HWKkotkFM
	8lrkhIxRlYEWdJO7dLVZFh2hBy0FT3ppkcqmtZp3UYMaMsBE3F9rndCM
X-Gm-Gg: AZFdTZcKrbq3iuEdtMZDjWvUFqPQEQR3Oi1NQQyAUCl4DgW8Q0R2X2qZlocSsXFXGrR
	sZGh2B2h+nSi4vEcoT0mHeJMGF9UZzrhp8xCngnUg2XtUcLcge1e/vl9Oonf+JRETNITlDEDEM4
	tbk8bReqDd94xgnU8WXFTitg+tW/RqvqI/hh78jgM3fwEGpu7/vNou9QhBsMC4M+8dNVmUTeG/g
	SHLLA+cX8UNxZngSWWUtsRa/xasZb8uQcMpFJpDMHV958f4AfWApn5xTQBF4VjGJMeuc3hoTOEd
	OFOKORZ+75QiRz/kcD0EEdXxNH/V2oDmjWxEBfNv4IY+vo5+JEvZ0w1w2tonTgDuxyLLXh660DC
	vqsXixlum39KUSBTKEx6l6WBVhNM0KFmYpd8cVONx19kkns1c3vXyeQeQRPMnGAFToGOZHfzLNd
	hjJX0yHGXnkPvJi2fCNZRaIkEqGJJ37AszQV5QivXCSLsnc21N61OvynlykrTNCbDhRIHcdjBjT
	uaovylQyOcWNPMgIAtacFCBRLbrUULoSi3iEhJ7ZOOdLGTzuiwvXjojIfhWhXIjvtIUUz3VFen8
	3izolBVmc8EVFSdvlTrZKDnRhzKoZIvlQwi+jrJFxrvHH17rtRhMbbZrcO8qN74wLORlnA==
X-Received: by 2002:a05:6000:184f:b0:4ab:cb33:9b87 with SMTP id ffacd0b85a97d-4abcb33a2e9mr33409232f8f.5.1795556714219;
        Tue, 24 Nov 2026 13:45:14 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm29025201f8f.40.2026.11.24.13.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:45:13 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: hangbin.liu@linux.dev,
	tianyi@cloudflare.com
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	emmaonana18@gmail.com
Subject: Re: [PATCH net-next v5 3/3] selftests: net: veth: propagate bad-settings check failures to exit status
Date: Tue, 24 Nov 2026 22:44:58 +0100
Message-ID: <20261124214458.12800-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123052207.GG10218@Liu-laptop>
References: <20261123052207.GG10218@Liu-laptop>
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

On Mon, 23 Nov 2026 13:22:07 +0800 Hangbin Liu wrote:
> This one and patch 2 are fixing the same issue in the same test.
> Why bother with two patches?

You're correct, squashed into one propagation patch in v7
https://lore.kernel.org/all/20261124214025.11603-1-emmaonana18@gmail.com/

Thanks,
Omokefe
