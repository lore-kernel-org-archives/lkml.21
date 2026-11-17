Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938638;
	b=KpYJ6vSroIr3HGwkzwawx0NHbwTllROFxlji7KUFgsm7Me/TBkd7gXlN1cGtORFAApEi
	 tnCAWC9lZWX9MIEgvmUpe79PW+lsqlpG6ScSngCqkNpnkUU1iP7SqP802Jju04HC4erdb
	 Mqm1I1DU9Yj1B1aXypKz17duJv/bfexHp0Ui3Y3Yaclki6dqlLXivzN2rgPyCXvDamVtM
	 olurtreDlgs20fSik1auryZAN6AVuFogB+2qHh8Wy40u/UILZ81BmZY61e1l2/JdscKtJ
	 qI+wXdCut62P7OMiPppw0c0TNUvfmF7wi4L+Bo7rozk4vBl26BL7iQNK7tpzTeEV42g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0VS5qw0tDHXtIn5LwXxf+fwugty/kad7Ay611ZyzaX4=;
	b=ajiEe9nHn7vnHdAxtRZqJ4O7ch8N6YjW+6jn1uj3BHvsJ4YYSKWvSkgT6g58rFyxByKC
	 FfEmNx5S2Ynbv4PHQx2NJEq59AojGv5bCv9m6GO6TOriz55zH8r4uWNhsySqA7y6RR9no
	 2D2jdrRNeYHnkYx5XeVMOmWCd0CijgBOB561Dw1MZuzX7fL7dlTAIP3nyQi72m2j5dA2X
	 /bsNIno4uHgZc++TNi7wUkL1/KhqC+pW0dTTddujrWKBB2jP1O2IQDg1G+OtvQJ6KgUHm
	 Vd3rf7/B1JL3CpKWPvyop48MwA17WovSyfdrxdxl71i+jIQdKs9eunZyr92B7EyWnyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YpD0FpDD;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E15606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25E15606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YpD0FpDD
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so1697075e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794938635; x=1795543435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0VS5qw0tDHXtIn5LwXxf+fwugty/kad7Ay611ZyzaX4=;
        b=YpD0FpDDwRYk0+tTDmxkLlPBd1kyejPedJ5+xOxM/EcL4d4r+LLb1C5UTFjzFDbyHn
         lc8CA8zc0kpx1QqrFK8MRm45z69yXPEqhaARuSnbcFGPXf3Nm01/FQG9hmhjRE0Tv44X
         zlRDlB916srIukvu4S0uA24/EJktwNQboQh2nKfSB/sV4NNph8SJ2NzpwcXQPWC0YJOM
         Jb5+XQj7vndiTD9RboYhHMRDqX3dUBW/3OK3h5jSoNG7549u7exgeuds6ElelV5mZlII
         E4IVOAL70g4E4TawfnDbnk4kKgLd18gvQzUpvMGuT/GT+QYhyeBFkrUg2TFRLOjx+4y8
         wCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938635; x=1795543435;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VS5qw0tDHXtIn5LwXxf+fwugty/kad7Ay611ZyzaX4=;
        b=kfP/EvucqJYUhJraNgEudAAebZSkELzKhPf8XiXAvRxUp30y059VooSv8qfOyWAoIc
         h91AdXFd0dcjfW4FqgSlJJza71qMA/0DXM/33RiJQkTm2JkkmNuMiMOvdg1SiixfxJt+
         pcs/gIaGDarLdFdBGJUf3eH7of+ZZhgtcXn036AfRSxsd9U+1HaD20Y8nUtPVbA6284X
         1t1iv6MDzRfUZvJOZhEDOCYmn3ChEgVf7BbhBNPak7d6HfFD8lLS9Ry2jeNZOBTjamWf
         Z6CdLFAEM0zsP8CIdnD43Fo0Sxazz4+um6/GRuD8496r/NgE8/uVPzT6gG9TbWTSkTeG
         lGHA==
X-Forwarded-Encrypted: i=1; AL+hErEhXhZFRm5I2EBuPzu/xPjAXXm/MJlhNUY/IPNah1n4wZnWb22qqqSnbZQdcbJKg+l+YICK/dwzM0J6+aw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OmDvGmCv8Y0aFrW1EwyK+W6du1jhwDC/h+kGbMIXuddxofnxX
	JCjet2my0qLitsIRaFfRHiJwrmSkHAXkQP35qkfYYz6k2JczuUVGQ2nMPINuDniZTxw=
X-Gm-Gg: AYBFou2VjAKfznTQs6LYj4kaYGlrMtbl6QuPvymBxXeN8f1gEJVnEyLyC8o1bOpUEHO
	u6+TCXECsx10WQB3FG1NjMJLu7i8RfO6+FyMWDXNg6U5M5OiaXuffPsk+UmvN4bncEy2xeDlkg3
	9Sdw9S3S39PhUeXf/WAQkCsi8nZU36rL71dg66MhHx9YOBw0tD74/qenVymVbcuS3P+HLEQEYJt
	+HiLq7mJFHAczcUhjJfnTWUP84IKUfv5KVuoRFhw4GaT8b3l+ljNJ77dCq6nfok216BOqPTMcn6
	xFvG5CFSFVRLOhSzLAvFD24KC4VMhPw2znUzuDHCtgwUij5Hty1/5O6cgG4LXSCPQFq3tnGLAz2
	YXpBxCfubCTIU1oGzH5erVkEob71bRsPQ37yFavjjkcR141Qy8K35Ec9Lr8m8TBSzl0fjNqcCtN
	sR0KXJG/ekyL1NyO/k4R+aVHYKdU1HQKIyZrW/2RHk4C0ciVeJHwwHdSOhxNjAVohPDXwwODJpy
	f/Ri12tP9WchR56pUgmPYgOY+7m7TGh7wTCS4EGpMLM5FZQ9XuFiJOpeJR31V/N+gK8lJWGiFzJ
	ms/xGAyHvKueBJCPkBPj1HOx9/tf/WsVvSfMrFIIHKea/oWa
X-Received: by 2002:a05:600c:3547:b0:4ba:73f:ef5 with SMTP id 5b1f17b1804b1-4bb55aa4fa9mr306817705e9.34.1794938635593;
        Tue, 17 Nov 2026 10:03:55 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm81197935e9.14.2026.11.17.10.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:03:54 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/3] clk: tegra114: Add CSI pad clock gates
Date: Tue, 17 Nov 2026 19:03:45 +0100
Message-ID: <179493854888.412784.10630903001767923804.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116150239.264139-1-clamor95@gmail.com>
References: <20261116150239.264139-1-clamor95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to clk/linux.git (clk-next), thanks!

[1/3] dt-bindings: clock: tegra114: Add IDs for CSI pad clocks
      https://git.kernel.org/clk/linux/c/61b67dfc9c24
[2/3] clk: tegra114: Add CSI pad clock gates
      https://git.kernel.org/clk/linux/c/ecb755d4fe97
[3/3] clk: tegra30: Remove CLK_SET_RATE_PARENT from CSI pad clock gates
      https://git.kernel.org/clk/linux/c/4d55ffabc35d

Best regards,
--
Jerome
