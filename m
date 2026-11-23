Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428460;
	b=oaw/voHvdn58BJ6QHLPDL3N5yw6xIjURy63LzK1+hCimJ+Gr8r9trmkPst4K+qQSd94K
	 uNe6F439T/KvNq7lD/sQDxdF8MLsgPQxGhjo6bp8Hr07xYzc2Jt7bPcVmiBW4jE49PWRl
	 nY8JMyyrejE1rpp/UYx62m5l3fHBzC6HmH2nEVuNsN2wF0uNib/W72o9N+rWEJDN3rVKq
	 FALbmg/z/M9ZtdjJroyefhhIU9ZHFTJJNCEsOIfmo1IvT2Oq03vjTdXPQcvUFyuD2rLO1
	 wUzbbc3CxsuTPLIkpiR8lDO5eFqWhaZ2O95jkqUjZHZe4aYcovNUOw+ONxVze7fxKxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oswIDQIw5LddBDurs3uO2kKP08jbhDgi91nn5G7lxQo=;
	b=kNd+yo8/yw3IHRgRmm45UuMq7MjPtWhQU1IiEA7+JdvzCJ4h0AbPh68J9mISj3Dnpg3y
	 vdYCwE4YLm1CzIp/hkb2L/AtBmbM3YiPwt40WO1yYG0ebUVBRMwyXsrr4XmKxXiyP2KBy
	 swgs1jq3O+OytExdMQY58kC89HBjhrd9T5Q/Fe3c+sYRsYksaqoOXaqqmqBvaF9b10VSS
	 qJwEKNp8Ga5JOzbNR1UlgOMFEaZ2yIiR8Lb8JX1OQYDBzds61AC7o288xd5RW0vB2UQh9
	 3b/uMl8IOyBg+RYGxT7oYHYF9Qr0nzJma1KQJ2QY7s5C1zz74F/bevEUvDmhSDdKAcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z3nz1+yd;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B241606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B241606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z3nz1+yd
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38644aedba1so4489779eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795428459; x=1796033259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oswIDQIw5LddBDurs3uO2kKP08jbhDgi91nn5G7lxQo=;
        b=z3nz1+ydzssLuojMa86t0bCUsF5pTBTdBhCoMsI06c4k7BgL++xywHGia6rmUBwduG
         jGsRyq+4uVjVFQxWTtHpRWAkCcLD5bMkzBb05FZUhbxXRxhVu/hg/dlaR402sqnrFxY6
         uYFdsdTfSjMCLFlM6gMtIFcdyUPMuT8ohBP94dkkF0EaeMjwLcARuKAtmbIPcb313wt3
         J0P/ORHRu6QQpmEkiUNLHol24tRbddAwa8TiwqsD+0mmmhV6qMOYb26FPjEbRCkk0yj8
         9S0FSR7PLTdkGWkNy8mPtcl8Fr8tnlRxGNQ5iGHrUV2oS79vWB3neZfMPiYMFsiLUkcV
         yvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428459; x=1796033259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oswIDQIw5LddBDurs3uO2kKP08jbhDgi91nn5G7lxQo=;
        b=b/3I8hsdrUIKBoxD5t7ETAMYqiyTiXY8FoULfT/xCWecS5bqzn7kExr/SmbTbQIrCs
         6km4tWQSFv2c7tZ8z9c+9MPE+XMPh9rp2p9DK0KFec8wt0WYK1IGGQA50kLaW+120+Bz
         c9y40phibDTOS+myuzM3w1jzmV+CRvNMnvL2vKi7SzlwCaDmx8sZ6HBwssvDoKNJdmoW
         wwp8QzYU+HKQf1FdVyYJ3vAz0uaUE7sgBYBzZ4CudTrUB0TTJ7rRfjhMARONMFgwLskD
         hx3pkA6y8fHbGia9IMy4IFiaumIY1T6FZjdzcqKp5N8XyRW87S+FuYwLvu2VB7HLugUA
         Ie4A==
X-Forwarded-Encrypted: i=1; AL+hErFFDfhieZITVVlkFs72u3ORAfF4M20ObUtJG/Z9V/RPPEfN9jUHsXO4IUBf16qoq+486yIgCqL2eeYvShk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bSKtgcA/D3jkIQmxDa+8z3ab096onwAiYbpOFFXRa6i4xU+wZ
	eXKXXzGLXbIsqmShVSpoLLCkLbTkQeBciX1uJMeHJcgNPNE7BhnfUd0f
X-Gm-Gg: AZFdTZfwSiVqHAGtyV10D2Qcw2f16a0RnisZtwhnYXXeRawOlzSAF8BT2lyNWYX0oO6
	V5WfOCK0QgzDmXYTXxTKO1qL7i3iBY/69GU62Q/D/iceAvflqSyxvYI5AeTVKA5Cf5QXHdVIQ5I
	46+uxfdd8+4CXfutyQxs0OzB2TOfXt/782MiPuFBA19he3SSRpB6eR1iguHGGviSLBme5xxUzCf
	5IoOnoNIdo/NLvfH5MVUKCnXDRNO4AE4nh6qIQCEPpuFk3Cskcpei4h0FmBLwuUNKDyzJzKPafg
	5gg70GT0EKG2x5p77jzXFKZUambLo7vOiml98mEEWJchAl/pycBslJ7mDP06RsoXzMAVeZtfCYe
	YQ5Eo1A7WuqVGlFdgulpuRhnwBqMoqQwJZLNvdKJ6a6rtn5VPQeMEbf30gya2/VnmfNRw3rThIa
	/TmHDu5pumC/iS9pxjFTjsuvyqnIFwFzOBcae/Gy3eD41GRZyOf5+8EKFJDOfWfTlarcDjLOIl9
	7fiMvRL2p74NkXKo4xiruVH8rO1F+SEy8wiUptXalXHY5HkMUd0L5Aq1eJGkPiUGyhj2s1c91sJ
	xt3/wNinGsQKmb7g1agLP/dKI1NJLAd62usR0hgQjQ==
X-Received: by 2002:a05:693c:8843:b0:386:b429:fe0 with SMTP id 5a478bee46e88-386b429175cmr1773472eec.16.1795428459292;
        Mon, 23 Nov 2026 02:07:39 -0800 (PST)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm30929402eec.8.2026.11.23.02.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:07:38 -0800 (PST)
From: Gokul K <gokul02k@gmail.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	Song Gao <gaosong@loongson.cn>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] KVM: LoongArch: selftests: Free the VM when the PMU test skips
Date: Mon, 23 Nov 2026 15:37:01 +0530
Message-ID: <20261123100701.1679376-3-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261123100701.1679376-1-gokul02k@gmail.com>
References: <20261123100701.1679376-1-gokul02k@gmail.com>
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

main() creates the VM before asking whether it has the PMU feature, and
when it does not, returns KSFT_SKIP directly. That skips the done: label
through which every other exit frees the VM. Set ret and jump there
instead.

Fixes: 11c840192768 ("KVM: LoongArch: selftests: Add basic PMU event counting test")
Signed-off-by: Gokul K <gokul02k@gmail.com>
---
 tools/testing/selftests/kvm/loongarch/pmu_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/loongarch/pmu_test.c b/tools/testing/selftests/kvm/loongarch/pmu_test.c
index ec3fefb9ea97..c9dd3cf5de06 100644
--- a/tools/testing/selftests/kvm/loongarch/pmu_test.c
+++ b/tools/testing/selftests/kvm/loongarch/pmu_test.c
@@ -176,7 +176,8 @@ int main(int argc, char *argv[])
 		pr_info("PMU is enabled in VM\n");
 	} else {
 		print_skip("PMU not enabled by VM config\n");
-		return KSFT_SKIP;
+		ret = KSFT_SKIP;
+		goto done;
 	}
 
 	while (1) {
-- 
2.54.0


