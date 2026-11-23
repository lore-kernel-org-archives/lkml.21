Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428443;
	b=365xYCC+xboyJyNy21aJQ2PmSsAFJ+CG6BQdwYPuBy4/sd1YZHYnW74xNWf87dSex5Vs
	 gfJhlfS8+Xa2zuy4h1raf8eytsDQagPpIMK+ArS7H6AYJPqpHRsUMnGoIzSWpg/cTp5re
	 pCQASmngN+d8ayaCI/Dg+pwBcytE0WOLDUVBHnGwy6UdQCmGa0zHKwN18LiXyGDLILctB
	 eiidFBLJ8afLalYWi8G2iI1BEETZK+MeXaaHMlxoO8c1GThJL4sJo4lIAVcbcLs6vH5fk
	 CFxcSDlNrF3/jXeAewyOmwSg6Sz8eS/GiVgt/oIWnez0wZ5LllzMxuT8/WSQtb7VUYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZCV7rj7O3YjHOcFzGHR54dLdeKT96fbmxzbKfW4RNF8=;
	b=AMPeBI+8uanUK+JnUrAr1PxPwDIxEsogPOeZGT/TW/VQRFOAr6GMup/tgfqLLcjozNsm
	 cUEzhTaGEeuwmBevYLkEYl7umcNan8uKt7/IMJKTudGs1RMLfAnRMy0vcwAzDAz3MIz7s
	 lk7xHWL2gxryABJRbx1FhHAT/FNc1lAdG84nC84VdlFp9bECz0MGrehdDZiAh+vWAXZvU
	 PimyKifzGja8nl5/PYgyWUqVIucUXERYhRjCqrmqxHn7sENddyVboeTn311WWbaqB908V
	 5xtcR5P6pEdKcYWNhV5gS6DWIZQ+j4utMbwEgNDWkQbVAJv3YYgJmzW/hVet+5PyrEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBw0kU1N;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26A0606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C26A0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBw0kU1N
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3282db206d3so9325992eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795428442; x=1796033242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZCV7rj7O3YjHOcFzGHR54dLdeKT96fbmxzbKfW4RNF8=;
        b=ZBw0kU1NfuA6MMWFZd7loTUe6EObCzE9PO+rq4XlEa3TcdREvmtLf4bUe9hjhD64fu
         HS/LcN7/9x+lK6mmuMUW1IahoFvznTlrAuq58edyJ8dsCdOmbv6cp9MNTb8g15Kkhu6A
         A6OmSP6fDWRrHs4SxaqVXJLA1urjyRtsifcEsziyIPwPksR/h7+RmL2++5EAtvlsfuQ1
         mQfUvFIXP0Ghc816rVF5xXut3sDOYksnaMNm7slg7orir13++tGmQFCbF9ti611bi1f2
         uqI2XX5SSlxuYIM4blteogqPM6FXwUrwxi560hj4NrbeihKKWQmLD4ZNzxMH+OVTBAPx
         skyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428442; x=1796033242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCV7rj7O3YjHOcFzGHR54dLdeKT96fbmxzbKfW4RNF8=;
        b=ovye+z3IvR7ETkSFtm/ryrn0+RxQjAxB4CeA/jyO25OoKUdkewS8nxtHYRQn7l6fON
         WRtucVQZwNnx7xoAxSdxIhH0zN7nstWZCPXk9Y3Ik21iaeDe5F3/09fGQukNkzf38VMh
         IcZ67cUFL9H5eoz3J53VS5NEtt/eYTHgUa+HUnJFU7tZfZzNmSZONJEbPe7DlYM7CsKD
         3+H4se1i9QIClN1v4MfyRwN5cDsmbWQE0qxu/xDFLTpto06X3XGoxEh7ja/DR1SjWSVE
         76gZ6QEwv49+b+zSNNGbQhIFOmOin5rmelklL+os2dyOrFV/Zrr2hqivkfiaHpNGeLHS
         nOFQ==
X-Forwarded-Encrypted: i=1; AL+hErHjxL6MTzWsWp9PnkgB1ACaDEMWSZEmcsPU5KsuyEdGmZYPEIc3xxyNk+FG6CuIkpfEG4EGdifxdEONWII=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8SGibPrulLoMppNMHntGTFnkY2B8Y7OPtgRq2YoC5Om4mP4cT
	lOskJpKtHOD5Uj8EC78R/fd3vlcz6ZIXCmvAMJoBdz5FTONIMQgV5/tT
X-Gm-Gg: AZFdTZfS36YPI27xzoIVdTLXzWFx6ZBK02Q54AhahOMRo8KgZjz3OkWPYAbOFVEIOXK
	nJ3XyqQFigjgWSZ05d7Q4rHkh8QSHhOBiiJJrZ+Ac1x3WutTWyr916klatyTZVIK/9PsaBLynCT
	P87ahdViXJg1I2+n6WrXwMLJPqjmM7euEBPr5pb/sK8mKx1vefWwLqeRiXfhG0l3BRh20asJcmp
	uafpFirOq5ZfG9AAK0T9IV+ORm5VvPE1NHt/H0SSV6rcPj5DBT8Ji8EkoC0YVQm4Rir5zh/Jnor
	zHIohKCz5ihWY3XGSd09bjbrmIbjlaM5vQ9VVhMEeG5Syno1InY04yw8opbn83Y+bjzKaqEI/9b
	YcJVPOn4yItGI2BIU+Ypt1fVE3nHMRRrascMsqaRu3A3a8yL6uAuO4ybt62mG4ihD7Lpo2qzXiS
	y6UPyohbhWe7Q3otqv0IuShYsvJ35C27AB5N3tL2tcR4IGHoJCrWkZmTaYJcpOnoW/tcoGgc5XZ
	M+JdvfX3YXfnEAoehY4MzeH4xqzj49z+RK9BA0pSfX/ac3zBId+9V6B/jsIs5PqaFviXJ1eVtOP
	AAxEXszw+eQ699FfXFsXQARU7FtIoTTFJ7hxERYDZg==
X-Received: by 2002:a05:7300:f498:b0:386:a716:916b with SMTP id 5a478bee46e88-386a7169544mr5039152eec.31.1795428441777;
        Mon, 23 Nov 2026 02:07:21 -0800 (PST)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm34145673eec.15.2026.11.23.02.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:07:21 -0800 (PST)
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
Subject: [PATCH 0/2] KVM: LoongArch: selftests: MAINTAINERS coverage and a VM leak
Date: Mon, 23 Nov 2026 15:36:59 +0530
Message-ID: <20261123100701.1679376-1-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Two small fixes to the LoongArch KVM selftests. Patch 2 frees the VM on
the PMU test's skip path. Patch 1 came out of routing it:
get_maintainer.pl did not name the LoongArch KVM maintainers for
tools/testing/selftests/kvm/loongarch/, because the MAINTAINERS entry
does not cover that directory, so this series would otherwise have
gone to Paolo, Sean and Shuah only.

Based on loongarch-kvm in linux-loongson.git.

Patch 2's hunk sits next to the one in "KVM: selftests: Convert comma
to semicolon" [1], which is not applied yet. They do not overlap and
apply in either order.

Compile-tested only. Patch 2 builds: tools/testing/selftests/kvm/loongarch/
pmu_test links for loongarch64 with a GCC 15.2.1 cross compiler, using
glibc from Debian's loong64 port as the sysroot. The binary was not run.
Patch 2 changes the PMU-not-enabled skip path, which only runs on a
LoongArch host whose VM config leaves the PMU off.

[1] https://lore.kernel.org/all/20260428053204.1018608-1-nichen@iscas.ac.cn/

Gokul K (2):
  MAINTAINERS: Add the LoongArch KVM selftests directory
  KVM: LoongArch: selftests: Free the VM when the PMU test skips

 MAINTAINERS                                      | 1 +
 tools/testing/selftests/kvm/loongarch/pmu_test.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.54.0


