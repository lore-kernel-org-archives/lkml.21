Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605992;
	b=HcUKRUZ6TWd0neCm5SNde5fgeMiJdnFjOOHkX2s9rSeqWXuFDqP8ogNdfx1te3nLXL/X
	 t88FbeU512isaQw4iP2ac+V8QWY4m8NKED1vhWzeDWKfF5HCBT64lHRhu954UQ3dbK88Z
	 Od9X0PHKA55JHjfFoom4yw7YSIML4syffHXmRZBAeTX3F9fC17+AmCbLunA55BdaDW9aj
	 F1JCcAHT+eN9+wmKhc8/ULQVpCpTuvM3xpJItYYuoCZKWlzyecn7COrPOcwccIlV3c2g+
	 OyenU56w6HmZYt4BdpPdvcsWzs/z9oYFV7vzofBBsxiPb8VgWL7MfUL22PKNFNY7rcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=g6WheGrEKozXa+Lv+Pc9T/hQQN8VmqyBg/NVOB1TtcE=;
	b=aHC8DsUsZly05eVeSh/q3xr1Ckl53LpUHjaITi3+CQ6HxOX/Nqab/NiRUTJIE4y/yxIK
	 5vtOJX9x0cPjME7A88J1LfCDDF2VTwvvtidZAuHAvHbW6VQvvWjQbhsS5sjeI6MkSNFkm
	 k/BBi55xlZ15qzlql9Xm39ZcW2i3MHUg0csgNwoZXE0i9sn/lalnnPwEYzlpaHUxH1ULK
	 c0nWCnIbbMdoFZ9OTkKYSSTTD/y1FQ9o5rTk70lLBDVsEvyARkOG8z+SJ+D0KR0oTmzrl
	 JrNfRFQZkCzBV0zKGNP4EjjlELpt2ymYvTWDo1ZvM4xaxZTkAu4my9WVwZdtGQCp1UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="s0dS/JiL";
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B923606A69D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B923606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s0dS/JiL
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so6561668a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605990; x=1796210790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g6WheGrEKozXa+Lv+Pc9T/hQQN8VmqyBg/NVOB1TtcE=;
        b=s0dS/JiLcvpL97aX6ifBN8UMRnPbAYEY60AlqHPB3f3nGYubja252dFE6hKi9nwYdo
         DaZyGwWKZ9wv9TZX0gDQ6BYOoZibctWuin7ZpiE10NcI1AxITIxW9zCTqb0JOyH8dihW
         iChCva1BH14OmMB59y+XqSPPXbN+iRzP9Lr7h2MRJGz7QOW3tqMrhHsbrKfVm8OMdBr3
         gNfY8L07HP+wI5KSbLHthbJaDFKnJUFtSebD8Yx4zOMTmv81ooki8nwS/k5VAbsrBhMB
         xDD7PHWC7G761goRY1lOMcc+u3ggeTvCQbR0GmsGahh0MPI8AAM97eZ5O2f51AY0G8e/
         7RHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605990; x=1796210790;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6WheGrEKozXa+Lv+Pc9T/hQQN8VmqyBg/NVOB1TtcE=;
        b=qYQ0qaDnPyVupCTRAI1VWXDZBFBYPlSYcBX8FpatdOZ7bNX4wP2CsMPJUYaztIwspO
         o0KlR/NeBzz0A0W+Q2IY8uOYYMPlhZeLIJ5A7RskpzI2MLpGAUMVkJK7tGC53MW7TU/3
         DGZYMHpuLxOfEgNMu8uISLZEmzaTWd691OEbxdUwMiQIuicvJWZuurNNULwhq7sUHuvi
         KtQJlSbPlSjITYht0J2efviRzYcKSMN82bugeQZeNknJpBsuVdCpcDsElTMXHgL0nbf7
         yYmCgz6mHCl2LsEeQFIwQOibfFwQg1cIKL5tc6asIQ3EFkk8oFfHG/I6df0nWClKkhGS
         +87g==
X-Forwarded-Encrypted: i=1; AL+hErHlyTpDmrohf0xnHauMUvsesAw1zrCyAtA32IsEH67SWNvxdEwmKzFtUj5BjdQdEF4fOtIZT8G4oHQAc4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5l0e1d1UtlVmlRgrdry0qBVn9ADR+wZEp+ac1vGfUPAJ6nwJY
	6otPqj45XwPORklGa4EO6ytCth2zy/I1kDIHGvMPtVBwQnEASsYYdVqJ
X-Gm-Gg: AZFdTZcC3eybtZSxazN6aqHodh7WRQUDctZeqmTN35PrqVi8YxnuC7OanHB6yTy3o4P
	PSxspWckPOjVHwtw7XgEaRoL0a3Yh2BXwRBiVl1G8ThFJJDz2k8wxPhKA2xjwse2tfYDOvZ4o0D
	OG0ijyqdtSBF8eYOQdrsvbaZOa+O69Uk9C9GelbxOJJXmKZKw8X9ajwRRepO9YgSAZf0qOTKrdT
	Il1a3r2aXV3FQVI7ljxKhKzjyuCWr3w90Zve+KR1mGNHBYi5folod5ER82RPeA3tfTkEPxxnVwG
	ewn0bcVZP+zjif4oB9KzQNr8P5d0KARIlZ4PfVMJKfUOWg4KkmxunKHoPKn2quXLbQExucf1YjS
	Pyfq0hFKoaEqo6TG+r9vaUQjFZcaB0nvZmqv3QYAoXLLYpC/+GIcO1ccm1RX7C3K5bIP9qVdH9D
	UwjI4ze4451neT17qK68qx3EasVvDy5ilgkPK4E5dMdKNeM8D8fKWJDUCBF8755LOZeK5KfonML
	3vFQzPw34tcZTbodVtscM8mXzetUKef4rjT8aDry4WtAdouaO1eIU+lTnvPKtLGlXB1djudnzrc
	2VhBuJAHQIcFFfeh67hJ+6jD3w1Fcg4BGykvzAue81zbv+YuMCvJ6z0MrIYSnchliM6eRapS/Ou
	+ezAqmXD4zw==
X-Received: by 2002:a05:6402:4028:b0:6bb:2a86:1a58 with SMTP id 4fb4d7f45d1cf-6bb2a86201emr1407592a12.43.1795605990172;
        Wed, 25 Nov 2026 03:26:30 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:28 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 1/7] dt-bindings: display: tegra: Remove Tegra30 fallback
Date: Wed, 25 Nov 2026 13:26:07 +0200
Message-ID: <20261125112613.237333-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
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

After further investigation, I have found that Tegra30 requires a slightly
different programming model than Tegra20—principally, the maximum VI clock
differs by nearly a factor of two. Additionally, Tegra30 does not require
the APB_MISC workaround.

Therefore, remove the fallback compatible and add a dedicated compatible
for Tegra30 VI.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
index bb138277d5e8c..2d5538a1804f9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -18,16 +18,13 @@ properties:
     oneOf:
       - enum:
           - nvidia,tegra20-vi
+          - nvidia,tegra30-vi
           - nvidia,tegra114-vi
           - nvidia,tegra124-vi
           - nvidia,tegra210-vi
           - nvidia,tegra186-vi
           - nvidia,tegra194-vi
 
-      - items:
-          - const: nvidia,tegra30-vi
-          - const: nvidia,tegra20-vi
-
       - items:
           - const: nvidia,tegra132-vi
           - const: nvidia,tegra124-vi
-- 
2.53.0

