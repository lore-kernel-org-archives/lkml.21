Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669481;
	b=RoDo2MNGATWrSBD7TlJlZSSwMBiLOiMzyWowGx2fUEVwb5+ZZFmvvOEOZPVWUsNUQ08L
	 a3zJrFMhm+j++KULcLzESP0A8KRzgvkXtWcwMIBOwiNIMBRRvowqKVTbaAZYpXlJRbozA
	 can8v65s03b2MqjFDATmZUpMq3WpT+Et+rnHjL7zxuFi0H8qCaiByeoTHETA5dWAQ0/2D
	 H1KmIjBC2G8yO6biyWts3iRP2s3H/5lIYUPNMQFE6BNHaBrZ0Bj1kvnwtrn1XIb0P/Tx/
	 fpnSFhvfiE7UokvEmUIMijUHvmKfZTmaOVodwbQH1NGFoDNwH8PBmYh70NKeFj8ri7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cH1jlSFhK0mGHsLxV8dy+u0fQutnOY6cmJtrmOpCEuo=;
	b=SeJkyiBPwtZgJP22m5Ollp71GMF6P6uoWLU9TmBPI5r8MlSBjViCkbPrcIxp1VH4scej
	 EEl26d4xOMzXt5ykdSBUmtzPwzDxst6+50K5RGw4LPVLNR/gKEnv0jeN3+6gE6+RqdjQV
	 BEGhXIoNjr/KU9dFibfJzYaTZ7Nx4gKqjdb7haE6We9WYzkxZ+FQ4S/XnHPY5PdA0c/Uo
	 L7NVW5Q3s/rXkqMCZutg3b7eU0SLX9r5x4AK/b/LQLIsCv1AcbDFe064Bh8Vh2eTIRynJ
	 Uc3RlbkgkbSvCP0f61Gp/o1kRxFD4Qywtn9yVOwc8B2iEsLrJGcluYsd3Ywvrc/PHPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PnTxjq8t;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138C6606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 138C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PnTxjq8t
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso14036103eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669480; x=1796274280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cH1jlSFhK0mGHsLxV8dy+u0fQutnOY6cmJtrmOpCEuo=;
        b=PnTxjq8tI6kCOP/bPiuHjw9C4iCyD6ht5hwFtgXbCh3meDVFqTxo5OLiizJ2qpReyh
         QhIOfsEQBp/f7ZQ6yr9Owr8iYS8YaGc7TPtFrHgArzrhX+TUp3EKXrqitdrvnru+8UP4
         lhZfjlJ0FZuIi0lC6pv5HL4XaZR4NJpFpsr4zcWOMEqsX2e8bmj1X2rgrvMdrD2XcdaS
         J2lreDfdAfxiFStLZNbD052GaMmaIVnODlmbuDi0rfKMQ7UF7wZtADxXPt+YzqEv3nVx
         Lfnlmh1Ka/Z4661KecWLSYq9stGu687K4YCbxAFkzb6t7boQcSMiDHKNy7VTJ4zvrWE8
         iPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669480; x=1796274280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cH1jlSFhK0mGHsLxV8dy+u0fQutnOY6cmJtrmOpCEuo=;
        b=eg4UuNvr8ImZIl68h+KO5LkdCmhkWyRNQeilHDF/sjfKhOMj4uWr+HWgj9RFPsZv47
         OaYIlVMus2kAXfIlIjK064QgwbZu/NsyjC1ffA6pkoyZr1Yz95Rn2FDgrBQNUm5YJgVf
         YBPbJPUU1qR6J0/WtDcNKaCgASFuxXc+J2T+4itaXvgg7MyKOC9J00MTITak4K4vBdGF
         adzZQDWQhKU2BlL6oj3nVH5tao0+0NeskAy+kM/1gwGA+VNIUlhC0QkeXB/EG+/W3t2V
         MEJvoadDoYL48h/t+5fs+B2PnW036pCALX9ezPiNq7deLkggRj5WRSvYbace4hjYdg1c
         SY6Q==
X-Forwarded-Encrypted: i=1; AL+hErEc0PT3bazIQpZRk6M4elH0zDP+gqrzbM9BQluzJJ/O/xdM3vE0Bf9LZTt7rWfeP3A7VdhnDmA7Rlrnoco=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GWaYbgwfRwl1t3ZzFRSWei8wp52qTo9tOhoNYIxHGwPSIrmct
	qcyGN9Fe5jdxjDv2tz7yua2yEeftr/l9ftV1AgSn8K1pxQCaZk6BF+PN
X-Gm-Gg: AZFdTZet47xbnZpsDalTMoA0XHhFC2g0f6qHeXK8+Bf0vbiQ2+mS81+OSUNj8oXMvLg
	8fg1kW+m5uqXiZ4uAOacSCJOwC+1lPM51/mwLuwcEX7q1qg5PJ7TBuWxlCKUhK2pVZj5S3tHmQ7
	8QUGhJBaKWhJYfQAVHucGjqw54s2Kk+LKrjLNe6m1QLU9VicZOkvw9vPAYwAQfFYRAvd4MO63AC
	Zf9GPD49C5ORXDQ/lXoDXjZDj0n9blMdfckst0JPJAUaSV9n248cEp/J/41+me4nTm6mbjq+3Uk
	F39xTq2p+d8gCYWyzF79nnaMLQBDqv9dOnGUeQ5kpQdFtrdJwcboeaTVPzDxpI80Bk9MX8b8Q5z
	L5uRDJpuzO/7oUJ3wjtYY2w+QnYZIfeP9JuyqzhCIxigod/TRIGn76GR3q2ahYq3wX40bOXKpWP
	FEK86s9zo505gE964eg188YRnvRP3pUo2gw9yTcsG8oIyRqlEO1GpXG2KyCxuJFbt5wL+wYDgMd
	78rYW4ia99lP024W2cm5OiF7nqVlZhph1wU9daSa8dD4vqCIvlKd0ElI9Oika8OesF60e3VVTR+
	TYdpva2/+CTkxPnifwBjkNHaZ/xFwWeWadUOWEtlwQ==
X-Received: by 2002:a05:693c:41cf:20b0:386:dfea:4434 with SMTP id 5a478bee46e88-386dfea468bmr861041eec.2.1795669480162;
        Wed, 25 Nov 2026 21:04:40 -0800 (PST)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm72015532eec.11.2026.11.25.21.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:04:39 -0800 (PST)
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
Subject: [PATCH v2 1/2] MAINTAINERS: Add the LoongArch KVM selftests directory
Date: Thu, 26 Nov 2026 10:33:51 +0530
Message-ID: <20261126050352.1957454-2-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261126050352.1957454-1-gokul02k@gmail.com>
References: <20261126050352.1957454-1-gokul02k@gmail.com>
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

The KVM/LoongArch entry covers tools/testing/selftests/kvm/*/loongarch/
and lib/loongarch/, but not tools/testing/selftests/kvm/loongarch/,
where the tests themselves live. The */loongarch/ pattern needs a
directory between kvm/ and loongarch/, so it does not match it.

As a result get_maintainer.pl omits the LoongArch KVM maintainers and
loongarch@lists.linux.dev for patches to those tests.

Add the directory, and drop lib/loongarch/, which */loongarch/ already
covers. The entry then lists the same two forms as arm64, riscv, s390
and x86.

Signed-off-by: Gokul K <gokul02k@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..801de15e736f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14326,7 +14326,7 @@ F:	arch/loongarch/include/asm/kvm*
 F:	arch/loongarch/include/uapi/asm/kvm*
 F:	arch/loongarch/kvm/
 F:	tools/testing/selftests/kvm/*/loongarch/
-F:	tools/testing/selftests/kvm/lib/loongarch/
+F:	tools/testing/selftests/kvm/loongarch/
 
 KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)
 M:	Huacai Chen <chenhuacai@kernel.org>
-- 
2.54.0


